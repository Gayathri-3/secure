.class Lcom/bv/wifisync/LocalFileEx;
.super Lcom/bv/sync/LocalFile;
.source "LocalFileEx.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/LocalFileEx$Compression;,
        Lcom/bv/wifisync/LocalFileEx$DBHelper;
    }
.end annotation


# static fields
.field private static final DB_NAME:Ljava/lang/String; = "timestamps.db"

.field private static final LOCAL_FIELD:Ljava/lang/String; = "local_time"

.field private static final MIN_COMPACT_SIZE:J = 0xf00000L

.field private static final PATH_FIELD:Ljava/lang/String; = "path"

.field private static final REMOTE_FIELD:Ljava/lang/String; = "remote_time"

.field private static final TABLE_NAME:Ljava/lang/String; = "FILES"

.field private static dbHelper:Landroid/database/sqlite/SQLiteOpenHelper; = null

.field private static deleteStatement:Landroid/database/sqlite/SQLiteStatement; = null

.field private static insertStatement:Landroid/database/sqlite/SQLiteStatement; = null

.field private static final serialVersionUID:J = -0x24cc4f360602096fL

.field private static updateCount:J


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0
    .parameter "context"
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-direct {p0, p2}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    .line 78
    invoke-static {p1}, Lcom/bv/wifisync/LocalFileEx;->init(Landroid/content/Context;)V

    .line 79
    return-void
.end method

.method private constructor <init>(Ljava/io/File;)V
    .locals 0
    .parameter "file"

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    .line 74
    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .parameter

    .prologue
    .line 38
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->getDbFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized backup(Landroid/content/Context;)V
    .locals 8
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 181
    const-class v3, Lcom/bv/wifisync/LocalFileEx;

    monitor-enter v3

    :try_start_0
    sget-wide v4, Lcom/bv/wifisync/LocalFileEx;->updateCount:J

    cmp-long v2, v4, v6

    if-lez v2, :cond_0

    .line 182
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->getBackupFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 183
    .local v0, backupFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 184
    .local v1, parentFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 185
    new-instance v2, Ljava/io/File;

    const-string v4, "syncme.wireless"

    invoke-direct {v2, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 186
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->getDbFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    sget-object v4, Lcom/bv/wifisync/LocalFileEx$Compression;->Encrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    invoke-static {v2, v0, v4}, Lcom/bv/wifisync/LocalFileEx;->copy(Ljava/io/File;Ljava/io/File;Lcom/bv/wifisync/LocalFileEx$Compression;)V

    .line 187
    const-wide/16 v4, 0x0

    sput-wide v4, Lcom/bv/wifisync/LocalFileEx;->updateCount:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    .end local v0           #backupFile:Ljava/io/File;
    .end local v1           #parentFile:Ljava/io/File;
    :cond_0
    monitor-exit v3

    return-void

    .line 181
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method static compact(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
    .locals 4
    .parameter "context"
    .parameter "progress"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->init(Landroid/content/Context;)V

    .line 175
    sget-wide v0, Lcom/bv/wifisync/LocalFileEx;->updateCount:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->getDbFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v2, 0xf00000

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 176
    invoke-static {p1}, Lcom/bv/wifisync/LocalFileEx;->doCompact(Lcom/bv/sync/ProgressNotification;)V

    .line 177
    :cond_0
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->backup(Landroid/content/Context;)V

    .line 178
    return-void
.end method

.method private static copy(Ljava/io/File;Ljava/io/File;Lcom/bv/wifisync/LocalFileEx$Compression;)V
    .locals 7
    .parameter "file1"
    .parameter "file2"
    .parameter "compression"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    const/4 v5, 0x0

    .line 99
    .local v5, zipFile:Ljava/util/zip/ZipFile;
    sget-object v6, Lcom/bv/wifisync/LocalFileEx$Compression;->Decrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    if-ne p2, v6, :cond_1

    .line 100
    new-instance v5, Ljava/util/zip/ZipFile;

    .end local v5           #zipFile:Ljava/util/zip/ZipFile;
    invoke-direct {v5, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 101
    .restart local v5       #zipFile:Ljava/util/zip/ZipFile;
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipEntry;

    .line 102
    .local v1, entry:Ljava/util/zip/ZipEntry;
    invoke-virtual {v5, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v2

    .line 107
    .end local v1           #entry:Ljava/util/zip/ZipEntry;
    .local v2, in:Ljava/io/InputStream;
    :goto_0
    :try_start_0
    invoke-static {p1, p2}, Lcom/bv/wifisync/LocalFileEx;->getOutput(Ljava/io/File;Lcom/bv/wifisync/LocalFileEx$Compression;)Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v3

    .line 110
    .local v3, out:Ljava/io/OutputStream;
    const v6, 0xf000

    :try_start_1
    new-array v0, v6, [B

    .line 111
    .local v0, buffer:[B
    :goto_1
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    .local v4, size:I
    if-gtz v4, :cond_2

    .line 114
    :try_start_2
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 117
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 118
    if-eqz v5, :cond_0

    .line 119
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V

    .line 121
    :cond_0
    return-void

    .line 104
    .end local v0           #buffer:[B
    .end local v2           #in:Ljava/io/InputStream;
    .end local v3           #out:Ljava/io/OutputStream;
    .end local v4           #size:I
    :cond_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .restart local v2       #in:Ljava/io/InputStream;
    goto :goto_0

    .line 112
    .restart local v0       #buffer:[B
    .restart local v3       #out:Ljava/io/OutputStream;
    .restart local v4       #size:I
    :cond_2
    const/4 v6, 0x0

    :try_start_3
    invoke-virtual {v3, v0, v6, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 113
    .end local v0           #buffer:[B
    .end local v4           #size:I
    :catchall_0
    move-exception v6

    .line 114
    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 115
    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 116
    .end local v3           #out:Ljava/io/OutputStream;
    :catchall_1
    move-exception v6

    .line 117
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 118
    if-eqz v5, :cond_3

    .line 119
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V

    .line 120
    :cond_3
    throw v6
.end method

.method private static doCompact(Lcom/bv/sync/ProgressNotification;)V
    .locals 12
    .parameter "progress"

    .prologue
    const/4 v11, 0x0

    .line 192
    const/16 v0, 0x64

    .line 194
    .local v0, LIMIT:I
    sget-object v9, Lcom/bv/wifisync/LocalFileEx;->dbHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    .line 195
    .local v8, readableDatabase:Landroid/database/sqlite/SQLiteDatabase;
    const-string v9, "select count(*) as count from FILES"

    invoke-virtual {v8, v9, v11}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 198
    .local v1, c:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 199
    const-string v9, "count"

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 201
    .local v2, count:I
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 204
    const/4 v4, 0x0

    .local v4, i:I
    const/4 v5, 0x0

    .local v5, offset:I
    :goto_0
    if-lt v5, v2, :cond_0

    .line 224
    return-void

    .line 200
    .end local v2           #count:I
    .end local v4           #i:I
    .end local v5           #offset:I
    :catchall_0
    move-exception v9

    .line 201
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 202
    throw v9

    .line 205
    .restart local v2       #count:I
    .restart local v4       #i:I
    .restart local v5       #offset:I
    :cond_0
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "select path from FILES limit 100 offset "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v11}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 207
    :cond_1
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v9

    if-nez v9, :cond_2

    .line 221
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 204
    add-int/lit8 v5, v5, 0x64

    goto :goto_0

    .line 208
    :cond_2
    :try_start_2
    const-string v9, "path"

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 209
    .local v6, path:Ljava/lang/String;
    new-instance v3, Lcom/bv/sync/LocalFile;

    invoke-direct {v3, v6}, Lcom/bv/sync/LocalFile;-><init>(Ljava/lang/String;)V

    .line 210
    .local v3, file:Lcom/bv/sync/LocalFile;
    invoke-virtual {v3}, Lcom/bv/sync/LocalFile;->exists()Z

    move-result v9

    if-nez v9, :cond_3

    .line 211
    invoke-static {v6}, Lcom/bv/wifisync/LocalFileEx;->remove(Ljava/lang/String;)V

    .line 212
    add-int/lit8 v5, v5, -0x1

    .line 214
    :cond_3
    if-eqz p0, :cond_1

    .line 215
    add-int/lit8 v4, v4, 0x1

    int-to-float v9, v4

    int-to-float v10, v2

    div-float/2addr v9, v10

    const/high16 v10, 0x42c8

    mul-float/2addr v9, v10

    float-to-int v7, v9

    .line 216
    .local v7, percent:I
    sget-object v9, Lcom/bv/sync/ProgressNotification$ProgressAction;->Synchronizing:Lcom/bv/sync/ProgressNotification$ProgressAction;

    invoke-interface {p0, v9, v7, v3}, Lcom/bv/sync/ProgressNotification;->update(Lcom/bv/sync/ProgressNotification$ProgressAction;ILcom/bv/sync/IFile;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 217
    new-instance v9, Ljava/util/concurrent/CancellationException;

    invoke-direct {v9}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 220
    .end local v3           #file:Lcom/bv/sync/LocalFile;
    .end local v6           #path:Ljava/lang/String;
    .end local v7           #percent:I
    :catchall_1
    move-exception v9

    .line 221
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 222
    throw v9
.end method

.method private static getBackupFile(Landroid/content/Context;)Ljava/io/File;
    .locals 6
    .parameter "context"

    .prologue
    .line 43
    const-string v0, ".bvaisoft"

    .line 44
    .local v0, companyName:Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 45
    .local v1, result:Ljava/io/File;
    if-eqz v1, :cond_0

    .line 46
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 47
    :cond_0
    if-eqz v1, :cond_1

    .line 48
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 49
    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 50
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    const-string v4, ".bvaisoft"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v4, "timestamps.db"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 52
    :goto_0
    return-object v2

    :cond_2
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    const-string v5, ".bvaisoft"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v4, "timestamps.db"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static getDbFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .parameter "context"

    .prologue
    .line 39
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "timestamps.db"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getOutput(Ljava/io/File;Lcom/bv/wifisync/LocalFileEx$Compression;)Ljava/io/OutputStream;
    .locals 3
    .parameter "file"
    .parameter "compression"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    sget-object v1, Lcom/bv/wifisync/LocalFileEx$Compression;->Encrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    if-ne p1, v1, :cond_0

    .line 125
    new-instance v0, Ljava/util/zip/ZipOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 126
    .local v0, result:Ljava/util/zip/ZipOutputStream;
    new-instance v1, Ljava/util/zip/ZipEntry;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 129
    .end local v0           #result:Ljava/util/zip/ZipOutputStream;
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    goto :goto_0
.end method

.method private static declared-synchronized init(Landroid/content/Context;)V
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    const-class v4, Lcom/bv/wifisync/LocalFileEx;

    monitor-enter v4

    :try_start_0
    sget-object v3, Lcom/bv/wifisync/LocalFileEx;->dbHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    if-nez v3, :cond_1

    .line 83
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->getDbFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 84
    .local v1, dbFile:Ljava/io/File;
    invoke-static {p0}, Lcom/bv/wifisync/LocalFileEx;->getBackupFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 85
    .local v0, backup:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 86
    sget-object v3, Lcom/bv/wifisync/LocalFileEx$Compression;->Decrypt:Lcom/bv/wifisync/LocalFileEx$Compression;

    invoke-static {v0, v1, v3}, Lcom/bv/wifisync/LocalFileEx;->copy(Ljava/io/File;Ljava/io/File;Lcom/bv/wifisync/LocalFileEx$Compression;)V

    .line 87
    :cond_0
    new-instance v3, Lcom/bv/wifisync/LocalFileEx$DBHelper;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/LocalFileEx$DBHelper;-><init>(Landroid/content/Context;)V

    sput-object v3, Lcom/bv/wifisync/LocalFileEx;->dbHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 88
    sget-object v3, Lcom/bv/wifisync/LocalFileEx;->dbHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 89
    .local v2, writableDatabase:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "insert or replace into FILES values(?,?,?);"

    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v3

    sput-object v3, Lcom/bv/wifisync/LocalFileEx;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    .line 90
    const-string v3, "delete from FILES where path=?;"

    invoke-virtual {v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v3

    sput-object v3, Lcom/bv/wifisync/LocalFileEx;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .end local v0           #backup:Ljava/io/File;
    .end local v1           #dbFile:Ljava/io/File;
    .end local v2           #writableDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :cond_1
    monitor-exit v4

    return-void

    .line 82
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method private static remove(Ljava/lang/String;)V
    .locals 3
    .parameter "absolutePath"

    .prologue
    .line 227
    sget-object v1, Lcom/bv/wifisync/LocalFileEx;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;

    monitor-enter v1

    .line 228
    :try_start_0
    sget-object v0, Lcom/bv/wifisync/LocalFileEx;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, p0}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 229
    const-class v2, Lcom/bv/wifisync/LocalFileEx;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 230
    :try_start_1
    sget-object v0, Lcom/bv/wifisync/LocalFileEx;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 229
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 227
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 233
    return-void

    .line 229
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0

    .line 227
    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method


# virtual methods
.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p0}, Lcom/bv/wifisync/LocalFileEx;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, path:Ljava/lang/String;
    invoke-super {p0}, Lcom/bv/sync/LocalFile;->delete()V

    .line 170
    invoke-static {v0}, Lcom/bv/wifisync/LocalFileEx;->remove(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public getLastModified()J
    .locals 12

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 134
    invoke-virtual {p0}, Lcom/bv/wifisync/LocalFileEx;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    .line 135
    .local v8, absolutePath:Ljava/lang/String;
    sget-object v0, Lcom/bv/wifisync/LocalFileEx;->dbHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "FILES"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "local_time"

    aput-object v3, v2, v6

    const-string v3, "remote_time"

    aput-object v3, v2, v4

    const-string v3, "path=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object v8, v4, v6

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 137
    .local v9, c:Landroid/database/Cursor;
    :try_start_0
    invoke-super {p0}, Lcom/bv/sync/LocalFile;->getLastModified()J

    move-result-wide v10

    .line 138
    .local v10, result:J
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    const-string v0, "local_time"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    cmp-long v0, v0, v10

    if-nez v0, :cond_1

    .line 140
    const-string v0, "remote_time"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v10

    .line 146
    :cond_0
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 144
    return-wide v10

    .line 142
    :cond_1
    :try_start_1
    invoke-static {v8}, Lcom/bv/wifisync/LocalFileEx;->remove(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 145
    .end local v10           #result:J
    :catchall_0
    move-exception v0

    .line 146
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 147
    throw v0
.end method

.method protected getNewFile(Ljava/io/File;)Lcom/bv/sync/LocalFile;
    .locals 1
    .parameter "file"

    .prologue
    .line 237
    new-instance v0, Lcom/bv/wifisync/LocalFileEx;

    invoke-direct {v0, p1}, Lcom/bv/wifisync/LocalFileEx;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public setLastModified(J)V
    .locals 8
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v1, p0, Lcom/bv/wifisync/LocalFileEx;->file:Ljava/io/File;

    invoke-virtual {v1, p1, p2}, Ljava/io/File;->setLastModified(J)Z

    move-result v0

    .line 153
    .local v0, success:Z
    if-nez v0, :cond_0

    .line 154
    sget-object v2, Lcom/bv/wifisync/LocalFileEx;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    monitor-enter v2

    .line 155
    :try_start_0
    sget-object v1, Lcom/bv/wifisync/LocalFileEx;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/bv/wifisync/LocalFileEx;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 156
    sget-object v1, Lcom/bv/wifisync/LocalFileEx;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    const/4 v3, 0x2

    invoke-virtual {p0}, Lcom/bv/wifisync/LocalFileEx;->getLastModified()J

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 157
    sget-object v1, Lcom/bv/wifisync/LocalFileEx;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    const/4 v3, 0x3

    invoke-virtual {v1, v3, p1, p2}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 158
    const-class v3, Lcom/bv/wifisync/LocalFileEx;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 159
    :try_start_1
    sget-object v1, Lcom/bv/wifisync/LocalFileEx;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    .line 160
    sget-wide v4, Lcom/bv/wifisync/LocalFileEx;->updateCount:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    sput-wide v4, Lcom/bv/wifisync/LocalFileEx;->updateCount:J

    .line 158
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 164
    :cond_0
    return-void

    .line 158
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1

    .line 154
    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1
.end method
