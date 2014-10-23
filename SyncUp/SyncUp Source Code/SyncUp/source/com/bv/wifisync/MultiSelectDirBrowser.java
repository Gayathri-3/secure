package com.bv.wifisync;

import android.app.*;
import java.io.*;
import com.bv.sync.*;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import android.graphics.*;
import java.util.*;

public class MultiSelectDirBrowser extends DirBrowser
{
    private final DonateBiller biller;
    private MultiSelectOptions selectionOptions;
    
    public MultiSelectDirBrowser() {
        super();
        this.biller = new DonateBiller((Activity)this, Biller.ChargeType.AddDirExclude) {
            void onPurchase() {
                MultiSelectDirBrowser.this.returnResult(-1);
            }
        };
    }
    
    private void clearAll() {
        this.selectionOptions.selected.clear();
    }
    
    private String fixPath(String substring) {
        if (substring.charAt(-1 + substring.length()) == '/') {
            substring = substring.substring(0, -1 + substring.length());
        }
        return substring;
    }
    
    private int getCheckCount() {
        int size;
        if (this.selectionOptions != null && this.selectionOptions.selected != null) {
            size = this.selectionOptions.selected.size();
        }
        else {
            size = 0;
        }
        return size;
    }
    
    private void returnResult(final int n) {
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.selectionOptions);
        intent.putExtra("lastError", (Serializable)this.lastError);
        this.setResult(n, intent);
        this.finish();
    }
    
    private void selectAll() {
        this.clearAll();
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            this.selectionOptions.selected.add(this.fixPath(((DirBrowser.FileInfo)this.adapter.getItem(i)).file.getAbsolutePath()));
        }
    }
    
    public static void selectDir(final Activity activity, final IFile file, final MultiSelectOptions multiSelectOptions) {
        DirBrowser.internalSelectDir(activity, file, (DirBrowser.Options)multiSelectOptions, new Intent((Context)activity, (Class)MultiSelectDirBrowser.class));
    }
    
    protected DirBrowser.DirAdapter createAdapter() {
        return new MultiSelectAdapter(new ArrayList<DirBrowser.FileInfo>());
    }
    
    protected int getDefaultHelp() {
        return 2131099867;
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n2 == -1 || (n2 == 0 && intent != null)) {
            final MultiSelectOptions selectionOptions = (MultiSelectOptions)intent.getSerializableExtra("RESULT");
            if (selectionOptions != null) {
                this.selectionOptions = selectionOptions;
            }
            this.lastError = (Throwable)intent.getSerializableExtra("lastError");
            this.setHelp();
            this.adapter.notifyDataSetChanged();
            if (n2 == -1) {
                this.returnResult(-1);
            }
        }
        else if (n2 >= 65536) {
            super.onActivityResult(n, n2, intent);
        }
    }
    
    public void onBackPressed() {
        this.returnResult(0);
        super.onBackPressed();
    }
    
    public void onButtonClick(final View view) {
        if (!this.biller.isPurchased() && this.getCheckCount() != 0) {
            this.biller.purchase();
        }
        else {
            this.returnResult(-1);
        }
    }
    
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.options.showSelection = true;
        this.selectionOptions = (MultiSelectOptions)this.options;
        this.buttonOk.setText(17039370);
        this.adapter.notifyDataSetChanged();
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131296265, menu);
        return true;
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.biller.close();
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        if (menuItem.getItemId() == 2131361819) {
            this.selectAll();
        }
        else {
            if (menuItem.getItemId() != 2131361811) {
                return super.onOptionsItemSelected(menuItem);
            }
            this.clearAll();
        }
        this.adapter.notifyDataSetChanged();
        return true;
    }
    
    public boolean onPrepareOptionsMenu(final Menu menu) {
        return true;
    }
    
    protected void selectDir(final IFile file, final DirBrowser.Options options) {
        super.selectDir(file, (DirBrowser.Options)this.selectionOptions);
    }
    
    protected void setupButtonChoose() {
        super.setupButtonChoose();
        this.buttonOk.setText(17039370);
    }
    
    protected void setupDropdown() {
    }
    
    private class CheckableFileInfo extends DirBrowser.FileInfo
    {
        CheckableFileInfo(final DirBrowser.FileInfo fileInfo) {
            super(fileInfo);
        }
        
        private void update() {
            if (this.selected) {
                MultiSelectDirBrowser.this.selectionOptions.selected.add(MultiSelectDirBrowser.this.fixPath(this.file.getAbsolutePath()));
            }
            else {
                MultiSelectDirBrowser.this.selectionOptions.selected.remove(MultiSelectDirBrowser.this.fixPath(this.file.getAbsolutePath()));
            }
            MultiSelectDirBrowser.this.adapter.notifyDataSetChanged();
        }
        
        boolean hasChidlren() {
            String s = this.file.getAbsolutePath();
            if (!s.endsWith("/")) {
                s = String.valueOf(s) + "/";
            }
            final Iterator<String> iterator = MultiSelectDirBrowser.this.selectionOptions.selected.iterator();
            while (iterator.hasNext()) {
                if (iterator.next().startsWith(s)) {
                    return true;
                }
            }
            return false;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean b) {
            super.onCheckedChanged(compoundButton, b);
            this.update();
        }
        
        public void onClick(final View view) {
            if (view instanceof CheckBox) {
                this.selected = ((CheckBox)view).isChecked();
                this.update();
                MultiSelectDirBrowser.this.adapter.notifyDataSetChanged();
            }
            else {
                super.onClick(view);
            }
        }
    }
    
    private class MultiSelectAdapter extends DirBrowser.DirAdapter
    {
        MultiSelectAdapter(final ArrayList<DirBrowser.FileInfo> list) {
            super(list);
        }
        
        public void add(final ArrayList<DirBrowser.FileInfo> list) {
            this.clear();
            final Iterator<DirBrowser.FileInfo> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.add((Object)new CheckableFileInfo(iterator.next()));
            }
            this.notifyDataSetChanged();
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            final View view2 = super.getView(n, view, viewGroup);
            final CheckBox checkBox = (CheckBox)view2.findViewById(2131361798);
            checkBox.setVisibility(0);
            final CheckableFileInfo onCheckedChangeListener = (CheckableFileInfo)this.getItem(n);
            final boolean contains = MultiSelectDirBrowser.this.selectionOptions.selected.contains(MultiSelectDirBrowser.this.fixPath(onCheckedChangeListener.file.getAbsolutePath()));
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)null);
            checkBox.setChecked(contains);
            while (true) {
                Label_0145: {
                    if (contains) {
                        break Label_0145;
                    }
                    final boolean hasChidlren = onCheckedChangeListener.hasChidlren();
                    final int n2 = 0;
                    if (hasChidlren) {
                        break Label_0145;
                    }
                    final TextView textView = (TextView)view2.findViewById(2131361802);
                    Typeface typeface;
                    if (n2 != 0) {
                        typeface = Typeface.DEFAULT_BOLD;
                    }
                    else {
                        typeface = Typeface.DEFAULT;
                    }
                    textView.setTypeface(typeface);
                    checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)onCheckedChangeListener);
                    return view2;
                }
                final int n2 = 1;
                continue;
            }
        }
    }
    
    static class MultiSelectOptions extends DirBrowser.Options
    {
        private static final long serialVersionUID = 6443110099179500637L;
        LinkedHashSet<String> selected;
        
        MultiSelectOptions() {
            super();
            this.selected = new LinkedHashSet<String>();
        }
    }
}
