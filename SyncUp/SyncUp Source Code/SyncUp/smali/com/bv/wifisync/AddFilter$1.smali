.class Lcom/bv/wifisync/AddFilter$1;
.super Lcom/bv/wifisync/Utils$ProgressTask;
.source "AddFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddFilter;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bv/wifisync/Utils$ProgressTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;

.field private final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;Landroid/app/Activity;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter "$anonymous0"
    .parameter "$anonymous1"
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$1;->this$0:Lcom/bv/wifisync/AddFilter;

    iput p4, p0, Lcom/bv/wifisync/AddFilter$1;->val$requestCode:I

    .line 448
    invoke-direct {p0, p2, p3}, Lcom/bv/wifisync/Utils$ProgressTask;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic atBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddFilter$1;->atBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs atBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 2
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 451
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$1;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    iget v1, p0, Lcom/bv/wifisync/AddFilter$1;->val$requestCode:I

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/AddFilter$FilterRow;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddFilter$FilterRow;->update(Ljava/lang/Object;)V

    .line 452
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/bv/wifisync/AddFilter$1;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 457
    invoke-super {p0, p1}, Lcom/bv/wifisync/Utils$ProgressTask;->onPostExecute(Ljava/lang/Object;)V

    .line 458
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$1;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 459
    return-void
.end method
