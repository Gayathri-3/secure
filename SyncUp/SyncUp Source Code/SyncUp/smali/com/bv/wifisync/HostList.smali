.class public Lcom/bv/wifisync/HostList;
.super Ljava/util/ArrayList;
.source "HostList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/HostList$ChangeListener;,
        Lcom/bv/wifisync/HostList$ConnectionDetector;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lcom/bv/wifisync/Host;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HostList"

.field private static final serialVersionUID:J = 0x4a1a24e84c2c91feL


# instance fields
.field private transient backupManager:Landroid/app/backup/BackupManager;

.field private transient lastSaveTime:J

.field private nextId:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/HostList;->lastSaveTime:J

    .line 29
    new-instance v0, Landroid/app/backup/BackupManager;

    invoke-direct {v0, p1}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/bv/wifisync/HostList;->backupManager:Landroid/app/backup/BackupManager;

    .line 30
    return-void
.end method

.method private constructor <init>(Ljava/util/ArrayList;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/Host;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    .local p1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/HostList;->lastSaveTime:J

    .line 25
    return-void
.end method

.method private assignUniqueIds()Z
    .locals 9

    .prologue
    .line 94
    const/4 v3, 0x0

    .line 95
    .local v3, result:Z
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 96
    .local v1, ids:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 99
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .line 115
    return v3

    .line 96
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 97
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

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/Job;

    .line 98
    .local v2, job:Lcom/bv/wifisync/Job;
    iget v6, v2, Lcom/bv/wifisync/Job;->id:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 99
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v2           #job:Lcom/bv/wifisync/Job;
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 100
    .restart local v0       #host:Lcom/bv/wifisync/Host;
    iget v5, v0, Lcom/bv/wifisync/Host;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 101
    const/4 v3, 0x1

    .line 102
    iget v5, p0, Lcom/bv/wifisync/HostList;->nextId:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/bv/wifisync/HostList;->nextId:I

    iput v5, v0, Lcom/bv/wifisync/Host;->id:I

    .line 103
    const-string v5, "HostList"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Reassigned id for host: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v0, Lcom/bv/wifisync/Host;->id:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " new id: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/bv/wifisync/HostList;->nextId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :cond_4
    iget v5, v0, Lcom/bv/wifisync/Host;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 106
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/Job;

    .line 107
    .restart local v2       #job:Lcom/bv/wifisync/Job;
    iget v6, v2, Lcom/bv/wifisync/Job;->id:I

    if-nez v6, :cond_5

    .line 108
    const/4 v3, 0x1

    .line 109
    iget v6, p0, Lcom/bv/wifisync/HostList;->nextId:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/bv/wifisync/HostList;->nextId:I

    iput v6, v2, Lcom/bv/wifisync/Job;->id:I

    .line 110
    const-string v6, "HostList"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Reassigned id for job: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " new id: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/bv/wifisync/HostList;->nextId:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget v6, v2, Lcom/bv/wifisync/Job;->id:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private fixHostIds()Z
    .locals 2

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/bv/wifisync/HostList;->fixNextId()Z

    move-result v0

    .line 72
    .local v0, result:Z
    invoke-direct {p0}, Lcom/bv/wifisync/HostList;->assignUniqueIds()Z

    move-result v1

    or-int/2addr v0, v1

    .line 73
    return v0
.end method

.method private fixNextId()Z
    .locals 7

    .prologue
    .line 77
    const/4 v2, 0x0

    .line 78
    .local v2, result:Z
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 90
    return v2

    .line 78
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 79
    .local v0, host:Lcom/bv/wifisync/Host;
    iget v4, v0, Lcom/bv/wifisync/Host;->id:I

    iget v5, p0, Lcom/bv/wifisync/HostList;->nextId:I

    if-le v4, v5, :cond_2

    .line 80
    iget v4, v0, Lcom/bv/wifisync/Host;->id:I

    iput v4, p0, Lcom/bv/wifisync/HostList;->nextId:I

    .line 81
    const/4 v2, 0x1

    .line 83
    :cond_2
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 84
    .local v1, job:Lcom/bv/wifisync/Job;
    iget v5, v1, Lcom/bv/wifisync/Job;->id:I

    iget v6, p0, Lcom/bv/wifisync/HostList;->nextId:I

    if-le v5, v6, :cond_3

    .line 85
    iget v5, v1, Lcom/bv/wifisync/Job;->id:I

    iput v5, p0, Lcom/bv/wifisync/HostList;->nextId:I

    .line 86
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 2
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/HostList;->lastSaveTime:J

    .line 48
    new-instance v0, Landroid/app/backup/BackupManager;

    invoke-direct {v0, p1}, Landroid/app/backup/BackupManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/bv/wifisync/HostList;->backupManager:Landroid/app/backup/BackupManager;

    .line 49
    invoke-direct {p0}, Lcom/bv/wifisync/HostList;->fixHostIds()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;)V

    .line 51
    :cond_0
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostList;->validate(Landroid/content/Context;)V

    .line 52
    return-void
.end method

.method static load(Landroid/content/Context;)Lcom/bv/wifisync/HostList;
    .locals 4
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    :try_start_0
    invoke-static {p0}, Lcom/bv/wifisync/Utils;->readConfig(Landroid/content/Context;)Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 40
    .local v1, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    :goto_0
    instance-of v3, v1, Lcom/bv/wifisync/HostList;

    if-eqz v3, :cond_0

    check-cast v1, Lcom/bv/wifisync/HostList;

    .end local v1           #list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    move-object v2, v1

    .line 42
    .local v2, result:Lcom/bv/wifisync/HostList;
    :goto_1
    invoke-direct {v2, p0}, Lcom/bv/wifisync/HostList;->init(Landroid/content/Context;)V

    .line 43
    return-object v2

    .line 36
    .end local v2           #result:Lcom/bv/wifisync/HostList;
    :catch_0
    move-exception v0

    .line 38
    .local v0, e:Ljava/io/FileNotFoundException;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .restart local v1       #list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/Host;>;"
    goto :goto_0

    .line 40
    .end local v0           #e:Ljava/io/FileNotFoundException;
    :cond_0
    new-instance v2, Lcom/bv/wifisync/HostList;

    invoke-direct {v2, v1}, Lcom/bv/wifisync/HostList;-><init>(Ljava/util/ArrayList;)V

    goto :goto_1
.end method

.method private declared-synchronized save(Landroid/content/Context;Z)V
    .locals 2
    .parameter "context"
    .parameter "force"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    monitor-enter p0

    if-nez p2, :cond_0

    :try_start_0
    iget-wide v0, p0, Lcom/bv/wifisync/HostList;->lastSaveTime:J

    invoke-direct {p0, v0, v1}, Lcom/bv/wifisync/HostList;->saveNeeded(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 195
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/HostList;->backupManager:Landroid/app/backup/BackupManager;

    invoke-static {p1, p0, v0}, Lcom/bv/wifisync/Utils;->writeConfig(Landroid/content/Context;Ljava/util/ArrayList;Landroid/app/backup/BackupManager;)V

    .line 196
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bv/wifisync/HostList;->lastSaveTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    monitor-exit p0

    return-void

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private saveNeeded(J)Z
    .locals 3
    .parameter "time"

    .prologue
    .line 200
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 203
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 200
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 201
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0, p1, p2}, Lcom/bv/wifisync/Host;->changedSince(J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 202
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized add(Lcom/bv/wifisync/Host;)Z
    .locals 1
    .parameter "host"

    .prologue
    .line 56
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/bv/wifisync/HostList;->nextId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bv/wifisync/HostList;->nextId:I

    iput v0, p1, Lcom/bv/wifisync/Host;->id:I

    .line 57
    invoke-super {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 56
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/wifisync/Host;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostList;->add(Lcom/bv/wifisync/Host;)Z

    move-result v0

    return v0
.end method

.method declared-synchronized addJob(Lcom/bv/wifisync/Job;Lcom/bv/wifisync/Host;)V
    .locals 1
    .parameter "job"
    .parameter "host"

    .prologue
    .line 169
    monitor-enter p0

    :try_start_0
    iput-object p2, p1, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    .line 170
    iget v0, p0, Lcom/bv/wifisync/HostList;->nextId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bv/wifisync/HostList;->nextId:I

    iput v0, p1, Lcom/bv/wifisync/Job;->id:I

    .line 171
    iget-object v0, p1, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0, p1}, Lcom/bv/wifisync/Host;->addJob(Lcom/bv/wifisync/Job;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    monitor-exit p0

    return-void

    .line 169
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method checkConnected(Landroid/content/Context;JLcom/bv/wifisync/HostList$ChangeListener;)V
    .locals 6
    .parameter "context"
    .parameter "lastReconnect"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 229
    new-instance v0, Lcom/bv/wifisync/HostList$ConnectionDetector;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/HostList$ConnectionDetector;-><init>(Lcom/bv/wifisync/HostList;Landroid/content/Context;JLcom/bv/wifisync/HostList$ChangeListener;)V

    invoke-virtual {v0}, Lcom/bv/wifisync/HostList$ConnectionDetector;->run()V

    .line 230
    return-void
.end method

.method declared-synchronized getJobCount()I
    .locals 4

    .prologue
    .line 124
    monitor-enter p0

    const/4 v1, 0x0

    .line 125
    .local v1, result:I
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_0

    .line 127
    monitor-exit p0

    return v1

    .line 125
    :cond_0
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 126
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0

    .line 124
    .end local v0           #host:Lcom/bv/wifisync/Host;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized getJobs()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/Job;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 184
    .local v1, result:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/Job;>;"
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_0

    .line 186
    monitor-exit p0

    return-object v1

    .line 184
    :cond_0
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 185
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 183
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #result:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/bv/wifisync/Job;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized getMostRecentError()Ljava/lang/Throwable;
    .locals 9

    .prologue
    .line 155
    monitor-enter p0

    const-wide/16 v2, 0x0

    .line 156
    .local v2, lastErrorTime:J
    const/4 v4, 0x0

    .line 157
    .local v4, result:Ljava/lang/Throwable;
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_1

    .line 165
    monitor-exit p0

    return-object v4

    .line 157
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 158
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 159
    .local v1, job:Lcom/bv/wifisync/Job;
    iget-wide v7, v1, Lcom/bv/wifisync/Job;->lastRun:J

    cmp-long v7, v2, v7

    if-gez v7, :cond_2

    .line 160
    iget-object v4, v1, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    .line 161
    iget-wide v2, v1, Lcom/bv/wifisync/Job;->lastRun:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 155
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #job:Lcom/bv/wifisync/Job;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method declared-synchronized hasFailedJobs()Z
    .locals 5

    .prologue
    .line 139
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 143
    const/4 v2, 0x0

    :goto_0
    monitor-exit p0

    return v2

    .line 139
    :cond_1
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 140
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 141
    .local v1, job:Lcom/bv/wifisync/Job;
    iget-object v4, v1, Lcom/bv/wifisync/Job;->lastResult:Ljava/lang/Throwable;

    if-eqz v4, :cond_2

    iget-boolean v4, v1, Lcom/bv/wifisync/Job;->running:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_2

    .line 142
    const/4 v2, 0x1

    goto :goto_0

    .line 139
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #job:Lcom/bv/wifisync/Job;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized noRunJob()Z
    .locals 8

    .prologue
    .line 131
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 135
    const/4 v2, 0x1

    :goto_0
    monitor-exit p0

    return v2

    .line 131
    :cond_1
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 132
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 133
    .local v1, job:Lcom/bv/wifisync/Job;
    iget-wide v4, v1, Lcom/bv/wifisync/Job;->lastRun:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_2

    iget-boolean v4, v1, Lcom/bv/wifisync/Job;->running:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_2

    .line 134
    const/4 v2, 0x0

    goto :goto_0

    .line 131
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #job:Lcom/bv/wifisync/Job;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized noScheduledJobs()Z
    .locals 5

    .prologue
    .line 147
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 151
    const/4 v2, 0x1

    :goto_0
    monitor-exit p0

    return v2

    .line 147
    :cond_1
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 148
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/Job;

    .line 149
    .local v1, job:Lcom/bv/wifisync/Job;
    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->isScheduled()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v1}, Lcom/bv/wifisync/Job;->isRouterDependant()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-eqz v4, :cond_2

    .line 150
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 147
    .end local v0           #host:Lcom/bv/wifisync/Host;
    .end local v1           #job:Lcom/bv/wifisync/Job;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized remove(I)Lcom/bv/wifisync/Host;
    .locals 1
    .parameter "index"

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/HostList;->remove(I)Lcom/bv/wifisync/Host;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized remove(Ljava/lang/Object;)Z
    .locals 1
    .parameter "object"

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method save(Landroid/content/Context;)V
    .locals 1
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;Z)V

    .line 191
    return-void
.end method

.method saveIfChanged(Landroid/content/Context;)V
    .locals 1
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 305
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/HostList;->save(Landroid/content/Context;Z)V

    .line 306
    return-void
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized updateHost(Lcom/bv/wifisync/Host;Lcom/bv/wifisync/Host;)V
    .locals 1
    .parameter "host"
    .parameter "another"

    .prologue
    .line 179
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1, p2}, Lcom/bv/wifisync/Host;->update(Lcom/bv/wifisync/Host;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    monitor-exit p0

    return-void

    .line 179
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized updateJob(Landroid/content/Context;Lcom/bv/wifisync/Job;Lcom/bv/wifisync/Job;)V
    .locals 1
    .parameter "context"
    .parameter "job"
    .parameter "another"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    monitor-enter p0

    :try_start_0
    invoke-virtual {p2, p1, p3}, Lcom/bv/wifisync/Job;->update(Landroid/content/Context;Lcom/bv/wifisync/Job;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    monitor-exit p0

    return-void

    .line 175
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method validate(Landroid/content/Context;)V
    .locals 8
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 208
    .local v1, ids:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Ljava/lang/String;>;"
    monitor-enter p0

    .line 209
    :try_start_0
    invoke-virtual {p0}, Lcom/bv/wifisync/HostList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 208
    monitor-exit p0

    .line 222
    return-void

    .line 209
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/Host;

    .line 210
    .local v0, host:Lcom/bv/wifisync/Host;
    invoke-virtual {v0, p1}, Lcom/bv/wifisync/Host;->validate(Landroid/content/Context;)V

    .line 211
    iget v4, v0, Lcom/bv/wifisync/Host;->id:I

    invoke-virtual {v1, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 212
    new-instance v3, Ljava/io/IOException;

    const v4, 0x7f0600ad

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 208
    .end local v0           #host:Lcom/bv/wifisync/Host;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 213
    .restart local v0       #host:Lcom/bv/wifisync/Host;
    :cond_2
    :try_start_1
    iget v4, v0, Lcom/bv/wifisync/Host;->id:I

    iget-object v5, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 214
    invoke-virtual {v0}, Lcom/bv/wifisync/Host;->getJobs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/Job;

    .line 215
    .local v2, job:Lcom/bv/wifisync/Job;
    invoke-virtual {v2, p1}, Lcom/bv/wifisync/Job;->validate(Landroid/content/Context;)V

    .line 216
    iget v5, v2, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v1, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 217
    new-instance v3, Ljava/io/IOException;

    const v4, 0x7f0600ad

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 218
    :cond_3
    iget v5, v2, Lcom/bv/wifisync/Job;->id:I

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method
