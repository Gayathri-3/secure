package com.bv.wifisync;

import android.graphics.drawable.*;
import android.annotation.*;
import android.content.*;
import android.app.*;
import android.net.*;
import android.os.*;
import android.view.*;
import android.text.*;
import android.graphics.*;
import java.util.concurrent.*;
import java.util.*;
import android.widget.*;
import com.bv.sync.*;
import jcifs.util.transport.*;
import java.io.*;

public class DirBrowser extends BrowseActivity implements View$OnLongClickListener, Clipboard.CutSubscriber
{
    protected final int VIEW_FILE_REQUEST_CODE;
    protected DirAdapter adapter;
    private IFile dir;
    private DirFetcher dirFetcher;
    private FileManagementTask fileManagementTask;
    protected Throwable lastError;
    private Menu menu;
    protected Options options;
    private boolean selection;
    private StreamingThread streamingThread;
    
    public DirBrowser() {
        super();
        this.VIEW_FILE_REQUEST_CODE = 65536;
    }
    
    static /* synthetic */ void access$4(final DirBrowser dirBrowser, final IFile dir) {
        dirBrowser.dir = dir;
    }
    
    static /* synthetic */ void access$5(final DirBrowser dirBrowser, final FileManagementTask fileManagementTask) {
        dirBrowser.fileManagementTask = fileManagementTask;
    }
    
    static /* synthetic */ void access$9(final DirBrowser dirBrowser, final DirFetcher dirFetcher) {
        dirBrowser.dirFetcher = dirFetcher;
    }
    
    private void copySelected() {
        this.copySelected(this.getSelected());
    }
    
    private void copySelected(final IFile[] array) {
        Clipboard.copy(array);
        Dialogs.showMessage((Context)this, this.getString(2131100060, new Object[] { array.length }));
    }
    
    private void createNewFolder() {
        final EditText editText = new EditText((Context)new ContextThemeWrapper((Context)this, 2131230722));
        editText.setFilters(new InputFilter[] { new Utils.FileNameInputFilter() });
        editText.setInputType(8192);
        Dialogs.showInputDialog((Context)this, this.getString(2131099920), this.getString(2131099923), editText, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
            public boolean onClick(final DialogInterface dialogInterface) throws IOException {
                ((Utils.ProgressTask<String, Progress, Result>)new Utils.ProgressTask<String, Void, Void>(DirBrowser.this, "Mkdir") {
                    protected Void atBackground(final String... array) throws Exception {
                        DirBrowser.this.dir.createFile(array[0]).mkdir();
                        return null;
                    }
                    
                    protected void onPostExecute(final Void void1) {
                        super.onPostExecute(void1);
                        if (this.error == null) {
                            DirBrowser.this.adapter.refresh();
                        }
                    }
                }).run(Utils.trimText((TextView)editText));
                return true;
            }
        }).setIcon(2130837530);
    }
    
    private void cutSelected() {
        this.cutSelected(this.getSelected());
    }
    
    private void cutSelected(final IFile[] array) {
        Clipboard.cut(array, (Clipboard.CutSubscriber)this);
        Dialogs.showMessage((Context)this, this.getString(2131100061, new Object[] { array.length }));
    }
    
    private void deleteSelected() {
        Dialogs.showConfirm((Context)this, this.getString(2131099927), this.getString(2131099929), null, (Dialogs.OnConfirmListener)new Dialogs.OnConfirmListener() {
            public void onConfirm() throws Exception {
                final List access$14 = DirBrowser.this.getSelectedInfos();
                final FileInfo[] array = new FileInfo[access$14.size()];
                DirBrowser.access$5(DirBrowser.this, new FileManagementTask(Type.Delete));
                ((Utils.ProgressTask<FileInfo, Progress, Result>)DirBrowser.this.fileManagementTask).run((FileInfo[])access$14.toArray(array));
                Dialogs.showMessage((Context)DirBrowser.this, DirBrowser.this.getString(2131099917));
            }
        });
    }
    
    private void deleteSelectedItem(final FileInfo fileInfo) {
        Dialogs.showConfirm((Context)this, this.getString(2131099927), this.getString(2131099930, new Object[] { fileInfo.file.getName() }), null, (Dialogs.OnConfirmListener)new Dialogs.OnConfirmListener() {
            public void onConfirm() throws Exception {
                DirBrowser.access$5(DirBrowser.this, new FileManagementTask(Type.Delete));
                ((Utils.ProgressTask<FileInfo, Progress, Result>)DirBrowser.this.fileManagementTask).run(fileInfo);
                Dialogs.showMessage((Context)DirBrowser.this, DirBrowser.this.getString(2131099917));
            }
        });
    }
    
    private int find(final char c, final Editable editable) {
        for (int i = -1 + editable.length(); i >= 0; --i) {
            if (editable.charAt(i) == c) {
                return i;
            }
        }
        return -1;
    }
    
    private int getDirectoryImage(final IFile file) {
        int n = 2130837536;
        if (!(file instanceof LocalFile)) {
            return 2130837530;
        }
        final String absolutePath = file.getAbsolutePath();
        final String absolutePath2 = Environment.getExternalStorageDirectory().getAbsolutePath();
        if (!absolutePath.equals(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).getAbsolutePath())) {
            if (absolutePath.equals(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES).getAbsolutePath())) {
                n = 2130837554;
            }
            else if (absolutePath.equals(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC).getAbsolutePath())) {
                n = 2130837532;
            }
            else if (!absolutePath.equals(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).getAbsolutePath())) {
                if (absolutePath.equals(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_RINGTONES).getAbsolutePath())) {
                    n = 2130837532;
                }
                else if (absolutePath.equals(absolutePath2) || "/sdcard".equals(absolutePath)) {
                    n = 2130837545;
                }
                else if (absolutePath.equals(String.valueOf(absolutePath2) + "/Videos")) {
                    n = 2130837554;
                }
                else {
                    if (!absolutePath.equals(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getAbsolutePath())) {
                        return 2130837530;
                    }
                    n = 2130837516;
                }
            }
        }
        return n;
        n = 2130837530;
        return n;
    }
    
    private Drawable getItemImage(final IFile file, final boolean b) {
        final String absolutePath = file.getAbsolutePath();
        int directoryImage;
        if (Utils.isDrive(absolutePath)) {
            directoryImage = 2130837517;
        }
        else if (Utils.isShare(absolutePath)) {
            directoryImage = 2130837547;
        }
        else {
            if (!b) {
                return Utils.getFileImage((Context)this, new File(absolutePath));
            }
            directoryImage = this.getDirectoryImage(file);
        }
        return this.getResources().getDrawable(directoryImage);
    }
    
    private IFile[] getSelected() {
        final List<FileInfo> selectedInfos = this.getSelectedInfos();
        final IFile[] array = new IFile[selectedInfos.size()];
        int n = 0;
        for (final FileInfo fileInfo : selectedInfos) {
            final int n2 = n + 1;
            array[n] = fileInfo.file;
            n = n2;
        }
        return array;
    }
    
    private List<FileInfo> getSelectedInfos() {
        final LinkedList<FileInfo> list = new LinkedList<FileInfo>();
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            if (((FileInfo)this.adapter.getItem(i)).selected) {
                list.add((FileInfo)this.adapter.getItem(i));
            }
        }
        return list;
    }
    
    private void gotoDir() {
        final EditText editText = new EditText((Context)new ContextThemeWrapper((Context)this, 2131230722));
        editText.setInputType(524288);
        Dialogs.showInputDialog((Context)this, this.getString(2131099922), this.getString(2131099885), editText, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
            public boolean onClick(final DialogInterface dialogInterface) throws Exception {
                Utils.checkWifi((Context)DirBrowser.this);
                String s = Utils.trimText((TextView)editText);
                if (!s.endsWith("/")) {
                    s = String.valueOf(s) + "/";
                }
                ((Utils.ProgressTask<String, Progress, Result>)new Utils.ProgressTask<String, Void, IFile>(DirBrowser.this, "Goto") {
                    protected IFile atBackground(final String... array) throws Exception {
                        return DirBrowser.this.dir.openFile(array[0]);
                    }
                    
                    protected void onPostExecute(final IFile file) {
                        super.onPostExecute(file);
                        if (this.error == null) {
                            dialogInterface.dismiss();
                            if (!this.isCancelled()) {
                                DirBrowser.selectDir((Activity)DirBrowser.this, file, DirBrowser.this.options);
                            }
                        }
                    }
                }).run(s);
                return false;
            }
        });
    }
    
    protected static void internalSelectDir(final Activity activity, final IFile file, final Options options, final Intent intent) {
        intent.putExtra("RESULT", (Serializable)file);
        intent.putExtra("options", (Serializable)options);
        if (options.requestCode == null) {
            activity.startActivity(intent);
        }
        else {
            activity.startActivityForResult(intent, (int)options.requestCode);
        }
    }
    
    private void paste() {
        Type type;
        if (Clipboard.getDataType() == Clipboard.CopyType.Cut) {
            type = Type.Move;
        }
        else {
            type = Type.Copy;
        }
        ((Utils.ProgressTask<FileInfo, Progress, Result>)(this.fileManagementTask = new FileManagementTask(type))).run(new FileInfo(this.dir, true, 0L, 0L));
        Dialogs.showMessage((Context)this, this.getString(2131099917));
    }
    
    private void renameSelectedItem(final FileInfo fileInfo) {
        final EditText selection = new EditText((Context)new ContextThemeWrapper((Context)this, 2131230722));
        selection.setFilters(new InputFilter[] { new Utils.FileNameInputFilter() });
        String text = fileInfo.file.getName();
        if (text.endsWith("/")) {
            text = text.substring(0, -1 + text.length());
        }
        selection.setText((CharSequence)text);
        Dialogs.showInputDialog((Context)this, this.getString(2131099966), this.getString(2131099967, new Object[] { text }), selection, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
            public boolean onClick(final DialogInterface dialogInterface) throws IOException {
                ((Utils.ProgressTask<String, Progress, Result>)new Utils.ProgressTask<String, Void, Void>(DirBrowser.this, "Rename") {
                    protected Void atBackground(final String... array) throws Exception {
                        fileInfo.file.renameTo(fileInfo.file.getParent().createFile(array[0]));
                        return null;
                    }
                    
                    protected void onPostExecute(final Void void1) {
                        super.onPostExecute(void1);
                        if (this.error == null) {
                            if (!this.isCancelled()) {
                                DirBrowser.this.adapter.refresh();
                            }
                        }
                        else {
                            Dialogs.showError((Context)DirBrowser.this, this.error);
                        }
                    }
                }).run(Utils.trimText((TextView)selection));
                return true;
            }
        });
        this.setSelection(selection);
    }
    
    private void returnDir(final String s) {
        final Intent intent = new Intent();
        intent.putExtra("RESULT", s);
        this.setResult(-1, intent);
        this.finish();
    }
    
    private void selectAll() {
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            ((FileInfo)this.adapter.getItem(i)).selected = true;
        }
        this.selection = true;
        this.adapter.notifyDataSetChanged();
    }
    
    public static void selectDir(final Activity activity, final IFile file, final Options options) {
        internalSelectDir(activity, file, options, new Intent((Context)activity, (Class)DirBrowser.class));
    }
    
    private void setSelection(final EditText editText) {
        final Editable text = editText.getText();
        if (text != null) {
            final int find = this.find('.', text);
            if (find != -1) {
                editText.setSelection(find, find);
            }
        }
    }
    
    private void setTitle() {
        String title;
        if (this.dir instanceof RemoteFile) {
            title = Utils.urlToPath(this.dir.getAbsolutePath());
        }
        else {
            title = this.dir.getAbsolutePath();
        }
        this.setTitle((CharSequence)title);
    }
    
    @TargetApi(11)
    private void setupActionBar(final ActionBarAdapter actionBarAdapter) {
        this.getActionBar().setDisplayShowTitleEnabled(false);
        this.getActionBar().setNavigationMode(1);
        this.getActionBar().setListNavigationCallbacks((SpinnerAdapter)actionBarAdapter, (ActionBar$OnNavigationListener)new ActionBar$OnNavigationListener() {
            public boolean onNavigationItemSelected(final int n, final long n2) {
                actionBarAdapter.onClick(n);
                return true;
            }
        });
        if (actionBarAdapter.getCount() != 0) {
            this.getActionBar().setSelectedNavigationItem(-1 + actionBarAdapter.getCount());
        }
    }
    
    private void setupListView() {
        this.setListAdapter((ListAdapter)(this.adapter = this.createAdapter()));
        final ListView listView = this.getListView();
        this.registerForContextMenu((View)listView);
        listView.setOnLongClickListener((View$OnLongClickListener)this);
    }
    
    private void setupSpinner(final ActionBarAdapter actionBarAdapter) {
        final TextView textView = (TextView)this.findViewById(16908310);
        if (textView != null) {
            textView.setCompoundDrawablePadding(2);
            textView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 17301506, 0);
            textView.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
                public void onClick(final View view) {
                    final AlertDialog$Builder alertDialog$Builder = new AlertDialog$Builder((Context)DirBrowser.this);
                    alertDialog$Builder.setAdapter((ListAdapter)actionBarAdapter, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                        public void onClick(final DialogInterface dialogInterface, final int n) {
                            actionBarAdapter.onClick(n);
                        }
                    });
                    alertDialog$Builder.setTitle(2131100069);
                    final AlertDialog create = alertDialog$Builder.create();
                    create.getWindow().setGravity(51);
                    create.show();
                }
            });
        }
    }
    
    private void showSelection() {
        if (!(this.selection = !this.selection)) {
            for (int i = 0; i < this.adapter.getCount(); ++i) {
                ((FileInfo)this.adapter.getItem(i)).selected = false;
            }
        }
        this.adapter.notifyDataSetChanged();
        Config.setShowEditMode((Context)this, this.selection);
    }
    
    private File startStreaming(final IFile file) throws IOException {
        final File file2 = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), file.getName());
        if (this.streamingThread != null) {
            this.streamingThread.cancel();
        }
        (this.streamingThread = new StreamingThread(file, file2, (StreamingThread)null)).start();
        return file2;
    }
    
    private void viewSelectedItem(final FileInfo fileInfo) {
        try {
            final Intent fileTypeIntent = Utils.getFileTypeIntent(new File(fileInfo.file.getAbsolutePath()));
            if (!this.getPackageManager().queryIntentActivities(fileTypeIntent, 0).isEmpty()) {
                if (fileInfo.file instanceof RemoteFile) {
                    final File startStreaming = this.startStreaming(fileInfo.file);
                    fileTypeIntent.setDataAndType(Uri.fromFile(startStreaming), fileTypeIntent.getType());
                    Thread.sleep(500L);
                    if (startStreaming.length() > 0L) {
                        this.startActivityForResult(fileTypeIntent, 65536);
                    }
                }
                else {
                    this.startActivity(fileTypeIntent);
                }
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    protected DirAdapter createAdapter() {
        return new DirAdapter(new ArrayList<FileInfo>());
    }
    
    protected int getDefaultHelp() {
        int n;
        if (this.options.showButton) {
            if (this.dir instanceof LocalFile) {
                n = 2131099868;
            }
            else {
                n = 2131099869;
            }
        }
        else {
            n = 2131099866;
        }
        return n;
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (intent != null) {
            this.lastError = (Throwable)intent.getSerializableExtra("lastError");
        }
        this.setHelp();
        if (n >= 65536) {
            if (this.streamingThread != null) {
                this.streamingThread.cancel();
                this.streamingThread.getFile().delete();
            }
        }
        else if (n2 == -1) {
            this.returnDir((String)intent.getSerializableExtra("RESULT"));
        }
    }
    
    public void onBackPressed() {
        if (this.fileManagementTask != null) {
            Dialogs.showConfirm((Context)this, this.getString(2131099952), this.getString(2131099968), null, (Dialogs.OnConfirmListener)new Dialogs.OnConfirmListener() {
                public void onConfirm() throws Exception {
                    if (DirBrowser.this.fileManagementTask != null) {
                        DirBrowser.this.fileManagementTask.cancel(true);
                    }
                }
            });
        }
        else {
            if (this.dirFetcher != null) {
                this.dirFetcher.cancel(true);
                this.dirFetcher = null;
            }
            super.onBackPressed();
        }
    }
    
    public void onButtonClick(final View view) {
        this.returnDir(this.dir.getAbsolutePath());
    }
    
    public boolean onContextItemSelected(final MenuItem menuItem) {
        int onContextItemSelected = 1;
        final FileInfo fileInfo = (FileInfo)this.adapter.getItem(((AdapterView$AdapterContextMenuInfo)menuItem.getMenuInfo()).position);
        if (menuItem.getItemId() == 2131361815) {
            this.deleteSelectedItem(fileInfo);
        }
        else if (menuItem.getItemId() == 2131361814) {
            this.renameSelectedItem(fileInfo);
        }
        else if (menuItem.getItemId() == 2131361812) {
            final IFile[] array = new IFile[onContextItemSelected];
            array[0] = fileInfo.file;
            this.cutSelected(array);
        }
        else if (menuItem.getItemId() == 2131361813) {
            final IFile[] array2 = new IFile[onContextItemSelected];
            array2[0] = fileInfo.file;
            this.copySelected(array2);
        }
        else if (menuItem.getItemId() == 2131361818) {
            this.paste();
        }
        else {
            onContextItemSelected = (super.onContextItemSelected(menuItem) ? 1 : 0);
        }
        return onContextItemSelected != 0;
    }
    
    public void onCreate(final Bundle bundle) {
        this.requestWindowFeature(6);
        super.onCreate(bundle);
        this.dir = (IFile)this.getData();
        if (bundle == null || bundle.isEmpty()) {
            this.options = (Options)this.getIntent().getSerializableExtra("options");
        }
        else {
            this.options = (Options)bundle.getSerializable("options");
        }
        this.setTitle();
        this.setupButtonChoose();
        this.setupListView();
        this.setHelp();
        if (this.dir instanceof LocalFile) {
            this.setupDropdown();
        }
    }
    
    public void onCreateContextMenu(final ContextMenu contextMenu, final View view, final ContextMenu$ContextMenuInfo contextMenu$ContextMenuInfo) {
        try {
            super.onCreateContextMenu(contextMenu, view, contextMenu$ContextMenuInfo);
            if (this.fileManagementTask == null && contextMenu$ContextMenuInfo != null) {
                final FileInfo fileInfo = (FileInfo)this.adapter.getItem(((AdapterView$AdapterContextMenuInfo)contextMenu$ContextMenuInfo).position);
                final String absolutePath = fileInfo.file.getAbsolutePath();
                if (!this.options.readOnly && !Utils.isDrive(absolutePath) && !Utils.isShare(absolutePath)) {
                    this.getMenuInflater().inflate(2131296257, (Menu)contextMenu);
                    contextMenu.setHeaderTitle((CharSequence)fileInfo.file.getName());
                    contextMenu.setHeaderIcon(this.getItemImage(fileInfo.file, fileInfo.isDirectory));
                }
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        boolean b;
        if (!this.options.readOnly) {
            this.getMenuInflater().inflate(2131296258, menu);
            this.menu = menu;
            b = true;
        }
        else {
            b = false;
        }
        return b;
    }
    
    protected void onDestroy() {
        super.onDestroy();
        Clipboard.clearSubscriber((Clipboard.CutSubscriber)this);
    }
    
    public boolean onLongClick(final View view) {
        this.openContextMenu(view);
        return true;
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        if (menuItem.getItemId() == 2131361816) {
            this.createNewFolder();
        }
        else if (menuItem.getItemId() == 2131361820) {
            this.adapter.refresh();
        }
        else if (menuItem.getItemId() == 2131361817) {
            this.showSelection();
        }
        else if (menuItem.getItemId() == 2131361813) {
            this.copySelected();
        }
        else if (menuItem.getItemId() == 2131361812) {
            this.cutSelected();
        }
        else if (menuItem.getItemId() == 2131361818) {
            this.paste();
        }
        else if (menuItem.getItemId() == 2131361819) {
            this.selectAll();
        }
        else if (menuItem.getItemId() == 2131361815) {
            this.deleteSelected();
        }
        else {
            if (menuItem.getItemId() != 2131361821) {
                return super.onOptionsItemSelected(menuItem);
            }
            this.gotoDir();
        }
        if (this.menu != null) {
            this.onPrepareOptionsMenu(this.menu);
        }
        return false;
    }
    
    public void onPaste() {
        if (this.adapter != null) {
            this.runOnUiThread((Runnable)new Runnable() {
                public void run() {
                    DirBrowser.this.adapter.refresh();
                }
            });
        }
    }
    
    public boolean onPrepareOptionsMenu(final Menu menu) {
        boolean b = true;
        if (!this.options.readOnly) {
            final MenuItem item = menu.findItem(2131361816);
            final boolean rootRemoteFolder = Utils.isRootRemoteFolder(this.dir);
            item.setEnabled(!rootRemoteFolder && b);
            final MenuItem item2 = menu.findItem(2131361817);
            item2.setVisible(!rootRemoteFolder && b);
            item2.setChecked(this.selection);
            if (Build$VERSION.SDK_INT < 11) {
                int icon;
                if (this.selection) {
                    icon = 17301517;
                }
                else {
                    icon = 17301518;
                }
                item2.setIcon(icon);
            }
            else {
                item2.setIcon(2130837531);
            }
            final int size = this.getSelectedInfos().size();
            final MenuItem item3 = menu.findItem(2131361812);
            item3.setEnabled(!rootRemoteFolder && size > 0 && b);
            if (Build$VERSION.SDK_INT >= 11) {
                item3.setVisible(item3.isEnabled());
            }
            final MenuItem item4 = menu.findItem(2131361813);
            item4.setEnabled(!rootRemoteFolder && size > 0 && b);
            if (Build$VERSION.SDK_INT >= 11) {
                item4.setVisible(item4.isEnabled());
            }
            final MenuItem item5 = menu.findItem(2131361818);
            item5.setEnabled(!rootRemoteFolder && Clipboard.hasData() && this.fileManagementTask == null && b);
            if (Build$VERSION.SDK_INT >= 11) {
                item5.setVisible(item5.isEnabled());
            }
            menu.findItem(2131361819).setVisible(this.selection);
            final MenuItem item6 = menu.findItem(2131361815);
            boolean enabled = false;
            if (!rootRemoteFolder) {
                enabled = false;
                if (size > 0) {
                    final FileManagementTask fileManagementTask = this.fileManagementTask;
                    enabled = false;
                    if (fileManagementTask == null) {
                        enabled = b;
                    }
                }
            }
            item6.setEnabled(enabled);
            if (Build$VERSION.SDK_INT >= 11) {
                item6.setVisible(item6.isEnabled());
            }
            else {
                item6.setVisible(this.selection);
            }
        }
        else {
            b = false;
        }
        return b;
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        final FileManagementTask fileManagementTask = this.fileManagementTask;
        if (fileManagementTask != null) {
            fileManagementTask.cancel(true);
        }
        else {
            final DirFetcher dirFetcher = this.dirFetcher;
            if (dirFetcher != null) {
                dirFetcher.cancel(true);
                this.dirFetcher = null;
            }
        }
        super.onProgressCancelClick(view);
    }
    
    protected void onResume() {
        super.onResume();
        if (Utils.isRootRemoteFolder(this.dir)) {
            this.selection = false;
        }
        else {
            this.selection = Config.getShowEditMode((Context)this);
        }
        this.adapter.notifyDataSetChanged();
        if (this.menu != null) {
            this.onPrepareOptionsMenu(this.menu);
        }
    }
    
    protected void onSaveInstanceState(final Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putSerializable("options", (Serializable)this.options);
    }
    
    protected void selectDir(final IFile file, final Options options) {
        internalSelectDir((Activity)this, file, options, new Intent((Context)this, (Class)this.getClass()));
    }
    
    protected void setHelp() {
        final Throwable lastError = this.lastError;
        int help = 0;
        if (lastError != null) {
            help = Errors.getHelp(this.lastError);
        }
        if (help == 0) {
            help = this.getDefaultHelp();
        }
        this.setHelp(help);
    }
    
    protected void setupButtonChoose() {
        String s = this.dir.getName();
        if (s.length() == 0) {
            s = "/";
        }
        if (this.dir instanceof RemoteFile) {
            s = Utils.urlToPath(s);
        }
        this.buttonOk.setText((CharSequence)(String.valueOf(this.getString(2131099889)) + " " + s));
        this.buttonOk.setEnabled(false);
        final Button buttonOk = this.buttonOk;
        final boolean showButton = this.options.showButton;
        int visibility = 0;
        if (!showButton) {
            visibility = 8;
        }
        buttonOk.setVisibility(visibility);
    }
    
    protected void setupDropdown() {
        try {
            if (Build$VERSION.SDK_INT >= 11) {
                this.setupActionBar(new ActionBarAdapter());
            }
            else {
                this.setupSpinner(new ActionBarAdapter());
            }
        }
        catch (Throwable t) {
            t.printStackTrace();
        }
    }
    
    private class ActionBarAdapter extends ArrayAdapter<String>
    {
        public ActionBarAdapter() {
            super((Context)DirBrowser.this, 17367049);
            this.refresh();
        }
        
        private void refresh() {
            this.clear();
            File file;
            for (String s = DirBrowser.this.dir.getAbsolutePath(); s != null; s = file.getParent()) {
                file = new File(s);
                this.insert((Object)file.getAbsolutePath(), 0);
            }
        }
        
        private void setCurrentDir(final String s) throws IOException {
            if (!DirBrowser.this.dir.getAbsolutePath().equals(s)) {
                IFile file;
                for (file = DirBrowser.this.dir; file != null && !s.equals(file.getAbsolutePath()); file = file.getParent()) {}
                DirBrowser.access$4(DirBrowser.this, file);
                DirBrowser.this.adapter.refresh();
            }
        }
        
        public View getDropDownView(final int n, final View view, final ViewGroup viewGroup) {
            View inflate = view;
            if (inflate == null) {
                inflate = DirBrowser.this.getLayoutInflater().inflate(2130903043, (ViewGroup)null);
            }
            inflate.setPadding(n * 50, inflate.getPaddingTop(), inflate.getPaddingRight(), inflate.getPaddingBottom());
            final TextView textView = (TextView)inflate.findViewById(2131361802);
            final File file = new File((String)this.getItem(n));
            String name = file.getName();
            if (name.length() == 0) {
                name = "/";
            }
            textView.setText((CharSequence)Html.fromHtml("<big>" + name + "</big>"));
            ((ImageView)inflate.findViewById(2131361796)).setImageResource(DirBrowser.this.getDirectoryImage(new LocalFile(file)));
            ((CheckBox)inflate.findViewById(2131361798)).setVisibility(8);
            return inflate;
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            View view2;
            if (Build$VERSION.SDK_INT >= 11) {
                view2 = super.getView(n, view, viewGroup);
            }
            else {
                view2 = this.getDropDownView(n, view, viewGroup);
            }
            return view2;
        }
        
        boolean onClick(final int n) {
            try {
                this.setCurrentDir((String)this.getItem(n));
                this.refresh();
                return true;
            }
            catch (Exception ex) {
                Dialogs.showError((Context)DirBrowser.this, ex);
                return false;
            }
        }
    }
    
    class DirAdapter extends ArrayAdapter<FileInfo>
    {
        DirAdapter(final ArrayList<FileInfo> list) {
            super((Context)DirBrowser.this, 2131361802, (List)list);
            this.refresh();
        }
        
        public void add(final ArrayList<FileInfo> list) {
            this.clear();
            final Iterator<FileInfo> iterator = list.iterator();
            while (iterator.hasNext()) {
                this.add((Object)iterator.next());
            }
            this.notifyDataSetChanged();
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            View inflate = view;
            if (inflate == null) {
                inflate = DirBrowser.this.getLayoutInflater().inflate(2130903043, (ViewGroup)null);
            }
            final TextView textView = (TextView)inflate.findViewById(2131361802);
            final FileInfo onCheckedChangeListener = (FileInfo)this.getItem(n);
            String s = onCheckedChangeListener.file.getName();
            if (onCheckedChangeListener.file instanceof RemoteFile) {
                s = Utils.urlToPath(s);
            }
            String s2 = "<big>" + s + "</big>";
            if (!onCheckedChangeListener.isDirectory) {
                String s3 = String.valueOf(new StringBuilder(String.valueOf(s2)).append("<br/>").toString()) + "<small><b>";
                if (onCheckedChangeListener.lastModified != -1L) {
                    s3 = String.valueOf(s3) + Utils.toDate((Context)DirBrowser.this, onCheckedChangeListener.lastModified);
                }
                if (onCheckedChangeListener.length != -1L) {
                    s3 = String.valueOf(s3) + "\t\t" + Utils.humanReadableSize(onCheckedChangeListener.length);
                }
                s2 = String.valueOf(s3) + "</b></small>";
            }
            textView.setText((CharSequence)Html.fromHtml(s2));
            final ImageView imageView = (ImageView)inflate.findViewById(2131361796);
            Drawable imageDrawable = DirBrowser.this.getItemImage(onCheckedChangeListener.file, onCheckedChangeListener.isDirectory);
            if (!onCheckedChangeListener.isDirectory) {
                imageDrawable = DirBrowser.this.scaleListImage(imageDrawable);
            }
            imageView.setImageDrawable(imageDrawable);
            final CheckBox checkBox = (CheckBox)inflate.findViewById(2131361798);
            int visibility;
            if (DirBrowser.this.options.showSelection && DirBrowser.this.selection && !Utils.isRootRemoteFolder(DirBrowser.this.dir)) {
                visibility = 0;
            }
            else {
                visibility = 8;
            }
            checkBox.setVisibility(visibility);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)null);
            checkBox.setChecked(onCheckedChangeListener.selected);
            Typeface typeface;
            if (onCheckedChangeListener.selected) {
                typeface = Typeface.DEFAULT_BOLD;
            }
            else {
                typeface = Typeface.DEFAULT;
            }
            textView.setTypeface(typeface);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)onCheckedChangeListener);
            return inflate;
        }
        
        void refresh() {
            if (DirBrowser.this.dirFetcher != null) {
                DirBrowser.this.dirFetcher.cancel(true);
                DirBrowser.access$9(DirBrowser.this, null);
            }
            DirBrowser.access$9(DirBrowser.this, new DirFetcher());
            ((Utils.ProgressTask<IFile, Progress, Result>)DirBrowser.this.dirFetcher).run(DirBrowser.this.dir);
        }
    }
    
    private class DirFetcher extends Utils.ProgressTask<IFile, ProgressInfo, ArrayList<FileInfo>>
    {
        private static final int PROGRESS_SIZE = 200;
        private boolean dirIsSelectable;
        private View emptyView;
        
        DirFetcher() {
            super((Activity)DirBrowser.this, "DirFetcher");
        }
        
        static /* synthetic */ void access$3(final DirFetcher dirFetcher, final Object[] array) {
            dirFetcher.publishProgress(array);
        }
        
        protected ArrayList<FileInfo> atBackground(final IFile... array) throws Exception {
            this.dirIsSelectable = (DirBrowser.this.dir.isDirectory() && DirBrowser.this.dir.canRead());
            final IFile file = array[0];
            if (!file.canRead()) {
                throw new IOException(DirBrowser.this.getString(2131099813));
            }
            final NameComparator nameComparator = new NameComparator((NameComparator)null);
            final TreeSet set = new TreeSet<Object>((Comparator<? super Object>)nameComparator);
            final TreeSet set2 = new TreeSet<Object>((Comparator<? super Object>)nameComparator);
            file.listFiles(new IFileFilter() {
                int count = 0;
                private final /* synthetic */ ProgressInfo val$progressInfo = new ProgressInfo((ProgressInfo)null);
                
                public boolean accept(final IFile file) throws IOException {
                    if (DirFetcher.this.isCancelled()) {
                        throw new CancellationException();
                    }
                    final int count = 1 + this.count;
                    this.count = count;
                    if (count % 200 == 0) {
                        this.val$progressInfo.percent = this.count;
                        DirFetcher.access$3(DirFetcher.this, new ProgressInfo[] { this.val$progressInfo });
                    }
                    final boolean directory = file.isDirectory();
                    TreeSet set;
                    if (directory) {
                        set = set;
                    }
                    else {
                        set = set2;
                    }
                    set.add(new FileInfo(file, directory, file.length(), file.getLastModified()));
                    return false;
                }
            });
            final ArrayList list = new ArrayList<Object>(set.size() + set2.size());
            list.addAll(set);
            list.addAll(set2);
            return (ArrayList<FileInfo>)list;
        }
        
        protected void onCancelled() {
            this.emptyView.setVisibility(8);
            DirBrowser.this.setProgressVisible(false);
            super.onCancelled();
        }
        
        protected void onPostExecute(final ArrayList<FileInfo> list) {
            this.emptyView.setVisibility(8);
            DirBrowser.this.setProgressVisible(false);
            super.onPostExecute(list);
            if (this.error != null) {
                DirBrowser.this.lastError = this.error;
            }
            DirBrowser.this.setHelp();
            if (list == null) {
                final Intent intent = new Intent();
                intent.putExtra("lastError", (Serializable)DirBrowser.this.lastError);
                DirBrowser.this.setResult(0, intent);
                DirBrowser.this.finish();
            }
            else {
                DirBrowser.this.adapter.add(list);
                DirBrowser.this.adapter.notifyDataSetChanged();
                DirBrowser.this.setTitle();
                DirBrowser.this.setupButtonChoose();
                DirBrowser.this.buttonOk.setEnabled(this.dirIsSelectable);
            }
        }
        
        protected void onPreExecute() {
            (this.emptyView = DirBrowser.this.findViewById(2131361793)).setVisibility(0);
            super.onPreExecute();
        }
        
        protected void onProgressUpdate(final ProgressInfo... array) {
            final ProgressInfo progressInfo = array[0];
            DirBrowser.this.setProgressVisible(true);
            DirBrowser.this.setProgress(0, String.valueOf(DirBrowser.this.getString(2131100067)) + " " + progressInfo.percent);
            this.emptyView.setVisibility(8);
            DirBrowser.this.buttonOk.setEnabled(this.dirIsSelectable);
        }
    }
    
    protected class FileInfo implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        final IFile file;
        protected final boolean isDirectory;
        long lastModified;
        long length;
        protected boolean selected;
        
        FileInfo(final IFile file) {
            super();
            this.length = -1L;
            this.lastModified = -1L;
            this.file = file;
            boolean directory = false;
            while (true) {
                try {
                    directory = file.isDirectory();
                    this.length = file.length();
                    this.lastModified = file.getLastModified();
                    this.isDirectory = directory;
                }
                catch (IOException ex) {
                    ex.printStackTrace();
                    continue;
                }
                break;
            }
        }
        
        FileInfo(final IFile file, final boolean isDirectory, final long length, final long lastModified) {
            super();
            this.length = -1L;
            this.lastModified = -1L;
            this.file = file;
            this.isDirectory = isDirectory;
            this.length = length;
            this.lastModified = lastModified;
        }
        
        protected FileInfo(final DirBrowser dirBrowser, final FileInfo fileInfo) {
            this(dirBrowser, fileInfo.file, fileInfo.isDirectory, fileInfo.length, fileInfo.lastModified);
            this.selected = fileInfo.selected;
        }
        
        public boolean getBooleanValue() {
            return this.selected;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean selected) {
            if (this.selected != selected) {
                this.selected = selected;
                if (DirBrowser.this.menu != null) {
                    DirBrowser.this.onPrepareOptionsMenu(DirBrowser.this.menu);
                }
                DirBrowser.this.adapter.notifyDataSetChanged();
            }
        }
        
        public void onClick(final View view) {
            if (this.isDirectory) {
                DirBrowser.this.selectDir(this.file, DirBrowser.this.options);
            }
            else {
                DirBrowser.this.viewSelectedItem(this);
            }
        }
    }
    
    private class FileManagementTask extends Utils.ProgressTask<FileInfo, ProgressInfo, FileInfo[]>
    {
        private int filesCount;
        private long lastUpdateTime;
        private CharSequence title;
        private final Type type;
        
        FileManagementTask(final Type type) {
            super((Activity)DirBrowser.this, "FileManagement " + type);
            this.title = DirBrowser.this.getTitle();
            this.type = type;
        }
        
        static /* synthetic */ void access$4(final FileManagementTask fileManagementTask, final Object[] array) {
            fileManagementTask.publishProgress(array);
        }
        
        static /* synthetic */ void access$5(final FileManagementTask fileManagementTask, final long lastUpdateTime) {
            fileManagementTask.lastUpdateTime = lastUpdateTime;
        }
        
        private IFile[] getFiles(final FileInfo... array) {
            final IFile[] array2 = new IFile[array.length];
            final int length = array.length;
            int i = 0;
            int n = 0;
            while (i < length) {
                final FileInfo fileInfo = array[i];
                final int n2 = n + 1;
                array2[n] = fileInfo.file;
                ++i;
                n = n2;
            }
            return array2;
        }
        
        private void restoreUIState() {
            DirBrowser.this.setProgressVisible(false);
            DirBrowser.this.setProgress(0, null);
            DirBrowser.this.setTitle(this.title);
            DirBrowser.this.adapter.notifyDataSetChanged();
            DirBrowser.access$5(DirBrowser.this, null);
            if (DirBrowser.this.menu != null) {
                DirBrowser.this.onPrepareOptionsMenu(DirBrowser.this.menu);
            }
        }
        
        protected FileInfo[] atBackground(final FileInfo... array) throws Exception {
            if (this.type == Type.Delete) {
                this.filesCount = Clipboard.delete((Context)DirBrowser.this, this.getFiles(array), new FileProgressNotification((FileProgressNotification)null));
            }
            else if (this.type == Type.Copy || this.type == Type.Move) {
                this.filesCount = Clipboard.paste((Context)DirBrowser.this, DirBrowser.this.dir, new FileProgressNotification((FileProgressNotification)null));
            }
            return array;
        }
        
        protected void onCancelled() {
            super.onCancelled();
            this.restoreUIState();
            DirBrowser.this.adapter.refresh();
        }
        
        protected void onPostExecute(final FileInfo[] array) {
            super.onPostExecute(array);
            if (this.error == null && this.type == Type.Delete) {
                for (int length = array.length, i = 0; i < length; ++i) {
                    DirBrowser.this.adapter.remove((Object)array[i]);
                }
            }
            else {
                DirBrowser.this.adapter.refresh();
            }
            this.restoreUIState();
            Object o;
            if (DirBrowser.this.isFinishing()) {
                o = DirBrowser.this.getApplication();
            }
            else {
                o = DirBrowser.this;
            }
            if (this.error == null) {
                Dialogs.showMessage((Context)o, DirBrowser.this.getString(this.type.getSuccessMessage(), new Object[] { this.filesCount }));
            }
            else {
                Dialogs.showErrorDialog((Context)o, DirBrowser.this.getString(2131099818), Errors.getErrorMessage((Context)o, this.error, false));
            }
        }
        
        protected void onPreExecute() {
            DirBrowser.this.setProgressVisible(true);
        }
        
        protected void onProgressUpdate(final ProgressInfo... array) {
            final ProgressInfo progressInfo = array[0];
            String string;
            if (progressInfo.percent != 0) {
                string = String.valueOf(progressInfo.percent) + "% ";
            }
            else {
                string = "";
            }
            DirBrowser.this.setProgress(progressInfo.percent, String.valueOf(Utils.getActionString(progressInfo.action, (Context)DirBrowser.this)) + " " + string + progressInfo.file.getName());
        }
        
        private class FileProgressNotification implements ProgressNotification
        {
            ProgressInfo progressInfo;
            
            private FileProgressNotification() {
                super();
                this.progressInfo = new ProgressInfo((ProgressInfo)null);
            }
            
            public boolean update(final ProgressNotification.ProgressAction action, final int percent, final IFile file) {
                final long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis - FileManagementTask.this.lastUpdateTime > 100L) {
                    this.progressInfo.percent = percent;
                    this.progressInfo.action = action;
                    this.progressInfo.file = file;
                    FileManagementTask.access$4(FileManagementTask.this, new ProgressInfo[] { this.progressInfo });
                    FileManagementTask.access$5(FileManagementTask.this, currentTimeMillis);
                }
                final boolean cancelled = FileManagementTask.this.isCancelled();
                boolean b = false;
                if (!cancelled) {
                    b = true;
                }
                return b;
            }
        }
    }
    
    private final class NameComparator implements Comparator<FileInfo>
    {
        public int compare(final FileInfo fileInfo, final FileInfo fileInfo2) {
            return fileInfo.file.getName().compareTo(fileInfo2.file.getName());
        }
    }
    
    static class Options implements Serializable
    {
        private static final long serialVersionUID = 7993476141622934594L;
        boolean readOnly;
        Integer requestCode;
        boolean showButton;
        boolean showSelection;
        
        Options() {
            super();
            this.showButton = true;
        }
    }
    
    private class ProgressInfo
    {
        ProgressNotification.ProgressAction action;
        IFile file;
        int percent;
    }
    
    private final class StreamingThread extends Thread
    {
        private boolean canceled;
        final File result;
        private boolean running;
        private final IFile selectedItem;
        
        private StreamingThread(final IFile selectedItem, final File result) {
            super("View " + selectedItem.getAbsolutePath());
            this.selectedItem = selectedItem;
            this.result = result;
        }
        
        void cancel() {
            this.canceled = true;
            int n = 0;
            while (n < 5 && this.running) {
                while (true) {
                    try {
                        this.interrupt();
                        Thread.sleep(200L);
                        ++n;
                    }
                    catch (InterruptedException ex) {
                        continue;
                    }
                    break;
                }
            }
        }
        
        File getFile() {
            return this.result;
        }
        
        public void run() {
            final byte[] array = new byte[61440];
            Label_0075: {
                try {
                    synchronized (this) {
                        this.running = true;
                        if (!this.selectedItem.canRead()) {
                            throw new IOException(DirBrowser.this.getString(2131099650));
                        }
                        break Label_0075;
                    }
                }
                catch (Exception ex) {
                    if (!this.canceled) {
                        ex.printStackTrace();
                        DirBrowser.this.runOnUiThread((Runnable)new Runnable() {
                            public void run() {
                                Exception val$e = ex;
                                if (ex instanceof TransportException) {
                                    val$e = new IOException(DirBrowser.this.getString(2131099808));
                                }
                                Dialogs.showError((Context)DirBrowser.this, val$e);
                            }
                        });
                    }
                }
                return;
            }
            while (true) {
                final InputStream inputStream = this.selectedItem.getInputStream();
                while (true) {
                    try {
                        final FileOutputStream fileOutputStream = new FileOutputStream(this.result);
                        try {
                            while (!this.canceled) {
                                final int read = inputStream.read(array);
                                if (read == -1) {
                                    break;
                                }
                                fileOutputStream.write(array, 0, read);
                            }
                            fileOutputStream.close();
                            inputStream.close();
                            this.running = false;
                            this.notify();
                            if (this.canceled) {
                                this.result.delete();
                                // monitorexit(this)
                                break;
                            }
                        }
                        finally {
                            fileOutputStream.close();
                        }
                    }
                    finally {
                        inputStream.close();
                        this.running = false;
                        this.notify();
                        while (true) {
                            if (this.canceled) {
                                this.result.delete();
                                break Label_0212;
                            }
                            this.result.deleteOnExit();
                            break Label_0212;
                            continue;
                        }
                    }
                    this.result.deleteOnExit();
                    continue;
                }
            }
        }
    }
    
    private enum Type
    {
        Copy {
            int getSuccessMessage() {
                return 2131100063;
            }
        }, 
        Delete {
            int getSuccessMessage() {
                return 2131100062;
            }
        }, 
        Move {
            int getSuccessMessage() {
                return 2131100064;
            }
        };
        
        abstract int getSuccessMessage();
    }
}
