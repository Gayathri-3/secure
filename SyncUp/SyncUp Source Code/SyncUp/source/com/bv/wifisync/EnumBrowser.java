package com.bv.wifisync;

import android.os.*;
import java.util.*;
import android.text.*;
import android.widget.*;
import android.content.*;
import android.view.*;
import java.io.*;
import android.graphics.drawable.*;

public class EnumBrowser extends BrowseActivity
{
    private Enumeration enumeration;
    
    public void onButtonClick(final View view) {
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.enumeration = (Enumeration)this.getData();
        this.setTitle((CharSequence)this.enumeration.getTitle((Context)this));
        this.buttonOk.setVisibility(8);
        this.setHelp(this.enumeration.hint);
        final ArrayList<String> list = new ArrayList<String>();
        final String[] values = this.enumeration.getValues();
        for (int length = values.length, i = 0; i < length; ++i) {
            list.add(values[i]);
        }
        this.getListView().setAdapter((ListAdapter)new ArrayAdapter<String>(this, 2131361802, list) {
            public View getView(final int n, View inflate, final ViewGroup viewGroup) {
                if (inflate == null) {
                    inflate = ((LayoutInflater)EnumBrowser.this.getSystemService("layout_inflater")).inflate(2130903043, (ViewGroup)null);
                }
                final ImageView imageView = (ImageView)inflate.findViewById(2131361796);
                final Drawable drawable = EnumBrowser.this.enumeration.getDrawable((Context)EnumBrowser.this, n);
                imageView.setImageDrawable(drawable);
                int visibility;
                if (drawable == null) {
                    visibility = 4;
                }
                else {
                    visibility = 0;
                }
                imageView.setVisibility(visibility);
                final TextView textView = (TextView)inflate.findViewById(2131361802);
                textView.setText((CharSequence)Html.fromHtml("<big>" + EnumBrowser.this.enumeration.getValues()[n] + "</big>"));
                Drawable drawable2;
                if (EnumBrowser.this.enumeration.getChecked((Context)EnumBrowser.this, n)) {
                    drawable2 = EnumBrowser.this.getResources().getDrawable(2130837507);
                }
                else {
                    drawable2 = null;
                }
                textView.setCompoundDrawablesWithIntrinsicBounds((Drawable)null, (Drawable)null, drawable2, (Drawable)null);
                return inflate;
            }
        });
        this.getListView().setOnItemClickListener((AdapterView$OnItemClickListener)new AdapterView$OnItemClickListener() {
            public void onItemClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                final Intent intent = new Intent();
                intent.putExtra("RESULT", n);
                EnumBrowser.this.setResult(-1, intent);
                EnumBrowser.this.finish();
            }
        });
    }
    
    abstract static class Enumeration implements Serializable
    {
        private static final long serialVersionUID = -5463535536376794763L;
        protected int hint;
        
        public boolean getChecked(final Context context, final int n) {
            return false;
        }
        
        Drawable getDrawable(final Context context, final int n) {
            return null;
        }
        
        public String getTitle(final Context context) {
            return null;
        }
        
        abstract String[] getValues();
    }
    
    static class OverlayedEnumeration extends Enumeration implements Serializable
    {
        private static final long serialVersionUID = -2991198721675379227L;
        private final int[][] images;
        private int selectedIndex;
        private final int title;
        private final String[] values;
        
        OverlayedEnumeration(final int title, final int hint, final String[] values, final int[][] images, final int selectedIndex) {
            super();
            this.title = title;
            this.values = values;
            this.images = images;
            this.hint = hint;
            this.selectedIndex = selectedIndex;
        }
        
        private Drawable overlayImage(final Context context, final int[] array) {
            int n;
            for (n = 0; n < array.length && array[n] != 0; ++n) {}
            Object o;
            if (n == 0) {
                o = null;
            }
            else {
                final Drawable[] array2 = new Drawable[n];
                for (int i = 0; i < array2.length; ++i) {
                    array2[i] = context.getResources().getDrawable(array[i]);
                }
                o = new LayerDrawable(array2);
            }
            return (Drawable)o;
        }
        
        public boolean getChecked(final Context context, final int n) {
            return n == this.selectedIndex;
        }
        
        Drawable getDrawable(final Context context, final int n) {
            Drawable overlayImage;
            if (this.images != null && this.images[n][0] != 0) {
                overlayImage = this.overlayImage(context, this.images[n]);
            }
            else {
                overlayImage = null;
            }
            return overlayImage;
        }
        
        public String getTitle(final Context context) {
            return context.getString(this.title);
        }
        
        String[] getValues() {
            return this.values;
        }
    }
    
    static class SimpleEnumeration extends Enumeration implements Serializable
    {
        private static final long serialVersionUID = 9140129740605621963L;
        private final int[] imageId;
        private final int title;
        private final String[] values;
        
        SimpleEnumeration(final int title, final int hint, final String[] values, final int[] imageId) {
            super();
            this.title = title;
            this.hint = hint;
            this.values = values;
            this.imageId = imageId;
        }
        
        Drawable getDrawable(final Context context, final int n) {
            Drawable drawable;
            if (this.imageId != null && this.imageId.length != 0 && this.imageId[n] != 0) {
                drawable = context.getResources().getDrawable(this.imageId[n]);
            }
            else {
                drawable = null;
            }
            return drawable;
        }
        
        public String getTitle(final Context context) {
            return context.getString(this.title);
        }
        
        String[] getValues() {
            return this.values;
        }
    }
}
