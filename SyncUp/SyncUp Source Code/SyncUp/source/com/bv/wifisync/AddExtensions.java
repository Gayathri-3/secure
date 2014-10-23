package com.bv.wifisync;

import android.os.*;
import android.app.*;
import android.content.*;
import java.util.regex.*;
import com.bv.sync.*;
import android.graphics.drawable.*;
import java.util.*;
import java.io.*;
import android.text.*;
import android.graphics.*;
import android.view.*;
import android.widget.*;

public class AddExtensions extends BrowseActivity
{
    private static final int MIN_REFRESH_TIME = 50;
    private ExtensionsAdapter adapter;
    private AddDialog addDialog;
    private DonateBiller addExtensionBiller;
    private LinkedHashSet<String> extensions;
    private Job job;
    private long lastAddTime;
    private ExtensionScanner scanner;
    
    public AddExtensions() {
        super();
        this.addExtensionBiller = new DonateBiller((Activity)this, Biller.ChargeType.AddDirExclude) {
            void onPurchase() {
                try {
                    if (AddExtensions.this.addDialog != null) {
                        AddExtensions.this.addDialog.close();
                    }
                }
                catch (Exception ex) {
                    Dialogs.showError((Context)AddExtensions.this, ex);
                }
            }
        };
    }
    
    static /* synthetic */ void access$10(final AddExtensions addExtensions, final ExtensionScanner scanner) {
        addExtensions.scanner = scanner;
    }
    
    static /* synthetic */ void access$6(final AddExtensions addExtensions, final AddDialog addDialog) {
        addExtensions.addDialog = addDialog;
    }
    
    static /* synthetic */ void access$9(final AddExtensions addExtensions, final long lastAddTime) {
        addExtensions.lastAddTime = lastAddTime;
    }
    
    private void cancelScan() {
        if (this.scanner != null) {
            this.scanner.cancel(true);
        }
        this.scanner = null;
    }
    
    private void clearAll() {
        this.extensions.clear();
        this.adapter.notifyDataSetChanged();
    }
    
    private void readParams() {
        this.job = (Job)this.getData();
        this.job.host = (Host)this.getIntent().getSerializableExtra("RESULT1");
        this.extensions = (LinkedHashSet<String>)this.getIntent().getSerializableExtra("RESULT2");
        if (this.extensions == null) {
            this.extensions = new LinkedHashSet<String>();
        }
    }
    
    public void onBackPressed() {
        this.cancelScan();
        super.onBackPressed();
    }
    
    protected void onButtonClick(final View view) throws IOException {
        this.cancelScan();
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.extensions);
        this.setResult(-1, intent);
        this.finish();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.readParams();
        this.setTitle(2131100065);
        this.setHelp(2131099880);
        this.setListAdapter((ListAdapter)(this.adapter = new ExtensionsAdapter()));
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131296256, menu);
        return true;
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.addExtensionBiller.close();
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        final int itemId = menuItem.getItemId();
        if (itemId == 2131361810) {
            this.addDialog = new AddDialog();
        }
        else if (itemId == 2131361811) {
            this.clearAll();
        }
        return super.onOptionsItemSelected(menuItem);
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        this.cancelScan();
        super.onProgressCancelClick(view);
    }
    
    private class AddDialog
    {
        static final String dot = ".";
        private final AlertDialog dialog;
        private final EditText edit;
        
        AddDialog() {
            super();
            (this.edit = new EditText((Context)new ContextThemeWrapper((Context)AddExtensions.this, 2131230722))).setInputType(524288);
            this.edit.setText((CharSequence)".");
            this.edit.setSelection(".".length());
            this.dialog = Dialogs.showInputDialog((Context)AddExtensions.this, AddExtensions.this.getString(2131100074), AddExtensions.this.getString(2131099884), this.edit, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
                public boolean onClick(final DialogInterface dialogInterface) throws IOException {
                    final boolean purchased = AddExtensions.this.addExtensionBiller.isPurchased();
                    if (purchased) {
                        AddDialog.this.close();
                    }
                    else {
                        AddExtensions.this.addExtensionBiller.purchase();
                    }
                    return purchased;
                }
            });
        }
        
        void close() throws IOException {
            final String trimText = Utils.trimText((TextView)this.edit);
            try {
                if (!trimText.startsWith(".")) {
                    ExtensionFilter.compile(trimText);
                }
                AddExtensions.this.extensions.add(trimText);
                AddExtensions.this.adapter.insert(new SelectedItem(trimText), 0);
                AddExtensions.this.adapter.notifyDataSetChanged();
                this.dialog.dismiss();
                AddExtensions.access$6(AddExtensions.this, null);
            }
            catch (PatternSyntaxException ex) {
                throw new IOException(AddExtensions.this.getString(2131099824, new Object[] { ex.getMessage() }));
            }
        }
    }
    
    private class ExtensionScanner extends Utils.ProgressTask<Void, String, Void>
    {
        ExtensionScanner() {
            super((Activity)AddExtensions.this, "ExtensionScanner");
            AddExtensions.this.setProgressVisible(true);
        }
        
        private void add(final String s) {
            if (s != null) {
                AddExtensions.this.runOnUiThread((Runnable)new Runnable() {
                    public void run() {
                        AddExtensions.this.adapter.add(new SelectedItem(s));
                    }
                });
            }
        }
        
        private String extractExtension(final String s) {
            final int lastIndex = s.lastIndexOf(".");
            String substring;
            if (lastIndex > 0) {
                substring = s.substring(lastIndex);
            }
            else {
                substring = null;
            }
            return substring;
        }
        
        private void fill(final IFile file) throws IOException {
            int i = 0;
            if (file != null && !this.isCancelled()) {
                final long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis - AddExtensions.this.lastAddTime > 50L) {
                    AddExtensions.access$9(AddExtensions.this, currentTimeMillis);
                    this.publishProgress((Object[])new String[] { file.getName() });
                }
                if (!file.isDirectory()) {
                    this.add(this.extractExtension(file.getName()));
                }
                else if (this.isValidDir(file)) {
                    for (IFile[] listFiles = file.listFiles(); i < listFiles.length; ++i) {
                        this.fill(listFiles[i]);
                    }
                }
            }
        }
        
        private boolean isValidDir(final IFile file) throws IOException {
            return (!Config.getIgnoreSymLinks((Context)AddExtensions.this) || !file.isSymlink()) && file.canRead();
        }
        
        protected Void atBackground(final Void... array) throws Exception {
            try {
                if (AddExtensions.this.job.getPhoneDir() != null && !this.isCancelled()) {
                    this.fill(AddExtensions.this.job.getLocalFolder((Context)AddExtensions.this));
                }
                if (AddExtensions.this.job.getPcDir() != null && !this.isCancelled()) {
                    this.fill(AddExtensions.this.job.getRemoteFolder((Context)AddExtensions.this));
                }
                return null;
            }
            catch (StackOverflowError stackOverflowError) {
                Errors.getErrorMessage((Context)AddExtensions.this, stackOverflowError);
                throw new IOException(AddExtensions.this.getString(2131099823));
            }
        }
        
        protected void onCancelled() {
            super.onCancelled();
            AddExtensions.this.setProgressVisible(false);
            AddExtensions.this.adapter.notifyDataSetChanged();
        }
        
        protected void onPostExecute(final Void void1) {
            super.onPostExecute(void1);
            AddExtensions.this.setProgressVisible(false);
            AddExtensions.this.adapter.notifyDataSetChanged();
        }
        
        protected void onProgressUpdate(final String... array) {
            AddExtensions.this.setProgress(0, array[0]);
        }
    }
    
    private class ExtensionsAdapter extends ArrayAdapter<SelectedItem>
    {
        private Map<String, Drawable> cache;
        
        public ExtensionsAdapter() {
            super((Context)AddExtensions.this, 2131361802);
            this.cache = new HashMap<String, Drawable>();
            final Iterator iterator = AddExtensions.this.extensions.iterator();
            while (iterator.hasNext()) {
                this.insert(new SelectedItem(iterator.next()), 0);
            }
            AddExtensions.access$10(AddExtensions.this, new ExtensionScanner());
            ((Utils.ProgressTask<Void, Progress, Result>)AddExtensions.this.scanner).run(null);
        }
        
        private Drawable getItemImage(final SelectedItem selectedItem) {
            Drawable fileImage = this.cache.get(selectedItem.name);
            if (fileImage == null) {
                fileImage = Utils.getFileImage((Context)AddExtensions.this, new File(selectedItem.name));
                this.cache.put(selectedItem.name, fileImage);
            }
            return fileImage;
        }
        
        private boolean isIncluded(final SelectedItem selectedItem) {
            return AddExtensions.this.extensions.contains(selectedItem.name);
        }
        
        private boolean update(final SelectedItem selectedItem) {
            for (int i = 0; i < this.getCount(); ++i) {
                final SelectedItem selectedItem2 = (SelectedItem)this.getItem(i);
                if (selectedItem2.name.compareTo(selectedItem.name) == 0) {
                    selectedItem2.count += 1;
                    return true;
                }
            }
            return false;
        }
        
        public void add(final SelectedItem selectedItem) {
            if (!this.update(selectedItem)) {
                selectedItem.count = 1;
                super.add((Object)selectedItem);
            }
            final long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - AddExtensions.this.lastAddTime > 50L) {
                AddExtensions.access$9(AddExtensions.this, currentTimeMillis);
                this.notifyDataSetChanged();
            }
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            View inflate = view;
            if (inflate == null) {
                inflate = ((LayoutInflater)AddExtensions.this.getSystemService("layout_inflater")).inflate(2130903043, (ViewGroup)null);
            }
            final SelectedItem onCheckedChangeListener = (SelectedItem)this.getItem(n);
            final TextView textView = (TextView)inflate.findViewById(2131361802);
            String s = onCheckedChangeListener.name;
            if (onCheckedChangeListener.count > 0) {
                s = String.valueOf(s) + " (" + onCheckedChangeListener.count + ")";
            }
            textView.setText((CharSequence)Html.fromHtml("<big>" + s + "</big>"));
            Typeface typeface;
            if (this.isIncluded(onCheckedChangeListener)) {
                typeface = Typeface.DEFAULT_BOLD;
            }
            else {
                typeface = Typeface.DEFAULT;
            }
            textView.setTypeface(typeface);
            final CheckBox checkBox = (CheckBox)inflate.findViewById(2131361798);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)null);
            checkBox.setChecked(this.isIncluded(onCheckedChangeListener));
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)onCheckedChangeListener);
            checkBox.setVisibility(0);
            ((ImageView)inflate.findViewById(2131361796)).setImageDrawable(AddExtensions.this.scaleListImage(this.getItemImage(onCheckedChangeListener)));
            return inflate;
        }
        
        public void insert(final SelectedItem selectedItem, final int n) {
            if (!this.update(selectedItem)) {
                selectedItem.count = 0;
                super.insert((Object)selectedItem, n);
            }
            this.notifyDataSetChanged();
        }
    }
    
    private class SelectedItem implements CompoundButton$OnCheckedChangeListener, View$OnClickListener
    {
        int count;
        final String name;
        
        SelectedItem(final String name) {
            super();
            this.name = name;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean b) {
            if (b) {
                AddExtensions.this.extensions.add(this.name);
            }
            else {
                AddExtensions.this.extensions.remove(this.name);
            }
            AddExtensions.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            if (!AddExtensions.this.extensions.remove(this.name)) {
                AddExtensions.this.extensions.add(this.name);
            }
            AddExtensions.this.adapter.notifyDataSetChanged();
        }
    }
}
