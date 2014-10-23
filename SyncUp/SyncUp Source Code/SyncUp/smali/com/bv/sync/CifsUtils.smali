.class public Lcom/bv/sync/CifsUtils;
.super Ljava/lang/Object;
.source "CifsUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/sync/CifsUtils$HostInfo;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNetbiosInfo(Ljava/lang/String;)Lcom/bv/sync/CifsUtils$HostInfo;
    .locals 11
    .parameter "ip"

    .prologue
    .line 53
    :try_start_0
    invoke-static {p0}, Ljcifs/netbios/NbtAddress;->getAllByAddress(Ljava/lang/String;)[Ljcifs/netbios/NbtAddress;

    move-result-object v1

    .line 54
    .local v1, addresses:[Ljcifs/netbios/NbtAddress;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 55
    .local v2, domains:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 56
    .local v6, name:Ljava/lang/String;
    const/4 v4, 0x0

    .line 57
    .local v4, mac:[B
    array-length v8, v1

    const/4 v7, 0x0

    :goto_0
    if-lt v7, v8, :cond_0

    .line 69
    if-eqz v6, :cond_5

    .line 70
    new-instance v8, Lcom/bv/sync/CifsUtils$HostInfo;

    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-direct {v8, p0, v6, v4, v7}, Lcom/bv/sync/CifsUtils$HostInfo;-><init>(Ljava/lang/String;Ljava/lang/String;[B[Ljava/lang/String;)V

    move-object v7, v8

    .line 72
    .end local v1           #addresses:[Ljcifs/netbios/NbtAddress;
    .end local v2           #domains:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4           #mac:[B
    .end local v6           #name:Ljava/lang/String;
    :goto_1
    return-object v7

    .line 57
    .restart local v1       #addresses:[Ljcifs/netbios/NbtAddress;
    .restart local v2       #domains:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v4       #mac:[B
    .restart local v6       #name:Ljava/lang/String;
    :cond_0
    aget-object v0, v1, v7

    .line 58
    .local v0, address:Ljcifs/netbios/NbtAddress;
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getNameType()I

    move-result v9

    const/16 v10, 0x20

    if-ne v9, v10, :cond_4

    .line 59
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getHostName()Ljava/lang/String;

    move-result-object v6

    .line 62
    :cond_1
    :goto_2
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    .line 63
    .local v3, hostAddress:Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 64
    move-object p0, v3

    .line 65
    :cond_2
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getMacAddress()[B

    move-result-object v5

    .line 66
    .local v5, macAddress:[B
    invoke-static {v5}, Lcom/bv/sync/CifsUtils;->isEmpty([B)Z

    move-result v9

    if-nez v9, :cond_3

    .line 67
    move-object v4, v5

    .line 57
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 60
    .end local v3           #hostAddress:Ljava/lang/String;
    .end local v5           #macAddress:[B
    :cond_4
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getNameType()I

    move-result v9

    if-nez v9, :cond_1

    .line 61
    invoke-virtual {v0}, Ljcifs/netbios/NbtAddress;->getHostName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 71
    .end local v0           #address:Ljcifs/netbios/NbtAddress;
    .end local v1           #addresses:[Ljcifs/netbios/NbtAddress;
    .end local v2           #domains:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4           #mac:[B
    .end local v6           #name:Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 72
    :cond_5
    const/4 v7, 0x0

    goto :goto_1
.end method

.method private static isEmpty([B)Z
    .locals 4
    .parameter "macAddress"

    .prologue
    const/4 v1, 0x0

    .line 76
    if-eqz p0, :cond_0

    .line 77
    array-length v3, p0

    move v2, v1

    :goto_0
    if-lt v2, v3, :cond_2

    .line 80
    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1

    .line 77
    :cond_2
    aget-byte v0, p0, v2

    .line 78
    .local v0, b:B
    if-nez v0, :cond_1

    .line 77
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
