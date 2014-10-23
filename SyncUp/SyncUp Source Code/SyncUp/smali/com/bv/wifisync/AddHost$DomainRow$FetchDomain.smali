.class Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "AddHost.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddHost$DomainRow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchDomain"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/bv/sync/CifsUtils$HostInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddHost$DomainRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost$DomainRow;)V
    .locals 2
    .parameter

    .prologue
    .line 169
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    .line 170
    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {p1}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v0

    const-string v1, "FetchDomain"

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 171
    return-void
.end method


# virtual methods
.method protected varargs atBackground([Ljava/lang/Void;)Lcom/bv/sync/CifsUtils$HostInfo;
    .locals 7
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v1}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v1

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v1}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Host;->getIp()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/bv/sync/CifsUtils;->getNetbiosInfo(Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v0

    .line 176
    .local v0, hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    if-nez v0, :cond_0

    .line 177
    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v2}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v2

    const v3, 0x7f0600a6

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v6}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v6

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v6}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v6

    iget-object v6, v6, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/bv/wifisync/AddHost;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 178
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    iget-object v2, v0, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    #setter for: Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/bv/wifisync/AddHost$DomainRow;->access$0(Lcom/bv/wifisync/AddHost$DomainRow;[Ljava/lang/String;)V

    .line 179
    return-object v0
.end method

.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->atBackground([Ljava/lang/Void;)Lcom/bv/sync/CifsUtils$HostInfo;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 8
    .parameter "result"

    .prologue
    .line 184
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 185
    iget-object v4, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->error:Ljava/lang/Throwable;

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_0

    .line 186
    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v4}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v4

    const-class v5, Lcom/bv/wifisync/EnumBrowser;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 187
    .local v3, intent:Landroid/content/Intent;
    iget-object v4, p1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    array-length v4, v4

    new-array v2, v4, [I

    .line 188
    .local v2, images:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v4, v2

    if-lt v1, v4, :cond_1

    .line 190
    iget-object v4, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;
    invoke-static {v4}, Lcom/bv/wifisync/AddHost$DomainRow;->access$1(Lcom/bv/wifisync/AddHost$DomainRow;)[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-nez v4, :cond_2

    const v0, 0x7f0600df

    .line 191
    .local v0, help:I
    :goto_1
    const-string v4, "RESULT"

    .line 192
    new-instance v5, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;

    const v6, 0x7f0600f4

    iget-object v7, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;
    invoke-static {v7}, Lcom/bv/wifisync/AddHost$DomainRow;->access$1(Lcom/bv/wifisync/AddHost$DomainRow;)[Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v0, v7, v2}, Lcom/bv/wifisync/EnumBrowser$SimpleEnumeration;-><init>(II[Ljava/lang/String;[I)V

    .line 191
    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 193
    iget-object v4, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v4}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v4

    iget-object v5, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->this$0:Lcom/bv/wifisync/AddHost;
    invoke-static {v5}, Lcom/bv/wifisync/AddHost$DomainRow;->access$2(Lcom/bv/wifisync/AddHost$DomainRow;)Lcom/bv/wifisync/AddHost;

    move-result-object v5

    #getter for: Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v5}, Lcom/bv/wifisync/AddHost;->access$7(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v5

    iget-object v6, p0, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->this$1:Lcom/bv/wifisync/AddHost$DomainRow;

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v5

    invoke-virtual {v4, v3, v5}, Lcom/bv/wifisync/AddHost;->startActivityForResult(Landroid/content/Intent;I)V

    .line 195
    .end local v0           #help:I
    .end local v1           #i:I
    .end local v2           #images:[I
    .end local v3           #intent:Landroid/content/Intent;
    :cond_0
    return-void

    .line 189
    .restart local v1       #i:I
    .restart local v2       #images:[I
    .restart local v3       #intent:Landroid/content/Intent;
    :cond_1
    const v4, 0x7f02000a

    aput v4, v2, v1

    .line 188
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    :cond_2
    const v0, 0x7f0600de

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/sync/CifsUtils$HostInfo;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddHost$DomainRow$FetchDomain;->onPostExecute(Lcom/bv/sync/CifsUtils$HostInfo;)V

    return-void
.end method
