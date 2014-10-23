.class Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;
.super Landroid/widget/ArrayAdapter;
.source "DirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionBarAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/DirBrowser;)V
    .locals 1
    .parameter

    .prologue
    .line 132
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    .line 133
    const v0, 0x1090009

    invoke-direct {p0, p1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 134
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->refresh()V

    .line 135
    return-void
.end method

.method private refresh()V
    .locals 4

    .prologue
    .line 190
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->clear()V

    .line 191
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v2}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v2

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 192
    .local v1, path:Ljava/lang/String;
    :goto_0
    if-nez v1, :cond_0

    .line 197
    return-void

    .line 193
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 194
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->insert(Ljava/lang/Object;I)V

    .line 195
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private setCurrentDir(Ljava/lang/String;)V
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v1

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 181
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser;->access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;

    move-result-object v0

    .line 182
    .local v0, parent:Lcom/bv/sync/IFile;
    :goto_0
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 184
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    #setter for: Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;
    invoke-static {v1, v0}, Lcom/bv/wifisync/DirBrowser;->access$4(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;)V

    .line 185
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    .line 187
    .end local v0           #parent:Lcom/bv/sync/IFile;
    :cond_1
    return-void

    .line 183
    .restart local v0       #parent:Lcom/bv/sync/IFile;
    :cond_2
    invoke-interface {v0}, Lcom/bv/sync/IFile;->getParent()Lcom/bv/sync/IFile;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 13
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 146
    move-object v5, p2

    .line 147
    .local v5, result:Landroid/view/View;
    if-nez v5, :cond_0

    .line 148
    iget-object v9, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-virtual {v9}, Lcom/bv/wifisync/DirBrowser;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v8

    .line 149
    .local v8, vi:Landroid/view/LayoutInflater;
    const v9, 0x7f030003

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 151
    .end local v8           #vi:Landroid/view/LayoutInflater;
    :cond_0
    mul-int/lit8 v9, p1, 0x32

    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v10

    .line 152
    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I

    move-result v11

    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    move-result v12

    .line 151
    invoke-virtual {v5, v9, v10, v11, v12}, Landroid/view/View;->setPadding(IIII)V

    .line 153
    const v9, 0x7f0a000a

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 154
    .local v7, textView:Landroid/widget/TextView;
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 155
    .local v3, item:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 156
    .local v4, name:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_1

    .line 157
    const-string v4, "/"

    .line 158
    :cond_1
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "<big>"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "</big>"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 159
    .local v6, text:Ljava/lang/String;
    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    const v9, 0x7f0a0004

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 161
    .local v2, imageView:Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    new-instance v10, Lcom/bv/sync/LocalFile;

    invoke-direct {v10, v3}, Lcom/bv/sync/LocalFile;-><init>(Ljava/io/File;)V

    #calls: Lcom/bv/wifisync/DirBrowser;->getDirectoryImage(Lcom/bv/sync/IFile;)I
    invoke-static {v9, v10}, Lcom/bv/wifisync/DirBrowser;->access$2(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;)I

    move-result v1

    .line 162
    .local v1, image:I
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 163
    const v9, 0x7f0a0006

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 164
    .local v0, checkBox:Landroid/widget/CheckBox;
    const/16 v9, 0x8

    invoke-virtual {v0, v9}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 165
    return-object v5
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 139
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 140
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 141
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method onClick(I)Z
    .locals 2
    .parameter "position"

    .prologue
    .line 170
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->setCurrentDir(Ljava/lang/String;)V

    .line 171
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->refresh()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    const/4 v1, 0x1

    .line 176
    :goto_0
    return v1

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, e:Ljava/lang/Exception;
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-static {v1, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 176
    const/4 v1, 0x0

    goto :goto_0
.end method
