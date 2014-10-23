.class Lcom/bv/wifisync/Utils$LastNotification;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LastNotification"
.end annotation


# instance fields
.field final details:Ljava/lang/String;

.field final jobId:I

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .parameter "title"
    .parameter "details"
    .parameter "jobId"

    .prologue
    .line 549
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 550
    iput-object p1, p0, Lcom/bv/wifisync/Utils$LastNotification;->title:Ljava/lang/String;

    .line 551
    iput-object p2, p0, Lcom/bv/wifisync/Utils$LastNotification;->details:Ljava/lang/String;

    .line 552
    iput p3, p0, Lcom/bv/wifisync/Utils$LastNotification;->jobId:I

    .line 553
    return-void
.end method
