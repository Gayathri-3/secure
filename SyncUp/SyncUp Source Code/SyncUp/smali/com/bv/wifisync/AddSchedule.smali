.class public Lcom/bv/wifisync/AddSchedule;
.super Lcom/bv/wifisync/BrowseActivity;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;,
        Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;,
        Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;,
        Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;,
        Lcom/bv/wifisync/AddSchedule$ScheduleRow;,
        Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;,
        Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;,
        Lcom/bv/wifisync/AddSchedule$TimeDialog;,
        Lcom/bv/wifisync/AddSchedule$TimeSetListener;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/PropertiesAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/PropertiesAdapter",
            "<",
            "Lcom/bv/wifisync/AddSchedule$ScheduleRow;",
            ">;"
        }
    .end annotation
.end field

.field private schedule:Lcom/bv/wifisync/SyncSchedule;

.field private selections:[Z

.field private wakeupBiller:Lcom/bv/wifisync/DonateBiller;

.field private wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

.field private weeklyBiller:Lcom/bv/wifisync/DonateBiller;

.field private weeklyDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 43
    new-instance v0, Lcom/bv/wifisync/AddSchedule$1;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddWeeklySchedule:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-direct {v0, p0, p0, v1}, Lcom/bv/wifisync/AddSchedule$1;-><init>(Lcom/bv/wifisync/AddSchedule;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyBiller:Lcom/bv/wifisync/DonateBiller;

    .line 49
    new-instance v0, Lcom/bv/wifisync/AddSchedule$2;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddWakeupSchedule:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-direct {v0, p0, p0, v1}, Lcom/bv/wifisync/AddSchedule$2;-><init>(Lcom/bv/wifisync/AddSchedule;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupBiller:Lcom/bv/wifisync/DonateBiller;

    .line 38
    return-void
.end method

.method static synthetic access$10(Lcom/bv/wifisync/AddSchedule;)[Z
    .locals 1
    .parameter

    .prologue
    .line 264
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->selections:[Z

    return-object v0
.end method

.method static synthetic access$11(Lcom/bv/wifisync/AddSchedule;Landroid/app/AlertDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 41
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;

    return-void
.end method

.method static synthetic access$12(Lcom/bv/wifisync/AddSchedule;)Landroid/app/AlertDialog;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$13(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/DonateBiller;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyBiller:Lcom/bv/wifisync/DonateBiller;

    return-object v0
.end method

.method static synthetic access$14(Lcom/bv/wifisync/AddSchedule;Lcom/bv/wifisync/AddSchedule$TimeDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 42
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

    return-void
.end method

.method static synthetic access$15(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/AddSchedule$TimeDialog;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

    return-object v0
.end method

.method static synthetic access$16(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/DonateBiller;
    .locals 1
    .parameter

    .prologue
    .line 49
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupBiller:Lcom/bv/wifisync/DonateBiller;

    return-object v0
.end method

.method static synthetic access$17(Lcom/bv/wifisync/AddSchedule;)V
    .locals 0
    .parameter

    .prologue
    .line 495
    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule;->addRows()V

    return-void
.end method

.method static synthetic access$2(Lcom/bv/wifisync/AddSchedule;)V
    .locals 0
    .parameter

    .prologue
    .line 330
    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule;->closeWeeklyDialog()V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddSchedule;)V
    .locals 0
    .parameter

    .prologue
    .line 338
    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule;->closeWakeupDialog()V

    return-void
.end method

.method static synthetic access$4(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/PropertiesAdapter;
    .locals 1
    .parameter

    .prologue
    .line 40
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;
    .locals 1
    .parameter

    .prologue
    .line 39
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    return-object v0
.end method

.method static synthetic access$6(I)I
    .locals 1
    .parameter

    .prologue
    .line 60
    invoke-static {p0}, Lcom/bv/wifisync/AddSchedule;->getHour(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$7(I)I
    .locals 1
    .parameter

    .prologue
    .line 56
    invoke-static {p0}, Lcom/bv/wifisync/AddSchedule;->getMinute(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$8(Lcom/bv/wifisync/AddSchedule;II)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/AddSchedule;->formatTime(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/bv/wifisync/AddSchedule;[Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 264
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule;->selections:[Z

    return-void
.end method

.method private addRows()V
    .locals 3

    .prologue
    .line 496
    const/4 v1, 0x6

    new-array v0, v1, [Lcom/bv/wifisync/AddSchedule$ScheduleRow;

    const/4 v1, 0x0

    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleAtRow;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleIntervalRow;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleRoutersRow;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleChargingRow;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWakeupRow;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    aput-object v2, v0, v1

    .line 497
    .local v0, rows:[Lcom/bv/wifisync/AddSchedule$ScheduleRow;
    new-instance v2, Lcom/bv/wifisync/PropertiesAdapter;

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->getEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    :goto_0
    invoke-direct {v2, p0, v1}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v2, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 498
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddSchedule;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 499
    return-void

    .line 497
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method private closeWakeupDialog()V
    .locals 2

    .prologue
    .line 339
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

    if-eqz v0, :cond_0

    .line 340
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

    iget v1, v1, Lcom/bv/wifisync/AddSchedule$TimeDialog;->seconds:I

    iput v1, v0, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    .line 341
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->dismiss()V

    .line 342
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupDialog:Lcom/bv/wifisync/AddSchedule$TimeDialog;

    .line 343
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 345
    :cond_0
    return-void
.end method

.method private closeWeeklyDialog()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 331
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->selections:[Z

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule;->selections:[Z

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 332
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 333
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 335
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;

    .line 336
    return-void
.end method

.method private formatTime(II)Ljava/lang/String;
    .locals 4
    .parameter "hours"
    .parameter "minutes"

    .prologue
    const/4 v2, 0x0

    .line 65
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 66
    .local v0, calendar:Ljava/util/Calendar;
    const/16 v1, 0xb

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    .line 67
    const/16 v1, 0xc

    invoke-virtual {v0, v1, p2}, Ljava/util/Calendar;->set(II)V

    .line 68
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 69
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 70
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    .line 71
    const/4 v3, 0x1

    .line 70
    invoke-static {p0, v1, v2, v3}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getHour(I)I
    .locals 1
    .parameter "interval"

    .prologue
    .line 61
    div-int/lit8 v0, p0, 0x3c

    div-int/lit8 v0, v0, 0x3c

    return v0
.end method

.method private static getMinute(I)I
    .locals 1
    .parameter "interval"

    .prologue
    .line 57
    rem-int/lit16 v0, p0, 0xe10

    div-int/lit8 v0, v0, 0x3c

    return v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 535
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 536
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1, p1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/AddSchedule$ScheduleRow;

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "RESULT"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;->update(Ljava/lang/Object;)V

    .line 537
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 542
    :cond_0
    :goto_0
    return-void

    .line 539
    :catch_0
    move-exception v0

    .line 540
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onButtonClick(Landroid/view/View;)V
    .locals 3
    .parameter "arg0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 546
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->getEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    iget v1, v1, Lcom/bv/wifisync/SyncSchedule;->wakeupInterval:I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v1}, Lcom/bv/wifisync/SyncSchedule;->isScheduled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 547
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f0600a9

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 548
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 549
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 550
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/AddSchedule;->setResult(ILandroid/content/Intent;)V

    .line 551
    invoke-virtual {p0}, Lcom/bv/wifisync/AddSchedule;->finish()V

    .line 552
    return-void
.end method

.method public bridge synthetic onClick(Landroid/view/View;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onClick(Landroid/view/View;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 488
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 489
    invoke-virtual {p0}, Lcom/bv/wifisync/AddSchedule;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/SyncSchedule;

    iput-object v0, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    .line 490
    const v0, 0x7f0600fc

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule;->setTitle(I)V

    .line 491
    const v0, 0x7f0600e7

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddSchedule;->setHelp(I)V

    .line 492
    invoke-direct {p0}, Lcom/bv/wifisync/AddSchedule;->addRows()V

    .line 493
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 504
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_0

    .line 505
    invoke-virtual {p0}, Lcom/bv/wifisync/AddSchedule;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v2

    const v3, 0x7f09000a

    invoke-virtual {v2, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 506
    const v2, 0x7f0a0031

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 507
    .local v0, item:Landroid/view/MenuItem;
    invoke-interface {v0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a0011

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    .line 508
    .local v1, switchButton:Landroid/widget/Switch;
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 509
    new-instance v2, Lcom/bv/wifisync/AddSchedule$3;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddSchedule$3;-><init>(Lcom/bv/wifisync/AddSchedule;)V

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 516
    iget-object v2, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-virtual {v2}, Lcom/bv/wifisync/SyncSchedule;->getEnabled()Z

    move-result v2

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 518
    .end local v0           #item:Landroid/view/MenuItem;
    .end local v1           #switchButton:Landroid/widget/Switch;
    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    return v2
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 556
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onDestroy()V

    .line 557
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->weeklyBiller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->close()V

    .line 558
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->wakeupBiller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->close()V

    .line 559
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 523
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 524
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0031

    if-ne v0, v1, :cond_0

    .line 525
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/SyncSchedule;->setEnabled(Z)V

    .line 526
    const/4 v0, 0x1

    .line 529
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic setProgress(ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity;->setProgress(ILjava/lang/String;)V

    return-void
.end method
