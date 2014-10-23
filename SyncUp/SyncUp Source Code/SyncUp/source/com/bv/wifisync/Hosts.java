package com.bv.wifisync;

import android.util.*;
import java.io.*;
import android.content.*;
import android.app.*;
import android.os.*;
import com.bv.sync.*;
import android.graphics.drawable.*;
import android.graphics.*;
import android.text.format.*;
import java.util.*;
import android.view.*;
import android.view.animation.*;
import android.widget.*;

public class Hosts extends BrowseActivity implements SyncService.Notify, AdapterView$OnItemLongClickListener
{
    private static final int ADD_HOST = Integer.MAX_VALUE;
    private static final int ADD_JOB = 4096;
    private static final String BUTTON = "Button";
    private static final int CHECK_HOSTS_DELAY = 5000;
    private static final int INVALID_ID = -1;
    private static final String ITEM_ID = "itemId";
    private static final String MENU = "Menu";
    private static final String RUN_ACTION = "com.bv.wifisync.run";
    protected static final String TAG = "Hosts";
    private ItemsAdapter adapter;
    private final CheckHostTask checkHostTask;
    private final ServiceConnection connection;
    private HostList hosts;
    private boolean isBound;
    long lastUpdate;
    private Menu optionsMenu;
    private int pendingRequestCode;
    private Intent pendingResult;
    private boolean selection;
    private SyncService service;
    private boolean shortClick;
    private boolean shortcutSetupMode;
    private boolean syncButtonMode;
    
    public Hosts() {
        super();
        this.checkHostTask = new CheckHostTask();
        this.connection = (ServiceConnection)new ServiceConnection() {
            public void onServiceConnected(final ComponentName componentName, final IBinder binder) {
                Log.i("Hosts", "Service connected");
                try {
                    Hosts.access$2(Hosts.this, ((SyncService.ServiceBinder)binder).getService());
                    Hosts.access$4(Hosts.this, Hosts.this.service.getHosts());
                    Hosts.this.readData();
                    Hosts.this.service.setUI((SyncService.Notify)Hosts.this);
                    Hosts.this.checkHostTask.start();
                    Hosts.this.setTitle(2131099888);
                    if (Hosts.this.pendingResult != null) {
                        Hosts.this.onActivityResult(Hosts.this.pendingRequestCode, -1, Hosts.this.pendingResult);
                    }
                    final Intent intent = Hosts.this.getIntent();
                    if (intent != null) {
                        Hosts.this.handleShortcut(intent);
                    }
                }
                catch (Exception ex) {
                    Dialogs.showError((Context)Hosts.this, ex);
                }
            }
            
            public void onServiceDisconnected(final ComponentName componentName) {
                Log.i("Hosts", "Service disconnected");
                Hosts.access$2(Hosts.this, null);
                Hosts.this.setTitle(2131100067);
            }
        };
    }
    
    static /* synthetic */ void access$10(final Hosts hosts, final boolean shortClick) {
        hosts.shortClick = shortClick;
    }
    
    static /* synthetic */ void access$2(final Hosts hosts, final SyncService service) {
        hosts.service = service;
    }
    
    static /* synthetic */ void access$20(final Hosts hosts, final boolean syncButtonMode) {
        hosts.syncButtonMode = syncButtonMode;
    }
    
    static /* synthetic */ void access$4(final Hosts hosts, final HostList hosts2) {
        hosts.hosts = hosts2;
    }
    
    private void addShortcut(final int n, final String s, final int n2) {
        final Intent intent = new Intent("com.bv.wifisync.run");
        intent.setClassName((Context)this, this.getClass().getName());
        intent.putExtra("itemId", n);
        intent.addFlags(536870912);
        final Intent intent2 = new Intent();
        intent2.putExtra("android.intent.extra.shortcut.INTENT", (Parcelable)intent);
        intent2.putExtra("android.intent.extra.shortcut.NAME", String.valueOf(this.getString(2131099649)) + " " + s);
        intent2.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", (Parcelable)Intent$ShortcutIconResource.fromContext((Context)this, n2));
        this.setResult(-1, intent2);
        this.finish();
    }
    
    private void attachService() throws IOException {
        if (!this.bindService(new Intent((Context)this, (Class)SyncService.class), this.connection, 1)) {
            throw new IOException(this.getString(2131099816));
        }
        this.isBound = true;
    }
    
    private void clearLastNotification(final Intent intent) {
        if (intent != null && intent.getIntExtra("notification", 0) != 0) {
            Utils.setLastNotification((Context)this, null);
        }
    }
    
    private void dispatchTimeZoneErrors(final int[] array) {
        if (array != null) {
            for (int i = 0; i < array.length; ++i) {
                if (array[i] != 0) {
                    this.dispatchEvent("TimeZoneErrors", "Hours diff " + i, array[i]);
                }
            }
        }
    }
    
    private CheckItem findItem(final int n) throws IOException {
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            final PropertyRow item = this.adapter.getItem(i);
            if (((CheckItem)item).getId() == n) {
                return (CheckItem)item;
            }
        }
        final PropertyRow item = null;
        return (CheckItem)item;
    }
    
    private void handleShortcut(final Intent intent) throws IOException {
        this.shortcutSetupMode = "android.intent.action.CREATE_SHORTCUT".equals(intent.getAction());
        if (this.service != null && "com.bv.wifisync.run".equals(intent.getAction())) {
            final int intExtra = intent.getIntExtra("itemId", -1);
            if (intExtra != -1) {
                this.runShortcut(intExtra);
            }
        }
    }
    
    private boolean isDonated() {
        if (Config.getBoolean((Context)this, this.getString(2131100034), false)) {
            return true;
        }
        final boolean purchase = Config.getPurchase((Context)this, Biller.ChargeType.Donate);
        boolean b = false;
        if (purchase) {
            return true;
        }
        return b;
        b = true;
        return b;
    }
    
    private void readData() {
        this.adapter.clear();
        synchronized (this.hosts) {
            for (final Host host : this.hosts) {
                this.adapter.add((Object)new HostItem(host));
                final Iterator<Job> iterator2 = host.getJobs().iterator();
                while (iterator2.hasNext()) {
                    this.adapter.add((Object)new JobItem(iterator2.next()));
                }
            }
            // monitorexit(this.hosts)
            this.adapter.notifyDataSetChanged();
            this.setHelpText();
            if (this.syncButtonMode && this.adapter.getCount() == 0) {
                Config.setShowEditMode((Context)this, this.syncButtonMode = false);
                this.buttonOk.setText(2131099896);
            }
        }
    }
    
    private void removeSelectedItem(final CheckItem checkItem) {
        Dialogs.showConfirm((Context)this, this.getString(2131099927), this.getString(2131099928, new Object[] { checkItem.getName() }), null, (Dialogs.OnConfirmListener)new Dialogs.OnConfirmListener() {
            public void onConfirm() throws Exception {
                checkItem.onCheckedChanged(null, false);
                checkItem.remove();
                if (Hosts.this.service != null) {
                    Hosts.this.service.update();
                }
                Hosts.this.readData();
                Hosts.this.setHelpText();
            }
        });
    }
    
    private void run(final CheckItem checkItem) throws IOException {
        final boolean running = checkItem.isRunning();
        if (running) {
            checkItem.cancel();
            this.setProgress(0, this.getString(2131099918));
        }
        else {
            checkItem.run();
        }
        String s;
        if (running) {
            s = "Cancel";
        }
        else {
            s = "Run";
        }
        this.trackEvent("Menu", s);
    }
    
    private void runSelected() throws IOException {
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            if (this.adapter.getItem(i).selected) {
                this.adapter.getItem(i).run();
            }
        }
    }
    
    private void runShortcut(final int n) throws IOException {
        if (n == 0) {
            this.syncAll();
        }
        else {
            final CheckItem item = this.findItem(n);
            if (item == null) {
                throw new IOException(this.getString(2131099812));
            }
            if (item.canRun()) {
                Log.i("Hosts", "Running shortcut item " + item.getId() + " " + item.getName());
                item.run();
            }
        }
    }
    
    private void setFailedHelp() {
        final Throwable mostRecentError = this.hosts.getMostRecentError();
        int help = 0;
        if (mostRecentError != null) {
            final boolean b = mostRecentError instanceof Exception;
            help = 0;
            if (b) {
                help = Errors.getHelp(mostRecentError);
            }
        }
        if (help == 0) {
            help = 2131099855;
        }
        this.setHelp(help);
    }
    
    private void setHelpText() {
        if (this.hosts.size() == 0) {
            this.setHelp(2131099851);
        }
        else if (this.hosts.getJobCount() == 0) {
            this.setHelp(2131099852);
        }
        else if (this.shortcutSetupMode) {
            this.setHelp(2131099883);
        }
        else if (this.hosts.noRunJob()) {
            this.setHelp(2131099853);
        }
        else if (this.hosts.hasFailedJobs()) {
            this.setFailedHelp();
        }
        else if (this.hosts.noScheduledJobs()) {
            this.setHelp(2131099854);
        }
        else {
            this.setHelp(2131099857);
        }
    }
    
    private void setShortcutSetupMode(final boolean shortcutSetupMode) {
        this.shortcutSetupMode = shortcutSetupMode;
        if (shortcutSetupMode) {
            this.syncButtonMode = true;
            this.buttonOk.setText(2131100080);
            this.buttonOk.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
        }
    }
    
    private void showProps(final Class<? extends Activity> clazz, final int n, final Serializable... array) {
        final Intent intent = new Intent((Context)this, (Class)clazz);
        for (int i = 0; i < array.length; ++i) {
            final StringBuilder sb = new StringBuilder("RESULT");
            Serializable value;
            if (i == 0) {
                value = "";
            }
            else {
                value = i;
            }
            intent.putExtra(sb.append(value).toString(), array[i]);
        }
        this.startActivityForResult(intent, n);
    }
    
    private void showSelection() {
        if (!(this.selection = !this.selection)) {
            for (int i = 0; i < this.adapter.getCount(); ++i) {
                this.adapter.getItem(i).selected = false;
            }
        }
        this.adapter.notifyDataSetChanged();
    }
    
    private void syncAll() throws IOException {
        int n = 0;
        Utils.checkWifi((Context)this);
        synchronized (this.hosts) {
            final Iterator<Host> iterator = this.hosts.iterator();
            while (iterator.hasNext()) {
                final Iterator<Job> iterator2 = iterator.next().getJobs().iterator();
                while (iterator2.hasNext()) {
                    this.service.runNow(iterator2.next());
                    ++n;
                }
            }
            // monitorexit(this.hosts)
            if (n > 0) {
                this.startService(new Intent((Context)this, (Class)SyncService.class));
                System.out.println(String.valueOf(n) + " Jobs were scheduled");
                Dialogs.showMessage((Context)this, this.getString(2131099951));
            }
        }
    }
    
    private void unbind() {
        if (this.isBound) {
            if (this.service != null) {
                this.service.setUI(null);
            }
            this.unbindService(this.connection);
            this.isBound = false;
        }
    }
    
    private void updateDisplay(final Serializable s, final int n) throws IOException, ClassNotFoundException {
        if (n == Integer.MAX_VALUE) {
            final Host host = (Host)s;
            this.hosts.add(host);
            final HostItem hostItem = new HostItem(host);
            host.setConnected(true);
            this.adapter.add((Object)hostItem);
            this.getListView().smoothScrollToPosition(-1 + this.adapter.getCount());
            this.trackEvent("Button", "Host added");
        }
        else if (n >= 4096) {
            final Job job = (Job)s;
            final int n2 = n - 4096;
            this.hosts.addJob(job, ((HostItem)this.adapter.getItem(n2)).host);
            final int n3 = n2 + job.host.getJobs().size();
            this.adapter.insert((Object)new JobItem(job), n3);
            this.getListView().smoothScrollToPosition(n3);
            this.trackEvent("Menu", "Job added");
        }
        else {
            final CheckItem item = this.adapter.getItem(n);
            if (s instanceof Job) {
                this.hosts.updateJob((Context)this, ((JobItem)item).job, (Job)s);
                this.trackEvent("Menu", "Job updated");
            }
            else if (s instanceof Host) {
                this.hosts.updateHost(((HostItem)item).host, (Host)s);
                this.trackEvent("Menu", "Host updated");
            }
        }
        if (this.service != null) {
            this.service.update();
        }
        this.setHelpText();
    }
    
    private void updateOptionsMenu() {
        if (this.optionsMenu != null) {
            this.onPrepareOptionsMenu(this.optionsMenu);
        }
    }
    
    private void updateProgress(final ProgressNotification.ProgressAction progressAction, final int n, final IFile file, final long lastUpdate) {
        this.lastUpdate = lastUpdate;
        this.runOnUiThread((Runnable)new Runnable() {
            public void run() {
                Hosts.this.setProgressVisible(true);
                String s = Utils.getActionString(progressAction, (Context)Hosts.this);
                if (!"".equals(s)) {
                    s = String.valueOf(s) + " ";
                }
                String s2 = s;
                if (n != 0) {
                    final StringBuilder sb = new StringBuilder(String.valueOf(s2));
                    int val$percent;
                    if (n > 100) {
                        val$percent = 100;
                    }
                    else {
                        val$percent = n;
                    }
                    s2 = sb.append(val$percent).append("%").toString();
                }
                if (file != null) {
                    s2 = String.valueOf(s2) + " " + file.getName();
                }
                if (!s2.equals(Hosts.this.getTitle().toString()) && n <= 100) {
                    Hosts.this.setProgress(n, s2);
                }
            }
        });
    }
    
    protected void onActivityResult(int pendingRequestCode, final int n, Intent pendingResult) {
        if (n != -1 || pendingResult == null) {
            return;
        }
        try {
            final Serializable serializableExtra = pendingResult.getSerializableExtra("RESULT");
            if (serializableExtra != null) {
                if (this.service != null) {
                    this.updateDisplay(serializableExtra, pendingRequestCode);
                    this.adapter.notifyDataSetChanged();
                }
                if (this.service != null) {
                    pendingResult = null;
                }
                this.pendingResult = pendingResult;
                if (this.service != null) {
                    pendingRequestCode = -1;
                }
                this.pendingRequestCode = pendingRequestCode;
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    public void onButtonClick(final View view) throws IOException {
        if (this.syncButtonMode) {
            if (this.shortcutSetupMode) {
                this.addShortcut(0, this.getString(2131100081), 2130837548);
            }
            else {
                this.syncAll();
            }
        }
        else {
            this.showProps((Class<? extends Activity>)AddHost.class, Integer.MAX_VALUE, new Host());
        }
    }
    
    public boolean onContextItemSelected(final MenuItem menuItem) {
        AdapterView$AdapterContextMenuInfo adapterView$AdapterContextMenuInfo;
        CheckItem item;
        int itemId;
        try {
            adapterView$AdapterContextMenuInfo = (AdapterView$AdapterContextMenuInfo)menuItem.getMenuInfo();
            item = this.adapter.getItem(adapterView$AdapterContextMenuInfo.position);
            itemId = menuItem.getItemId();
            if (itemId == 2131361828) {
                this.removeSelectedItem(item);
                this.updateOptionsMenu();
                return true;
            }
            if (itemId == 2131361831) {
                this.run(item);
                return true;
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
            return true;
        }
        if (itemId == 2131361826) {
            this.showProps((Class<? extends Activity>)AddJob.class, 4096 + adapterView$AdapterContextMenuInfo.position, new Job(), ((HostItem)item).host);
            this.trackEvent("Menu", "Add job");
        }
        else if (itemId == 2131361827) {
            item.edit();
        }
        else if (itemId == 2131361838) {
            ((JobItem)item).job.showHistory((Context)this);
        }
        else if (itemId == 2131361829) {
            Utils.checkWifi((Context)this);
            ((Utils.ProgressTask<Host, Progress, Result>)new ExploreTask()).run(((HostItem)item).host);
        }
        else if (itemId == 2131361830) {
            ((Utils.ProgressTask<Host, Progress, Result>)new WakeupTask()).run(((HostItem)item).host);
        }
        return true;
    }
    
    protected void onCreate(final Bundle p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: aload_1        
        //     2: invokespecial   com/bv/wifisync/BrowseActivity.onCreate:(Landroid/os/Bundle;)V
        //     5: aload_0        
        //     6: invokevirtual   com/bv/wifisync/Hosts.getApplication:()Landroid/app/Application;
        //     9: invokestatic    com/bv/wifisync/Utils.setPostMortem:(Landroid/content/Context;)V
        //    12: aload_0        
        //    13: iconst_0       
        //    14: invokevirtual   com/bv/wifisync/Hosts.setResult:(I)V
        //    17: aload_0        
        //    18: new             Lcom/bv/wifisync/Hosts$ItemsAdapter;
        //    21: dup            
        //    22: aload_0        
        //    23: invokespecial   com/bv/wifisync/Hosts$ItemsAdapter.<init>:(Lcom/bv/wifisync/Hosts;)V
        //    26: putfield        com/bv/wifisync/Hosts.adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
        //    29: aload_0        
        //    30: aload_0        
        //    31: getfield        com/bv/wifisync/Hosts.adapter:Lcom/bv/wifisync/Hosts$ItemsAdapter;
        //    34: invokevirtual   com/bv/wifisync/Hosts.setListAdapter:(Landroid/widget/ListAdapter;)V
        //    37: aload_0        
        //    38: aload_0        
        //    39: invokevirtual   com/bv/wifisync/Hosts.getListView:()Landroid/widget/ListView;
        //    42: invokevirtual   com/bv/wifisync/Hosts.registerForContextMenu:(Landroid/view/View;)V
        //    45: getstatic       android/os/Build$VERSION.SDK_INT:I
        //    48: bipush          11
        //    50: if_icmplt       61
        //    53: aload_0        
        //    54: invokevirtual   com/bv/wifisync/Hosts.getListView:()Landroid/widget/ListView;
        //    57: aload_0        
        //    58: invokevirtual   android/widget/ListView.setOnItemLongClickListener:(Landroid/widget/AdapterView$OnItemLongClickListener;)V
        //    61: aload_0        
        //    62: ldc_w           2131100067
        //    65: invokevirtual   com/bv/wifisync/Hosts.setTitle:(I)V
        //    68: aload_0        
        //    69: invokestatic    com/bv/wifisync/Dialogs.showWelcome:(Landroid/content/Context;)Landroid/app/Dialog;
        //    72: ifnull          86
        //    75: aload_0        
        //    76: ldc_w           "Installs"
        //    79: aload_0        
        //    80: invokestatic    com/bv/wifisync/Utils.getAppVersion:(Landroid/content/Context;)Ljava/lang/String;
        //    83: invokevirtual   com/bv/wifisync/Hosts.dispatchEvent:(Ljava/lang/String;Ljava/lang/String;)V
        //    86: aload_0        
        //    87: invokespecial   com/bv/wifisync/Hosts.attachService:()V
        //    90: aload_0        
        //    91: aload_0        
        //    92: invokestatic    com/bv/wifisync/Config.getSyncButtonMode:(Landroid/content/Context;)Z
        //    95: putfield        com/bv/wifisync/Hosts.syncButtonMode:Z
        //    98: aload_0        
        //    99: getfield        com/bv/wifisync/Hosts.buttonOk:Landroid/widget/Button;
        //   102: astore          4
        //   104: aload_0        
        //   105: getfield        com/bv/wifisync/Hosts.syncButtonMode:Z
        //   108: ifeq            223
        //   111: ldc_w           2131100080
        //   114: istore          5
        //   116: aload           4
        //   118: iload           5
        //   120: invokevirtual   android/widget/Button.setText:(I)V
        //   123: aload_0        
        //   124: ldc_w           "Version"
        //   127: aload_0        
        //   128: invokestatic    com/bv/wifisync/Utils.getAppVersion:(Landroid/content/Context;)Ljava/lang/String;
        //   131: invokevirtual   com/bv/wifisync/Hosts.trackEvent:(Ljava/lang/String;Ljava/lang/String;)V
        //   134: aload_0        
        //   135: invokevirtual   com/bv/wifisync/Hosts.getIntent:()Landroid/content/Intent;
        //   138: astore          7
        //   140: aload           7
        //   142: ifnull          166
        //   145: aload_0        
        //   146: aload           7
        //   148: invokespecial   com/bv/wifisync/Hosts.clearLastNotification:(Landroid/content/Intent;)V
        //   151: aload_0        
        //   152: ldc_w           "android.intent.action.CREATE_SHORTCUT"
        //   155: aload           7
        //   157: invokevirtual   android/content/Intent.getAction:()Ljava/lang/String;
        //   160: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //   163: invokespecial   com/bv/wifisync/Hosts.setShortcutSetupMode:(Z)V
        //   166: new             Lcom/bv/wifisync/Hosts$2;
        //   169: dup            
        //   170: aload_0        
        //   171: new             Landroid/view/GestureDetector;
        //   174: dup            
        //   175: aload_0        
        //   176: new             Lcom/bv/wifisync/Hosts$MyGestureListener;
        //   179: dup            
        //   180: aload_0        
        //   181: aconst_null    
        //   182: invokespecial   com/bv/wifisync/Hosts$MyGestureListener.<init>:(Lcom/bv/wifisync/Hosts;Lcom/bv/wifisync/Hosts$MyGestureListener;)V
        //   185: invokespecial   android/view/GestureDetector.<init>:(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V
        //   188: invokespecial   com/bv/wifisync/Hosts$2.<init>:(Lcom/bv/wifisync/Hosts;Landroid/view/GestureDetector;)V
        //   191: astore          8
        //   193: aload_0        
        //   194: getfield        com/bv/wifisync/Hosts.buttonOk:Landroid/widget/Button;
        //   197: aload           8
        //   199: invokevirtual   android/widget/Button.setOnTouchListener:(Landroid/view/View$OnTouchListener;)V
        //   202: goto            241
        //   205: astore_3       
        //   206: aload_0        
        //   207: aload_3        
        //   208: invokestatic    com/bv/wifisync/Dialogs.showError:(Landroid/content/Context;Ljava/lang/Throwable;)V
        //   211: goto            90
        //   214: astore_2       
        //   215: aload_0        
        //   216: aload_2        
        //   217: invokestatic    com/bv/wifisync/Dialogs.showError:(Landroid/content/Context;Ljava/lang/Throwable;)V
        //   220: goto            241
        //   223: ldc_w           2131099896
        //   226: istore          5
        //   228: goto            116
        //   231: astore          6
        //   233: aload           6
        //   235: invokevirtual   java/lang/Throwable.printStackTrace:()V
        //   238: goto            134
        //   241: return         
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  0      86     214    223    Ljava/lang/Exception;
        //  86     90     205    214    Ljava/lang/Exception;
        //  90     123    214    223    Ljava/lang/Exception;
        //  123    134    231    241    Ljava/lang/Throwable;
        //  123    134    214    223    Ljava/lang/Exception;
        //  134    211    214    223    Ljava/lang/Exception;
        //  233    238    214    223    Ljava/lang/Exception;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0134:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2607)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:55)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:271)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:203)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:103)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    public void onCreateContextMenu(final ContextMenu contextMenu, final View view, final ContextMenu$ContextMenuInfo contextMenu$ContextMenuInfo) {
        AdapterView$AdapterContextMenuInfo adapterView$AdapterContextMenuInfo;
        CheckItem item;
        MenuItem item2;
        int title;
        MenuItem item3;
        boolean enabled;
        MenuItem item4;
        boolean enabled2;
        MenuItem item5;
        boolean visible;
        Label_0159_Outer:Label_0215_Outer:Label_0266_Outer:
        while (true) {
            this.shortClick = false;
            super.onCreateContextMenu(contextMenu, view, contextMenu$ContextMenuInfo);
            while (true) {
            Label_0343:
                while (true) {
                Label_0337:
                    while (true) {
                    Label_0331:
                        while (true) {
                            Label_0323: {
                                try {
                                    adapterView$AdapterContextMenuInfo = (AdapterView$AdapterContextMenuInfo)contextMenu$ContextMenuInfo;
                                    if (adapterView$AdapterContextMenuInfo == null) {
                                        return;
                                    }
                                    item = this.adapter.getItem(adapterView$AdapterContextMenuInfo.position);
                                    if (item instanceof HostItem) {
                                        this.getMenuInflater().inflate(2131296260, (Menu)contextMenu);
                                    }
                                    else {
                                        if (!(item instanceof JobItem)) {
                                            throw new Exception("No item");
                                        }
                                        this.getMenuInflater().inflate(2131296263, (Menu)contextMenu);
                                    }
                                    contextMenu.setHeaderTitle((CharSequence)item.getName());
                                    contextMenu.setHeaderIcon(item.getImage());
                                    item2 = contextMenu.findItem(2131361831);
                                    if (item2 != null) {
                                        if (!item.isRunning()) {
                                            break Label_0323;
                                        }
                                        title = 2131099952;
                                        item2.setTitle(title);
                                        item2.setVisible(item.canRun());
                                    }
                                    item3 = contextMenu.findItem(2131361827);
                                    if (item3 != null) {
                                        if (!item.isRunning()) {
                                            break Label_0331;
                                        }
                                        enabled = false;
                                        item3.setEnabled(enabled);
                                    }
                                    item4 = contextMenu.findItem(2131361838);
                                    if (item4 != null && item instanceof JobItem) {
                                        if (((JobItem)item).job.getHistory().size() == 0) {
                                            break Label_0337;
                                        }
                                        enabled2 = true;
                                        item4.setEnabled(enabled2);
                                    }
                                    item5 = contextMenu.findItem(2131361830);
                                    if (item5 == null || !(item instanceof HostItem)) {
                                        return;
                                    }
                                    if (((HostItem)item).host.getConnected()) {
                                        visible = false;
                                        item5.setVisible(visible);
                                        return;
                                    }
                                    break Label_0343;
                                }
                                catch (Exception ex) {
                                    Dialogs.showError((Context)this, ex);
                                    return;
                                }
                                throw new Exception("No item");
                            }
                            title = 2131099899;
                            continue Label_0159_Outer;
                        }
                        enabled = true;
                        continue Label_0215_Outer;
                    }
                    enabled2 = false;
                    continue Label_0266_Outer;
                }
                visible = true;
                continue;
            }
        }
    }
    
    protected Dialog onCreateDialog(final int n) {
        final Dialog showWelcome = Dialogs.showWelcome((Context)this);
        if (showWelcome != null) {
            this.dispatchEvent("Installs", Utils.getAppVersion((Context)this));
        }
        return showWelcome;
    }
    
    public boolean onCreateOptionsMenu(final Menu optionsMenu) {
        this.getMenuInflater().inflate(2131296262, optionsMenu);
        final MenuItem item = optionsMenu.findItem(2131361834);
        if (item != null) {
            item.setVisible(!this.isDonated());
        }
        this.optionsMenu = optionsMenu;
        return true;
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.unbind();
        this.checkHostTask.interrupt();
        Utils.stopTracker();
        Clipboard.clear();
    }
    
    public boolean onItemLongClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
        final boolean shortClick = this.shortClick;
        boolean b = false;
        if (!shortClick) {
            int n3;
            if (this.adapter.getItem(n).selected) {
                n3 = 0;
            }
            else {
                n3 = 1;
            }
            this.showSelection();
            final CheckItem item = this.adapter.getItem(n);
            final boolean selection = this.selection;
            boolean selected = false;
            if (selection) {
                selected = false;
                if (n3 != 0) {
                    selected = true;
                }
            }
            item.selected = selected;
            this.adapter.notifyDataSetChanged();
            this.updateOptionsMenu();
            b = true;
        }
        return b;
    }
    
    protected void onNewIntent(final Intent intent) {
        super.onNewIntent(intent);
        this.setIntent(intent);
        if (intent == null) {
            return;
        }
        try {
            this.clearLastNotification(intent);
            if (this.service != null && intent != null) {
                this.handleShortcut(intent);
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        try {
            if (menuItem.getItemId() == 2131361837) {
                Dialogs.showAbout((Context)this);
                return true;
            }
            if (menuItem.getItemId() == 2131361833) {
                this.startActivity(new Intent((Context)this, (Class)Settings.class));
                return true;
            }
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
            return true;
        }
        if (menuItem.getItemId() == 2131361834) {
            this.donate();
        }
        else if (menuItem.getItemId() == 2131361835) {
            Dialogs.showInfo((Context)this, 2131100035, 2131100075);
        }
        else if (menuItem.getItemId() == 2131361836) {
            Dialogs.showInfo((Context)this, 2131100084, 2131099887);
        }
        else {
            if (menuItem.getItemId() != 2131361831) {
                return super.onOptionsItemSelected(menuItem);
            }
            this.runSelected();
        }
        return true;
    }
    
    public boolean onPrepareOptionsMenu(final Menu menu) {
        boolean onPrepareOptionsMenu;
        if (Build$VERSION.SDK_INT >= 11) {
            menu.findItem(2131361831).setVisible(this.selection);
            onPrepareOptionsMenu = true;
        }
        else {
            onPrepareOptionsMenu = super.onPrepareOptionsMenu(menu);
        }
        return onPrepareOptionsMenu;
    }
    
    public boolean onProgress(final Job job, final ProgressNotification.ProgressAction progressAction, final int n, final IFile file) {
        final long currentTimeMillis = System.currentTimeMillis();
        if (progressAction != ProgressNotification.ProgressAction.Listing && (currentTimeMillis - this.lastUpdate > 50L || progressAction == ProgressNotification.ProgressAction.Saving || progressAction == ProgressNotification.ProgressAction.Connecting)) {
            this.updateProgress(progressAction, n, file, currentTimeMillis);
        }
        return !job.isCanceled();
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            final CheckItem item = this.adapter.getItem(i);
            if (item.isRunning()) {
                item.cancel();
                break;
            }
        }
        super.onProgressCancelClick(view);
    }
    
    protected void onResume() {
        super.onResume();
        this.checkHostTask.enabled = true;
    }
    
    protected void onStop() {
        this.checkHostTask.enabled = false;
        super.onStop();
    }
    
    public void onWindowFocusChanged(final boolean enabled) {
        super.onWindowFocusChanged(enabled);
        this.checkHostTask.enabled = enabled;
    }
    
    public void update(final Job job, final boolean b) {
        this.runOnUiThread((Runnable)new Runnable() {
            public void run() {
                while (true) {
                    while (true) {
                        Label_0196: {
                            try {
                                Hosts.this.setProgress(0, null);
                                Hosts.this.setProgressVisible(b);
                                Hosts.this.setTitle(2131099888);
                                Hosts.this.adapter.notifyDataSetChanged();
                                Hosts.this.setHelpText();
                                if (!b) {
                                    final Hosts this$0 = Hosts.this;
                                    if (job.lastResult != null) {
                                        break Label_0196;
                                    }
                                    final String s = "Job run success";
                                    this$0.dispatchEvent("Runs", s);
                                    if (job.syncStats != null) {
                                        Hosts.this.dispatchTimeZoneErrors(job.syncStats.timeZoneConflicts);
                                    }
                                    if (job.lastResult != null) {
                                        Dialogs.showError((Context)Hosts.this, Errors.getErrorMessage((Context)Hosts.this, job.lastResult, false));
                                    }
                                    else {
                                        Dialogs.showMessage((Context)Hosts.this, Hosts.this.getString(2131099945, new Object[] { job.getName() }));
                                    }
                                }
                            }
                            catch (Throwable t) {
                                Dialogs.showError((Context)Hosts.this, t);
                            }
                            break;
                        }
                        final String s = "Job run fail";
                        continue;
                    }
                }
            }
        });
    }
    
    private class CheckHostTask extends Thread
    {
        private static final long SCREEN_REFRESH_TIMEOUT = 60000L;
        boolean enabled;
        private long lastReconnect;
        long lastRefreshTime;
        
        public CheckHostTask() {
            super("CheckHostTask");
            this.enabled = true;
        }
        
        private void checkHostConnected() throws InterruptedException {
            if (this.enabled) {
                Hosts.this.hosts.checkConnected((Context)Hosts.this, this.lastReconnect, (HostList.ChangeListener)new HostList.ChangeListener() {
                    public void onChanged() {
                        Hosts.this.runOnUiThread((Runnable)new Runnable() {
                            public void run() {
                                Hosts.this.adapter.notifyDataSetChanged();
                            }
                        });
                    }
                });
            }
        }
        
        private void refreshScreen() {
            final long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.lastRefreshTime > 60000L) {
                this.lastRefreshTime = currentTimeMillis;
                Hosts.this.runOnUiThread((Runnable)new Runnable() {
                    public void run() {
                        Hosts.this.adapter.notifyDataSetChanged();
                    }
                });
            }
        }
        
        public void run() {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: bipush          19
            //     2: invokestatic    android/os/Process.setThreadPriority:(I)V
            //     5: new             Lcom/bv/wifisync/Hosts$CheckHostTask$1;
            //     8: dup            
            //     9: aload_0        
            //    10: invokespecial   com/bv/wifisync/Hosts$CheckHostTask$1.<init>:(Lcom/bv/wifisync/Hosts$CheckHostTask;)V
            //    13: astore_1       
            //    14: aload_0        
            //    15: getfield        com/bv/wifisync/Hosts$CheckHostTask.this$0:Lcom/bv/wifisync/Hosts;
            //    18: aload_1        
            //    19: new             Landroid/content/IntentFilter;
            //    22: dup            
            //    23: ldc             "android.net.conn.CONNECTIVITY_CHANGE"
            //    25: invokespecial   android/content/IntentFilter.<init>:(Ljava/lang/String;)V
            //    28: invokevirtual   com/bv/wifisync/Hosts.registerReceiver:(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
            //    31: pop            
            //    32: invokestatic    com/bv/wifisync/Hosts$CheckHostTask.interrupted:()Z
            //    35: istore          9
            //    37: iload           9
            //    39: ifeq            51
            //    42: aload_0        
            //    43: getfield        com/bv/wifisync/Hosts$CheckHostTask.this$0:Lcom/bv/wifisync/Hosts;
            //    46: aload_1        
            //    47: invokevirtual   com/bv/wifisync/Hosts.unregisterReceiver:(Landroid/content/BroadcastReceiver;)V
            //    50: return         
            //    51: aload_0        
            //    52: getfield        com/bv/wifisync/Hosts$CheckHostTask.this$0:Lcom/bv/wifisync/Hosts;
            //    55: invokestatic    com/bv/wifisync/Hosts.access$14:(Lcom/bv/wifisync/Hosts;)Lcom/bv/wifisync/Hosts$ItemsAdapter;
            //    58: ifnull          69
            //    61: aload_0        
            //    62: invokespecial   com/bv/wifisync/Hosts$CheckHostTask.checkHostConnected:()V
            //    65: aload_0        
            //    66: invokespecial   com/bv/wifisync/Hosts$CheckHostTask.refreshScreen:()V
            //    69: ldc2_w          5000
            //    72: invokestatic    java/lang/Thread.sleep:(J)V
            //    75: goto            32
            //    78: astore          7
            //    80: aload_0        
            //    81: getfield        com/bv/wifisync/Hosts$CheckHostTask.this$0:Lcom/bv/wifisync/Hosts;
            //    84: aload_1        
            //    85: invokevirtual   com/bv/wifisync/Hosts.unregisterReceiver:(Landroid/content/BroadcastReceiver;)V
            //    88: goto            50
            //    91: astore          8
            //    93: aload           8
            //    95: invokevirtual   java/lang/Throwable.printStackTrace:()V
            //    98: goto            50
            //   101: astore          5
            //   103: aload           5
            //   105: invokevirtual   java/lang/Throwable.printStackTrace:()V
            //   108: aload_0        
            //   109: getfield        com/bv/wifisync/Hosts$CheckHostTask.this$0:Lcom/bv/wifisync/Hosts;
            //   112: aload_1        
            //   113: invokevirtual   com/bv/wifisync/Hosts.unregisterReceiver:(Landroid/content/BroadcastReceiver;)V
            //   116: goto            50
            //   119: astore          6
            //   121: aload           6
            //   123: invokevirtual   java/lang/Throwable.printStackTrace:()V
            //   126: goto            50
            //   129: astore_3       
            //   130: aload_0        
            //   131: getfield        com/bv/wifisync/Hosts$CheckHostTask.this$0:Lcom/bv/wifisync/Hosts;
            //   134: aload_1        
            //   135: invokevirtual   com/bv/wifisync/Hosts.unregisterReceiver:(Landroid/content/BroadcastReceiver;)V
            //   138: aload_3        
            //   139: athrow         
            //   140: astore          4
            //   142: aload           4
            //   144: invokevirtual   java/lang/Throwable.printStackTrace:()V
            //   147: goto            138
            //   150: astore          10
            //   152: aload           10
            //   154: invokevirtual   java/lang/Throwable.printStackTrace:()V
            //   157: goto            50
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                            
            //  -----  -----  -----  -----  --------------------------------
            //  32     37     78     101    Ljava/lang/InterruptedException;
            //  32     37     101    129    Ljava/lang/Throwable;
            //  32     37     129    150    Any
            //  42     50     150    160    Ljava/lang/Throwable;
            //  51     75     78     101    Ljava/lang/InterruptedException;
            //  51     75     101    129    Ljava/lang/Throwable;
            //  51     75     129    150    Any
            //  80     88     91     101    Ljava/lang/Throwable;
            //  103    108    129    150    Any
            //  108    116    119    129    Ljava/lang/Throwable;
            //  130    138    140    150    Ljava/lang/Throwable;
            // 
            // The error that occurred was:
            // 
            // java.lang.IllegalStateException: Expression is linked from several locations: Label_0050:
            //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
            //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2607)
            //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
            //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:100)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:668)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:567)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:493)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:507)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:460)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:105)
            //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:55)
            //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:271)
            //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:203)
            //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:103)
            // 
            throw new IllegalStateException("An error occurred while decompiling this method.");
        }
    }
    
    private abstract class CheckItem extends PropertyRow implements View$OnClickListener, CompoundButton$OnCheckedChangeListener
    {
        private final int padding;
        boolean selected;
        
        CheckItem(final String s, final int padding) {
            super((Context)Hosts.this, s);
            this.padding = padding;
        }
        
        private boolean hasSelection() {
            for (int i = 0; i < Hosts.this.adapter.getCount(); ++i) {
                if (Hosts.this.adapter.getItem(i).selected) {
                    return true;
                }
            }
            return false;
        }
        
        abstract boolean canRun();
        
        abstract void cancel();
        
        abstract void edit();
        
        abstract int getId();
        
        protected abstract boolean isRunning();
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean selected) {
            if (this.selected != selected) {
                this.selected = selected;
                if (!this.selected && !this.hasSelection()) {
                    Hosts.this.showSelection();
                }
                Hosts.this.updateOptionsMenu();
                Hosts.this.adapter.notifyDataSetChanged();
            }
        }
        
        public void onClick(final View view) {
            Hosts.access$10(Hosts.this, true);
            if (!Hosts.this.shortcutSetupMode) {
                Hosts.this.openContextMenu(view);
            }
        }
        
        abstract void remove() throws Exception;
        
        abstract void run() throws IOException;
    }
    
    private class ExploreTask extends Utils.ProgressTask<Host, Void, RemoteFile>
    {
        public ExploreTask() {
            super((Activity)Hosts.this, "Explore");
        }
        
        protected RemoteFile atBackground(final Host... array) throws Exception {
            final Host host = array[0];
            return new RemoteFile(host.domain, host.user, host.getPassword((Context)Hosts.this), "smb://" + host.resolveName((Context)Hosts.this) + "/");
        }
        
        protected void onPostExecute(final RemoteFile remoteFile) {
            super.onPostExecute(remoteFile);
            if (this.error == null && !this.isCancelled()) {
                final Intent intent = new Intent((Context)Hosts.this, (Class)DirBrowser.class);
                intent.putExtra("RESULT", (Serializable)remoteFile);
                final DirBrowser.Options options = new DirBrowser.Options();
                options.showButton = false;
                options.showSelection = true;
                intent.putExtra("options", (Serializable)options);
                Hosts.this.startActivity(intent);
            }
        }
    }
    
    private class HostItem extends CheckItem
    {
        private final Host host;
        
        HostItem(final Host host) {
            super(host.name, 0);
            this.host = host;
        }
        
        boolean canRun() {
            return this.host.getJobs().size() != 0;
        }
        
        void cancel() {
            if (Hosts.this.service != null) {
                Hosts.this.service.cancel(this.host);
            }
        }
        
        public void edit() {
            Hosts.this.showProps(AddHost.class, Hosts.this.adapter.getPosition((Object)this), new Serializable[] { this.host });
        }
        
        public int getId() {
            return this.host.id;
        }
        
        Drawable getImage() {
            return Hosts.this.getResources().getDrawable(2130837508);
        }
        
        protected String getName() {
            return this.host.name;
        }
        
        protected String getValue() {
            return String.valueOf(this.host.domain) + "\\" + this.host.user;
        }
        
        protected boolean isRunning() {
            final Iterator<Job> iterator = this.host.getJobs().iterator();
            while (iterator.hasNext()) {
                if (iterator.next().running) {
                    return true;
                }
            }
            return false;
        }
        
        public void onClick(final View view) {
            if (Hosts.this.shortcutSetupMode) {
                Hosts.this.addShortcut(this.host.id, this.host.name, 2130837508);
            }
            else {
                super.onClick(view);
            }
        }
        
        void remove() throws IOException {
            this.host.remove((Context)Hosts.this);
            synchronized (Hosts.this.hosts) {
                Hosts.this.hosts.remove(this.host);
            }
        }
        
        void run() throws IOException {
            Utils.checkWifi((Context)Hosts.this);
            final Iterator<Job> iterator = this.host.getJobs().iterator();
            while (iterator.hasNext()) {
                Hosts.this.service.runNow(iterator.next());
            }
            Hosts.this.startService(new Intent((Context)Hosts.this, (Class)SyncService.class));
            Dialogs.showMessage((Context)Hosts.this, Hosts.this.getString(2131099951));
        }
    }
    
    private class ItemsAdapter extends PropertiesAdapter<CheckItem>
    {
        public ItemsAdapter() {
            super((Context)Hosts.this, new ArrayList());
        }
        
        public int getCount() {
            synchronized (this) {
                return super.getCount();
            }
        }
        
        public CheckItem getItem(final int n) {
            synchronized (this) {
                return (CheckItem)super.getItem(n);
            }
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            final View view2 = super.getView(n, view, viewGroup);
            final CheckItem item = this.getItem(n);
            view2.setPadding(item.padding, view2.getPaddingTop(), view2.getPaddingRight(), view2.getPaddingBottom());
            final ImageView imageView = (ImageView)view2.findViewById(2131361796);
            if (item instanceof JobItem && ((JobItem)item).job.running) {
                Utils.animate((View)imageView);
            }
            else {
                imageView.setAnimation((Animation)null);
            }
            imageView.clearColorFilter();
            if (item instanceof HostItem && !((HostItem)item).host.getConnected()) {
                imageView.setColorFilter(-7829368, PorterDuff$Mode.MULTIPLY);
            }
            final CheckBox checkBox = (CheckBox)view2.findViewById(2131361798);
            int visibility;
            if (Hosts.this.selection) {
                visibility = 0;
            }
            else {
                visibility = 8;
            }
            checkBox.setVisibility(visibility);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)null);
            checkBox.setChecked(item.selected);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)item);
            Hosts.this.updateOptionsMenu();
            return view2;
        }
    }
    
    private class JobItem extends CheckItem
    {
        private final Job job;
        
        JobItem(final Job job) {
            super(job.getName(), 50);
            this.job = job;
        }
        
        private String formatLastRunResults(final Job.HistoryItem historyItem) {
            final String formatLine = this.formatLine(historyItem.deletedFilesCount, "red", this.formatLine(historyItem.remoteFilesCount, "blue", this.formatLine(historyItem.localFileCount, "blue", "")));
            String string;
            if (formatLine.length() != 0) {
                string = " (" + formatLine + ")";
            }
            else {
                string = null;
            }
            return string;
        }
        
        private String formatLine(final int n, final String s, String s2) {
            if (n != 0) {
                if (s2.length() != 0) {
                    s2 = String.valueOf(s2) + "/";
                }
                s2 = String.valueOf(s2) + "<font color=\"" + s + "\">" + n + "</font>";
            }
            return s2;
        }
        
        private String getLastRunResults() {
            final List<Job.HistoryItem> history = this.job.getHistory();
            String formatLastRunResults;
            if (history.size() != 0) {
                formatLastRunResults = this.formatLastRunResults(history.get(-1 + history.size()));
            }
            else {
                formatLastRunResults = null;
            }
            return formatLastRunResults;
        }
        
        boolean canRun() {
            return true;
        }
        
        void cancel() {
            this.job.cancel();
        }
        
        public void edit() {
            Hosts.this.showProps(AddJob.class, Hosts.this.adapter.getPosition((Object)this), new Serializable[] { this.job, this.job.host });
        }
        
        public int getId() {
            return this.job.id;
        }
        
        Drawable getImage() {
            return this.job.getDrawable((Context)Hosts.this);
        }
        
        protected String getName() {
            return this.job.getName();
        }
        
        CharSequence getRelativeTime() {
            try {
                return DateUtils.getRelativeDateTimeString((Context)Hosts.this, this.job.lastRun, 60000L, 604800000L, 0);
            }
            catch (UnknownFormatConversionException ex) {
                return Utils.toDate((Context)Hosts.this, this.job.lastRun);
            }
        }
        
        protected String getValue() {
            String s;
            if (this.job.lastRun == 0L) {
                s = Hosts.this.getString(2131099924);
            }
            else {
                s = String.valueOf(Hosts.this.getString(2131099926)) + " " + (Object)this.getRelativeTime();
                final String lastRunResults = this.getLastRunResults();
                if (lastRunResults != null) {
                    s = String.valueOf(s) + lastRunResults;
                }
            }
            return s;
        }
        
        protected boolean isRunning() {
            return this.job.running;
        }
        
        public void onClick(final View view) {
            if (Hosts.this.shortcutSetupMode) {
                Hosts.this.addShortcut(this.job.id, this.job.getName(), this.job.getIconId());
            }
            else {
                super.onClick(view);
            }
        }
        
        void remove() throws IOException {
            this.cancel();
            this.job.remove((Context)Hosts.this);
        }
        
        void run() throws IOException {
            Hosts.this.dispatchEvent("Menu", "Run job");
            Utils.checkWifi((Context)Hosts.this);
            Hosts.this.service.runNow(this.job);
            Hosts.this.startService(new Intent((Context)Hosts.this, (Class)SyncService.class));
            Dialogs.showMessage((Context)Hosts.this, Hosts.this.getString(2131099951));
        }
    }
    
    private class MyGestureListener extends GestureDetector$SimpleOnGestureListener
    {
        public boolean onDown(final MotionEvent motionEvent) {
            return false;
        }
        
        public boolean onFling(final MotionEvent motionEvent, final MotionEvent motionEvent2, final float n, final float n2) {
            try {
                if (Math.abs(motionEvent.getY() - motionEvent2.getY()) <= 250.0f && ((motionEvent.getX() - motionEvent2.getX() > 120.0f && Math.abs(n) > 200.0f) || (motionEvent2.getX() - motionEvent.getX() > 120.0f && Math.abs(n) > 200.0f))) {
                    Hosts.access$20(Hosts.this, !Hosts.this.syncButtonMode);
                    Config.setSyncButtonMode((Context)Hosts.this, Hosts.this.syncButtonMode);
                    final Button buttonOk = Hosts.this.buttonOk;
                    int text;
                    if (Hosts.this.syncButtonMode) {
                        text = 2131100080;
                    }
                    else {
                        text = 2131099896;
                    }
                    buttonOk.setText(text);
                    Hosts.this.buttonOk.startAnimation(AnimationUtils.loadAnimation((Context)Hosts.this, 17432578));
                    motionEvent2.setAction(3);
                }
                return false;
            }
            catch (Exception ex) {
                return false;
            }
        }
    }
    
    private class WakeupTask extends Utils.ProgressTask<Host, Void, Void>
    {
        WakeupTask() {
            super((Activity)Hosts.this, "Wakeup");
        }
        
        protected Void atBackground(final Host... array) throws Exception {
            array[0].wakeup((Context)Hosts.this);
            return null;
        }
        
        protected void onPostExecute(final Void void1) {
            super.onPostExecute(void1);
            if (this.error == null && !this.isCancelled()) {
                Dialogs.showMessage((Context)Hosts.this, Hosts.this.getString(2131099911));
            }
        }
    }
}
