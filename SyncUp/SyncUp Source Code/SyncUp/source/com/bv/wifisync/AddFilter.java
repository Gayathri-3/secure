package com.bv.wifisync;

import android.app.*;
import java.io.*;
import android.os.*;
import android.content.*;
import java.util.*;
import android.view.*;
import android.graphics.drawable.*;
import com.bv.sync.*;
import android.text.*;
import android.widget.*;

public class AddFilter extends BrowseActivity
{
    private PropertiesAdapter<FilterRow> adapter;
    private Job job;
    
    private void cancelAll() {
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            ((FilterRow)this.adapter.getItem(i)).cancel();
        }
    }
    
    private void checkConflicts() throws IOException {
        this.checkConflicts(this.job.filter.includeExtensions, this.job.filter.extensions);
        this.checkConflicts(this.job.filter.includeLocalFiles, this.job.filter.localFiles);
        this.checkConflicts(this.job.filter.includeRemoteFiles, this.job.filter.remoteFiles);
        if (this.job.filter.modifiedDate != 0 && this.job.filter.includeModifiedDate != 0 && this.job.filter.modifiedDate >= this.job.filter.includeModifiedDate) {
            throw new IOException(this.getString(2131099829));
        }
    }
    
    private void checkConflicts(final LinkedHashSet<String> set, final LinkedHashSet<String> set2) throws IOException {
        if (Utils.hasData((Collection<Object>)set) && Utils.hasData((Collection<Object>)set2)) {
            final Iterator<String> iterator = (Iterator<String>)set.iterator();
            while (iterator.hasNext()) {
                if (set2.contains(iterator.next())) {
                    throw new IOException(this.getString(2131099829));
                }
            }
        }
    }
    
    private String concat(final String s, final String s2) {
        return Utils.concat(s, s2, ",");
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        super.onActivityResult(n, n2, intent);
        if (n2 == -1) {
            ((Utils.ProgressTask<Object, Progress, Result>)new Utils.ProgressTask<Object, Void, Void>(this, "UpdateFilter") {
                protected Void atBackground(final Object... array) throws Exception {
                    ((FilterRow)AddFilter.this.adapter.getItem(n)).update(array[0]);
                    return null;
                }
                
                protected void onPostExecute(final Void void1) {
                    super.onPostExecute(void1);
                    AddFilter.this.adapter.notifyDataSetChanged();
                }
            }).run(intent.getSerializableExtra("RESULT"));
        }
    }
    
    public void onBackPressed() {
        super.onBackPressed();
        this.cancelAll();
    }
    
    protected void onButtonClick(final View view) throws IOException {
        this.checkConflicts();
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.job);
        this.setResult(-1, intent);
        this.cancelAll();
        this.finish();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.job = (Job)this.getData();
        this.job.host = (Host)this.getIntent().getSerializableExtra("RESULT1");
        this.setListAdapter((ListAdapter)(this.adapter = new PropertiesAdapter<FilterRow>(this, Arrays.asList(new HeaderRow(2131100037, "Green", "+"), new IncludeLocalFilesRow((IncludeLocalFilesRow)null), new IncludeRemoteFilesRow((IncludeRemoteFilesRow)null), new IncludeExtensionsRow(), new IncludeDateRow((IncludeDateRow)null), new HeaderRow(2131100038, "Red", "-"), new IgnoreHiddenRow(), new IgnoreUnreadableRow(), new ExcludeLocalFilesRow((ExcludeLocalFilesRow)null), new ExcludeRemoteFilesRow((ExcludeRemoteFilesRow)null), new ExcludeExtensionsRow(), new ExcludeDateRow((ExcludeDateRow)null))) {
            private boolean isHeader(final int n) {
                return this.getItem(n) instanceof HeaderRow;
            }
            
            public int getItemViewType(final int n) {
                int n2;
                if (this.isHeader(n)) {
                    n2 = 0;
                }
                else {
                    n2 = 1;
                }
                return n2;
            }
            
            public View getView(final int n, final View view, final ViewGroup viewGroup) {
                final View view2 = super.getView(n, view, viewGroup);
                if (this.isHeader(n)) {
                    view2.setBackgroundResource(17301522);
                    ((ImageView)view2.findViewById(2131361796)).setVisibility(8);
                }
                return view2;
            }
            
            public int getViewTypeCount() {
                return 2;
            }
            
            public boolean isEnabled(final int n) {
                return ((FilterRow)this.getItem(n)).getEnabled();
            }
        }));
        this.setTitle(2131100036);
        this.setHelp(2131099875);
    }
    
    private abstract class DateRow extends FilterRow implements View$OnClickListener
    {
        DateRow() {
            super(2131100094);
        }
        
        private String getMessage(final int n) {
            String s;
            if (n == 0) {
                s = AddFilter.this.getString(2131099925);
            }
            else {
                s = AddFilter.this.getString(2131100095, new Object[] { n });
            }
            return s;
        }
        
        Drawable getImage() {
            return AddFilter.this.getResources().getDrawable(2130837556);
        }
        
        protected abstract int getModified();
        
        protected String getValue() {
            String s;
            if (this.getModified() == 0) {
                s = AddFilter.this.getString(2131099925);
            }
            else {
                s = this.getMessage(this.getModified());
            }
            return s;
        }
        
        public void onClick(final View view) {
            ((Dialogs.NumberPickerDialogBase)new Dialogs.NumberPickerDialog(AddFilter.this, AddFilter.this.getString(2131100094), this.getMessage(this.getModified()), this.getModified(), 365) {
                protected void onButtonOK(final int modified) {
                    DateRow.this.setModified(modified);
                    AddFilter.this.adapter.notifyDataSetChanged();
                }
                
                protected void onValueChanged(final int n) {
                    ((Dialogs.NumberPickerDialogBase)this).setMessage(DateRow.this.getMessage(n));
                }
            }).show();
        }
        
        protected abstract void setModified(final int p0);
    }
    
    private class ExcludeDateRow extends DateRow
    {
        protected int getModified() {
            return AddFilter.this.job.filter.modifiedDate;
        }
        
        protected void setModified(final int modifiedDate) {
            AddFilter.this.job.filter.modifiedDate = modifiedDate;
        }
    }
    
    private class ExcludeExtensionsRow extends ExtensionsRow
    {
        ExcludeExtensionsRow() {
            super(AddFilter.this.job.filter.extensions);
        }
        
        void update(final Object o) throws Exception {
            super.update(o);
            AddFilter.this.job.filter.extensions = this.extensions;
        }
    }
    
    private class ExcludeLocalFilesRow extends LocalFilesRow
    {
        protected LinkedHashSet<String> getFilterFiles() {
            LinkedHashSet<String> localFiles;
            if (Utils.hasData(AddFilter.this.job.filter.localFiles)) {
                localFiles = AddFilter.this.job.filter.localFiles;
            }
            else {
                localFiles = null;
            }
            return localFiles;
        }
        
        protected void setFilterFiles(final LinkedHashSet<String> localFiles) {
            AddFilter.this.job.filter.localFiles = localFiles;
        }
    }
    
    private class ExcludeRemoteFilesRow extends RemoteFilesRow
    {
        protected LinkedHashSet<String> getFilterFiles() {
            LinkedHashSet<String> remoteFiles;
            if (Utils.hasData(AddFilter.this.job.filter.remoteFiles)) {
                remoteFiles = AddFilter.this.job.filter.remoteFiles;
            }
            else {
                remoteFiles = null;
            }
            return remoteFiles;
        }
        
        protected void setFilterFiles(final LinkedHashSet<String> remoteFiles) {
            AddFilter.this.job.filter.remoteFiles = remoteFiles;
        }
    }
    
    private abstract class ExtensionsRow extends FilterRow implements View$OnClickListener
    {
        protected LinkedHashSet<String> extensions;
        
        ExtensionsRow(final LinkedHashSet<String> extensions) {
            super(2131100065);
            this.extensions = extensions;
        }
        
        protected boolean getEnabled() {
            return AddFilter.this.job.getPhoneDir() != null || AddFilter.this.job.getPcDir() != null;
        }
        
        protected String getValue() {
            String s;
            if (!Utils.hasData(this.extensions)) {
                s = AddFilter.this.getString(2131099925);
            }
            else {
                s = "";
                final Iterator<String> iterator = this.extensions.iterator();
                while (iterator.hasNext()) {
                    s = AddFilter.this.concat(s, iterator.next());
                }
            }
            return s;
        }
        
        public void onClick(final View view) {
            final Intent intent = new Intent((Context)AddFilter.this, (Class)AddExtensions.class);
            intent.putExtra("RESULT", (Serializable)AddFilter.this.job);
            intent.putExtra("RESULT1", (Serializable)AddFilter.this.job.host);
            intent.putExtra("RESULT2", (Serializable)this.extensions);
            AddFilter.this.startActivityForResult(intent, AddFilter.this.adapter.getPosition((Object)this));
        }
        
        void update(final Object o) throws Exception {
            this.extensions = (LinkedHashSet<String>)o;
        }
    }
    
    private abstract class FilesRow extends FilterRow implements View$OnClickListener
    {
        private DirFetcher fetcher;
        final /* synthetic */ AddFilter this$0;
        
        FilesRow(final int n) {
            super(n);
        }
        
        static /* synthetic */ void access$0(final FilesRow filesRow, final DirFetcher fetcher) {
            filesRow.fetcher = fetcher;
        }
        
        void cancel() {
            if (this.fetcher != null) {
                this.fetcher.cancel(true);
            }
            super.cancel();
        }
        
        protected abstract LinkedHashSet<String> getFilterFiles();
        
        protected abstract IFile getRootDir() throws Exception;
        
        protected String getValue() {
            String s = "";
            if (this.getFilterFiles() != null) {
                final Iterator<String> iterator = this.getFilterFiles().iterator();
                while (iterator.hasNext()) {
                    s = AddFilter.this.concat(s, iterator.next());
                }
            }
            else {
                s = AddFilter.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            try {
                final MultiSelectDirBrowser.MultiSelectOptions multiSelectOptions = new MultiSelectDirBrowser.MultiSelectOptions();
                multiSelectOptions.readOnly = true;
                multiSelectOptions.showButton = true;
                multiSelectOptions.requestCode = AddFilter.this.adapter.getPosition((Object)this);
                if (this.fetcher == null) {
                    ((Utils.ProgressTask<MultiSelectDirBrowser.MultiSelectOptions, Progress, Result>)new DirFetcher()).run(multiSelectOptions);
                }
            }
            catch (Exception ex) {
                Dialogs.showError((Context)AddFilter.this, ex);
            }
        }
        
        protected abstract void setFilterFiles(final LinkedHashSet<String> p0);
        
        void update(final Object o) throws Exception {
            final MultiSelectDirBrowser.MultiSelectOptions multiSelectOptions = (MultiSelectDirBrowser.MultiSelectOptions)o;
            final String absolutePath = this.getRootDir().getAbsolutePath();
            final LinkedHashSet<String> filterFiles = new LinkedHashSet<String>();
            final Iterator<Object> iterator = multiSelectOptions.selected.iterator();
            while (iterator.hasNext()) {
                filterFiles.add(CifsSync.getRelativePath(iterator.next(), absolutePath));
            }
            this.setFilterFiles(filterFiles);
        }
        
        private class DirFetcher extends Utils.ProgressTask<MultiSelectDirBrowser.MultiSelectOptions, Void, Void>
        {
            DirFetcher() {
                super((Activity)FilesRow.this.this$0, "DirFetcher");
                FilesRow.access$0(FilesRow.this, this);
            }
            
            protected Void atBackground(final MultiSelectDirBrowser.MultiSelectOptions... array) throws Exception {
                final MultiSelectDirBrowser.MultiSelectOptions multiSelectOptions = array[0];
                multiSelectOptions.selected = new LinkedHashSet<String>();
                final IFile rootDir = FilesRow.this.getRootDir();
                String s = rootDir.getAbsolutePath();
                if (s.charAt(-1 + s.length()) != '/') {
                    s = String.valueOf(s) + '/';
                }
                final LinkedHashSet<String> filterFiles = FilesRow.this.getFilterFiles();
                if (filterFiles != null) {
                    final Iterator<Object> iterator = filterFiles.iterator();
                    while (iterator.hasNext()) {
                        multiSelectOptions.selected.add(String.valueOf(s) + iterator.next());
                    }
                }
                MultiSelectDirBrowser.selectDir((Activity)AddFilter.this, rootDir, multiSelectOptions);
                return null;
            }
            
            protected void onCancelled() {
                FilesRow.access$0(FilesRow.this, null);
                super.onCancelled();
            }
            
            protected void onPostExecute(final Void void1) {
                FilesRow.access$0(FilesRow.this, null);
                super.onPostExecute(void1);
            }
        }
    }
    
    private abstract class FilterRow extends PropertyRow
    {
        FilterRow(final int n) {
            super((Context)AddFilter.this, n);
        }
        
        void cancel() {
        }
        
        void update(final Object o) throws Exception {
        }
    }
    
    private class HeaderRow extends FilterRow
    {
        private String sign;
        private String signColor;
        private final int title;
        
        HeaderRow(final int title, final String signColor, final String sign) {
            super(title);
            this.title = title;
            this.signColor = signColor;
            this.sign = sign;
        }
        
        protected boolean getEnabled() {
            return false;
        }
        
        Spanned getText() {
            return Html.fromHtml(String.format("<big>%s <font color=\"%s\"><b>%s</b></font></big>", AddFilter.this.getString(this.title), this.signColor, this.sign));
        }
        
        protected String getValue() {
            return "";
        }
    }
    
    private class IgnoreHiddenRow extends FilterRow implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        IgnoreHiddenRow() {
            super(2131100039);
        }
        
        public boolean getBooleanValue() {
            return AddFilter.this.job.filter.ignoreHidden;
        }
        
        Drawable getImage() {
            return AddFilter.this.getResources().getDrawable(2130837526);
        }
        
        protected String getValue() {
            final AddFilter this$0 = AddFilter.this;
            int n;
            if (AddFilter.this.job.filter.ignoreHidden) {
                n = 2131099935;
            }
            else {
                n = 2131099936;
            }
            return this$0.getString(n);
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean ignoreHidden) {
            AddFilter.this.job.filter.ignoreHidden = ignoreHidden;
            AddFilter.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            AddFilter.this.job.filter.ignoreHidden = !AddFilter.this.job.filter.ignoreHidden;
            AddFilter.this.adapter.notifyDataSetChanged();
        }
    }
    
    private class IgnoreUnreadableRow extends FilterRow implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        IgnoreUnreadableRow() {
            super(2131100040);
        }
        
        public boolean getBooleanValue() {
            return AddFilter.this.job.filter.ignoreReadProtected;
        }
        
        Drawable getImage() {
            return AddFilter.this.getResources().getDrawable(2130837538);
        }
        
        protected String getValue() {
            final AddFilter this$0 = AddFilter.this;
            int n;
            if (AddFilter.this.job.filter.ignoreReadProtected) {
                n = 2131099935;
            }
            else {
                n = 2131099936;
            }
            return this$0.getString(n);
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean ignoreReadProtected) {
            AddFilter.this.job.filter.ignoreReadProtected = ignoreReadProtected;
            AddFilter.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            AddFilter.this.job.filter.ignoreReadProtected = !AddFilter.this.job.filter.ignoreReadProtected;
            AddFilter.this.adapter.notifyDataSetChanged();
        }
    }
    
    private class IncludeDateRow extends DateRow
    {
        protected int getModified() {
            return AddFilter.this.job.filter.includeModifiedDate;
        }
        
        protected void setModified(final int includeModifiedDate) {
            AddFilter.this.job.filter.includeModifiedDate = includeModifiedDate;
        }
    }
    
    private class IncludeExtensionsRow extends ExtensionsRow
    {
        IncludeExtensionsRow() {
            super(AddFilter.this.job.filter.includeExtensions);
        }
        
        void update(final Object o) throws Exception {
            super.update(o);
            AddFilter.this.job.filter.includeExtensions = this.extensions;
        }
    }
    
    private class IncludeLocalFilesRow extends LocalFilesRow
    {
        protected LinkedHashSet<String> getFilterFiles() {
            LinkedHashSet<String> includeLocalFiles;
            if (Utils.hasData(AddFilter.this.job.filter.includeLocalFiles)) {
                includeLocalFiles = AddFilter.this.job.filter.includeLocalFiles;
            }
            else {
                includeLocalFiles = null;
            }
            return includeLocalFiles;
        }
        
        protected void setFilterFiles(final LinkedHashSet<String> includeLocalFiles) {
            AddFilter.this.job.filter.includeLocalFiles = includeLocalFiles;
        }
    }
    
    private class IncludeRemoteFilesRow extends RemoteFilesRow
    {
        protected LinkedHashSet<String> getFilterFiles() {
            LinkedHashSet<String> includeRemoteFiles;
            if (Utils.hasData(AddFilter.this.job.filter.includeRemoteFiles)) {
                includeRemoteFiles = AddFilter.this.job.filter.includeRemoteFiles;
            }
            else {
                includeRemoteFiles = null;
            }
            return includeRemoteFiles;
        }
        
        protected void setFilterFiles(final LinkedHashSet<String> includeRemoteFiles) {
            AddFilter.this.job.filter.includeRemoteFiles = includeRemoteFiles;
        }
    }
    
    private abstract class LocalFilesRow extends FilesRow
    {
        LocalFilesRow() {
            super(2131100041);
        }
        
        protected boolean getEnabled() {
            return AddFilter.this.job.getPhoneDir() != null;
        }
        
        Drawable getImage() {
            return AddFilter.this.getResources().getDrawable(2130837535);
        }
        
        protected IFile getRootDir() throws IOException {
            return AddFilter.this.job.getLocalFolder((Context)AddFilter.this);
        }
        
        public void onClick(final View view) {
            if (AddFilter.this.job.getPhoneDir() == null) {
                Dialogs.showMessage((Context)AddFilter.this, AddFilter.this.getString(2131100043));
            }
            else {
                super.onClick(view);
            }
        }
    }
    
    private abstract class RemoteFilesRow extends FilesRow
    {
        RemoteFilesRow() {
            super(2131100042);
        }
        
        protected boolean getEnabled() {
            return AddFilter.this.job.getPcDir() != null;
        }
        
        Drawable getImage() {
            return AddFilter.this.getResources().getDrawable(2130837508);
        }
        
        protected IFile getRootDir() throws Exception {
            return AddFilter.this.job.getRemoteFolder((Context)AddFilter.this);
        }
        
        public void onClick(final View view) {
            Label_0047: {
                try {
                    Utils.checkWifi((Context)AddFilter.this);
                    if (AddFilter.this.job.getPcDir() == null) {
                        throw new IOException(AddFilter.this.getString(2131100044));
                    }
                    break Label_0047;
                }
                catch (Exception ex) {
                    Dialogs.showError((Context)AddFilter.this, ex);
                }
                return;
            }
            super.onClick(view);
        }
    }
}
