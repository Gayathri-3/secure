package com.bv.wifisync;

import android.widget.*;
import android.content.*;
import android.util.*;

public class TextViewEx extends TextView
{
    public TextViewEx(final Context context) {
        super(context);
    }
    
    public TextViewEx(final Context context, final AttributeSet set) {
        super(context, set);
    }
    
    public TextViewEx(final Context context, final AttributeSet set, final int n) {
        super(context, set, n);
    }
    
    protected float getLeftFadingEdgeStrength() {
        try {
            return super.getLeftFadingEdgeStrength();
        }
        catch (NullPointerException ex) {
            return 0.0f;
        }
    }
}
