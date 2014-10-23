.class public Ljcifs/dcerpc/DcerpcException;
.super Ljava/io/IOException;
.source "DcerpcException.java"

# interfaces
.implements Ljcifs/dcerpc/DcerpcError;
.implements Ljcifs/smb/WinError;


# instance fields
.field private error:I

.field private rootCause:Ljava/lang/Throwable;


# direct methods
.method constructor <init>(I)V
    .locals 1
    .parameter "error"

    .prologue
    .line 52
    invoke-static {p1}, Ljcifs/dcerpc/DcerpcException;->getMessageByDcerpcError(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 53
    iput p1, p0, Ljcifs/dcerpc/DcerpcException;->error:I

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "msg"
    .parameter "rootCause"

    .prologue
    .line 59
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 60
    iput-object p2, p0, Ljcifs/dcerpc/DcerpcException;->rootCause:Ljava/lang/Throwable;

    .line 61
    return-void
.end method

.method static getMessageByDcerpcError(I)Ljava/lang/String;
    .locals 5
    .parameter "errcode"

    .prologue
    .line 30
    const/4 v2, 0x0

    .line 31
    .local v2, min:I
    sget-object v3, Ljcifs/dcerpc/DcerpcException;->DCERPC_FAULT_CODES:[I

    array-length v0, v3

    .line 33
    .local v0, max:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "0x"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x8

    invoke-static {p0, v4}, Ljcifs/util/Hexdump;->toHexString(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    return-object v3

    .line 34
    :cond_0
    add-int v3, v2, v0

    div-int/lit8 v1, v3, 0x2

    .line 36
    .local v1, mid:I
    sget-object v3, Ljcifs/dcerpc/DcerpcException;->DCERPC_FAULT_CODES:[I

    aget v3, v3, v1

    if-le p0, v3, :cond_1

    .line 37
    add-int/lit8 v2, v1, 0x1

    .line 38
    goto :goto_0

    :cond_1
    sget-object v3, Ljcifs/dcerpc/DcerpcException;->DCERPC_FAULT_CODES:[I

    aget v3, v3, v1

    if-ge p0, v3, :cond_2

    .line 39
    add-int/lit8 v0, v1, -0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    sget-object v3, Ljcifs/dcerpc/DcerpcException;->DCERPC_FAULT_MESSAGES:[Ljava/lang/String;

    aget-object v3, v3, v1

    goto :goto_1
.end method


# virtual methods
.method public getErrorCode()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Ljcifs/dcerpc/DcerpcException;->error:I

    return v0
.end method

.method public getRootCause()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Ljcifs/dcerpc/DcerpcException;->rootCause:Ljava/lang/Throwable;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 69
    iget-object v2, p0, Ljcifs/dcerpc/DcerpcException;->rootCause:Ljava/lang/Throwable;

    if-eqz v2, :cond_0

    .line 70
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 71
    .local v1, sw:Ljava/io/StringWriter;
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 72
    .local v0, pw:Ljava/io/PrintWriter;
    iget-object v2, p0, Ljcifs/dcerpc/DcerpcException;->rootCause:Ljava/lang/Throwable;

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-super {p0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 75
    .end local v0           #pw:Ljava/io/PrintWriter;
    .end local v1           #sw:Ljava/io/StringWriter;
    :goto_0
    return-object v2

    :cond_0
    invoke-super {p0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
