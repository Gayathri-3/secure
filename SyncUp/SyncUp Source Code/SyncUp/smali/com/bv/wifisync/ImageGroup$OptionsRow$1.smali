.class Lcom/bv/wifisync/ImageGroup$OptionsRow$1;
.super Ljava/lang/Object;
.source "ImageGroup.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/ImageGroup$OptionsRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

.field private final synthetic val$selected:[Z


# direct methods
.method constructor <init>(Lcom/bv/wifisync/ImageGroup$OptionsRow;[Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

    iput-object p2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->val$selected:[Z

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 121
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

    #getter for: Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup$OptionsRow;->access$0(Lcom/bv/wifisync/ImageGroup$OptionsRow;)Lcom/bv/wifisync/ImageGroup;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->val$selected:[Z

    const/4 v2, 0x0

    aget-boolean v1, v1, v2

    iput-boolean v1, v0, Lcom/bv/sync/ImageScanner$Options;->numericMonth:Z

    .line 122
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

    #getter for: Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup$OptionsRow;->access$0(Lcom/bv/wifisync/ImageGroup$OptionsRow;)Lcom/bv/wifisync/ImageGroup;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->val$selected:[Z

    const/4 v2, 0x1

    aget-boolean v1, v1, v2

    iput-boolean v1, v0, Lcom/bv/sync/ImageScanner$Options;->doubleDigitDay:Z

    .line 123
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

    #getter for: Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup$OptionsRow;->access$0(Lcom/bv/wifisync/ImageGroup$OptionsRow;)Lcom/bv/wifisync/ImageGroup;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/ImageGroup;->plugin:Lcom/bv/wifisync/ImagePlugin;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$4(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/ImagePlugin;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/ImagePlugin;->options:Lcom/bv/sync/ImageScanner$Options;

    iget-object v1, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->val$selected:[Z

    const/4 v2, 0x2

    aget-boolean v1, v1, v2

    iput-boolean v1, v0, Lcom/bv/sync/ImageScanner$Options;->groupVideos:Z

    .line 124
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$1;->this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

    #getter for: Lcom/bv/wifisync/ImageGroup$OptionsRow;->this$0:Lcom/bv/wifisync/ImageGroup;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup$OptionsRow;->access$0(Lcom/bv/wifisync/ImageGroup$OptionsRow;)Lcom/bv/wifisync/ImageGroup;

    move-result-object v0

    #getter for: Lcom/bv/wifisync/ImageGroup;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/ImageGroup;->access$5(Lcom/bv/wifisync/ImageGroup;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 125
    return-void
.end method
