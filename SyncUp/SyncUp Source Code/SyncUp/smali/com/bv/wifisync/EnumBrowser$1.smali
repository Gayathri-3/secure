.class Lcom/bv/wifisync/EnumBrowser$1;
.super Landroid/widget/ArrayAdapter;
.source "EnumBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/EnumBrowser;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field final synthetic this$0:Lcom/bv/wifisync/EnumBrowser;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/EnumBrowser;Landroid/content/Context;ILjava/util/List;)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter

    .prologue
    .line 1
    .local p4, $anonymous2:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    .line 133
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    const/4 v7, 0x0

    .line 136
    if-nez p2, :cond_0

    .line 137
    iget-object v6, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    const-string v8, "layout_inflater"

    invoke-virtual {v6, v8}, Lcom/bv/wifisync/EnumBrowser;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    .line 138
    .local v4, vi:Landroid/view/LayoutInflater;
    const v6, 0x7f030003

    invoke-virtual {v4, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 140
    .end local v4           #vi:Landroid/view/LayoutInflater;
    :cond_0
    const v6, 0x7f0a0004

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 141
    .local v5, view:Landroid/widget/ImageView;
    iget-object v6, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    #getter for: Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;
    invoke-static {v6}, Lcom/bv/wifisync/EnumBrowser;->access$3(Lcom/bv/wifisync/EnumBrowser;)Lcom/bv/wifisync/EnumBrowser$Enumeration;

    move-result-object v6

    iget-object v8, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    invoke-virtual {v6, v8, p1}, Lcom/bv/wifisync/EnumBrowser$Enumeration;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 142
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 143
    if-nez v0, :cond_1

    const/4 v6, 0x4

    :goto_0
    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 144
    const v6, 0x7f0a000a

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 145
    .local v3, textView:Landroid/widget/TextView;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "<big>"

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    #getter for: Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;
    invoke-static {v8}, Lcom/bv/wifisync/EnumBrowser;->access$3(Lcom/bv/wifisync/EnumBrowser;)Lcom/bv/wifisync/EnumBrowser$Enumeration;

    move-result-object v8

    invoke-virtual {v8}, Lcom/bv/wifisync/EnumBrowser$Enumeration;->getValues()[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, p1

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "</big>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 146
    .local v2, text:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    iget-object v6, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    #getter for: Lcom/bv/wifisync/EnumBrowser;->enumeration:Lcom/bv/wifisync/EnumBrowser$Enumeration;
    invoke-static {v6}, Lcom/bv/wifisync/EnumBrowser;->access$3(Lcom/bv/wifisync/EnumBrowser;)Lcom/bv/wifisync/EnumBrowser$Enumeration;

    move-result-object v6

    iget-object v8, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    invoke-virtual {v6, v8, p1}, Lcom/bv/wifisync/EnumBrowser$Enumeration;->getChecked(Landroid/content/Context;I)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/bv/wifisync/EnumBrowser$1;->this$0:Lcom/bv/wifisync/EnumBrowser;

    invoke-virtual {v6}, Lcom/bv/wifisync/EnumBrowser;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v8, 0x7f020003

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 148
    .local v1, image:Landroid/graphics/drawable/Drawable;
    :goto_1
    invoke-virtual {v3, v7, v7, v1, v7}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 149
    return-object p2

    .line 143
    .end local v1           #image:Landroid/graphics/drawable/Drawable;
    .end local v2           #text:Ljava/lang/String;
    .end local v3           #textView:Landroid/widget/TextView;
    :cond_1
    const/4 v6, 0x0

    goto :goto_0

    .restart local v2       #text:Ljava/lang/String;
    .restart local v3       #textView:Landroid/widget/TextView;
    :cond_2
    move-object v1, v7

    .line 147
    goto :goto_1
.end method
