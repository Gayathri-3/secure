.class Lcom/bv/wifisync/AddJob$ScheduleRow;
.super Lcom/bv/wifisync/AddJob$JobRow;
.source "AddJob.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduleRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 237
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 238
    const v0, 0x7f0600fc

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f020028

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 239
    return-void
.end method

.method private formatRouters()Ljava/lang/String;
    .locals 6

    .prologue
    .line 292
    const-string v1, ""

    .line 293
    .local v1, result:Ljava/lang/String;
    const-string v0, ", "

    .line 294
    .local v0, delimeter:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget-object v3, v3, Lcom/bv/wifisync/SyncSchedule;->routers:Ljava/util/LinkedHashSet;

    invoke-virtual {v3}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 296
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v5, 0x7f060100

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 294
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 295
    .local v2, router:Ljava/lang/String;
    invoke-static {v1, v2, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private formatTime(II)Ljava/lang/String;
    .locals 5
    .parameter "hours"
    .parameter "minutes"

    .prologue
    const/4 v2, 0x0

    .line 300
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 301
    .local v0, calendar:Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 302
    const/16 v1, 0xc

    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->set(II)V

    .line 303
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 304
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 305
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 306
    const/4 v4, 0x1

    .line 305
    invoke-static {v1, v2, v3, v4}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private formatValue()Ljava/lang/String;
    .locals 14

    .prologue
    const/4 v12, 0x1

    const/4 v13, 0x0

    .line 252
    const-string v0, "<br/>"

    .line 253
    .local v0, delimeter:Ljava/lang/String;
    const-string v5, ""

    .line 254
    .local v5, result:Ljava/lang/String;
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v8

    if-eqz v8, :cond_0

    .line 255
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v8

    invoke-static {v8}, Lcom/bv/sync/Schedule;->getHours(I)I

    move-result v1

    .line 256
    .local v1, hours:I
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getExactTime()I

    move-result v8

    invoke-static {v8}, Lcom/bv/sync/Schedule;->getMinutes(I)I

    move-result v3

    .line 257
    .local v3, minutes:I
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v9, 0x7f0600fe

    new-array v10, v12, [Ljava/lang/Object;

    invoke-direct {p0, v1, v3}, Lcom/bv/wifisync/AddJob$ScheduleRow;->formatTime(II)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v13

    invoke-virtual {v8, v9, v10}, Lcom/bv/wifisync/AddJob;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 259
    .end local v1           #hours:I
    .end local v3           #minutes:I
    :cond_0
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v8

    if-eqz v8, :cond_1

    .line 260
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v8

    invoke-static {v8}, Lcom/bv/sync/Schedule;->getHours(I)I

    move-result v1

    .line 261
    .restart local v1       #hours:I
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getInterval()I

    move-result v8

    invoke-static {v8}, Lcom/bv/sync/Schedule;->getMinutes(I)I

    move-result v3

    .line 262
    .restart local v3       #minutes:I
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v9, 0x7f0600fd

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v13

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-virtual {v8, v9, v10}, Lcom/bv/wifisync/AddJob;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 264
    .end local v1           #hours:I
    .end local v3           #minutes:I
    :cond_1
    const-string v7, ""

    .line 265
    .local v7, weekdays:Ljava/lang/String;
    new-instance v8, Ljava/text/DateFormatSymbols;

    invoke-direct {v8}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v8}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v4

    .line 266
    .local v4, oneBaseWeekdays:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v8

    array-length v8, v8

    if-lt v2, v8, :cond_9

    .line 269
    const-string v6, ""

    .line 271
    .local v6, routers:Ljava/lang/String;
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    invoke-virtual {v8}, Lcom/bv/wifisync/Job;->isRouterDependant()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 272
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob$ScheduleRow;->formatRouters()Ljava/lang/String;

    move-result-object v6

    .line 274
    :cond_2
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_3

    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    invoke-virtual {v8}, Lcom/bv/wifisync/Job;->isChargingDependant()Z

    move-result v8

    if-eqz v8, :cond_4

    :cond_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_4

    .line 275
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v9, 0x7f060101

    invoke-virtual {v8, v9}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 277
    :cond_4
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_5

    .line 278
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v9, 0x7f060103

    new-array v10, v12, [Ljava/lang/Object;

    aput-object v7, v10, v13

    invoke-virtual {v8, v9, v10}, Lcom/bv/wifisync/AddJob;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 279
    :cond_5
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_6

    .line 280
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob$ScheduleRow;->formatRouters()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 281
    :cond_6
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    invoke-virtual {v8}, Lcom/bv/wifisync/Job;->isChargingDependant()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 282
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v9, 0x7f0601a2

    invoke-virtual {v8, v9}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 283
    :cond_7
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v8, v8, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    if-eqz v8, :cond_8

    .line 284
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v8, v8, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    invoke-static {v8}, Lcom/bv/sync/Schedule;->getMinutes(I)I

    move-result v3

    .line 285
    .restart local v3       #minutes:I
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v8, v8, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    invoke-static {v8}, Lcom/bv/sync/Schedule;->getHours(I)I

    move-result v8

    mul-int/lit8 v8, v8, 0x3c

    add-int/2addr v3, v8

    .line 286
    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v10, 0x7f060104

    invoke-virtual {v9, v10}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const v10, 0x7f060105

    new-array v11, v12, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v13

    invoke-virtual {v9, v10, v11}, Lcom/bv/wifisync/AddJob;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8, v0}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 288
    .end local v3           #minutes:I
    :cond_8
    return-object v5

    .line 267
    .end local v6           #routers:Ljava/lang/String;
    :cond_9
    iget-object v8, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v8}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v8

    iget-object v8, v8, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v8}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v8

    aget-boolean v8, v8, v2

    if-eqz v8, :cond_a

    .line 268
    add-int/lit8 v8, v2, 0x1

    aget-object v8, v4, v8

    const-string v9, ", "

    invoke-static {v7, v8, v9}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 266
    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 3

    .prologue
    const v2, 0x7f060115

    .line 243
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v1}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v1

    iget-object v1, v1, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->getEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 244
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 248
    :cond_0
    :goto_0
    return-object v0

    .line 245
    :cond_1
    invoke-direct {p0}, Lcom/bv/wifisync/AddJob$ScheduleRow;->formatValue()Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, result:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 247
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 311
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    const-class v2, Lcom/bv/wifisync/AddSchedule;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 312
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 313
    iget-object v1, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    iget-object v2, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/bv/wifisync/AddJob;->startActivityForResult(Landroid/content/Intent;I)V

    .line 314
    return-void
.end method

.method update(Ljava/lang/Object;)V
    .locals 1
    .parameter "data"

    .prologue
    .line 318
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$ScheduleRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    check-cast p1, Lcom/bv/wifisync/SyncSchedule;

    .end local p1
    iput-object p1, v0, Lcom/bv/wifisync/Job;->schedule:Lcom/bv/wifisync/SyncSchedule;

    .line 319
    return-void
.end method
