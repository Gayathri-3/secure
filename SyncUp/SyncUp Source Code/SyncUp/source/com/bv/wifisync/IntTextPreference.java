package com.bv.wifisync;

import android.preference.*;
import android.content.*;
import android.util.*;
import android.view.*;
import android.widget.*;
import android.graphics.*;

public class IntTextPreference extends EditTextPreference
{
    public IntTextPreference(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    protected void onBindView(final View view) {
        super.onBindView(view);
        try {
            ((TextView)view.findViewById(16908304)).setMaxLines(100);
            final TextView textView = (TextView)view.findViewById(16908310);
            textView.setSingleLine(false);
            textView.setTextAppearance(this.getContext(), 16973892);
            textView.setTypeface(Typeface.DEFAULT_BOLD);
        }
        catch (Exception ex) {}
    }
}
