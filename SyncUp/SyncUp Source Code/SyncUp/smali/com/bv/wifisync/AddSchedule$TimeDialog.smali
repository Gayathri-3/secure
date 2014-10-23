.class abstract Lcom/bv/wifisync/AddSchedule$TimeDialog;
.super Landroid/app/TimePickerDialog;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "TimeDialog"
.end annotation


# instance fields
.field private final listener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;

.field seconds:I

.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method protected constructor <init>(Lcom/bv/wifisync/AddSchedule;ZILcom/bv/wifisync/AddSchedule$TimeSetListener;)V
    .locals 8
    .parameter
    .parameter "is24Hour"
    .parameter "interval"
    .parameter "listener"

    .prologue
    const/4 v3, 0x0

    .line 95
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 96
    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v0, 0x7f080002

    invoke-direct {v1, p1, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    move-object v0, p0

    move-object v2, p4

    move v4, v3

    move v5, p2

    invoke-direct/range {v0 .. v5}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 97
    iput-object p4, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->listener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;

    .line 98
    if-eqz p3, :cond_0

    .line 99
    div-int/lit8 v0, p3, 0x3c

    div-int/lit8 v6, v0, 0x3c

    .line 100
    .local v6, hours:I
    rem-int/lit16 v0, p3, 0xe10

    div-int/lit8 v7, v0, 0x3c

    .line 101
    .local v7, minutes:I
    invoke-virtual {p0, v6, v7}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->updateTime(II)V

    .line 102
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v6, v7}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 106
    .end local v6           #hours:I
    .end local v7           #minutes:I
    :goto_0
    return-void

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->setDefaults()V

    goto :goto_0
.end method


# virtual methods
.method protected abstract formatMessage(II)Ljava/lang/String;
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 131
    invoke-super {p0, p1}, Landroid/app/TimePickerDialog;->onCreate(Landroid/os/Bundle;)V

    .line 132
    const v2, 0x102000b

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 133
    .local v0, messageView:Landroid/view/View;
    if-eqz v0, :cond_0

    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 134
    check-cast v1, Landroid/widget/TextView;

    .line 135
    .local v1, textViewMessage:Landroid/widget/TextView;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLinksClickable(Z)V

    .line 136
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 138
    .end local v1           #textViewMessage:Landroid/widget/TextView;
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->listener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->listener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/bv/wifisync/AddSchedule$TimeSetListener;->disabled:Z

    .line 112
    :cond_0
    invoke-super {p0}, Landroid/app/TimePickerDialog;->onStop()V

    .line 113
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->listener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;

    if-eqz v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->listener:Lcom/bv/wifisync/AddSchedule$TimeSetListener;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/bv/wifisync/AddSchedule$TimeSetListener;->disabled:Z

    .line 115
    :cond_1
    return-void
.end method

.method public onTimeChanged(Landroid/widget/TimePicker;II)V
    .locals 3
    .parameter "view"
    .parameter "hourOfDay"
    .parameter "minute"

    .prologue
    .line 119
    invoke-super {p0, p1, p2, p3}, Landroid/app/TimePickerDialog;->onTimeChanged(Landroid/widget/TimePicker;II)V

    .line 121
    if-nez p2, :cond_0

    if-nez p3, :cond_0

    .line 122
    iget-object v1, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->this$0:Lcom/bv/wifisync/AddSchedule;

    const v2, 0x7f060115

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddSchedule;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, message:Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 126
    mul-int/lit8 v1, p2, 0x3c

    mul-int/lit8 v1, v1, 0x3c

    mul-int/lit8 v2, p3, 0x3c

    add-int/2addr v1, v2

    iput v1, p0, Lcom/bv/wifisync/AddSchedule$TimeDialog;->seconds:I

    .line 127
    return-void

    .line 124
    .end local v0           #message:Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/bv/wifisync/AddSchedule$TimeDialog;->formatMessage(II)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #message:Ljava/lang/String;
    goto :goto_0
.end method

.method protected abstract setDefaults()V
.end method
