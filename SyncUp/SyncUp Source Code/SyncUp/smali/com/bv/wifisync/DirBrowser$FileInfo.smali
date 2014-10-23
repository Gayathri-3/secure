.class public Lcom/bv/wifisync/DirBrowser$FileInfo;
.super Ljava/lang/Object;
.source "DirBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/DirBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "FileInfo"
.end annotation


# instance fields
.field final file:Lcom/bv/sync/IFile;

.field protected final isDirectory:Z

.field lastModified:J

.field length:J

.field protected selected:Z

.field final synthetic this$0:Lcom/bv/wifisync/DirBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter
    .parameter "file"

    .prologue
    const-wide/16 v2, -0x1

    .line 889
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 886
    iput-wide v2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    .line 887
    iput-wide v2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J

    .line 890
    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    .line 891
    const/4 v1, 0x0

    .line 893
    .local v1, isDir:Z
    :try_start_0
    invoke-interface {p2}, Lcom/bv/sync/IFile;->isDirectory()Z

    move-result v1

    .line 894
    invoke-interface {p2}, Lcom/bv/sync/IFile;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    .line 895
    invoke-interface {p2}, Lcom/bv/sync/IFile;->getLastModified()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 899
    :goto_0
    iput-boolean v1, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    .line 900
    return-void

    .line 896
    :catch_0
    move-exception v0

    .line 897
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;ZJJ)V
    .locals 2
    .parameter
    .parameter "file"
    .parameter "isDirectory"
    .parameter "length"
    .parameter "lastModified"

    .prologue
    const-wide/16 v0, -0x1

    .line 902
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 886
    iput-wide v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    .line 887
    iput-wide v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J

    .line 903
    iput-object p2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    .line 904
    iput-boolean p3, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    .line 905
    iput-wide p4, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    .line 906
    iput-wide p6, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J

    .line 907
    return-void
.end method

.method protected constructor <init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 8
    .parameter
    .parameter "fileInfo"

    .prologue
    .line 910
    iget-object v2, p2, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    iget-boolean v3, p2, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    iget-wide v4, p2, Lcom/bv/wifisync/DirBrowser$FileInfo;->length:J

    iget-wide v6, p2, Lcom/bv/wifisync/DirBrowser$FileInfo;->lastModified:J

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/bv/wifisync/DirBrowser$FileInfo;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;ZJJ)V

    .line 911
    iget-boolean v0, p2, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    iput-boolean v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    .line 912
    return-void
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 1

    .prologue
    .line 934
    iget-boolean v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    return v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 924
    iget-boolean v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    if-eq v0, p2, :cond_1

    .line 925
    iput-boolean p2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    .line 926
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;
    invoke-static {v0}, Lcom/bv/wifisync/DirBrowser;->access$6(Lcom/bv/wifisync/DirBrowser;)Landroid/view/Menu;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 927
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    #getter for: Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;
    invoke-static {v1}, Lcom/bv/wifisync/DirBrowser;->access$6(Lcom/bv/wifisync/DirBrowser;)Landroid/view/Menu;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 928
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v0, v0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 930
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 916
    iget-boolean v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    if-eqz v0, :cond_0

    .line 917
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    iget-object v2, v2, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    invoke-virtual {v0, v1, v2}, Lcom/bv/wifisync/DirBrowser;->selectDir(Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V

    .line 920
    :goto_0
    return-void

    .line 919
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser$FileInfo;->this$0:Lcom/bv/wifisync/DirBrowser;

    #calls: Lcom/bv/wifisync/DirBrowser;->viewSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    invoke-static {v0, p0}, Lcom/bv/wifisync/DirBrowser;->access$7(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    goto :goto_0
.end method
