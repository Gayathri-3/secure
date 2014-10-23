.class Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;
.super Lcom/bv/wifisync/AddSchedule$ScheduleRow;
.source "AddSchedule.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScheduleWeekdayRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;)V
    .locals 2
    .parameter

    .prologue
    .line 267
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 268
    const v0, 0x7f060102

    const v1, 0x7f020034

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddSchedule$ScheduleRow;-><init>(Lcom/bv/wifisync/AddSchedule;II)V

    .line 269
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)Lcom/bv/wifisync/AddSchedule;
    .locals 1
    .parameter

    .prologue
    .line 266
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    return-object v0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 273
    const-string v2, ""

    .line 274
    .local v2, result:Ljava/lang/String;
    new-instance v3, Ljava/text/DateFormatSymbols;

    invoke-direct {v3}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v1

    .line 275
    .local v1, oneBaseWeekdays:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v3}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v3

    array-length v3, v3

    if-lt v0, v3, :cond_1

    .line 278
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 279
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v4, 0x7f060115

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 280
    .end local v2           #result:Ljava/lang/String;
    :cond_0
    return-object v2

    .line 276
    .restart local v2       #result:Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v3}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v3

    aget-boolean v3, v3, v0

    if-eqz v3, :cond_2

    .line 277
    add-int/lit8 v3, v0, 0x1

    aget-object v3, v1, v3

    const-string v4, ", "

    invoke-static {v2, v3, v4}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 275
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/4 v6, 0x0

    .line 285
    new-instance v3, Ljava/text/DateFormatSymbols;

    invoke-direct {v3}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v3}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v1

    .line 286
    .local v1, oneBaseWeekdays:[Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v3}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v3

    array-length v3, v3

    new-array v2, v3, [Ljava/lang/String;

    .line 287
    .local v2, weekdays:[Ljava/lang/String;
    const/4 v3, 0x1

    array-length v4, v2

    invoke-static {v1, v3, v2, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 288
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    iget-object v4, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v4}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [Z

    #setter for: Lcom/bv/wifisync/AddSchedule;->selections:[Z
    invoke-static {v3, v4}, Lcom/bv/wifisync/AddSchedule;->access$9(Lcom/bv/wifisync/AddSchedule;[Z)V

    .line 289
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->schedule:Lcom/bv/wifisync/SyncSchedule;
    invoke-static {v3}, Lcom/bv/wifisync/AddSchedule;->access$5(Lcom/bv/wifisync/AddSchedule;)Lcom/bv/wifisync/SyncSchedule;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/SyncSchedule;->getWeekdays()[Z

    move-result-object v3

    iget-object v4, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->selections:[Z
    invoke-static {v4}, Lcom/bv/wifisync/AddSchedule;->access$10(Lcom/bv/wifisync/AddSchedule;)[Z

    move-result-object v4

    iget-object v5, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->selections:[Z
    invoke-static {v5}, Lcom/bv/wifisync/AddSchedule;->access$10(Lcom/bv/wifisync/AddSchedule;)[Z

    move-result-object v5

    array-length v5, v5

    invoke-static {v3, v6, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 290
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    new-instance v4, Landroid/app/AlertDialog$Builder;

    new-instance v5, Landroid/view/ContextThemeWrapper;

    iget-object v6, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v7, 0x7f080002

    invoke-direct {v5, v6, v7}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 291
    invoke-virtual {p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 292
    iget-object v5, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v6, 0x7f060102

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 293
    iget-object v5, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->selections:[Z
    invoke-static {v5}, Lcom/bv/wifisync/AddSchedule;->access$10(Lcom/bv/wifisync/AddSchedule;)[Z

    move-result-object v5

    new-instance v6, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$1;

    invoke-direct {v6, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$1;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)V

    invoke-virtual {v4, v2, v5, v6}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 299
    const v5, 0x104000a

    new-instance v6, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$2;

    invoke-direct {v6, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$2;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 303
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 290
    #setter for: Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;
    invoke-static {v3, v4}, Lcom/bv/wifisync/AddSchedule;->access$11(Lcom/bv/wifisync/AddSchedule;Landroid/app/AlertDialog;)V

    .line 304
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;
    invoke-static {v3}, Lcom/bv/wifisync/AddSchedule;->access$12(Lcom/bv/wifisync/AddSchedule;)Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 305
    iget-object v3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    #getter for: Lcom/bv/wifisync/AddSchedule;->weeklyDialog:Landroid/app/AlertDialog;
    invoke-static {v3}, Lcom/bv/wifisync/AddSchedule;->access$12(Lcom/bv/wifisync/AddSchedule;)Landroid/app/AlertDialog;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .line 306
    .local v0, okButton:Landroid/widget/Button;
    new-instance v3, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow$3;-><init>(Lcom/bv/wifisync/AddSchedule$ScheduleWeekdayRow;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    return-void
.end method
