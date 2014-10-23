.class public Lcom/bv/sync/Schedule;
.super Ljava/lang/Object;
.source "Schedule.java"


# static fields
.field static final DAYS_IN_WEEK:I = 0x7

.field static final MILLIS_IN_SECOND:I = 0x3e8

.field static final MINUTES_IN_HOUR:I = 0x3c

.field static final SECONDS_IN_DAY:I = 0x15180

.field static final SECONDS_IN_MINUTE:I = 0x3c


# instance fields
.field protected exactTime:I

.field protected interval:I

.field protected weekdays:[Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x7

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/bv/sync/Schedule;->weekdays:[Z

    .line 6
    return-void
.end method

.method private getExactTime(J)Ljava/util/Date;
    .locals 3
    .parameter "lastRunTime"

    .prologue
    .line 64
    iget v1, p0, Lcom/bv/sync/Schedule;->exactTime:I

    if-eqz v1, :cond_1

    .line 65
    invoke-direct {p0}, Lcom/bv/sync/Schedule;->today()Ljava/util/Date;

    move-result-object v0

    .line 66
    .local v0, today:Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-gez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/bv/sync/Schedule;->getWeekDay(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v1

    .line 68
    .end local v0           #today:Ljava/util/Date;
    :goto_0
    return-object v1

    .line 66
    .restart local v0       #today:Ljava/util/Date;
    :cond_0
    invoke-direct {p0, v0}, Lcom/bv/sync/Schedule;->getNextWeekDay(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v1

    goto :goto_0

    .line 68
    .end local v0           #today:Ljava/util/Date;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getHours(I)I
    .locals 2
    .parameter "interval"

    .prologue
    .line 18
    div-int/lit8 v1, p0, 0x3c

    div-int/lit8 v0, v1, 0x3c

    .line 19
    .local v0, result:I
    return v0
.end method

.method private getIntervalTime(J)Ljava/util/Date;
    .locals 7
    .parameter "lastRunTime"

    .prologue
    .line 78
    iget v3, p0, Lcom/bv/sync/Schedule;->interval:I

    if-eqz v3, :cond_3

    .line 79
    new-instance v0, Ljava/util/Date;

    const-wide/16 v3, 0x0

    cmp-long v3, p1, v3

    if-nez v3, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    :goto_0
    invoke-direct {v0, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 80
    .local v0, result:Ljava/util/Date;
    invoke-direct {p0, v0}, Lcom/bv/sync/Schedule;->getWeekDay(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v2

    .line 81
    .local v2, weekDay:Ljava/util/Date;
    if-eq v2, v0, :cond_0

    .line 82
    invoke-direct {p0, v2}, Lcom/bv/sync/Schedule;->getStartOfTheDay(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v1

    .line 83
    .local v1, startOfTheDay:Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    iget v5, p0, Lcom/bv/sync/Schedule;->interval:I

    mul-int/lit16 v5, v5, 0x3e8

    int-to-long v5, v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_2

    .line 84
    move-object v0, v1

    .line 90
    .end local v0           #result:Ljava/util/Date;
    .end local v1           #startOfTheDay:Ljava/util/Date;
    .end local v2           #weekDay:Ljava/util/Date;
    :cond_0
    :goto_1
    return-object v0

    .line 79
    :cond_1
    iget v3, p0, Lcom/bv/sync/Schedule;->interval:I

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v3, v3

    add-long/2addr v3, p1

    goto :goto_0

    .line 86
    .restart local v0       #result:Ljava/util/Date;
    .restart local v1       #startOfTheDay:Ljava/util/Date;
    .restart local v2       #weekDay:Ljava/util/Date;
    :cond_2
    move-object v0, v2

    goto :goto_1

    .line 90
    .end local v0           #result:Ljava/util/Date;
    .end local v1           #startOfTheDay:Ljava/util/Date;
    .end local v2           #weekDay:Ljava/util/Date;
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static getMinutes(I)I
    .locals 2
    .parameter "interval"

    .prologue
    .line 23
    div-int/lit8 v1, p0, 0x3c

    rem-int/lit8 v0, v1, 0x3c

    .line 24
    .local v0, result:I
    return v0
.end method

.method private getNextWeekDay(Ljava/util/Date;)Ljava/util/Date;
    .locals 5
    .parameter "time"

    .prologue
    .line 58
    :goto_0
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/32 v3, 0x5265c00

    add-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 59
    .end local p1
    .local v0, time:Ljava/util/Date;
    invoke-direct {p0, v0}, Lcom/bv/sync/Schedule;->isWeekDay(Ljava/util/Date;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    return-object v0

    :cond_0
    move-object p1, v0

    .end local v0           #time:Ljava/util/Date;
    .restart local p1
    goto :goto_0
.end method

.method public static getSeconds(I)I
    .locals 1
    .parameter "interval"

    .prologue
    .line 28
    rem-int/lit8 v0, p0, 0x3c

    .line 29
    .local v0, result:I
    return v0
.end method

.method protected static getStartOfTheDay()Ljava/util/Date;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 33
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 34
    .local v0, calendar:Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 35
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 36
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 37
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 38
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private getStartOfTheDay(Ljava/util/Date;)Ljava/util/Date;
    .locals 3
    .parameter "date"

    .prologue
    const/4 v2, 0x0

    .line 122
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 123
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 124
    const/16 v1, 0xb

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 125
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 126
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 127
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 128
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private getWeekDay(Ljava/util/Date;)Ljava/util/Date;
    .locals 5
    .parameter "result"

    .prologue
    .line 72
    :goto_0
    invoke-direct {p0, p1}, Lcom/bv/sync/Schedule;->isWeekDay(Ljava/util/Date;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 74
    return-object p1

    .line 73
    :cond_0
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/32 v3, 0x5265c00

    add-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .end local p1
    .local v0, result:Ljava/util/Date;
    move-object p1, v0

    .end local v0           #result:Ljava/util/Date;
    .restart local p1
    goto :goto_0
.end method

.method private isWeekDay(Ljava/util/Date;)Z
    .locals 3
    .parameter "date"

    .prologue
    .line 98
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 99
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 100
    invoke-virtual {p0}, Lcom/bv/sync/Schedule;->weekScheduleExists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Lcom/bv/sync/Schedule;->weekdays:[Z

    const/4 v2, 0x7

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    aget-boolean v1, v1, v2

    .line 102
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private today()Ljava/util/Date;
    .locals 3

    .prologue
    .line 113
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 114
    .local v0, calendar:Ljava/util/Calendar;
    const/16 v1, 0xb

    iget v2, p0, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v2}, Lcom/bv/sync/Schedule;->getHours(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 115
    const/16 v1, 0xc

    iget v2, p0, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v2}, Lcom/bv/sync/Schedule;->getMinutes(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 116
    const/16 v1, 0xd

    iget v2, p0, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v2}, Lcom/bv/sync/Schedule;->getSeconds(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 117
    const/16 v1, 0xe

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 118
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected getNextTimeToRun(J)Ljava/util/Date;
    .locals 7
    .parameter "lastRunTime"

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/Schedule;->getIntervalTime(J)Ljava/util/Date;

    move-result-object v0

    .line 43
    .local v0, intervalTime:Ljava/util/Date;
    invoke-direct {p0, p1, p2}, Lcom/bv/sync/Schedule;->getExactTime(J)Ljava/util/Date;

    move-result-object v2

    .line 44
    .local v2, timeAt:Ljava/util/Date;
    invoke-static {}, Lcom/bv/sync/Schedule;->getStartOfTheDay()Ljava/util/Date;

    move-result-object v1

    .line 45
    .local v1, startOfTheDay:Ljava/util/Date;
    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    .line 46
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gez v3, :cond_1

    .line 53
    .end local v0           #intervalTime:Ljava/util/Date;
    :cond_0
    :goto_0
    return-object v0

    .restart local v0       #intervalTime:Ljava/util/Date;
    :cond_1
    move-object v0, v2

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    if-nez v0, :cond_0

    .line 49
    if-eqz v2, :cond_3

    move-object v0, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_3
    invoke-virtual {p0}, Lcom/bv/sync/Schedule;->weekScheduleExists()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 52
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    cmp-long v3, p1, v3

    if-ltz v3, :cond_4

    invoke-direct {p0, v1}, Lcom/bv/sync/Schedule;->getNextWeekDay(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v3

    :goto_1
    move-object v0, v3

    goto :goto_0

    :cond_4
    invoke-direct {p0, v1}, Lcom/bv/sync/Schedule;->getWeekDay(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v3

    goto :goto_1

    .line 53
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isWeekDay()Z
    .locals 1

    .prologue
    .line 94
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-direct {p0, v0}, Lcom/bv/sync/Schedule;->isWeekDay(Ljava/util/Date;)Z

    move-result v0

    return v0
.end method

.method protected weekScheduleExists()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 106
    iget-object v3, p0, Lcom/bv/sync/Schedule;->weekdays:[Z

    array-length v4, v3

    move v2, v1

    :goto_0
    if-lt v2, v4, :cond_0

    .line 109
    :goto_1
    return v1

    .line 106
    :cond_0
    aget-boolean v0, v3, v2

    .line 107
    .local v0, weekday:Z
    if-eqz v0, :cond_1

    .line 108
    const/4 v1, 0x1

    goto :goto_1

    .line 106
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
