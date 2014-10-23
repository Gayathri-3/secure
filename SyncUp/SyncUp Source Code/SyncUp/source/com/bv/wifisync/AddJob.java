package com.bv.wifisync;

import android.text.*;
import android.content.*;
import java.io.*;
import android.app.*;
import android.os.*;
import android.view.*;
import android.graphics.drawable.*;
import android.widget.*;
import java.util.*;
import android.text.format.*;
import com.bv.sync.*;
import java.text.*;

public class AddJob extends BrowseActivity
{
    private PropertiesAdapter<JobRow> adapter;
    private Job job;
    private boolean moreMode;
    
    private void addRows() {
        this.adapter = new PropertiesAdapter<JobRow>((Context)this, new ArrayList<JobRow>(Arrays.asList(new PhoneFolderRow(), new PCFolderRow(), new ScheduleRow(), new DirectionRow(), new OverwriteRow(), new TrackDeletionsRow(), new FilterRow())));
        if (this.moreMode) {
            this.adapter.add((Object)new MediaScanRow());
        }
        if (this.job.getSyncType() == Job.SyncType.Pictures) {
            if (this.job.plugin == null || !(this.job.plugin instanceof ImagePlugin)) {
                this.job.plugin = (Job.Plugin)new ImagePlugin();
            }
            this.adapter.add((Object)new GroupImagesRow());
        }
        else if (this.job.getSyncType() == Job.SyncType.Music) {
            if (this.job.plugin == null || !(this.job.plugin instanceof Mp3Plugin)) {
                this.job.plugin = (Job.Plugin)new Mp3Plugin();
            }
            this.adapter.add((Object)new GroupMp3Row());
        }
        else {
            this.job.plugin = null;
        }
        this.setListAdapter((ListAdapter)this.adapter);
    }
    
    private void cancelAll() {
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            ((JobRow)this.adapter.getItem(i)).cancel();
        }
    }
    
    private boolean containsReadProtected(final String s) {
        int n = 1;
        if (s != null) {
            final String[] array = { "/", null, null };
            array[n] = "/sdcard";
            array[2] = Environment.getExternalStorageDirectory().getAbsolutePath();
            for (int length = array.length, i = 0; i < length; ++i) {
                if (s.equals(array[i])) {
                    return n != 0;
                }
            }
        }
        n = 0;
        return n != 0;
    }
    
    private void enableButtons() {
        this.findViewById(2131361795).setEnabled(this.job.getPcDir() != null && this.job.getPcDir().length() != 0 && this.job.getPhoneDir() != null);
        this.updateHelp();
        this.adapter.notifyDataSetChanged();
    }
    
    private boolean readProtectedExcluded() {
        final Job.Filter filter = this.job.filter;
        boolean ignoreReadProtected = false;
        if (filter != null) {
            ignoreReadProtected = this.job.filter.ignoreReadProtected;
            if (!ignoreReadProtected) {
                ignoreReadProtected = (this.job.filter.localFiles != null && this.job.filter.localFiles.contains(".android_secure"));
            }
        }
        return ignoreReadProtected;
    }
    
    private void rename() {
        final EditText editText = new EditText((Context)new ContextThemeWrapper((Context)this, 2131230722));
        editText.setInputType(8192);
        editText.setText((CharSequence)this.job.getName());
        editText.setHint((CharSequence)this.job.getDefaultName());
        final AlertDialog showInputDialog = Dialogs.showInputDialog((Context)this, this.getString(2131099965), this.getString(2131099882), editText, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
            public boolean onClick(final DialogInterface dialogInterface) throws Exception {
                String trim = editText.getText().toString().trim();
                if (trim.length() == 0) {
                    trim = null;
                }
                final Job.SyncType syncType = AddJob.this.job.getSyncType();
                AddJob.this.job.setName(trim);
                if (syncType != AddJob.this.job.getSyncType()) {
                    AddJob.this.addRows();
                }
                AddJob.this.setTitle((CharSequence)AddJob.this.job.getName());
                return true;
            }
        });
        showInputDialog.setIcon(this.job.getDrawable((Context)this));
        editText.addTextChangedListener((TextWatcher)new TextWatcher() {
            private final /* synthetic */ Button val$okButton = showInputDialog.getButton(-1);
            
            public void afterTextChanged(final Editable editable) {
                this.val$okButton.setEnabled(true);
            }
            
            public void beforeTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
            
            public void onTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
        });
    }
    
    private void showEnumBrowser(final int n, final int n2, final int n3, final String[] array, final int[][] array2, final int n4) {
        final Intent intent = new Intent((Context)this, (Class)EnumBrowser.class);
        intent.putExtra("RESULT", (Serializable)new EnumBrowser.OverlayedEnumeration(n, n2, array, array2, n4));
        this.startActivityForResult(intent, n3);
    }
    
    private void showMore() {
        this.moreMode = !this.moreMode;
        this.addRows();
        this.getListView().smoothScrollToPosition(-1 + this.adapter.getCount());
    }
    
    private void updateHelp() {
        final String phoneDir = this.job.getPhoneDir();
        final boolean b = phoneDir == null || this.job.getPcDir() == null;
        if (this.containsReadProtected(phoneDir) && !this.readProtectedExcluded()) {
            this.setHelp(2131099862);
        }
        else {
            int help;
            if (b) {
                help = 2131099860;
            }
            else {
                help = 2131099861;
            }
            this.setHelp(help);
        }
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n2 != -1) {
            return;
        }
        try {
            ((JobRow)this.adapter.getItem(n)).update(intent.getExtras().get("RESULT"));
            this.enableButtons();
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    public void onBackPressed() {
        super.onBackPressed();
        this.cancelAll();
    }
    
    public void onButtonClick(final View view) throws IOException {
        if (!this.job.getLocalFolder((Context)this).exists()) {
            throw new IOException(String.valueOf(this.getString(2131099813)) + ": " + this.job.getPhoneDir());
        }
        if (this.job.direction != CifsSync.Options.Direction.toRemote && !new File(this.job.getPhoneDir()).canWrite()) {
            throw new IOException(this.getString(2131099804));
        }
        if (Config.getIgnoreSymLinks((Context)this) && this.job.getLocalFolder((Context)this).isSymlink()) {
            throw new IOException(this.getString(2131099828));
        }
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.job);
        intent.putExtra("RESULT1", (Serializable)this.job.host);
        this.setResult(-1, intent);
        if (!Utils.isDebugBuild((Context)this)) {
            this.adapter.dispatchGoogleAnalytics((Activity)this);
        }
        this.cancelAll();
        this.finish();
    }
    
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.job = (Job)this.getData();
        this.job.host = (Host)this.getIntent().getSerializableExtra("RESULT1");
        this.addRows();
        String title = this.job.getName();
        if (title.length() == 0) {
            title = this.getString(2131099897);
        }
        this.setTitle((CharSequence)title);
        this.registerForContextMenu((View)this.getListView());
        this.enableButtons();
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131296264, menu);
        menu.findItem(2131361838).setVisible(this.job.getHistory().size() != 0);
        return true;
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        final int itemId = menuItem.getItemId();
        if (itemId == 2131361838) {
            this.job.showHistory((Context)this);
        }
        else if (itemId == 2131361839) {
            this.rename();
        }
        else if (itemId == 2131361840) {
            this.showMore();
        }
        return super.onOptionsItemSelected(menuItem);
    }
    
    public boolean onPrepareOptionsMenu(final Menu menu) {
        menu.findItem(2131361840).setEnabled(!this.moreMode);
        return super.onPrepareOptionsMenu(menu);
    }
    
    private class DirectionRow extends JobRow implements View$OnClickListener
    {
        private final String[] directions;
        
        DirectionRow() {
            super(AddJob.this.getString(2131099916), 2130837510);
            this.directions = AddJob.this.getResources().getStringArray(2131165184);
        }
        
        protected String getValue() {
            return this.directions[AddJob.this.job.direction.ordinal()];
        }
        
        public void onClick(final View view) {
            AddJob.this.showEnumBrowser(2131099916, 2131099865, AddJob.this.adapter.getPosition((Object)this), this.directions, new int[][] { { 2130837508, 2130837535, 2130837513 }, { 2130837508, 2130837513 }, { 2130837535, 2130837513 }, { 2130837508, 2130837513 }, { 2130837535, 2130837513 } }, AddJob.this.job.direction.ordinal());
        }
        
        void update(final Object o) {
            final CifsSync.Options.Direction direction = CifsSync.Options.Direction.values()[(int)o];
            if (direction != AddJob.this.job.direction) {
                AddJob.this.job.direction = direction;
            }
        }
    }
    
    private class FilterRow extends JobRow implements View$OnClickListener
    {
        FilterRow() {
            super(AddJob.this.getString(2131100036), 2130837523);
        }
        
        protected String getValue() {
            String s;
            if (AddJob.this.job.filter == null) {
                s = AddJob.this.getString(2131099925);
            }
            else {
                s = "";
                if (AddJob.this.job.filter.ignoreHidden) {
                    s = Utils.concat(s, AddJob.this.getString(2131100039), ", ");
                }
                if (AddJob.this.job.filter.ignoreReadProtected) {
                    s = Utils.concat(s, AddJob.this.getString(2131100040), ", ");
                }
                if (Utils.hasData(AddJob.this.job.filter.extensions) || Utils.hasData(AddJob.this.job.filter.includeExtensions)) {
                    s = Utils.concat(s, AddJob.this.getString(2131100065), ", ");
                }
                if (Utils.hasData(AddJob.this.job.filter.localFiles) || Utils.hasData(AddJob.this.job.filter.includeLocalFiles)) {
                    s = Utils.concat(s, AddJob.this.getString(2131100041), ", ");
                }
                if (Utils.hasData(AddJob.this.job.filter.remoteFiles) || Utils.hasData(AddJob.this.job.filter.includeRemoteFiles)) {
                    s = Utils.concat(s, AddJob.this.getString(2131100042), ", ");
                }
                if (AddJob.this.job.filter.modifiedDate != 0 || AddJob.this.job.filter.includeModifiedDate != 0) {
                    s = Utils.concat(s, AddJob.this.getString(2131100094), ", ");
                }
                if (s.length() == 0) {
                    s = AddJob.this.getString(2131099925);
                }
            }
            return s;
        }
        
        public void onClick(final View view) {
            final Intent intent = new Intent((Context)AddJob.this, (Class)AddFilter.class);
            if (AddJob.this.job.filter == null) {
                AddJob.this.job.filter = new Job.Filter();
            }
            intent.putExtra("RESULT", (Serializable)AddJob.this.job);
            intent.putExtra("RESULT1", (Serializable)AddJob.this.job.host);
            AddJob.this.startActivityForResult(intent, AddJob.this.adapter.getPosition((Object)this));
        }
        
        void update(final Object o) {
            AddJob.this.job.filter = ((Job)o).filter;
        }
    }
    
    private class GroupImagesRow extends JobRow implements View$OnClickListener
    {
        GroupImagesRow() {
            super(AddJob.this.getString(2131099914), 2130837536);
        }
        
        protected String getValue() {
            String s = "";
            if (AddJob.this.job.plugin instanceof ImagePlugin) {
                final ImagePlugin imagePlugin = (ImagePlugin)AddJob.this.job.plugin;
                if (imagePlugin.options.groupByYear) {
                    s = Utils.concat(s, AddJob.this.getString(2131100015), ", ");
                }
                if (imagePlugin.options.groupByMonth) {
                    s = Utils.concat(s, AddJob.this.getString(2131100016), ", ");
                }
                if (imagePlugin.options.groupByDay) {
                    s = Utils.concat(s, AddJob.this.getString(2131100017), ", ");
                }
                if (imagePlugin.options.groupByAddress) {
                    s = Utils.concat(s, AddJob.this.getString(2131100018), ", ");
                }
            }
            if (s.length() == 0) {
                s = AddJob.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            final Intent intent = new Intent((Context)AddJob.this, (Class)ImageGroup.class);
            intent.putExtra("RESULT", (Serializable)AddJob.this.job);
            AddJob.this.startActivityForResult(intent, AddJob.this.adapter.getPosition((Object)this));
        }
        
        void update(final Object o) throws IOException {
            AddJob.this.job.update((Context)AddJob.this, (Job)o);
        }
    }
    
    private class GroupMp3Row extends JobRow implements View$OnClickListener
    {
        GroupMp3Row() {
            super(AddJob.this.getString(2131099915), 2130837532);
        }
        
        protected String getValue() {
            String s = "";
            if (AddJob.this.job.plugin instanceof Mp3Plugin) {
                final Mp3Plugin mp3Plugin = (Mp3Plugin)AddJob.this.job.plugin;
                if (mp3Plugin.options.groupByArtist) {
                    s = Utils.concat(s, AddJob.this.getString(2131100022), ", ");
                }
                if (mp3Plugin.options.groupByAlbum) {
                    s = Utils.concat(s, AddJob.this.getString(2131100023), ", ");
                }
                if (mp3Plugin.options.renameSongs) {
                    s = Utils.concat(s, AddJob.this.getString(2131100024), ", ");
                }
            }
            if (s.length() == 0) {
                s = AddJob.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            final Intent intent = new Intent((Context)AddJob.this, (Class)Mp3Group.class);
            intent.putExtra("RESULT", (Serializable)AddJob.this.job);
            AddJob.this.startActivityForResult(intent, AddJob.this.adapter.getPosition((Object)this));
        }
        
        void update(final Object o) throws IOException {
            AddJob.this.job.update((Context)AddJob.this, (Job)o);
        }
    }
    
    private abstract class JobRow extends PropertyRow
    {
        private final int imageId;
        
        JobRow(final String s, final int imageId) {
            super((Context)AddJob.this, s);
            this.imageId = imageId;
        }
        
        void cancel() {
        }
        
        Drawable getImage() {
            Drawable drawable;
            if (this.imageId != 0) {
                drawable = AddJob.this.getResources().getDrawable(this.imageId);
            }
            else {
                drawable = null;
            }
            return drawable;
        }
        
        abstract void update(final Object p0) throws IOException;
    }
    
    private class MediaScanRow extends JobRow implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        MediaScanRow() {
            super(AddJob.this.getString(2131100085), 2130837543);
        }
        
        public boolean getBooleanValue() {
            return !AddJob.this.job.skipMediaScan;
        }
        
        protected String getValue() {
            String s;
            if (!AddJob.this.job.skipMediaScan) {
                s = AddJob.this.getString(2131099935);
            }
            else {
                s = AddJob.this.getString(2131099936);
            }
            return s;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean b) {
            AddJob.this.job.skipMediaScan = !b;
            AddJob.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            AddJob.this.job.skipMediaScan = !AddJob.this.job.skipMediaScan;
            AddJob.this.adapter.notifyDataSetChanged();
        }
        
        void update(final Object o) {
        }
    }
    
    private class OverwriteRow extends JobRow implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        OverwriteRow() {
            super(AddJob.this.getString(2131099912), -1);
        }
        
        public boolean getBooleanValue() {
            return AddJob.this.job.overwrite;
        }
        
        Drawable getImage() {
            return AddJob.this.getResources().getDrawable(2130837533);
        }
        
        protected String getValue() {
            String s;
            if (AddJob.this.job.overwrite) {
                s = AddJob.this.getString(2131099935);
            }
            else {
                s = AddJob.this.getString(2131099936);
            }
            return s;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean overwrite) {
            AddJob.this.job.overwrite = overwrite;
            AddJob.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            AddJob.this.job.overwrite = !AddJob.this.job.overwrite;
            AddJob.this.adapter.notifyDataSetChanged();
        }
        
        void update(final Object o) {
        }
    }
    
    private class PCFolderRow extends JobRow implements View$OnClickListener
    {
        private BrowsePC browsePC;
        final /* synthetic */ AddJob this$0;
        
        PCFolderRow() {
            super(AddJob.this.getString(2131099891), 2130837508);
        }
        
        static /* synthetic */ void access$0(final PCFolderRow pcFolderRow, final BrowsePC browsePC) {
            pcFolderRow.browsePC = browsePC;
        }
        
        void cancel() {
            if (this.browsePC != null) {
                this.browsePC.cancel(true);
            }
        }
        
        protected String getValue() {
            String s;
            if (AddJob.this.job.getPcDir() != null) {
                s = Utils.urlToPath(AddJob.this.job.getPcDir());
            }
            else {
                s = AddJob.this.job.getPcDir();
            }
            return s;
        }
        
        public void onClick(final View view) {
            try {
                Utils.checkWifi((Context)AddJob.this);
                if (this.browsePC == null) {
                    ((Utils.ProgressTask<Void, Progress, Result>)new BrowsePC(AddJob.this.adapter.getPosition((Object)this))).run((Void[])null);
                }
            }
            catch (IOException ex) {
                Dialogs.showError((Context)AddJob.this, ex);
            }
        }
        
        void update(final Object o) {
            AddJob.this.job.setPcDir(Utils.stripUrlPrefix((String)o));
        }
        
        private class BrowsePC extends Utils.ProgressTask<Void, Void, RemoteFile>
        {
            private final int position;
            
            BrowsePC(final int position) {
                super((Activity)PCFolderRow.this.this$0, "BrowsePC");
                this.position = position;
                PCFolderRow.access$0(PCFolderRow.this, this);
            }
            
            protected RemoteFile atBackground(final Void... array) throws Exception {
                return new RemoteFile(AddJob.this.job.host.domain, AddJob.this.job.host.user, AddJob.this.job.host.getPassword((Context)AddJob.this), "smb://" + AddJob.this.job.host.resolveName((Context)AddJob.this) + "/");
            }
            
            protected void onCancelled() {
                super.onCancelled();
                PCFolderRow.access$0(PCFolderRow.this, null);
            }
            
            protected void onPostExecute(final RemoteFile remoteFile) {
                PCFolderRow.access$0(PCFolderRow.this, null);
                super.onPostExecute(remoteFile);
                if (this.error == null && !this.isCancelled()) {
                    final DirBrowser.Options options = new DirBrowser.Options();
                    options.showSelection = true;
                    options.requestCode = this.position;
                    DirBrowser.selectDir((Activity)AddJob.this, remoteFile, options);
                }
            }
        }
    }
    
    private class PhoneFolderRow extends JobRow implements View$OnClickListener
    {
        static /* synthetic */ int[] $SWITCH_TABLE$com$bv$wifisync$Job$SyncType() {
            int[] $switch_TABLE$com$bv$wifisync$Job$SyncType = PhoneFolderRow.$SWITCH_TABLE$com$bv$wifisync$Job$SyncType;
            if ($switch_TABLE$com$bv$wifisync$Job$SyncType == null) {
                $switch_TABLE$com$bv$wifisync$Job$SyncType = new int[Job.SyncType.values().length];
                while (true) {
                    try {
                        $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.Downloads.ordinal()] = 7;
                        try {
                            $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.Folder.ordinal()] = 1;
                            try {
                                $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.Movies.ordinal()] = 4;
                                try {
                                    $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.Music.ordinal()] = 2;
                                    try {
                                        $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.Pictures.ordinal()] = 3;
                                        try {
                                            $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.Root.ordinal()] = 6;
                                            try {
                                                $switch_TABLE$com$bv$wifisync$Job$SyncType[Job.SyncType.SDCard.ordinal()] = 5;
                                                PhoneFolderRow.$SWITCH_TABLE$com$bv$wifisync$Job$SyncType = $switch_TABLE$com$bv$wifisync$Job$SyncType;
                                            }
                                            catch (NoSuchFieldError noSuchFieldError) {}
                                        }
                                        catch (NoSuchFieldError noSuchFieldError2) {}
                                    }
                                    catch (NoSuchFieldError noSuchFieldError3) {}
                                }
                                catch (NoSuchFieldError noSuchFieldError4) {}
                            }
                            catch (NoSuchFieldError noSuchFieldError5) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError6) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError7) {
                        continue;
                    }
                    break;
                }
            }
            return $switch_TABLE$com$bv$wifisync$Job$SyncType;
        }
        
        PhoneFolderRow() {
            super(AddJob.this.getString(2131099890), 2130837535);
        }
        
        private Job.Plugin newPlugin(final Job.SyncType syncType) {
            Job.Plugin plugin = null;
            switch ($SWITCH_TABLE$com$bv$wifisync$Job$SyncType()[syncType.ordinal()]) {
                default: {
                    plugin = null;
                    break;
                }
                case 2: {
                    plugin = new Mp3Plugin();
                    break;
                }
                case 3: {
                    plugin = new ImagePlugin();
                    break;
                }
            }
            return plugin;
        }
        
        private JobRow newPluginRow(final Job.SyncType syncType) {
            JobRow jobRow = null;
            switch ($SWITCH_TABLE$com$bv$wifisync$Job$SyncType()[syncType.ordinal()]) {
                default: {
                    jobRow = null;
                    break;
                }
                case 2: {
                    jobRow = new GroupMp3Row();
                    break;
                }
                case 3: {
                    jobRow = new GroupImagesRow();
                    break;
                }
            }
            return jobRow;
        }
        
        protected String getValue() {
            return AddJob.this.job.getPhoneDir();
        }
        
        public void onClick(final View view) {
            try {
                File externalStorageDirectory;
                if (Config.getShowDeviceRoot((Context)AddJob.this)) {
                    externalStorageDirectory = new File("/");
                }
                else {
                    externalStorageDirectory = Environment.getExternalStorageDirectory();
                }
                final LocalFileEx localFileEx = new LocalFileEx((Context)AddJob.this, externalStorageDirectory);
                final DirBrowser.Options options = new DirBrowser.Options();
                options.showSelection = true;
                options.requestCode = AddJob.this.adapter.getPosition((Object)this);
                DirBrowser.selectDir((Activity)AddJob.this, localFileEx, options);
                AddJob.this.adapter.notifyDataSetChanged();
            }
            catch (Exception ex) {
                Dialogs.showError((Context)AddJob.this, ex);
            }
        }
        
        void update(final Object o) {
            final Job.SyncType syncType = AddJob.this.job.getSyncType();
            final String phoneDir = AddJob.this.job.getPhoneDir();
            AddJob.this.job.setPhoneDir((String)o);
            if (!AddJob.this.job.getPhoneDir().equals(phoneDir)) {
                final Job.SyncType syncType2 = AddJob.this.job.getSyncType();
                if (syncType != syncType2) {
                    if (AddJob.this.job.plugin != null) {
                        AddJob.this.adapter.remove((Object)AddJob.this.adapter.getItem(-1 + AddJob.this.adapter.getCount()));
                    }
                    boolean b;
                    if (syncType2 != Job.SyncType.Music && syncType2 != Job.SyncType.Pictures) {
                        b = false;
                    }
                    else {
                        b = true;
                    }
                    final Job access$2 = AddJob.this.job;
                    Object plugin;
                    if (b) {
                        plugin = this.newPlugin(syncType2);
                    }
                    else {
                        plugin = null;
                    }
                    access$2.plugin = (Job.Plugin)plugin;
                    if (b) {
                        AddJob.this.adapter.add((Object)this.newPluginRow(syncType2));
                    }
                }
            }
        }
    }
    
    private class ScheduleRow extends JobRow implements View$OnClickListener
    {
        ScheduleRow() {
            super(AddJob.this.getString(2131099900), 2130837544);
        }
        
        private String formatRouters() {
            String concat = "";
            final Iterator<String> iterator = AddJob.this.job.schedule.routers.iterator();
            while (iterator.hasNext()) {
                concat = Utils.concat(concat, iterator.next(), ", ");
            }
            return String.valueOf(AddJob.this.getString(2131099904)) + " " + concat;
        }
        
        private String formatTime(final int n, final int n2) {
            final Calendar instance = Calendar.getInstance();
            instance.set(11, n);
            instance.set(12, n2);
            instance.set(13, 0);
            instance.set(14, 0);
            return DateUtils.formatDateTime((Context)AddJob.this, instance.getTimeInMillis(), 1);
        }
        
        private String formatValue() {
            String s = "";
            if (AddJob.this.job.schedule.getExactTime() != 0) {
                s = AddJob.this.getString(2131099902, new Object[] { this.formatTime(Schedule.getHours(AddJob.this.job.schedule.getExactTime()), Schedule.getMinutes(AddJob.this.job.schedule.getExactTime())) });
            }
            if (AddJob.this.job.schedule.getInterval() != 0) {
                s = Utils.concat(s, AddJob.this.getString(2131099901, new Object[] { Schedule.getHours(AddJob.this.job.schedule.getInterval()), Schedule.getMinutes(AddJob.this.job.schedule.getInterval()) }), "<br/>");
            }
            String concat = "";
            final String[] weekdays = new DateFormatSymbols().getWeekdays();
            for (int i = 0; i < AddJob.this.job.schedule.getWeekdays().length; ++i) {
                if (AddJob.this.job.schedule.getWeekdays()[i]) {
                    concat = Utils.concat(concat, weekdays[i + 1], ", ");
                }
            }
            String formatRouters = "";
            if (AddJob.this.job.isRouterDependant()) {
                formatRouters = this.formatRouters();
            }
            if ((concat.length() != 0 || formatRouters.length() != 0 || AddJob.this.job.isChargingDependant()) && s.length() == 0) {
                s = AddJob.this.getString(2131099905);
            }
            if (concat.length() != 0) {
                s = Utils.concat(s, AddJob.this.getString(2131099907, new Object[] { concat }), "<br/>");
            }
            if (formatRouters.length() != 0) {
                s = Utils.concat(s, this.formatRouters(), "<br/>");
            }
            if (AddJob.this.job.isChargingDependant()) {
                s = Utils.concat(s, AddJob.this.getString(2131100066), "<br/>");
            }
            if (AddJob.this.job.schedule.wakeupInterval != 0) {
                s = Utils.concat(s, String.valueOf(AddJob.this.getString(2131099908)) + " " + AddJob.this.getString(2131099909, new Object[] { Schedule.getMinutes(AddJob.this.job.schedule.wakeupInterval) + 60 * Schedule.getHours(AddJob.this.job.schedule.wakeupInterval) }), "<br/>");
            }
            return s;
        }
        
        protected String getValue() {
            String s;
            if (!AddJob.this.job.schedule.getEnabled()) {
                s = AddJob.this.getString(2131099925);
            }
            else {
                s = this.formatValue();
                if (s.length() == 0) {
                    s = AddJob.this.getString(2131099925);
                }
            }
            return s;
        }
        
        public void onClick(final View view) {
            final Intent intent = new Intent((Context)AddJob.this, (Class)AddSchedule.class);
            intent.putExtra("RESULT", (Serializable)AddJob.this.job.schedule);
            AddJob.this.startActivityForResult(intent, AddJob.this.adapter.getPosition((Object)this));
        }
        
        void update(final Object o) {
            AddJob.this.job.schedule = (SyncSchedule)o;
        }
    }
    
    private class TrackDeletionsRow extends JobRow implements View$OnClickListener
    {
        private final int[][] images;
        private final String[] values;
        
        TrackDeletionsRow() {
            super(AddJob.this.getString(2131099913), 2130837552);
            this.values = new String[] { AddJob.this.getString(2131099936), AddJob.this.getString(2131099935), AddJob.this.getString(2131100087) };
            this.images = new int[][] { { 2130837538 }, { 2130837552 }, { 2130837552, 2130837529 } };
        }
        
        protected String getValue() {
            String s;
            if (AddJob.this.job.trackDeletions) {
                if (AddJob.this.job.mirror) {
                    s = AddJob.this.getString(2131100087);
                }
                else {
                    s = AddJob.this.getString(2131099935);
                }
            }
            else {
                s = AddJob.this.getString(2131099936);
            }
            return s;
        }
        
        public void onClick(final View view) {
            int n;
            if (AddJob.this.job.trackDeletions) {
                if (AddJob.this.job.mirror) {
                    n = 2;
                }
                else {
                    n = 1;
                }
            }
            else {
                n = 0;
            }
            AddJob.this.showEnumBrowser(2131099913, 2131099886, AddJob.this.adapter.getPosition((Object)this), this.values, this.images, n);
        }
        
        void update(final Object o) {
            boolean b = true;
            final Integer n = (Integer)o;
            AddJob.this.job.trackDeletions = (n != 0 && b);
            final Job access$2 = AddJob.this.job;
            if (n != 2) {
                b = false;
            }
            access$2.mirror = b;
        }
    }
}
