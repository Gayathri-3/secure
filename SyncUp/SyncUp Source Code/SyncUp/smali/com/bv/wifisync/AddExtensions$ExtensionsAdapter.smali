.class Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
.super Landroid/widget/ArrayAdapter;
.source "AddExtensions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExtensionsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/bv/wifisync/AddExtensions$SelectedItem;",
        ">;"
    }
.end annotation


# instance fields
.field private cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/bv/wifisync/AddExtensions;


# direct methods
.method public constructor <init>(Lcom/bv/wifisync/AddExtensions;)V
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 258
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    .line 259
    const v1, 0x7f0a000a

    invoke-direct {p0, p1, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 324
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->cache:Ljava/util/Map;

    .line 260
    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {p1}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 262
    new-instance v1, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    invoke-direct {v1, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;-><init>(Lcom/bv/wifisync/AddExtensions;)V

    #setter for: Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;
    invoke-static {p1, v1}, Lcom/bv/wifisync/AddExtensions;->access$10(Lcom/bv/wifisync/AddExtensions;Lcom/bv/wifisync/AddExtensions$ExtensionScanner;)V

    .line 263
    #getter for: Lcom/bv/wifisync/AddExtensions;->scanner:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;
    invoke-static {p1}, Lcom/bv/wifisync/AddExtensions;->access$11(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Void;

    const/4 v3, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->run([Ljava/lang/Object;)V

    .line 264
    return-void

    .line 260
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 261
    .local v0, extension:Ljava/lang/String;
    new-instance v2, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    invoke-direct {v2, p1, v0}, Lcom/bv/wifisync/AddExtensions$SelectedItem;-><init>(Lcom/bv/wifisync/AddExtensions;Ljava/lang/String;)V

    invoke-virtual {p0, v2, v4}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->insert(Lcom/bv/wifisync/AddExtensions$SelectedItem;I)V

    goto :goto_0
.end method

.method private getItemImage(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter "item"

    .prologue
    .line 327
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->cache:Ljava/util/Map;

    iget-object v2, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 328
    .local v0, result:Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_0

    .line 329
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    new-instance v2, Ljava/io/File;

    iget-object v3, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/bv/wifisync/Utils;->getFileImage(Landroid/content/Context;Ljava/io/File;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 330
    iget-object v1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->cache:Ljava/util/Map;

    iget-object v2, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    :cond_0
    return-object v0
.end method

.method private isIncluded(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 336
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iget-object v1, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private update(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    .line 289
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->getCount()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 296
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 290
    :cond_0
    invoke-virtual {p0, v1}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    .line 291
    .local v0, existing:Lcom/bv/wifisync/AddExtensions$SelectedItem;
    iget-object v2, v0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    .line 292
    iget v2, v0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcom/bv/wifisync/AddExtensions$SelectedItem;->count:I

    .line 293
    const/4 v2, 0x1

    goto :goto_1

    .line 289
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public add(Lcom/bv/wifisync/AddExtensions$SelectedItem;)V
    .locals 6
    .parameter "item"

    .prologue
    .line 268
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->update(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 269
    const/4 v2, 0x1

    iput v2, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->count:I

    .line 270
    invoke-super {p0, p1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 272
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 273
    .local v0, now:J
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->lastAddTime:J
    invoke-static {v2}, Lcom/bv/wifisync/AddExtensions;->access$8(Lcom/bv/wifisync/AddExtensions;)J

    move-result-wide v2

    sub-long v2, v0, v2

    const-wide/16 v4, 0x32

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 274
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    #setter for: Lcom/bv/wifisync/AddExtensions;->lastAddTime:J
    invoke-static {v2, v0, v1}, Lcom/bv/wifisync/AddExtensions;->access$9(Lcom/bv/wifisync/AddExtensions;J)V

    .line 275
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 277
    :cond_1
    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->add(Lcom/bv/wifisync/AddExtensions$SelectedItem;)V

    return-void
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v9, 0x0

    .line 301
    move-object v3, p2

    .line 302
    .local v3, result:Landroid/view/View;
    if-nez v3, :cond_0

    .line 303
    iget-object v7, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    const-string v8, "layout_inflater"

    invoke-virtual {v7, v8}, Lcom/bv/wifisync/AddExtensions;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/LayoutInflater;

    .line 304
    .local v6, vi:Landroid/view/LayoutInflater;
    const v7, 0x7f030003

    invoke-virtual {v6, v7, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 306
    .end local v6           #vi:Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    .line 307
    .local v2, item:Lcom/bv/wifisync/AddExtensions$SelectedItem;
    const v7, 0x7f0a000a

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 308
    .local v5, textView:Landroid/widget/TextView;
    iget-object v4, v2, Lcom/bv/wifisync/AddExtensions$SelectedItem;->name:Ljava/lang/String;

    .line 309
    .local v4, text:Ljava/lang/String;
    iget v7, v2, Lcom/bv/wifisync/AddExtensions$SelectedItem;->count:I

    if-lez v7, :cond_1

    .line 310
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, " ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v2, Lcom/bv/wifisync/AddExtensions$SelectedItem;->count:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 311
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "<big>"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</big>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 312
    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    invoke-direct {p0, v2}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->isIncluded(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Z

    move-result v7

    if-eqz v7, :cond_2

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    :goto_0
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 314
    const v7, 0x7f0a0006

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 315
    .local v0, checkBox:Landroid/widget/CheckBox;
    invoke-virtual {v0, v9}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 316
    invoke-direct {p0, v2}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->isIncluded(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Z

    move-result v7

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 317
    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 318
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 319
    const v7, 0x7f0a0004

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 320
    .local v1, image:Landroid/widget/ImageView;
    iget-object v7, p0, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-direct {p0, v2}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->getItemImage(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/bv/wifisync/AddExtensions;->scaleListImage(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 321
    return-object v3

    .line 313
    .end local v0           #checkBox:Landroid/widget/CheckBox;
    .end local v1           #image:Landroid/widget/ImageView;
    :cond_2
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_0
.end method

.method public insert(Lcom/bv/wifisync/AddExtensions$SelectedItem;I)V
    .locals 1
    .parameter "item"
    .parameter "index"

    .prologue
    .line 281
    invoke-direct {p0, p1}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->update(Lcom/bv/wifisync/AddExtensions$SelectedItem;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 282
    const/4 v0, 0x0

    iput v0, p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;->count:I

    .line 283
    invoke-super {p0, p1, p2}, Landroid/widget/ArrayAdapter;->insert(Ljava/lang/Object;I)V

    .line 285
    :cond_0
    invoke-virtual {p0}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 286
    return-void
.end method

.method public bridge synthetic insert(Ljava/lang/Object;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    invoke-virtual {p0, p1, p2}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->insert(Lcom/bv/wifisync/AddExtensions$SelectedItem;I)V

    return-void
.end method
