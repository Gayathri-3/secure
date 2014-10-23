package com.bv.wifisync;

import java.io.*;
import android.os.*;
import java.util.*;
import android.content.*;
import android.view.*;
import android.graphics.drawable.*;
import android.widget.*;
import android.app.*;
import com.bv.sync.*;

public class Mp3Group extends BrowseActivity
{
    private PropertiesAdapter<PropertyRow> adapter;
    private boolean canceled;
    private Job job;
    private final int[] names;
    private Mp3Plugin plugin;
    private PropertyRow[] rows;
    Mp3Scanner scanner;
    
    public Mp3Group() {
        super();
        this.names = new int[] { 2131100022, 2131100023, 2131100024 };
        this.scanner = new Mp3Scanner();
    }
    
    static /* synthetic */ void access$8(final Mp3Group mp3Group, final boolean canceled) {
        mp3Group.canceled = canceled;
    }
    
    public void onBackPressed() {
        this.canceled = true;
        super.onBackPressed();
    }
    
    protected void onButtonClick(final View view) throws IOException {
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.job);
        this.setResult(-1, intent);
        this.finish();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setTitle(2131099915);
        this.job = (Job)this.getData();
        this.plugin = (Mp3Plugin)this.job.plugin;
        this.rows = new PropertyRow[] { new GroupByRow(RowType.GroupByArtist), new GroupByRow(RowType.GroupByAlbum), new RenameSongRow(), new PreviewRow() };
        this.setListAdapter((ListAdapter)(this.adapter = new PropertiesAdapter<PropertyRow>((Context)this, Arrays.asList(this.rows))));
        this.setHelp(2131099874);
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        this.canceled = true;
    }
    
    private class GroupByRow extends PropertyRow implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        private final RowType type;
        
        static /* synthetic */ int[] $SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType() {
            int[] $switch_TABLE$com$bv$wifisync$Mp3Group$RowType = GroupByRow.$SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType;
            if ($switch_TABLE$com$bv$wifisync$Mp3Group$RowType == null) {
                $switch_TABLE$com$bv$wifisync$Mp3Group$RowType = new int[RowType.values().length];
                while (true) {
                    try {
                        $switch_TABLE$com$bv$wifisync$Mp3Group$RowType[RowType.GroupByAlbum.ordinal()] = 2;
                        try {
                            $switch_TABLE$com$bv$wifisync$Mp3Group$RowType[RowType.GroupByArtist.ordinal()] = 1;
                            try {
                                $switch_TABLE$com$bv$wifisync$Mp3Group$RowType[RowType.Rename.ordinal()] = 3;
                                GroupByRow.$SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType = $switch_TABLE$com$bv$wifisync$Mp3Group$RowType;
                            }
                            catch (NoSuchFieldError noSuchFieldError) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError2) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError3) {
                        continue;
                    }
                    break;
                }
            }
            return $switch_TABLE$com$bv$wifisync$Mp3Group$RowType;
        }
        
        GroupByRow(final RowType type) {
            super((Context)Mp3Group.this, Mp3Group.this.names[type.ordinal()]);
            this.type = type;
        }
        
        private boolean[] getValues() {
            final Mp3Scanner.Options options = Mp3Group.this.plugin.options;
            return new boolean[] { options.groupByArtist, options.groupByAlbum, options.renameSongs };
        }
        
        public boolean getBooleanValue() {
            return this.getValues()[this.type.ordinal()];
        }
        
        Drawable getImage() {
            return Mp3Group.this.getResources().getDrawable(2130837532);
        }
        
        protected String getValue() {
            String s;
            if (this.getValues()[this.type.ordinal()]) {
                s = Mp3Group.this.getString(2131099935);
            }
            else {
                s = Mp3Group.this.getString(2131099936);
            }
            return s;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean renameSongs) {
            switch ($SWITCH_TABLE$com$bv$wifisync$Mp3Group$RowType()[this.type.ordinal()]) {
                case 1: {
                    Mp3Group.this.plugin.options.groupByArtist = renameSongs;
                    break;
                }
                case 2: {
                    Mp3Group.this.plugin.options.groupByAlbum = renameSongs;
                    break;
                }
                case 3: {
                    Mp3Group.this.plugin.options.renameSongs = renameSongs;
                    break;
                }
            }
            Mp3Group.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            this.onCheckedChanged(null, !this.getBooleanValue());
            Mp3Group.this.adapter.notifyDataSetChanged();
        }
    }
    
    private class PreviewRow extends PropertyRow implements View$OnClickListener
    {
        PreviewRow() {
            super((Context)Mp3Group.this, 2131100025);
        }
        
        Drawable getImage() {
            return Mp3Group.this.getResources().getDrawable(2130837541);
        }
        
        protected String getValue() {
            return Mp3Group.this.getString(2131100026);
        }
        
        public void onClick(final View view) {
            if (Mp3Group.this.plugin.isRunnable()) {
                Mp3Group.access$8(Mp3Group.this, false);
                ((Utils.ProgressTask<Void, Progress, Result>)new PreviewTask()).run(null);
                Dialogs.showMessage((Context)Mp3Group.this, Mp3Group.this.getString(2131100027));
            }
        }
    }
    
    private class PreviewTask extends Utils.ProgressTask<Void, ProgressInfo, IFile> implements ProgressNotification
    {
        PreviewTask() {
            super((Activity)Mp3Group.this, "Mp3 Group Preview");
        }
        
        protected IFile atBackground(final Void... array) throws Exception {
            if (!Mp3Group.this.plugin.isRunnable()) {
                throw new IOException("No query");
            }
            final VirtualFile virtualFile = new VirtualFile(new LocalFile(Mp3Group.this.job.getPhoneDir()));
            Mp3Group.this.scanner.run(virtualFile, Mp3Group.this.plugin.options, this);
            return virtualFile;
        }
        
        protected void onPostExecute(final IFile file) {
            super.onPostExecute(file);
            Mp3Group.this.setProgressVisible(false);
            if (!Mp3Group.this.canceled && this.error == null) {
                final DirBrowser.Options options = new DirBrowser.Options();
                options.readOnly = true;
                options.showButton = false;
                options.showSelection = false;
                DirBrowser.selectDir((Activity)Mp3Group.this, file, options);
            }
        }
        
        protected void onPreExecute() {
            super.onPreExecute();
            Mp3Group.this.setProgressVisible(true);
        }
        
        protected void onProgressUpdate(final ProgressInfo... array) {
            final ProgressInfo progressInfo = array[0];
            Mp3Group.this.setProgress(progressInfo.percent, Mp3Group.this.getString(2131100013, new Object[] { progressInfo.percent, progressInfo.name }));
        }
        
        public boolean update(final ProgressNotification.ProgressAction progressAction, final int percent, final IFile file) {
            final ProgressInfo progressInfo = new ProgressInfo((ProgressInfo)null);
            progressInfo.percent = percent;
            progressInfo.name = file.getName();
            this.publishProgress((Object[])new ProgressInfo[] { progressInfo });
            final boolean access$7 = Mp3Group.this.canceled;
            boolean b = false;
            if (!access$7) {
                b = true;
            }
            return b;
        }
    }
    
    private class ProgressInfo
    {
        String name;
        int percent;
    }
    
    private class RenameSongRow extends GroupByRow
    {
        RenameSongRow() {
            super(RowType.Rename);
        }
        
        Drawable getImage() {
            return Mp3Group.this.getResources().getDrawable(2130837525);
        }
    }
    
    private enum RowType
    {
        GroupByAlbum("GroupByAlbum", 1), 
        GroupByArtist("GroupByArtist", 0), 
        Rename("Rename", 2);
    }
}
