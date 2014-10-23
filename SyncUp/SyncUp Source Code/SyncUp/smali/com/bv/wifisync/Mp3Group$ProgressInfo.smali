.class Lcom/bv/wifisync/Mp3Group$ProgressInfo;
.super Ljava/lang/Object;
.source "Mp3Group.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Mp3Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProgressInfo"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field percent:I

.field final synthetic this$0:Lcom/bv/wifisync/Mp3Group;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/Mp3Group;)V
    .locals 0
    .parameter

    .prologue
    .line 95
    iput-object p1, p0, Lcom/bv/wifisync/Mp3Group$ProgressInfo;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/Mp3Group;Lcom/bv/wifisync/Mp3Group$ProgressInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lcom/bv/wifisync/Mp3Group$ProgressInfo;-><init>(Lcom/bv/wifisync/Mp3Group;)V

    return-void
.end method
