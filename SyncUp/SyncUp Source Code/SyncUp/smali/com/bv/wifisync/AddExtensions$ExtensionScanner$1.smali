.class Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;
.super Ljava/lang/Object;
.source "AddExtensions.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->add(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

.field private final synthetic val$extension:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddExtensions$ExtensionScanner;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;->this$1:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    iput-object p2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;->val$extension:Ljava/lang/String;

    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 246
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;->this$1:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    #getter for: Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->access$3(Lcom/bv/wifisync/AddExtensions$ExtensionScanner;)Lcom/bv/wifisync/AddExtensions;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v0

    new-instance v1, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;->this$1:Lcom/bv/wifisync/AddExtensions$ExtensionScanner;

    #getter for: Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->this$0:Lcom/bv/wifisync/AddExtensions;
    invoke-static {v2}, Lcom/bv/wifisync/AddExtensions$ExtensionScanner;->access$3(Lcom/bv/wifisync/AddExtensions$ExtensionScanner;)Lcom/bv/wifisync/AddExtensions;

    move-result-object v2

    iget-object v3, p0, Lcom/bv/wifisync/AddExtensions$ExtensionScanner$1;->val$extension:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/bv/wifisync/AddExtensions$SelectedItem;-><init>(Lcom/bv/wifisync/AddExtensions;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->add(Lcom/bv/wifisync/AddExtensions$SelectedItem;)V

    .line 247
    return-void
.end method
