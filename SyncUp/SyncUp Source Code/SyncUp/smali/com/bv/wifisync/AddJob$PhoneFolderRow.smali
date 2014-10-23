.class Lcom/bv/wifisync/AddJob$PhoneFolderRow;
.super Lcom/bv/wifisync/AddJob$JobRow;
.source "AddJob.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhoneFolderRow"
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$bv$wifisync$Job$SyncType:[I


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;


# direct methods
.method static synthetic $SWITCH_TABLE$com$bv$wifisync$Job$SyncType()[I
    .locals 3

    .prologue
    .line 66
    sget-object v0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->$SWITCH_TABLE$com$bv$wifisync$Job$SyncType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/bv/wifisync/Job$SyncType;->values()[Lcom/bv/wifisync/Job$SyncType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Downloads:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_6

    :goto_1
    :try_start_1
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Folder:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_5

    :goto_2
    :try_start_2
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Movies:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_4

    :goto_3
    :try_start_3
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :goto_4
    :try_start_4
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_2

    :goto_5
    :try_start_5
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->Root:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_1

    :goto_6
    :try_start_6
    sget-object v1, Lcom/bv/wifisync/Job$SyncType;->SDCard:Lcom/bv/wifisync/Job$SyncType;

    invoke-virtual {v1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_0

    :goto_7
    sput-object v0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->$SWITCH_TABLE$com$bv$wifisync$Job$SyncType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_7

    :catch_1
    move-exception v1

    goto :goto_6

    :catch_2
    move-exception v1

    goto :goto_5

    :catch_3
    move-exception v1

    goto :goto_4

    :catch_4
    move-exception v1

    goto :goto_3

    :catch_5
    move-exception v1

    goto :goto_2

    :catch_6
    move-exception v1

    goto :goto_1
.end method

.method constructor <init>(Lcom/bv/wifisync/AddJob;)V
    .locals 2
    .parameter

    .prologue
    .line 67
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    .line 68
    const v0, 0x7f0600f2

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddJob;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f02001f

    invoke-direct {p0, p1, v0, v1}, Lcom/bv/wifisync/AddJob$JobRow;-><init>(Lcom/bv/wifisync/AddJob;Ljava/lang/String;I)V

    .line 69
    return-void
.end method

.method private newPlugin(Lcom/bv/wifisync/Job$SyncType;)Lcom/bv/wifisync/Job$Plugin;
    .locals 2
    .parameter "syncType"

    .prologue
    .line 121
    invoke-static {}, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->$SWITCH_TABLE$com$bv$wifisync$Job$SyncType()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 127
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 123
    :pswitch_0
    new-instance v0, Lcom/bv/wifisync/Mp3Plugin;

    invoke-direct {v0}, Lcom/bv/wifisync/Mp3Plugin;-><init>()V

    goto :goto_0

    .line 125
    :pswitch_1
    new-instance v0, Lcom/bv/wifisync/ImagePlugin;

    invoke-direct {v0}, Lcom/bv/wifisync/ImagePlugin;-><init>()V

    goto :goto_0

    .line 121
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private newPluginRow(Lcom/bv/wifisync/Job$SyncType;)Lcom/bv/wifisync/AddJob$JobRow;
    .locals 2
    .parameter "syncType"

    .prologue
    .line 110
    invoke-static {}, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->$SWITCH_TABLE$com$bv$wifisync$Job$SyncType()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/bv/wifisync/Job$SyncType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 116
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 112
    :pswitch_0
    new-instance v0, Lcom/bv/wifisync/AddJob$GroupMp3Row;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-direct {v0, v1}, Lcom/bv/wifisync/AddJob$GroupMp3Row;-><init>(Lcom/bv/wifisync/AddJob;)V

    goto :goto_0

    .line 114
    :pswitch_1
    new-instance v0, Lcom/bv/wifisync/AddJob$GroupImagesRow;

    iget-object v1, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-direct {v0, v1}, Lcom/bv/wifisync/AddJob$GroupImagesRow;-><init>(Lcom/bv/wifisync/AddJob;)V

    goto :goto_0

    .line 110
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method protected getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 79
    :try_start_0
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-static {v4}, Lcom/bv/wifisync/Config;->getShowDeviceRoot(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v3, Ljava/io/File;

    const-string v4, "/"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 80
    .local v3, startFile:Ljava/io/File;
    :goto_0
    new-instance v1, Lcom/bv/wifisync/LocalFileEx;

    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-direct {v1, v4, v3}, Lcom/bv/wifisync/LocalFileEx;-><init>(Landroid/content/Context;Ljava/io/File;)V

    .line 81
    .local v1, file:Lcom/bv/sync/LocalFile;
    new-instance v2, Lcom/bv/wifisync/DirBrowser$Options;

    invoke-direct {v2}, Lcom/bv/wifisync/DirBrowser$Options;-><init>()V

    .line 82
    .local v2, options:Lcom/bv/wifisync/DirBrowser$Options;
    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/bv/wifisync/DirBrowser$Options;->showSelection:Z

    .line 83
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v2, Lcom/bv/wifisync/DirBrowser$Options;->requestCode:Ljava/lang/Integer;

    .line 84
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-static {v4, v1, v2}, Lcom/bv/wifisync/DirBrowser;->selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V

    .line 85
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 89
    .end local v1           #file:Lcom/bv/sync/LocalFile;
    .end local v2           #options:Lcom/bv/wifisync/DirBrowser$Options;
    .end local v3           #startFile:Ljava/io/File;
    :goto_1
    return-void

    .line 79
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, e:Ljava/lang/Exception;
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    invoke-static {v4, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method update(Ljava/lang/Object;)V
    .locals 7
    .parameter "data"

    .prologue
    .line 93
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v2

    .line 94
    .local v2, oldSyncType:Lcom/bv/wifisync/Job$SyncType;
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, oldDir:Ljava/lang/String;
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-virtual {v4, p1}, Lcom/bv/wifisync/Job;->setPhoneDir(Ljava/lang/String;)V

    .line 96
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 97
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    invoke-virtual {v4}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v3

    .line 98
    .local v3, syncType:Lcom/bv/wifisync/Job$SyncType;
    if-eq v2, v3, :cond_1

    .line 99
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v4

    iget-object v4, v4, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    if-eqz v4, :cond_0

    .line 100
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v5

    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v4

    iget-object v6, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v6}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v6

    invoke-virtual {v6}, Lcom/bv/wifisync/PropertiesAdapter;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v4, v6}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bv/wifisync/AddJob$JobRow;

    invoke-virtual {v5, v4}, Lcom/bv/wifisync/PropertiesAdapter;->remove(Ljava/lang/Object;)V

    .line 101
    :cond_0
    sget-object v4, Lcom/bv/wifisync/Job$SyncType;->Music:Lcom/bv/wifisync/Job$SyncType;

    if-eq v3, v4, :cond_2

    sget-object v4, Lcom/bv/wifisync/Job$SyncType;->Pictures:Lcom/bv/wifisync/Job$SyncType;

    if-eq v3, v4, :cond_2

    const/4 v0, 0x0

    .line 102
    .local v0, needsPlugin:Z
    :goto_0
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v5

    if-eqz v0, :cond_3

    invoke-direct {p0, v3}, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->newPlugin(Lcom/bv/wifisync/Job$SyncType;)Lcom/bv/wifisync/Job$Plugin;

    move-result-object v4

    :goto_1
    iput-object v4, v5, Lcom/bv/wifisync/Job;->plugin:Lcom/bv/wifisync/Job$Plugin;

    .line 103
    if-eqz v0, :cond_1

    .line 104
    iget-object v4, p0, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v4}, Lcom/bv/wifisync/AddJob;->access$3(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v4

    invoke-direct {p0, v3}, Lcom/bv/wifisync/AddJob$PhoneFolderRow;->newPluginRow(Lcom/bv/wifisync/Job$SyncType;)Lcom/bv/wifisync/AddJob$JobRow;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/bv/wifisync/PropertiesAdapter;->add(Ljava/lang/Object;)V

    .line 107
    .end local v0           #needsPlugin:Z
    .end local v3           #syncType:Lcom/bv/wifisync/Job$SyncType;
    :cond_1
    return-void

    .line 101
    .restart local v3       #syncType:Lcom/bv/wifisync/Job$SyncType;
    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    .line 102
    .restart local v0       #needsPlugin:Z
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method
