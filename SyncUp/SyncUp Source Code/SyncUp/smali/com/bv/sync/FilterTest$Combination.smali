.class Lcom/bv/sync/FilterTest$Combination;
.super Ljava/lang/Object;
.source "FilterTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/FilterTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Combination"
.end annotation


# instance fields
.field dir:Lcom/bv/sync/IFile;

.field direction:Lcom/bv/sync/CifsSync$Options$Direction;

.field final synthetic this$0:Lcom/bv/sync/FilterTest;


# direct methods
.method constructor <init>(Lcom/bv/sync/FilterTest;Lcom/bv/sync/IFile;Lcom/bv/sync/CifsSync$Options$Direction;)V
    .locals 0
    .parameter
    .parameter "dir"
    .parameter "direction"

    .prologue
    .line 36
    iput-object p1, p0, Lcom/bv/sync/FilterTest$Combination;->this$0:Lcom/bv/sync/FilterTest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p2, p0, Lcom/bv/sync/FilterTest$Combination;->dir:Lcom/bv/sync/IFile;

    .line 38
    iput-object p3, p0, Lcom/bv/sync/FilterTest$Combination;->direction:Lcom/bv/sync/CifsSync$Options$Direction;

    .line 39
    return-void
.end method
