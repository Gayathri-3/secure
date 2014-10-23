package com.bv.wifisync;

import android.preference.*;
import android.content.*;
import android.util.*;
import android.view.*;
import android.widget.*;
import android.graphics.*;

public class CheckPreference extends CheckBoxPreference
{
    public CheckPreference(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    public CheckPreference(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
    }
    
    protected void onBindView(final View view) {
        super.onBindView(view);
        try {
            final TextView textView = (TextView)view.findViewById(16908304);
            if (textView != null) {
                textView.setMaxLines(100);
            }
            final TextView textView2 = (TextView)view.findViewById(16908310);
            if (textView2 != null) {
                textView2.setSingleLine(false);
                textView2.setTextAppearance(this.getContext(), 16973892);
                textView2.setTypeface(Typeface.DEFAULT_BOLD);
            }
        }
        catch (Exception ex) {}
    }
}
