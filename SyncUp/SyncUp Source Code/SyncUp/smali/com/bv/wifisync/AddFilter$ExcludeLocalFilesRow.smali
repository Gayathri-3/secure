.class Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;
.super Lcom/bv/wifisync/AddFilter$LocalFilesRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExcludeLocalFilesRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method private constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 0
    .parameter

    .prologue
    .line 303
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$LocalFilesRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bv/wifisync/AddFilter;Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 303
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;-><init>(Lcom/bv/wifisync/AddFilter;)V

    return-void
.end method


# virtual methods
.method protected getFilterFiles()Ljava/util/LinkedHashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 306
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, v0, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 307
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, v0, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    .line 308
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setFilterFiles(Ljava/util/LinkedHashSet;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p1, files:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$ExcludeLocalFilesRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iput-object p1, v0, Lcom/bv/wifisync/Job$Filter;->localFiles:Ljava/util/LinkedHashSet;

    .line 314
    return-void
.end method
