.class public Ljcifs/dcerpc/msrpc/SamrPolicyHandle;
.super Ljcifs/dcerpc/rpc$policy_handle;
.source "SamrPolicyHandle.java"


# direct methods
.method public constructor <init>(Ljcifs/dcerpc/DcerpcHandle;Ljava/lang/String;I)V
    .locals 5
    .parameter "handle"
    .parameter "server"
    .parameter "access"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Ljcifs/dcerpc/rpc$policy_handle;-><init>()V

    .line 28
    if-nez p2, :cond_0

    .line 29
    const-string p2, "\\\\"

    .line 30
    :cond_0
    new-instance v1, Ljcifs/dcerpc/msrpc/MsrpcSamrConnect4;

    invoke-direct {v1, p2, p3, p0}, Ljcifs/dcerpc/msrpc/MsrpcSamrConnect4;-><init>(Ljava/lang/String;ILjcifs/dcerpc/msrpc/SamrPolicyHandle;)V

    .line 32
    .local v1, rpc:Ljcifs/dcerpc/msrpc/MsrpcSamrConnect4;
    :try_start_0
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/DcerpcHandle;->sendrecv(Ljcifs/dcerpc/DcerpcMessage;)V
    :try_end_0
    .catch Ljcifs/dcerpc/DcerpcException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v0

    .line 34
    .local v0, de:Ljcifs/dcerpc/DcerpcException;
    invoke-virtual {v0}, Ljcifs/dcerpc/DcerpcException;->getErrorCode()I

    move-result v3

    const v4, 0x1c010002

    if-eq v3, v4, :cond_1

    .line 35
    throw v0

    .line 37
    :cond_1
    new-instance v2, Ljcifs/dcerpc/msrpc/MsrpcSamrConnect2;

    invoke-direct {v2, p2, p3, p0}, Ljcifs/dcerpc/msrpc/MsrpcSamrConnect2;-><init>(Ljava/lang/String;ILjcifs/dcerpc/msrpc/SamrPolicyHandle;)V

    .line 38
    .local v2, rpc2:Ljcifs/dcerpc/msrpc/MsrpcSamrConnect2;
    invoke-virtual {p1, v2}, Ljcifs/dcerpc/DcerpcHandle;->sendrecv(Ljcifs/dcerpc/DcerpcMessage;)V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    return-void
.end method
