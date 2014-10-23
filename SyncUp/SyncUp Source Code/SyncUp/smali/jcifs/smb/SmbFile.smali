.class public Ljcifs/smb/SmbFile;
.super Ljava/net/URLConnection;
.source "SmbFile.java"

# interfaces
.implements Ljcifs/smb/SmbConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljcifs/smb/SmbFile$WriterThread;
    }
.end annotation


# static fields
.field public static final ATTR_ARCHIVE:I = 0x20

.field static final ATTR_COMPRESSED:I = 0x800

.field public static final ATTR_DIRECTORY:I = 0x10

.field static final ATTR_GET_MASK:I = 0x7fff

.field public static final ATTR_HIDDEN:I = 0x2

.field static final ATTR_NORMAL:I = 0x80

.field public static final ATTR_READONLY:I = 0x1

.field static final ATTR_SET_MASK:I = 0x30a7

.field public static final ATTR_SYSTEM:I = 0x4

.field static final ATTR_TEMPORARY:I = 0x100

.field public static final ATTR_VOLUME:I = 0x8

.field static final DEFAULT_ATTR_EXPIRATION_PERIOD:I = 0x1388

.field public static final FILE_NO_SHARE:I = 0x0

.field public static final FILE_SHARE_DELETE:I = 0x4

.field public static final FILE_SHARE_READ:I = 0x1

.field public static final FILE_SHARE_WRITE:I = 0x2

#the value of this static final field might be set in the static constructor
.field static final HASH_DOT:I = 0x0

#the value of this static final field might be set in the static constructor
.field static final HASH_DOT_DOT:I = 0x0

.field static final O_APPEND:I = 0x4

.field static final O_CREAT:I = 0x10

.field static final O_EXCL:I = 0x20

.field static final O_RDONLY:I = 0x1

.field static final O_RDWR:I = 0x3

.field static final O_TRUNC:I = 0x40

.field static final O_WRONLY:I = 0x2

.field public static final TYPE_COMM:I = 0x40

.field public static final TYPE_FILESYSTEM:I = 0x1

.field public static final TYPE_NAMED_PIPE:I = 0x10

.field public static final TYPE_PRINTER:I = 0x20

.field public static final TYPE_SERVER:I = 0x4

.field public static final TYPE_SHARE:I = 0x8

.field public static final TYPE_WORKGROUP:I = 0x2

.field static attrExpirationPeriod:J

.field protected static dfs:Ljcifs/smb/Dfs;

.field static ignoreCopyToException:Z

.field static log:Ljcifs/util/LogStream;


# instance fields
.field addressIndex:I

.field addresses:[Ljcifs/UniAddress;

.field private attrExpiration:J

.field private attributes:I

.field auth:Ljcifs/smb/NtlmPasswordAuthentication;

.field private blank_resp:Ljcifs/smb/SmbComBlankResponse;

.field private canon:Ljava/lang/String;

.field private createTime:J

.field private dfsReferral:Ljcifs/smb/DfsReferral;

.field fid:I

.field private isExists:Z

.field private lastModified:J

.field opened:Z

.field private share:Ljava/lang/String;

.field private shareAccess:I

.field private size:J

.field private sizeExpiration:J

.field tree:Ljcifs/smb/SmbTree;

.field tree_num:I

.field type:I

.field unc:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 356
    const-string v1, "."

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sput v1, Ljcifs/smb/SmbFile;->HASH_DOT:I

    .line 357
    const-string v1, ".."

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sput v1, Ljcifs/smb/SmbFile;->HASH_DOT_DOT:I

    .line 359
    invoke-static {}, Ljcifs/util/LogStream;->getInstance()Ljcifs/util/LogStream;

    move-result-object v1

    sput-object v1, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    .line 366
    :try_start_0
    const-string v1, "jcifs.Config"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 370
    .local v0, cnfe:Ljava/lang/ClassNotFoundException;
    :goto_0
    const-string v1, "jcifs.smb.client.attrExpirationPeriod"

    const-wide/16 v2, 0x1388

    invoke-static {v1, v2, v3}, Ljcifs/Config;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    sput-wide v1, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    .line 371
    const-string v1, "jcifs.smb.client.ignoreCopyToException"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Ljcifs/Config;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Ljcifs/smb/SmbFile;->ignoreCopyToException:Z

    .line 372
    new-instance v1, Ljcifs/smb/Dfs;

    invoke-direct {v1}, Ljcifs/smb/Dfs;-><init>()V

    sput-object v1, Ljcifs/smb/SmbFile;->dfs:Ljcifs/smb/Dfs;

    .line 425
    return-void

    .line 367
    .end local v0           #cnfe:Ljava/lang/ClassNotFoundException;
    :catch_0
    move-exception v0

    .line 368
    .restart local v0       #cnfe:Ljava/lang/ClassNotFoundException;
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 446
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p1, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    invoke-direct {p0, v0}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;)V

    .line 447
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "context"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 485
    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/net/URL;

    const/4 v2, 0x0

    sget-object v3, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v1, v2, p1, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    .line 486
    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p2, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    invoke-direct {p0, v0}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;)V

    .line 487
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V
    .locals 4
    .parameter "context"
    .parameter "name"
    .parameter "auth"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 539
    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/net/URL;

    const/4 v2, 0x0

    sget-object v3, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v1, v2, p1, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p2, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    invoke-direct {p0, v0, p3}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 540
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;I)V
    .locals 4
    .parameter "context"
    .parameter "name"
    .parameter "auth"
    .parameter "shareAccess"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 562
    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/net/URL;

    const/4 v2, 0x0

    sget-object v3, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v1, v2, p1, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p2, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    invoke-direct {p0, v0, p3}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 563
    and-int/lit8 v0, p4, -0x8

    if-eqz v0, :cond_0

    .line 564
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Illegal shareAccess parameter"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 566
    :cond_0
    iput p4, p0, Ljcifs/smb/SmbFile;->shareAccess:I

    .line 567
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V
    .locals 3
    .parameter "url"
    .parameter "auth"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 500
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p1, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    invoke-direct {p0, v0, p2}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 501
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;I)V
    .locals 3
    .parameter "url"
    .parameter "auth"
    .parameter "shareAccess"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 518
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p1, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    invoke-direct {p0, v0, p2}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 519
    and-int/lit8 v0, p3, -0x8

    if-eqz v0, :cond_0

    .line 520
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Illegal shareAccess parameter"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 522
    :cond_0
    iput p3, p0, Ljcifs/smb/SmbFile;->shareAccess:I

    .line 523
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 603
    new-instance v0, Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {p1}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 604
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V
    .locals 2
    .parameter "url"
    .parameter "auth"

    .prologue
    const/4 v1, 0x0

    .line 614
    invoke-direct {p0, p1}, Ljava/net/URLConnection;-><init>(Ljava/net/URL;)V

    .line 421
    const/4 v0, 0x7

    iput v0, p0, Ljcifs/smb/SmbFile;->shareAccess:I

    .line 422
    iput-object v1, p0, Ljcifs/smb/SmbFile;->blank_resp:Ljcifs/smb/SmbComBlankResponse;

    .line 423
    iput-object v1, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    .line 428
    iput-object v1, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    .line 615
    if-nez p2, :cond_0

    new-instance p2, Ljcifs/smb/NtlmPasswordAuthentication;

    .end local p2
    invoke-virtual {p1}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljcifs/smb/NtlmPasswordAuthentication;-><init>(Ljava/lang/String;)V

    :cond_0
    iput-object p2, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 617
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 618
    return-void
.end method

.method public constructor <init>(Ljcifs/smb/SmbFile;Ljava/lang/String;)V
    .locals 4
    .parameter "context"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 466
    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->isWorkgroup0()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 467
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "smb://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, v2, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    .line 468
    :goto_0
    iget-object v1, p1, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {p0, v0, v1}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 469
    return-void

    .line 468
    :cond_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p1, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p2, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljcifs/smb/SmbFile;Ljava/lang/String;I)V
    .locals 4
    .parameter "context"
    .parameter "name"
    .parameter "shareAccess"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 588
    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->isWorkgroup0()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 589
    new-instance v0, Ljava/net/URL;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "smb://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, v2, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    .line 590
    :goto_0
    iget-object v1, p1, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {p0, v0, v1}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;Ljcifs/smb/NtlmPasswordAuthentication;)V

    .line 591
    and-int/lit8 v0, p3, -0x8

    if-eqz v0, :cond_1

    .line 592
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Illegal shareAccess parameter"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 590
    :cond_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p1, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    sget-object v2, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v0, v1, p2, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    goto :goto_0

    .line 594
    :cond_1
    iput p3, p0, Ljcifs/smb/SmbFile;->shareAccess:I

    .line 595
    return-void
.end method

.method constructor <init>(Ljcifs/smb/SmbFile;Ljava/lang/String;IIJJJ)V
    .locals 5
    .parameter "context"
    .parameter "name"
    .parameter "type"
    .parameter "attributes"
    .parameter "createTime"
    .parameter "lastModified"
    .parameter "size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 622
    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->isWorkgroup0()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 623
    new-instance v1, Ljava/net/URL;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "smb://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljcifs/smb/Handler;->SMB_HANDLER:Ljava/net/URLStreamHandler;

    invoke-direct {v1, v2, v3, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;Ljava/net/URLStreamHandler;)V

    .line 624
    :goto_0
    invoke-direct {p0, v1}, Ljcifs/smb/SmbFile;-><init>(Ljava/net/URL;)V

    .line 627
    iget-object v1, p1, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    iput-object v1, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 630
    iget-object v1, p1, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 631
    iget-object v1, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iput-object v1, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    .line 632
    iget-object v1, p1, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    iput-object v1, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    .line 634
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 635
    .local v0, last:I
    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_1

    .line 636
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 638
    :cond_1
    iget-object v1, p1, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 639
    const-string v1, "\\"

    iput-object v1, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    .line 648
    :goto_1
    iput p3, p0, Ljcifs/smb/SmbFile;->type:I

    .line 649
    iput p4, p0, Ljcifs/smb/SmbFile;->attributes:I

    .line 650
    iput-wide p5, p0, Ljcifs/smb/SmbFile;->createTime:J

    .line 651
    iput-wide p7, p0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 652
    iput-wide p9, p0, Ljcifs/smb/SmbFile;->size:J

    .line 653
    const/4 v1, 0x1

    iput-boolean v1, p0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 656
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v1, v3

    .line 655
    iput-wide v1, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    iput-wide v1, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 657
    return-void

    .line 624
    .end local v0           #last:I
    :cond_2
    new-instance v2, Ljava/net/URL;

    iget-object v3, p1, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    and-int/lit8 v1, p4, 0x10

    if-lez v1, :cond_3

    const-string v1, "/"

    :goto_2
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    move-object v1, v2

    goto :goto_0

    :cond_3
    const-string v1, ""

    goto :goto_2

    .line 640
    .restart local v0       #last:I
    :cond_4
    iget-object v1, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    const-string v2, "\\"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 641
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x5c

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    goto :goto_1

    .line 643
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x5c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    goto :goto_1
.end method

.method private blank_resp()Ljcifs/smb/SmbComBlankResponse;
    .locals 1

    .prologue
    .line 660
    iget-object v0, p0, Ljcifs/smb/SmbFile;->blank_resp:Ljcifs/smb/SmbComBlankResponse;

    if-nez v0, :cond_0

    .line 661
    new-instance v0, Ljcifs/smb/SmbComBlankResponse;

    invoke-direct {v0}, Ljcifs/smb/SmbComBlankResponse;-><init>()V

    iput-object v0, p0, Ljcifs/smb/SmbFile;->blank_resp:Ljcifs/smb/SmbComBlankResponse;

    .line 663
    :cond_0
    iget-object v0, p0, Ljcifs/smb/SmbFile;->blank_resp:Ljcifs/smb/SmbComBlankResponse;

    return-object v0
.end method

.method private processAces([Ljcifs/smb/ACE;Z)V
    .locals 8
    .parameter "aces"
    .parameter "resolveSids"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2857
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServerWithDfs()Ljava/lang/String;

    move-result-object v4

    .line 2860
    .local v4, server:Ljava/lang/String;
    if-eqz p2, :cond_4

    .line 2861
    array-length v6, p1

    new-array v5, v6, [Ljcifs/smb/SID;

    .line 2862
    .local v5, sids:[Ljcifs/smb/SID;
    const/4 v2, 0x0

    .line 2864
    .local v2, names:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, ai:I
    :goto_0
    array-length v6, p1

    if-lt v0, v6, :cond_1

    .line 2868
    const/4 v3, 0x0

    .local v3, off:I
    :goto_1
    array-length v6, v5

    if-lt v3, v6, :cond_2

    .line 2880
    .end local v2           #names:[Ljava/lang/String;
    .end local v3           #off:I
    .end local v5           #sids:[Ljcifs/smb/SID;
    :cond_0
    return-void

    .line 2865
    .restart local v2       #names:[Ljava/lang/String;
    .restart local v5       #sids:[Ljcifs/smb/SID;
    :cond_1
    aget-object v6, p1, v0

    iget-object v6, v6, Ljcifs/smb/ACE;->sid:Ljcifs/smb/SID;

    aput-object v6, v5, v0

    .line 2864
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2869
    .restart local v3       #off:I
    :cond_2
    array-length v6, v5

    sub-int v1, v6, v3

    .line 2870
    .local v1, len:I
    const/16 v6, 0x40

    if-le v1, v6, :cond_3

    .line 2871
    const/16 v1, 0x40

    .line 2872
    :cond_3
    iget-object v6, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-static {v4, v6, v5, v3, v1}, Ljcifs/smb/SID;->resolveSids(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;[Ljcifs/smb/SID;II)V

    .line 2868
    add-int/lit8 v3, v3, 0x40

    goto :goto_1

    .line 2875
    .end local v0           #ai:I
    .end local v1           #len:I
    .end local v2           #names:[Ljava/lang/String;
    .end local v3           #off:I
    .end local v5           #sids:[Ljcifs/smb/SID;
    :cond_4
    const/4 v0, 0x0

    .restart local v0       #ai:I
    :goto_2
    array-length v6, p1

    if-ge v0, v6, :cond_0

    .line 2876
    aget-object v6, p1, v0

    iget-object v6, v6, Ljcifs/smb/ACE;->sid:Ljcifs/smb/SID;

    iput-object v4, v6, Ljcifs/smb/SID;->origin_server:Ljava/lang/String;

    .line 2877
    aget-object v6, p1, v0

    iget-object v6, v6, Ljcifs/smb/ACE;->sid:Ljcifs/smb/SID;

    iget-object v7, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    iput-object v7, v6, Ljcifs/smb/SID;->origin_auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 2875
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private queryFSInformation(I)J
    .locals 5
    .parameter "level"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2493
    new-instance v0, Ljcifs/smb/Trans2QueryFSInformationResponse;

    invoke-direct {v0, p1}, Ljcifs/smb/Trans2QueryFSInformationResponse;-><init>(I)V

    .line 2494
    .local v0, response:Ljcifs/smb/Trans2QueryFSInformationResponse;
    new-instance v1, Ljcifs/smb/Trans2QueryFSInformation;

    invoke-direct {v1, p1}, Ljcifs/smb/Trans2QueryFSInformation;-><init>(I)V

    invoke-virtual {p0, v1, v0}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2496
    iget v1, p0, Ljcifs/smb/SmbFile;->type:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 2497
    iget-object v1, v0, Ljcifs/smb/Trans2QueryFSInformationResponse;->info:Ljcifs/smb/AllocInfo;

    invoke-interface {v1}, Ljcifs/smb/AllocInfo;->getCapacity()J

    move-result-wide v1

    iput-wide v1, p0, Ljcifs/smb/SmbFile;->size:J

    .line 2498
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    .line 2501
    :cond_0
    iget-object v1, v0, Ljcifs/smb/Trans2QueryFSInformationResponse;->info:Ljcifs/smb/AllocInfo;

    invoke-interface {v1}, Ljcifs/smb/AllocInfo;->getFree()J

    move-result-wide v1

    return-wide v1
.end method

.method static queryLookup(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "query"
    .parameter "param"

    .prologue
    .line 787
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 790
    .local v3, in:[C
    const/4 v1, 0x0

    .local v1, eq:I
    move v5, v1

    .line 791
    .local v5, st:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v6, v3

    if-lt v2, v6, :cond_0

    .line 806
    if-le v1, v5, :cond_4

    .line 807
    new-instance v4, Ljava/lang/String;

    sub-int v6, v1, v5

    invoke-direct {v4, v3, v5, v6}, Ljava/lang/String;-><init>([CII)V

    .line 808
    .local v4, p:Ljava/lang/String;
    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 809
    add-int/lit8 v1, v1, 0x1

    .line 810
    new-instance v6, Ljava/lang/String;

    array-length v7, v3

    sub-int/2addr v7, v1

    invoke-direct {v6, v3, v1, v7}, Ljava/lang/String;-><init>([CII)V

    .line 814
    .end local v4           #p:Ljava/lang/String;
    :goto_1
    return-object v6

    .line 792
    :cond_0
    aget-char v0, v3, v2

    .line 793
    .local v0, ch:I
    const/16 v6, 0x26

    if-ne v0, v6, :cond_3

    .line 794
    if-le v1, v5, :cond_1

    .line 795
    new-instance v4, Ljava/lang/String;

    sub-int v6, v1, v5

    invoke-direct {v4, v3, v5, v6}, Ljava/lang/String;-><init>([CII)V

    .line 796
    .restart local v4       #p:Ljava/lang/String;
    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 797
    add-int/lit8 v1, v1, 0x1

    .line 798
    new-instance v6, Ljava/lang/String;

    sub-int v7, v2, v1

    invoke-direct {v6, v3, v1, v7}, Ljava/lang/String;-><init>([CII)V

    goto :goto_1

    .line 801
    .end local v4           #p:Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v2, 0x1

    .line 791
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 802
    :cond_3
    const/16 v6, 0x3d

    if-ne v0, v6, :cond_2

    .line 803
    move v1, v2

    goto :goto_2

    .line 814
    .end local v0           #ch:I
    :cond_4
    const/4 v6, 0x0

    goto :goto_1
.end method


# virtual methods
.method public canRead()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1456
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    .line 1457
    const/4 v0, 0x1

    .line 1459
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    move-result v0

    goto :goto_0
.end method

.method public canWrite()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1474
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_1

    .line 1477
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1033
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljcifs/smb/SmbFile;->close(J)V

    .line 1034
    return-void
.end method

.method close(IJ)V
    .locals 3
    .parameter "f"
    .parameter "lastWriteTime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1016
    sget v0, Ljcifs/util/LogStream;->level:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 1017
    sget-object v0, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "close: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 1023
    :cond_0
    new-instance v0, Ljcifs/smb/SmbComClose;

    invoke-direct {v0, p1, p2, p3}, Ljcifs/smb/SmbComClose;-><init>(IJ)V

    invoke-direct {p0}, Ljcifs/smb/SmbFile;->blank_resp()Ljcifs/smb/SmbComBlankResponse;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 1024
    return-void
.end method

.method close(J)V
    .locals 1
    .parameter "lastWriteTime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1026
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1031
    :goto_0
    return-void

    .line 1029
    :cond_0
    iget v0, p0, Ljcifs/smb/SmbFile;->fid:I

    invoke-virtual {p0, v0, p1, p2}, Ljcifs/smb/SmbFile;->close(IJ)V

    .line 1030
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljcifs/smb/SmbFile;->opened:Z

    goto :goto_0
.end method

.method public connect()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 946
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 955
    :goto_0
    return-void

    .line 950
    :cond_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 951
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getFirstAddress()Ljcifs/UniAddress;

    .line 954
    :cond_1
    :goto_1
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->doConnect()V
    :try_end_0
    .catch Ljcifs/smb/SmbAuthException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 956
    :catch_0
    move-exception v0

    .line 957
    .local v0, sae:Ljcifs/smb/SmbAuthException;
    throw v0

    .line 958
    .end local v0           #sae:Ljcifs/smb/SmbAuthException;
    :catch_1
    move-exception v1

    .line 959
    .local v1, se:Ljcifs/smb/SmbException;
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getNextAddress()Ljcifs/UniAddress;

    move-result-object v2

    if-nez v2, :cond_2

    .line 960
    throw v1

    .line 961
    :cond_2
    sget v2, Ljcifs/util/LogStream;->level:I

    const/4 v3, 0x3

    if-lt v2, v3, :cond_1

    .line 962
    sget-object v2, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v2}, Ljcifs/smb/SmbException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1
.end method

.method connect0()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 880
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->connect()V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 888
    return-void

    .line 881
    :catch_0
    move-exception v2

    .line 882
    .local v2, uhe:Ljava/net/UnknownHostException;
    new-instance v3, Ljcifs/smb/SmbException;

    const-string v4, "Failed to connect to server"

    invoke-direct {v3, v4, v2}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 883
    .end local v2           #uhe:Ljava/net/UnknownHostException;
    :catch_1
    move-exception v1

    .line 884
    .local v1, se:Ljcifs/smb/SmbException;
    throw v1

    .line 885
    .end local v1           #se:Ljcifs/smb/SmbException;
    :catch_2
    move-exception v0

    .line 886
    .local v0, ioe:Ljava/io/IOException;
    new-instance v3, Ljcifs/smb/SmbException;

    const-string v4, "Failed to connect to server"

    invoke-direct {v3, v4, v0}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public copyTo(Ljcifs/smb/SmbFile;)V
    .locals 17
    .parameter "dest"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2293
    move-object/from16 v0, p0

    iget-object v1, v0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-eqz v1, :cond_0

    move-object/from16 v0, p1

    iget-object v1, v0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 2294
    :cond_0
    new-instance v1, Ljcifs/smb/SmbException;

    const-string v2, "Invalid operation for workgroups or servers"

    invoke-direct {v1, v2}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2297
    :cond_1
    new-instance v14, Ljcifs/smb/SmbComReadAndX;

    invoke-direct {v14}, Ljcifs/smb/SmbComReadAndX;-><init>()V

    .line 2298
    .local v14, req:Ljcifs/smb/SmbComReadAndX;
    new-instance v7, Ljcifs/smb/SmbComReadAndXResponse;

    invoke-direct {v7}, Ljcifs/smb/SmbComReadAndXResponse;-><init>()V

    .line 2300
    .local v7, resp:Ljcifs/smb/SmbComReadAndXResponse;
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->connect0()V

    .line 2301
    invoke-virtual/range {p1 .. p1}, Ljcifs/smb/SmbFile;->connect0()V

    .line 2312
    const/4 v1, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Ljcifs/smb/SmbFile;->resolveDfs(Ljcifs/smb/ServerMessageBlock;)V

    .line 2318
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljcifs/UniAddress;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2319
    move-object/from16 v0, p0

    iget-object v1, v0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object/from16 v0, p1

    iget-object v4, v0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    const/4 v5, 0x0

    .line 2320
    move-object/from16 v0, p0

    iget-object v6, v0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, p1

    iget-object v8, v0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 2319
    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    .line 2320
    if-eqz v1, :cond_2

    .line 2321
    new-instance v1, Ljcifs/smb/SmbException;

    const-string v2, "Source and destination paths overlap."

    invoke-direct {v1, v2}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2323
    :catch_0
    move-exception v1

    .line 2326
    :cond_2
    new-instance v5, Ljcifs/smb/SmbFile$WriterThread;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Ljcifs/smb/SmbFile$WriterThread;-><init>(Ljcifs/smb/SmbFile;)V

    .line 2327
    .local v5, w:Ljcifs/smb/SmbFile$WriterThread;
    const/4 v1, 0x1

    invoke-virtual {v5, v1}, Ljcifs/smb/SmbFile$WriterThread;->setDaemon(Z)V

    .line 2328
    invoke-virtual {v5}, Ljcifs/smb/SmbFile$WriterThread;->start()V

    .line 2334
    move-object/from16 v0, p0

    iget-object v1, v0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, v1, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v15, v1, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    .line 2335
    .local v15, t1:Ljcifs/smb/SmbTransport;
    move-object/from16 v0, p1

    iget-object v1, v0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, v1, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v0, v1, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    move-object/from16 v16, v0

    .line 2337
    .local v16, t2:Ljcifs/smb/SmbTransport;
    iget v1, v15, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    move-object/from16 v0, v16

    iget v2, v0, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    if-ge v1, v2, :cond_3

    .line 2338
    iget v1, v15, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    move-object/from16 v0, v16

    iput v1, v0, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    .line 2343
    :goto_0
    iget v1, v15, Ljcifs/smb/SmbTransport;->rcv_buf_size:I

    add-int/lit8 v1, v1, -0x46

    iget v2, v15, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    add-int/lit8 v2, v2, -0x46

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 2344
    .local v4, bsize:I
    const/4 v1, 0x2

    filled-new-array {v1, v4}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[B

    .local v3, b:[[B
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v6, v14

    .line 2347
    :try_start_1
    invoke-virtual/range {v1 .. v7}, Ljcifs/smb/SmbFile;->copyTo0(Ljcifs/smb/SmbFile;[[BILjcifs/smb/SmbFile$WriterThread;Ljcifs/smb/SmbComReadAndX;Ljcifs/smb/SmbComReadAndXResponse;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2349
    const/4 v9, 0x0

    const/4 v10, -0x1

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    move-object v8, v5

    invoke-virtual/range {v8 .. v13}, Ljcifs/smb/SmbFile$WriterThread;->write([BILjcifs/smb/SmbFile;J)V

    .line 2351
    return-void

    .line 2340
    .end local v3           #b:[[B
    .end local v4           #bsize:I
    :cond_3
    move-object/from16 v0, v16

    iget v1, v0, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    iput v1, v15, Ljcifs/smb/SmbTransport;->snd_buf_size:I

    goto :goto_0

    .line 2348
    .restart local v3       #b:[[B
    .restart local v4       #bsize:I
    :catchall_0
    move-exception v1

    .line 2349
    const/4 v9, 0x0

    const/4 v10, -0x1

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    move-object v8, v5

    invoke-virtual/range {v8 .. v13}, Ljcifs/smb/SmbFile$WriterThread;->write([BILjcifs/smb/SmbFile;J)V

    .line 2350
    throw v1
.end method

.method copyTo0(Ljcifs/smb/SmbFile;[[BILjcifs/smb/SmbFile$WriterThread;Ljcifs/smb/SmbComReadAndX;Ljcifs/smb/SmbComReadAndXResponse;)V
    .locals 26
    .parameter "dest"
    .parameter "b"
    .parameter "bsize"
    .parameter "w"
    .parameter "req"
    .parameter "resp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2146
    move-object/from16 v0, p0

    iget-wide v4, v0, Ljcifs/smb/SmbFile;->attrExpiration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 2147
    const/16 v4, 0x11

    move-object/from16 v0, p0

    iput v4, v0, Ljcifs/smb/SmbFile;->attributes:I

    .line 2148
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Ljcifs/smb/SmbFile;->createTime:J

    .line 2149
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 2150
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 2152
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v4

    .line 2153
    const/16 v5, 0x101

    .line 2152
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Ljcifs/smb/SmbFile;->queryPath(Ljava/lang/String;I)Ljcifs/smb/Info;

    move-result-object v20

    .line 2154
    .local v20, info:Ljcifs/smb/Info;
    invoke-interface/range {v20 .. v20}, Ljcifs/smb/Info;->getAttributes()I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Ljcifs/smb/SmbFile;->attributes:I

    .line 2155
    invoke-interface/range {v20 .. v20}, Ljcifs/smb/Info;->getCreateTime()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Ljcifs/smb/SmbFile;->createTime:J

    .line 2156
    invoke-interface/range {v20 .. v20}, Ljcifs/smb/Info;->getLastWriteTime()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 2161
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 2162
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-wide v6, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v4, v6

    move-object/from16 v0, p0

    iput-wide v4, v0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2165
    .end local v20           #info:Ljcifs/smb/Info;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2169
    invoke-virtual/range {p1 .. p1}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v22

    .line 2170
    .local v22, path:Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_1

    .line 2172
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljcifs/smb/SmbFile;->mkdir()V

    .line 2173
    move-object/from16 v0, p0

    iget v4, v0, Ljcifs/smb/SmbFile;->attributes:I

    move-object/from16 v0, p0

    iget-wide v5, v0, Ljcifs/smb/SmbFile;->createTime:J

    move-object/from16 v0, p0

    iget-wide v7, v0, Ljcifs/smb/SmbFile;->lastModified:J

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Ljcifs/smb/SmbFile;->setPathInformation(IJJ)V
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2182
    :cond_1
    const-string v4, "*"

    const/16 v5, 0x16

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v6, v7}, Ljcifs/smb/SmbFile;->listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v17

    .line 2184
    .local v17, files:[Ljcifs/smb/SmbFile;
    const/16 v18, 0x0

    .local v18, i:I
    :goto_0
    :try_start_1
    move-object/from16 v0, v17

    array-length v4, v0
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_2

    move/from16 v0, v18

    if-lt v0, v4, :cond_2

    .line 2267
    .end local v17           #files:[Ljcifs/smb/SmbFile;
    .end local v18           #i:I
    .end local v22           #path:Ljava/lang/String;
    :goto_1
    return-void

    .line 2174
    .restart local v22       #path:Ljava/lang/String;
    :catch_0
    move-exception v24

    .line 2175
    .local v24, se:Ljcifs/smb/SmbException;
    invoke-virtual/range {v24 .. v24}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v4

    const v5, -0x3fffffde

    if-eq v4, v5, :cond_1

    .line 2176
    invoke-virtual/range {v24 .. v24}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v4

    const v5, -0x3fffffcb

    if-eq v4, v5, :cond_1

    .line 2177
    throw v24

    .line 2185
    .end local v24           #se:Ljcifs/smb/SmbException;
    .restart local v17       #files:[Ljcifs/smb/SmbFile;
    .restart local v18       #i:I
    :cond_2
    :try_start_2
    new-instance v3, Ljcifs/smb/SmbFile;

    .line 2186
    aget-object v4, v17, v18

    invoke-virtual {v4}, Ljcifs/smb/SmbFile;->getName()Ljava/lang/String;

    move-result-object v5

    .line 2187
    aget-object v4, v17, v18

    iget v6, v4, Ljcifs/smb/SmbFile;->type:I

    .line 2188
    aget-object v4, v17, v18

    iget v7, v4, Ljcifs/smb/SmbFile;->attributes:I

    .line 2189
    aget-object v4, v17, v18

    iget-wide v8, v4, Ljcifs/smb/SmbFile;->createTime:J

    .line 2190
    aget-object v4, v17, v18

    iget-wide v10, v4, Ljcifs/smb/SmbFile;->lastModified:J

    .line 2191
    aget-object v4, v17, v18

    iget-wide v12, v4, Ljcifs/smb/SmbFile;->size:J

    move-object/from16 v4, p1

    .line 2185
    invoke-direct/range {v3 .. v13}, Ljcifs/smb/SmbFile;-><init>(Ljcifs/smb/SmbFile;Ljava/lang/String;IIJJJ)V

    .line 2192
    .local v3, ndest:Ljcifs/smb/SmbFile;
    aget-object v4, v17, v18

    move-object v5, v3

    move-object/from16 v6, p2

    move/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    invoke-virtual/range {v4 .. v10}, Ljcifs/smb/SmbFile;->copyTo0(Ljcifs/smb/SmbFile;[[BILjcifs/smb/SmbFile$WriterThread;Ljcifs/smb/SmbComReadAndX;Ljcifs/smb/SmbComReadAndXResponse;)V
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_2

    .line 2184
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 2194
    .end local v3           #ndest:Ljcifs/smb/SmbFile;
    :catch_1
    move-exception v25

    .line 2195
    .local v25, uhe:Ljava/net/UnknownHostException;
    new-instance v4, Ljcifs/smb/SmbException;

    move-object/from16 v0, p0

    iget-object v5, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v25

    invoke-direct {v4, v5, v0}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2196
    .end local v25           #uhe:Ljava/net/UnknownHostException;
    :catch_2
    move-exception v21

    .line 2197
    .local v21, mue:Ljava/net/MalformedURLException;
    new-instance v4, Ljcifs/smb/SmbException;

    move-object/from16 v0, p0

    iget-object v5, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-direct {v4, v5, v0}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2203
    .end local v17           #files:[Ljcifs/smb/SmbFile;
    .end local v18           #i:I
    .end local v21           #mue:Ljava/net/MalformedURLException;
    .end local v22           #path:Ljava/lang/String;
    :cond_3
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v6, 0x80

    const/4 v7, 0x0

    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v6, v7}, Ljcifs/smb/SmbFile;->open(IIII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljcifs/smb/SmbException; {:try_start_3 .. :try_end_3} :catch_3

    .line 2205
    const/16 v4, 0x52

    .line 2206
    const/16 v5, 0x102

    .line 2207
    :try_start_4
    move-object/from16 v0, p0

    iget v6, v0, Ljcifs/smb/SmbFile;->attributes:I

    const/4 v7, 0x0

    .line 2205
    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6, v7}, Ljcifs/smb/SmbFile;->open(IIII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljcifs/smb/SmbAuthException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljcifs/smb/SmbException; {:try_start_4 .. :try_end_4} :catch_3

    .line 2221
    :goto_2
    const/16 v18, 0x0

    .line 2222
    .restart local v18       #i:I
    const-wide/16 v8, 0x0

    .line 2224
    .local v8, off:J
    :goto_3
    :try_start_5
    move-object/from16 v0, p0

    iget v4, v0, Ljcifs/smb/SmbFile;->fid:I

    move-object/from16 v0, p5

    move/from16 v1, p3

    invoke-virtual {v0, v4, v8, v9, v1}, Ljcifs/smb/SmbComReadAndX;->setParam(IJI)V

    .line 2225
    aget-object v4, p2, v18

    const/4 v5, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v4, v5}, Ljcifs/smb/SmbComReadAndXResponse;->setParam([BI)V

    .line 2226
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2228
    monitor-enter p4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljcifs/smb/SmbException; {:try_start_5 .. :try_end_5} :catch_3

    .line 2229
    :try_start_6
    move-object/from16 v0, p4

    iget-object v4, v0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;

    if-eqz v4, :cond_6

    .line 2230
    move-object/from16 v0, p4

    iget-object v4, v0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;

    throw v4

    .line 2228
    :catchall_0
    move-exception v4

    monitor-exit p4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1
    .catch Ljcifs/smb/SmbException; {:try_start_7 .. :try_end_7} :catch_3

    .line 2256
    .end local v8           #off:J
    .end local v18           #i:I
    :catch_3
    move-exception v24

    .line 2258
    .restart local v24       #se:Ljcifs/smb/SmbException;
    :try_start_8
    sget-boolean v4, Ljcifs/smb/SmbFile;->ignoreCopyToException:Z

    if-nez v4, :cond_a

    .line 2259
    new-instance v4, Ljcifs/smb/SmbException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Failed to copy file from ["

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] to ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Ljcifs/smb/SmbFile;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v24

    invoke-direct {v4, v5, v0}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 2263
    .end local v24           #se:Ljcifs/smb/SmbException;
    :catchall_1
    move-exception v4

    .line 2264
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->close()V

    .line 2265
    throw v4

    .line 2208
    :catch_4
    move-exception v23

    .line 2209
    .local v23, sae:Ljcifs/smb/SmbAuthException;
    :try_start_9
    move-object/from16 v0, p1

    iget v4, v0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_4

    .line 2212
    move-object/from16 v0, p1

    iget v4, v0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v5, v4, -0x2

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v9}, Ljcifs/smb/SmbFile;->setPathInformation(IJJ)V

    .line 2213
    const/16 v4, 0x52

    .line 2214
    const/16 v5, 0x102

    .line 2215
    move-object/from16 v0, p0

    iget v6, v0, Ljcifs/smb/SmbFile;->attributes:I

    const/4 v7, 0x0

    .line 2213
    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5, v6, v7}, Ljcifs/smb/SmbFile;->open(IIII)V

    goto/16 :goto_2

    .line 2217
    :cond_4
    throw v23
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1
    .catch Ljcifs/smb/SmbException; {:try_start_9 .. :try_end_9} :catch_3

    .line 2234
    .end local v23           #sae:Ljcifs/smb/SmbAuthException;
    .restart local v8       #off:J
    .restart local v18       #i:I
    :cond_5
    :try_start_a
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->wait()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_5

    .line 2232
    :cond_6
    :try_start_b
    move-object/from16 v0, p4

    iget-boolean v4, v0, Ljcifs/smb/SmbFile$WriterThread;->ready:Z

    if-eqz v4, :cond_5

    .line 2239
    move-object/from16 v0, p4

    iget-object v4, v0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;

    if-eqz v4, :cond_7

    .line 2240
    move-object/from16 v0, p4

    iget-object v4, v0, Ljcifs/smb/SmbFile$WriterThread;->e:Ljcifs/smb/SmbException;

    throw v4

    .line 2235
    :catch_5
    move-exception v19

    .line 2236
    .local v19, ie:Ljava/lang/InterruptedException;
    new-instance v4, Ljcifs/smb/SmbException;

    move-object/from16 v0, p1

    iget-object v5, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v19

    invoke-direct {v4, v5, v0}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2242
    .end local v19           #ie:Ljava/lang/InterruptedException;
    :cond_7
    move-object/from16 v0, p6

    iget v4, v0, Ljcifs/smb/SmbComReadAndXResponse;->dataLength:I

    if-gtz v4, :cond_8

    .line 2243
    monitor-exit p4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 2252
    :try_start_c
    new-instance v10, Ljcifs/smb/Trans2SetFileInformation;

    .line 2253
    move-object/from16 v0, p1

    iget v11, v0, Ljcifs/smb/SmbFile;->fid:I

    move-object/from16 v0, p0

    iget v12, v0, Ljcifs/smb/SmbFile;->attributes:I

    move-object/from16 v0, p0

    iget-wide v13, v0, Ljcifs/smb/SmbFile;->createTime:J

    move-object/from16 v0, p0

    iget-wide v15, v0, Ljcifs/smb/SmbFile;->lastModified:J

    invoke-direct/range {v10 .. v16}, Ljcifs/smb/Trans2SetFileInformation;-><init>(IIJJ)V

    .line 2254
    new-instance v4, Ljcifs/smb/Trans2SetFileInformationResponse;

    invoke-direct {v4}, Ljcifs/smb/Trans2SetFileInformationResponse;-><init>()V

    .line 2252
    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v4}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2255
    const-wide/16 v4, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5}, Ljcifs/smb/SmbFile;->close(J)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1
    .catch Ljcifs/smb/SmbException; {:try_start_c .. :try_end_c} :catch_3

    .line 2264
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->close()V

    goto/16 :goto_1

    .line 2245
    :cond_8
    :try_start_d
    aget-object v5, p2, v18

    move-object/from16 v0, p6

    iget v6, v0, Ljcifs/smb/SmbComReadAndXResponse;->dataLength:I

    move-object/from16 v4, p4

    move-object/from16 v7, p1

    invoke-virtual/range {v4 .. v9}, Ljcifs/smb/SmbFile$WriterThread;->write([BILjcifs/smb/SmbFile;J)V

    .line 2228
    monitor-exit p4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 2248
    const/4 v4, 0x1

    move/from16 v0, v18

    if-ne v0, v4, :cond_9

    const/16 v18, 0x0

    .line 2249
    :goto_4
    :try_start_e
    move-object/from16 v0, p6

    iget v4, v0, Ljcifs/smb/SmbComReadAndXResponse;->dataLength:I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1
    .catch Ljcifs/smb/SmbException; {:try_start_e .. :try_end_e} :catch_3

    int-to-long v4, v4

    add-long/2addr v8, v4

    .line 2223
    goto/16 :goto_3

    .line 2248
    :cond_9
    const/16 v18, 0x1

    goto :goto_4

    .line 2261
    .end local v8           #off:J
    .end local v18           #i:I
    .restart local v24       #se:Ljcifs/smb/SmbException;
    :cond_a
    :try_start_f
    sget v4, Ljcifs/util/LogStream;->level:I

    const/4 v5, 0x1

    if-le v4, v5, :cond_b

    .line 2262
    sget-object v4, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljcifs/smb/SmbException;->printStackTrace(Ljava/io/PrintStream;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 2264
    :cond_b
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->close()V

    goto/16 :goto_1
.end method

.method public createNewFile()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 2564
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2565
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v0, v1}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2567
    :cond_0
    const/16 v0, 0x33

    const/16 v1, 0x80

    invoke-virtual {p0, v0, v2, v1, v2}, Ljcifs/smb/SmbFile;->open0(IIII)I

    move-result v0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Ljcifs/smb/SmbFile;->close(IJ)V

    .line 2568
    return-void
.end method

.method public createTime()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1561
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 1562
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 1563
    iget-wide v0, p0, Ljcifs/smb/SmbFile;->createTime:J

    .line 1565
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2363
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 2364
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 2365
    iget-object v0, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljcifs/smb/SmbFile;->delete(Ljava/lang/String;)V

    .line 2366
    return-void
.end method

.method delete(Ljava/lang/String;)V
    .locals 11
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const-wide/16 v8, 0x0

    .line 2368
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v4, v10, :cond_0

    .line 2369
    new-instance v4, Ljcifs/smb/SmbException;

    const-string v5, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v4, v5}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2372
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 2373
    const/16 v4, 0x11

    iput v4, p0, Ljcifs/smb/SmbFile;->attributes:I

    .line 2374
    iput-wide v8, p0, Ljcifs/smb/SmbFile;->createTime:J

    .line 2375
    iput-wide v8, p0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 2376
    const/4 v4, 0x0

    iput-boolean v4, p0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 2378
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v4

    .line 2379
    const/16 v5, 0x101

    .line 2378
    invoke-virtual {p0, v4, v5}, Ljcifs/smb/SmbFile;->queryPath(Ljava/lang/String;I)Ljcifs/smb/Info;

    move-result-object v1

    .line 2380
    .local v1, info:Ljcifs/smb/Info;
    invoke-interface {v1}, Ljcifs/smb/Info;->getAttributes()I

    move-result v4

    iput v4, p0, Ljcifs/smb/SmbFile;->attributes:I

    .line 2381
    invoke-interface {v1}, Ljcifs/smb/Info;->getCreateTime()J

    move-result-wide v4

    iput-wide v4, p0, Ljcifs/smb/SmbFile;->createTime:J

    .line 2382
    invoke-interface {v1}, Ljcifs/smb/Info;->getLastWriteTime()J

    move-result-wide v4

    iput-wide v4, p0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 2384
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-wide v6, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2385
    iput-boolean v10, p0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 2388
    .end local v1           #info:Ljcifs/smb/Info;
    :cond_1
    iget v4, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_2

    .line 2389
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->setReadWrite()V

    .line 2396
    :cond_2
    sget v4, Ljcifs/util/LogStream;->level:I

    const/4 v5, 0x3

    if-lt v4, v5, :cond_3

    .line 2397
    sget-object v4, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "delete: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 2399
    :cond_3
    iget v4, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v4, v4, 0x10

    if-eqz v4, :cond_6

    .line 2405
    :try_start_0
    const-string v4, "*"

    const/16 v5, 0x16

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {p0, v4, v5, v6, v7}, Ljcifs/smb/SmbFile;->listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v2

    .line 2406
    .local v2, l:[Ljcifs/smb/SmbFile;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v4, v2
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v0, v4, :cond_5

    .line 2419
    .end local v0           #i:I
    .end local v2           #l:[Ljcifs/smb/SmbFile;
    :cond_4
    new-instance v4, Ljcifs/smb/SmbComDeleteDirectory;

    invoke-direct {v4, p1}, Ljcifs/smb/SmbComDeleteDirectory;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Ljcifs/smb/SmbFile;->blank_resp()Ljcifs/smb/SmbComBlankResponse;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2424
    :goto_1
    iput-wide v8, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    iput-wide v8, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2425
    return-void

    .line 2407
    .restart local v0       #i:I
    .restart local v2       #l:[Ljcifs/smb/SmbFile;
    :cond_5
    :try_start_1
    aget-object v4, v2, v0

    invoke-virtual {v4}, Ljcifs/smb/SmbFile;->delete()V
    :try_end_1
    .catch Ljcifs/smb/SmbException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2406
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2409
    .end local v0           #i:I
    .end local v2           #l:[Ljcifs/smb/SmbFile;
    :catch_0
    move-exception v3

    .line 2414
    .local v3, se:Ljcifs/smb/SmbException;
    invoke-virtual {v3}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v4

    const v5, -0x3ffffff1

    if-eq v4, v5, :cond_4

    .line 2415
    throw v3

    .line 2421
    .end local v3           #se:Ljcifs/smb/SmbException;
    :cond_6
    new-instance v4, Ljcifs/smb/SmbComDelete;

    invoke-direct {v4, p1}, Ljcifs/smb/SmbComDelete;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Ljcifs/smb/SmbFile;->blank_resp()Ljcifs/smb/SmbComBlankResponse;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    goto :goto_1
.end method

.method doConnect()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v12, 0x0

    .line 893
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v1

    .line 894
    .local v1, addr:Ljcifs/UniAddress;
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    if-eqz v6, :cond_2

    .line 895
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v6, v6, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v5, v6, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    .line 901
    .local v5, trans:Ljcifs/smb/SmbTransport;
    :goto_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServerWithDfs()Ljava/lang/String;

    move-result-object v2

    .line 902
    .local v2, hostName:Ljava/lang/String;
    iget-object v9, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    sget-object v6, Ljcifs/smb/SmbFile;->dfs:Ljcifs/smb/Dfs;

    iget-object v10, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v10, v10, Ljcifs/smb/SmbTree;->share:Ljava/lang/String;

    iget-object v11, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v6, v2, v10, v12, v11}, Ljcifs/smb/Dfs;->resolve(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/DfsReferral;

    move-result-object v6

    if-eqz v6, :cond_3

    move v6, v7

    :goto_1
    iput-boolean v6, v9, Ljcifs/smb/SmbTree;->inDomainDfs:Z

    .line 903
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-boolean v6, v6, Ljcifs/smb/SmbTree;->inDomainDfs:Z

    if-eqz v6, :cond_0

    .line 904
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iput v13, v6, Ljcifs/smb/SmbTree;->connectionState:I

    .line 908
    :cond_0
    :try_start_0
    sget v6, Ljcifs/util/LogStream;->level:I

    const/4 v9, 0x3

    if-lt v6, v9, :cond_1

    .line 909
    sget-object v6, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "doConnect: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 911
    :cond_1
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Ljcifs/smb/SmbTree;->treeConnect(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_0
    .catch Ljcifs/smb/SmbAuthException; {:try_start_0 .. :try_end_0} :catch_0

    .line 936
    :goto_2
    return-void

    .line 897
    .end local v2           #hostName:Ljava/lang/String;
    .end local v5           #trans:Ljcifs/smb/SmbTransport;
    :cond_2
    iget-object v6, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->getPort()I

    move-result v6

    invoke-static {v1, v6}, Ljcifs/smb/SmbTransport;->getSmbTransport(Ljcifs/UniAddress;I)Ljcifs/smb/SmbTransport;

    move-result-object v5

    .line 898
    .restart local v5       #trans:Ljcifs/smb/SmbTransport;
    iget-object v6, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v5, v6}, Ljcifs/smb/SmbTransport;->getSmbSession(Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/SmbSession;

    move-result-object v6

    iget-object v9, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    invoke-virtual {v6, v9, v12}, Ljcifs/smb/SmbSession;->getSmbTree(Ljava/lang/String;Ljava/lang/String;)Ljcifs/smb/SmbTree;

    move-result-object v6

    iput-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    goto :goto_0

    .restart local v2       #hostName:Ljava/lang/String;
    :cond_3
    move v6, v8

    .line 902
    goto :goto_1

    .line 912
    :catch_0
    move-exception v3

    .line 916
    .local v3, sae:Ljcifs/smb/SmbAuthException;
    iget-object v6, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v6, :cond_4

    .line 917
    sget-object v6, Ljcifs/smb/NtlmPasswordAuthentication;->NULL:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v5, v6}, Ljcifs/smb/SmbTransport;->getSmbSession(Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/SmbSession;

    move-result-object v4

    .line 918
    .local v4, ssn:Ljcifs/smb/SmbSession;
    invoke-virtual {v4, v12, v12}, Ljcifs/smb/SmbSession;->getSmbTree(Ljava/lang/String;Ljava/lang/String;)Ljcifs/smb/SmbTree;

    move-result-object v6

    iput-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    .line 919
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    invoke-virtual {v6, v12, v12}, Ljcifs/smb/SmbTree;->treeConnect(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    goto :goto_2

    .line 921
    .end local v4           #ssn:Ljcifs/smb/SmbSession;
    :cond_4
    iget-object v6, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    .line 920
    invoke-static {v6, v3}, Ljcifs/smb/NtlmAuthenticator;->requestNtlmPasswordAuthentication(Ljava/lang/String;Ljcifs/smb/SmbAuthException;)Ljcifs/smb/NtlmPasswordAuthentication;

    move-result-object v0

    .local v0, a:Ljcifs/smb/NtlmPasswordAuthentication;
    if-eqz v0, :cond_7

    .line 922
    iput-object v0, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 923
    iget-object v6, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v5, v6}, Ljcifs/smb/SmbTransport;->getSmbSession(Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/SmbSession;

    move-result-object v4

    .line 924
    .restart local v4       #ssn:Ljcifs/smb/SmbSession;
    iget-object v6, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    invoke-virtual {v4, v6, v12}, Ljcifs/smb/SmbSession;->getSmbTree(Ljava/lang/String;Ljava/lang/String;)Ljcifs/smb/SmbTree;

    move-result-object v6

    iput-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    .line 925
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    sget-object v9, Ljcifs/smb/SmbFile;->dfs:Ljcifs/smb/Dfs;

    iget-object v10, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v10, v10, Ljcifs/smb/SmbTree;->share:Ljava/lang/String;

    iget-object v11, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v9, v2, v10, v12, v11}, Ljcifs/smb/Dfs;->resolve(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/DfsReferral;

    move-result-object v9

    if-eqz v9, :cond_6

    :goto_3
    iput-boolean v7, v6, Ljcifs/smb/SmbTree;->inDomainDfs:Z

    .line 926
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-boolean v6, v6, Ljcifs/smb/SmbTree;->inDomainDfs:Z

    if-eqz v6, :cond_5

    .line 927
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iput v13, v6, Ljcifs/smb/SmbTree;->connectionState:I

    .line 929
    :cond_5
    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    invoke-virtual {v6, v12, v12}, Ljcifs/smb/SmbTree;->treeConnect(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    goto :goto_2

    :cond_6
    move v7, v8

    .line 925
    goto :goto_3

    .line 931
    .end local v4           #ssn:Ljcifs/smb/SmbSession;
    :cond_7
    sget v6, Ljcifs/util/LogStream;->level:I

    if-lt v6, v7, :cond_8

    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->hasNextAddress()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 932
    sget-object v6, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v3, v6}, Ljcifs/smb/SmbAuthException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 933
    :cond_8
    throw v3
.end method

.method doDfsRootEnum()[Ljcifs/smb/FileEntry;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    .line 1838
    const/4 v0, 0x0

    .line 1841
    .local v0, handle:Ljcifs/dcerpc/DcerpcHandle;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ncacn_np:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1842
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljcifs/UniAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1843
    const-string v4, "[\\PIPE\\netdfs]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1841
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1843
    iget-object v4, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 1841
    invoke-static {v3, v4}, Ljcifs/dcerpc/DcerpcHandle;->getHandle(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;

    move-result-object v0

    .line 1845
    :try_start_0
    new-instance v2, Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;

    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;-><init>(Ljava/lang/String;)V

    .line 1846
    .local v2, rpc:Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;
    invoke-virtual {v0, v2}, Ljcifs/dcerpc/DcerpcHandle;->sendrecv(Ljcifs/dcerpc/DcerpcMessage;)V

    .line 1847
    iget v3, v2, Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;->retval:I

    if-eqz v3, :cond_1

    .line 1848
    new-instance v3, Ljcifs/smb/SmbException;

    iget v4, v2, Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;->retval:I

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljcifs/smb/SmbException;-><init>(IZ)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1850
    .end local v2           #rpc:Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;
    :catchall_0
    move-exception v3

    .line 1852
    :try_start_1
    invoke-virtual {v0}, Ljcifs/dcerpc/DcerpcHandle;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1857
    :cond_0
    :goto_0
    throw v3

    .line 1849
    .restart local v2       #rpc:Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;
    :cond_1
    :try_start_2
    invoke-virtual {v2}, Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;->getEntries()[Ljcifs/smb/FileEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .line 1852
    :try_start_3
    invoke-virtual {v0}, Ljcifs/dcerpc/DcerpcHandle;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1849
    :cond_2
    :goto_1
    return-object v3

    .line 1853
    :catch_0
    move-exception v1

    .line 1854
    .local v1, ioe:Ljava/io/IOException;
    sget v4, Ljcifs/util/LogStream;->level:I

    if-lt v4, v6, :cond_2

    .line 1855
    sget-object v4, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v4}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1

    .line 1853
    .end local v1           #ioe:Ljava/io/IOException;
    .end local v2           #rpc:Ljcifs/dcerpc/msrpc/MsrpcDfsRootEnum;
    :catch_1
    move-exception v1

    .line 1854
    .restart local v1       #ioe:Ljava/io/IOException;
    sget v4, Ljcifs/util/LogStream;->level:I

    if-lt v4, v6, :cond_0

    .line 1855
    sget-object v4, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v4}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method doEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V
    .locals 6
    .parameter "list"
    .parameter "files"
    .parameter "wildcard"
    .parameter "searchAttributes"
    .parameter "fnf"
    .parameter "ff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1724
    if-eqz p6, :cond_1

    instance-of v4, p6, Ljcifs/smb/DosFileFilter;

    if-eqz v4, :cond_1

    move-object v0, p6

    .line 1725
    check-cast v0, Ljcifs/smb/DosFileFilter;

    .line 1726
    .local v0, dff:Ljcifs/smb/DosFileFilter;
    iget-object v4, v0, Ljcifs/smb/DosFileFilter;->wildcard:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 1727
    iget-object p3, v0, Ljcifs/smb/DosFileFilter;->wildcard:Ljava/lang/String;

    .line 1728
    :cond_0
    iget p4, v0, Ljcifs/smb/DosFileFilter;->attributes:I

    .line 1732
    .end local v0           #dff:Ljcifs/smb/DosFileFilter;
    :cond_1
    :try_start_0
    iget-object v4, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    .line 1733
    .local v1, hostlen:I
    if-eqz v1, :cond_2

    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    .line 1734
    :cond_2
    invoke-virtual/range {p0 .. p6}, Ljcifs/smb/SmbFile;->doNetServerEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V

    .line 1745
    :goto_0
    return-void

    .line 1735
    :cond_3
    iget-object v4, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v4, :cond_4

    .line 1736
    invoke-virtual/range {p0 .. p6}, Ljcifs/smb/SmbFile;->doShareEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 1740
    .end local v1           #hostlen:I
    :catch_0
    move-exception v3

    .line 1741
    .local v3, uhe:Ljava/net/UnknownHostException;
    new-instance v4, Ljcifs/smb/SmbException;

    iget-object v5, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 1738
    .end local v3           #uhe:Ljava/net/UnknownHostException;
    .restart local v1       #hostlen:I
    :cond_4
    :try_start_1
    invoke-virtual/range {p0 .. p6}, Ljcifs/smb/SmbFile;->doFindFirstNext(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 1742
    .end local v1           #hostlen:I
    :catch_1
    move-exception v2

    .line 1743
    .local v2, mue:Ljava/net/MalformedURLException;
    new-instance v4, Ljcifs/smb/SmbException;

    iget-object v5, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method doFindFirstNext(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V
    .locals 24
    .parameter "list"
    .parameter "files"
    .parameter "wildcard"
    .parameter "searchAttributes"
    .parameter "fnf"
    .parameter "ff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/UnknownHostException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 1973
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v19

    .line 1974
    .local v19, path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v18

    .line 1976
    .local v18, p:Ljava/lang/String;
    const/16 v5, 0x2f

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-eq v5, v7, :cond_0

    .line 1977
    new-instance v5, Ljcifs/smb/SmbException;

    new-instance v7, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v8, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, " directory must end with \'/\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1980
    :cond_0
    new-instance v20, Ljcifs/smb/Trans2FindFirst2;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, p3

    move/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Ljcifs/smb/Trans2FindFirst2;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1981
    .local v20, req:Ljcifs/smb/SmbComTransaction;
    new-instance v21, Ljcifs/smb/Trans2FindFirst2Response;

    invoke-direct/range {v21 .. v21}, Ljcifs/smb/Trans2FindFirst2Response;-><init>()V

    .line 1983
    .local v21, resp:Ljcifs/smb/Trans2FindFirst2Response;
    sget v5, Ljcifs/util/LogStream;->level:I

    const/4 v7, 0x3

    if-lt v5, v7, :cond_1

    .line 1984
    sget-object v5, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "doFindFirstNext: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    iget-object v8, v0, Ljcifs/smb/SmbComTransaction;->path:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 1986
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 1988
    move-object/from16 v0, v21

    iget v0, v0, Ljcifs/smb/Trans2FindFirst2Response;->sid:I

    move/from16 v23, v0

    .line 1989
    .local v23, sid:I
    new-instance v20, Ljcifs/smb/Trans2FindNext2;

    .end local v20           #req:Ljcifs/smb/SmbComTransaction;
    move-object/from16 v0, v21

    iget v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->resumeKey:I

    move-object/from16 v0, v21

    iget-object v7, v0, Ljcifs/smb/Trans2FindFirst2Response;->lastName:Ljava/lang/String;

    move-object/from16 v0, v20

    move/from16 v1, v23

    invoke-direct {v0, v1, v5, v7}, Ljcifs/smb/Trans2FindNext2;-><init>(IILjava/lang/String;)V

    .line 1994
    .restart local v20       #req:Ljcifs/smb/SmbComTransaction;
    const/4 v5, 0x2

    move-object/from16 v0, v21

    iput-byte v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->subCommand:B

    .line 1997
    :goto_0
    const/16 v17, 0x0

    .local v17, i:I
    :goto_1
    move-object/from16 v0, v21

    iget v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->numEntries:I

    move/from16 v0, v17

    if-lt v0, v5, :cond_4

    .line 2024
    move-object/from16 v0, v21

    iget-boolean v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->isEndOfSearch:Z

    if-nez v5, :cond_2

    move-object/from16 v0, v21

    iget v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->numEntries:I

    if-nez v5, :cond_b

    .line 2034
    :cond_2
    :try_start_0
    new-instance v5, Ljcifs/smb/SmbComFindClose2;

    move/from16 v0, v23

    invoke-direct {v5, v0}, Ljcifs/smb/SmbComFindClose2;-><init>(I)V

    invoke-direct/range {p0 .. p0}, Ljcifs/smb/SmbFile;->blank_resp()Ljcifs/smb/SmbComBlankResponse;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v7}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2039
    :cond_3
    :goto_2
    return-void

    .line 1998
    :cond_4
    move-object/from16 v0, v21

    iget-object v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->results:[Ljcifs/smb/FileEntry;

    aget-object v15, v5, v17

    .line 1999
    .local v15, e:Ljcifs/smb/FileEntry;
    invoke-interface {v15}, Ljcifs/smb/FileEntry;->getName()Ljava/lang/String;

    move-result-object v6

    .line 2000
    .local v6, name:Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v7, 0x3

    if-ge v5, v7, :cond_7

    .line 2001
    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v16

    .line 2002
    .local v16, h:I
    sget v5, Ljcifs/smb/SmbFile;->HASH_DOT:I

    move/from16 v0, v16

    if-eq v0, v5, :cond_5

    sget v5, Ljcifs/smb/SmbFile;->HASH_DOT_DOT:I

    move/from16 v0, v16

    if-ne v0, v5, :cond_7

    .line 2003
    :cond_5
    const-string v5, "."

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    const-string v5, ".."

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 1997
    .end local v16           #h:I
    :cond_6
    :goto_3
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 2007
    :cond_7
    if-eqz p5, :cond_8

    move-object/from16 v0, p5

    move-object/from16 v1, p0

    invoke-interface {v0, v1, v6}, Ljcifs/smb/SmbFilenameFilter;->accept(Ljcifs/smb/SmbFile;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 2010
    :cond_8
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_6

    .line 2011
    new-instance v4, Ljcifs/smb/SmbFile;

    const/4 v7, 0x1

    .line 2012
    invoke-interface {v15}, Ljcifs/smb/FileEntry;->getAttributes()I

    move-result v8

    invoke-interface {v15}, Ljcifs/smb/FileEntry;->createTime()J

    move-result-wide v9

    invoke-interface {v15}, Ljcifs/smb/FileEntry;->lastModified()J

    move-result-wide v11

    invoke-interface {v15}, Ljcifs/smb/FileEntry;->length()J

    move-result-wide v13

    move-object/from16 v5, p0

    .line 2011
    invoke-direct/range {v4 .. v14}, Ljcifs/smb/SmbFile;-><init>(Ljcifs/smb/SmbFile;Ljava/lang/String;IIJJJ)V

    .line 2013
    .local v4, f:Ljcifs/smb/SmbFile;
    if-eqz p6, :cond_9

    move-object/from16 v0, p6

    invoke-interface {v0, v4}, Ljcifs/smb/SmbFileFilter;->accept(Ljcifs/smb/SmbFile;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 2016
    :cond_9
    if-eqz p2, :cond_a

    .line 2017
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 2019
    :cond_a
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 2028
    .end local v4           #f:Ljcifs/smb/SmbFile;
    .end local v6           #name:Ljava/lang/String;
    .end local v15           #e:Ljcifs/smb/FileEntry;
    :cond_b
    move-object/from16 v0, v21

    iget v5, v0, Ljcifs/smb/Trans2FindFirst2Response;->resumeKey:I

    move-object/from16 v0, v21

    iget-object v7, v0, Ljcifs/smb/Trans2FindFirst2Response;->lastName:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v7}, Ljcifs/smb/SmbComTransaction;->reset(ILjava/lang/String;)V

    .line 2029
    invoke-virtual/range {v21 .. v21}, Ljcifs/smb/Trans2FindFirst2Response;->reset()V

    .line 2030
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    goto/16 :goto_0

    .line 2035
    :catch_0
    move-exception v22

    .line 2036
    .local v22, se:Ljcifs/smb/SmbException;
    sget v5, Ljcifs/util/LogStream;->level:I

    const/4 v7, 0x4

    if-lt v5, v7, :cond_3

    .line 2037
    sget-object v5, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljcifs/smb/SmbException;->printStackTrace(Ljava/io/PrintStream;)V

    goto/16 :goto_2
.end method

.method doMsrpcShareEnum()[Ljcifs/smb/FileEntry;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    .line 1863
    new-instance v2, Ljcifs/dcerpc/msrpc/MsrpcShareEnum;

    iget-object v3, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljcifs/dcerpc/msrpc/MsrpcShareEnum;-><init>(Ljava/lang/String;)V

    .line 1872
    .local v2, rpc:Ljcifs/dcerpc/msrpc/MsrpcShareEnum;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ncacn_np:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1873
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljcifs/UniAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1874
    const-string v4, "[\\PIPE\\srvsvc]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1872
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1874
    iget-object v4, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 1872
    invoke-static {v3, v4}, Ljcifs/dcerpc/DcerpcHandle;->getHandle(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;

    move-result-object v0

    .line 1877
    .local v0, handle:Ljcifs/dcerpc/DcerpcHandle;
    :try_start_0
    invoke-virtual {v0, v2}, Ljcifs/dcerpc/DcerpcHandle;->sendrecv(Ljcifs/dcerpc/DcerpcMessage;)V

    .line 1878
    iget v3, v2, Ljcifs/dcerpc/msrpc/MsrpcShareEnum;->retval:I

    if-eqz v3, :cond_1

    .line 1879
    new-instance v3, Ljcifs/smb/SmbException;

    iget v4, v2, Ljcifs/dcerpc/msrpc/MsrpcShareEnum;->retval:I

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljcifs/smb/SmbException;-><init>(IZ)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1881
    :catchall_0
    move-exception v3

    .line 1883
    :try_start_1
    invoke-virtual {v0}, Ljcifs/dcerpc/DcerpcHandle;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1888
    :cond_0
    :goto_0
    throw v3

    .line 1880
    :cond_1
    :try_start_2
    invoke-virtual {v2}, Ljcifs/dcerpc/msrpc/MsrpcShareEnum;->getEntries()[Ljcifs/smb/FileEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .line 1883
    :try_start_3
    invoke-virtual {v0}, Ljcifs/dcerpc/DcerpcHandle;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1880
    :cond_2
    :goto_1
    return-object v3

    .line 1884
    :catch_0
    move-exception v1

    .line 1885
    .local v1, ioe:Ljava/io/IOException;
    sget v4, Ljcifs/util/LogStream;->level:I

    if-lt v4, v6, :cond_2

    .line 1886
    sget-object v4, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v4}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1

    .line 1884
    .end local v1           #ioe:Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 1885
    .restart local v1       #ioe:Ljava/io/IOException;
    sget v4, Ljcifs/util/LogStream;->level:I

    if-lt v4, v6, :cond_0

    .line 1886
    sget-object v4, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v1, v4}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method doNetServerEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V
    .locals 21
    .parameter "list"
    .parameter "files"
    .parameter "wildcard"
    .parameter "searchAttributes"
    .parameter "fnf"
    .parameter "ff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/UnknownHostException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 1909
    move-object/from16 v0, p0

    iget-object v4, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    const/16 v16, 0x0

    .line 1913
    .local v16, listType:I
    :goto_0
    if-nez v16, :cond_2

    .line 1914
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->connect0()V

    .line 1915
    new-instance v19, Ljcifs/smb/NetServerEnum2;

    move-object/from16 v0, p0

    iget-object v4, v0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v4, v4, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v4, v4, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v4, v4, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget-object v4, v4, Ljcifs/smb/SmbTransport$ServerData;->oemDomainName:Ljava/lang/String;

    .line 1916
    const/high16 v6, -0x8000

    .line 1915
    move-object/from16 v0, v19

    invoke-direct {v0, v4, v6}, Ljcifs/smb/NetServerEnum2;-><init>(Ljava/lang/String;I)V

    .line 1917
    .local v19, req:Ljcifs/smb/SmbComTransaction;
    new-instance v20, Ljcifs/smb/NetServerEnum2Response;

    invoke-direct/range {v20 .. v20}, Ljcifs/smb/NetServerEnum2Response;-><init>()V

    .line 1929
    .local v20, resp:Ljcifs/smb/SmbComTransactionResponse;
    :cond_0
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 1931
    move-object/from16 v0, v20

    iget v4, v0, Ljcifs/smb/SmbComTransactionResponse;->status:I

    if-eqz v4, :cond_4

    .line 1932
    move-object/from16 v0, v20

    iget v4, v0, Ljcifs/smb/SmbComTransactionResponse;->status:I

    const/16 v6, 0xea

    if-eq v4, v6, :cond_4

    .line 1933
    new-instance v4, Ljcifs/smb/SmbException;

    move-object/from16 v0, v20

    iget v6, v0, Ljcifs/smb/SmbComTransactionResponse;->status:I

    const/4 v7, 0x1

    invoke-direct {v4, v6, v7}, Ljcifs/smb/SmbException;-><init>(IZ)V

    throw v4

    .line 1909
    .end local v16           #listType:I
    .end local v19           #req:Ljcifs/smb/SmbComTransaction;
    .end local v20           #resp:Ljcifs/smb/SmbComTransactionResponse;
    :cond_1
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v16

    goto :goto_0

    .line 1918
    .restart local v16       #listType:I
    :cond_2
    const/4 v4, 0x2

    move/from16 v0, v16

    if-ne v0, v4, :cond_3

    .line 1919
    new-instance v19, Ljcifs/smb/NetServerEnum2;

    move-object/from16 v0, p0

    iget-object v4, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    const/4 v6, -0x1

    move-object/from16 v0, v19

    invoke-direct {v0, v4, v6}, Ljcifs/smb/NetServerEnum2;-><init>(Ljava/lang/String;I)V

    .line 1920
    .restart local v19       #req:Ljcifs/smb/SmbComTransaction;
    new-instance v20, Ljcifs/smb/NetServerEnum2Response;

    invoke-direct/range {v20 .. v20}, Ljcifs/smb/NetServerEnum2Response;-><init>()V

    .line 1921
    .restart local v20       #resp:Ljcifs/smb/SmbComTransactionResponse;
    goto :goto_1

    .line 1922
    .end local v19           #req:Ljcifs/smb/SmbComTransaction;
    .end local v20           #resp:Ljcifs/smb/SmbComTransactionResponse;
    :cond_3
    new-instance v4, Ljcifs/smb/SmbException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "The requested list operations is invalid: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v7}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1935
    .restart local v19       #req:Ljcifs/smb/SmbComTransaction;
    .restart local v20       #resp:Ljcifs/smb/SmbComTransactionResponse;
    :cond_4
    move-object/from16 v0, v20

    iget v4, v0, Ljcifs/smb/SmbComTransactionResponse;->status:I

    const/16 v6, 0xea

    if-ne v4, v6, :cond_5

    const/16 v17, 0x1

    .line 1937
    .local v17, more:Z
    :goto_2
    if-eqz v17, :cond_6

    move-object/from16 v0, v20

    iget v4, v0, Ljcifs/smb/SmbComTransactionResponse;->numEntries:I

    add-int/lit8 v18, v4, -0x1

    .line 1938
    .local v18, n:I
    :goto_3
    const/4 v15, 0x0

    .local v15, i:I
    :goto_4
    move/from16 v0, v18

    if-lt v15, v0, :cond_7

    .line 1956
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v4

    const/4 v6, 0x2

    if-eq v4, v6, :cond_c

    .line 1963
    :goto_5
    return-void

    .line 1935
    .end local v15           #i:I
    .end local v17           #more:Z
    .end local v18           #n:I
    :cond_5
    const/16 v17, 0x0

    goto :goto_2

    .line 1937
    .restart local v17       #more:Z
    :cond_6
    move-object/from16 v0, v20

    iget v0, v0, Ljcifs/smb/SmbComTransactionResponse;->numEntries:I

    move/from16 v18, v0

    goto :goto_3

    .line 1939
    .restart local v15       #i:I
    .restart local v18       #n:I
    :cond_7
    move-object/from16 v0, v20

    iget-object v4, v0, Ljcifs/smb/SmbComTransactionResponse;->results:[Ljcifs/smb/FileEntry;

    aget-object v14, v4, v15

    .line 1940
    .local v14, e:Ljcifs/smb/FileEntry;
    invoke-interface {v14}, Ljcifs/smb/FileEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1941
    .local v5, name:Ljava/lang/String;
    if-eqz p5, :cond_9

    move-object/from16 v0, p5

    move-object/from16 v1, p0

    invoke-interface {v0, v1, v5}, Ljcifs/smb/SmbFilenameFilter;->accept(Ljcifs/smb/SmbFile;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 1938
    :cond_8
    :goto_6
    add-int/lit8 v15, v15, 0x1

    goto :goto_4

    .line 1943
    :cond_9
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_8

    .line 1945
    new-instance v3, Ljcifs/smb/SmbFile;

    invoke-interface {v14}, Ljcifs/smb/FileEntry;->getType()I

    move-result v6

    .line 1946
    const/16 v7, 0x11

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    move-object/from16 v4, p0

    .line 1945
    invoke-direct/range {v3 .. v13}, Ljcifs/smb/SmbFile;-><init>(Ljcifs/smb/SmbFile;Ljava/lang/String;IIJJJ)V

    .line 1947
    .local v3, f:Ljcifs/smb/SmbFile;
    if-eqz p6, :cond_a

    move-object/from16 v0, p6

    invoke-interface {v0, v3}, Ljcifs/smb/SmbFileFilter;->accept(Ljcifs/smb/SmbFile;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1949
    :cond_a
    if-eqz p2, :cond_b

    .line 1950
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 1952
    :cond_b
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 1959
    .end local v3           #f:Ljcifs/smb/SmbFile;
    .end local v5           #name:Ljava/lang/String;
    .end local v14           #e:Ljcifs/smb/FileEntry;
    :cond_c
    const/16 v4, -0x29

    move-object/from16 v0, v19

    iput-byte v4, v0, Ljcifs/smb/SmbComTransaction;->subCommand:B

    .line 1960
    const/4 v6, 0x0

    move-object/from16 v4, v20

    check-cast v4, Ljcifs/smb/NetServerEnum2Response;

    iget-object v4, v4, Ljcifs/smb/NetServerEnum2Response;->lastName:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v0, v6, v4}, Ljcifs/smb/SmbComTransaction;->reset(ILjava/lang/String;)V

    .line 1961
    invoke-virtual/range {v20 .. v20}, Ljcifs/smb/SmbComTransactionResponse;->reset()V

    .line 1962
    if-nez v17, :cond_0

    goto :goto_5
.end method

.method doNetShareEnum()[Ljcifs/smb/FileEntry;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1891
    new-instance v0, Ljcifs/smb/NetShareEnum;

    invoke-direct {v0}, Ljcifs/smb/NetShareEnum;-><init>()V

    .line 1892
    .local v0, req:Ljcifs/smb/SmbComTransaction;
    new-instance v1, Ljcifs/smb/NetShareEnumResponse;

    invoke-direct {v1}, Ljcifs/smb/NetShareEnumResponse;-><init>()V

    .line 1894
    .local v1, resp:Ljcifs/smb/SmbComTransactionResponse;
    invoke-virtual {p0, v0, v1}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 1896
    iget v2, v1, Ljcifs/smb/SmbComTransactionResponse;->status:I

    if-eqz v2, :cond_0

    .line 1897
    new-instance v2, Ljcifs/smb/SmbException;

    iget v3, v1, Ljcifs/smb/SmbComTransactionResponse;->status:I

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljcifs/smb/SmbException;-><init>(IZ)V

    throw v2

    .line 1899
    :cond_0
    iget-object v2, v1, Ljcifs/smb/SmbComTransactionResponse;->results:[Ljcifs/smb/FileEntry;

    return-object v2
.end method

.method doShareEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V
    .locals 22
    .parameter "list"
    .parameter "files"
    .parameter "wildcard"
    .parameter "searchAttributes"
    .parameter "fnf"
    .parameter "ff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;,
            Ljava/net/UnknownHostException;,
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 1754
    move-object/from16 v0, p0

    iget-object v3, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v21

    .line 1755
    .local v21, p:Ljava/lang/String;
    const/16 v19, 0x0

    .line 1761
    .local v19, last:Ljava/io/IOException;
    const/16 v3, 0x2f

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-eq v3, v5, :cond_0

    .line 1762
    new-instance v3, Ljcifs/smb/SmbException;

    new-instance v5, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v6, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " directory must end with \'/\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1763
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v3

    const/4 v5, 0x4

    if-eq v3, v5, :cond_1

    .line 1764
    new-instance v3, Ljcifs/smb/SmbException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "The requested list operations is invalid: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1766
    :cond_1
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    .line 1768
    .local v20, map:Ljava/util/HashMap;
    sget-object v3, Ljcifs/smb/SmbFile;->dfs:Ljcifs/smb/Dfs;

    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v3, v5, v6}, Ljcifs/smb/Dfs;->isTrustedDomain(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1773
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->doDfsRootEnum()[Ljcifs/smb/FileEntry;

    move-result-object v16

    .line 1774
    .local v16, entries:[Ljcifs/smb/FileEntry;
    const/4 v15, 0x0

    .local v15, ei:I
    :goto_0
    move-object/from16 v0, v16

    array-length v3, v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v15, v3, :cond_4

    .line 1785
    .end local v15           #ei:I
    .end local v16           #entries:[Ljcifs/smb/FileEntry;
    :cond_2
    :goto_1
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getFirstAddress()Ljcifs/UniAddress;

    move-result-object v13

    .line 1786
    .local v13, addr:Ljcifs/UniAddress;
    :goto_2
    if-nez v13, :cond_6

    .line 1810
    :cond_3
    if-eqz v19, :cond_b

    invoke-virtual/range {v20 .. v20}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 1811
    move-object/from16 v0, v19

    instance-of v3, v0, Ljcifs/smb/SmbException;

    if-nez v3, :cond_a

    .line 1812
    new-instance v3, Ljcifs/smb/SmbException;

    move-object/from16 v0, p0

    iget-object v5, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v19

    invoke-direct {v3, v5, v0}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 1775
    .end local v13           #addr:Ljcifs/UniAddress;
    .restart local v15       #ei:I
    .restart local v16       #entries:[Ljcifs/smb/FileEntry;
    :cond_4
    :try_start_1
    aget-object v14, v16, v15

    .line 1776
    .local v14, e:Ljcifs/smb/FileEntry;
    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1777
    move-object/from16 v0, v20

    invoke-virtual {v0, v14, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1774
    :cond_5
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 1779
    .end local v14           #e:Ljcifs/smb/FileEntry;
    .end local v15           #ei:I
    .end local v16           #entries:[Ljcifs/smb/FileEntry;
    :catch_0
    move-exception v17

    .line 1780
    .local v17, ioe:Ljava/io/IOException;
    sget v3, Ljcifs/util/LogStream;->level:I

    const/4 v5, 0x4

    if-lt v3, v5, :cond_2

    .line 1781
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1

    .line 1788
    .end local v17           #ioe:Ljava/io/IOException;
    .restart local v13       #addr:Ljcifs/UniAddress;
    :cond_6
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->doConnect()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1790
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->doMsrpcShareEnum()[Ljcifs/smb/FileEntry;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v16

    .line 1796
    .restart local v16       #entries:[Ljcifs/smb/FileEntry;
    :goto_3
    const/4 v15, 0x0

    .restart local v15       #ei:I
    :goto_4
    :try_start_4
    move-object/from16 v0, v16

    array-length v3, v0

    if-ge v15, v3, :cond_3

    .line 1797
    aget-object v14, v16, v15

    .line 1798
    .restart local v14       #e:Ljcifs/smb/FileEntry;
    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 1799
    move-object/from16 v0, v20

    invoke-virtual {v0, v14, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1796
    :cond_7
    add-int/lit8 v15, v15, 0x1

    goto :goto_4

    .line 1791
    .end local v14           #e:Ljcifs/smb/FileEntry;
    .end local v15           #ei:I
    .end local v16           #entries:[Ljcifs/smb/FileEntry;
    :catch_1
    move-exception v17

    .line 1792
    .restart local v17       #ioe:Ljava/io/IOException;
    sget v3, Ljcifs/util/LogStream;->level:I

    const/4 v5, 0x3

    if-lt v3, v5, :cond_8

    .line 1793
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 1794
    :cond_8
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->doNetShareEnum()[Ljcifs/smb/FileEntry;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v16

    .restart local v16       #entries:[Ljcifs/smb/FileEntry;
    goto :goto_3

    .line 1802
    .end local v16           #entries:[Ljcifs/smb/FileEntry;
    .end local v17           #ioe:Ljava/io/IOException;
    :catch_2
    move-exception v17

    .line 1803
    .restart local v17       #ioe:Ljava/io/IOException;
    sget v3, Ljcifs/util/LogStream;->level:I

    const/4 v5, 0x3

    if-lt v3, v5, :cond_9

    .line 1804
    sget-object v3, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 1805
    :cond_9
    move-object/from16 v19, v17

    .line 1807
    invoke-virtual/range {p0 .. p0}, Ljcifs/smb/SmbFile;->getNextAddress()Ljcifs/UniAddress;

    move-result-object v13

    goto/16 :goto_2

    .line 1813
    .end local v17           #ioe:Ljava/io/IOException;
    :cond_a
    check-cast v19, Ljcifs/smb/SmbException;

    .end local v19           #last:Ljava/io/IOException;
    throw v19

    .line 1816
    .restart local v19       #last:Ljava/io/IOException;
    :cond_b
    invoke-virtual/range {v20 .. v20}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .line 1817
    .local v18, iter:Ljava/util/Iterator;
    :cond_c
    :goto_5
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_d

    .line 1835
    return-void

    .line 1818
    :cond_d
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljcifs/smb/FileEntry;

    .line 1819
    .restart local v14       #e:Ljcifs/smb/FileEntry;
    invoke-interface {v14}, Ljcifs/smb/FileEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1820
    .local v4, name:Ljava/lang/String;
    if-eqz p5, :cond_e

    move-object/from16 v0, p5

    move-object/from16 v1, p0

    invoke-interface {v0, v1, v4}, Ljcifs/smb/SmbFilenameFilter;->accept(Ljcifs/smb/SmbFile;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1822
    :cond_e
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_c

    .line 1824
    new-instance v2, Ljcifs/smb/SmbFile;

    invoke-interface {v14}, Ljcifs/smb/FileEntry;->getType()I

    move-result v5

    .line 1825
    const/16 v6, 0x11

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    move-object/from16 v3, p0

    .line 1824
    invoke-direct/range {v2 .. v12}, Ljcifs/smb/SmbFile;-><init>(Ljcifs/smb/SmbFile;Ljava/lang/String;IIJJJ)V

    .line 1826
    .local v2, f:Ljcifs/smb/SmbFile;
    if-eqz p6, :cond_f

    move-object/from16 v0, p6

    invoke-interface {v0, v2}, Ljcifs/smb/SmbFileFilter;->accept(Ljcifs/smb/SmbFile;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1828
    :cond_f
    if-eqz p2, :cond_10

    .line 1829
    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 1831
    :cond_10
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    .line 2749
    instance-of v3, p1, Ljcifs/smb/SmbFile;

    if-eqz v3, :cond_1

    move-object v0, p1

    .line 2750
    check-cast v0, Ljcifs/smb/SmbFile;

    .line 2753
    .local v0, f:Ljcifs/smb/SmbFile;
    if-ne p0, v0, :cond_0

    .line 2754
    const/4 v1, 0x1

    .line 2775
    .end local v0           #f:Ljcifs/smb/SmbFile;
    :goto_0
    return v1

    .line 2759
    .restart local v0       #f:Ljcifs/smb/SmbFile;
    :cond_0
    iget-object v3, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Ljcifs/smb/SmbFile;->pathNamesPossiblyEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2761
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 2762
    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 2764
    iget-object v3, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    iget-object v4, v0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2766
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v3

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljcifs/UniAddress;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .local v1, ret:Z
    goto :goto_0

    .line 2767
    .end local v1           #ret:Z
    :catch_0
    move-exception v2

    .line 2768
    .local v2, uhe:Ljava/net/UnknownHostException;
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .restart local v1       #ret:Z
    goto :goto_0

    .line 2775
    .end local v0           #f:Ljcifs/smb/SmbFile;
    .end local v1           #ret:Z
    .end local v2           #uhe:Ljava/net/UnknownHostException;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public exists()Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    const/4 v6, 0x1

    .line 1396
    iget-wide v2, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 1397
    iget-boolean v2, p0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 1444
    :goto_0
    return v2

    .line 1400
    :cond_0
    const/16 v2, 0x11

    iput v2, p0, Ljcifs/smb/SmbFile;->attributes:I

    .line 1401
    iput-wide v7, p0, Ljcifs/smb/SmbFile;->createTime:J

    .line 1402
    iput-wide v7, p0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 1403
    const/4 v2, 0x0

    iput-boolean v2, p0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 1406
    :try_start_0
    iget-object v2, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    .line 1407
    iget-object v2, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 1408
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 1409
    iget-object v2, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Ljcifs/UniAddress;->getByName(Ljava/lang/String;Z)Ljcifs/UniAddress;

    .line 1427
    :cond_1
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Ljcifs/smb/SmbFile;->isExists:Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1442
    :goto_2
    :sswitch_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v4, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 1444
    iget-boolean v2, p0, Ljcifs/smb/SmbFile;->isExists:Z

    goto :goto_0

    .line 1411
    :cond_2
    :try_start_1
    iget-object v2, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljcifs/UniAddress;->getByName(Ljava/lang/String;)Ljcifs/UniAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljcifs/UniAddress;->getHostName()Ljava/lang/String;

    goto :goto_1

    .line 1429
    :catch_0
    move-exception v2

    goto :goto_2

    .line 1413
    :cond_3
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v6, :cond_4

    .line 1414
    iget-object v2, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    const-string v3, "IPC$"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1415
    :cond_4
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->connect0()V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljcifs/smb/SmbException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 1430
    :catch_1
    move-exception v1

    .line 1431
    .local v1, se:Ljcifs/smb/SmbException;
    invoke-virtual {v1}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 1438
    throw v1

    .line 1417
    .end local v1           #se:Ljcifs/smb/SmbException;
    :cond_5
    :try_start_2
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v2

    .line 1418
    const/16 v3, 0x101

    .line 1417
    invoke-virtual {p0, v2, v3}, Ljcifs/smb/SmbFile;->queryPath(Ljava/lang/String;I)Ljcifs/smb/Info;

    move-result-object v0

    .line 1419
    .local v0, info:Ljcifs/smb/Info;
    invoke-interface {v0}, Ljcifs/smb/Info;->getAttributes()I

    move-result v2

    iput v2, p0, Ljcifs/smb/SmbFile;->attributes:I

    .line 1420
    invoke-interface {v0}, Ljcifs/smb/Info;->getCreateTime()J

    move-result-wide v2

    iput-wide v2, p0, Ljcifs/smb/SmbFile;->createTime:J

    .line 1421
    invoke-interface {v0}, Ljcifs/smb/Info;->getLastWriteTime()J

    move-result-wide v2

    iput-wide v2, p0, Ljcifs/smb/SmbFile;->lastModified:J
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljcifs/smb/SmbException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 1431
    nop

    :sswitch_data_0
    .sparse-switch
        -0x3ffffff1 -> :sswitch_0
        -0x3fffffcd -> :sswitch_0
        -0x3fffffcc -> :sswitch_0
        -0x3fffffc6 -> :sswitch_0
    .end sparse-switch
.end method

.method declared-synchronized getAddress()Ljcifs/UniAddress;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 821
    monitor-enter p0

    :try_start_0
    iget v0, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    if-nez v0, :cond_0

    .line 822
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getFirstAddress()Ljcifs/UniAddress;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 823
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    iget v1, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 821
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAttributes()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2628
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2629
    const/4 v0, 0x0

    .line 2632
    :goto_0
    return v0

    .line 2631
    :cond_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 2632
    iget v0, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit16 v0, v0, 0x7fff

    goto :goto_0
.end method

.method public getCanonicalPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1226
    iget-object v1, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 1227
    .local v0, str:Ljava/lang/String;
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 1228
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 1229
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "smb://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1231
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "smb://"

    goto :goto_0
.end method

.method public getContentLength()I
    .locals 4

    .prologue
    .line 2806
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->length()J
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    long-to-int v0, v0

    .line 2809
    :goto_0
    return v0

    .line 2807
    :catch_0
    move-exception v0

    .line 2809
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDate()J
    .locals 2

    .prologue
    .line 2819
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->lastModified()J
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 2822
    :goto_0
    return-wide v0

    .line 2820
    :catch_0
    move-exception v0

    .line 2822
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getDfsPath()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/16 v3, 0x2f

    .line 1536
    invoke-virtual {p0, v0}, Ljcifs/smb/SmbFile;->resolveDfs(Ljcifs/smb/ServerMessageBlock;)V

    .line 1537
    iget-object v1, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    if-nez v1, :cond_1

    .line 1545
    :cond_0
    :goto_0
    return-object v0

    .line 1540
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "smb:/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    iget-object v2, v2, Ljcifs/smb/DfsReferral;->server:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    iget-object v2, v2, Ljcifs/smb/DfsReferral;->share:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1541
    .local v0, path:Ljava/lang/String;
    const/16 v1, 0x5c

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 1542
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1543
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getDiskFreeSpace()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2472
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    iget v2, p0, Ljcifs/smb/SmbFile;->type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 2473
    :cond_0
    const/16 v1, 0x3ef

    .line 2475
    .local v1, level:I
    :try_start_0
    invoke-direct {p0, v1}, Ljcifs/smb/SmbFile;->queryFSInformation(I)J
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 2487
    .end local v1           #level:I
    :goto_0
    return-wide v2

    .line 2476
    .restart local v1       #level:I
    :catch_0
    move-exception v0

    .line 2477
    .local v0, ex:Ljcifs/smb/SmbException;
    invoke-virtual {v0}, Ljcifs/smb/SmbException;->getNtStatus()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 2484
    :pswitch_0
    throw v0

    .line 2481
    :pswitch_1
    const/4 v1, 0x1

    .line 2482
    invoke-direct {p0, v1}, Ljcifs/smb/SmbFile;->queryFSInformation(I)J

    move-result-wide v2

    goto :goto_0

    .line 2487
    .end local v0           #ex:Ljcifs/smb/SmbException;
    .end local v1           #level:I
    :cond_1
    const-wide/16 v2, 0x0

    goto :goto_0

    .line 2477
    :pswitch_data_0
    .packed-switch -0x3fffffff
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method declared-synchronized getFirstAddress()Ljcifs/UniAddress;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 826
    monitor-enter p0

    const/4 v8, 0x0

    :try_start_0
    iput v8, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    .line 828
    iget-object v8, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 829
    .local v2, host:Ljava/lang/String;
    iget-object v8, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 830
    .local v4, path:Ljava/lang/String;
    iget-object v8, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v5

    .line 832
    .local v5, query:Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 833
    const-string v8, "server"

    invoke-static {v5, v8}, Ljcifs/smb/SmbFile;->queryLookup(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 834
    .local v6, server:Ljava/lang/String;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_0

    .line 835
    const/4 v8, 0x1

    new-array v8, v8, [Ljcifs/UniAddress;

    iput-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    .line 836
    iget-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    const/4 v9, 0x0

    invoke-static {v6}, Ljcifs/UniAddress;->getByName(Ljava/lang/String;)Ljcifs/UniAddress;

    move-result-object v10

    aput-object v10, v8, v9

    .line 837
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getNextAddress()Ljcifs/UniAddress;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    .line 867
    .end local v6           #server:Ljava/lang/String;
    :goto_0
    monitor-exit p0

    return-object v8

    .line 839
    .restart local v6       #server:Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v8, "address"

    invoke-static {v5, v8}, Ljcifs/smb/SmbFile;->queryLookup(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 840
    .local v1, address:Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_1

    .line 841
    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v3

    .line 842
    .local v3, ip:[B
    const/4 v8, 0x1

    new-array v8, v8, [Ljcifs/UniAddress;

    iput-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    .line 843
    iget-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    const/4 v9, 0x0

    new-instance v10, Ljcifs/UniAddress;

    invoke-static {v2, v3}, Ljava/net/InetAddress;->getByAddress(Ljava/lang/String;[B)Ljava/net/InetAddress;

    move-result-object v11

    invoke-direct {v10, v11}, Ljcifs/UniAddress;-><init>(Ljava/lang/Object;)V

    aput-object v10, v8, v9

    .line 844
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getNextAddress()Ljcifs/UniAddress;

    move-result-object v8

    goto :goto_0

    .line 848
    .end local v1           #address:Ljava/lang/String;
    .end local v3           #ip:[B
    .end local v6           #server:Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v8

    if-nez v8, :cond_3

    .line 851
    :try_start_2
    const-string v8, "\u0001\u0002__MSBROWSE__\u0002"

    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 850
    invoke-static {v8, v9, v10}, Ljcifs/netbios/NbtAddress;->getByName(Ljava/lang/String;ILjava/lang/String;)Ljcifs/netbios/NbtAddress;

    move-result-object v0

    .line 852
    .local v0, addr:Ljcifs/netbios/NbtAddress;
    const/4 v8, 0x1

    new-array v8, v8, [Ljcifs/UniAddress;

    iput-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    .line 853
    iget-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    const/4 v9, 0x0

    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljcifs/UniAddress;->getByName(Ljava/lang/String;)Ljcifs/UniAddress;

    move-result-object v10

    aput-object v10, v8, v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_0

    .line 867
    .end local v0           #addr:Ljcifs/netbios/NbtAddress;
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getNextAddress()Ljcifs/UniAddress;

    move-result-object v8

    goto :goto_0

    .line 854
    :catch_0
    move-exception v7

    .line 855
    .local v7, uhe:Ljava/net/UnknownHostException;
    invoke-static {}, Ljcifs/smb/NtlmPasswordAuthentication;->initDefaults()V

    .line 856
    sget-object v8, Ljcifs/smb/NtlmPasswordAuthentication;->DEFAULT_DOMAIN:Ljava/lang/String;

    const-string v9, "?"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 857
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 826
    .end local v2           #host:Ljava/lang/String;
    .end local v4           #path:Ljava/lang/String;
    .end local v5           #query:Ljava/lang/String;
    .end local v7           #uhe:Ljava/net/UnknownHostException;
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 859
    .restart local v2       #host:Ljava/lang/String;
    .restart local v4       #path:Ljava/lang/String;
    .restart local v5       #query:Ljava/lang/String;
    .restart local v7       #uhe:Ljava/net/UnknownHostException;
    :cond_2
    :try_start_4
    sget-object v8, Ljcifs/smb/NtlmPasswordAuthentication;->DEFAULT_DOMAIN:Ljava/lang/String;

    const/4 v9, 0x1

    invoke-static {v8, v9}, Ljcifs/UniAddress;->getAllByName(Ljava/lang/String;Z)[Ljcifs/UniAddress;

    move-result-object v8

    iput-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    goto :goto_1

    .line 861
    .end local v7           #uhe:Ljava/net/UnknownHostException;
    :cond_3
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_4

    const-string v8, "/"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 862
    :cond_4
    const/4 v8, 0x1

    invoke-static {v2, v8}, Ljcifs/UniAddress;->getAllByName(Ljava/lang/String;Z)[Ljcifs/UniAddress;

    move-result-object v8

    iput-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    goto :goto_1

    .line 864
    :cond_5
    const/4 v8, 0x0

    invoke-static {v2, v8}, Ljcifs/UniAddress;->getAllByName(Ljava/lang/String;Z)[Ljcifs/UniAddress;

    move-result-object v8

    iput-object v8, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2844
    new-instance v0, Ljcifs/smb/SmbFileInputStream;

    invoke-direct {v0, p0}, Ljcifs/smb/SmbFileInputStream;-><init>(Ljcifs/smb/SmbFile;)V

    return-object v0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 2832
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->lastModified()J
    :try_end_0
    .catch Ljcifs/smb/SmbException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 2835
    :goto_0
    return-wide v0

    .line 2833
    :catch_0
    move-exception v0

    .line 2835
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x2f

    .line 1068
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 1069
    iget-object v1, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    .line 1070
    iget-object v1, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v0, v1, -0x2

    .line 1071
    .local v0, i:I
    :goto_0
    iget-object v1, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_0

    .line 1074
    iget-object v1, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1080
    .end local v0           #i:I
    :goto_1
    return-object v1

    .line 1072
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1075
    .end local v0           #i:I
    :cond_1
    iget-object v1, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 1076
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1077
    :cond_2
    iget-object v1, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    .line 1078
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1080
    :cond_3
    const-string v1, "smb://"

    goto :goto_1
.end method

.method declared-synchronized getNextAddress()Ljcifs/UniAddress;
    .locals 4

    .prologue
    .line 870
    monitor-enter p0

    const/4 v0, 0x0

    .line 871
    .local v0, addr:Ljcifs/UniAddress;
    :try_start_0
    iget v1, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    iget-object v2, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 872
    iget-object v1, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    iget v2, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    aget-object v0, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 873
    :cond_0
    monitor-exit p0

    return-object v0

    .line 870
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2853
    new-instance v0, Ljcifs/smb/SmbFileOutputStream;

    invoke-direct {v0, p0}, Ljcifs/smb/SmbFileOutputStream;-><init>(Ljcifs/smb/SmbFile;)V

    return-object v0
.end method

.method public getParent()Ljava/lang/String;
    .locals 6

    .prologue
    const/16 v5, 0x2f

    .line 1095
    iget-object v3, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v2

    .line 1097
    .local v2, str:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 1098
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v3, "smb://"

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1100
    .local v1, sb:Ljava/lang/StringBuffer;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1102
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 1103
    iget-object v3, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    .line 1104
    iget-object v3, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1109
    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1111
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, -0x2

    .line 1112
    .local v0, i:I
    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_1

    .line 1116
    const/4 v3, 0x0

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1119
    .end local v0           #i:I
    .end local v1           #sb:Ljava/lang/StringBuffer;
    :goto_2
    return-object v3

    .line 1106
    .restart local v1       #sb:Ljava/lang/StringBuffer;
    :cond_0
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1113
    .restart local v0       #i:I
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1119
    .end local v0           #i:I
    .end local v1           #sb:Ljava/lang/StringBuffer;
    :cond_2
    const-string v3, "smb://"

    goto :goto_2
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1131
    iget-object v0, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrincipal()Ljava/security/Principal;
    .locals 1

    .prologue
    .line 1049
    iget-object v0, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    return-object v0
.end method

.method public getSecurity()[Ljcifs/smb/ACE;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2975
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljcifs/smb/SmbFile;->getSecurity(Z)[Ljcifs/smb/ACE;

    move-result-object v0

    return-object v0
.end method

.method public getSecurity(Z)[Ljcifs/smb/ACE;
    .locals 10
    .parameter "resolveSids"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 2892
    const/high16 v7, 0x2

    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v5

    :goto_0
    invoke-virtual {p0, v5, v7, v6, v4}, Ljcifs/smb/SmbFile;->open0(IIII)I

    move-result v1

    .line 2898
    .local v1, f:I
    new-instance v2, Ljcifs/smb/NtTransQuerySecurityDesc;

    const/4 v4, 0x4

    invoke-direct {v2, v1, v4}, Ljcifs/smb/NtTransQuerySecurityDesc;-><init>(II)V

    .line 2899
    .local v2, request:Ljcifs/smb/NtTransQuerySecurityDesc;
    new-instance v3, Ljcifs/smb/NtTransQuerySecurityDescResponse;

    invoke-direct {v3}, Ljcifs/smb/NtTransQuerySecurityDescResponse;-><init>()V

    .line 2902
    .local v3, response:Ljcifs/smb/NtTransQuerySecurityDescResponse;
    :try_start_0
    invoke-virtual {p0, v2, v3}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2904
    invoke-virtual {p0, v1, v8, v9}, Ljcifs/smb/SmbFile;->close(IJ)V

    .line 2907
    iget-object v4, v3, Ljcifs/smb/NtTransQuerySecurityDescResponse;->securityDescriptor:Ljcifs/smb/SecurityDescriptor;

    iget-object v0, v4, Ljcifs/smb/SecurityDescriptor;->aces:[Ljcifs/smb/ACE;

    .line 2908
    .local v0, aces:[Ljcifs/smb/ACE;
    if-eqz v0, :cond_0

    .line 2909
    invoke-direct {p0, v0, p1}, Ljcifs/smb/SmbFile;->processAces([Ljcifs/smb/ACE;Z)V

    .line 2911
    :cond_0
    return-object v0

    .end local v0           #aces:[Ljcifs/smb/ACE;
    .end local v1           #f:I
    .end local v2           #request:Ljcifs/smb/NtTransQuerySecurityDesc;
    .end local v3           #response:Ljcifs/smb/NtTransQuerySecurityDescResponse;
    :cond_1
    move v4, v6

    .line 2892
    goto :goto_0

    .line 2903
    .restart local v1       #f:I
    .restart local v2       #request:Ljcifs/smb/NtTransQuerySecurityDesc;
    .restart local v3       #response:Ljcifs/smb/NtTransQuerySecurityDescResponse;
    :catchall_0
    move-exception v4

    .line 2904
    invoke-virtual {p0, v1, v8, v9}, Ljcifs/smb/SmbFile;->close(IJ)V

    .line 2905
    throw v4
.end method

.method public getServer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1264
    iget-object v1, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 1265
    .local v0, str:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 1266
    const/4 v0, 0x0

    .line 1268
    .end local v0           #str:Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method getServerWithDfs()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1248
    iget-object v0, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    if-eqz v0, :cond_0

    .line 1249
    iget-object v0, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    iget-object v0, v0, Ljcifs/smb/DfsReferral;->server:Ljava/lang/String;

    .line 1251
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getShare()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1244
    iget-object v0, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    return-object v0
.end method

.method public getShareSecurity(Z)[Ljcifs/smb/ACE;
    .locals 10
    .parameter "resolveSids"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 2931
    iget-object v6, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 2936
    .local v3, p:Ljava/lang/String;
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Ljcifs/smb/SmbFile;->resolveDfs(Ljcifs/smb/ServerMessageBlock;)V

    .line 2937
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServerWithDfs()Ljava/lang/String;

    move-result-object v5

    .line 2939
    .local v5, server:Ljava/lang/String;
    new-instance v4, Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;

    iget-object v6, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v6, v6, Ljcifs/smb/SmbTree;->share:Ljava/lang/String;

    invoke-direct {v4, v5, v6}, Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2940
    .local v4, rpc:Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "ncacn_np:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "[\\PIPE\\srvsvc]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-static {v6, v7}, Ljcifs/dcerpc/DcerpcHandle;->getHandle(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/dcerpc/DcerpcHandle;

    move-result-object v1

    .line 2943
    .local v1, handle:Ljcifs/dcerpc/DcerpcHandle;
    :try_start_0
    invoke-virtual {v1, v4}, Ljcifs/dcerpc/DcerpcHandle;->sendrecv(Ljcifs/dcerpc/DcerpcMessage;)V

    .line 2944
    iget v6, v4, Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;->retval:I

    if-eqz v6, :cond_1

    .line 2945
    new-instance v6, Ljcifs/smb/SmbException;

    iget v7, v4, Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;->retval:I

    const/4 v8, 0x1

    invoke-direct {v6, v7, v8}, Ljcifs/smb/SmbException;-><init>(IZ)V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2949
    :catchall_0
    move-exception v6

    .line 2951
    :try_start_1
    invoke-virtual {v1}, Ljcifs/dcerpc/DcerpcHandle;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2956
    :cond_0
    :goto_0
    throw v6

    .line 2946
    :cond_1
    :try_start_2
    invoke-virtual {v4}, Ljcifs/dcerpc/msrpc/MsrpcShareGetInfo;->getSecurity()[Ljcifs/smb/ACE;

    move-result-object v0

    .line 2947
    .local v0, aces:[Ljcifs/smb/ACE;
    if-eqz v0, :cond_2

    .line 2948
    invoke-direct {p0, v0, p1}, Ljcifs/smb/SmbFile;->processAces([Ljcifs/smb/ACE;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2951
    :cond_2
    :try_start_3
    invoke-virtual {v1}, Ljcifs/dcerpc/DcerpcHandle;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 2958
    :cond_3
    :goto_1
    return-object v0

    .line 2952
    .end local v0           #aces:[Ljcifs/smb/ACE;
    :catch_0
    move-exception v2

    .line 2953
    .local v2, ioe:Ljava/io/IOException;
    sget v7, Ljcifs/util/LogStream;->level:I

    if-lt v7, v9, :cond_0

    .line 2954
    sget-object v7, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v2, v7}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 2952
    .end local v2           #ioe:Ljava/io/IOException;
    .restart local v0       #aces:[Ljcifs/smb/ACE;
    :catch_1
    move-exception v2

    .line 2953
    .restart local v2       #ioe:Ljava/io/IOException;
    sget v6, Ljcifs/util/LogStream;->level:I

    if-lt v6, v9, :cond_3

    .line 2954
    sget-object v6, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v2, v6}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1
.end method

.method public getType()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 1277
    iget v3, p0, Ljcifs/smb/SmbFile;->type:I

    if-nez v3, :cond_0

    .line 1278
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_1

    .line 1279
    iput v4, p0, Ljcifs/smb/SmbFile;->type:I

    .line 1311
    :cond_0
    :goto_0
    iget v3, p0, Ljcifs/smb/SmbFile;->type:I

    :goto_1
    return v3

    .line 1280
    :cond_1
    iget-object v3, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 1282
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->connect0()V

    .line 1283
    iget-object v3, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    const-string v4, "IPC$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1284
    const/16 v3, 0x10

    iput v3, p0, Ljcifs/smb/SmbFile;->type:I

    goto :goto_0

    .line 1285
    :cond_2
    iget-object v3, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v3, v3, Ljcifs/smb/SmbTree;->service:Ljava/lang/String;

    const-string v4, "LPT1:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1286
    const/16 v3, 0x20

    iput v3, p0, Ljcifs/smb/SmbFile;->type:I

    goto :goto_0

    .line 1287
    :cond_3
    iget-object v3, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v3, v3, Ljcifs/smb/SmbTree;->service:Ljava/lang/String;

    const-string v4, "COMM"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1288
    const/16 v3, 0x40

    iput v3, p0, Ljcifs/smb/SmbFile;->type:I

    goto :goto_0

    .line 1290
    :cond_4
    const/16 v3, 0x8

    iput v3, p0, Ljcifs/smb/SmbFile;->type:I

    goto :goto_0

    .line 1292
    :cond_5
    iget-object v3, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    iget-object v3, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_7

    .line 1293
    :cond_6
    iput v5, p0, Ljcifs/smb/SmbFile;->type:I

    goto :goto_0

    .line 1297
    :cond_7
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 1301
    .local v0, addr:Ljcifs/UniAddress;
    invoke-virtual {v0}, Ljcifs/UniAddress;->getAddress()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljcifs/netbios/NbtAddress;

    if-eqz v3, :cond_9

    .line 1302
    invoke-virtual {v0}, Ljcifs/UniAddress;->getAddress()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljcifs/netbios/NbtAddress;

    invoke-virtual {v3}, Ljcifs/netbios/NbtAddress;->getNameType()I

    move-result v1

    .line 1303
    .local v1, code:I
    const/16 v3, 0x1d

    if-eq v1, v3, :cond_8

    const/16 v3, 0x1b

    if-ne v1, v3, :cond_9

    .line 1304
    :cond_8
    iput v5, p0, Ljcifs/smb/SmbFile;->type:I

    .line 1305
    iget v3, p0, Ljcifs/smb/SmbFile;->type:I

    goto :goto_1

    .line 1298
    .end local v0           #addr:Ljcifs/UniAddress;
    .end local v1           #code:I
    :catch_0
    move-exception v2

    .line 1299
    .local v2, uhe:Ljava/net/UnknownHostException;
    new-instance v3, Ljcifs/smb/SmbException;

    iget-object v4, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 1308
    .end local v2           #uhe:Ljava/net/UnknownHostException;
    .restart local v0       #addr:Ljcifs/UniAddress;
    :cond_9
    const/4 v3, 0x4

    iput v3, p0, Ljcifs/smb/SmbFile;->type:I

    goto/16 :goto_0
.end method

.method public getUncPath()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1210
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 1211
    iget-object v0, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1212
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\\\\"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1214
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\\\\"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    const/16 v2, 0x2f

    const/16 v3, 0x5c

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method getUncPath0()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v7, 0x0

    const/16 v9, 0x2e

    const/4 v11, 0x1

    const/16 v10, 0x2f

    .line 1135
    iget-object v8, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    if-nez v8, :cond_0

    .line 1136
    iget-object v8, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 1137
    .local v1, in:[C
    array-length v8, v1

    new-array v5, v8, [C

    .line 1138
    .local v5, out:[C
    array-length v2, v1

    .line 1142
    .local v2, length:I
    const/4 v6, 0x0

    .line 1143
    .local v6, state:I
    const/4 v3, 0x0

    .line 1144
    .local v3, o:I
    const/4 v0, 0x0

    .local v0, i:I
    move v4, v3

    .end local v3           #o:I
    .local v4, o:I
    :goto_0
    if-lt v0, v2, :cond_2

    .line 1181
    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v8, v5, v9, v4}, Ljava/lang/String;-><init>([CII)V

    iput-object v8, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    .line 1183
    if-le v4, v11, :cond_f

    .line 1184
    add-int/lit8 v3, v4, -0x1

    .line 1185
    .end local v4           #o:I
    .restart local v3       #o:I
    iget-object v7, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v7, v10, v11}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 1186
    if-gez v0, :cond_c

    .line 1187
    iget-object v7, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v7, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    .line 1188
    const-string v7, "\\"

    iput-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    .line 1202
    .end local v0           #i:I
    .end local v1           #in:[C
    .end local v2           #length:I
    .end local v3           #o:I
    .end local v5           #out:[C
    .end local v6           #state:I
    :cond_0
    :goto_1
    iget-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    :cond_1
    return-object v7

    .line 1145
    .restart local v0       #i:I
    .restart local v1       #in:[C
    .restart local v2       #length:I
    .restart local v4       #o:I
    .restart local v5       #out:[C
    .restart local v6       #state:I
    :cond_2
    packed-switch v6, :pswitch_data_0

    move v3, v4

    .line 1144
    .end local v4           #o:I
    .restart local v3       #o:I
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    move v4, v3

    .end local v3           #o:I
    .restart local v4       #o:I
    goto :goto_0

    .line 1147
    :pswitch_0
    aget-char v8, v1, v0

    if-ne v8, v10, :cond_1

    .line 1150
    add-int/lit8 v3, v4, 0x1

    .end local v4           #o:I
    .restart local v3       #o:I
    aget-char v8, v1, v0

    aput-char v8, v5, v4

    .line 1151
    const/4 v6, 0x1

    .line 1152
    goto :goto_2

    .line 1154
    .end local v3           #o:I
    .restart local v4       #o:I
    :pswitch_1
    aget-char v8, v1, v0

    if-ne v8, v10, :cond_4

    move v3, v4

    .line 1155
    .end local v4           #o:I
    .restart local v3       #o:I
    goto :goto_2

    .line 1156
    .end local v3           #o:I
    .restart local v4       #o:I
    :cond_4
    aget-char v8, v1, v0

    if-ne v8, v9, :cond_6

    .line 1157
    add-int/lit8 v8, v0, 0x1

    if-ge v8, v2, :cond_5

    add-int/lit8 v8, v0, 0x1

    aget-char v8, v1, v8

    if-ne v8, v10, :cond_6

    .line 1158
    :cond_5
    add-int/lit8 v0, v0, 0x1

    move v3, v4

    .line 1159
    .end local v4           #o:I
    .restart local v3       #o:I
    goto :goto_2

    .line 1160
    .end local v3           #o:I
    .restart local v4       #o:I
    :cond_6
    add-int/lit8 v8, v0, 0x1

    if-ge v8, v2, :cond_a

    .line 1161
    aget-char v8, v1, v0

    if-ne v8, v9, :cond_a

    .line 1162
    add-int/lit8 v8, v0, 0x1

    aget-char v8, v1, v8

    if-ne v8, v9, :cond_a

    .line 1163
    add-int/lit8 v8, v0, 0x2

    if-ge v8, v2, :cond_7

    add-int/lit8 v8, v0, 0x2

    aget-char v8, v1, v8

    if-ne v8, v10, :cond_a

    .line 1164
    :cond_7
    add-int/lit8 v0, v0, 0x2

    .line 1165
    if-ne v4, v11, :cond_8

    move v3, v4

    .end local v4           #o:I
    .restart local v3       #o:I
    goto :goto_2

    .end local v3           #o:I
    .restart local v4       #o:I
    :cond_8
    move v3, v4

    .line 1167
    .end local v4           #o:I
    .restart local v3       #o:I
    :cond_9
    add-int/lit8 v3, v3, -0x1

    .line 1168
    if-le v3, v11, :cond_3

    add-int/lit8 v8, v3, -0x1

    aget-char v8, v5, v8

    if-ne v8, v10, :cond_9

    goto :goto_2

    .line 1171
    .end local v3           #o:I
    .restart local v4       #o:I
    :cond_a
    const/4 v6, 0x2

    .line 1173
    :pswitch_2
    aget-char v8, v1, v0

    if-ne v8, v10, :cond_b

    .line 1174
    const/4 v6, 0x1

    .line 1176
    :cond_b
    add-int/lit8 v3, v4, 0x1

    .end local v4           #o:I
    .restart local v3       #o:I
    aget-char v8, v1, v0

    aput-char v8, v5, v4

    goto :goto_2

    .line 1189
    :cond_c
    if-ne v0, v3, :cond_d

    .line 1190
    iget-object v7, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v7, v11, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    .line 1191
    const-string v7, "\\"

    iput-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    goto :goto_1

    .line 1193
    :cond_d
    iget-object v7, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v7, v11, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    .line 1194
    iget-object v7, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    aget-char v8, v5, v3

    if-ne v8, v10, :cond_e

    .end local v3           #o:I
    :goto_3
    invoke-virtual {v7, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    .line 1195
    iget-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    const/16 v8, 0x5c

    invoke-virtual {v7, v10, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    goto/16 :goto_1

    .line 1194
    .restart local v3       #o:I
    :cond_e
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1198
    .end local v3           #o:I
    .restart local v4       #o:I
    :cond_f
    iput-object v7, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    .line 1199
    const-string v7, "\\"

    iput-object v7, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    goto/16 :goto_1

    .line 1145
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method declared-synchronized hasNextAddress()Z
    .locals 2

    .prologue
    .line 876
    monitor-enter p0

    :try_start_0
    iget v0, p0, Ljcifs/smb/SmbFile;->addressIndex:I

    iget-object v1, p0, Ljcifs/smb/SmbFile;->addresses:[Ljcifs/UniAddress;

    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 2699
    :try_start_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljcifs/UniAddress;->hashCode()I
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 2703
    .local v0, hash:I
    :goto_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 2704
    iget-object v2, p0, Ljcifs/smb/SmbFile;->canon:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    return v2

    .line 2700
    .end local v0           #hash:I
    :catch_0
    move-exception v1

    .line 2701
    .local v1, uhe:Ljava/net/UnknownHostException;
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getServer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .restart local v0       #hash:I
    goto :goto_0
.end method

.method isConnected()Z
    .locals 2

    .prologue
    .line 967
    iget-object v0, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    if-eqz v0, :cond_0

    iget-object v0, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget v0, v0, Ljcifs/smb/SmbTree;->connectionState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDirectory()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1487
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 1491
    :cond_0
    :goto_0
    return v0

    .line 1490
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 1491
    :cond_2
    iget v2, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v2, v2, 0x10

    const/16 v3, 0x10

    if-eq v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public isFile()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1501
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v1, :cond_1

    .line 1505
    :cond_0
    :goto_0
    return v0

    .line 1504
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 1505
    iget v2, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v2, v2, 0x10

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public isHidden()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1517
    iget-object v2, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 1526
    :cond_0
    :goto_0
    return v0

    .line 1519
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v1, :cond_2

    .line 1520
    iget-object v2, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    const-string v3, "$"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 1521
    goto :goto_0

    .line 1525
    :cond_2
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 1526
    iget v2, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v2, v2, 0x2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method isOpen()Z
    .locals 3

    .prologue
    .line 1011
    iget-boolean v1, p0, Ljcifs/smb/SmbFile;->opened:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p0, Ljcifs/smb/SmbFile;->tree_num:I

    iget-object v2, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget v2, v2, Ljcifs/smb/SmbTree;->tree_num:I

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    .line 1012
    .local v0, ans:Z
    :goto_0
    return v0

    .line 1011
    .end local v0           #ans:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isWorkgroup0()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x2

    .line 1314
    iget v2, p0, Ljcifs/smb/SmbFile;->type:I

    if-eq v2, v4, :cond_0

    iget-object v2, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 1315
    :cond_0
    iput v4, p0, Ljcifs/smb/SmbFile;->type:I

    move v2, v3

    .line 1331
    :goto_0
    return v2

    .line 1318
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    .line 1319
    iget-object v2, p0, Ljcifs/smb/SmbFile;->share:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 1320
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAddress()Ljcifs/UniAddress;

    move-result-object v0

    .line 1321
    .local v0, addr:Ljcifs/UniAddress;
    invoke-virtual {v0}, Ljcifs/UniAddress;->getAddress()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljcifs/netbios/NbtAddress;

    if-eqz v2, :cond_3

    .line 1322
    invoke-virtual {v0}, Ljcifs/UniAddress;->getAddress()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljcifs/netbios/NbtAddress;

    invoke-virtual {v2}, Ljcifs/netbios/NbtAddress;->getNameType()I

    move-result v1

    .line 1323
    .local v1, code:I
    const/16 v2, 0x1d

    if-eq v1, v2, :cond_2

    const/16 v2, 0x1b

    if-ne v1, v2, :cond_3

    .line 1324
    :cond_2
    iput v4, p0, Ljcifs/smb/SmbFile;->type:I

    move v2, v3

    .line 1325
    goto :goto_0

    .line 1328
    .end local v1           #code:I
    :cond_3
    const/4 v2, 0x4

    iput v2, p0, Ljcifs/smb/SmbFile;->type:I

    .line 1331
    .end local v0           #addr:Ljcifs/UniAddress;
    :cond_4
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public lastModified()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1578
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 1579
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 1580
    iget-wide v0, p0, Ljcifs/smb/SmbFile;->lastModified:J

    .line 1582
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public length()J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2439
    iget-wide v3, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    .line 2440
    iget-wide v3, p0, Ljcifs/smb/SmbFile;->size:J

    .line 2459
    :goto_0
    return-wide v3

    .line 2443
    :cond_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getType()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_1

    .line 2445
    const/4 v1, 0x1

    .line 2447
    .local v1, level:I
    new-instance v2, Ljcifs/smb/Trans2QueryFSInformationResponse;

    invoke-direct {v2, v1}, Ljcifs/smb/Trans2QueryFSInformationResponse;-><init>(I)V

    .line 2448
    .local v2, response:Ljcifs/smb/Trans2QueryFSInformationResponse;
    new-instance v3, Ljcifs/smb/Trans2QueryFSInformation;

    invoke-direct {v3, v1}, Ljcifs/smb/Trans2QueryFSInformation;-><init>(I)V

    invoke-virtual {p0, v3, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2450
    iget-object v3, v2, Ljcifs/smb/Trans2QueryFSInformationResponse;->info:Ljcifs/smb/AllocInfo;

    invoke-interface {v3}, Ljcifs/smb/AllocInfo;->getCapacity()J

    move-result-wide v3

    iput-wide v3, p0, Ljcifs/smb/SmbFile;->size:J

    .line 2458
    .end local v1           #level:I
    .end local v2           #response:Ljcifs/smb/Trans2QueryFSInformationResponse;
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sget-wide v5, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v3, v5

    iput-wide v3, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    .line 2459
    iget-wide v3, p0, Ljcifs/smb/SmbFile;->size:J

    goto :goto_0

    .line 2451
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_2

    iget v3, p0, Ljcifs/smb/SmbFile;->type:I

    const/16 v4, 0x10

    if-eq v3, v4, :cond_2

    .line 2452
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v3

    .line 2453
    const/16 v4, 0x102

    .line 2452
    invoke-virtual {p0, v3, v4}, Ljcifs/smb/SmbFile;->queryPath(Ljava/lang/String;I)Ljcifs/smb/Info;

    move-result-object v0

    .line 2454
    .local v0, info:Ljcifs/smb/Info;
    invoke-interface {v0}, Ljcifs/smb/Info;->getSize()J

    move-result-wide v3

    iput-wide v3, p0, Ljcifs/smb/SmbFile;->size:J

    goto :goto_1

    .line 2456
    .end local v0           #info:Ljcifs/smb/Info;
    :cond_2
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Ljcifs/smb/SmbFile;->size:J

    goto :goto_1
.end method

.method public list()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1606
    const-string v0, "*"

    const/16 v1, 0x16

    invoke-virtual {p0, v0, v1, v2, v2}, Ljcifs/smb/SmbFile;->list(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method list(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljava/lang/String;
    .locals 7
    .parameter "wildcard"
    .parameter "searchAttributes"
    .parameter "fnf"
    .parameter "ff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1708
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1709
    .local v1, list:Ljava/util/ArrayList;
    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Ljcifs/smb/SmbFile;->doEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V

    .line 1710
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public list(Ljcifs/smb/SmbFilenameFilter;)[Ljava/lang/String;
    .locals 3
    .parameter "filter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1619
    const-string v0, "*"

    const/16 v1, 0x16

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Ljcifs/smb/SmbFile;->list(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public listFiles()[Ljcifs/smb/SmbFile;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1648
    const-string v0, "*"

    const/16 v1, 0x16

    invoke-virtual {p0, v0, v1, v2, v2}, Ljcifs/smb/SmbFile;->listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method public listFiles(Ljava/lang/String;)[Ljcifs/smb/SmbFile;
    .locals 2
    .parameter "wildcard"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1681
    const/16 v0, 0x16

    invoke-virtual {p0, p1, v0, v1, v1}, Ljcifs/smb/SmbFile;->listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;
    .locals 7
    .parameter "wildcard"
    .parameter "searchAttributes"
    .parameter "fnf"
    .parameter "ff"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1714
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1715
    .local v1, list:Ljava/util/ArrayList;
    const/4 v2, 0x1

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Ljcifs/smb/SmbFile;->doEnum(Ljava/util/ArrayList;ZLjava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)V

    .line 1716
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljcifs/smb/SmbFile;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljcifs/smb/SmbFile;

    return-object v0
.end method

.method public listFiles(Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;
    .locals 3
    .parameter "filter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1704
    const-string v0, "*"

    const/16 v1, 0x16

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Ljcifs/smb/SmbFile;->listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method public listFiles(Ljcifs/smb/SmbFilenameFilter;)[Ljcifs/smb/SmbFile;
    .locals 3
    .parameter "filter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1693
    const-string v0, "*"

    const/16 v1, 0x16

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, p1, v2}, Ljcifs/smb/SmbFile;->listFiles(Ljava/lang/String;ILjcifs/smb/SmbFilenameFilter;Ljcifs/smb/SmbFileFilter;)[Ljcifs/smb/SmbFile;

    move-result-object v0

    return-object v0
.end method

.method public mkdir()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2516
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    .line 2518
    .local v0, path:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 2519
    new-instance v1, Ljcifs/smb/SmbException;

    const-string v2, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v1, v2}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2526
    :cond_0
    sget v1, Ljcifs/util/LogStream;->level:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_1

    .line 2527
    sget-object v1, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mkdir: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 2529
    :cond_1
    new-instance v1, Ljcifs/smb/SmbComCreateDirectory;

    invoke-direct {v1, v0}, Ljcifs/smb/SmbComCreateDirectory;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Ljcifs/smb/SmbFile;->blank_resp()Ljcifs/smb/SmbComBlankResponse;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2531
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    iput-wide v1, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2532
    return-void
.end method

.method public mkdirs()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2548
    :try_start_0
    new-instance v1, Ljcifs/smb/SmbFile;

    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getParent()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-direct {v1, v2, v3}, Ljcifs/smb/SmbFile;-><init>(Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2552
    .local v1, parent:Ljcifs/smb/SmbFile;
    invoke-virtual {v1}, Ljcifs/smb/SmbFile;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2553
    invoke-virtual {v1}, Ljcifs/smb/SmbFile;->mkdirs()V

    .line 2555
    :cond_0
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->mkdir()V

    .line 2556
    .end local v1           #parent:Ljcifs/smb/SmbFile;
    :goto_0
    return-void

    .line 2549
    :catch_0
    move-exception v0

    .line 2550
    .local v0, ioe:Ljava/io/IOException;
    goto :goto_0
.end method

.method open(IIII)V
    .locals 1
    .parameter "flags"
    .parameter "access"
    .parameter "attrs"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1003
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1009
    :goto_0
    return-void

    .line 1006
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Ljcifs/smb/SmbFile;->open0(IIII)I

    move-result v0

    iput v0, p0, Ljcifs/smb/SmbFile;->fid:I

    .line 1007
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljcifs/smb/SmbFile;->opened:Z

    .line 1008
    iget-object v0, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget v0, v0, Ljcifs/smb/SmbTree;->tree_num:I

    iput v0, p0, Ljcifs/smb/SmbFile;->tree_num:I

    goto :goto_0
.end method

.method open0(IIII)I
    .locals 11
    .parameter "flags"
    .parameter "access"
    .parameter "attrs"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v10, 0x1

    .line 972
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->connect0()V

    .line 974
    sget v1, Ljcifs/util/LogStream;->level:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    .line 975
    sget-object v1, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "open0: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 981
    :cond_0
    iget-object v1, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, v1, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v1, v1, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Ljcifs/smb/SmbTransport;->hasCapability(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 982
    new-instance v9, Ljcifs/smb/SmbComNTCreateAndXResponse;

    invoke-direct {v9}, Ljcifs/smb/SmbComNTCreateAndXResponse;-><init>()V

    .line 983
    .local v9, response:Ljcifs/smb/SmbComNTCreateAndXResponse;
    new-instance v0, Ljcifs/smb/SmbComNTCreateAndX;

    iget-object v1, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    iget v4, p0, Ljcifs/smb/SmbFile;->shareAccess:I

    move v2, p1

    move v3, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v7}, Ljcifs/smb/SmbComNTCreateAndX;-><init>(Ljava/lang/String;IIIIILjcifs/smb/ServerMessageBlock;)V

    .line 984
    .local v0, request:Ljcifs/smb/SmbComNTCreateAndX;
    instance-of v1, p0, Ljcifs/smb/SmbNamedPipe;

    if-eqz v1, :cond_1

    .line 985
    iget v1, v0, Ljcifs/smb/SmbComNTCreateAndX;->flags0:I

    or-int/lit8 v1, v1, 0x16

    iput v1, v0, Ljcifs/smb/SmbComNTCreateAndX;->flags0:I

    .line 986
    iget v1, v0, Ljcifs/smb/SmbComNTCreateAndX;->desiredAccess:I

    const/high16 v2, 0x2

    or-int/2addr v1, v2

    iput v1, v0, Ljcifs/smb/SmbComNTCreateAndX;->desiredAccess:I

    .line 987
    iput-boolean v10, v9, Ljcifs/smb/SmbComNTCreateAndXResponse;->isExtended:Z

    .line 989
    :cond_1
    invoke-virtual {p0, v0, v9}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 990
    iget v8, v9, Ljcifs/smb/SmbComNTCreateAndXResponse;->fid:I

    .line 991
    .local v8, f:I
    iget v1, v9, Ljcifs/smb/SmbComNTCreateAndXResponse;->extFileAttributes:I

    and-int/lit16 v1, v1, 0x7fff

    iput v1, p0, Ljcifs/smb/SmbFile;->attributes:I

    .line 992
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Ljcifs/smb/SmbFile;->attrExpirationPeriod:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 993
    iput-boolean v10, p0, Ljcifs/smb/SmbFile;->isExists:Z

    .line 1000
    .end local v0           #request:Ljcifs/smb/SmbComNTCreateAndX;
    .end local v9           #response:Ljcifs/smb/SmbComNTCreateAndXResponse;
    :goto_0
    return v8

    .line 995
    .end local v8           #f:I
    :cond_2
    new-instance v9, Ljcifs/smb/SmbComOpenAndXResponse;

    invoke-direct {v9}, Ljcifs/smb/SmbComOpenAndXResponse;-><init>()V

    .line 996
    .local v9, response:Ljcifs/smb/SmbComOpenAndXResponse;
    new-instance v1, Ljcifs/smb/SmbComOpenAndX;

    iget-object v2, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-direct {v1, v2, p2, p1, v7}, Ljcifs/smb/SmbComOpenAndX;-><init>(Ljava/lang/String;IILjcifs/smb/ServerMessageBlock;)V

    invoke-virtual {p0, v1, v9}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 997
    iget v8, v9, Ljcifs/smb/SmbComOpenAndXResponse;->fid:I

    .restart local v8       #f:I
    goto :goto_0
.end method

.method protected pathNamesPossiblyEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .parameter "path1"
    .parameter "path2"

    .prologue
    const/16 v0, 0x2f

    const/16 v3, 0x2e

    const/4 v1, 0x1

    .line 2712
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2713
    .local v2, p1:I
    invoke-virtual {p2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 2714
    .local v4, p2:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v5, v0, v2

    .line 2715
    .local v5, l1:I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v6, v0, v4

    .line 2718
    .local v6, l2:I
    if-le v5, v1, :cond_1

    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v3, :cond_1

    .line 2723
    :cond_0
    :goto_0
    return v1

    .line 2720
    :cond_1
    if-le v6, v1, :cond_2

    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v3, :cond_0

    .line 2723
    :cond_2
    if-ne v5, v6, :cond_3

    move-object v0, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method queryPath(Ljava/lang/String;I)Ljcifs/smb/Info;
    .locals 5
    .parameter "path"
    .parameter "infoLevel"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 1335
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->connect0()V

    .line 1337
    sget v1, Ljcifs/util/LogStream;->level:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    .line 1338
    sget-object v1, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "queryPath: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 1355
    :cond_0
    iget-object v1, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, v1, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v1, v1, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Ljcifs/smb/SmbTransport;->hasCapability(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1362
    new-instance v0, Ljcifs/smb/Trans2QueryPathInformationResponse;

    invoke-direct {v0, p2}, Ljcifs/smb/Trans2QueryPathInformationResponse;-><init>(I)V

    .line 1363
    .local v0, response:Ljcifs/smb/Trans2QueryPathInformationResponse;
    new-instance v1, Ljcifs/smb/Trans2QueryPathInformation;

    invoke-direct {v1, p1, p2}, Ljcifs/smb/Trans2QueryPathInformation;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p0, v1, v0}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 1365
    iget-object v0, v0, Ljcifs/smb/Trans2QueryPathInformationResponse;->info:Ljcifs/smb/Info;

    .line 1376
    .end local v0           #response:Ljcifs/smb/Trans2QueryPathInformationResponse;
    :goto_0
    return-object v0

    .line 1373
    :cond_1
    new-instance v0, Ljcifs/smb/SmbComQueryInformationResponse;

    .line 1374
    iget-object v1, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, v1, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v1, v1, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v1, v1, Ljcifs/smb/SmbTransport;->server:Ljcifs/smb/SmbTransport$ServerData;

    iget-short v1, v1, Ljcifs/smb/SmbTransport$ServerData;->serverTimeZone:S

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v1, v1

    const-wide/16 v3, 0x3c

    mul-long/2addr v1, v3

    .line 1373
    invoke-direct {v0, v1, v2}, Ljcifs/smb/SmbComQueryInformationResponse;-><init>(J)V

    .line 1375
    .local v0, response:Ljcifs/smb/SmbComQueryInformationResponse;
    new-instance v1, Ljcifs/smb/SmbComQueryInformation;

    invoke-direct {v1, p1}, Ljcifs/smb/SmbComQueryInformation;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v0}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    goto :goto_0
.end method

.method refresh()V
    .locals 2

    .prologue
    .line 2979
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    iput-wide v0, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    .line 2980
    return-void
.end method

.method public renameTo(Ljcifs/smb/SmbFile;)V
    .locals 5
    .parameter "dest"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 2055
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 2056
    :cond_0
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v0, v1}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2059
    :cond_1
    invoke-virtual {p0, v2}, Ljcifs/smb/SmbFile;->resolveDfs(Ljcifs/smb/ServerMessageBlock;)V

    .line 2060
    invoke-virtual {p1, v2}, Ljcifs/smb/SmbFile;->resolveDfs(Ljcifs/smb/ServerMessageBlock;)V

    .line 2062
    iget-object v0, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v1, p1, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    invoke-virtual {v0, v1}, Ljcifs/smb/SmbTree;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2063
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v0, v1}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2066
    :cond_2
    sget v0, Ljcifs/util/LogStream;->level:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_3

    .line 2067
    sget-object v0, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "renameTo: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 2069
    :cond_3
    iput-wide v3, p0, Ljcifs/smb/SmbFile;->sizeExpiration:J

    iput-wide v3, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2070
    iput-wide v3, p1, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2076
    new-instance v0, Ljcifs/smb/SmbComRename;

    iget-object v1, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    iget-object v2, p1, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljcifs/smb/SmbComRename;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Ljcifs/smb/SmbFile;->blank_resp()Ljcifs/smb/SmbComBlankResponse;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2077
    return-void
.end method

.method resolveDfs(Ljcifs/smb/ServerMessageBlock;)V
    .locals 14
    .parameter "request"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 666
    instance-of v8, p1, Ljcifs/smb/SmbComClose;

    if-eqz v8, :cond_1

    .line 769
    :cond_0
    :goto_0
    return-void

    .line 669
    :cond_1
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->connect0()V

    .line 671
    sget-object v8, Ljcifs/smb/SmbFile;->dfs:Ljcifs/smb/Dfs;

    .line 672
    iget-object v9, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v9, v9, Ljcifs/smb/SmbTree;->session:Ljcifs/smb/SmbSession;

    iget-object v9, v9, Ljcifs/smb/SmbSession;->transport:Ljcifs/smb/SmbTransport;

    iget-object v9, v9, Ljcifs/smb/SmbTransport;->tconHostName:Ljava/lang/String;

    .line 673
    iget-object v10, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-object v10, v10, Ljcifs/smb/SmbTree;->share:Ljava/lang/String;

    .line 674
    iget-object v11, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    .line 675
    iget-object v12, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    .line 671
    invoke-virtual {v8, v9, v10, v11, v12}, Ljcifs/smb/Dfs;->resolve(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/DfsReferral;

    move-result-object v1

    .line 676
    .local v1, dr:Ljcifs/smb/DfsReferral;
    if-eqz v1, :cond_e

    .line 677
    const/4 v5, 0x0

    .line 679
    .local v5, service:Ljava/lang/String;
    if-eqz p1, :cond_2

    .line 680
    iget-byte v8, p1, Ljcifs/smb/ServerMessageBlock;->command:B

    sparse-switch v8, :sswitch_data_0

    .line 691
    const-string v5, "A:"

    .line 695
    :cond_2
    :goto_1
    :pswitch_0
    move-object v6, v1

    .line 696
    .local v6, start:Ljcifs/smb/DfsReferral;
    const/4 v4, 0x0

    .line 700
    .local v4, se:Ljcifs/smb/SmbException;
    :cond_3
    :try_start_0
    sget v8, Ljcifs/util/LogStream;->level:I

    const/4 v9, 0x2

    if-lt v8, v9, :cond_4

    .line 701
    sget-object v8, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "DFS redirect: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljcifs/util/LogStream;->println(Ljava/lang/String;)V

    .line 703
    :cond_4
    iget-object v8, v1, Ljcifs/smb/DfsReferral;->server:Ljava/lang/String;

    invoke-static {v8}, Ljcifs/UniAddress;->getByName(Ljava/lang/String;)Ljcifs/UniAddress;

    move-result-object v0

    .line 704
    .local v0, addr:Ljcifs/UniAddress;
    iget-object v8, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v8}, Ljava/net/URL;->getPort()I

    move-result v8

    invoke-static {v0, v8}, Ljcifs/smb/SmbTransport;->getSmbTransport(Ljcifs/UniAddress;I)Ljcifs/smb/SmbTransport;

    move-result-object v7

    .line 710
    .local v7, trans:Ljcifs/smb/SmbTransport;
    invoke-virtual {v7}, Ljcifs/smb/SmbTransport;->connect()V

    .line 711
    iget-object v8, p0, Ljcifs/smb/SmbFile;->auth:Ljcifs/smb/NtlmPasswordAuthentication;

    invoke-virtual {v7, v8}, Ljcifs/smb/SmbTransport;->getSmbSession(Ljcifs/smb/NtlmPasswordAuthentication;)Ljcifs/smb/SmbSession;

    move-result-object v8

    iget-object v9, v1, Ljcifs/smb/DfsReferral;->share:Ljava/lang/String;

    invoke-virtual {v8, v9, v5}, Ljcifs/smb/SmbSession;->getSmbTree(Ljava/lang/String;Ljava/lang/String;)Ljcifs/smb/SmbTree;

    move-result-object v8

    iput-object v8, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    .line 713
    if-eq v1, v6, :cond_5

    iget-object v8, v1, Ljcifs/smb/DfsReferral;->key:Ljava/lang/String;

    if-eqz v8, :cond_5

    .line 714
    iget-object v8, v1, Ljcifs/smb/DfsReferral;->map:Ljava/util/Map;

    iget-object v9, v1, Ljcifs/smb/DfsReferral;->key:Ljava/lang/String;

    invoke-interface {v8, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 717
    :cond_5
    const/4 v4, 0x0

    .line 731
    .end local v0           #addr:Ljcifs/UniAddress;
    .end local v7           #trans:Ljcifs/smb/SmbTransport;
    :goto_2
    if-eqz v4, :cond_7

    .line 732
    throw v4

    .end local v4           #se:Ljcifs/smb/SmbException;
    .end local v6           #start:Ljcifs/smb/DfsReferral;
    :sswitch_0
    move-object v8, p1

    .line 683
    check-cast v8, Ljcifs/smb/SmbComTransaction;

    iget-byte v8, v8, Ljcifs/smb/SmbComTransaction;->subCommand:B

    and-int/lit16 v8, v8, 0xff

    packed-switch v8, :pswitch_data_0

    .line 687
    const-string v5, "A:"

    .line 689
    goto :goto_1

    .line 720
    .restart local v4       #se:Ljcifs/smb/SmbException;
    .restart local v6       #start:Ljcifs/smb/DfsReferral;
    :catch_0
    move-exception v3

    .line 721
    .local v3, ioe:Ljava/io/IOException;
    instance-of v8, v3, Ljcifs/smb/SmbException;

    if-eqz v8, :cond_6

    move-object v4, v3

    .line 722
    check-cast v4, Ljcifs/smb/SmbException;

    .line 728
    :goto_3
    iget-object v1, v1, Ljcifs/smb/DfsReferral;->next:Ljcifs/smb/DfsReferral;

    .line 729
    if-ne v1, v6, :cond_3

    goto :goto_2

    .line 724
    :cond_6
    new-instance v4, Ljcifs/smb/SmbException;

    .end local v4           #se:Ljcifs/smb/SmbException;
    iget-object v8, v1, Ljcifs/smb/DfsReferral;->server:Ljava/lang/String;

    invoke-direct {v4, v8, v3}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .restart local v4       #se:Ljcifs/smb/SmbException;
    goto :goto_3

    .line 734
    .end local v3           #ioe:Ljava/io/IOException;
    :cond_7
    sget v8, Ljcifs/util/LogStream;->level:I

    const/4 v9, 0x3

    if-lt v8, v9, :cond_8

    .line 735
    sget-object v8, Ljcifs/smb/SmbFile;->log:Ljcifs/util/LogStream;

    invoke-virtual {v8, v1}, Ljcifs/util/LogStream;->println(Ljava/lang/Object;)V

    .line 737
    :cond_8
    iput-object v1, p0, Ljcifs/smb/SmbFile;->dfsReferral:Ljcifs/smb/DfsReferral;

    .line 738
    iget v8, v1, Ljcifs/smb/DfsReferral;->pathConsumed:I

    if-gez v8, :cond_d

    .line 739
    iput v13, v1, Ljcifs/smb/DfsReferral;->pathConsumed:I

    .line 743
    :cond_9
    :goto_4
    iget-object v8, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    iget v9, v1, Ljcifs/smb/DfsReferral;->pathConsumed:I

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 744
    .local v2, dunc:Ljava/lang/String;
    const-string v8, ""

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 745
    const-string v2, "\\"

    .line 746
    :cond_a
    iget-object v8, v1, Ljcifs/smb/DfsReferral;->path:Ljava/lang/String;

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_b

    .line 747
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "\\"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, v1, Ljcifs/smb/DfsReferral;->path:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 749
    :cond_b
    iput-object v2, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    .line 750
    if-eqz p1, :cond_c

    .line 751
    iget-object v8, p1, Ljcifs/smb/ServerMessageBlock;->path:Ljava/lang/String;

    if-eqz v8, :cond_c

    .line 752
    iget-object v8, p1, Ljcifs/smb/ServerMessageBlock;->path:Ljava/lang/String;

    const-string v9, "\\"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 753
    const-string v8, "\\"

    invoke-virtual {v2, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    .line 754
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "\\"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 756
    :cond_c
    if-eqz p1, :cond_0

    .line 757
    iput-object v2, p1, Ljcifs/smb/ServerMessageBlock;->path:Ljava/lang/String;

    .line 758
    iget v8, p1, Ljcifs/smb/ServerMessageBlock;->flags2:I

    or-int/lit16 v8, v8, 0x1000

    iput v8, p1, Ljcifs/smb/ServerMessageBlock;->flags2:I

    goto/16 :goto_0

    .line 740
    .end local v2           #dunc:Ljava/lang/String;
    :cond_d
    iget v8, v1, Ljcifs/smb/DfsReferral;->pathConsumed:I

    iget-object v9, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-le v8, v9, :cond_9

    .line 741
    iget-object v8, p0, Ljcifs/smb/SmbFile;->unc:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    iput v8, v1, Ljcifs/smb/DfsReferral;->pathConsumed:I

    goto :goto_4

    .line 760
    .end local v4           #se:Ljcifs/smb/SmbException;
    .end local v5           #service:Ljava/lang/String;
    .end local v6           #start:Ljcifs/smb/DfsReferral;
    :cond_e
    iget-object v8, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    iget-boolean v8, v8, Ljcifs/smb/SmbTree;->inDomainDfs:Z

    if-eqz v8, :cond_f

    .line 761
    instance-of v8, p1, Ljcifs/smb/NtTransQuerySecurityDesc;

    if-nez v8, :cond_f

    .line 762
    instance-of v8, p1, Ljcifs/smb/SmbComClose;

    if-nez v8, :cond_f

    .line 763
    instance-of v8, p1, Ljcifs/smb/SmbComFindClose2;

    if-nez v8, :cond_f

    .line 764
    new-instance v8, Ljcifs/smb/SmbException;

    const v9, -0x3ffffddb

    invoke-direct {v8, v9, v13}, Ljcifs/smb/SmbException;-><init>(IZ)V

    throw v8

    .line 766
    :cond_f
    if-eqz p1, :cond_0

    .line 767
    iget v8, p1, Ljcifs/smb/ServerMessageBlock;->flags2:I

    and-int/lit16 v8, v8, -0x1001

    iput v8, p1, Ljcifs/smb/ServerMessageBlock;->flags2:I

    goto/16 :goto_0

    .line 680
    :sswitch_data_0
    .sparse-switch
        0x25 -> :sswitch_0
        0x32 -> :sswitch_0
    .end sparse-switch

    .line 683
    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_0
    .end packed-switch
.end method

.method send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    .locals 2
    .parameter "request"
    .parameter "response"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 773
    :goto_0
    invoke-virtual {p0, p1}, Ljcifs/smb/SmbFile;->resolveDfs(Ljcifs/smb/ServerMessageBlock;)V

    .line 775
    :try_start_0
    iget-object v1, p0, Ljcifs/smb/SmbFile;->tree:Ljcifs/smb/SmbTree;

    invoke-virtual {v1, p1, p2}, Ljcifs/smb/SmbTree;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V
    :try_end_0
    .catch Ljcifs/smb/DfsReferral; {:try_start_0 .. :try_end_0} :catch_0

    .line 784
    return-void

    .line 777
    :catch_0
    move-exception v0

    .line 778
    .local v0, dre:Ljcifs/smb/DfsReferral;
    iget-boolean v1, v0, Ljcifs/smb/DfsReferral;->resolveHashes:Z

    if-eqz v1, :cond_0

    .line 779
    throw v0

    .line 781
    :cond_0
    invoke-virtual {p1}, Ljcifs/smb/ServerMessageBlock;->reset()V

    goto :goto_0
.end method

.method public setAttributes(I)V
    .locals 6
    .parameter "attrs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 2643
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2644
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v0, v1}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2646
    :cond_0
    and-int/lit16 v1, p1, 0x30a7

    move-object v0, p0

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljcifs/smb/SmbFile;->setPathInformation(IJJ)V

    .line 2647
    return-void
.end method

.method public setCreateTime(J)V
    .locals 6
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2595
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2596
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v0, v1}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2599
    :cond_0
    const/4 v1, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-wide v2, p1

    invoke-virtual/range {v0 .. v5}, Ljcifs/smb/SmbFile;->setPathInformation(IJJ)V

    .line 2600
    return-void
.end method

.method public setLastModified(J)V
    .locals 6
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2611
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getUncPath0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2612
    new-instance v0, Ljcifs/smb/SmbException;

    const-string v1, "Invalid operation for workgroups, servers, or shares"

    invoke-direct {v0, v1}, Ljcifs/smb/SmbException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2615
    :cond_0
    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    move-object v0, p0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Ljcifs/smb/SmbFile;->setPathInformation(IJJ)V

    .line 2616
    return-void
.end method

.method setPathInformation(IJJ)V
    .locals 10
    .parameter "attrs"
    .parameter "ctime"
    .parameter "mtime"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v2, 0x1

    .line 2573
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->exists()Z

    .line 2574
    iget v0, p0, Ljcifs/smb/SmbFile;->attributes:I

    and-int/lit8 v7, v0, 0x10

    .line 2576
    .local v7, dir:I
    const/16 v3, 0x100

    .line 2577
    if-eqz v7, :cond_0

    move v0, v2

    .line 2576
    :goto_0
    invoke-virtual {p0, v2, v3, v7, v0}, Ljcifs/smb/SmbFile;->open0(IIII)I

    move-result v1

    .line 2578
    .local v1, f:I
    new-instance v0, Ljcifs/smb/Trans2SetFileInformation;

    or-int v2, p1, v7

    move-wide v3, p2

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Ljcifs/smb/Trans2SetFileInformation;-><init>(IIJJ)V

    .line 2579
    new-instance v2, Ljcifs/smb/Trans2SetFileInformationResponse;

    invoke-direct {v2}, Ljcifs/smb/Trans2SetFileInformationResponse;-><init>()V

    .line 2578
    invoke-virtual {p0, v0, v2}, Ljcifs/smb/SmbFile;->send(Ljcifs/smb/ServerMessageBlock;Ljcifs/smb/ServerMessageBlock;)V

    .line 2580
    invoke-virtual {p0, v1, v8, v9}, Ljcifs/smb/SmbFile;->close(IJ)V

    .line 2582
    iput-wide v8, p0, Ljcifs/smb/SmbFile;->attrExpiration:J

    .line 2583
    return-void

    .line 2577
    .end local v1           #f:I
    :cond_0
    const/16 v0, 0x40

    goto :goto_0
.end method

.method public setReadOnly()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2656
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAttributes()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljcifs/smb/SmbFile;->setAttributes(I)V

    .line 2657
    return-void
.end method

.method public setReadWrite()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/smb/SmbException;
        }
    .end annotation

    .prologue
    .line 2666
    invoke-virtual {p0}, Ljcifs/smb/SmbFile;->getAttributes()I

    move-result v0

    and-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v0}, Ljcifs/smb/SmbFile;->setAttributes(I)V

    .line 2667
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2794
    iget-object v0, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toURL()Ljava/net/URL;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 2680
    iget-object v0, p0, Ljcifs/smb/SmbFile;->url:Ljava/net/URL;

    return-object v0
.end method
