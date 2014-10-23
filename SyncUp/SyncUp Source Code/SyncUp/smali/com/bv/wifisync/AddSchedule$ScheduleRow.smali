.class abstract Lcom/bv/wifisync/AddSchedule$ScheduleRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "AddSchedule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddSchedule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "ScheduleRow"
.end annotation


# instance fields
.field private final imageId:I

.field final synthetic this$0:Lcom/bv/wifisync/AddSchedule;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddSchedule;II)V
    .locals 0
    .parameter
    .parameter "name"
    .parameter "imageId"

    .prologue
    .line 144
    iput-object p1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    .line 145
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 146
    iput p3, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRow;->imageId:I

    .line 147
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 151
    iget v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRow;->imageId:I

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRow;->this$0:Lcom/bv/wifisync/AddSchedule;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddSchedule;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/bv/wifisync/AddSchedule$ScheduleRow;->imageId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 153
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method update(Ljava/lang/Object;)V
    .locals 0
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 156
    return-void
.end method
