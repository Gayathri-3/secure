package com.bv.wifisync;

import android.content.*;
import java.util.*;
import android.app.*;
import com.google.android.apps.analytics.*;
import android.text.*;
import android.view.*;
import android.widget.*;
import android.graphics.drawable.*;

class PropertiesAdapter<T extends PropertyRow> extends ArrayAdapter<T>
{
    PropertiesAdapter(final Context context, final List<T> list) {
        super(context, 2131361802, (List)list);
    }
    
    void dispatchGoogleAnalytics(final Activity activity) {
        final GoogleAnalyticsTracker tracker = Utils.getTracker(this.getContext());
        final String string = "/" + activity.getLocalClassName();
        for (int i = 0; i < this.getCount(); ++i) {
            final PropertyRow propertyRow = (PropertyRow)this.getItem(i);
            if (propertyRow != null) {
                final String name = propertyRow.getName();
                final Spanned text = propertyRow.getText();
                if (name != null && text != null) {
                    tracker.trackEvent(string, name, text.toString(), 1);
                }
            }
        }
        tracker.dispatch();
    }
    
    public View getView(final int n, final View view, final ViewGroup viewGroup) {
        View inflate = view;
        if (inflate == null) {
            inflate = ((LayoutInflater)this.getContext().getSystemService("layout_inflater")).inflate(2130903041, (ViewGroup)null);
        }
        final PropertyRow propertyRow = (PropertyRow)this.getItem(n);
        final ImageView imageView = (ImageView)inflate.findViewById(2131361796);
        final Drawable image = propertyRow.getImage();
        if (image != null) {
            imageView.setVisibility(0);
            imageView.setImageDrawable(image);
        }
        else {
            imageView.setVisibility(4);
        }
        final View viewById = inflate.findViewById(2131361799);
        ((TextView)inflate.findViewById(2131361797)).setText((CharSequence)propertyRow.getText());
        int visibility;
        if (propertyRow instanceof View$OnClickListener) {
            visibility = 0;
        }
        else {
            visibility = 8;
        }
        viewById.setVisibility(visibility);
        final CheckBox checkBox = (CheckBox)inflate.findViewById(2131361798);
        if (propertyRow instanceof OnCheckedChangeListenerEx) {
            checkBox.setVisibility(0);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)null);
            checkBox.setChecked(((OnCheckedChangeListenerEx)propertyRow).getBooleanValue());
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)propertyRow);
            viewById.setVisibility(8);
        }
        else {
            checkBox.setVisibility(8);
        }
        checkBox.setEnabled(propertyRow.getEnabled());
        return inflate;
    }
    
    public boolean isEnabled(final int n) {
        return ((PropertyRow)this.getItem(n)).getEnabled();
    }
}
