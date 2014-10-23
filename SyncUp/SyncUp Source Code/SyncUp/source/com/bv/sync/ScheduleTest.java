package com.bv.sync;

import junit.framework.*;
import java.util.*;
import java.text.*;

public class ScheduleTest extends TestCase
{
    private static final int INTERVAL = 86399;
    
    private void assertExactTime(final Schedule schedule, final Date time) {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(time);
        assertEquals(instance.get(11), Schedule.getHours(schedule.exactTime));
        assertEquals(instance.get(12), Schedule.getMinutes(schedule.exactTime));
        assertEquals(instance.get(13), Schedule.getSeconds(schedule.exactTime));
    }
    
    private int getDiffDays(final int n, final int n2) {
        int n3 = n - n2;
        if (n3 < 0) {
            n3 += 7;
        }
        else if (n3 == 0) {
            n3 = 7;
        }
        return n3;
    }
    
    private int getExactSeconds(final Calendar calendar) {
        return 60 * (60 * calendar.get(11)) + 60 * calendar.get(12);
    }
    
    private boolean isWeekDay(final Date time, final Schedule schedule) {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(time);
        return !schedule.weekScheduleExists() || schedule.weekdays[-1 + instance.get(7)];
    }
    
    private void setStartOfTheDay(final Calendar calendar) {
        calendar.set(12, 0);
        calendar.set(13, 0);
        calendar.set(14, 0);
        calendar.set(11, 0);
    }
    
    private void testAtAndInterval(final Schedule schedule) {
        final Calendar instance = Calendar.getInstance();
        schedule.exactTime = 1 + (this.getExactSeconds(instance) + instance.get(13) + schedule.interval);
        System.out.println("Exact time: " + instance.get(11) + ":" + instance.get(12) + ":" + instance.get(13));
        this.testInterval(schedule, 0L);
        this.testInterval(schedule, System.currentTimeMillis());
        schedule.interval += 1;
        this.testExactTime(new Date(), schedule, System.currentTimeMillis());
    }
    
    private void testExactTime(final Date time, final Schedule schedule, final long n) {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(time);
        instance.set(11, Schedule.getHours(schedule.exactTime));
        instance.set(12, Schedule.getMinutes(schedule.exactTime));
        instance.set(13, Schedule.getSeconds(schedule.exactTime));
        instance.set(14, 0);
        Date time2;
        for (time2 = instance.getTime(); !this.isWeekDay(time2, schedule); time2 = new Date(86400000L + time2.getTime())) {}
        assertEquals((Object)time2, (Object)schedule.getNextTimeToRun(n));
    }
    
    private void testInterval(final Schedule schedule, final long n) {
        final Date nextTimeToRun = schedule.getNextTimeToRun(n);
        long currentTimeMillis;
        if (n == 0L) {
            currentTimeMillis = System.currentTimeMillis();
        }
        else {
            currentTimeMillis = n + 1000 * schedule.interval;
        }
        Date date;
        for (date = new Date(1000L * (currentTimeMillis / 1000L)); !this.isWeekDay(date, schedule); date = new Date(86400000L + date.getTime())) {}
        assertEquals((Object)date, (Object)new Date(1000L * (nextTimeToRun.getTime() / 1000L)));
    }
    
    private void testWeekDay(final int n) {
        System.out.println("Testing " + new DateFormatSymbols().getWeekdays()[n + 1]);
        final Calendar instance = Calendar.getInstance();
        final Schedule schedule = new Schedule();
        final int n2 = -1 + instance.get(7);
        schedule.weekdays[n2] = true;
        schedule.weekdays[n] = true;
        final Date nextTimeToRun = schedule.getNextTimeToRun(0L);
        this.setStartOfTheDay(instance);
        assertEquals((Object)instance.getTime(), (Object)nextTimeToRun);
        schedule.weekdays[n2] = false;
        schedule.weekdays[n] = true;
        final Date nextTimeToRun2 = schedule.getNextTimeToRun(System.currentTimeMillis());
        System.out.println("Next scheduled " + nextTimeToRun2);
        instance.add(5, this.getDiffDays(n, n2));
        assertEquals((Object)instance.getTime(), (Object)nextTimeToRun2);
    }
    
    private void testWeekExactTime(final Schedule schedule, final int n) {
        for (int i = 0; i < schedule.weekdays.length; ++i) {
            schedule.weekdays[i] = false;
        }
        final Calendar instance = Calendar.getInstance();
        schedule.weekdays[n] = true;
        final Date nextTimeToRun = schedule.getNextTimeToRun(0L);
        instance.setTime(nextTimeToRun);
        final int n2 = -1 + instance.get(7);
        assertEquals(n, n2);
        this.assertExactTime(schedule, nextTimeToRun);
        final Date nextTimeToRun2 = schedule.getNextTimeToRun(System.currentTimeMillis());
        instance.setTime(nextTimeToRun2);
        assertEquals(n2, -1 + instance.get(7));
        this.assertExactTime(schedule, nextTimeToRun2);
    }
    
    private void testWeekInterval(final Schedule schedule, final int n) {
        boolean b = true;
        for (int i = 0; i < schedule.weekdays.length; ++i) {
            schedule.weekdays[i] = false;
        }
        final Calendar instance = Calendar.getInstance();
        schedule.weekdays[n] = b;
        instance.setTime(schedule.getNextTimeToRun(0L));
        assertEquals(n, -1 + instance.get(7));
        final long currentTimeMillis = System.currentTimeMillis();
        final Date nextTimeToRun = schedule.getNextTimeToRun(currentTimeMillis);
        instance.setTime(nextTimeToRun);
        assertEquals(n, -1 + instance.get(7));
        if (nextTimeToRun.getTime() - 86399L < currentTimeMillis) {
            b = false;
        }
        assertTrue(b);
    }
    
    public void testAllWeekDays() {
        final Calendar instance = Calendar.getInstance();
        final int n = -1 + instance.get(7);
        final Schedule schedule = new Schedule();
        schedule.exactTime = -1 + this.getExactSeconds(instance);
        schedule.weekdays[n] = false;
        for (int i = 0; i < 7; ++i) {
            if (i != n) {
                this.testWeekExactTime(schedule, i);
            }
        }
        schedule.interval = 86399;
        schedule.weekdays[n] = false;
        for (int j = 0; j < 7; ++j) {
            if (j != n) {
                this.testWeekInterval(schedule, j);
            }
        }
    }
    
    public void testAtAndInterval() {
        final Schedule schedule = new Schedule();
        schedule.interval = 86399;
        this.testAtAndInterval(schedule);
    }
    
    public void testAtIntervalAndWeekDay() {
        final Calendar instance = Calendar.getInstance();
        instance.setTime(new Date(86399000L + System.currentTimeMillis()));
        final int n = -1 + instance.get(7);
        final Schedule schedule = new Schedule();
        schedule.interval = 86399;
        schedule.weekdays[n] = true;
        this.testInterval(schedule, System.currentTimeMillis());
        instance.setTime(new Date());
        schedule.weekdays[n] = false;
        schedule.weekdays[-1 + instance.get(7)] = true;
        this.testInterval(schedule, 0L);
        schedule.weekdays[n] = true;
        this.testAtAndInterval(schedule);
        schedule.interval = 0;
        schedule.exactTime = 86399 + this.getExactSeconds(instance);
        this.testExactTime(new Date(), schedule, System.currentTimeMillis());
        this.testExactTime(new Date(), schedule, 0L);
    }
    
    public void testExactTime() {
        final int exactTime = 5183940 + this.getExactSeconds(Calendar.getInstance());
        final Schedule schedule = new Schedule();
        schedule.exactTime = exactTime;
        this.testExactTime(new Date(), schedule, System.currentTimeMillis());
        this.testExactTime(new Date(), schedule, 0L);
    }
    
    public void testInterval() {
        final Schedule schedule = new Schedule();
        schedule.interval = 86399;
        this.testInterval(schedule, System.currentTimeMillis());
        this.testInterval(schedule, 0L);
    }
    
    public void testWeekDay() {
        System.out.println("Today: " + new Date());
        for (int i = 1; i < 7; ++i) {
            this.testWeekDay(i);
        }
    }
}
