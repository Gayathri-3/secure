.class public Lcom/bv/wifisync/AddHost;
.super Lcom/bv/wifisync/BrowseActivity;
.source "AddHost.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/AddHost$DomainRow;,
        Lcom/bv/wifisync/AddHost$HostRow;,
        Lcom/bv/wifisync/AddHost$MacRow;,
        Lcom/bv/wifisync/AddHost$PasswordRow;,
        Lcom/bv/wifisync/AddHost$UserRow;,
        Lcom/bv/wifisync/AddHost$ValidateTask;
    }
.end annotation


# instance fields
.field private adapter:Lcom/bv/wifisync/PropertiesAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bv/wifisync/PropertiesAdapter",
            "<",
            "Lcom/bv/wifisync/PropertyRow;",
            ">;"
        }
    .end annotation
.end field

.field private host:Lcom/bv/wifisync/Host;

.field private newHost:Z

.field private rows:[Lcom/bv/wifisync/PropertyRow;

.field private validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/AddHost;)Z
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/bv/wifisync/AddHost;->newHost:Z

    return v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;
    .locals 1
    .parameter

    .prologue
    .line 31
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    return-object v0
.end method

.method static synthetic access$5(Lcom/bv/wifisync/AddHost;)V
    .locals 0
    .parameter

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/bv/wifisync/AddHost;->setHelp()V

    return-void
.end method

.method static synthetic access$6(Lcom/bv/wifisync/AddHost;Lcom/bv/wifisync/AddHost$ValidateTask;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 62
    iput-object p1, p0, Lcom/bv/wifisync/AddHost;->validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;

    return-void
.end method

.method static synthetic access$7(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/PropertiesAdapter;
    .locals 1
    .parameter

    .prologue
    .line 33
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    return-object v0
.end method

.method static synthetic access$8(Lcom/bv/wifisync/AddHost;)V
    .locals 0
    .parameter

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/bv/wifisync/AddHost;->enableButtons()V

    return-void
.end method

.method private enableButtons()V
    .locals 2

    .prologue
    .line 54
    iget-object v1, p0, Lcom/bv/wifisync/AddHost;->buttonOk:Landroid/widget/Button;

    .line 55
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 54
    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 58
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 59
    invoke-direct {p0}, Lcom/bv/wifisync/AddHost;->setHelp()V

    .line 60
    return-void

    .line 57
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private find(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2
    .parameter "what"
    .parameter "where"

    .prologue
    .line 353
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p2

    if-lt v0, v1, :cond_1

    .line 357
    const/4 v0, -0x1

    .end local v0           #i:I
    :cond_0
    return v0

    .line 354
    .restart local v0       #i:I
    :cond_1
    aget-object v1, p2, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 353
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private setDefaultDomain(Lcom/bv/sync/CifsUtils$HostInfo;)V
    .locals 3
    .parameter "hostInfo"

    .prologue
    const/4 v1, 0x1

    const/4 v2, -0x1

    .line 342
    iget-object v0, p1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    array-length v0, v0

    if-ne v0, v1, :cond_1

    .line 343
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v1, p1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iput-object v1, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    .line 350
    :cond_0
    :goto_0
    return-void

    .line 344
    :cond_1
    iget-object v0, p1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    array-length v0, v0

    if-le v0, v1, :cond_0

    .line 345
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    iget-object v1, p1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/AddHost;->find(Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 347
    :cond_2
    iget-object v0, p1, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    iget-object v1, p1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/AddHost;->find(Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-eq v0, v2, :cond_0

    .line 348
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v1, p1, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    goto :goto_0
.end method

.method private setHelp()V
    .locals 2

    .prologue
    .line 95
    const/4 v0, 0x0

    .line 96
    .local v0, help:I
    iget-object v1, p0, Lcom/bv/wifisync/AddHost;->validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;

    if-eqz v1, :cond_0

    .line 97
    iget-object v1, p0, Lcom/bv/wifisync/AddHost;->validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;

    iget-object v1, v1, Lcom/bv/wifisync/AddHost$ValidateTask;->error:Ljava/lang/Throwable;

    invoke-static {v1}, Lcom/bv/wifisync/Errors;->getHelp(Ljava/lang/Throwable;)I

    move-result v0

    .line 98
    :cond_0
    if-nez v0, :cond_1

    .line 99
    iget-boolean v1, p0, Lcom/bv/wifisync/AddHost;->newHost:Z

    if-eqz v1, :cond_2

    const v0, 0x7f0600d2

    .line 100
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddHost;->setHelp(I)V

    .line 101
    return-void

    .line 99
    :cond_2
    const v0, 0x7f0600d3

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 113
    if-ne p2, v5, :cond_3

    .line 114
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->rows:[Lcom/bv/wifisync/PropertyRow;

    aget-object v3, v4, p1

    .line 115
    .local v3, row:Lcom/bv/wifisync/PropertyRow;
    instance-of v4, v3, Lcom/bv/wifisync/AddHost$HostRow;

    if-eqz v4, :cond_4

    .line 116
    const-string v4, "RESULT"

    invoke-virtual {p3, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/bv/sync/CifsUtils$HostInfo;

    .line 117
    .local v1, hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    iget-object v4, v1, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    iget-object v5, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v5, v5, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 118
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iput-object v6, v4, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    .line 119
    :cond_0
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v5, v1, Lcom/bv/sync/CifsUtils$HostInfo;->name:Ljava/lang/String;

    iput-object v5, v4, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    .line 120
    iget-object v4, v1, Lcom/bv/sync/CifsUtils$HostInfo;->domains:[Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 121
    invoke-direct {p0, v1}, Lcom/bv/wifisync/AddHost;->setDefaultDomain(Lcom/bv/sync/CifsUtils$HostInfo;)V

    .line 122
    :cond_1
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v5, v1, Lcom/bv/sync/CifsUtils$HostInfo;->ip:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/Host;->setIp(Ljava/lang/String;)V

    .line 123
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v5, v1, Lcom/bv/sync/CifsUtils$HostInfo;->mac:[B

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/Host;->setMac([B)V

    .line 134
    .end local v1           #hostInfo:Lcom/bv/sync/CifsUtils$HostInfo;
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/bv/wifisync/AddHost;->enableButtons()V

    .line 136
    .end local v3           #row:Lcom/bv/wifisync/PropertyRow;
    :cond_3
    return-void

    .line 124
    .restart local v3       #row:Lcom/bv/wifisync/PropertyRow;
    :cond_4
    instance-of v4, v3, Lcom/bv/wifisync/AddHost$DomainRow;

    if-eqz v4, :cond_2

    move-object v0, v3

    .line 125
    check-cast v0, Lcom/bv/wifisync/AddHost$DomainRow;

    .line 126
    .local v0, domainRow:Lcom/bv/wifisync/AddHost$DomainRow;
    const-string v4, "RESULT"

    invoke-virtual {p3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 127
    .local v2, index:I
    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$DomainRow;->access$1(Lcom/bv/wifisync/AddHost$DomainRow;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$DomainRow;->access$1(Lcom/bv/wifisync/AddHost$DomainRow;)[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-le v4, v2, :cond_5

    if-eq v2, v5, :cond_5

    .line 128
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    #getter for: Lcom/bv/wifisync/AddHost$DomainRow;->domains:[Ljava/lang/String;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost$DomainRow;->access$1(Lcom/bv/wifisync/AddHost$DomainRow;)[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v2

    iput-object v5, v4, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    goto :goto_0

    .line 130
    :cond_5
    iget-object v4, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iput-object v6, v4, Lcom/bv/wifisync/Host;->domain:Ljava/lang/String;

    .line 131
    const v4, 0x7f0600a7

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onButtonClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 106
    const v0, 0x7f060138

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;

    if-nez v0, :cond_0

    .line 108
    new-instance v0, Lcom/bv/wifisync/AddHost$ValidateTask;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/AddHost$ValidateTask;-><init>(Lcom/bv/wifisync/AddHost;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddHost;->validateTask:Lcom/bv/wifisync/AddHost$ValidateTask;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddHost$ValidateTask;->run([Ljava/lang/Object;)V

    .line 109
    :cond_0
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
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 38
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    invoke-virtual {p0}, Lcom/bv/wifisync/AddHost;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    iput-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    .line 40
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/bv/wifisync/AddHost;->newHost:Z

    .line 41
    iget-boolean v0, p0, Lcom/bv/wifisync/AddHost;->newHost:Z

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    const-string v3, "Guest"

    iput-object v3, v0, Lcom/bv/wifisync/Host;->user:Ljava/lang/String;

    .line 43
    :cond_0
    iget-boolean v0, p0, Lcom/bv/wifisync/AddHost;->newHost:Z

    if-eqz v0, :cond_2

    const v0, 0x7f0600f8

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddHost;->setTitle(Ljava/lang/CharSequence;)V

    .line 44
    iget-boolean v0, p0, Lcom/bv/wifisync/AddHost;->newHost:Z

    if-eqz v0, :cond_3

    .line 45
    new-array v0, v6, [Lcom/bv/wifisync/PropertyRow;

    new-instance v3, Lcom/bv/wifisync/AddHost$HostRow;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/AddHost$HostRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v3, v0, v2

    new-instance v2, Lcom/bv/wifisync/AddHost$DomainRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddHost$DomainRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v2, v0, v1

    new-instance v1, Lcom/bv/wifisync/AddHost$UserRow;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddHost$UserRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/bv/wifisync/AddHost$PasswordRow;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddHost$PasswordRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v1, v0, v5

    iput-object v0, p0, Lcom/bv/wifisync/AddHost;->rows:[Lcom/bv/wifisync/PropertyRow;

    .line 48
    :goto_2
    new-instance v0, Lcom/bv/wifisync/PropertiesAdapter;

    iget-object v1, p0, Lcom/bv/wifisync/AddHost;->rows:[Lcom/bv/wifisync/PropertyRow;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/PropertiesAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    .line 49
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddHost;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 50
    invoke-direct {p0}, Lcom/bv/wifisync/AddHost;->enableButtons()V

    .line 51
    return-void

    :cond_1
    move v0, v2

    .line 40
    goto :goto_0

    .line 43
    :cond_2
    iget-object v0, p0, Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;

    iget-object v0, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    goto :goto_1

    .line 47
    :cond_3
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/bv/wifisync/PropertyRow;

    new-instance v3, Lcom/bv/wifisync/AddHost$HostRow;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/AddHost$HostRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v3, v0, v2

    new-instance v2, Lcom/bv/wifisync/AddHost$DomainRow;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/AddHost$DomainRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v2, v0, v1

    new-instance v1, Lcom/bv/wifisync/AddHost$UserRow;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddHost$UserRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/bv/wifisync/AddHost$PasswordRow;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddHost$PasswordRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v1, v0, v5

    new-instance v1, Lcom/bv/wifisync/AddHost$MacRow;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/AddHost$MacRow;-><init>(Lcom/bv/wifisync/AddHost;)V

    aput-object v1, v0, v6

    iput-object v0, p0, Lcom/bv/wifisync/AddHost;->rows:[Lcom/bv/wifisync/PropertyRow;

    goto :goto_2
.end method

.method public bridge synthetic onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
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
