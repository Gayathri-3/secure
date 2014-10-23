.class Lcom/bv/wifisync/AddFilter$HeaderRow;
.super Lcom/bv/wifisync/AddFilter$FilterRow;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderRow"
.end annotation


# instance fields
.field private sign:Ljava/lang/String;

.field private signColor:Ljava/lang/String;

.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;

.field private final title:I


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "title"
    .parameter "signColor"
    .parameter "sign"

    .prologue
    .line 469
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 470
    invoke-direct {p0, p1, p2}, Lcom/bv/wifisync/AddFilter$FilterRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 471
    iput p2, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->title:I

    .line 472
    iput-object p3, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->signColor:Ljava/lang/String;

    .line 473
    iput-object p4, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->sign:Ljava/lang/String;

    .line 474
    return-void
.end method


# virtual methods
.method protected getEnabled()Z
    .locals 1

    .prologue
    .line 491
    const/4 v0, 0x0

    return v0
.end method

.method getText()Landroid/text/Spanned;
    .locals 6

    .prologue
    .line 483
    const-string v0, "<big>%s <font color=\"%s\"><b>%s</b></font></big>"

    .line 484
    .local v0, format:Ljava/lang/String;
    iget-object v3, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->this$0:Lcom/bv/wifisync/AddFilter;

    iget v4, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->title:I

    invoke-virtual {v3, v4}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 485
    .local v1, name:Ljava/lang/String;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->signColor:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/bv/wifisync/AddFilter$HeaderRow;->sign:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 486
    .local v2, s:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    return-object v3
.end method

.method protected getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 478
    const-string v0, ""

    return-object v0
.end method
