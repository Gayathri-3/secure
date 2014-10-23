.class Lcom/bv/wifisync/AddExtensions$SelectedItem;
.super Ljava/lang/Object;
.source "AddExtensions.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SelectedItem"
.end annotation


# instance fields
.field count:I

.field final name:Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/wifisync/AddExtensions;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddExtensions;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "name"

    .prologue
    .line 160
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p2, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    .line 162
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 166
    if-eqz p2, :cond_0

    .line 167
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 170
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 171
    return-void

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 175
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 178
    return-void
.end method
