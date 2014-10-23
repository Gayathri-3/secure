package com.bv.wifisync;

import android.content.*;
import android.graphics.drawable.*;
import android.text.*;

abstract class PropertyRow
{
    private final Context context;
    private final String name;
    
    PropertyRow(final Context context, final int n) {
        this(context, context.getString(n));
    }
    
    PropertyRow(final Context context, final String name) {
        super();
        this.name = name;
        this.context = context;
    }
    
    protected boolean getEnabled() {
        return true;
    }
    
    Drawable getImage() {
        return null;
    }
    
    protected String getMissingValueText() {
        return this.context.getString(2131099958);
    }
    
    protected String getName() {
        return this.name;
    }
    
    Spanned getText() {
        String s = this.getValue();
        if (s == null) {
            s = "";
        }
        String s2;
        if (s == "") {
            s2 = "<big><b><font color=\"red\">%s</font></b></big><br/><font color=\"grey\">%s</font>";
        }
        else {
            s2 = "<big><b>%s</b></big><br/>%s";
        }
        if (s == "") {
            s = this.getMissingValueText();
        }
        String s3 = this.getName();
        if (!this.getEnabled()) {
            s3 = String.format("<font color=\"#808080\">%s</font>", s3);
        }
        return Html.fromHtml(String.format(s2, s3, s));
    }
    
    protected abstract String getValue();
}
