.class Lcom/bv/wifisync/AddFilter$DateRow$1;
.super Lcom/bv/wifisync/Dialogs$NumberPickerDialog;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddFilter$DateRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddFilter$DateRow;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter$DateRow;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 6
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter "$anonymous2"
    .parameter "$anonymous3"
    .parameter "$anonymous4"

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$DateRow$1;->this$1:Lcom/bv/wifisync/AddFilter$DateRow;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move v4, p5

    move v5, p6

    .line 404
    invoke-direct/range {v0 .. v5}, Lcom/bv/wifisync/Dialogs$NumberPickerDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)V

    return-void
.end method


# virtual methods
.method protected onButtonOK(I)V
    .locals 1
    .parameter "value"

    .prologue
    .line 413
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow$1;->this$1:Lcom/bv/wifisync/AddFilter$DateRow;

    invoke-virtual {v0, p1}, Lcom/bv/wifisync/AddFilter$DateRow;->setModified(I)V

    .line 414
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow$1;->this$1:Lcom/bv/wifisync/AddFilter$DateRow;

    #getter for: Lcom/bv/wifisync/AddFilter$DateRow;->this$0:Lcom/bv/wifisync/AddFilter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter$DateRow;->access$1(Lcom/bv/wifisync/AddFilter$DateRow;)Lcom/bv/wifisync/AddFilter;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 415
    return-void
.end method

.method protected onValueChanged(I)V
    .locals 1
    .parameter "value"

    .prologue
    .line 408
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$DateRow$1;->this$1:Lcom/bv/wifisync/AddFilter$DateRow;

    #calls: Lcom/bv/wifisync/AddFilter$DateRow;->getMessage(I)Ljava/lang/String;
    invoke-static {v0, p1}, Lcom/bv/wifisync/AddFilter$DateRow;->access$0(Lcom/bv/wifisync/AddFilter$DateRow;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bv/wifisync/AddFilter$DateRow$1;->setMessage(Ljava/lang/String;)V

    .line 409
    return-void
.end method
