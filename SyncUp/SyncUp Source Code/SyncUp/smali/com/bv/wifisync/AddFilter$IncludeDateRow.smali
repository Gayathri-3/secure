.class Lcom/bv/wifisync/AddFilter$IncludeDateRow;
.super Lcom/bv/wifisync/AddFilter$DateRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IncludeDateRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 0
    .parameter

    .prologue
    .line 420
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$IncludeDateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$DateRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$IncludeDateRow;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 420
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$IncludeDateRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    return-void
.end method


# virtual methods
.method protected getModified()I
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IncludeDateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget v0, v0, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    return v0
.end method

.method protected setModified(I)V
    .locals 1
    .parameter "value"

    .prologue
    .line 428
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IncludeDateRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iput p1, v0, Lcom/bv/wifisync/Job$Filter;->includeModifiedDate:I

    .line 429
    return-void
.end method
