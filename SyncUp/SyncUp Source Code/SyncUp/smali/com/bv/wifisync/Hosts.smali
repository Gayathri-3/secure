.class public Lcom/bv/wifisync/Hosts;
.super Lcom/bv/wifisync/BrowseActivity;
.source "Hosts.java"

# interfaces
.implements Lcom/bv/wifisync/SyncService$Notify;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/Hosts$CheckHostTask;,
        Lcom/bv/wifisync/Hosts$CheckItem;,
        Lcom/bv/wifisync/Hosts$ExploreTask;,
        Lcom/bv/wifisync/Hosts$HostItem;,
        Lcom/bv/wifisync/Hosts$ItemsAdapter;,
        Lcom/bv/wifisync/Hosts$JobItem;,
        Lcom/bv/wifisync/Hosts$MyGestureListener;,
        Lcom/bv/wifisync/Hosts$WakeupTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/BrowseActivity;",
        "Lcom/bv/wifisync/SyncService$Notify;",
        "Landroid/widget/AdapterView$OnItemLongClickListener;"
    }
.end annotation


# static fields
.field private static final ADD_HOST:I = 0x7fffffff

.field private static final ADD_JOB:I = 0x1000

.field private static final BUTTON:Ljava/lang/String; = "Button"

.field private static final CHECK_HOSTS_DELAY:I = 0x1388

.field private static final INVALID_ID:I = -0x1

.field private static final ITEM_ID:Ljava/lang/String; = "itemId"

.field private static final MENU:Ljava/lang/String; = "Menu"

.field private static final RUN_ACTION:Ljava/lang/String; = "com.bv.wifisync.run"

.field protected static final TAG:Ljava/lang/String; = "Hosts"


# instance fields
.field private adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

.field private final checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

.field private final connection:Landroid/content/ServiceConnection;

.field private hosts:Lcom/bv/wifisync/HostList;

.field private isBound:Z

.field lastUpdate:J

.field private optionsMenu:Landroid/view/Menu;

.field private pendingRequestCode:I

.field private pendingResult:Landroid/content/Intent;

.field private selection:Z

.field private service:Lcom/bv/wifisync/SyncService;

.field private shortClick:Z

.field private shortcutSetupMode:Z

.field private syncButtonMode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 72
    new-instance v0, Lcom/bv/wifisync/Hosts$CheckHostTask;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/Hosts$CheckHostTask;-><init>(Lcom/bv/wifisync/Hosts;)V

    iput-object v0, p0, Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

    .line 847
    new-instance v0, Lcom/bv/wifisync/Hosts$1;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/Hosts$1;-><init>(Lcom/bv/wifisync/Hosts;)V

    iput-object v0, p0, Lcom/bv/wifisync/Hosts;->connection:Landroid/content/ServiceConnection;

    .line 57
    return-void
.end method

.method static synthetic access$10(Lcom/bv/wifisync/Hosts;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/bv/wifisync/Hosts;->shortClick:Z

    return-void
.end method

.method static synthetic access$11(Lcom/bv/wifisync/Hosts;)Z
    .locals 1
    .parameter

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z

    return v0
.end method

.method static synthetic access$12(Lcom/bv/wifisync/Hosts;)V
    .locals 0
    .parameter

    .prologue
    .line 1059
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->showSelection()V

    return-void
.end method

.method static synthetic access$13(Lcom/bv/wifisync/Hosts;)V
    .locals 0
    .parameter

    .prologue
    .line 1052
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->updateOptionsMenu()V

    return-void
.end method

.method static synthetic access$14(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;
    .locals 1
    .parameter

    .prologue
    .line 71
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    return-object v0
.end method

.method static synthetic access$15(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/HostList;
    .locals 1
    .parameter

    .prologue
    .line 70
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    return-object v0
.end method

.method static synthetic access$16(Lcom/bv/wifisync/Hosts;Ljava/lang/Class;I[Ljava/io/Serializable;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 763
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/wifisync/Hosts;->showProps(Ljava/lang/Class;I[Ljava/io/Serializable;)V

    return-void
.end method

.method static synthetic access$17(Lcom/bv/wifisync/Hosts;ILjava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1026
    invoke-direct {p0, p1, p2, p3}, Lcom/bv/wifisync/Hosts;->addShortcut(ILjava/lang/String;I)V

    return-void
.end method

.method static synthetic access$18(Lcom/bv/wifisync/Hosts;)Z
    .locals 1
    .parameter

    .prologue
    .line 1057
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->selection:Z

    return v0
.end method

.method static synthetic access$19(Lcom/bv/wifisync/Hosts;)Z
    .locals 1
    .parameter

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    return v0
.end method

.method static synthetic access$2(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/SyncService;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 69
    iput-object p1, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    return-void
.end method

.method static synthetic access$20(Lcom/bv/wifisync/Hosts;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    return-void
.end method

.method static synthetic access$21(Lcom/bv/wifisync/Hosts;)V
    .locals 0
    .parameter

    .prologue
    .line 371
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->setHelpText()V

    return-void
.end method

.method static synthetic access$22(Lcom/bv/wifisync/Hosts;[I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 831
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Hosts;->dispatchTimeZoneErrors([I)V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/SyncService;
    .locals 1
    .parameter

    .prologue
    .line 69
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/HostList;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 70
    iput-object p1, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/Hosts;)V
    .locals 0
    .parameter

    .prologue
    .line 353
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->readData()V

    return-void
.end method

.method static synthetic access$6(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$CheckHostTask;
    .locals 1
    .parameter

    .prologue
    .line 72
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

    return-object v0
.end method

.method static synthetic access$7(Lcom/bv/wifisync/Hosts;)Landroid/content/Intent;
    .locals 1
    .parameter

    .prologue
    .line 73
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->pendingResult:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$8(Lcom/bv/wifisync/Hosts;)I
    .locals 1
    .parameter

    .prologue
    .line 74
    iget v0, p0, Lcom/bv/wifisync/Hosts;->pendingRequestCode:I

    return v0
.end method

.method static synthetic access$9(Lcom/bv/wifisync/Hosts;Landroid/content/Intent;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 995
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Hosts;->handleShortcut(Landroid/content/Intent;)V

    return-void
.end method

.method private addShortcut(ILjava/lang/String;I)V
    .locals 6
    .parameter "id"
    .parameter "name"
    .parameter "iconId"

    .prologue
    .line 1027
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.bv.wifisync.run"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1028
    .local v2, shortcutIntent:Landroid/content/Intent;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 1029
    const-string v3, "itemId"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1030
    const/high16 v3, 0x2000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1031
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1032
    .local v1, response:Landroid/content/Intent;
    const-string v3, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1033
    const-string v3, "android.intent.extra.shortcut.NAME"

    new-instance v4, Ljava/lang/StringBuilder;

    const v5, 0x7f060001

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1034
    invoke-static {p0, p3}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v0

    .line 1035
    .local v0, iconResource:Landroid/os/Parcelable;
    const-string v3, "android.intent.extra.shortcut.ICON_RESOURCE"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1036
    const/4 v3, -0x1

    invoke-virtual {p0, v3, v1}, Lcom/bv/wifisync/Hosts;->setResult(ILandroid/content/Intent;)V

    .line 1037
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->finish()V

    .line 1038
    return-void
.end method

.method private attachService()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 841
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/SyncService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 842
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->connection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0, v1, v2}, Lcom/bv/wifisync/Hosts;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 843
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f0600a8

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 844
    :cond_0
    iput-boolean v2, p0, Lcom/bv/wifisync/Hosts;->isBound:Z

    .line 845
    return-void
.end method

.method private clearLastNotification(Landroid/content/Intent;)V
    .locals 3
    .parameter "intent"

    .prologue
    .line 480
    if-eqz p1, :cond_0

    .line 481
    const-string v1, "notification"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 482
    .local v0, jobId:I
    if-eqz v0, :cond_0

    .line 483
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/bv/wifisync/Utils;->setLastNotification(Landroid/content/Context;Lcom/bv/wifisync/Utils$LastNotification;)V

    .line 485
    .end local v0           #jobId:I
    :cond_0
    return-void
.end method

.method private dispatchTimeZoneErrors([I)V
    .locals 4
    .parameter "timeZoneErrors"

    .prologue
    .line 832
    if-eqz p1, :cond_0

    .line 833
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_1

    .line 836
    .end local v0           #i:I
    :cond_0
    return-void

    .line 834
    .restart local v0       #i:I
    :cond_1
    aget v1, p1, v0

    if-eqz v1, :cond_2

    .line 835
    const-string v1, "TimeZoneErrors"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Hours diff "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aget v3, p1, v0

    invoke-virtual {p0, v1, v2, v3}, Lcom/bv/wifisync/Hosts;->dispatchEvent(Ljava/lang/String;Ljava/lang/String;I)V

    .line 833
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private findItem(I)Lcom/bv/wifisync/Hosts$CheckItem;
    .locals 3
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1020
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v2

    if-lt v0, v2, :cond_1

    .line 1023
    const/4 v1, 0x0

    :cond_0
    return-object v1

    .line 1021
    :cond_1
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    .local v1, item:Lcom/bv/wifisync/Hosts$CheckItem;
    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$CheckItem;->getId()I

    move-result v2

    if-eq v2, p1, :cond_0

    .line 1020
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private handleShortcut(Landroid/content/Intent;)V
    .locals 4
    .parameter "intent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 996
    const-string v1, "android.intent.action.CREATE_SHORTCUT"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z

    .line 997
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-eqz v1, :cond_0

    const-string v1, "com.bv.wifisync.run"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 998
    const-string v1, "itemId"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 999
    .local v0, id:I
    if-eq v0, v3, :cond_0

    .line 1000
    invoke-direct {p0, v0}, Lcom/bv/wifisync/Hosts;->runShortcut(I)V

    .line 1002
    .end local v0           #id:I
    :cond_0
    return-void
.end method

.method private isDonated()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 736
    const v1, 0x7f060182

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v0}, Lcom/bv/wifisync/Config;->getBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 737
    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->Donate:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-static {p0, v1}, Lcom/bv/wifisync/Config;->getPurchase(Landroid/content/Context;Lcom/bv/wifisync/Biller$ChargeType;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 736
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private readData()V
    .locals 7

    .prologue
    .line 354
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->clear()V

    .line 355
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    monitor-enter v3

    .line 356
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v2}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 355
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 362
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 363
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->setHelpText()V

    .line 364
    iget-boolean v2, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v2

    if-nez v2, :cond_1

    .line 365
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    .line 366
    iget-boolean v2, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    invoke-static {p0, v2}, Lcom/bv/wifisync/Config;->setShowEditMode(Landroid/content/Context;Z)V

    .line 367
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    const v3, 0x7f0600f8

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 369
    :cond_1
    return-void

    .line 356
    :cond_2
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 357
    .local v0, host:Lcom/bv/wifisync/Host;
    iget-object v4, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    new-instance v5, Lcom/bv/wifisync/Hosts$HostItem;

    invoke-direct {v5, p0, v0}, Lcom/bv/wifisync/Hosts$HostItem;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Host;)V

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->add(Ljava/lang/Object;)V

    .line 358
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 359
    .local v1, job:Lcom/bv/wifisync/Job;
    iget-object v5, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    new-instance v6, Lcom/bv/wifisync/Hosts$JobItem;

    invoke-direct {v6, p0, v1}, Lcom/bv/wifisync/Hosts$JobItem;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Job;)V

    invoke-virtual {v5, v6}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 355
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #job:Lcom/bv/wifisync/Job;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private removeSelectedItem(Lcom/bv/wifisync/Hosts$CheckItem;)V
    .locals 5
    .parameter "selectedItem"

    .prologue
    .line 600
    .line 601
    const v0, 0x7f060117

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 602
    const v1, 0x7f060118

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 603
    invoke-virtual {p1}, Lcom/bv/wifisync/Hosts$CheckItem;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 602
    invoke-virtual {p0, v1, v2}, Lcom/bv/wifisync/Hosts;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 604
    const/4 v2, 0x0

    .line 605
    new-instance v3, Lcom/bv/wifisync/Hosts$3;

    invoke-direct {v3, p0, p1}, Lcom/bv/wifisync/Hosts$3;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Hosts$CheckItem;)V

    .line 599
    invoke-static {p0, v0, v1, v2, v3}, Lcom/bv/wifisync/Dialogs;->showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V

    .line 616
    return-void
.end method

.method private run(Lcom/bv/wifisync/Hosts$CheckItem;)V
    .locals 3
    .parameter "selectedItem"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 568
    invoke-virtual {p1}, Lcom/bv/wifisync/Hosts$CheckItem;->isRunning()Z

    move-result v0

    .line 569
    .local v0, running:Z
    if-eqz v0, :cond_0

    .line 570
    invoke-virtual {p1}, Lcom/bv/wifisync/Hosts$CheckItem;->cancel()V

    .line 571
    const/4 v1, 0x0

    const v2, 0x7f06010e

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/bv/wifisync/Hosts;->setProgress(ILjava/lang/String;)V

    .line 575
    :goto_0
    const-string v2, "Menu"

    if-eqz v0, :cond_1

    const-string v1, "Cancel"

    :goto_1
    invoke-virtual {p0, v2, v1}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    return-void

    .line 573
    :cond_0
    invoke-virtual {p1}, Lcom/bv/wifisync/Hosts$CheckItem;->run()V

    goto :goto_0

    .line 575
    :cond_1
    const-string v1, "Run"

    goto :goto_1
.end method

.method private runSelected()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1078
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 1081
    return-void

    .line 1079
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    iget-boolean v1, v1, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    if-eqz v1, :cond_1

    .line 1080
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$CheckItem;->run()V

    .line 1078
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private runShortcut(I)V
    .locals 4
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1005
    if-nez p1, :cond_1

    .line 1006
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->syncAll()V

    .line 1016
    :cond_0
    :goto_0
    return-void

    .line 1008
    :cond_1
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Hosts;->findItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v0

    .line 1009
    .local v0, item:Lcom/bv/wifisync/Hosts$CheckItem;
    if-nez v0, :cond_2

    .line 1010
    new-instance v1, Ljava/io/IOException;

    const v2, 0x7f0600a4

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1011
    :cond_2
    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$CheckItem;->canRun()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1012
    const-string v1, "Hosts"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Running shortcut item "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$CheckItem;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$CheckItem;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1013
    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$CheckItem;->run()V

    goto :goto_0
.end method

.method private setFailedHelp()V
    .locals 3

    .prologue
    .line 389
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v2}, Lcom/bv/wifisync/HostList;->getMostRecentError()Ljava/lang/Throwable;

    move-result-object v1

    .line 390
    .local v1, lastError:Ljava/lang/Throwable;
    const/4 v0, 0x0

    .line 391
    .local v0, help:I
    if-eqz v1, :cond_0

    instance-of v2, v1, Ljava/lang/Exception;

    if-eqz v2, :cond_0

    .line 392
    check-cast v1, Ljava/lang/Exception;

    .end local v1           #lastError:Ljava/lang/Throwable;
    invoke-static {v1}, Lcom/bv/wifisync/Errors;->getHelp(Ljava/lang/Throwable;)I

    move-result v0

    .line 393
    :cond_0
    if-nez v0, :cond_1

    const v0, 0x7f0600cf

    .end local v0           #help:I
    :cond_1
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    .line 394
    return-void
.end method

.method private setHelpText()V
    .locals 1

    .prologue
    .line 372
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 373
    const v0, 0x7f0600cb

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    .line 386
    :goto_0
    return-void

    .line 374
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostList;->getJobCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 375
    const v0, 0x7f0600cc

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    goto :goto_0

    .line 376
    :cond_1
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z

    if-eqz v0, :cond_2

    .line 377
    const v0, 0x7f0600eb

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    goto :goto_0

    .line 378
    :cond_2
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostList;->noRunJob()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 379
    const v0, 0x7f0600cd

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    goto :goto_0

    .line 380
    :cond_3
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostList;->hasFailedJobs()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 381
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->setFailedHelp()V

    goto :goto_0

    .line 382
    :cond_4
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v0}, Lcom/bv/wifisync/HostList;->noScheduledJobs()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 383
    const v0, 0x7f0600ce

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    goto :goto_0

    .line 385
    :cond_5
    const v0, 0x7f0600d1

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->setHelp(I)V

    goto :goto_0
.end method

.method private setShortcutSetupMode(Z)V
    .locals 3
    .parameter "mode"

    .prologue
    const/4 v2, 0x0

    .line 471
    iput-boolean p1, p0, Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z

    .line 472
    if-eqz p1, :cond_0

    .line 473
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    .line 474
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    const v1, 0x7f0601b0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 475
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 477
    :cond_0
    return-void
.end method

.method private varargs showProps(Ljava/lang/Class;I[Ljava/io/Serializable;)V
    .locals 4
    .parameter
    .parameter "requestCode"
    .parameter "params"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;I[",
            "Ljava/io/Serializable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 765
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<+Landroid/app/Activity;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 766
    .local v1, intent:Landroid/content/Intent;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p3

    if-lt v0, v2, :cond_0

    .line 768
    invoke-virtual {p0, v1, p2}, Lcom/bv/wifisync/Hosts;->startActivityForResult(Landroid/content/Intent;I)V

    .line 769
    return-void

    .line 767
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v2, "RESULT"

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez v0, :cond_1

    const-string v2, ""

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p3, v0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 766
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 767
    :cond_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_1
.end method

.method private showSelection()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1060
    iget-boolean v1, p0, Lcom/bv/wifisync/Hosts;->selection:Z

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/bv/wifisync/Hosts;->selection:Z

    .line 1061
    iget-boolean v1, p0, Lcom/bv/wifisync/Hosts;->selection:Z

    if-nez v1, :cond_0

    .line 1062
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 1064
    .end local v0           #i:I
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 1065
    return-void

    .line 1060
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 1063
    .restart local v0       #i:I
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    iput-boolean v2, v1, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    .line 1062
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private syncAll()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 657
    const/4 v2, 0x0

    .line 658
    .local v2, jobCount:I
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 659
    iget-object v4, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    monitor-enter v4

    .line 660
    :try_start_0
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v3}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 659
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 666
    if-lez v2, :cond_1

    .line 667
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/bv/wifisync/SyncService;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/Hosts;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 668
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " Jobs were scheduled"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 669
    const v3, 0x7f06012f

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 671
    :cond_1
    return-void

    .line 660
    :cond_2
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 661
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 662
    .local v1, job:Lcom/bv/wifisync/Job;
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v6, v1}, Lcom/bv/wifisync/SyncService;->runNow(Lcom/bv/wifisync/Job;)V

    .line 663
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 659
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #job:Lcom/bv/wifisync/Job;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method private unbind()V
    .locals 2

    .prologue
    .line 884
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->isBound:Z

    if-eqz v0, :cond_1

    .line 885
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-eqz v0, :cond_0

    .line 886
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/SyncService;->setUI(Lcom/bv/wifisync/SyncService$Notify;)V

    .line 887
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->connection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->unbindService(Landroid/content/ServiceConnection;)V

    .line 888
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bv/wifisync/Hosts;->isBound:Z

    .line 890
    :cond_1
    return-void
.end method

.method private updateDisplay(Ljava/io/Serializable;I)V
    .locals 8
    .parameter "result"
    .parameter "requestCode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 692
    const v6, 0x7fffffff

    if-ne p2, v6, :cond_2

    move-object v0, p1

    .line 693
    check-cast v0, Lcom/bv/wifisync/Host;

    .line 694
    .local v0, host:Lcom/bv/wifisync/Host;
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    invoke-virtual {v6, v0}, Lcom/bv/wifisync/HostList;->add(Lcom/bv/wifisync/Host;)Z

    .line 695
    new-instance v1, Lcom/bv/wifisync/Hosts$HostItem;

    invoke-direct {v1, p0, v0}, Lcom/bv/wifisync/Hosts$HostItem;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Host;)V

    .line 696
    .local v1, hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Lcom/bv/wifisync/Host;->setConnected(Z)V

    .line 697
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v6, v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->add(Ljava/lang/Object;)V

    .line 698
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getListView()Landroid/widget/ListView;

    move-result-object v6

    iget-object v7, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v7}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 699
    const-string v6, "Button"

    const-string v7, "Host added"

    invoke-virtual {p0, v6, v7}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    .end local p1
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-eqz v6, :cond_1

    .line 721
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    invoke-virtual {v6}, Lcom/bv/wifisync/SyncService;->update()V

    .line 722
    :cond_1
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->setHelpText()V

    .line 723
    return-void

    .line 700
    .restart local p1
    :cond_2
    const/16 v6, 0x1000

    if-lt p2, v6, :cond_3

    move-object v4, p1

    .line 701
    check-cast v4, Lcom/bv/wifisync/Job;

    .line 702
    .local v4, job:Lcom/bv/wifisync/Job;
    add-int/lit16 v5, p2, -0x1000

    .line 703
    .local v5, position:I
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v6, v5}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Hosts$HostItem;

    .line 704
    .restart local v1       #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v1}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lcom/bv/wifisync/HostList;->addJob(Lcom/bv/wifisync/Job;Lcom/bv/wifisync/Host;)V

    .line 705
    iget-object v6, v4, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v6}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int v3, v5, v6

    .line 706
    .local v3, itemPosition:I
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    new-instance v7, Lcom/bv/wifisync/Hosts$JobItem;

    invoke-direct {v7, p0, v4}, Lcom/bv/wifisync/Hosts$JobItem;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Job;)V

    invoke-virtual {v6, v7, v3}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->insert(Ljava/lang/Object;I)V

    .line 707
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getListView()Landroid/widget/ListView;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 708
    const-string v6, "Menu"

    const-string v7, "Job added"

    invoke-virtual {p0, v6, v7}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 710
    .end local v1           #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    .end local v3           #itemPosition:I
    .end local v4           #job:Lcom/bv/wifisync/Job;
    .end local v5           #position:I
    :cond_3
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v6, p2}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v2

    .line 711
    .local v2, item:Lcom/bv/wifisync/Hosts$CheckItem;
    instance-of v6, p1, Lcom/bv/wifisync/Job;

    if-eqz v6, :cond_4

    move-object v4, p1

    .line 712
    check-cast v4, Lcom/bv/wifisync/Job;

    .line 713
    .restart local v4       #job:Lcom/bv/wifisync/Job;
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    check-cast v2, Lcom/bv/wifisync/Hosts$JobItem;

    .end local v2           #item:Lcom/bv/wifisync/Hosts$CheckItem;
    #getter for: Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts$JobItem;->access$0(Lcom/bv/wifisync/Hosts$JobItem;)Lcom/bv/wifisync/Job;

    move-result-object v7

    invoke-virtual {v6, p0, v7, v4}, Lcom/bv/wifisync/HostList;->updateJob(Landroid/content/Context;Lcom/bv/wifisync/Job;Lcom/bv/wifisync/Job;)V

    .line 714
    const-string v6, "Menu"

    const-string v7, "Job updated"

    invoke-virtual {p0, v6, v7}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 715
    .end local v4           #job:Lcom/bv/wifisync/Job;
    .restart local v2       #item:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_4
    instance-of v6, p1, Lcom/bv/wifisync/Host;

    if-eqz v6, :cond_0

    .line 716
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->hosts:Lcom/bv/wifisync/HostList;

    check-cast v2, Lcom/bv/wifisync/Hosts$HostItem;

    .end local v2           #item:Lcom/bv/wifisync/Hosts$CheckItem;
    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v7

    check-cast p1, Lcom/bv/wifisync/Host;

    .end local p1
    invoke-virtual {v6, v7, p1}, Lcom/bv/wifisync/HostList;->updateHost(Lcom/bv/wifisync/Host;Lcom/bv/wifisync/Host;)V

    .line 717
    const-string v6, "Menu"

    const-string v7, "Host updated"

    invoke-virtual {p0, v6, v7}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private updateOptionsMenu()V
    .locals 1

    .prologue
    .line 1053
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->optionsMenu:Landroid/view/Menu;

    if-eqz v0, :cond_0

    .line 1054
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->optionsMenu:Landroid/view/Menu;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 1055
    :cond_0
    return-void
.end method

.method private updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;J)V
    .locals 1
    .parameter "action"
    .parameter "percent"
    .parameter "file"
    .parameter "now"

    .prologue
    .line 783
    iput-wide p4, p0, Lcom/bv/wifisync/Hosts;->lastUpdate:J

    .line 784
    new-instance v0, Lcom/bv/wifisync/Hosts$4;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/bv/wifisync/Hosts$4;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)V

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 802
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v2, -0x1

    .line 677
    if-ne p2, v2, :cond_1

    if-eqz p3, :cond_1

    .line 678
    :try_start_0
    const-string v3, "RESULT"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    .local v1, result:Ljava/io/Serializable;
    if-eqz v1, :cond_1

    .line 679
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-eqz v3, :cond_0

    .line 680
    invoke-direct {p0, v1, p1}, Lcom/bv/wifisync/Hosts;->updateDisplay(Ljava/io/Serializable;I)V

    .line 681
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v3}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 683
    :cond_0
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-nez v3, :cond_2

    .end local p3
    :goto_0
    iput-object p3, p0, Lcom/bv/wifisync/Hosts;->pendingResult:Landroid/content/Intent;

    .line 684
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-nez v3, :cond_3

    .end local p1
    :goto_1
    iput p1, p0, Lcom/bv/wifisync/Hosts;->pendingRequestCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 689
    .end local v1           #result:Ljava/io/Serializable;
    :cond_1
    :goto_2
    return-void

    .line 683
    .restart local v1       #result:Ljava/io/Serializable;
    .restart local p1
    .restart local p3
    :cond_2
    const/4 p3, 0x0

    goto :goto_0

    .end local p3
    :cond_3
    move p1, v2

    .line 684
    goto :goto_1

    .line 686
    .end local v1           #result:Ljava/io/Serializable;
    .end local p1
    :catch_0
    move-exception v0

    .line 687
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method public onButtonClick(Landroid/view/View;)V
    .locals 5
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 647
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    if-eqz v0, :cond_1

    .line 648
    iget-boolean v0, p0, Lcom/bv/wifisync/Hosts;->shortcutSetupMode:Z

    if-eqz v0, :cond_0

    .line 649
    const v0, 0x7f0601b1

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f02002c

    invoke-direct {p0, v4, v0, v1}, Lcom/bv/wifisync/Hosts;->addShortcut(ILjava/lang/String;I)V

    .line 654
    :goto_0
    return-void

    .line 651
    :cond_0
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->syncAll()V

    goto :goto_0

    .line 653
    :cond_1
    const-class v0, Lcom/bv/wifisync/AddHost;

    const v1, 0x7fffffff

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/io/Serializable;

    new-instance v3, Lcom/bv/wifisync/Host;

    invoke-direct {v3}, Lcom/bv/wifisync/Host;-><init>()V

    aput-object v3, v2, v4

    invoke-direct {p0, v0, v1, v2}, Lcom/bv/wifisync/Hosts;->showProps(Ljava/lang/Class;I[Ljava/io/Serializable;)V

    goto :goto_0
.end method

.method public bridge synthetic onClick(Landroid/view/View;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onClick(Landroid/view/View;)V

    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 12
    .parameter "item"

    .prologue
    const/4 v11, 0x1

    .line 537
    :try_start_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v3

    check-cast v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 538
    .local v3, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    iget v7, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v6, v7}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v5

    .line 539
    .local v5, selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    .line 540
    .local v4, itemId:I
    const v6, 0x7f0a0024

    if-ne v4, v6, :cond_1

    .line 541
    invoke-direct {p0, v5}, Lcom/bv/wifisync/Hosts;->removeSelectedItem(Lcom/bv/wifisync/Hosts$CheckItem;)V

    .line 542
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->updateOptionsMenu()V

    .line 564
    .end local v3           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v4           #itemId:I
    .end local v5           #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_0
    :goto_0
    return v11

    .line 543
    .restart local v3       #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .restart local v4       #itemId:I
    .restart local v5       #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_1
    const v6, 0x7f0a0027

    if-ne v4, v6, :cond_2

    .line 544
    invoke-direct {p0, v5}, Lcom/bv/wifisync/Hosts;->run(Lcom/bv/wifisync/Hosts$CheckItem;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 561
    .end local v3           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v4           #itemId:I
    .end local v5           #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :catch_0
    move-exception v1

    .line 562
    .local v1, e:Ljava/lang/Exception;
    invoke-static {p0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 545
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v3       #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .restart local v4       #itemId:I
    .restart local v5       #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_2
    const v6, 0x7f0a0022

    if-ne v4, v6, :cond_3

    .line 546
    :try_start_1
    move-object v0, v5

    check-cast v0, Lcom/bv/wifisync/Hosts$HostItem;

    move-object v2, v0

    .line 547
    .local v2, hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    const-class v6, Lcom/bv/wifisync/AddJob;

    iget v7, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    add-int/lit16 v7, v7, 0x1000

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/io/Serializable;

    const/4 v9, 0x0

    new-instance v10, Lcom/bv/wifisync/Job;

    invoke-direct {v10}, Lcom/bv/wifisync/Job;-><init>()V

    aput-object v10, v8, v9

    const/4 v9, 0x1

    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {p0, v6, v7, v8}, Lcom/bv/wifisync/Hosts;->showProps(Ljava/lang/Class;I[Ljava/io/Serializable;)V

    .line 548
    const-string v6, "Menu"

    const-string v7, "Add job"

    invoke-virtual {p0, v6, v7}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 549
    .end local v2           #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    :cond_3
    const v6, 0x7f0a0023

    if-ne v4, v6, :cond_4

    .line 550
    invoke-virtual {v5}, Lcom/bv/wifisync/Hosts$CheckItem;->edit()V

    goto :goto_0

    .line 551
    :cond_4
    const v6, 0x7f0a002e

    if-ne v4, v6, :cond_5

    .line 552
    check-cast v5, Lcom/bv/wifisync/Hosts$JobItem;

    .end local v5           #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    #getter for: Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;
    invoke-static {v5}, Lcom/bv/wifisync/Hosts$JobItem;->access$0(Lcom/bv/wifisync/Hosts$JobItem;)Lcom/bv/wifisync/Job;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/bv/wifisync/Job;->showHistory(Landroid/content/Context;)V

    goto :goto_0

    .line 553
    .restart local v5       #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_5
    const v6, 0x7f0a0025

    if-ne v4, v6, :cond_6

    .line 554
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 555
    move-object v0, v5

    check-cast v0, Lcom/bv/wifisync/Hosts$HostItem;

    move-object v2, v0

    .line 556
    .restart local v2       #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    new-instance v6, Lcom/bv/wifisync/Hosts$ExploreTask;

    invoke-direct {v6, p0}, Lcom/bv/wifisync/Hosts$ExploreTask;-><init>(Lcom/bv/wifisync/Hosts;)V

    const/4 v7, 0x1

    new-array v7, v7, [Lcom/bv/wifisync/Host;

    const/4 v8, 0x0

    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v6, v7}, Lcom/bv/wifisync/Hosts$ExploreTask;->run([Ljava/lang/Object;)V

    goto :goto_0

    .line 557
    .end local v2           #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    :cond_6
    const v6, 0x7f0a0026

    if-ne v4, v6, :cond_0

    .line 558
    move-object v0, v5

    check-cast v0, Lcom/bv/wifisync/Hosts$HostItem;

    move-object v2, v0

    .line 559
    .restart local v2       #hostItem:Lcom/bv/wifisync/Hosts$HostItem;
    new-instance v6, Lcom/bv/wifisync/Hosts$WakeupTask;

    invoke-direct {v6, p0}, Lcom/bv/wifisync/Hosts$WakeupTask;-><init>(Lcom/bv/wifisync/Hosts;)V

    const/4 v7, 0x1

    new-array v7, v7, [Lcom/bv/wifisync/Host;

    const/4 v8, 0x0

    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v2}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v6, v7}, Lcom/bv/wifisync/Hosts$WakeupTask;->run([Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 427
    :try_start_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 428
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getApplication()Landroid/app/Application;

    move-result-object v5

    invoke-static {v5}, Lcom/bv/wifisync/Utils;->setPostMortem(Landroid/content/Context;)V

    .line 429
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/Hosts;->setResult(I)V

    .line 430
    new-instance v5, Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-direct {v5, p0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;-><init>(Lcom/bv/wifisync/Hosts;)V

    iput-object v5, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    .line 431
    iget-object v5, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/Hosts;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 432
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getListView()Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/Hosts;->registerForContextMenu(Landroid/view/View;)V

    .line 433
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v5, v6, :cond_0

    .line 434
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getListView()Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 435
    :cond_0
    const v5, 0x7f0601a3

    invoke-virtual {p0, v5}, Lcom/bv/wifisync/Hosts;->setTitle(I)V

    .line 436
    invoke-static {p0}, Lcom/bv/wifisync/Dialogs;->showWelcome(Landroid/content/Context;)Landroid/app/Dialog;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 437
    const-string v5, "Installs"

    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/bv/wifisync/Hosts;->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 439
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->attachService()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 443
    :goto_0
    :try_start_2
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getSyncButtonMode(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    .line 444
    iget-object v6, p0, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    iget-boolean v5, p0, Lcom/bv/wifisync/Hosts;->syncButtonMode:Z

    if-eqz v5, :cond_3

    const v5, 0x7f0601b0

    :goto_1
    invoke-virtual {v6, v5}, Landroid/widget/Button;->setText(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 446
    :try_start_3
    const-string v5, "Version"

    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/bv/wifisync/Hosts;->trackEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 450
    :goto_2
    :try_start_4
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 451
    .local v3, intent:Landroid/content/Intent;
    if-eqz v3, :cond_2

    .line 452
    invoke-direct {p0, v3}, Lcom/bv/wifisync/Hosts;->clearLastNotification(Landroid/content/Intent;)V

    .line 453
    const-string v5, "android.intent.action.CREATE_SHORTCUT"

    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-direct {p0, v5}, Lcom/bv/wifisync/Hosts;->setShortcutSetupMode(Z)V

    .line 455
    :cond_2
    new-instance v1, Landroid/view/GestureDetector;

    new-instance v5, Lcom/bv/wifisync/Hosts$MyGestureListener;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lcom/bv/wifisync/Hosts$MyGestureListener;-><init>(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Hosts$MyGestureListener;)V

    invoke-direct {v1, p0, v5}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 456
    .local v1, gestureDetector:Landroid/view/GestureDetector;
    new-instance v2, Lcom/bv/wifisync/Hosts$2;

    invoke-direct {v2, p0, v1}, Lcom/bv/wifisync/Hosts$2;-><init>(Lcom/bv/wifisync/Hosts;Landroid/view/GestureDetector;)V

    .line 464
    .local v2, gestureListener:Landroid/view/View$OnTouchListener;
    iget-object v5, p0, Lcom/bv/wifisync/Hosts;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 468
    .end local v1           #gestureDetector:Landroid/view/GestureDetector;
    .end local v2           #gestureListener:Landroid/view/View$OnTouchListener;
    .end local v3           #intent:Landroid/content/Intent;
    :goto_3
    return-void

    .line 440
    :catch_0
    move-exception v0

    .line 441
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 465
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 466
    .restart local v0       #e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 444
    .end local v0           #e:Ljava/lang/Exception;
    :cond_3
    const v5, 0x7f0600f8

    goto :goto_1

    .line 447
    :catch_2
    move-exception v4

    .line 448
    .local v4, th:Ljava/lang/Throwable;
    :try_start_5
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 9
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 498
    iput-boolean v6, p0, Lcom/bv/wifisync/Hosts;->shortClick:Z

    .line 499
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/BrowseActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 501
    :try_start_0
    move-object v0, p3

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    move-object v2, v0

    .line 502
    .local v2, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    if-eqz v2, :cond_3

    .line 503
    iget-object v5, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    iget v8, v2, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v5, v8}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v4

    .line 504
    .local v4, selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    instance-of v5, v4, Lcom/bv/wifisync/Hosts$HostItem;

    if-eqz v5, :cond_4

    .line 505
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v5

    const v8, 0x7f090004

    invoke-virtual {v5, v8, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 511
    :goto_0
    invoke-virtual {v4}, Lcom/bv/wifisync/Hosts$CheckItem;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 512
    invoke-virtual {v4}, Lcom/bv/wifisync/Hosts$CheckItem;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/ContextMenu;

    .line 513
    const v5, 0x7f0a0027

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 514
    .local v3, item:Landroid/view/MenuItem;
    if-eqz v3, :cond_0

    .line 515
    invoke-virtual {v4}, Lcom/bv/wifisync/Hosts$CheckItem;->isRunning()Z

    move-result v5

    if-eqz v5, :cond_6

    const v5, 0x7f060130

    :goto_1
    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 517
    invoke-virtual {v4}, Lcom/bv/wifisync/Hosts$CheckItem;->canRun()Z

    move-result v5

    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 519
    :cond_0
    const v5, 0x7f0a0023

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 520
    if-eqz v3, :cond_1

    .line 521
    invoke-virtual {v4}, Lcom/bv/wifisync/Hosts$CheckItem;->isRunning()Z

    move-result v5

    if-eqz v5, :cond_7

    move v5, v6

    :goto_2
    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 522
    :cond_1
    const v5, 0x7f0a002e

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 523
    if-eqz v3, :cond_2

    instance-of v5, v4, Lcom/bv/wifisync/Hosts$JobItem;

    if-eqz v5, :cond_2

    .line 524
    move-object v0, v4

    check-cast v0, Lcom/bv/wifisync/Hosts$JobItem;

    move-object v5, v0

    #getter for: Lcom/bv/wifisync/Hosts$JobItem;->job:Lcom/bv/wifisync/Job;
    invoke-static {v5}, Lcom/bv/wifisync/Hosts$JobItem;->access$0(Lcom/bv/wifisync/Hosts$JobItem;)Lcom/bv/wifisync/Job;

    move-result-object v5

    invoke-virtual {v5}, Lcom/bv/wifisync/Job;->getHistory()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_8

    move v5, v7

    :goto_3
    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 525
    :cond_2
    const v5, 0x7f0a0026

    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 526
    if-eqz v3, :cond_3

    instance-of v5, v4, Lcom/bv/wifisync/Hosts$HostItem;

    if-eqz v5, :cond_3

    .line 527
    check-cast v4, Lcom/bv/wifisync/Hosts$HostItem;

    .end local v4           #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    #getter for: Lcom/bv/wifisync/Hosts$HostItem;->host:Lcom/bv/wifisync/Host;
    invoke-static {v4}, Lcom/bv/wifisync/Hosts$HostItem;->access$0(Lcom/bv/wifisync/Hosts$HostItem;)Lcom/bv/wifisync/Host;

    move-result-object v5

    invoke-virtual {v5}, Lcom/bv/wifisync/Host;->getConnected()Z

    move-result v5

    if-eqz v5, :cond_9

    move v5, v6

    :goto_4
    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 532
    .end local v2           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v3           #item:Landroid/view/MenuItem;
    :cond_3
    :goto_5
    return-void

    .line 506
    .restart local v2       #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .restart local v4       #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_4
    instance-of v5, v4, Lcom/bv/wifisync/Hosts$JobItem;

    if-eqz v5, :cond_5

    .line 507
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v5

    const v8, 0x7f090007

    invoke-virtual {v5, v8, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 529
    .end local v2           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v4           #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :catch_0
    move-exception v1

    .line 530
    .local v1, e:Ljava/lang/Exception;
    invoke-static {p0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 509
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v2       #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .restart local v4       #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_5
    :try_start_1
    new-instance v5, Ljava/lang/Exception;

    const-string v6, "No item"

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 516
    .restart local v3       #item:Landroid/view/MenuItem;
    :cond_6
    const v5, 0x7f0600fb

    goto :goto_1

    :cond_7
    move v5, v7

    .line 521
    goto :goto_2

    :cond_8
    move v5, v6

    .line 524
    goto :goto_3

    .end local v4           #selectedItem:Lcom/bv/wifisync/Hosts$CheckItem;
    :cond_9
    move v5, v7

    .line 527
    goto :goto_4
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .parameter "id"

    .prologue
    .line 489
    invoke-static {p0}, Lcom/bv/wifisync/Dialogs;->showWelcome(Landroid/content/Context;)Landroid/app/Dialog;

    move-result-object v0

    .line 490
    .local v0, result:Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 491
    const-string v1, "Installs"

    invoke-static {p0}, Lcom/bv/wifisync/Utils;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/bv/wifisync/Hosts;->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    :cond_0
    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v2, 0x1

    .line 727
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v3, 0x7f090006

    invoke-virtual {v1, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 728
    const v1, 0x7f0a002a

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 729
    .local v0, item:Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 730
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->isDonated()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 731
    :cond_0
    iput-object p1, p0, Lcom/bv/wifisync/Hosts;->optionsMenu:Landroid/view/Menu;

    .line 732
    return v2

    :cond_1
    move v1, v2

    .line 730
    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 876
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onDestroy()V

    .line 877
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->unbind()V

    .line 878
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

    invoke-virtual {v0}, Lcom/bv/wifisync/Hosts$CheckHostTask;->interrupt()V

    .line 879
    invoke-static {}, Lcom/bv/wifisync/Utils;->stopTracker()V

    .line 880
    invoke-static {}, Lcom/bv/wifisync/Clipboard;->clear()V

    .line 881
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 5
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1042
    iget-boolean v3, p0, Lcom/bv/wifisync/Hosts;->shortClick:Z

    if-eqz v3, :cond_0

    .line 1049
    :goto_0
    return v1

    .line 1044
    :cond_0
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v3, p3}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v3

    iget-boolean v3, v3, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    if-eqz v3, :cond_2

    move v0, v1

    .line 1045
    .local v0, selected:Z
    :goto_1
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->showSelection()V

    .line 1046
    iget-object v3, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v3, p3}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v3

    iget-boolean v4, p0, Lcom/bv/wifisync/Hosts;->selection:Z

    if-eqz v4, :cond_1

    if-eqz v0, :cond_1

    move v1, v2

    :cond_1
    iput-boolean v1, v3, Lcom/bv/wifisync/Hosts$CheckItem;->selected:Z

    .line 1047
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->notifyDataSetChanged()V

    .line 1048
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->updateOptionsMenu()V

    move v1, v2

    .line 1049
    goto :goto_0

    .end local v0           #selected:Z
    :cond_2
    move v0, v2

    .line 1044
    goto :goto_1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .parameter "intent"

    .prologue
    .line 982
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 983
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/Hosts;->setIntent(Landroid/content/Intent;)V

    .line 984
    if-eqz p1, :cond_0

    .line 986
    :try_start_0
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Hosts;->clearLastNotification(Landroid/content/Intent;)V

    .line 987
    iget-object v1, p0, Lcom/bv/wifisync/Hosts;->service:Lcom/bv/wifisync/SyncService;

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    .line 988
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Hosts;->handleShortcut(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 993
    :cond_0
    :goto_0
    return-void

    .line 989
    :catch_0
    move-exception v0

    .line 990
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    .line 743
    :try_start_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a002d

    if-ne v1, v2, :cond_0

    .line 744
    invoke-static {p0}, Lcom/bv/wifisync/Dialogs;->showAbout(Landroid/content/Context;)V

    .line 760
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 745
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a0029

    if-ne v1, v2, :cond_1

    .line 746
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bv/wifisync/Settings;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/Hosts;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 757
    :catch_0
    move-exception v0

    .line 758
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 747
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    :try_start_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a002a

    if-ne v1, v2, :cond_2

    .line 748
    invoke-virtual {p0}, Lcom/bv/wifisync/Hosts;->donate()V

    goto :goto_0

    .line 749
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a002b

    if-ne v1, v2, :cond_3

    .line 750
    const v1, 0x7f060183

    const v2, 0x7f0601ab

    invoke-static {p0, v1, v2}, Lcom/bv/wifisync/Dialogs;->showInfo(Landroid/content/Context;II)Landroid/app/AlertDialog;

    goto :goto_0

    .line 751
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a002c

    if-ne v1, v2, :cond_4

    .line 752
    const v1, 0x7f0601b4

    const v2, 0x7f0600ef

    invoke-static {p0, v1, v2}, Lcom/bv/wifisync/Dialogs;->showInfo(Landroid/content/Context;II)Landroid/app/AlertDialog;

    goto :goto_0

    .line 753
    :cond_4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a0027

    if-ne v1, v2, :cond_5

    .line 754
    invoke-direct {p0}, Lcom/bv/wifisync/Hosts;->runSelected()V

    goto :goto_0

    .line 756
    :cond_5
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    goto :goto_1
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    .line 1069
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    .line 1070
    const v1, 0x7f0a0027

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1071
    .local v0, item:Landroid/view/MenuItem;
    iget-boolean v1, p0, Lcom/bv/wifisync/Hosts;->selection:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1072
    const/4 v1, 0x1

    .line 1074
    .end local v0           #item:Landroid/view/MenuItem;
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    goto :goto_0
.end method

.method public onProgress(Lcom/bv/wifisync/Job;Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z
    .locals 6
    .parameter "job"
    .parameter "action"
    .parameter "percent"
    .parameter "file"

    .prologue
    .line 774
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 775
    .local v4, now:J
    sget-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Listing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    if-ne p2, v0, :cond_1

    .line 779
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/bv/wifisync/Job;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    :goto_1
    return v0

    .line 777
    :cond_1
    iget-wide v0, p0, Lcom/bv/wifisync/Hosts;->lastUpdate:J

    sub-long v0, v4, v0

    const-wide/16 v2, 0x32

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2

    sget-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Saving:Lcom/bv/sync/ProgressNotification$ProgressAction;

    if-eq p2, v0, :cond_2

    sget-object v0, Lcom/bv/sync/ProgressNotification$ProgressAction;->Connecting:Lcom/bv/sync/ProgressNotification$ProgressAction;

    if-ne p2, v0, :cond_0

    :cond_2
    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    .line 778
    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/Hosts;->updateProgress(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;J)V

    goto :goto_0

    .line 779
    :cond_3
    const/4 v0, 0x1

    goto :goto_1
.end method

.method protected onProgressCancelClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1085
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getCount()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 1092
    :goto_1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onProgressCancelClick(Landroid/view/View;)V

    .line 1093
    return-void

    .line 1086
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/Hosts;->adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Hosts$ItemsAdapter;->getItem(I)Lcom/bv/wifisync/Hosts$CheckItem;

    move-result-object v1

    .line 1087
    .local v1, item:Lcom/bv/wifisync/Hosts$CheckItem;
    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$CheckItem;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1088
    invoke-virtual {v1}, Lcom/bv/wifisync/Hosts$CheckItem;->cancel()V

    goto :goto_1

    .line 1085
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 976
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onResume()V

    .line 977
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/bv/wifisync/Hosts$CheckHostTask;->enabled:Z

    .line 978
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 970
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/bv/wifisync/Hosts$CheckHostTask;->enabled:Z

    .line 971
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onStop()V

    .line 972
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .parameter "hasFocus"

    .prologue
    .line 964
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onWindowFocusChanged(Z)V

    .line 965
    iget-object v0, p0, Lcom/bv/wifisync/Hosts;->checkHostTask:Lcom/bv/wifisync/Hosts$CheckHostTask;

    iput-boolean p1, v0, Lcom/bv/wifisync/Hosts$CheckHostTask;->enabled:Z

    .line 966
    return-void
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

.method public update(Lcom/bv/wifisync/Job;Z)V
    .locals 1
    .parameter "job"
    .parameter "before"

    .prologue
    .line 806
    new-instance v0, Lcom/bv/wifisync/Hosts$5;

    invoke-direct {v0, p0, p2, p1}, Lcom/bv/wifisync/Hosts$5;-><init>(Lcom/bv/wifisync/Hosts;ZLcom/bv/wifisync/Job;)V

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/Hosts;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 829
    return-void
.end method
