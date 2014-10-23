.class abstract Lcom/bv/wifisync/AddFilter$ExtensionsRow;
.super Lcom/bv/wifisync/AddFilter$FilterRow;
.source "AddFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "ExtensionsRow"
.end annotation


# instance fields
.field protected extensions:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;Ljava/util/LinkedHashSet;)V
    .locals 1
    .parameter
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
    .line 109
    .local p2, extensions:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 110
    const v0, 0x7f0601a1

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$FilterRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 111
    iput-object p2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->extensions:Ljava/util/LinkedHashSet;

    .line 112
    return-void
.end method


# virtual methods
.method protected getEnabled()Z
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPhoneDir()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/Job;->getPcDir()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 4

    .prologue
    .line 125
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->extensions:Ljava/util/LinkedHashSet;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->hasData(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 126
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const v3, 0x7f060115

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 130
    :cond_0
    return-object v1

    .line 127
    :cond_1
    const-string v1, ""

    .line 128
    .local v1, result:Ljava/lang/String;
    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->extensions:Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 129
    .local v0, extension:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #calls: Lcom/bv/wifisync/AddFilter;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v1, v0}, Lcom/bv/wifisync/AddFilter;->access$5(Lcom/bv/wifisync/AddFilter;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "arg0"

    .prologue
    .line 116
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    const-class v2, Lcom/bv/wifisync/AddExtensions;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 117
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 118
    const-string v1, "RESULT1"

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v2

    iget-object v2, v2, Lcom/bv/wifisync/Job;->host:Lcom/bv/wifisync/Host;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 119
    const-string v1, "RESULT2"

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->extensions:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 120
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    iget-object v2, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/bv/wifisync/AddFilter;->startActivityForResult(Landroid/content/Intent;I)V

    .line 121
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
    .line 136
    check-cast p1, Ljava/util/LinkedHashSet;

    .end local p1
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$ExtensionsRow;->extensions:Ljava/util/LinkedHashSet;

    .line 137
    return-void
.end method
