.class public Lcom/bv/wifisync/DirBrowser;
.super Lcom/bv/wifisync/BrowseActivity;
.source "DirBrowser.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/bv/wifisync/Clipboard$CutSubscriber;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;,
        Lcom/bv/wifisync/DirBrowser$DirAdapter;,
        Lcom/bv/wifisync/DirBrowser$DirFetcher;,
        Lcom/bv/wifisync/DirBrowser$FileInfo;,
        Lcom/bv/wifisync/DirBrowser$FileManagementTask;,
        Lcom/bv/wifisync/DirBrowser$NameComparator;,
        Lcom/bv/wifisync/DirBrowser$Options;,
        Lcom/bv/wifisync/DirBrowser$ProgressInfo;,
        Lcom/bv/wifisync/DirBrowser$StreamingThread;,
        Lcom/bv/wifisync/DirBrowser$Type;
    }
.end annotation


# instance fields
.field protected final VIEW_FILE_REQUEST_CODE:I

.field protected adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

.field private dir:Lcom/bv/sync/IFile;

.field private dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

.field private fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

.field protected lastError:Ljava/lang/Throwable;

.field private menu:Landroid/view/Menu;

.field protected options:Lcom/bv/wifisync/DirBrowser$Options;

.field private selection:Z

.field private streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/bv/wifisync/BrowseActivity;-><init>()V

    .line 71
    const/high16 v0, 0x1

    iput v0, p0, Lcom/bv/wifisync/DirBrowser;->VIEW_FILE_REQUEST_CODE:I

    .line 70
    return-void
.end method

.method static synthetic access$10(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;Z)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 998
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser;->getItemImage(Lcom/bv/sync/IFile;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$11(Lcom/bv/wifisync/DirBrowser;)Z
    .locals 1
    .parameter

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    return v0
.end method

.method static synthetic access$12(Lcom/bv/wifisync/DirBrowser;)V
    .locals 0
    .parameter

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->setTitle()V

    return-void
.end method

.method static synthetic access$13(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    .locals 1
    .parameter

    .prologue
    .line 73
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    return-object v0
.end method

.method static synthetic access$14(Lcom/bv/wifisync/DirBrowser;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 778
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->getSelectedInfos()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1013
    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser;->getDirectoryImage(Lcom/bv/sync/IFile;)I

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/sync/IFile;
    .locals 1
    .parameter

    .prologue
    .line 74
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 74
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    return-void
.end method

.method static synthetic access$5(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileManagementTask;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 73
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    return-void
.end method

.method static synthetic access$6(Lcom/bv/wifisync/DirBrowser;)Landroid/view/Menu;
    .locals 1
    .parameter

    .prologue
    .line 77
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;

    return-object v0
.end method

.method static synthetic access$7(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 320
    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser;->viewSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    return-void
.end method

.method static synthetic access$8(Lcom/bv/wifisync/DirBrowser;)Lcom/bv/wifisync/DirBrowser$DirFetcher;
    .locals 1
    .parameter

    .prologue
    .line 76
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    return-object v0
.end method

.method static synthetic access$9(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$DirFetcher;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 76
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    return-void
.end method

.method private copySelected()V
    .locals 1

    .prologue
    .line 761
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->getSelected()[Lcom/bv/sync/IFile;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bv/wifisync/DirBrowser;->copySelected([Lcom/bv/sync/IFile;)V

    .line 762
    return-void
.end method

.method private copySelected([Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "selected"

    .prologue
    .line 765
    invoke-static {p1}, Lcom/bv/wifisync/Clipboard;->copy([Lcom/bv/sync/IFile;)V

    .line 766
    const v0, 0x7f06019c

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/bv/wifisync/DirBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 767
    return-void
.end method

.method private createNewFolder()V
    .locals 6

    .prologue
    .line 796
    new-instance v2, Landroid/widget/EditText;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    const v4, 0x7f080002

    invoke-direct {v3, p0, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 797
    .local v2, inputName:Landroid/widget/EditText;
    const/4 v3, 0x1

    new-array v1, v3, [Landroid/text/InputFilter;

    const/4 v3, 0x0

    new-instance v4, Lcom/bv/wifisync/Utils$FileNameInputFilter;

    invoke-direct {v4}, Lcom/bv/wifisync/Utils$FileNameInputFilter;-><init>()V

    aput-object v4, v1, v3

    .line 798
    .local v1, filters:[Landroid/text/InputFilter;
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 799
    const/16 v3, 0x2000

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 801
    const v3, 0x7f060110

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 802
    const v4, 0x7f060113

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 804
    new-instance v5, Lcom/bv/wifisync/DirBrowser$7;

    invoke-direct {v5, p0, v2}, Lcom/bv/wifisync/DirBrowser$7;-><init>(Lcom/bv/wifisync/DirBrowser;Landroid/widget/EditText;)V

    .line 800
    invoke-static {p0, v3, v4, v2, v5}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v0

    .line 825
    .local v0, dialog:Landroid/app/AlertDialog;
    const v3, 0x7f02001a

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setIcon(I)V

    .line 826
    return-void
.end method

.method private cutSelected()V
    .locals 1

    .prologue
    .line 752
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->getSelected()[Lcom/bv/sync/IFile;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bv/wifisync/DirBrowser;->cutSelected([Lcom/bv/sync/IFile;)V

    .line 753
    return-void
.end method

.method private cutSelected([Lcom/bv/sync/IFile;)V
    .locals 4
    .parameter "selected"

    .prologue
    .line 756
    invoke-static {p1, p0}, Lcom/bv/wifisync/Clipboard;->cut([Lcom/bv/sync/IFile;Lcom/bv/wifisync/Clipboard$CutSubscriber;)V

    .line 757
    const v0, 0x7f06019d

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/bv/wifisync/DirBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 758
    return-void
.end method

.method private deleteSelected()V
    .locals 4

    .prologue
    .line 732
    const v0, 0x7f060117

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f060119

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-instance v3, Lcom/bv/wifisync/DirBrowser$6;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/DirBrowser$6;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/bv/wifisync/Dialogs;->showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V

    .line 742
    return-void
.end method

.method private deleteSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 5
    .parameter "selectedItem"

    .prologue
    .line 406
    const v0, 0x7f060117

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f06011a

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v4}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/bv/wifisync/DirBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-instance v3, Lcom/bv/wifisync/DirBrowser$4;

    invoke-direct {v3, p0, p1}, Lcom/bv/wifisync/DirBrowser$4;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/bv/wifisync/Dialogs;->showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V

    .line 414
    return-void
.end method

.method private find(CLandroid/text/Editable;)I
    .locals 2
    .parameter "c"
    .parameter "text"

    .prologue
    .line 398
    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_1

    .line 402
    const/4 v0, -0x1

    .end local v0           #i:I
    :cond_0
    return v0

    .line 399
    .restart local v0       #i:I
    :cond_1
    invoke-interface {p2, v0}, Landroid/text/Editable;->charAt(I)C

    move-result v1

    if-eq v1, p1, :cond_0

    .line 398
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method private getDirectoryImage(Lcom/bv/sync/IFile;)I
    .locals 6
    .parameter "item"

    .prologue
    const v3, 0x7f020032

    const v2, 0x7f020020

    const v4, 0x7f02001c

    .line 1014
    instance-of v5, p1, Lcom/bv/sync/LocalFile;

    if-eqz v5, :cond_8

    .line 1015
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 1016
    .local v0, path:Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 1017
    .local v1, sdPath:Ljava/lang/String;
    sget-object v5, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v5}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1034
    .end local v0           #path:Ljava/lang/String;
    .end local v1           #sdPath:Ljava/lang/String;
    :cond_0
    :goto_0
    return v2

    .line 1019
    .restart local v0       #path:Ljava/lang/String;
    .restart local v1       #sdPath:Ljava/lang/String;
    :cond_1
    sget-object v5, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    invoke-static {v5}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move v2, v3

    .line 1020
    goto :goto_0

    .line 1021
    :cond_2
    sget-object v5, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    invoke-static {v5}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    move v2, v4

    .line 1022
    goto :goto_0

    .line 1023
    :cond_3
    sget-object v5, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    invoke-static {v5}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1025
    sget-object v2, Landroid/os/Environment;->DIRECTORY_RINGTONES:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    move v2, v4

    .line 1026
    goto :goto_0

    .line 1027
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "/sdcard"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1028
    :cond_5
    const v2, 0x7f020029

    goto :goto_0

    .line 1029
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/Videos"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    move v2, v3

    .line 1030
    goto :goto_0

    .line 1031
    :cond_7
    sget-object v2, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1032
    const v2, 0x7f02000c

    goto/16 :goto_0

    .line 1034
    .end local v0           #path:Ljava/lang/String;
    .end local v1           #sdPath:Ljava/lang/String;
    :cond_8
    const v2, 0x7f02001a

    goto/16 :goto_0
.end method

.method private getItemImage(Lcom/bv/sync/IFile;Z)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter "item"
    .parameter "isDirectory"

    .prologue
    .line 999
    const/4 v0, 0x0

    .line 1000
    .local v0, imageId:I
    invoke-interface {p1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 1001
    .local v1, path:Ljava/lang/String;
    invoke-static {v1}, Lcom/bv/wifisync/Utils;->isDrive(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1002
    const v0, 0x7f02000d

    .line 1009
    :goto_0
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 1010
    :goto_1
    return-object v2

    .line 1003
    :cond_0
    invoke-static {v1}, Lcom/bv/wifisync/Utils;->isShare(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1004
    const v0, 0x7f02002b

    goto :goto_0

    .line 1005
    :cond_1
    if-eqz p2, :cond_2

    .line 1006
    invoke-direct {p0, p1}, Lcom/bv/wifisync/DirBrowser;->getDirectoryImage(Lcom/bv/sync/IFile;)I

    move-result v0

    goto :goto_0

    .line 1008
    :cond_2
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v3}, Lcom/bv/wifisync/Utils;->getFileImage(Landroid/content/Context;Ljava/io/File;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_1
.end method

.method private getSelected()[Lcom/bv/sync/IFile;
    .locals 7

    .prologue
    .line 770
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->getSelectedInfos()Ljava/util/List;

    move-result-object v4

    .line 771
    .local v4, selected:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v3, v5, [Lcom/bv/sync/IFile;

    .line 772
    .local v3, result:[Lcom/bv/sync/IFile;
    const/4 v1, 0x0

    .line 773
    .local v1, i:I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 775
    return-object v3

    .line 773
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 774
    .local v0, fileInfo:Lcom/bv/wifisync/DirBrowser$FileInfo;
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    iget-object v6, v0, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    aput-object v6, v3, v1

    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto :goto_0
.end method

.method private getSelectedInfos()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/bv/wifisync/DirBrowser$FileInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 779
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 780
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Lcom/bv/wifisync/DirBrowser$FileInfo;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v2}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getCount()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 783
    return-object v1

    .line 781
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/DirBrowser$FileInfo;

    iget-boolean v2, v2, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    if-eqz v2, :cond_1

    .line 782
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/DirBrowser$FileInfo;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 780
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private gotoDir()V
    .locals 4

    .prologue
    .line 699
    new-instance v0, Landroid/widget/EditText;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v2, 0x7f080002

    invoke-direct {v1, p0, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 700
    .local v0, edit:Landroid/widget/EditText;
    const/high16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 702
    const v1, 0x7f060112

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0600ed

    invoke-virtual {p0, v2}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/bv/wifisync/DirBrowser$5;

    invoke-direct {v3, p0, v0}, Lcom/bv/wifisync/DirBrowser$5;-><init>(Lcom/bv/wifisync/DirBrowser;Landroid/widget/EditText;)V

    invoke-static {p0, v1, v2, v0, v3}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    .line 729
    return-void
.end method

.method protected static internalSelectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;Landroid/content/Intent;)V
    .locals 1
    .parameter "parent"
    .parameter "start"
    .parameter "options"
    .parameter "intent"

    .prologue
    .line 96
    const-string v0, "RESULT"

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 97
    const-string v0, "options"

    invoke-virtual {p3, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 98
    iget-object v0, p2, Lcom/bv/wifisync/DirBrowser$Options;->requestCode:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 99
    invoke-virtual {p0, p3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 102
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p2, Lcom/bv/wifisync/DirBrowser$Options;->requestCode:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, p3, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private paste()V
    .locals 11

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    .line 315
    new-instance v1, Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    invoke-static {}, Lcom/bv/wifisync/Clipboard;->getDataType()Lcom/bv/wifisync/Clipboard$CopyType;

    move-result-object v0

    sget-object v2, Lcom/bv/wifisync/Clipboard$CopyType;->Cut:Lcom/bv/wifisync/Clipboard$CopyType;

    if-ne v0, v2, :cond_0

    sget-object v0, Lcom/bv/wifisync/DirBrowser$Type;->Move:Lcom/bv/wifisync/DirBrowser$Type;

    :goto_0
    invoke-direct {v1, p0, v0}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$Type;)V

    iput-object v1, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    .line 316
    iget-object v8, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    new-array v9, v3, [Lcom/bv/wifisync/DirBrowser$FileInfo;

    const/4 v10, 0x0

    new-instance v0, Lcom/bv/wifisync/DirBrowser$FileInfo;

    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    move-object v1, p0

    move-wide v6, v4

    invoke-direct/range {v0 .. v7}, Lcom/bv/wifisync/DirBrowser$FileInfo;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;ZJJ)V

    aput-object v0, v9, v10

    invoke-virtual {v8, v9}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->run([Ljava/lang/Object;)V

    .line 317
    const v0, 0x7f06010d

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showMessage(Landroid/content/Context;Ljava/lang/String;)V

    .line 318
    return-void

    .line 315
    :cond_0
    sget-object v0, Lcom/bv/wifisync/DirBrowser$Type;->Copy:Lcom/bv/wifisync/DirBrowser$Type;

    goto :goto_0
.end method

.method private renameSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 7
    .parameter "selectedItem"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 352
    new-instance v1, Landroid/widget/EditText;

    new-instance v3, Landroid/view/ContextThemeWrapper;

    const v4, 0x7f080002

    invoke-direct {v3, p0, v4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 353
    .local v1, inputName:Landroid/widget/EditText;
    new-array v0, v5, [Landroid/text/InputFilter;

    new-instance v3, Lcom/bv/wifisync/Utils$FileNameInputFilter;

    invoke-direct {v3}, Lcom/bv/wifisync/Utils$FileNameInputFilter;-><init>()V

    aput-object v3, v0, v6

    .line 354
    .local v0, filters:[Landroid/text/InputFilter;
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 355
    iget-object v3, p1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v3}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v2

    .line 356
    .local v2, name:Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 357
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 358
    :cond_0
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 360
    const v3, 0x7f06013e

    invoke-virtual {p0, v3}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f06013f

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v2, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/bv/wifisync/DirBrowser;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/bv/wifisync/DirBrowser$3;

    invoke-direct {v5, p0, v1, p1}, Lcom/bv/wifisync/DirBrowser$3;-><init>(Lcom/bv/wifisync/DirBrowser;Landroid/widget/EditText;Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    invoke-static {p0, v3, v4, v1, v5}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    .line 385
    invoke-direct {p0, v1}, Lcom/bv/wifisync/DirBrowser;->setSelection(Landroid/widget/EditText;)V

    .line 386
    return-void
.end method

.method private returnDir(Ljava/lang/String;)V
    .locals 2
    .parameter "path"

    .prologue
    .line 869
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 870
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 871
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/bv/wifisync/DirBrowser;->setResult(ILandroid/content/Intent;)V

    .line 872
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->finish()V

    .line 873
    return-void
.end method

.method private selectAll()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 745
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 747
    iput-boolean v2, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    .line 748
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 749
    return-void

    .line 746
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/DirBrowser$FileInfo;

    iput-boolean v2, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    .line 745
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V
    .locals 2
    .parameter "parent"
    .parameter "start"
    .parameter "options"

    .prologue
    .line 91
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/DirBrowser;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 92
    .local v0, intent:Landroid/content/Intent;
    invoke-static {p0, p1, p2, v0}, Lcom/bv/wifisync/DirBrowser;->internalSelectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;Landroid/content/Intent;)V

    .line 93
    return-void
.end method

.method private setSelection(Landroid/widget/EditText;)V
    .locals 3
    .parameter "editText"

    .prologue
    .line 389
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 390
    .local v1, text:Landroid/text/Editable;
    if-eqz v1, :cond_0

    .line 391
    const/16 v2, 0x2e

    invoke-direct {p0, v2, v1}, Lcom/bv/wifisync/DirBrowser;->find(CLandroid/text/Editable;)I

    move-result v0

    .line 392
    .local v0, end:I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 393
    invoke-virtual {p1, v0, v0}, Landroid/widget/EditText;->setSelection(II)V

    .line 395
    .end local v0           #end:I
    :cond_0
    return-void
.end method

.method private setTitle()V
    .locals 2

    .prologue
    .line 127
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    instance-of v1, v1, Lcom/bv/sync/RemoteFile;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/bv/wifisync/Utils;->urlToPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 128
    .local v0, title:Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->setTitle(Ljava/lang/CharSequence;)V

    .line 129
    return-void

    .line 127
    .end local v0           #title:Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private setupActionBar(Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
    .locals 2
    .parameter "actionBarAdapter"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 239
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 240
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    new-instance v1, Lcom/bv/wifisync/DirBrowser$2;

    invoke-direct {v1, p0, p1}, Lcom/bv/wifisync/DirBrowser$2;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/ActionBar;->setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V

    .line 247
    invoke-virtual {p1}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->getCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {p1}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 249
    :cond_0
    return-void
.end method

.method private setupListView()V
    .locals 2

    .prologue
    .line 833
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->createAdapter()Lcom/bv/wifisync/DirBrowser$DirAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    .line 834
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/DirBrowser;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 835
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getListView()Landroid/widget/ListView;

    move-result-object v0

    .line 836
    .local v0, listView:Landroid/widget/ListView;
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->registerForContextMenu(Landroid/view/View;)V

    .line 837
    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 838
    return-void
.end method

.method private setupSpinner(Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
    .locals 3
    .parameter "actionBarAdapter"

    .prologue
    const/4 v2, 0x0

    .line 212
    const v1, 0x1020016

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/DirBrowser;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 213
    .local v0, title:Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 214
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 215
    const v1, 0x1080002

    invoke-virtual {v0, v2, v2, v1, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 217
    new-instance v1, Lcom/bv/wifisync/DirBrowser$1;

    invoke-direct {v1, p0, p1}, Lcom/bv/wifisync/DirBrowser$1;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    :cond_0
    return-void
.end method

.method private showSelection()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 787
    iget-boolean v1, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    .line 788
    iget-boolean v1, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    if-nez v1, :cond_0

    .line 789
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 791
    .end local v0           #i:I
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 792
    iget-boolean v1, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    invoke-static {p0, v1}, Lcom/bv/wifisync/Config;->setShowEditMode(Landroid/content/Context;Z)V

    .line 793
    return-void

    .line 787
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 790
    .restart local v0       #i:I
    :cond_2
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/DirBrowser$FileInfo;

    iput-boolean v2, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->selected:Z

    .line 789
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private startStreaming(Lcom/bv/sync/IFile;)Ljava/io/File;
    .locals 4
    .parameter "selectedItem"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    sget-object v2, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 343
    .local v0, downloadDir:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-interface {p1}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 344
    .local v1, result:Ljava/io/File;
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    if-eqz v2, :cond_0

    .line 345
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    invoke-virtual {v2}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->cancel()V

    .line 346
    :cond_0
    new-instance v2, Lcom/bv/wifisync/DirBrowser$StreamingThread;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v1, v3}, Lcom/bv/wifisync/DirBrowser$StreamingThread;-><init>(Lcom/bv/wifisync/DirBrowser;Lcom/bv/sync/IFile;Ljava/io/File;Lcom/bv/wifisync/DirBrowser$StreamingThread;)V

    iput-object v2, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    .line 347
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    invoke-virtual {v2}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->start()V

    .line 348
    return-object v1
.end method

.method private viewSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V
    .locals 9
    .parameter "selectedItem"

    .prologue
    .line 322
    :try_start_0
    new-instance v1, Ljava/io/File;

    iget-object v5, p1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v5}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 323
    .local v1, file:Ljava/io/File;
    invoke-static {v1}, Lcom/bv/wifisync/Utils;->getFileTypeIntent(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v2

    .line 324
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v2, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v3

    .line 325
    .local v3, matches:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 326
    iget-object v5, p1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    instance-of v5, v5, Lcom/bv/sync/RemoteFile;

    if-eqz v5, :cond_1

    .line 327
    iget-object v5, p1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-direct {p0, v5}, Lcom/bv/wifisync/DirBrowser;->startStreaming(Lcom/bv/sync/IFile;)Ljava/io/File;

    move-result-object v4

    .line 328
    .local v4, streamingFile:Ljava/io/File;
    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 329
    const-wide/16 v5, 0x1f4

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 330
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_0

    .line 331
    const/high16 v5, 0x1

    invoke-virtual {p0, v2, v5}, Lcom/bv/wifisync/DirBrowser;->startActivityForResult(Landroid/content/Intent;I)V

    .line 339
    .end local v1           #file:Ljava/io/File;
    .end local v2           #intent:Landroid/content/Intent;
    .end local v3           #matches:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v4           #streamingFile:Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 333
    .restart local v1       #file:Ljava/io/File;
    .restart local v2       #intent:Landroid/content/Intent;
    .restart local v3       #matches:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :cond_1
    invoke-virtual {p0, v2}, Lcom/bv/wifisync/DirBrowser;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 336
    .end local v1           #file:Ljava/io/File;
    .end local v2           #intent:Landroid/content/Intent;
    .end local v3           #matches:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :catch_0
    move-exception v0

    .line 337
    .local v0, e:Ljava/lang/Exception;
    invoke-static {p0, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method protected createAdapter()Lcom/bv/wifisync/DirBrowser$DirAdapter;
    .locals 2

    .prologue
    .line 829
    new-instance v0, Lcom/bv/wifisync/DirBrowser$DirAdapter;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;-><init>(Lcom/bv/wifisync/DirBrowser;Ljava/util/ArrayList;)V

    return-object v0
.end method

.method protected getDefaultHelp()I
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    iget-boolean v0, v0, Lcom/bv/wifisync/DirBrowser$Options;->showButton:Z

    if-eqz v0, :cond_1

    .line 263
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    instance-of v0, v0, Lcom/bv/sync/LocalFile;

    if-eqz v0, :cond_0

    const v0, 0x7f0600dc

    .line 265
    :goto_0
    return v0

    .line 263
    :cond_0
    const v0, 0x7f0600dd

    goto :goto_0

    .line 265
    :cond_1
    const v0, 0x7f0600da

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 853
    if-eqz p3, :cond_0

    .line 854
    const-string v1, "lastError"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    iput-object v1, p0, Lcom/bv/wifisync/DirBrowser;->lastError:Ljava/lang/Throwable;

    .line 855
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->setHelp()V

    .line 857
    const/high16 v1, 0x1

    if-lt p1, v1, :cond_2

    .line 858
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    if-eqz v1, :cond_1

    .line 859
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->cancel()V

    .line 860
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->streamingThread:Lcom/bv/wifisync/DirBrowser$StreamingThread;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$StreamingThread;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 866
    :cond_1
    :goto_0
    return-void

    .line 862
    :cond_2
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 863
    const-string v1, "RESULT"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 864
    .local v0, path:Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/bv/wifisync/DirBrowser;->returnDir(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1140
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    if-eqz v0, :cond_0

    .line 1141
    const v0, 0x7f060130

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f060140

    invoke-virtual {p0, v1}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/bv/wifisync/DirBrowser$8;

    invoke-direct {v2, p0}, Lcom/bv/wifisync/DirBrowser$8;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    invoke-static {p0, v0, v1, v3, v2}, Lcom/bv/wifisync/Dialogs;->showConfirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Lcom/bv/wifisync/Dialogs$OnConfirmListener;)V

    .line 1155
    :goto_0
    return-void

    .line 1149
    :cond_0
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    if-eqz v0, :cond_1

    .line 1150
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->cancel(Z)Z

    .line 1151
    iput-object v3, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    .line 1153
    :cond_1
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onButtonClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1129
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    invoke-interface {v0}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bv/wifisync/DirBrowser;->returnDir(Ljava/lang/String;)V

    .line 1130
    return-void
.end method

.method public bridge synthetic onClick(Landroid/view/View;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onClick(Landroid/view/View;)V

    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .parameter "item"

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x1

    .line 296
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 297
    .local v0, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    iget v4, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 299
    .local v1, selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0017

    if-ne v3, v4, :cond_0

    .line 300
    invoke-direct {p0, v1}, Lcom/bv/wifisync/DirBrowser;->deleteSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    .line 311
    :goto_0
    return v2

    .line 301
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0016

    if-ne v3, v4, :cond_1

    .line 302
    invoke-direct {p0, v1}, Lcom/bv/wifisync/DirBrowser;->renameSelectedItem(Lcom/bv/wifisync/DirBrowser$FileInfo;)V

    goto :goto_0

    .line 303
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0014

    if-ne v3, v4, :cond_2

    .line 304
    new-array v3, v2, [Lcom/bv/sync/IFile;

    iget-object v4, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    aput-object v4, v3, v5

    invoke-direct {p0, v3}, Lcom/bv/wifisync/DirBrowser;->cutSelected([Lcom/bv/sync/IFile;)V

    goto :goto_0

    .line 305
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a0015

    if-ne v3, v4, :cond_3

    .line 306
    new-array v3, v2, [Lcom/bv/sync/IFile;

    iget-object v4, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    aput-object v4, v3, v5

    invoke-direct {p0, v3}, Lcom/bv/wifisync/DirBrowser;->copySelected([Lcom/bv/sync/IFile;)V

    goto :goto_0

    .line 307
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0a001a

    if-ne v3, v4, :cond_4

    .line 308
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->paste()V

    goto :goto_0

    .line 310
    :cond_4
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 111
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->requestWindowFeature(I)Z

    .line 112
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 113
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getData()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/sync/IFile;

    iput-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    .line 114
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 115
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "options"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/DirBrowser$Options;

    iput-object v0, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    .line 118
    :goto_0
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->setTitle()V

    .line 119
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->setupButtonChoose()V

    .line 120
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->setupListView()V

    .line 121
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->setHelp()V

    .line 122
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    instance-of v0, v0, Lcom/bv/sync/LocalFile;

    if-eqz v0, :cond_1

    .line 123
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->setupDropdown()V

    .line 124
    :cond_1
    return-void

    .line 117
    :cond_2
    const-string v0, "options"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/DirBrowser$Options;

    iput-object v0, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 8
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    .line 277
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/BrowseActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 278
    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    if-nez v6, :cond_0

    if-eqz p3, :cond_0

    .line 279
    move-object v0, p3

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    move-object v3, v0

    .line 280
    .local v3, info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    iget v7, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v6, v7}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bv/wifisync/DirBrowser$FileInfo;

    .line 281
    .local v5, selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;
    iget-object v6, v5, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v6}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 282
    .local v4, path:Ljava/lang/String;
    iget-object v6, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    iget-boolean v6, v6, Lcom/bv/wifisync/DirBrowser$Options;->readOnly:Z

    if-nez v6, :cond_0

    invoke-static {v4}, Lcom/bv/wifisync/Utils;->isDrive(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v4}, Lcom/bv/wifisync/Utils;->isShare(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 283
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v2

    .line 284
    .local v2, inflater:Landroid/view/MenuInflater;
    const v6, 0x7f090001

    invoke-virtual {v2, v6, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 285
    iget-object v6, v5, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v6}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 286
    iget-object v6, v5, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    iget-boolean v7, v5, Lcom/bv/wifisync/DirBrowser$FileInfo;->isDirectory:Z

    invoke-direct {p0, v6, v7}, Lcom/bv/wifisync/DirBrowser;->getItemImage(Lcom/bv/sync/IFile;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-interface {p1, v6}, Landroid/view/ContextMenu;->setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/ContextMenu;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    .end local v2           #inflater:Landroid/view/MenuInflater;
    .end local v3           #info:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    .end local v4           #path:Ljava/lang/String;
    .end local v5           #selectedItem:Lcom/bv/wifisync/DirBrowser$FileInfo;
    :cond_0
    :goto_0
    return-void

    .line 289
    :catch_0
    move-exception v1

    .line 290
    .local v1, e:Ljava/lang/Exception;
    invoke-static {p0, v1}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 662
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    iget-boolean v1, v1, Lcom/bv/wifisync/DirBrowser$Options;->readOnly:Z

    if-nez v1, :cond_0

    .line 663
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 664
    .local v0, inflater:Landroid/view/MenuInflater;
    const v1, 0x7f090002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 665
    iput-object p1, p0, Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;

    .line 666
    const/4 v1, 0x1

    .line 668
    .end local v0           #inflater:Landroid/view/MenuInflater;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 1159
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onDestroy()V

    .line 1160
    invoke-static {p0}, Lcom/bv/wifisync/Clipboard;->clearSubscriber(Lcom/bv/wifisync/Clipboard$CutSubscriber;)V

    .line 1161
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 1134
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/DirBrowser;->openContextMenu(Landroid/view/View;)V

    .line 1135
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 673
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0018

    if-ne v0, v1, :cond_1

    .line 674
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->createNewFolder()V

    .line 693
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;

    if-eqz v0, :cond_0

    .line 694
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 695
    :cond_0
    const/4 v0, 0x0

    :goto_1
    return v0

    .line 675
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a001c

    if-ne v0, v1, :cond_2

    .line 676
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->refresh()V

    goto :goto_0

    .line 677
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0019

    if-ne v0, v1, :cond_3

    .line 678
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->showSelection()V

    goto :goto_0

    .line 679
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0015

    if-ne v0, v1, :cond_4

    .line 680
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->copySelected()V

    goto :goto_0

    .line 681
    :cond_4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0014

    if-ne v0, v1, :cond_5

    .line 682
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->cutSelected()V

    goto :goto_0

    .line 683
    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a001a

    if-ne v0, v1, :cond_6

    .line 684
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->paste()V

    goto :goto_0

    .line 685
    :cond_6
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a001b

    if-ne v0, v1, :cond_7

    .line 686
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->selectAll()V

    goto :goto_0

    .line 687
    :cond_7
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0017

    if-ne v0, v1, :cond_8

    .line 688
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->deleteSelected()V

    goto :goto_0

    .line 689
    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a001d

    if-ne v0, v1, :cond_9

    .line 690
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->gotoDir()V

    goto :goto_0

    .line 692
    :cond_9
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_1
.end method

.method public onPaste()V
    .locals 1

    .prologue
    .line 1165
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    if-eqz v0, :cond_0

    .line 1166
    new-instance v0, Lcom/bv/wifisync/DirBrowser$9;

    invoke-direct {v0, p0}, Lcom/bv/wifisync/DirBrowser$9;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1173
    :cond_0
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 7
    .parameter "menu"

    .prologue
    const/16 v6, 0xb

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 616
    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    iget-boolean v3, v3, Lcom/bv/wifisync/DirBrowser$Options;->readOnly:Z

    if-nez v3, :cond_c

    .line 617
    const v3, 0x7f0a0018

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 618
    .local v0, item:Landroid/view/MenuItem;
    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    invoke-static {v3}, Lcom/bv/wifisync/Utils;->isRootRemoteFolder(Lcom/bv/sync/IFile;)Z

    move-result v1

    .line 619
    .local v1, rootRemoteFolder:Z
    if-eqz v1, :cond_4

    move v3, v4

    :goto_0
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 621
    const v3, 0x7f0a0019

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 622
    if-eqz v1, :cond_5

    move v3, v4

    :goto_1
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 623
    iget-boolean v3, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 624
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v6, :cond_7

    .line 625
    iget-boolean v3, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    if-eqz v3, :cond_6

    const v3, 0x108000d

    :goto_2
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 629
    :goto_3
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;->getSelectedInfos()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 631
    .local v2, selectedCount:I
    const v3, 0x7f0a0014

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 632
    if-nez v1, :cond_8

    if-lez v2, :cond_8

    move v3, v5

    :goto_4
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 633
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_0

    .line 634
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v3

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 636
    :cond_0
    const v3, 0x7f0a0015

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 637
    if-nez v1, :cond_9

    if-lez v2, :cond_9

    move v3, v5

    :goto_5
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 638
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_1

    .line 639
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v3

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 641
    :cond_1
    const v3, 0x7f0a001a

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 642
    if-nez v1, :cond_a

    invoke-static {}, Lcom/bv/wifisync/Clipboard;->hasData()Z

    move-result v3

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    if-nez v3, :cond_a

    move v3, v5

    :goto_6
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 643
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_2

    .line 644
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v3

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 646
    :cond_2
    const v3, 0x7f0a001b

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 647
    iget-boolean v3, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 649
    const v3, 0x7f0a0017

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 650
    if-nez v1, :cond_3

    if-lez v2, :cond_3

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    if-nez v3, :cond_3

    move v4, v5

    :cond_3
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 651
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_b

    .line 652
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v3

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 657
    .end local v0           #item:Landroid/view/MenuItem;
    .end local v1           #rootRemoteFolder:Z
    .end local v2           #selectedCount:I
    :goto_7
    return v5

    .restart local v0       #item:Landroid/view/MenuItem;
    .restart local v1       #rootRemoteFolder:Z
    :cond_4
    move v3, v5

    .line 619
    goto/16 :goto_0

    :cond_5
    move v3, v5

    .line 622
    goto/16 :goto_1

    .line 625
    :cond_6
    const v3, 0x108000e

    goto/16 :goto_2

    .line 627
    :cond_7
    const v3, 0x7f02001b

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    goto/16 :goto_3

    .restart local v2       #selectedCount:I
    :cond_8
    move v3, v4

    .line 632
    goto/16 :goto_4

    :cond_9
    move v3, v4

    .line 637
    goto :goto_5

    :cond_a
    move v3, v4

    .line 642
    goto :goto_6

    .line 654
    :cond_b
    iget-boolean v3, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_7

    .end local v0           #item:Landroid/view/MenuItem;
    .end local v1           #rootRemoteFolder:Z
    .end local v2           #selectedCount:I
    :cond_c
    move v5, v4

    .line 657
    goto :goto_7
.end method

.method protected onProgressCancelClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 1177
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->fileManagementTask:Lcom/bv/wifisync/DirBrowser$FileManagementTask;

    .line 1178
    .local v1, task:Lcom/bv/wifisync/DirBrowser$FileManagementTask;
    if-eqz v1, :cond_1

    .line 1179
    invoke-virtual {v1, v2}, Lcom/bv/wifisync/DirBrowser$FileManagementTask;->cancel(Z)Z

    .line 1188
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onProgressCancelClick(Landroid/view/View;)V

    .line 1189
    return-void

    .line 1181
    :cond_1
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    .line 1182
    .local v0, fetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;
    if-eqz v0, :cond_0

    .line 1183
    invoke-virtual {v0, v2}, Lcom/bv/wifisync/DirBrowser$DirFetcher;->cancel(Z)Z

    .line 1184
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/bv/wifisync/DirBrowser;->dirFetcher:Lcom/bv/wifisync/DirBrowser$DirFetcher;

    goto :goto_0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 604
    invoke-super {p0}, Lcom/bv/wifisync/BrowseActivity;->onResume()V

    .line 605
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    invoke-static {v0}, Lcom/bv/wifisync/Utils;->isRootRemoteFolder(Lcom/bv/sync/IFile;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 606
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    .line 609
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 610
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;

    if-eqz v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->menu:Landroid/view/Menu;

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 612
    :cond_0
    return-void

    .line 608
    :cond_1
    invoke-static {p0}, Lcom/bv/wifisync/Config;->getShowEditMode(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/bv/wifisync/DirBrowser;->selection:Z

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 270
    invoke-super {p0, p1}, Lcom/bv/wifisync/BrowseActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 271
    const-string v0, "options"

    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 272
    return-void
.end method

.method protected selectDir(Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V
    .locals 2
    .parameter "start"
    .parameter "options"

    .prologue
    .line 105
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 106
    .local v0, intent:Landroid/content/Intent;
    invoke-static {p0, p1, p2, v0}, Lcom/bv/wifisync/DirBrowser;->internalSelectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;Landroid/content/Intent;)V

    .line 107
    return-void
.end method

.method protected setHelp()V
    .locals 2

    .prologue
    .line 252
    const/4 v0, 0x0

    .line 253
    .local v0, help:I
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->lastError:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 254
    iget-object v1, p0, Lcom/bv/wifisync/DirBrowser;->lastError:Ljava/lang/Throwable;

    invoke-static {v1}, Lcom/bv/wifisync/Errors;->getHelp(Ljava/lang/Throwable;)I

    move-result v0

    .line 255
    :cond_0
    if-nez v0, :cond_1

    .line 256
    invoke-virtual {p0}, Lcom/bv/wifisync/DirBrowser;->getDefaultHelp()I

    move-result v0

    .line 258
    :cond_1
    invoke-virtual {p0, v0}, Lcom/bv/wifisync/DirBrowser;->setHelp(I)V

    .line 259
    return-void
.end method

.method public bridge synthetic setProgress(ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/BrowseActivity;->setProgress(ILjava/lang/String;)V

    return-void
.end method

.method protected setupButtonChoose()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 841
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    invoke-interface {v2}, Lcom/bv/sync/IFile;->getName()Ljava/lang/String;

    move-result-object v0

    .line 842
    .local v0, name:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 843
    const-string v0, "/"

    .line 844
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->dir:Lcom/bv/sync/IFile;

    instance-of v2, v2, Lcom/bv/sync/RemoteFile;

    if-eqz v2, :cond_1

    .line 845
    invoke-static {v0}, Lcom/bv/wifisync/Utils;->urlToPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 846
    :cond_1
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->buttonOk:Landroid/widget/Button;

    new-instance v3, Ljava/lang/StringBuilder;

    const v4, 0x7f0600f1

    invoke-virtual {p0, v4}, Lcom/bv/wifisync/DirBrowser;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 847
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->buttonOk:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 848
    iget-object v2, p0, Lcom/bv/wifisync/DirBrowser;->buttonOk:Landroid/widget/Button;

    iget-object v3, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    iget-boolean v3, v3, Lcom/bv/wifisync/DirBrowser$Options;->showButton:Z

    if-eqz v3, :cond_2

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 849
    return-void

    .line 848
    :cond_2
    const/16 v1, 0x8

    goto :goto_0
.end method

.method protected setupDropdown()V
    .locals 3

    .prologue
    .line 202
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    .line 203
    new-instance v1, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    invoke-direct {p0, v1}, Lcom/bv/wifisync/DirBrowser;->setupActionBar(Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V

    .line 209
    :goto_0
    return-void

    .line 205
    :cond_0
    new-instance v1, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;

    invoke-direct {v1, p0}, Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;-><init>(Lcom/bv/wifisync/DirBrowser;)V

    invoke-direct {p0, v1}, Lcom/bv/wifisync/DirBrowser;->setupSpinner(Lcom/bv/wifisync/DirBrowser$ActionBarAdapter;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 206
    :catch_0
    move-exception v0

    .line 207
    .local v0, e:Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method
