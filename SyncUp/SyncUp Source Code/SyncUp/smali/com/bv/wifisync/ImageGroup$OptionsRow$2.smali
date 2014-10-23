.class Lcom/bv/wifisync/ImageGroup$OptionsRow$2;
.super Ljava/lang/Object;
.source "ImageGroup.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


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
    iput-object p1, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$2;->this$1:Lcom/bv/wifisync/ImageGroup$OptionsRow;

    iput-object p2, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$2;->val$selected:[Z

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 1
    .parameter "dialog"
    .parameter "which"
    .parameter "isChecked"

    .prologue
    .line 130
    iget-object v0, p0, Lcom/bv/wifisync/ImageGroup$OptionsRow$2;->val$selected:[Z

    aput-boolean p3, v0, p2

    .line 131
    return-void
.end method
