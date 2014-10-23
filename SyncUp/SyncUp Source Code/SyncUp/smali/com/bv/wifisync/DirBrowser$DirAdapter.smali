.class Lcom/bv/wifisync/DirBrowser$DirAdapter;
.super Landroid/widget/ArrayAdapter;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DirAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/bv/wifisync/DirBrowser$FileInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Ljava/util/ArrayList;)V
    .locals 1
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
    .line 939
    .local p2, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 940
    const v0, 0x7f0a000a

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 941
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    .line 942
    return-void
.end method


# virtual methods
.method public add(Ljava/util/ArrayList;)V
    .locals 3
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
    .line 991
    .local p1, result:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->clear()V

    .line 992
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 994
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 995
    return-void

    .line 992
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 993
    .local v0, file:Lcom/bv/wifisync/DirBrowser$FileInfo;
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 955
    move-object v4, p2

    .line 956
    .local v4, result:Landroid/view/View;
    if-nez v4, :cond_0

    .line 957
    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v8}, Lcom/bv/wifisync/DirBrowser;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    .line 958
    .local v7, vi:Landroid/view/LayoutInflater;
    const v8, 0x7f030003

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 960
    .end local v7           #vi:Landroid/view/LayoutInflater;
    :cond_0
    const v8, 0x7f0a000a

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 961
    .local v6, textView:Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 962
    .local v3, item:Lcom/bv/wifisync/DirBrowser$FileInfo;
    iget-object v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v8}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v5

    .line 963
    .local v5, text:Ljava/lang/String;
    iget-object v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    instance-of v8, v8, Lcom/bv/sync/RemoteFile;

    if-eqz v8, :cond_1

    .line 964
    invoke-static {v5}, Lcom/bv/wifisync/Utils;->urlToPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 965
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "<big>"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</big>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 966
    iget-boolean v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    if-nez v8, :cond_4

    .line 967
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "<br/>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 968
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "<small><b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 969
    iget-wide v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J

    const-wide/16 v10, -0x1

    cmp-long v8, v8, v10

    if-eqz v8, :cond_2

    .line 970
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-wide v10, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J

    invoke-static {v9, v10, v11}, Lcom/bv/wifisync/Utils;->toDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 971
    :cond_2
    iget-wide v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    const-wide/16 v10, -0x1

    cmp-long v8, v8, v10

    if-eqz v8, :cond_3

    .line 972
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "\t\t"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v9, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    invoke-static {v9, v10}, Lcom/bv/wifisync/Utils;->humanReadableSize(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 973
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "</b></small>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 975
    :cond_4
    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 976
    const v8, 0x7f0a0004

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 977
    .local v2, imageView:Landroid/widget/ImageView;
    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v9, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    iget-boolean v10, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    #calls: Lcom/bv/wifisync/DirBrowser;->getItemImage(Lcom/bv/sync/IFile;Z)Landroid/graphics/drawable/Drawable;
    invoke-static {v8, v9, v10}, Lcom/bv/wifisync/DirBrowser;->access$10(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 978
    .local v1, image:Landroid/graphics/drawable/Drawable;
    iget-boolean v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    if-nez v8, :cond_5

    .line 979
    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v8, v1}, Lcom/bv/wifisync/DirBrowser;->scaleListImage(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 980
    :cond_5
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 981
    const v8, 0x7f0a0006

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 982
    .local v0, checkBox:Landroid/widget/CheckBox;
    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v8, v8, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    iget-boolean v8, v8, Lcom/bv/wifisync/DirBrowser$Options;->showSelection:Z

    if-eqz v8, :cond_6

    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->selection:Z
    invoke-static {v8}, Lcom/bv/wifisync/DirBrowser;->access$11(Lcom/bv/wifisync/DirBrowser;)Z

    move-result v8

    if-eqz v8, :cond_6

    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v8}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v8

    invoke-static {v8}, Lcom/bv/wifisync/Utils;->isRootRemoteFolder(Lcom/bv/sync/IFile;)Z

    move-result v8

    if-nez v8, :cond_6

    const/4 v8, 0x0

    :goto_0
    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 983
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 984
    iget-boolean v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 985
    iget-boolean v8, v3, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    if-eqz v8, :cond_7

    sget-object v8, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    :goto_1
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 986
    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 987
    return-object v4

    .line 982
    :cond_6
    const/16 v8, 0x8

    goto :goto_0

    .line 985
    :cond_7
    sget-object v8, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_1
.end method

.method refresh()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 945
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$8(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$DirFetcher;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 946
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$8(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$DirFetcher;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->cancel(Z)Z

    .line 947
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    const/4 v1, 0x0

    #setter for: Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;
    invoke-static {v0, v1}, Lcom/bv/wifisync/DirBrowser;->access$9(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$DirFetcher;)V

    .line 949
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    new-instance v1, Lcom/bv/wifisync/DirBrowser$DirFetcher;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {v1, v2}, Lcom/bv/wifisync/DirBrowser$DirFetcher;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    #setter for: Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;
    invoke-static {v0, v1}, Lcom/bv/wifisync/DirBrowser;->access$9(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$DirFetcher;)V

    .line 950
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$8(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$DirFetcher;

    move-result-object v0

    new-array v1, v3, [Lcom/bv/sync/IFile;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser$DirAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v3}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->run([Ljava/lang/Object;)V

    .line 951
    return-void
.end method
