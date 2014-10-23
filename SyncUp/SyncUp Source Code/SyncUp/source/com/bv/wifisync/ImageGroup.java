package com.bv.wifisync;

import java.io.*;
import android.os.*;
import java.util.*;
import android.graphics.drawable.*;
import android.widget.*;
import android.view.*;
import android.content.*;
import android.app.*;
import com.bv.sync.*;

public class ImageGroup extends BrowseActivity
{
    private PropertiesAdapter<PropertyRow> adapter;
    private boolean canceled;
    private Job job;
    private final int[] names;
    ImageScanner.Parser parser;
    private ImagePlugin plugin;
    private PropertyRow[] rows;
    ImageScanner scanner;
    
    public ImageGroup() {
        super();
        this.names = new int[] { 2131100015, 2131100016, 2131100017, 2131100018 };
        this.parser = new JpegParser((Context)this);
        this.scanner = new ImageScanner(this.parser);
    }
    
    static /* synthetic */ void access$8(final ImageGroup imageGroup, final boolean canceled) {
        imageGroup.canceled = canceled;
    }
    
    public void onBackPressed() {
        this.canceled = true;
        super.onBackPressed();
    }
    
    protected void onButtonClick(final View view) throws IOException {
        if (!this.plugin.options.groupByMonth) {
            this.plugin.options.numericMonth = false;
        }
        if (!this.plugin.options.groupByDay) {
            this.plugin.options.doubleDigitDay = false;
        }
        if (!this.plugin.options.groupByYear && !this.plugin.options.groupByMonth && !this.plugin.options.groupByDay) {
            this.plugin.options.groupVideos = false;
        }
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.job);
        this.setResult(-1, intent);
        this.finish();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setTitle(2131099914);
        this.job = (Job)this.getData();
        this.plugin = (ImagePlugin)this.job.plugin;
        this.rows = new PropertyRow[] { new GroupByRow(RowType.GroupByYear), new GroupByRow(RowType.GroupByMonth), new GroupByRow(RowType.GroupByDay), new GroupByRow(RowType.GroupByAddress), new OptionsRow(), new PreviewRow() };
        this.setListAdapter((ListAdapter)(this.adapter = new PropertiesAdapter<PropertyRow>((Context)this, Arrays.asList(this.rows))));
        this.setHelp(2131099873);
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        this.canceled = true;
    }
    
    private class GroupByRow extends PropertyRow implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        private final RowType type;
        
        static /* synthetic */ int[] $SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType() {
            int[] $switch_TABLE$com$bv$wifisync$ImageGroup$RowType = GroupByRow.$SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType;
            if ($switch_TABLE$com$bv$wifisync$ImageGroup$RowType == null) {
                $switch_TABLE$com$bv$wifisync$ImageGroup$RowType = new int[RowType.values().length];
                while (true) {
                    try {
                        $switch_TABLE$com$bv$wifisync$ImageGroup$RowType[RowType.GroupByAddress.ordinal()] = 4;
                        try {
                            $switch_TABLE$com$bv$wifisync$ImageGroup$RowType[RowType.GroupByDay.ordinal()] = 3;
                            try {
                                $switch_TABLE$com$bv$wifisync$ImageGroup$RowType[RowType.GroupByMonth.ordinal()] = 2;
                                try {
                                    $switch_TABLE$com$bv$wifisync$ImageGroup$RowType[RowType.GroupByYear.ordinal()] = 1;
                                    GroupByRow.$SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType = $switch_TABLE$com$bv$wifisync$ImageGroup$RowType;
                                }
                                catch (NoSuchFieldError noSuchFieldError) {}
                            }
                            catch (NoSuchFieldError noSuchFieldError2) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError3) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError4) {
                        continue;
                    }
                    break;
                }
            }
            return $switch_TABLE$com$bv$wifisync$ImageGroup$RowType;
        }
        
        GroupByRow(final RowType type) {
            super((Context)ImageGroup.this, ImageGroup.this.names[type.ordinal()]);
            this.type = type;
        }
        
        private boolean[] getValues() {
            final ImageScanner.Options options = ImageGroup.this.plugin.options;
            return new boolean[] { options.groupByYear, options.groupByMonth, options.groupByDay, options.groupByAddress };
        }
        
        public boolean getBooleanValue() {
            return this.getValues()[this.type.ordinal()];
        }
        
        Drawable getImage() {
            Drawable drawable;
            if (this.type == RowType.GroupByAddress) {
                drawable = ImageGroup.this.getResources().getDrawable(2130837504);
            }
            else {
                drawable = ImageGroup.this.getResources().getDrawable(2130837536);
            }
            return drawable;
        }
        
        protected String getValue() {
            String s;
            if (this.getValues()[this.type.ordinal()]) {
                s = ImageGroup.this.getString(2131099935);
            }
            else {
                s = ImageGroup.this.getString(2131099936);
            }
            return s;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean b) {
            switch ($SWITCH_TABLE$com$bv$wifisync$ImageGroup$RowType()[this.type.ordinal()]) {
                case 1: {
                    ImageGroup.this.plugin.options.groupByYear = b;
                    break;
                }
                case 2: {
                    ImageGroup.this.plugin.options.groupByMonth = b;
                    break;
                }
                case 3: {
                    ImageGroup.this.plugin.options.groupByDay = b;
                    break;
                }
                case 4: {
                    ImageGroup.this.plugin.options.groupByAddress = b;
                    break;
                }
            }
            ImageGroup.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            this.onCheckedChanged(null, !this.getBooleanValue());
            ImageGroup.this.adapter.notifyDataSetChanged();
        }
    }
    
    private class OptionsRow extends PropertyRow implements View$OnClickListener
    {
        OptionsRow() {
            super((Context)ImageGroup.this, 2131100086);
        }
        
        protected String getValue() {
            String s = "";
            if (ImageGroup.this.plugin.options.numericMonth) {
                s = Utils.concat(s, ImageGroup.this.getString(2131100019), ", ");
            }
            if (ImageGroup.this.plugin.options.doubleDigitDay) {
                s = Utils.concat(s, ImageGroup.this.getString(2131100020), ", ");
            }
            if (ImageGroup.this.plugin.options.groupVideos) {
                s = Utils.concat(s, ImageGroup.this.getString(2131100021), ", ");
            }
            if (s.length() == 0) {
                s = ImageGroup.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            final AlertDialog$Builder alertDialog$Builder = new AlertDialog$Builder((Context)new ContextThemeWrapper((Context)ImageGroup.this, 2131230722));
            final CharSequence[] array = { ImageGroup.this.getString(2131100019), ImageGroup.this.getString(2131100020), ImageGroup.this.getString(2131100021) };
            final boolean[] array2 = { ImageGroup.this.plugin.options.numericMonth, ImageGroup.this.plugin.options.doubleDigitDay, ImageGroup.this.plugin.options.groupVideos };
            alertDialog$Builder.setPositiveButton(17039370, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n) {
                    ImageGroup.this.plugin.options.numericMonth = array2[0];
                    ImageGroup.this.plugin.options.doubleDigitDay = array2[1];
                    ImageGroup.this.plugin.options.groupVideos = array2[2];
                    ImageGroup.this.adapter.notifyDataSetChanged();
                }
            });
            alertDialog$Builder.setMultiChoiceItems(array, array2, (DialogInterface$OnMultiChoiceClickListener)new DialogInterface$OnMultiChoiceClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n, final boolean b) {
                    array2[n] = b;
                }
            });
            alertDialog$Builder.setTitle(2131100086);
            alertDialog$Builder.create().show();
        }
    }
    
    private class PreviewRow extends PropertyRow implements View$OnClickListener
    {
        PreviewRow() {
            super((Context)ImageGroup.this, 2131100025);
        }
        
        Drawable getImage() {
            return ImageGroup.this.getResources().getDrawable(2130837541);
        }
        
        protected String getValue() {
            return ImageGroup.this.getString(2131100026);
        }
        
        public void onClick(final View view) {
            if (ImageGroup.this.plugin.isRunnable()) {
                ImageGroup.access$8(ImageGroup.this, false);
                ((Utils.ProgressTask<Void, Progress, Result>)new PreviewTask()).run(null);
                Dialogs.showMessage((Context)ImageGroup.this, ImageGroup.this.getString(2131100027));
            }
        }
    }
    
    private class PreviewTask extends Utils.ProgressTask<Void, ProgressInfo, IFile> implements ProgressNotification
    {
        PreviewTask() {
            super((Activity)ImageGroup.this, "Group Preview");
        }
        
        protected IFile atBackground(final Void... array) throws Exception {
            if (!ImageGroup.this.plugin.isRunnable()) {
                throw new IOException("No query");
            }
            final VirtualFile virtualFile = new VirtualFile(new LocalFile(ImageGroup.this.job.getPhoneDir()));
            ImageGroup.this.scanner.run(virtualFile, ImageGroup.this.plugin.options, this);
            return virtualFile;
        }
        
        protected void onPostExecute(final IFile file) {
            super.onPostExecute(file);
            ImageGroup.this.setProgressVisible(false);
            if (!ImageGroup.this.canceled && this.error == null) {
                final DirBrowser.Options options = new DirBrowser.Options();
                options.readOnly = true;
                options.showButton = false;
                options.showSelection = false;
                DirBrowser.selectDir((Activity)ImageGroup.this, file, options);
            }
        }
        
        protected void onPreExecute() {
            super.onPreExecute();
            ImageGroup.this.setProgressVisible(true);
        }
        
        protected void onProgressUpdate(final ProgressInfo... array) {
            final ProgressInfo progressInfo = array[0];
            ImageGroup.this.setProgress(progressInfo.percent, ImageGroup.this.getString(2131100013, new Object[] { progressInfo.percent, progressInfo.name }));
        }
        
        public boolean update(final ProgressNotification.ProgressAction progressAction, final int percent, final IFile file) {
            final ProgressInfo progressInfo = new ProgressInfo((ProgressInfo)null);
            progressInfo.percent = percent;
            progressInfo.name = file.getName();
            this.publishProgress((Object[])new ProgressInfo[] { progressInfo });
            final boolean access$7 = ImageGroup.this.canceled;
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
    
    private enum RowType
    {
        GroupByAddress("GroupByAddress", 3), 
        GroupByDay("GroupByDay", 2), 
        GroupByMonth("GroupByMonth", 1), 
        GroupByYear("GroupByYear", 0);
    }
}
