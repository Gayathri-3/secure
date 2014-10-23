.class Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;
.super Lcom/bv/wifisync/DirBrowser$DirAdapter;
.source "MultiSelectDirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/MultiSelectDirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MultiSelectAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/MultiSelectDirBrowser;Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/DirBrowser$FileInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p2, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    iput-object p1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    .line 86
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser$DirAdapter;-><init>(Lcom/bv/wifisync/DirBrowser;Ljava/util/ArrayList;)V

    .line 87
    return-void
.end method


# virtual methods
.method public add(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/bv/wifisync/DirBrowser$FileInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    invoke-virtual {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->clear()V

    .line 109
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 111
    invoke-virtual {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->notifyDataSetChanged()V

    .line 112
    return-void

    .line 109
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 110
    .local v0, file:Lcom/bv/wifisync/DirBrowser$FileInfo;
    new-instance v2, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;

    iget-object v3, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    invoke-direct {v2, v3, v0}, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;-><init>(Lcom/bv/wifisync/MultiSelectDirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v4, 0x0

    .line 91
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 92
    .local v5, result:Landroid/view/View;
    const v7, 0x7f0a0006

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 93
    .local v1, checkBox:Landroid/widget/CheckBox;
    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 94
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;

    .line 95
    .local v3, item:Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;
    iget-object v7, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    iget-object v8, v3, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v8}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    #calls: Lcom/bv/wifisync/MultiSelectDirBrowser;->fixPath(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v7, v8}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$4(Lcom/bv/wifisync/MultiSelectDirBrowser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, absolutePath:Ljava/lang/String;
    iget-object v7, p0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;->this$0:Lcom/bv/wifisync/MultiSelectDirBrowser;

    #getter for: Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    invoke-static {v7}, Lcom/bv/wifisync/MultiSelectDirBrowser;->access$3(Lcom/bv/wifisync/MultiSelectDirBrowser;)Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    move-result-object v7

    iget-object v7, v7, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    invoke-virtual {v7, v0}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    .line 97
    .local v2, checked:Z
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 98
    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 99
    if-nez v2, :cond_0

    invoke-virtual {v3}, Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;->hasChidlren()Z

    move-result v7

    if-nez v7, :cond_0

    .line 100
    .local v4, mark:Z
    :goto_0
    const v7, 0x7f0a000a

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 101
    .local v6, textView:Landroid/widget/TextView;
    if-eqz v4, :cond_1

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    :goto_1
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 102
    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 103
    return-object v5

    .line 99
    .end local v4           #mark:Z
    .end local v6           #textView:Landroid/widget/TextView;
    :cond_0
    const/4 v4, 0x1

    goto :goto_0

    .line 101
    .restart local v4       #mark:Z
    .restart local v6       #textView:Landroid/widget/TextView;
    :cond_1
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_1
.end method
