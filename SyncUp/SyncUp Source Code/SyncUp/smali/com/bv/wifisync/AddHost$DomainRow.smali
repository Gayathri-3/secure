.class Lcom/bv/wifisync/AddHost$DomainRow;
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
    name = "DomainRow"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;
    }
.end annotation


# instance fields
.field private domains:[Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/wifisync/AddHost;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost;)V
    .locals 1
    .parameter

    .prologue
    .line 198
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    .line 199
    const v0, 0x7f0600f4

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 200
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddHost$DomainRow;[Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 166
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$1(Lcom/bv/wifisync/AddHost$DomainRow;)[Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 166
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;
    .locals 1
    .parameter

    .prologue
    .line 165
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    return-object v0
.end method


# virtual methods
.method protected getEnabled()Z
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 224
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddHost;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02000a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 218
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v1, 0x7f060115

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 219
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 205
    :try_start_0
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 206
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v1}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 207
    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v3, 0x7f06013a

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    :catch_0
    move-exception v0

    .line 211
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 213
    .end local v0           #e:Ljava/lang/Exception;
    :goto_0
    return-void

    .line 208
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;

    const v3, 0x7f060139

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 209
    new-instance v1, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;-><init>(Lcom/bv/wifisync/AddHost$DomainRow;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Void;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->run([Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
