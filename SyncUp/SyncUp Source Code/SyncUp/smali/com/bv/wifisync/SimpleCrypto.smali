.class Lcom/bv/wifisync/SimpleCrypto;
.super Ljava/lang/Object;
.source "SimpleCrypto.java"


# static fields
.field private static final HEX:Ljava/lang/String; = "0123456789ABCDEF"

.field private static SEED:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-string v0, "bv.software.limited"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/bv/wifisync/SimpleCrypto;->SEED:[B

    .line 58
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendHex(Ljava/lang/StringBuffer;B)V
    .locals 3
    .parameter "sb"
    .parameter "b"

    .prologue
    .line 61
    const-string v0, "0123456789ABCDEF"

    shr-int/lit8 v1, p1, 0x4

    and-int/lit8 v1, v1, 0xf

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "0123456789ABCDEF"

    and-int/lit8 v2, p1, 0xf

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 62
    return-void
.end method

.method private static crypt([BI)[B
    .locals 5
    .parameter "text"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 34
    const-string v0, "AES"

    .line 35
    .local v0, algo:Ljava/lang/String;
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-static {}, Lcom/bv/wifisync/SimpleCrypto;->getRawKey()[B

    move-result-object v3

    const-string v4, "AES"

    invoke-direct {v2, v3, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 36
    .local v2, keySpec:Ljavax/crypto/spec/SecretKeySpec;
    const-string v3, "AES"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 37
    .local v1, cipher:Ljavax/crypto/Cipher;
    invoke-virtual {v1, p1, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 38
    invoke-virtual {v1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    return-object v3
.end method

.method static decrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "encrypted"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-static {p0}, Lcom/bv/wifisync/SimpleCrypto;->toByte(Ljava/lang/String;)[B

    move-result-object v0

    .line 21
    .local v0, bytes:[B
    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/bv/wifisync/SimpleCrypto;->crypt([BI)[B

    move-result-object v1

    .line 22
    .local v1, crypt:[B
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V

    return-object v2
.end method

.method static encrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "cleartext"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/bv/wifisync/SimpleCrypto;->crypt([BI)[B

    move-result-object v0

    .line 16
    .local v0, crypt:[B
    invoke-static {v0}, Lcom/bv/wifisync/SimpleCrypto;->toHex([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getRawKey()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 26
    const-string v2, "SHA1PRNG"

    const-string v3, "Crypto"

    invoke-static {v2, v3}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v1

    .line 27
    .local v1, secureRandom:Ljava/security/SecureRandom;
    sget-object v2, Lcom/bv/wifisync/SimpleCrypto;->SEED:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->setSeed([B)V

    .line 28
    const-string v2, "AES"

    invoke-static {v2}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 29
    .local v0, keyGenerator:Ljavax/crypto/KeyGenerator;
    const/16 v2, 0x80

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 30
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v2

    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v2

    return-object v2
.end method

.method private static toByte(Ljava/lang/String;)[B
    .locals 5
    .parameter "hexString"

    .prologue
    .line 42
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v1, v3, 0x2

    .line 43
    .local v1, len:I
    new-array v2, v1, [B

    .line 44
    .local v2, result:[B
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 46
    return-object v2

    .line 45
    :cond_0
    mul-int/lit8 v3, v0, 0x2

    mul-int/lit8 v4, v0, 0x2

    add-int/lit8 v4, v4, 0x2

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->byteValue()B

    move-result v3

    aput-byte v3, v2, v0

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static toHex([B)Ljava/lang/String;
    .locals 3
    .parameter "buf"

    .prologue
    .line 50
    if-nez p0, :cond_0

    .line 51
    const-string v2, ""

    .line 55
    :goto_0
    return-object v2

    .line 52
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 53
    .local v1, result:Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_1

    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 54
    :cond_1
    aget-byte v2, p0, v0

    invoke-static {v1, v2}, Lcom/bv/wifisync/SimpleCrypto;->appendHex(Ljava/lang/StringBuffer;B)V

    .line 53
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
