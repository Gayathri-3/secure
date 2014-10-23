.class Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;
.super Lcom/bv/wifisync/AddFilter$FilterRow;
.source "AddFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/bv/wifisync/OnCheckedChangeListenerEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/wifisync/AddFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IgnoreUnreadableRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 1
    .parameter

    .prologue
    .line 70
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 71
    const v0, 0x7f060188

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$FilterRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 72
    return-void
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    return v0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020022

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 92
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    if-eqz v0, :cond_0

    const v0, 0x7f06011f

    :goto_0
    invoke-virtual {v1, v0}, Lcom/bv/wifisync/AddFilter;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f060120

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .parameter "arg0"
    .parameter "checked"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iput-boolean p2, v0, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    .line 77
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 78
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 97
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v1, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/bv/wifisync/Job$Filter;->ignoreReadProtected:Z

    .line 98
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreUnreadableRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 99
    return-void

    .line 97
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
