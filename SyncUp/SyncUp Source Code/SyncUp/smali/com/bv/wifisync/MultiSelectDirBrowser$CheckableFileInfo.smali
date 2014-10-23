.class Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;
.super Lcom/bv/wifisync/DirBrowser$FileInfo;
.source "MultiSelectDirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/MultiSelectDirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CheckableFileInfo"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/MultiSelectDirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 0
    .parameter
    .parameter "fileInfo"

    .prologue
    .line 42
    iput-object p1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser$FileInfo;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    .line 44
    return-void
.end method

.method private update()V
    .locals 3

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->selected:Z

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    #getter for: Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    invoke-static {v0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$3(Lcom/bv/wifisync/MultiSelectDirBrowser;)Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    iget-object v2, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/bv/wifisync/MultiSelectDirBrowser;->fixPath(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$4(Lcom/bv/wifisync/MultiSelectDirBrowser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 68
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 69
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    #getter for: Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    invoke-static {v0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$3(Lcom/bv/wifisync/MultiSelectDirBrowser;)Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    iget-object v2, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/bv/wifisync/MultiSelectDirBrowser;->fixPath(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$4(Lcom/bv/wifisync/MultiSelectDirBrowser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method hasChidlren()Z
    .locals 5

    .prologue
    .line 72
    const-string v0, "/"

    .line 73
    .local v0, SEPARATOR:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v3}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, name:Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 77
    :cond_0
    iget-object v3, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    #getter for: Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    invoke-static {v3}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$3(Lcom/bv/wifisync/MultiSelectDirBrowser;)Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    move-result-object v3

    iget-object v3, v3, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    invoke-virtual {v3}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 80
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 77
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 78
    .local v1, item:Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 79
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser$FileInfo;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    .line 49
    invoke-direct {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->update()V

    .line 50
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 54
    instance-of v0, p1, Landroid/widget/CheckBox;

    if-eqz v0, :cond_0

    .line 55
    check-cast p1, Landroid/widget/CheckBox;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    iput-boolean v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->selected:Z

    .line 56
    invoke-direct {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->update()V

    .line 57
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 61
    :goto_0
    return-void

    .line 59
    .restart local p1
    :cond_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/DirBrowser$FileInfo;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method
