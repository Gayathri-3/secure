.class public Lcom/bv/wifisync/Dialogs;
.super Ljava/lang/Object;
.source "Dialogs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Dialogs$NumberPickerDialog;,
        Lcom/bv/wifisync/Dialogs$NumberPickerDialogBase;,
        Lcom/bv/wifisync/Dialogs$OnConfirmListener;,
        Lcom/bv/wifisync/Dialogs$OnOkClickListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static internalShowInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;Z)Landroid/app/AlertDialog;
    .locals 8
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "editText"
    .parameter "view"
    .parameter "onClick"
    .parameter "required"

    .prologue
    const/4 v7, 0x1

    .line 167
    invoke-virtual {p3, v7}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 168
    new-instance v0, Landroid/app/AlertDialog$Builder;

    new-instance v5, Landroid/view/ContextThemeWrapper;

    const v6, 0x7f080002

    invoke-direct {v5, p0, v6}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 169
    .local v0, dialog:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 170
    if-eqz p2, :cond_0

    .line 171
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 172
    :cond_0
    if-nez p4, :cond_1

    move-object p4, p3

    .end local p4
    :cond_1
    invoke-virtual {v0, p4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 173
    const v5, 0x104000a

    new-instance v6, Lcom/bv/wifisync/Dialogs$5;

    invoke-direct {v6}, Lcom/bv/wifisync/Dialogs$5;-><init>()V

    invoke-virtual {v0, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 177
    const/high16 v5, 0x104

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 178
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    .line 179
    .local v2, result:Landroid/app/AlertDialog;
    new-instance v5, Lcom/bv/wifisync/Dialogs$6;

    invoke-direct {v5, v2}, Lcom/bv/wifisync/Dialogs$6;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v5}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 187
    const v5, 0x102000b

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 188
    .local v4, textViewMessage:Landroid/widget/TextView;
    if-eqz v4, :cond_2

    .line 189
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setLinksClickable(Z)V

    .line 190
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 192
    :cond_2
    const/4 v5, -0x1

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    .line 193
    .local v1, okButton:Landroid/widget/Button;
    new-instance v5, Lcom/bv/wifisync/Dialogs$7;

    invoke-direct {v5, p5, v2, p0}, Lcom/bv/wifisync/Dialogs$7;-><init>(Lcom/bv/wifisync/Dialogs$OnOkClickListener;Landroid/app/AlertDialog;Landroid/content/Context;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 205
    if-eqz p6, :cond_3

    .line 206
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 208
    :cond_3
    new-instance v5, Lcom/bv/wifisync/Dialogs$8;

    invoke-direct {v5, p6, v1, p3}, Lcom/bv/wifisync/Dialogs$8;-><init>(ZLandroid/widget/Button;Landroid/widget/EditText;)V

    invoke-virtual {p3, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 221
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    .line 222
    .local v3, text:Landroid/text/Editable;
    if-eqz v3, :cond_4

    .line 223
    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v5

    invoke-virtual {p3, v5}, Landroid/widget/EditText;->setSelection(I)V

    .line 224
    :cond_4
    return-object v2
.end method

.method static readEula(Landroid/content/Context;)Ljava/lang/CharSequence;
    .locals 4
    .parameter "context"

    .prologue
    .line 129
    :try_start_0
    sget-object v2, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v3, "EULA"

    invoke-virtual {v1, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/bv/wifisync/Dialogs;->readFile(Ljava/io/InputStream;)Ljava/lang/CharSequence;

    move-result-object v1

    monitor-exit v2

    .line 135
    :goto_0
    return-object v1

    .line 129
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, e:Ljava/io/IOException;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 134
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 135
    const-string v1, ""

    goto :goto_0
.end method

.method private static readFile(Ljava/io/InputStream;)Ljava/lang/CharSequence;
    .locals 5
    .parameter "stream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 142
    .local v1, in:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .local v0, buffer:Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .local v2, line:Ljava/lang/String;
    if-nez v2, :cond_0

    .line 148
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 146
    return-object v0

    .line 145
    :cond_0
    :try_start_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 147
    .end local v0           #buffer:Ljava/lang/StringBuilder;
    .end local v2           #line:Ljava/lang/String;
    :catchall_0
    move-exception v3

    .line 148
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 149
    throw v3
.end method

.method private static setSelectable(Landroid/widget/TextView;)V
    .locals 2
    .parameter "textView"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 251
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 252
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 253
    :cond_0
    return-void
.end method

.method static showAbout(Landroid/content/Context;)V
    .locals 8
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 89
    new-instance v0, Landroid/app/AlertDialog$Builder;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    const v4, 0x7f080002

    invoke-direct {v3, p0, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 90
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const v3, 0x7f0601a8

    new-array v4, v7, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, content:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const v4, 0x7f060132

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const v4, 0x7f060001

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 92
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 93
    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 94
    const v3, 0x7f02002c

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 96
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 97
    .local v2, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 98
    const v3, 0x102000b

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 99
    return-void
.end method

.method static showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V
    .locals 5
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "view"
    .parameter "listener"

    .prologue
    .line 63
    new-instance v0, Landroid/app/AlertDialog$Builder;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    const v4, 0x7f080002

    invoke-direct {v3, p0, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 64
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const v3, 0x1080027

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 65
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 66
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 67
    const v3, 0x7f06011f

    new-instance v4, Lcom/bv/wifisync/Dialogs$1;

    invoke-direct {v4, p4, p0}, Lcom/bv/wifisync/Dialogs$1;-><init>(Lcom/bv/wifisync/Dialogs$OnConfirmListener;Landroid/content/Context;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 77
    const v3, 0x7f060120

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 78
    if-eqz p3, :cond_0

    .line 79
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 80
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    .line 81
    .local v1, dialog:Landroid/app/AlertDialog;
    const v3, 0x102000b

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 82
    .local v2, messageView:Landroid/widget/TextView;
    if-eqz v2, :cond_1

    .line 83
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setLinksClickable(Z)V

    .line 84
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 86
    :cond_1
    return-void
.end method

.method static showError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "error"

    .prologue
    .line 42
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 43
    return-void
.end method

.method static showError(Landroid/content/Context;Ljava/lang/Throwable;)V
    .locals 1
    .parameter "context"
    .parameter "e"

    .prologue
    .line 38
    invoke-static {p0, p1}, Lcom/bv/wifisync/Errors;->getErrorMessage(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method static showErrorDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "title"
    .parameter "message"

    .prologue
    .line 46
    new-instance v0, Landroid/app/AlertDialog$Builder;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v2, 0x7f080002

    invoke-direct {v1, p0, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 47
    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 49
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 50
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 51
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 52
    return-void
.end method

.method static showInfo(Landroid/content/Context;II)Landroid/app/AlertDialog;
    .locals 5
    .parameter "context"
    .parameter "title"
    .parameter "message"

    .prologue
    .line 229
    :try_start_0
    new-instance v1, Lcom/bv/wifisync/Dialogs$9;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    const v4, 0x7f080002

    invoke-direct {v3, p0, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v3}, Lcom/bv/wifisync/Dialogs$9;-><init>(Landroid/content/Context;)V

    .line 230
    .local v1, result:Landroid/app/AlertDialog;
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 231
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 232
    const v3, 0x7f02002c

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 233
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 234
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 235
    const v3, 0x102000b

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 236
    .local v2, textView:Landroid/widget/TextView;
    if-eqz v2, :cond_0

    .line 238
    const/16 v3, 0xf

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setAutoLinkMask(I)V

    .line 239
    invoke-static {v2}, Lcom/bv/wifisync/Dialogs;->setSelectable(Landroid/widget/TextView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    .end local v1           #result:Landroid/app/AlertDialog;
    .end local v2           #textView:Landroid/widget/TextView;
    :cond_0
    :goto_0
    return-object v1

    .line 243
    :catch_0
    move-exception v0

    .line 244
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 246
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;
    .locals 7
    .parameter "context"
    .parameter "title"
    .parameter "message"
    .parameter "editText"
    .parameter "onOkClickListener"

    .prologue
    .line 158
    const/4 v4, 0x0

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v6}, Lcom/bv/wifisync/Dialogs;->internalShowInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;Z)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method static showMessage(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "message"

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 56
    return-void
.end method

.method static showPasswordDialog(Landroid/content/Context;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;
    .locals 7
    .parameter "context"
    .parameter "edit"
    .parameter "view"
    .parameter "onClick"

    .prologue
    .line 162
    const v0, 0x7f060122

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v0, 0x7f0600e6

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    const/4 v6, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v6}, Lcom/bv/wifisync/Dialogs;->internalShowInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/widget/EditText;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnOkClickListener;Z)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method static showWelcome(Landroid/content/Context;)Landroid/app/Dialog;
    .locals 4
    .parameter "context"

    .prologue
    .line 102
    sget-object v2, Lcom/bv/wifisync/Utils;->configReadWriteLock:[Ljava/lang/Object;

    monitor-enter v2

    .line 103
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getInstalled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    monitor-exit v2

    const/4 v0, 0x0

    .line 124
    :goto_0
    return-object v0

    .line 102
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    new-instance v0, Lcom/bv/wifisync/Dialogs$2;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v2, 0x7f080002

    invoke-direct {v1, p0, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Lcom/bv/wifisync/Dialogs$2;-><init>(Landroid/content/Context;)V

    .line 107
    .local v0, result:Landroid/app/AlertDialog;
    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f060141

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lcom/bv/wifisync/Dialogs;->readEula(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 109
    const v1, 0x7f02002c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 110
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 111
    const/4 v1, -0x2

    const v2, 0x7f060134

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/bv/wifisync/Dialogs$3;

    invoke-direct {v3}, Lcom/bv/wifisync/Dialogs$3;-><init>()V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 117
    const/4 v1, -0x1

    const v2, 0x7f060133

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/bv/wifisync/Dialogs$4;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/Dialogs$4;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 123
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 102
    .end local v0           #result:Landroid/app/AlertDialog;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
