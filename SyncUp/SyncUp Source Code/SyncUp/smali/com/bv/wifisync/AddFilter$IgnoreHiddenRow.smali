.class Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;
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
    name = "IgnoreHiddenRow"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bv/wifisync/AddFilter;


# direct methods
.method constructor <init>(Lcom/bv/wifisync/AddFilter;)V
    .locals 1
    .parameter

    .prologue
    .line 37
    iput-object p1, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    .line 38
    const v0, 0x7f060187

    invoke-direct {p0, p1, v0}, Lcom/bv/wifisync/AddFilter$FilterRow;-><init>(Lcom/bv/wifisync/AddFilter;I)V

    .line 39
    return-void
.end method


# virtual methods
.method public getBooleanValue()Z
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

    return v0
.end method

.method getImage()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    invoke-virtual {v0}, Lcom/bv/wifisync/AddFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020016

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method protected getValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 54
    iget-object v1, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

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
    .line 43
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iput-boolean p2, v0, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

    .line 44
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 45
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v1, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->job:Lcom/bv/wifisync/Job;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$3(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/Job;

    move-result-object v0

    iget-object v0, v0, Lcom/bv/wifisync/Job;->filter:Lcom/bv/wifisync/Job$Filter;

    iget-boolean v0, v0, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/bv/wifisync/Job$Filter;->ignoreHidden:Z

    .line 65
    iget-object v0, p0, Lcom/bv/wifisync/AddFilter$IgnoreHiddenRow;->this$0:Lcom/bv/wifisync/AddFilter;

    #getter for: Lcom/bv/wifisync/AddFilter;->adapter:Lcom/bv/wifisync/PropertiesAdapter;
    invoke-static {v0}, Lcom/bv/wifisync/AddFilter;->access$4(Lcom/bv/wifisync/AddFilter;)Lcom/bv/wifisync/PropertiesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertiesAdapter;->notifyDataSetChanged()V

    .line 66
    return-void

    .line 64
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
