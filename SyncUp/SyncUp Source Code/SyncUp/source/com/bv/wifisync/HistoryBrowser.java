package com.bv.wifisync;

import android.text.*;
import android.content.*;
import java.io.*;
import android.os.*;
import android.widget.*;
import java.util.*;
import android.view.*;

public class HistoryBrowser extends BrowseActivity
{
    private PropertiesAdapter<HistoryRow> adapter;
    private Job job;
    
    private void copyText(final HistoryRow historyRow) {
        ((ClipboardManager)this.getSystemService("clipboard")).setText((CharSequence)Html.fromHtml(historyRow.getValue()));
    }
    
    private HistoryRow getHistoryRow(final Job.HistoryItem historyItem) {
        int n;
        if (historyItem.localFileCount == 0 && historyItem.remoteFilesCount == 0 && historyItem.deletedFilesCount == 0 && historyItem.error == null) {
            n = 1;
        }
        else {
            n = 0;
        }
        PropertyRow propertyRow;
        if (n != 0) {
            propertyRow = new HistoryRow(historyItem);
        }
        else {
            propertyRow = new ClickableHistoryRow(historyItem);
        }
        return (HistoryRow)propertyRow;
    }
    
    public void onButtonClick(final View view) {
    }
    
    public boolean onContextItemSelected(final MenuItem menuItem) {
        boolean onContextItemSelected = true;
        try {
            final HistoryRow historyRow = (HistoryRow)this.adapter.getItem(((AdapterView$AdapterContextMenuInfo)menuItem.getMenuInfo()).position);
            File file;
            if (menuItem.getItemId() == 2131361822) {
                file = historyRow.historyItem.getLocalFilesPath();
            }
            else if (menuItem.getItemId() == 2131361823) {
                file = historyRow.historyItem.getRemoteFilesPath();
            }
            else if (menuItem.getItemId() == 2131361824) {
                file = historyRow.historyItem.getDeletedFilesPath();
            }
            else {
                if (menuItem.getItemId() == 2131361825) {
                    this.copyText(historyRow);
                    return onContextItemSelected;
                }
                return super.onContextItemSelected(menuItem);
            }
            final Intent intent = new Intent((Context)this, (Class)FilesView.class);
            intent.putExtra("RESULT", (Serializable)file);
            this.startActivity(intent);
        }
        catch (Throwable t) {
            Dialogs.showError((Context)this, t);
        }
        return onContextItemSelected;
        onContextItemSelected = super.onContextItemSelected(menuItem);
        return onContextItemSelected;
    }
    
    protected void onCreate(final Bundle bundle) {
        this.requestWindowFeature(6);
        super.onCreate(bundle);
        this.job = (Job)this.getData();
        this.setTitle(2131099942);
        this.setHelp(2131099864);
        this.buttonOk.setVisibility(8);
        final ArrayList<HistoryRow> list = new ArrayList<HistoryRow>();
        final List<Job.HistoryItem> history = this.job.getHistory();
        final ListIterator<Job.HistoryItem> listIterator = history.listIterator(history.size());
        while (listIterator.hasPrevious()) {
            list.add(this.getHistoryRow(listIterator.previous()));
        }
        this.setListAdapter((ListAdapter)(this.adapter = new PropertiesAdapter<HistoryRow>(this, list) {
            public View getView(final int n, final View view, final ViewGroup viewGroup) {
                final View view2 = super.getView(n, view, viewGroup);
                ((ImageView)view2.findViewById(2131361796)).setVisibility(8);
                return view2;
            }
            
            public boolean isEnabled(final int n) {
                return this.getItem(n) instanceof ClickableHistoryRow;
            }
        }));
        this.registerForContextMenu((View)this.getListView());
        this.getListView().setOnCreateContextMenuListener((View$OnCreateContextMenuListener)this);
        this.getListView().setDividerHeight(5);
    }
    
    public void onCreateContextMenu(final ContextMenu contextMenu, final View view, final ContextMenu$ContextMenuInfo contextMenu$ContextMenuInfo) {
        super.onCreateContextMenu(contextMenu, view, contextMenu$ContextMenuInfo);
        final HistoryRow historyRow = (HistoryRow)this.adapter.getItem(((AdapterView$AdapterContextMenuInfo)contextMenu$ContextMenuInfo).position);
        final Job.HistoryItem access$0 = historyRow.historyItem;
        final boolean enabled = access$0.localFileCount > 0;
        final boolean enabled2 = access$0.remoteFilesCount > 0;
        final boolean enabled3 = access$0.deletedFilesCount > 0;
        boolean b;
        if (access$0.error != null) {
            b = true;
        }
        else {
            b = false;
        }
        int n;
        if (!enabled && !enabled2 && !enabled3 && !b) {
            n = 0;
        }
        else {
            n = 1;
        }
        if (n != 0) {
            this.getMenuInflater().inflate(2131296259, (Menu)contextMenu);
            contextMenu.setHeaderTitle((CharSequence)Html.fromHtml(historyRow.getName()));
            contextMenu.setHeaderIcon(historyRow.getImage());
            contextMenu.findItem(2131361822).setEnabled(enabled);
            contextMenu.findItem(2131361823).setEnabled(enabled2);
            contextMenu.findItem(2131361824).setEnabled(enabled3);
        }
    }
    
    private class ClickableHistoryRow extends HistoryRow implements View$OnClickListener
    {
        ClickableHistoryRow(final Job.HistoryItem historyItem) {
            super(historyItem);
        }
        
        public void onClick(final View view) {
            HistoryBrowser.this.openContextMenu(view);
        }
    }
    
    private class HistoryRow extends PropertyRow
    {
        private final Job.HistoryItem historyItem;
        
        HistoryRow(final Job.HistoryItem historyItem) {
            super((Context)HistoryBrowser.this, HistoryBrowser.this.getString(2131100002));
            this.historyItem = historyItem;
        }
        
        protected String getValue() {
            String s;
            if (this.historyItem.description != null) {
                s = this.historyItem.toString();
            }
            else {
                s = HistoryBrowser.this.getString(2131100003, new Object[] { Utils.toDate((Context)HistoryBrowser.this, this.historyItem.time) });
                if (this.historyItem.endTime != 0L) {
                    s = String.valueOf(s) + HistoryBrowser.this.getString(2131100004, new Object[] { Utils.toDate((Context)HistoryBrowser.this, this.historyItem.endTime) });
                }
                if (this.historyItem.localFileCount != 0) {
                    s = String.valueOf(s) + HistoryBrowser.this.getString(2131100005, new Object[] { this.historyItem.localFileCount });
                }
                if (this.historyItem.remoteFilesCount != 0) {
                    s = String.valueOf(s) + HistoryBrowser.this.getString(2131100006, new Object[] { this.historyItem.remoteFilesCount });
                }
                if (this.historyItem.deletedFilesCount != 0) {
                    s = String.valueOf(s) + HistoryBrowser.this.getString(2131100007, new Object[] { this.historyItem.deletedFilesCount });
                }
                if (this.historyItem.reconnects != 0L) {
                    s = String.valueOf(s) + "<br/>" + HistoryBrowser.this.getString(2131100088) + ": " + this.historyItem.reconnects;
                }
                if (this.historyItem.transferBytes != 0L) {
                    s = String.valueOf(s) + "<br/>" + HistoryBrowser.this.getString(2131100089) + ": " + Utils.humanReadableSize(this.historyItem.transferBytes);
                }
                if (this.historyItem.transferTime != 0L) {
                    s = String.valueOf(s) + "<br/>" + HistoryBrowser.this.getString(2131100090) + ": " + Utils.humanReadableSize(1000L * this.historyItem.transferBytes / this.historyItem.transferTime);
                }
                if (this.historyItem.isError) {
                    s = String.valueOf(s) + HistoryBrowser.this.getString(2131100008, new Object[] { this.historyItem.error });
                }
            }
            return s;
        }
    }
}
