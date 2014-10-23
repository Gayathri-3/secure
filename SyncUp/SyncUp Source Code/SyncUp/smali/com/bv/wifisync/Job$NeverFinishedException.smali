.class Lcom/bv/wifisync/Job$NeverFinishedException;
.super Ljava/lang/Exception;
.source "Job.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Job;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NeverFinishedException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2b3d735f7c5ede9cL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 171
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 172
    return-void
.end method
