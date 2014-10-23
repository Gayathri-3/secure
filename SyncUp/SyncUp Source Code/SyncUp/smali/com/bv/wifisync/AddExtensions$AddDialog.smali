.class Lcom/bv/wifisync/AddExtensions$AddDialog;
.super Ljava/lang/Object;
.source "AddExtensions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddDialog"
.end annotation


# static fields
.field static final dot:Ljava/lang/String; = "."


# instance fields
.field private final dialog:Landroid/app/AlertDialog;

.field private final edit:Landroid/widget/EditText;

.field final synthetic this$0:Lcom/bv/wifisync/AddExtensions;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddExtensions;)V
    .locals 4
    .parameter

    .prologue
    .line 121
    iput-object p1, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    new-instance v0, Landroid/widget/EditText;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    const v2, 0x7f080002

    invoke-direct {v1, p1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->edit:Landroid/widget/EditText;

    .line 123
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->edit:Landroid/widget/EditText;

    const/high16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 124
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->edit:Landroid/widget/EditText;

    const-string v1, "."

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->edit:Landroid/widget/EditText;

    const-string v1, "."

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 126
    const v0, 0x7f0601aa

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddExtensions;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 127
    const v1, 0x7f0600ec

    invoke-virtual {p1, v1}, Lcom/bv/wifisync/AddExtensions;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->edit:Landroid/widget/EditText;

    new-instance v3, Lcom/bv/wifisync/AddExtensions$AddDialog$1;

    invoke-direct {v3, p0}, Lcom/bv/wifisync/AddExtensions$AddDialog$1;-><init>(Lcom/bv/wifisync/AddExtensions$AddDialog;)V

    .line 126
    invoke-static {p1, v0, v1, v2, v3}, Lcom/bv/wifisync/Dialogs;->showInputDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Lcom/bv/wifisync/Dialogs$OnOkClickListener;)Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->dialog:Landroid/app/AlertDialog;

    .line 138
    return-void
.end method

.method static synthetic access$0(Lcom/bv/wifisync/AddExtensions$AddDialog;)Lcom/bv/wifisync/AddExtensions;
    .locals 1
    .parameter

    .prologue
    .line 116
    iget-object v0, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    return-object v0
.end method


# virtual methods
.method close()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 141
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->edit:Landroid/widget/EditText;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->trimText(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, extension:Ljava/lang/String;
    :try_start_0
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 144
    invoke-static {v1}, Lcom/bv/sync/ExtensionFilter;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    :cond_0
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->extensions:Ljava/util/LinkedHashSet;
    invoke-static {v2}, Lcom/bv/wifisync/AddExtensions;->access$4(Lcom/bv/wifisync/AddExtensions;)Ljava/util/LinkedHashSet;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 149
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v2

    new-instance v3, Lcom/bv/wifisync/AddExtensions$SelectedItem;

    iget-object v4, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    invoke-direct {v3, v4, v1}, Lcom/bv/wifisync/AddExtensions$SelectedItem;-><init>(Lcom/bv/wifisync/AddExtensions;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v7}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->insert(Lcom/bv/wifisync/AddExtensions$SelectedItem;I)V

    .line 150
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    #getter for: Lcom/bv/wifisync/AddExtensions;->adapter:Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;
    invoke-static {v2}, Lcom/bv/wifisync/AddExtensions;->access$5(Lcom/bv/wifisync/AddExtensions;)Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/bv/wifisync/AddExtensions$ExtensionsAdapter;->notifyDataSetChanged()V

    .line 151
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    .line 152
    iget-object v2, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    const/4 v3, 0x0

    #setter for: Lcom/bv/wifisync/AddExtensions;->addDialog:Lcom/bv/wifisync/AddExtensions$AddDialog;
    invoke-static {v2, v3}, Lcom/bv/wifisync/AddExtensions;->access$6(Lcom/bv/wifisync/AddExtensions;Lcom/bv/wifisync/AddExtensions$AddDialog;)V

    .line 153
    return-void

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, e:Ljava/util/regex/PatternSyntaxException;
    new-instance v2, Ljava/io/IOException;

    iget-object v3, p0, Lcom/bv/wifisync/AddExtensions$AddDialog;->this$0:Lcom/bv/wifisync/AddExtensions;

    const v4, 0x7f0600b0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/regex/PatternSyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Lcom/bv/wifisync/AddExtensions;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
