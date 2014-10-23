.class public abstract Ljcifs/smb/NtlmAuthenticator;
.super Ljava/lang/Object;
.source "NtlmAuthenticator.java"


# static fields
.field private static auth:Ljcifs/smb/NtlmAuthenticator;


# instance fields
.field private sae:Ljcifs/smb/SmbAuthException;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static requestNtlmPasswordAuthentication(Ljava/lang/String;Ljcifs/smb/SmbAuthException;)Ljcifs/smb/NtlmPasswordAuthentication;
    .locals 2
    .parameter "url"
    .parameter "sae"

    .prologue
    .line 61
    sget-object v0, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;

    if-nez v0, :cond_0

    .line 62
    const/4 v0, 0x0

    .line 67
    :goto_0
    return-object v0

    .line 64
    :cond_0
    sget-object v1, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;

    monitor-enter v1

    .line 65
    :try_start_0
    sget-object v0, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;

    iput-object p0, v0, Ljcifs/smb/NtlmAuthenticator;->url:Ljava/lang/String;

    .line 66
    sget-object v0, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;

    iput-object p1, v0, Ljcifs/smb/NtlmAuthenticator;->sae:Ljcifs/smb/SmbAuthException;

    .line 67
    sget-object v0, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;

    invoke-virtual {v0}, Ljcifs/smb/NtlmAuthenticator;->getNtlmPasswordAuthentication()Ljcifs/smb/NtlmPasswordAuthentication;

    move-result-object v0

    monitor-exit v1

    goto :goto_0

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Ljcifs/smb/NtlmAuthenticator;->url:Ljava/lang/String;

    .line 34
    iput-object v0, p0, Ljcifs/smb/NtlmAuthenticator;->sae:Ljcifs/smb/SmbAuthException;

    .line 35
    return-void
.end method

.method public static declared-synchronized setDefault(Ljcifs/smb/NtlmAuthenticator;)V
    .locals 2
    .parameter "a"

    .prologue
    .line 42
    const-class v1, Ljcifs/smb/NtlmAuthenticator;

    monitor-enter v1

    :try_start_0
    sget-object v0, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 46
    :goto_0
    monitor-exit v1

    return-void

    .line 45
    :cond_0
    :try_start_1
    sput-object p0, Ljcifs/smb/NtlmAuthenticator;->auth:Ljcifs/smb/NtlmAuthenticator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method protected getNtlmPasswordAuthentication()Ljcifs/smb/NtlmPasswordAuthentication;
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    return-object v0
.end method

.method protected final getRequestingException()Ljcifs/smb/SmbAuthException;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Ljcifs/smb/NtlmAuthenticator;->sae:Ljcifs/smb/SmbAuthException;

    return-object v0
.end method

.method protected final getRequestingURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Ljcifs/smb/NtlmAuthenticator;->url:Ljava/lang/String;

    return-object v0
.end method
