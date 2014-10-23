.class public Lcom/bv/wifisync/MultiSelectDirBrowser;
.super Lcom/bv/wifisync/DirBrowser;
.source "MultiSelectDirBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bv/wifisync/MultiSelectDirBrowser$CheckableFileInfo;,
        Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;,
        Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    }
.end annotation


# instance fields
.field private final biller:Lcom/bv/wifisync/DonateBiller;

.field private selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/bv/wifisync/DirBrowser;-><init>()V

    .line 23
    new-instance v0, Lcom/bv/wifisync/MultiSelectDirBrowser$1;

    sget-object v1, Lcom/bv/wifisync/Biller$ChargeType;->AddDirExclude:Lcom/bv/wifisync/Biller$ChargeType;

    invoke-direct {v0, p0, p0, v1}, Lcom/bv/wifisync/MultiSelectDirBrowser$1;-><init>(Lcom/bv/wifisync/MultiSelectDirBrowser;Landroid/app/Activity;Lcom/bv/wifisync/Biller$ChargeType;)V

    iput-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->biller:Lcom/bv/wifisync/DonateBiller;

    .line 21
    return-void
.end method

.method static synthetic access$2(Lcom/bv/wifisync/MultiSelectDirBrowser;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 158
    invoke-direct {p0, p1}, Lcom/bv/wifisync/MultiSelectDirBrowser;->returnResult(I)V

    return-void
.end method

.method static synthetic access$3(Lcom/bv/wifisync/MultiSelectDirBrowser;)Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    .locals 1
    .parameter

    .prologue
    .line 22
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    return-object v0
.end method

.method static synthetic access$4(Lcom/bv/wifisync/MultiSelectDirBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/bv/wifisync/MultiSelectDirBrowser;->fixPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private clearAll()V
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->clear()V

    .line 216
    return-void
.end method

.method private fixPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 36
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_0

    .line 37
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 38
    .end local p1
    :cond_0
    return-object p1
.end method

.method private getCheckCount()I
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    iget-object v0, v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->size()I

    move-result v0

    .line 183
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private returnResult(I)V
    .locals 3
    .parameter "returnCode"

    .prologue
    .line 159
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 160
    .local v0, result:Landroid/content/Intent;
    const-string v1, "RESULT"

    iget-object v2, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 161
    const-string v1, "lastError"

    iget-object v2, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->lastError:Ljava/lang/Throwable;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 162
    invoke-virtual {p0, p1, v0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->setResult(ILandroid/content/Intent;)V

    .line 163
    invoke-virtual {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->finish()V

    .line 164
    return-void
.end method

.method private selectAll()V
    .locals 3

    .prologue
    .line 219
    invoke-direct {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->clearAll()V

    .line 220
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 222
    return-void

    .line 221
    :cond_0
    iget-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    iget-object v2, v1, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;->selected:Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1, v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bv/wifisync/DirBrowser$FileInfo;

    iget-object v1, v1, Lcom/bv/wifisync/DirBrowser$FileInfo;->file:Lcom/bv/sync/IFile;

    invoke-interface {v1}, Lcom/bv/sync/IFile;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/bv/wifisync/MultiSelectDirBrowser;->fixPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 220
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static selectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;)V
    .locals 2
    .parameter "parent"
    .parameter "start"
    .parameter "options"

    .prologue
    .line 116
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/bv/wifisync/MultiSelectDirBrowser;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 117
    .local v0, intent:Landroid/content/Intent;
    invoke-static {p0, p1, p2, v0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->internalSelectDir(Landroid/app/Activity;Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;Landroid/content/Intent;)V

    .line 118
    return-void
.end method


# virtual methods
.method protected createAdapter()Lcom/bv/wifisync/DirBrowser$DirAdapter;
    .locals 2

    .prologue
    .line 188
    new-instance v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectAdapter;-><init>(Lcom/bv/wifisync/MultiSelectDirBrowser;Ljava/util/ArrayList;)V

    return-object v0
.end method

.method protected getDefaultHelp()I
    .locals 1

    .prologue
    .line 136
    const v0, 0x7f0600db

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v2, -0x1

    .line 144
    if-eq p2, v2, :cond_0

    if-nez p2, :cond_3

    if-eqz p3, :cond_3

    .line 145
    :cond_0
    const-string v1, "RESULT"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    .line 146
    .local v0, optionsEx:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    if-eqz v0, :cond_1

    .line 147
    iput-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    .line 148
    :cond_1
    const-string v1, "lastError"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    iput-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->lastError:Ljava/lang/Throwable;

    .line 149
    invoke-virtual {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->setHelp()V

    .line 150
    iget-object v1, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v1}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 151
    if-ne p2, v2, :cond_2

    .line 152
    invoke-direct {p0, v2}, Lcom/bv/wifisync/MultiSelectDirBrowser;->returnResult(I)V

    .line 156
    .end local v0           #optionsEx:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;
    :cond_2
    :goto_0
    return-void

    .line 153
    :cond_3
    const/high16 v1, 0x1

    if-lt p2, v1, :cond_2

    .line 154
    invoke-super {p0, p1, p2, p3}, Lcom/bv/wifisync/DirBrowser;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->returnResult(I)V

    .line 169
    invoke-super {p0}, Lcom/bv/wifisync/DirBrowser;->onBackPressed()V

    .line 170
    return-void
.end method

.method public onButtonClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 174
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->biller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->isPurchased()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->getCheckCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->biller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->purchase()V

    .line 178
    :goto_0
    return-void

    .line 177
    :cond_0
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->returnResult(I)V

    goto :goto_0
.end method

.method public bridge synthetic onClick(Landroid/view/View;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1}, Lcom/bv/wifisync/DirBrowser;->onClick(Landroid/view/View;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 127
    invoke-super {p0, p1}, Lcom/bv/wifisync/DirBrowser;->onCreate(Landroid/os/Bundle;)V

    .line 128
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/bv/wifisync/DirBrowser$Options;->showSelection:Z

    .line 129
    iget-object v0, p0, Lcom/bv/wifisync/DirBrowser;->options:Lcom/bv/wifisync/DirBrowser$Options;

    check-cast v0, Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    iput-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    .line 130
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->buttonOk:Landroid/widget/Button;

    const v1, 0x104000a

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 131
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 132
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f090009

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 194
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 226
    invoke-super {p0}, Lcom/bv/wifisync/DirBrowser;->onDestroy()V

    .line 227
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->biller:Lcom/bv/wifisync/DonateBiller;

    invoke-virtual {v0}, Lcom/bv/wifisync/DonateBiller;->close()V

    .line 228
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 204
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a001b

    if-ne v0, v1, :cond_0

    .line 205
    invoke-direct {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectAll()V

    .line 210
    :goto_0
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->adapter:Lcom/bv/wifisync/DirBrowser$DirAdapter;

    invoke-virtual {v0}, Lcom/bv/wifisync/DirBrowser$DirAdapter;->notifyDataSetChanged()V

    .line 211
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 206
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0013

    if-ne v0, v1, :cond_1

    .line 207
    invoke-direct {p0}, Lcom/bv/wifisync/MultiSelectDirBrowser;->clearAll()V

    goto :goto_0

    .line 209
    :cond_1
    invoke-super {p0, p1}, Lcom/bv/wifisync/DirBrowser;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_1
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 199
    const/4 v0, 0x1

    return v0
.end method

.method protected selectDir(Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V
    .locals 1
    .parameter "start"
    .parameter "options"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->selectionOptions:Lcom/bv/wifisync/MultiSelectDirBrowser$MultiSelectOptions;

    invoke-super {p0, p1, v0}, Lcom/bv/wifisync/DirBrowser;->selectDir(Lcom/bv/sync/IFile;Lcom/bv/wifisync/DirBrowser$Options;)V

    .line 123
    return-void
.end method

.method public bridge synthetic setProgress(ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-super {p0, p1, p2}, Lcom/bv/wifisync/DirBrowser;->setProgress(ILjava/lang/String;)V

    return-void
.end method

.method protected setupButtonChoose()V
    .locals 2

    .prologue
    .line 232
    invoke-super {p0}, Lcom/bv/wifisync/DirBrowser;->setupButtonChoose()V

    .line 233
    iget-object v0, p0, Lcom/bv/wifisync/MultiSelectDirBrowser;->buttonOk:Landroid/widget/Button;

    const v1, 0x104000a

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 234
    return-void
.end method

.method protected setupDropdown()V
    .locals 0

    .prologue
    .line 140
    return-void
.end method
