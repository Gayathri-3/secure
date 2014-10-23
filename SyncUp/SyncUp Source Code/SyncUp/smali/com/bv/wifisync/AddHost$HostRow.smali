.class Lcom/bv/wifisync/AddHost$HostRow;
.super Lcom/bv/wifisync/PropertyRow;
.source "AddHost.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HostRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddHost;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddHost;)V
    .locals 1
    .parameter

    .prologue
    .line 139
    iput-object p1, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    .line 140
    const v0, 0x7f0600f7

    invoke-virtual {p1, v0}, Lcom/bv/wifisync/AddHost;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/PropertyRow;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 141
    return-void
.end method


# virtual methods
.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddHost;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->host:Lcom/bv/wifisync/Host;
    invoke-static {v0}, Lcom/bv/wifisync/AddHost;->access$4(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/Host;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Host;->name:Ljava/lang/String;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "arg0"

    .prologue
    .line 151
    :try_start_0
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v2}, Lcom/bv/wifisync/Utils;->checkWifi(Landroid/content/Context;)V

    .line 152
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    const-class v3, Lcom/bv/wifisync/HostBrowser;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 153
    .local v1, intent:Landroid/content/Intent;
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    iget-object v3, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    #getter for: Lcom/bv/wifisync/AddHost;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v3}, Lcom/bv/wifisync/AddHost;->access$7(Lcom/bv/wifisync/AddHost;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/bv/wifisync/PropertiesAdapter;->getPosition(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v2, v1, v3}, Lcom/bv/wifisync/AddHost;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    .end local v1           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, e:Ljava/lang/Exception;
    iget-object v2, p0, Lcom/bv/wifisync/AddHost$HostRow;->this$0:Lcom/bv/wifisync/AddHost;

    invoke-static {v2, v0}, Lcom/bv/wifisync/Dialogs;->showError(Landroid/content/Context;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
