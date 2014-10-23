.class public Lcom/bv/sync/ScheduleTest;
.super Ljunit/framework/TestCase;
.source "ScheduleTest.java"


# static fields
.field private static final INTERVAL:I = 0x1517f


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljunit/framework/TestCase;-><init>()V

    return-void
.end method

.method private assertExactTime(Lcom/bv/sync/Schedule;Ljava/util/Date;)V
    .locals 3
    .parameter "schedule"
    .parameter "nextTimeToRun"

    .prologue
    .line 202
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 203
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 204
    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iget v2, p1, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v2}, Lcom/bv/sync/Schedule;->getHours(I)I

    move-result v2

    invoke-static {v1, v2}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 205
    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iget v2, p1, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v2}, Lcom/bv/sync/Schedule;->getMinutes(I)I

    move-result v2

    invoke-static {v1, v2}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 206
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    iget v2, p1, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v2}, Lcom/bv/sync/Schedule;->getSeconds(I)I

    move-result v2

    invoke-static {v1, v2}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 207
    return-void
.end method

.method private getDiffDays(II)I
    .locals 1
    .parameter "nextDay"
    .parameter "weekDay"

    .prologue
    .line 89
    sub-int v0, p1, p2

    .line 90
    .local v0, result:I
    if-gez v0, :cond_1

    .line 91
    add-int/lit8 v0, v0, 0x7

    .line 94
    :cond_0
    :goto_0
    return v0

    .line 92
    :cond_1
    if-nez v0, :cond_0

    .line 93
    const/4 v0, 0x7

    goto :goto_0
.end method

.method private getExactSeconds(Ljava/util/Calendar;)I
    .locals 2
    .parameter "calendar"

    .prologue
    .line 164
    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x3c

    mul-int/lit8 v0, v0, 0x3c

    const/16 v1, 0xc

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x3c

    add-int/2addr v0, v1

    return v0
.end method

.method private isWeekDay(Ljava/util/Date;Lcom/bv/sync/Schedule;)Z
    .locals 3
    .parameter "date"
    .parameter "schedule"

    .prologue
    .line 30
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 31
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 32
    invoke-virtual {p2}, Lcom/bv/sync/Schedule;->weekScheduleExists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    iget-object v1, p2, Lcom/bv/sync/Schedule;->weekdays:[Z

    const/4 v2, 0x7

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    aget-boolean v1, v1, v2

    .line 34
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private setStartOfTheDay(Ljava/util/Calendar;)V
    .locals 2
    .parameter "calendar"

    .prologue
    const/4 v1, 0x0

    .line 98
    const/16 v0, 0xc

    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 99
    const/16 v0, 0xd

    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 100
    const/16 v0, 0xe

    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 101
    const/16 v0, 0xb

    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 102
    return-void
.end method

.method private testAtAndInterval(Lcom/bv/sync/Schedule;)V
    .locals 5
    .parameter "schedule"

    .prologue
    const/16 v4, 0xd

    .line 111
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 112
    .local v0, calendar:Ljava/util/Calendar;
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->getExactSeconds(Ljava/util/Calendar;)I

    move-result v1

    .line 113
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/2addr v1, v2

    iget v2, p1, Lcom/bv/sync/Schedule;->interval:I

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    .line 112
    iput v1, p1, Lcom/bv/sync/Schedule;->exactTime:I

    .line 114
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Exact time: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0xb

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xc

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 115
    const-wide/16 v1, 0x0

    invoke-direct {p0, p1, v1, v2}, Lcom/bv/sync/ScheduleTest;->testInterval(Lcom/bv/sync/Schedule;J)V

    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {p0, p1, v1, v2}, Lcom/bv/sync/ScheduleTest;->testInterval(Lcom/bv/sync/Schedule;J)V

    .line 117
    iget v1, p1, Lcom/bv/sync/Schedule;->interval:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Lcom/bv/sync/Schedule;->interval:I

    .line 118
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {p0, v1, p1, v2, v3}, Lcom/bv/sync/ScheduleTest;->testExactTime(Ljava/util/Date;Lcom/bv/sync/Schedule;J)V

    .line 119
    return-void
.end method

.method private testExactTime(Ljava/util/Date;Lcom/bv/sync/Schedule;J)V
    .locals 8
    .parameter "date"
    .parameter "schedule"
    .parameter "lastRunTime"

    .prologue
    .line 47
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 48
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 49
    const/16 v4, 0xb

    iget v5, p2, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v5}, Lcom/bv/sync/Schedule;->getHours(I)I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 50
    const/16 v4, 0xc

    iget v5, p2, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v5}, Lcom/bv/sync/Schedule;->getMinutes(I)I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 51
    const/16 v4, 0xd

    iget v5, p2, Lcom/bv/sync/Schedule;->exactTime:I

    invoke-static {v5}, Lcom/bv/sync/Schedule;->getSeconds(I)I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 52
    const/16 v4, 0xe

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 53
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 54
    .local v1, expected:Ljava/util/Date;
    :goto_0
    invoke-direct {p0, v1, p2}, Lcom/bv/sync/ScheduleTest;->isWeekDay(Ljava/util/Date;Lcom/bv/sync/Schedule;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 56
    invoke-virtual {p2, p3, p4}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v3

    .line 57
    .local v3, nextTime:Ljava/util/Date;
    invoke-static {v1, v3}, Lcom/bv/sync/ScheduleTest;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    return-void

    .line 55
    .end local v3           #nextTime:Ljava/util/Date;
    :cond_0
    new-instance v2, Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/32 v6, 0x5265c00

    add-long/2addr v4, v6

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    .end local v1           #expected:Ljava/util/Date;
    .local v2, expected:Ljava/util/Date;
    move-object v1, v2

    .end local v2           #expected:Ljava/util/Date;
    .restart local v1       #expected:Ljava/util/Date;
    goto :goto_0
.end method

.method private testInterval(Lcom/bv/sync/Schedule;J)V
    .locals 12
    .parameter "schedule"
    .parameter "lastRun"

    .prologue
    const-wide/16 v10, 0x3e8

    .line 20
    invoke-virtual {p1, p2, p3}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v5

    .line 21
    .local v5, nextTime:Ljava/util/Date;
    const-wide/16 v6, 0x0

    cmp-long v6, p2, v6

    if-nez v6, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 22
    .local v3, nextRun:J
    :goto_0
    new-instance v1, Ljava/util/Date;

    div-long v6, v3, v10

    mul-long/2addr v6, v10

    invoke-direct {v1, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 23
    .local v1, expected:Ljava/util/Date;
    :goto_1
    invoke-direct {p0, v1, p1}, Lcom/bv/sync/ScheduleTest;->isWeekDay(Ljava/util/Date;Lcom/bv/sync/Schedule;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 25
    new-instance v0, Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    div-long/2addr v6, v10

    mul-long/2addr v6, v10

    invoke-direct {v0, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 26
    .local v0, actual:Ljava/util/Date;
    invoke-static {v1, v0}, Lcom/bv/sync/ScheduleTest;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    return-void

    .line 21
    .end local v0           #actual:Ljava/util/Date;
    .end local v1           #expected:Ljava/util/Date;
    .end local v3           #nextRun:J
    :cond_0
    iget v6, p1, Lcom/bv/sync/Schedule;->interval:I

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    add-long v3, p2, v6

    goto :goto_0

    .line 24
    .restart local v1       #expected:Ljava/util/Date;
    .restart local v3       #nextRun:J
    :cond_1
    new-instance v2, Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    const-wide/32 v8, 0x5265c00

    add-long/2addr v6, v8

    invoke-direct {v2, v6, v7}, Ljava/util/Date;-><init>(J)V

    .end local v1           #expected:Ljava/util/Date;
    .local v2, expected:Ljava/util/Date;
    move-object v1, v2

    .end local v2           #expected:Ljava/util/Date;
    .restart local v1       #expected:Ljava/util/Date;
    goto :goto_1
.end method

.method private testWeekDay(I)V
    .locals 12
    .parameter "nextDay"

    .prologue
    const/4 v11, 0x1

    .line 67
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Testing "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v9, Ljava/text/DateFormatSymbols;

    invoke-direct {v9}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v9}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v10, p1, 0x1

    aget-object v9, v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 69
    .local v0, calendar:Ljava/util/Calendar;
    new-instance v4, Lcom/bv/sync/Schedule;

    invoke-direct {v4}, Lcom/bv/sync/Schedule;-><init>()V

    .line 70
    .local v4, schedule:Lcom/bv/sync/Schedule;
    const/4 v7, 0x7

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    add-int/lit8 v6, v7, -0x1

    .line 71
    .local v6, weekDay:I
    iget-object v7, v4, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v11, v7, v6

    .line 72
    iget-object v7, v4, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v11, v7, p1

    .line 73
    const-wide/16 v7, 0x0

    invoke-virtual {v4, v7, v8}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v3

    .line 74
    .local v3, nextTime:Ljava/util/Date;
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->setStartOfTheDay(Ljava/util/Calendar;)V

    .line 75
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v5

    .line 76
    .local v5, startOfTheDay:Ljava/util/Date;
    invoke-static {v5, v3}, Lcom/bv/sync/ScheduleTest;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    iget-object v7, v4, Lcom/bv/sync/Schedule;->weekdays:[Z

    const/4 v8, 0x0

    aput-boolean v8, v7, v6

    .line 79
    iget-object v7, v4, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v11, v7, p1

    .line 80
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v3

    .line 81
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Next scheduled "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 82
    invoke-direct {p0, p1, v6}, Lcom/bv/sync/ScheduleTest;->getDiffDays(II)I

    move-result v1

    .line 83
    .local v1, diff:I
    const/4 v7, 0x5

    invoke-virtual {v0, v7, v1}, Ljava/util/Calendar;->add(II)V

    .line 84
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    .line 85
    .local v2, expected:Ljava/util/Date;
    invoke-static {v2, v3}, Lcom/bv/sync/ScheduleTest;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    return-void
.end method

.method private testWeekExactTime(Lcom/bv/sync/Schedule;I)V
    .locals 7
    .parameter "schedule"
    .parameter "activeDay"

    .prologue
    const/4 v6, 0x7

    .line 186
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v4, p1, Lcom/bv/sync/Schedule;->weekdays:[Z

    array-length v4, v4

    if-lt v2, v4, :cond_0

    .line 188
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 189
    .local v0, calendar:Ljava/util/Calendar;
    iget-object v4, p1, Lcom/bv/sync/Schedule;->weekdays:[Z

    const/4 v5, 0x1

    aput-boolean v5, v4, p2

    .line 190
    const-wide/16 v4, 0x0

    invoke-virtual {p1, v4, v5}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v3

    .line 191
    .local v3, nextTimeToRun:Ljava/util/Date;
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 192
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .line 193
    .local v1, day:I
    invoke-static {p2, v1}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 194
    invoke-direct {p0, p1, v3}, Lcom/bv/sync/ScheduleTest;->assertExactTime(Lcom/bv/sync/Schedule;Ljava/util/Date;)V

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v3

    .line 196
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 197
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {v1, v4}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 198
    invoke-direct {p0, p1, v3}, Lcom/bv/sync/ScheduleTest;->assertExactTime(Lcom/bv/sync/Schedule;Ljava/util/Date;)V

    .line 199
    return-void

    .line 187
    .end local v0           #calendar:Ljava/util/Calendar;
    .end local v1           #day:I
    .end local v3           #nextTimeToRun:Ljava/util/Date;
    :cond_0
    iget-object v4, p1, Lcom/bv/sync/Schedule;->weekdays:[Z

    const/4 v5, 0x0

    aput-boolean v5, v4, v2

    .line 186
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private testWeekInterval(Lcom/bv/sync/Schedule;I)V
    .locals 12
    .parameter "schedule"
    .parameter "activeDay"

    .prologue
    const/4 v10, 0x7

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 168
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v8, p1, Lcom/bv/sync/Schedule;->weekdays:[Z

    array-length v8, v8

    if-lt v2, v8, :cond_0

    .line 170
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 171
    .local v0, calendar:Ljava/util/Calendar;
    iget-object v8, p1, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v6, v8, p2

    .line 172
    const-wide/16 v8, 0x0

    invoke-virtual {p1, v8, v9}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v5

    .line 173
    .local v5, nextTimeToRun:Ljava/util/Date;
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 174
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v8

    add-int/lit8 v1, v8, -0x1

    .line 175
    .local v1, day:I
    invoke-static {p2, v1}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 177
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 178
    .local v3, lastRunTime:J
    invoke-virtual {p1, v3, v4}, Lcom/bv/sync/Schedule;->getNextTimeToRun(J)Ljava/util/Date;

    move-result-object v5

    .line 179
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 180
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v8

    add-int/lit8 v1, v8, -0x1

    .line 181
    invoke-static {p2, v1}, Lcom/bv/sync/ScheduleTest;->assertEquals(II)V

    .line 182
    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    const-wide/32 v10, 0x1517f

    sub-long/2addr v8, v10

    cmp-long v8, v8, v3

    if-ltz v8, :cond_1

    :goto_1
    invoke-static {v6}, Lcom/bv/sync/ScheduleTest;->assertTrue(Z)V

    .line 183
    return-void

    .line 169
    .end local v0           #calendar:Ljava/util/Calendar;
    .end local v1           #day:I
    .end local v3           #lastRunTime:J
    .end local v5           #nextTimeToRun:Ljava/util/Date;
    :cond_0
    iget-object v8, p1, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v7, v8, v2

    .line 168
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .restart local v0       #calendar:Ljava/util/Calendar;
    .restart local v1       #day:I
    .restart local v3       #lastRunTime:J
    .restart local v5       #nextTimeToRun:Ljava/util/Date;
    :cond_1
    move v6, v7

    .line 182
    goto :goto_1
.end method


# virtual methods
.method public testAllWeekDays()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x7

    .line 146
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 147
    .local v0, calendar:Ljava/util/Calendar;
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 148
    .local v3, weekDay:I
    new-instance v2, Lcom/bv/sync/Schedule;

    invoke-direct {v2}, Lcom/bv/sync/Schedule;-><init>()V

    .line 149
    .local v2, schedule:Lcom/bv/sync/Schedule;
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->getExactSeconds(Ljava/util/Calendar;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    iput v4, v2, Lcom/bv/sync/Schedule;->exactTime:I

    .line 150
    iget-object v4, v2, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v6, v4, v3

    .line 152
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v5, :cond_0

    .line 156
    const v4, 0x1517f

    iput v4, v2, Lcom/bv/sync/Schedule;->interval:I

    .line 157
    iget-object v4, v2, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v6, v4, v3

    .line 158
    const/4 v1, 0x0

    :goto_1
    if-lt v1, v5, :cond_2

    .line 161
    return-void

    .line 153
    :cond_0
    if-eq v1, v3, :cond_1

    .line 154
    invoke-direct {p0, v2, v1}, Lcom/bv/sync/ScheduleTest;->testWeekExactTime(Lcom/bv/sync/Schedule;I)V

    .line 152
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 159
    :cond_2
    if-eq v1, v3, :cond_3

    .line 160
    invoke-direct {p0, v2, v1}, Lcom/bv/sync/ScheduleTest;->testWeekInterval(Lcom/bv/sync/Schedule;I)V

    .line 158
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public testAtAndInterval()V
    .locals 2

    .prologue
    .line 105
    new-instance v0, Lcom/bv/sync/Schedule;

    invoke-direct {v0}, Lcom/bv/sync/Schedule;-><init>()V

    .line 106
    .local v0, schedule:Lcom/bv/sync/Schedule;
    const v1, 0x1517f

    iput v1, v0, Lcom/bv/sync/Schedule;->interval:I

    .line 107
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->testAtAndInterval(Lcom/bv/sync/Schedule;)V

    .line 108
    return-void
.end method

.method public testAtIntervalAndWeekDay()V
    .locals 15

    .prologue
    const-wide/16 v13, 0x0

    const v12, 0x1517f

    const/4 v11, 0x7

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 122
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 123
    .local v0, calendar:Ljava/util/Calendar;
    new-instance v4, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/32 v7, 0x5265818

    add-long/2addr v5, v7

    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 124
    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 126
    .local v3, weekDay:I
    new-instance v2, Lcom/bv/sync/Schedule;

    invoke-direct {v2}, Lcom/bv/sync/Schedule;-><init>()V

    .line 127
    .local v2, schedule:Lcom/bv/sync/Schedule;
    iput v12, v2, Lcom/bv/sync/Schedule;->interval:I

    .line 128
    iget-object v4, v2, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v9, v4, v3

    .line 129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {p0, v2, v4, v5}, Lcom/bv/sync/ScheduleTest;->testInterval(Lcom/bv/sync/Schedule;J)V

    .line 131
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 132
    iget-object v4, v2, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v10, v4, v3

    .line 133
    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .line 134
    .local v1, nextWeekDay:I
    iget-object v4, v2, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v9, v4, v1

    .line 135
    invoke-direct {p0, v2, v13, v14}, Lcom/bv/sync/ScheduleTest;->testInterval(Lcom/bv/sync/Schedule;J)V

    .line 137
    iget-object v4, v2, Lcom/bv/sync/Schedule;->weekdays:[Z

    aput-boolean v9, v4, v3

    .line 138
    invoke-direct {p0, v2}, Lcom/bv/sync/ScheduleTest;->testAtAndInterval(Lcom/bv/sync/Schedule;)V

    .line 139
    iput v10, v2, Lcom/bv/sync/Schedule;->interval:I

    .line 140
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->getExactSeconds(Ljava/util/Calendar;)I

    move-result v4

    add-int/2addr v4, v12

    iput v4, v2, Lcom/bv/sync/Schedule;->exactTime:I

    .line 141
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {p0, v4, v2, v5, v6}, Lcom/bv/sync/ScheduleTest;->testExactTime(Ljava/util/Date;Lcom/bv/sync/Schedule;J)V

    .line 142
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-direct {p0, v4, v2, v13, v14}, Lcom/bv/sync/ScheduleTest;->testExactTime(Ljava/util/Date;Lcom/bv/sync/Schedule;J)V

    .line 143
    return-void
.end method

.method public testExactTime()V
    .locals 6

    .prologue
    .line 38
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 39
    .local v0, calendar:Ljava/util/Calendar;
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->getExactSeconds(Ljava/util/Calendar;)I

    move-result v3

    const v4, 0x4f19c4

    add-int v1, v3, v4

    .line 40
    .local v1, exactTime:I
    new-instance v2, Lcom/bv/sync/Schedule;

    invoke-direct {v2}, Lcom/bv/sync/Schedule;-><init>()V

    .line 41
    .local v2, schedule:Lcom/bv/sync/Schedule;
    iput v1, v2, Lcom/bv/sync/Schedule;->exactTime:I

    .line 42
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {p0, v3, v2, v4, v5}, Lcom/bv/sync/ScheduleTest;->testExactTime(Ljava/util/Date;Lcom/bv/sync/Schedule;J)V

    .line 43
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    const-wide/16 v4, 0x0

    invoke-direct {p0, v3, v2, v4, v5}, Lcom/bv/sync/ScheduleTest;->testExactTime(Ljava/util/Date;Lcom/bv/sync/Schedule;J)V

    .line 44
    return-void
.end method

.method public testInterval()V
    .locals 3

    .prologue
    .line 13
    new-instance v0, Lcom/bv/sync/Schedule;

    invoke-direct {v0}, Lcom/bv/sync/Schedule;-><init>()V

    .line 14
    .local v0, schedule:Lcom/bv/sync/Schedule;
    const v1, 0x1517f

    iput v1, v0, Lcom/bv/sync/Schedule;->interval:I

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/sync/ScheduleTest;->testInterval(Lcom/bv/sync/Schedule;J)V

    .line 16
    const-wide/16 v1, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/sync/ScheduleTest;->testInterval(Lcom/bv/sync/Schedule;J)V

    .line 17
    return-void
.end method

.method public testWeekDay()V
    .locals 4

    .prologue
    .line 61
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Today: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 64
    return-void

    .line 63
    :cond_0
    invoke-direct {p0, v0}, Lcom/bv/sync/ScheduleTest;->testWeekDay(I)V

    .line 62
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
