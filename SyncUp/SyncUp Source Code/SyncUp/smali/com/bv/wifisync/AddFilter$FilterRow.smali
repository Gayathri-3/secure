.class abstract Lcom/bv/wifisync/AddFilter$FilterRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "FilterRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;I)V
    .locals 0
    .parameter
    .parameter "name"

    .prologue
    .line 28
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$FilterRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;I)V

    .line 30
    return-void
.end method


# virtual methods
.method cancel()V
    .locals 0

    .prologue
    .line 33
    return-void
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
    .line 32
    return-void
.end method
