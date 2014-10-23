.class Lcom/bv/wifisync/AddHost$MacRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "AddHost.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MacRow"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddHost$MacRow$MacFilter;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddHost;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost;)V
    .locals 1
    .parameter

    .prologue
    .line 361
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    .line 362
    const v0, 0x7f060123

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 363
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddHost$MacRow;Ljava/lang/String;)[B
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddHost$MacRow;->toBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddHost$MacRow;)Lcom/bv/wifisync/AddHost;
    .locals 1
    .parameter

    .prologue
    .line 360
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    return-object v0
.end method

.method private append(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "result"
    .parameter "substring"
    .parameter "separator"

    .prologue
    .line 394
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 396
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 397
    return-object p1
.end method

.method private showMacAddress()V
    .locals 7

    .prologue
    .line 366
    new-instance v1, Landroid/widget/EditText;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    iget-object v4, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v5, 0x7f080002

    invoke-direct {v3, v4, v5}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 367
    .local v1, editText:Landroid/widget/EditText;
    const/high16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 368
    iget-object v3, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v3}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/Host;->getMac()[B

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/bv/wifisync/AddHost$MacRow;->toHex([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 369
    const-string v3, "##:##:##:##:##:##"

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 370
    const/4 v3, 0x1

    new-array v2, v3, [Landroid/text/InputFilter;

    const/4 v3, 0x0

    new-instance v4, Lcom/bv/wifisync/AddHost$MacRow$MacFilter;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/bv/wifisync/AddHost$MacRow$MacFilter;-><init>(Lcom/bv/wifisync/AddHost$MacRow;Lcom/bv/wifisync/AddHost$MacRow$MacFilter;)V

    aput-object v4, v2, v3

    .line 371
    .local v2, filters:[Landroid/text/InputFilter;
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 372
    iget-object v3, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    iget-object v4, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v5, 0x7f060124

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v6, 0x7f060125

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 373
    new-instance v6, Lcom/bv/wifisync/AddHost$MacRow$1;

    invoke-direct {v6, p0, v1}, Lcom/bv/wifisync/AddHost$MacRow$1;-><init>(Lcom/bv/wifisync/AddHost$MacRow;Landroid/widget/EditText;)V

    .line 372
    invoke-static {v3, v4, v5, v1, v6}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v0

    .line 381
    .local v0, dialog:Landroid/app/AlertDialog;
    const v3, 0x7f02000e

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 382
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 383
    return-void
.end method

.method private toBytes(Ljava/lang/String;)[B
    .locals 4
    .parameter "text"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 401
    const-string v0, "^[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}"

    .line 402
    .local v0, pattern:Ljava/lang/String;
    const-string v1, "^[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 403
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " does not look like a valid mac address"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 404
    :cond_0
    invoke-static {p1}, Lcom/bv/wifisync/Host;->parseMacAddress(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1
.end method

.method private toHex([B)Ljava/lang/String;
    .locals 4
    .parameter "bytes"

    .prologue
    .line 386
    const-string v1, ""

    .line 387
    .local v1, result:Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 388
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p1

    if-lt v0, v2, :cond_1

    .line 390
    .end local v0           #i:I
    :cond_0
    return-object v1

    .line 389
    .restart local v0       #i:I
    :cond_1
    aget-byte v2, p1, v0

    and-int/lit16 v2, v2, 0xff

    add-int/lit16 v2, v2, 0x100

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ":"

    invoke-direct {p0, v1, v2, v3}, Lcom/bv/wifisync/AddHost$MacRow;->append(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 388
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 453
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddHost;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02000e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 3

    .prologue
    .line 445
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v1}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Host;->getMac()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddHost$MacRow;->toHex([B)Ljava/lang/String;

    move-result-object v0

    .line 446
    .local v0, value:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 448
    .end local v0           #value:Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0       #value:Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$MacRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v2, 0x7f060115

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 440
    invoke-direct {p0}, Lcom/bv/wifisync/AddHost$MacRow;->showMacAddress()V

    .line 441
    return-void
.end method
