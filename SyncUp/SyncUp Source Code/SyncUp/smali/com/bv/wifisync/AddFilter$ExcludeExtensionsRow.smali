.class Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;
.super Lcom/bv/wifisync/AddFilter$ExtensionsRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExcludeExtensionsRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 1
    .parameter

    .prologue
    .line 158
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 159
    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {p1}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, v0, Lcom/bv/wifisync/Job$Filter;->extensions:Ljava/util/LinkedHashSet;

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$ExtensionsRow;-><init>(Lcom/bv/wifisync/AddFilter;Ljava/util/LinkedHashSet;)V

    .line 160
    return-void
.end method


# virtual methods
.method update(Ljava/lang/Object;)V
    .locals 2
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 164
    invoke-super {p0, p1}, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->update(Ljava/lang/Object;)V

    .line 165
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$ExcludeExtensionsRow;->extensions:Ljava/util/LinkedHashSet;

    iput-object v1, v0, Lcom/bv/wifisync/Job$Filter;->extensions:Ljava/util/LinkedHashSet;

    .line 166
    return-void
.end method
