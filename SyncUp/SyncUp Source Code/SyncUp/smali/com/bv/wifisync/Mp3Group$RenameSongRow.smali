.class Lcom/bv/wifisync/Mp3Group$RenameSongRow;
.super Lcom/bv/wifisync/Mp3Group$GroupByRow;
.source "Mp3Group.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/Mp3Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RenameSongRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/Mp3Group;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/Mp3Group;)V
    .locals 1
    .parameter

    .prologue
    .line 85
    iput-object p1, p0, Lcom/bv/wifisync/Mp3Group$RenameSongRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    .line 86
    sget-object v0, Lcom/bv/wifisync/Mp3Group$RowType;->Rename:Lcom/bv/wifisync/Mp3Group$RowType;

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/Mp3Group$GroupByRow;-><init>(Lcom/bv/wifisync/Mp3Group;Lcom/bv/wifisync/Mp3Group$RowType;)V

    .line 87
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/bv/wifisync/Mp3Group$RenameSongRow;->this$0:Lcom/bv/wifisync/Mp3Group;

    invoke-virtual {v0}, Lcom/bv/wifisync/Mp3Group;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020015

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method
