.class public Lcom/bv/sync/ErrorCodeException;
.super Ljava/io/IOException;
.source "ErrorCodeException.java"


# static fields
.field public static final ERROR_CREATE_DIR:I = 0x3

.field public static final ERROR_DELETE_FILE:I = 0x5

.field public static final ERROR_INVALID_TIMESTAMP:I = 0x7

.field public static final ERROR_NAME_COLLISION:I = 0x6

.field public static final ERROR_OUT_OF_DISK_SPACE:I = 0x8

.field public static final ERROR_READ_DIR:I = 0x2

.field public static final ERROR_RENAME_FILE:I = 0x4

.field public static final ERROR_SET_TIME:I = 0x1

.field private static final serialVersionUID:J = 0x6b0f5365f3b0f432L


# instance fields
.field public final errorCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .parameter "errorCode"
    .parameter "description"

    .prologue
    .line 18
    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 19
    iput p1, p0, Lcom/bv/sync/ErrorCodeException;->errorCode:I

    .line 20
    return-void
.end method
