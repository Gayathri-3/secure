.class Lcom/bv/wifisync/PropertiesAdapter;
.super Landroid/widget/ArrayAdapter;
.source "PropertiesAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/bv/wifisync/PropertyRow;",
        ">",
        "Landroid/widget/ArrayAdapter",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, this:Lcom/bv/wifisync/PropertiesAdapter;,"Lcom/bv/wifisync/PropertiesAdapter<TT;>;"
    .local p2, rows:Ljava/util/List;,"Ljava/util/List<TT;>;"
    const v0, 0x7f0a000a

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 75
    return-void
.end method


# virtual methods
.method dispatchGoogleAnalytics(Landroid/app/Activity;)V
    .locals 8
    .parameter "activity"

    .prologue
    .line 120
    .local p0, this:Lcom/bv/wifisync/PropertiesAdapter;,"Lcom/bv/wifisync/PropertiesAdapter<TT;>;"
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertiesAdapter;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/bv/wifisync/Utils;->getTracker(Landroid/content/Context;)Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;

    move-result-object v4

    .line 121
    .local v4, tracker:Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, className:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertiesAdapter;->getCount()I

    move-result v6

    if-lt v1, v6, :cond_0

    .line 131
    invoke-virtual {v4}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->dispatch()Z

    .line 132
    return-void

    .line 123
    :cond_0
    invoke-virtual {p0, v1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bv/wifisync/PropertyRow;

    .line 124
    .local v2, item:Lcom/bv/wifisync/PropertyRow;,"TT;"
    if-eqz v2, :cond_1

    .line 125
    invoke-virtual {v2}, Lcom/bv/wifisync/PropertyRow;->getName()Ljava/lang/String;

    move-result-object v3

    .line 126
    .local v3, name:Ljava/lang/String;
    invoke-virtual {v2}, Lcom/bv/wifisync/PropertyRow;->getText()Landroid/text/Spanned;

    move-result-object v5

    .line 127
    .local v5, value:Landroid/text/Spanned;
    if-eqz v3, :cond_1

    if-eqz v5, :cond_1

    .line 128
    invoke-interface {v5}, Landroid/text/Spanned;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v4, v0, v3, v6, v7}, Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;->trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 122
    .end local v3           #name:Ljava/lang/String;
    .end local v5           #value:Landroid/text/Spanned;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 79
    .local p0, this:Lcom/bv/wifisync/PropertiesAdapter;,"Lcom/bv/wifisync/PropertiesAdapter<TT;>;"
    move-object v4, p2

    .line 80
    .local v4, result:Landroid/view/View;
    if-nez v4, :cond_0

    .line 81
    invoke-virtual {p0}, Lcom/bv/wifisync/PropertiesAdapter;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "layout_inflater"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/LayoutInflater;

    .line 82
    .local v7, vi:Landroid/view/LayoutInflater;
    const v8, 0x7f030001

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 85
    .end local v7           #vi:Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bv/wifisync/PropertyRow;

    .line 86
    .local v5, row:Lcom/bv/wifisync/PropertyRow;
    const v8, 0x7f0a0004

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 87
    .local v3, image:Landroid/widget/ImageView;
    invoke-virtual {v5}, Lcom/bv/wifisync/PropertyRow;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 88
    .local v2, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_1

    .line 89
    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 90
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 95
    :goto_0
    const v8, 0x7f0a0007

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 96
    .local v1, checkMoreView:Landroid/view/View;
    const v8, 0x7f0a0005

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 97
    .local v6, textView:Landroid/widget/TextView;
    invoke-virtual {v5}, Lcom/bv/wifisync/PropertyRow;->getText()Landroid/text/Spanned;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    instance-of v8, v5, Landroid/view/View$OnClickListener;

    if-eqz v8, :cond_2

    const/4 v8, 0x0

    :goto_1
    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 100
    const v8, 0x7f0a0006

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 101
    .local v0, checkBox:Landroid/widget/CheckBox;
    instance-of v8, v5, Lcom/bv/wifisync/OnCheckedChangeListenerEx;

    if-eqz v8, :cond_3

    .line 102
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 103
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    move-object v8, v5

    .line 104
    check-cast v8, Lcom/bv/wifisync/OnCheckedChangeListenerEx;

    invoke-interface {v8}, Lcom/bv/wifisync/OnCheckedChangeListenerEx;->getBooleanValue()Z

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setChecked(Z)V

    move-object v8, v5

    .line 105
    check-cast v8, Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 106
    const/16 v8, 0x8

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 110
    :goto_2
    invoke-virtual {v5}, Lcom/bv/wifisync/PropertyRow;->getEnabled()Z

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 111
    return-object v4

    .line 92
    .end local v0           #checkBox:Landroid/widget/CheckBox;
    .end local v1           #checkMoreView:Landroid/view/View;
    .end local v6           #textView:Landroid/widget/TextView;
    :cond_1
    const/4 v8, 0x4

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 98
    .restart local v1       #checkMoreView:Landroid/view/View;
    .restart local v6       #textView:Landroid/widget/TextView;
    :cond_2
    const/16 v8, 0x8

    goto :goto_1

    .line 108
    .restart local v0       #checkBox:Landroid/widget/CheckBox;
    :cond_3
    const/16 v8, 0x8

    invoke-virtual {v0, v8}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto :goto_2
.end method

.method public isEnabled(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 116
    .local p0, this:Lcom/bv/wifisync/PropertiesAdapter;,"Lcom/bv/wifisync/PropertiesAdapter<TT;>;"
    invoke-virtual {p0, p1}, Lcom/bv/wifisync/PropertiesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bv/wifisync/PropertyRow;

    invoke-virtual {v0}, Lcom/bv/wifisync/PropertyRow;->getEnabled()Z

    move-result v0

    return v0
.end method
