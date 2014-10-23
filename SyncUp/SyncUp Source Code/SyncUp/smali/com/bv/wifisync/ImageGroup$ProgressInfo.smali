.class Lcom/bv/wifisync/ImageGroup$ProgressInfo;
.super Ljava/lang/Object;
.source "ImageGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/ImageGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProgressInfo"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field percent:I

.field final synthetic this$0:Lcom/bv/wifisync/ImageGroup;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/ImageGroup;)V
    .locals 0
    .parameter

    .prologue
    .line 139
    iput-object p1, p0, Lcom/bv/wifisync/ImageGroup$ProgressInfo;->this$0:Lcom/bv/wifisync/ImageGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/ImageGroup;Lcom/bv/wifisync/ImageGroup$ProgressInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 139
    invoke-direct {p0, p1}, Lcom/bv/wifisync/ImageGroup$ProgressInfo;-><init>(Lcom/bv/wifisync/ImageGroup;)V

    return-void
.end method
