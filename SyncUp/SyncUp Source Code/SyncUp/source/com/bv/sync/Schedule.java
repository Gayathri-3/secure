package com.bv.sync;

import java.util.*;

public class Schedule
{
    static final int DAYS_IN_WEEK = 7;
    static final int MILLIS_IN_SECOND = 1000;
    static final int MINUTES_IN_HOUR = 60;
    static final int SECONDS_IN_DAY = 86400;
    static final int SECONDS_IN_MINUTE = 60;
    protected int exactTime;
    protected int interval;
    protected boolean[] weekdays;
    
    public Schedule() {
        super();
        this.weekdays = new boolean[7];
    }
    
    private Date getExactTime(final long n) {
        Date date;
        if (this.exactTime != 0) {
            final Date today = this.today();
            if (n < today.getTime()) {
                date = this.getWeekDay(today);
            }
            else {
                date = this.getNextWeekDay(today);
            }
        }
        else {
            date = null;
        }
        return date;
    }
    
    public static int getHours(final int n) {
        return n / 60 / 60;
    }
    
    private Date getIntervalTime(final long n) {
        Date date;
        if (this.interval != 0) {
            long currentTimeMillis;
            if (n == 0L) {
                currentTimeMillis = System.currentTimeMillis();
            }
            else {
                currentTimeMillis = n + 1000 * this.interval;
            }
            date = new Date(currentTimeMillis);
            final Date weekDay = this.getWeekDay(date);
            if (weekDay != date) {
                final Date startOfTheDay = this.getStartOfTheDay(weekDay);
                if (startOfTheDay.getTime() - date.getTime() > 1000 * this.interval) {
                    date = startOfTheDay;
                }
                else {
                    date = weekDay;
                }
            }
        }
        else {
            date = null;
        }
        return date;
    }
    
    public static int getMinutes(final int n) {
        return n / 60 % 60;
    }
    
    private Date getNextWeekDay(Date date) {
        Date date2;
        while (true) {
            date2 = new Date(86400000L + date.getTime());
            if (this.isWeekDay(date2)) {
                break;
            }
            date = date2;
        }
        return date2;
    }
    
    public static int getSeconds(final int n) {
        return n % 60;
    }
    
    protected static Date getStartOfTheDay() {
        final Calendar instance = Calendar.getInstance();
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTime();
    }
    
    private Date getStartOfTheDay(final Date time) {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(time);
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        return instance.getTime();
    }
    
    private Date getWeekDay(Date date) {
        while (!this.isWeekDay(date)) {
            date = new Date(86400000L + date.getTime());
        }
        return date;
    }
    
    private boolean isWeekDay(final Date time) {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(time);
        return !this.weekScheduleExists() || this.weekdays[-1 + instance.get(7)];
    }
    
    private Date today() {
        final Calendar instance = Calendar.getInstance();
        instance.set(11, getHours(this.exactTime));
        instance.set(12, getMinutes(this.exactTime));
        instance.set(13, getSeconds(this.exactTime));
        instance.set(14, 0);
        return instance.getTime();
    }
    
    protected Date getNextTimeToRun(final long n) {
        Date intervalTime = this.getIntervalTime(n);
        final Date exactTime = this.getExactTime(n);
        final Date startOfTheDay = getStartOfTheDay();
        if (intervalTime != null && exactTime != null) {
            if (intervalTime.getTime() >= exactTime.getTime()) {
                intervalTime = exactTime;
            }
        }
        else if (intervalTime == null) {
            if (exactTime != null) {
                intervalTime = exactTime;
            }
            else if (this.weekScheduleExists()) {
                Date date;
                if (n >= startOfTheDay.getTime()) {
                    date = this.getNextWeekDay(startOfTheDay);
                }
                else {
                    date = this.getWeekDay(startOfTheDay);
                }
                intervalTime = date;
            }
            else {
                intervalTime = null;
            }
        }
        return intervalTime;
    }
    
    protected boolean isWeekDay() {
        return this.isWeekDay(new Date());
    }
    
    protected boolean weekScheduleExists() {
        final boolean[] weekdays = this.weekdays;
        final int length = weekdays.length;
        int n = 0;
        boolean b;
        while (true) {
            b = false;
            if (n >= length) {
                break;
            }
            if (weekdays[n]) {
                return true;
            }
            ++n;
        }
        return b;
        b = true;
        return b;
    }
}
