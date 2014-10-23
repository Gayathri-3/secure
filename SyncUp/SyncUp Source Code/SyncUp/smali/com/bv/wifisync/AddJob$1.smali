.class Lcom/bv/wifisync/AddJob$1;
.super Ljava/lang/Object;
.source "AddJob.java"

# interfaces
.implements Lcom/bv/wifisync/Dialogs$OnOkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddJob;->rename()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddJob;

.field private final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddJob;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    iput-object p2, p0, Lcom/bv/wifisync/AddJob$1;->val$edit:Landroid/widget/EditText;

    .line 688
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;)Z
    .locals 4
    .parameter "dialogInterface"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 691
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$1;->val$edit:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 692
    .local v0, text:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 693
    const/4 v0, 0x0

    .line 694
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v1

    .line 695
    .local v1, type:Lcom/bv/wifisync/Job$SyncType;
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/bv/wifisync/Job;->setName(Ljava/lang/String;)V

    .line 696
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/Job;->getSyncType()Lcom/bv/wifisync/Job$SyncType;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 697
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    #calls: Lcom/bv/wifisync/AddJob;->addRows()V
    invoke-static {v2}, Lcom/bv/wifisync/AddJob;->access$5(Lcom/bv/wifisync/AddJob;)V

    .line 699
    :cond_1
    iget-object v2, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    iget-object v3, p0, Lcom/bv/wifisync/AddJob$1;->this$0:Lcom/bv/wifisync/AddJob;

    #getter for: Lcom/bv/wifisync/AddJob;->job:Lcom/bv/wifisync/Job;
    invoke-static {v3}, Lcom/bv/wifisync/AddJob;->access$2(Lcom/bv/wifisync/AddJob;)Lcom/bv/wifisync/Job;

    move-result-object v3

    invoke-virtual {v3}, Lcom/bv/wifisync/Job;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/bv/wifisync/AddJob;->setTitle(Ljava/lang/CharSequence;)V

    .line 700
    const/4 v2, 0x1

    return v2
.end method
