.class abstract Lcom/bv/wifisync/PropertyRow;
.super Ljava/lang/Object;
.source "PropertiesAdapter.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "context"
    .parameter "name"

    .prologue
    .line 26
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .parameter "context"
    .parameter "name"

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Lcom/bv/wifisync/PropertyRow;->name:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/bv/wifisync/PropertyRow;->context:Landroid/content/Context;

    .line 32
    return-void
.end method


# virtual methods
.method protected getEnabled()Z
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getMissingValueText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/bv/wifisync/PropertyRow;->context:Landroid/content/Context;

    const v1, 0x7f060136

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/bv/wifisync/PropertyRow;->name:Ljava/lang/String;

    return-object v0
.end method

.method getText()Landroid/text/Spanned;
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 45
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertyRow;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, value:Ljava/lang/String;
    if-nez v3, :cond_0

    .line 47
    const-string v3, ""

    .line 48
    :cond_0
    const-string v4, ""

    if-ne v3, v4, :cond_3

    const-string v1, "<big><b><font color=\"red\">%s</font></b></big><br/><font color=\"grey\">%s</font>"

    .line 50
    .local v1, textFormat:Ljava/lang/String;
    :goto_0
    const-string v4, ""

    if-ne v3, v4, :cond_1

    .line 51
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertyRow;->getMissingValueText()Ljava/lang/String;

    move-result-object v3

    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertyRow;->getName()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, nameValue:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertyRow;->getEnabled()Z

    move-result v4

    if-nez v4, :cond_2

    .line 54
    const-string v4, "<font color=\"#808080\">%s</font>"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 55
    :cond_2
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v6

    aput-object v3, v4, v7

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, textValue:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    return-object v4

    .line 49
    .end local v0           #nameValue:Ljava/lang/String;
    .end local v1           #textFormat:Ljava/lang/String;
    .end local v2           #textValue:Ljava/lang/String;
    :cond_3
    const-string v1, "<big><b>%s</b></big><br/>%s"

    goto :goto_0
.end method

.method protected abstract getValue()Ljava/lang/String;
.end method
