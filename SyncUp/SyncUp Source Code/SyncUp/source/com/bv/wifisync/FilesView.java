package com.bv.wifisync;

import android.os.*;
import java.io.*;
import android.content.*;
import android.widget.*;
import java.util.*;
import android.view.*;
import android.graphics.drawable.*;

public class FilesView extends BrowseActivity
{
    private static final int IMAGE_TOP_PADDING = 2;
    
    public void onButtonClick(final View view) {
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setTitle(2131100001);
        this.buttonOk.setVisibility(8);
        final ArrayList<ItemRow> list = new ArrayList<ItemRow>();
        while (true) {
            try {
                final Iterator<SyncFile> iterator = SyncFile.read((File)this.getData()).iterator();
                while (iterator.hasNext()) {
                    list.add(new ItemRow(iterator.next()));
                }
                this.setListAdapter((ListAdapter)new PropertiesAdapter<ItemRow>(this, list) {
                    public View getView(final int n, final View view, final ViewGroup viewGroup) {
                        final View view2 = super.getView(n, view, viewGroup);
                        final ImageView imageView = (ImageView)view2.findViewById(2131361796);
                        imageView.setPadding(imageView.getPaddingLeft(), 2, imageView.getPaddingRight(), imageView.getPaddingBottom());
                        imageView.setScaleType(ImageView$ScaleType.FIT_START);
                        imageView.setImageDrawable(FilesView.this.scaleListImage(imageView.getDrawable()));
                        return view2;
                    }
                    
                    public boolean isEnabled(final int n) {
                        return false;
                    }
                });
                this.setHelp(2131099872);
            }
            catch (Exception ex) {
                Dialogs.showError((Context)this, ex);
                continue;
            }
            break;
        }
    }
    
    private class ItemRow extends PropertyRow
    {
        private SyncFile file;
        
        ItemRow(final SyncFile file) {
            super((Context)FilesView.this, new File(file.path).getName());
            this.file = file;
        }
        
        Drawable getImage() {
            Drawable drawable;
            if (this.file.isFolder == null) {
                drawable = FilesView.this.getResources().getDrawable(2130837522);
            }
            else if (this.file.isFolder) {
                drawable = FilesView.this.getResources().getDrawable(2130837530);
            }
            else {
                drawable = Utils.getFileImage((Context)FilesView.this, new File(this.file.path));
            }
            return drawable;
        }
        
        protected String getValue() {
            String s = FilesView.this.getString(2131099998, new Object[] { new File(this.file.path).getParent() });
            if (this.file.modifiedTime > 0L) {
                s = String.valueOf(s) + FilesView.this.getString(2131099999, new Object[] { Utils.toDate((Context)FilesView.this, this.file.modifiedTime) });
            }
            if (this.file.size > 0L) {
                s = String.valueOf(s) + FilesView.this.getString(2131100000, new Object[] { Utils.humanReadableSize(this.file.size) });
            }
            return s;
        }
    }
}
