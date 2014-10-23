.class Lcom/bv/wifisync/AddHost$PasswordRow$1;
.super Ljava/lang/Object;
.source "AddHost.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bv/wifisync/AddHost$PasswordRow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

.field private final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost$PasswordRow;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$PasswordRow$1;->this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

    iput-object p2, p0, Lcom/bv/wifisync/AddHost$PasswordRow$1;->val$edit:Landroid/widget/EditText;

    .line 300
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 303
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$PasswordRow$1;->this$1:Lcom/bv/wifisync/AddHost$PasswordRow;

    iget-object v1, p0, Lcom/bv/wifisync/AddHost$PasswordRow$1;->val$edit:Landroid/widget/EditText;

    #calls: Lcom/bv/wifisync/AddHost$PasswordRow;->onCheck(Landroid/widget/EditText;Z)V
    invoke-static {v0, v1, p2}, Lcom/bv/wifisync/AddHost$PasswordRow;->access$0(Lcom/bv/wifisync/AddHost$PasswordRow;Landroid/widget/EditText;Z)V

    .line 304
    return-void
.end method
