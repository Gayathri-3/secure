.class Lcom/bv/wifisync/ImageGroup$OptionsRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "ImageGroup.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/ImageGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OptionsRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/ImageGroup;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/ImageGroup;)V
    .locals 1
    .parameter

    .prologue
    .line 94
    iput-object p1, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    .line 95
    const v0, 0x7f0601b6

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 96
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/ImageGroup$OptionsRow;)Lcom/bv/wifisync/ImageGroup;
    .locals 1
    .parameter

    .prologue
    .line 93
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    return-object v0
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 4

    .prologue
    .line 100
    const-string v0, ", "

    .line 101
    .local v0, delimeter:Ljava/lang/String;
    const-string v1, ""

    .line 102
    .local v1, result:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v2}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v2, v2, Lcom/bv/sync/ImageScanner$Options;->numericMonth:Z

    if-eqz v2, :cond_0

    .line 103
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v3, 0x7f060173

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ", "

    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 104
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v2}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v2, v2, Lcom/bv/sync/ImageScanner$Options;->doubleDigitDay:Z

    if-eqz v2, :cond_1

    .line 105
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v3, 0x7f060174

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ", "

    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 106
    :cond_1
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v2}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v2, v2, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    if-eqz v2, :cond_2

    .line 107
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v3, 0x7f060175

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ", "

    invoke-static {v1, v2, v3}, Lcom/bv/wifisync/Utils;->concat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 108
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    .line 109
    iget-object v2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v3, 0x7f060115

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 110
    .end local v1           #result:Ljava/lang/String;
    :cond_3
    return-object v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11
    .parameter "v"

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 115
    new-instance v0, Landroid/app/AlertDialog$Builder;

    new-instance v4, Landroid/view/ContextThemeWrapper;

    iget-object v5, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v6, 0x7f080002

    invoke-direct {v4, v5, v6}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 116
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    new-array v2, v10, [Ljava/lang/CharSequence;

    iget-object v4, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v5, 0x7f060173

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v7

    iget-object v4, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v5, 0x7f060174

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v8

    iget-object v4, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    const v5, 0x7f060175

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/ImageGroup;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v9

    .line 117
    .local v2, items:[Ljava/lang/CharSequence;
    new-array v3, v10, [Z

    iget-object v4, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v4}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v4

    iget-object v4, v4, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v4, v4, Lcom/bv/sync/ImageScanner$Options;->numericMonth:Z

    aput-boolean v4, v3, v7

    iget-object v4, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v4}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v4

    iget-object v4, v4, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v4, v4, Lcom/bv/sync/ImageScanner$Options;->doubleDigitDay:Z

    aput-boolean v4, v3, v8

    iget-object v4, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v4}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v4

    iget-object v4, v4, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-boolean v4, v4, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    aput-boolean v4, v3, v9

    .line 118
    .local v3, selected:[Z
    const v4, 0x104000a

    new-instance v5, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;

    invoke-direct {v5, p0, v3}, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;-><init>(Lcom/bv/wifisync/ImageGroup$OptionsRow;[Z)V

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 127
    new-instance v4, Lcom/bv/wifisync/ImageGroup$OptionsRow$2;

    invoke-direct {v4, p0, v3}, Lcom/bv/wifisync/ImageGroup$OptionsRow$2;-><init>(Lcom/bv/wifisync/ImageGroup$OptionsRow;[Z)V

    invoke-virtual {v0, v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    .line 133
    const v4, 0x7f0601b6

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 134
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 135
    .local v1, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 136
    return-void
.end method
