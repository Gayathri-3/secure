package com.bv.wifisync;

import jcifs.*;
import android.annotation.*;
import android.content.*;
import android.content.pm.*;
import android.util.*;
import java.io.*;
import com.bv.sync.*;
import java.util.*;
import android.os.*;
import android.app.*;

public class SyncService extends Service implements Runnable
{
    private static final String CANCEL_ACTION = "com.bv.wifisync.cancel";
    private static final String TAG = "SyncService";
    private static HostList hosts;
    private static Object[] lock;
    private static volatile TimerThread timerThread;
    private static volatile PowerManager$WakeLock wakeLock;
    private Intent cancelIntent;
    private long lastAliveTime;
    private NotificationManager notificationManager;
    private SyncQueue queue;
    private int runCount;
    private Notification runningNotification;
    private Notify ui;
    
    static {
        Config.setProperty("jcifs.smb.client.soTimeout", "3000");
        Config.setProperty("jcifs.smb.client.responseTimeout", "4000");
        Config.setProperty("jcifs.smb.client.dfs.disabled", "true");
        Config.setProperty("jcifs.netbios.retryCount", "1");
        RemoteFile.setRetryCount(10);
        SyncService.lock = new Object[0];
    }
    
    public SyncService() {
        super();
        this.lastAliveTime = System.currentTimeMillis();
        this.queue = new SyncQueue((SyncQueue)null);
    }
    
    static /* synthetic */ void access$1(final SyncService syncService, final Intent cancelIntent) {
        syncService.cancelIntent = cancelIntent;
    }
    
    static /* synthetic */ void access$4(final SyncService syncService, final Notification runningNotification) {
        syncService.runningNotification = runningNotification;
    }
    
    static /* synthetic */ void access$6(final SyncService syncService, final long lastAliveTime) {
        syncService.lastAliveTime = lastAliveTime;
    }
    
    static /* synthetic */ void access$7(final SyncService syncService, final Notify ui) {
        syncService.ui = ui;
    }
    
    @SuppressLint({ "Wakelock" })
    private static void acquireWakeLock(final Context context) {
        synchronized (SyncService.lock) {
            if (SyncService.wakeLock == null) {
                (SyncService.wakeLock = ((PowerManager)context.getSystemService("power")).newWakeLock(1, context.getString(2131099649))).acquire();
            }
        }
    }
    
    private void enableReceiver(final Class<?> clazz, final boolean b) {
        final PackageManager packageManager = this.getPackageManager();
        int n;
        if (b) {
            n = 1;
        }
        else {
            n = 2;
        }
        packageManager.setComponentEnabledSetting(new ComponentName((Context)this, (Class)clazz), n, 1);
    }
    
    private boolean isCancelRun(final Intent intent) {
        return intent != null && "com.bv.wifisync.cancel".equals(intent.getAction());
    }
    
    private boolean isClearAllNotifications(final Intent intent) {
        boolean b = false;
        if (intent != null) {
            final int intExtra = intent.getIntExtra("notification", 0);
            b = false;
            if (intExtra != 0) {
                b = true;
            }
        }
        return b;
    }
    
    private boolean isScheduled(final Job job) {
        for (final SyncTask syncTask : this.queue) {
            if (syncTask.runNow && syncTask.job == job) {
                return true;
            }
        }
        return false;
    }
    
    private void queueTask(final SyncTask syncTask) {
        if (!syncTask.runNow && syncTask.getScheduledTime() != null) {
            synchronized (this.queue) {
                final Iterator<SyncTask> iterator = this.queue.iterator();
                while (iterator.hasNext()) {
                    final SyncTask syncTask2 = iterator.next();
                    if (!syncTask2.runNow && syncTask2.job == syncTask.job) {
                        iterator.remove();
                    }
                }
                this.queue.add(syncTask);
            }
        }
    }
    
    private void queueTasks() {
        while (true) {
            boolean b = false;
            boolean b2 = false;
            boolean b3 = false;
            Log.i("SyncService", "Queue tasks");
            while (true) {
                final Iterator<Job> iterator2;
                synchronized (this.queue) {
                    final Iterator<SyncTask> iterator = this.queue.iterator();
                    while (iterator.hasNext()) {
                        if (!((SyncTask)iterator.next()).runNow) {
                            iterator.remove();
                        }
                    }
                    iterator2 = SyncService.hosts.getJobs().iterator();
                    if (!iterator2.hasNext()) {
                        // monitorexit(this.queue)
                        this.enableReceiver(Autostart.class, b2);
                        this.enableReceiver(WifiConnectReceiver.class, b);
                        this.enableReceiver(ChargeConnectReceiver.class, b3);
                        this.startTimerThread();
                        return;
                    }
                }
                final Job job = iterator2.next();
                if (!job.running && job.isScheduled() && job.isConnected((Context)this)) {
                    this.queue.add(new SyncTask(job));
                }
                b |= job.isRouterDependant();
                b2 |= job.isScheduled();
                b3 |= job.isChargingDependant();
                continue;
            }
        }
    }
    
    private void releaseWakeLock() {
        synchronized (SyncService.lock) {
            if (SyncService.wakeLock != null) {
                SyncService.wakeLock.release();
                SyncService.wakeLock = null;
            }
        }
    }
    
    private void runTasks() throws InterruptedException, IOException {
        Log.i("SyncService", "Running tasks " + Thread.currentThread().getId());
        SyncTask poll;
        while (true) {
            poll = this.queue.poll();
            if (poll == null || !poll.isReady()) {
                break;
            }
            Log.i("SyncService", "Task is ready: " + poll.getName() + ", scheduled at: " + poll.getScheduledTime());
            poll.run();
            this.queueTask(poll);
        }
        if (poll != null) {
            this.scheduleAwake(poll);
        }
        SyncService.hosts.saveIfChanged((Context)this);
    }
    
    private void scheduleAwake(final SyncTask syncTask) {
        final Date scheduledTime = syncTask.getScheduledTime();
        if (scheduledTime != null && syncTask.isConnected()) {
            final AlarmManager alarmManager = (AlarmManager)this.getSystemService("alarm");
            final PendingIntent broadcast = PendingIntent.getBroadcast((Context)this, 0, new Intent((Context)this, (Class)Autostart.class), 0);
            final long time = scheduledTime.getTime();
            alarmManager.set(0, time, broadcast);
            if (time <= System.currentTimeMillis()) {
                Log.e("SyncService", "Assertion failed, wakeup time is less than current time, task " + syncTask.getName());
            }
            Log.i("SyncService", String.valueOf(syncTask.getName()) + " scheduling awake at: " + scheduledTime);
        }
    }
    
    private void scheduleDailyWakeup() {
        ((AlarmManager)this.getSystemService("alarm")).setInexactRepeating(2, System.currentTimeMillis() - 1000L, 43200000L, PendingIntent.getService((Context)this, 0, new Intent((Context)this, (Class)SyncService.class), 0));
    }
    
    private void showError(final String s, final String s2) {
        final Notification notification = new Notification(2130837550, (CharSequence)s, System.currentTimeMillis());
        this.updateNotification(notification, s, s2, 0);
        this.notificationManager.notify(NotificationType.Error.ordinal(), notification);
    }
    
    private void showRunningNotification(final Job job) {
        if (this.runningNotification == null) {
            this.runningNotification = new Notification();
            this.runningNotification.icon = 2131034112;
        }
        this.runningNotification.tickerText = String.valueOf(this.getString(2131099946)) + " " + job.getName();
        this.runningNotification.when = System.currentTimeMillis();
        final Intent intent = new Intent((Context)this, (Class)Hosts.class);
        intent.setAction("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.LAUNCHER");
        this.runningNotification.setLatestEventInfo((Context)this, (CharSequence)job.getName(), (CharSequence)this.getString(2131099946), PendingIntent.getActivity((Context)this, 0, intent, 134217728));
        this.runningNotification.flags = 34;
        this.startForeground(NotificationType.Progress.ordinal(), this.runningNotification);
    }
    
    static void start(final Context context) {
        acquireWakeLock(context);
        context.startService(new Intent(context, (Class)SyncService.class));
    }
    
    private void startTimerThread() {
        synchronized (this) {
            Log.i("SyncService", "Timer thread is " + SyncService.timerThread);
            if (SyncService.timerThread == null) {
                Log.i("SyncService", "Starting timer thread");
                (SyncService.timerThread = new TimerThread(this, this.ui)).start();
            }
            else if (System.currentTimeMillis() - this.lastAliveTime > 39600000L) {
                Log.i("SyncService", "Timer thread is dead");
                SyncService.timerThread.interrupt();
                SyncService.timerThread = null;
                this.lastAliveTime = System.currentTimeMillis();
                this.startTimerThread();
            }
        }
    }
    
    private void updateNotification(final Notification notification, final String tickerText, final String s, final int n) {
        notification.tickerText = tickerText;
        notification.when = System.currentTimeMillis();
        final Intent intent = new Intent((Context)this, (Class)Hosts.class);
        intent.setAction("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.setFlags(603979776);
        if (n != 0) {
            intent.putExtra("notification", n);
        }
        notification.setLatestEventInfo((Context)this, (CharSequence)tickerText, (CharSequence)s, PendingIntent.getActivity((Context)this, 0, intent, 1207959552));
        notification.flags = 24;
        notification.defaults |= 0x1;
    }
    
    private void updateUI(final Job job, final boolean b) {
        while (true) {
            synchronized (this) {
                final Notify ui = this.ui;
                // monitorexit(this)
                if (ui != null) {
                    ui.update(job, b);
                    return;
                }
            }
            if (b) {
                this.runCount += 1;
            }
        }
    }
    
    public void cancel(final Host host) {
        while (true) {
            while (true) {
                final Iterator<Job> iterator2;
                synchronized (this.queue) {
                    final Iterator<SyncTask> iterator = this.queue.iterator();
                    while (iterator.hasNext()) {
                        final SyncTask syncTask = iterator.next();
                        if (syncTask.runNow && host == syncTask.job.host) {
                            iterator.remove();
                        }
                    }
                    // monitorexit(this.queue)
                    iterator2 = host.getJobs().iterator();
                    if (!iterator2.hasNext()) {
                        return;
                    }
                }
                final Job job = iterator2.next();
                if (job.running) {
                    job.cancel();
                    continue;
                }
                continue;
            }
        }
    }
    
    HostList getHosts() {
        return SyncService.hosts;
    }
    
    public IBinder onBind(final Intent intent) {
        return (IBinder)new ServiceBinder();
    }
    
    public void onCreate() {
        super.onCreate();
        Log.i("SyncService", "Service created " + Thread.currentThread().getId());
        Utils.setPostMortem((Context)this.getApplication());
        this.notificationManager = (NotificationManager)this.getSystemService("notification");
        while (true) {
            try {
                if (SyncService.timerThread == null) {
                    SyncService.hosts = HostList.load((Context)this);
                    this.notificationManager.cancel(NotificationType.Progress.ordinal());
                    this.stopForeground(true);
                }
                this.scheduleDailyWakeup();
                RemoteFile.setRetryCount(Config.getNetworkTimeout((Context)this) / 3);
                this.queueTasks();
            }
            catch (Exception ex) {
                this.showError(this.getString(2131099822), String.valueOf(this.getString(2131099810)) + " " + Errors.getErrorMessage((Context)this, ex));
                SyncService.hosts = new HostList((Context)this);
                continue;
            }
            break;
        }
    }
    
    public void onDestroy() {
        Log.i("SyncService", "Service terminated " + Thread.currentThread().getId());
        while (true) {
            try {
                if (!Utils.isDebugBuild((Context)this)) {
                    Utils.getTracker((Context)this).trackEvent("SyncService", "Run", "Scheduled", this.runCount);
                    this.runCount = 0;
                }
                Utils.stopTracker();
                super.onDestroy();
            }
            catch (Throwable t) {
                t.printStackTrace();
                continue;
            }
            break;
        }
    }
    
    public void onLowMemory() {
        super.onLowMemory();
        Log.w("SyncService", "Low memory");
    }
    
    public int onStartCommand(final Intent cancelIntent, final int n, final int n2) {
        Log.i("SyncService", "OnStart");
        if (this.isClearAllNotifications(cancelIntent)) {
            Utils.setLastNotification((Context)this, null);
        }
        else if (this.isCancelRun(cancelIntent)) {
            this.cancelIntent = cancelIntent;
        }
        this.queueTasks();
        return 1;
    }
    
    public void run() {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: invokestatic    com/bv/wifisync/SyncService.acquireWakeLock:(Landroid/content/Context;)V
        //     4: aload_0        
        //     5: invokespecial   com/bv/wifisync/SyncService.runTasks:()V
        //     8: aload_0        
        //     9: getfield        com/bv/wifisync/SyncService.queue:Lcom/bv/wifisync/SyncService$SyncQueue;
        //    12: invokevirtual   com/bv/wifisync/SyncService$SyncQueue.isModified:()Z
        //    15: istore          7
        //    17: iload           7
        //    19: ifne            4
        //    22: aload_0        
        //    23: monitorenter   
        //    24: aload_0        
        //    25: invokespecial   com/bv/wifisync/SyncService.releaseWakeLock:()V
        //    28: ldc             "SyncService"
        //    30: new             Ljava/lang/StringBuilder;
        //    33: dup            
        //    34: ldc_w           "Exit timer thread "
        //    37: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    40: invokestatic    java/lang/Thread.currentThread:()Ljava/lang/Thread;
        //    43: invokevirtual   java/lang/Thread.getId:()J
        //    46: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //    49: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    52: invokestatic    android/util/Log.i:(Ljava/lang/String;Ljava/lang/String;)I
        //    55: pop            
        //    56: aload_0        
        //    57: new             Landroid/content/Intent;
        //    60: dup            
        //    61: aload_0        
        //    62: ldc             Lcom/bv/wifisync/SyncService;.class
        //    64: invokespecial   android/content/Intent.<init>:(Landroid/content/Context;Ljava/lang/Class;)V
        //    67: invokevirtual   com/bv/wifisync/SyncService.stopService:(Landroid/content/Intent;)Z
        //    70: pop            
        //    71: ldc             "SyncService"
        //    73: new             Ljava/lang/StringBuilder;
        //    76: dup            
        //    77: ldc_w           "Stop service "
        //    80: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //    83: invokestatic    java/lang/Thread.currentThread:()Ljava/lang/Thread;
        //    86: invokevirtual   java/lang/Thread.getId:()J
        //    89: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //    92: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //    95: invokestatic    android/util/Log.i:(Ljava/lang/String;Ljava/lang/String;)I
        //    98: pop            
        //    99: aconst_null    
        //   100: putstatic       com/bv/wifisync/SyncService.timerThread:Lcom/bv/wifisync/SyncService$TimerThread;
        //   103: aload_0        
        //   104: monitorexit    
        //   105: return         
        //   106: astore_2       
        //   107: aload_0        
        //   108: monitorenter   
        //   109: aload_0        
        //   110: invokespecial   com/bv/wifisync/SyncService.releaseWakeLock:()V
        //   113: ldc             "SyncService"
        //   115: new             Ljava/lang/StringBuilder;
        //   118: dup            
        //   119: ldc_w           "Exit timer thread "
        //   122: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   125: invokestatic    java/lang/Thread.currentThread:()Ljava/lang/Thread;
        //   128: invokevirtual   java/lang/Thread.getId:()J
        //   131: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //   134: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   137: invokestatic    android/util/Log.i:(Ljava/lang/String;Ljava/lang/String;)I
        //   140: pop            
        //   141: aload_0        
        //   142: new             Landroid/content/Intent;
        //   145: dup            
        //   146: aload_0        
        //   147: ldc             Lcom/bv/wifisync/SyncService;.class
        //   149: invokespecial   android/content/Intent.<init>:(Landroid/content/Context;Ljava/lang/Class;)V
        //   152: invokevirtual   com/bv/wifisync/SyncService.stopService:(Landroid/content/Intent;)Z
        //   155: pop            
        //   156: ldc             "SyncService"
        //   158: new             Ljava/lang/StringBuilder;
        //   161: dup            
        //   162: ldc_w           "Stop service "
        //   165: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   168: invokestatic    java/lang/Thread.currentThread:()Ljava/lang/Thread;
        //   171: invokevirtual   java/lang/Thread.getId:()J
        //   174: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //   177: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   180: invokestatic    android/util/Log.i:(Ljava/lang/String;Ljava/lang/String;)I
        //   183: pop            
        //   184: aconst_null    
        //   185: putstatic       com/bv/wifisync/SyncService.timerThread:Lcom/bv/wifisync/SyncService$TimerThread;
        //   188: aload_0        
        //   189: monitorexit    
        //   190: aload_2        
        //   191: athrow         
        //   192: astore_1       
        //   193: aload_0        
        //   194: aload_0        
        //   195: ldc_w           2131099822
        //   198: invokevirtual   com/bv/wifisync/SyncService.getString:(I)Ljava/lang/String;
        //   201: aload_0        
        //   202: aload_1        
        //   203: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
        //   206: invokespecial   com/bv/wifisync/SyncService.showError:(Ljava/lang/String;Ljava/lang/String;)V
        //   209: goto            105
        //   212: astore_3       
        //   213: aload_0        
        //   214: monitorexit    
        //   215: aload_3        
        //   216: athrow         
        //   217: astore          8
        //   219: aload_0        
        //   220: monitorexit    
        //   221: aload           8
        //   223: athrow         
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  0      4      192    212    Ljava/lang/Throwable;
        //  4      17     106    217    Any
        //  22     24     192    212    Ljava/lang/Throwable;
        //  24     105    217    224    Any
        //  107    109    192    212    Ljava/lang/Throwable;
        //  109    190    212    217    Any
        //  190    192    192    212    Ljava/lang/Throwable;
        //  213    215    212    217    Any
        //  215    217    192    212    Ljava/lang/Throwable;
        //  219    221    217    224    Any
        //  221    224    192    212    Ljava/lang/Throwable;
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0105:
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
    
    void runNow(final Job job) {
        Log.i("SyncService", "Run now: " + job.getName() + " " + job.id);
        synchronized (this.queue) {
            if (!job.running && !this.isScheduled(job)) {
                this.queue.add(new SyncTask(job, true));
            }
        }
    }
    
    void setUI(final Notify ui) {
        synchronized (this) {
            this.ui = ui;
            if (SyncService.timerThread != null) {
                TimerThread.access$1(SyncService.timerThread, ui);
            }
        }
    }
    
    void update() throws IOException {
        SyncService.hosts.save((Context)this);
        this.startService(new Intent((Context)this, (Class)SyncService.class));
    }
    
    private enum NotificationType
    {
        Error("Error", 0), 
        JobError("JobError", 1), 
        Progress("Progress", 2);
    }
    
    interface Notify
    {
        boolean onProgress(Job p0, ProgressNotification.ProgressAction p1, int p2, IFile p3);
        
        void update(Job p0, boolean p1);
    }
    
    class ServiceBinder extends Binder
    {
        SyncService getService() {
            return SyncService.this;
        }
    }
    
    private class SyncQueue extends LinkedList<SyncTask>
    {
        private volatile boolean modified;
        
        public boolean add(final SyncTask syncTask) {
            synchronized (this) {
                this.modified = true;
                return super.add(syncTask);
            }
        }
        
        boolean isModified() {
            return this.modified;
        }
        
        public SyncTask peek() {
            synchronized (this) {
                Collections.sort((List<Object>)this, (Comparator<? super Object>)new TaskComparator((TaskComparator)null));
                return super.peek();
            }
        }
        
        public SyncTask poll() {
            synchronized (this) {
                Collections.sort((List<Object>)this, (Comparator<? super Object>)new TaskComparator((TaskComparator)null));
                final SyncTask syncTask = super.poll();
                this.modified = false;
                return syncTask;
            }
        }
    }
    
    private class SyncTask implements Runnable
    {
        private final Job job;
        final boolean runNow;
        
        SyncTask(final SyncService syncService, final Job job) {
            this(syncService, job, false);
        }
        
        SyncTask(final Job job, final boolean runNow) {
            super();
            this.job = job;
            this.runNow = runNow;
        }
        
        private void clearNotification(final Job job) {
            if (!SyncService.hosts.hasFailedJobs()) {
                SyncService.this.notificationManager.cancel(NotificationType.JobError.ordinal());
                Utils.setLastNotification((Context)SyncService.this, null);
            }
            else {
                final Utils.LastNotification lastNotification = Utils.getLastNotification((Context)SyncService.this);
                if (lastNotification != null) {
                    if (lastNotification.jobId == job.id) {
                        SyncService.this.notificationManager.cancel(NotificationType.JobError.ordinal());
                        Utils.setLastNotification((Context)SyncService.this, null);
                    }
                    else if (lastNotification.jobId != 0 && Config.getShowErrorNotification((Context)SyncService.this)) {
                        this.showJobError(lastNotification.title, lastNotification.details, lastNotification.jobId);
                    }
                }
            }
        }
        
        private void internalRun() {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: aload_0        
            //     1: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //     4: aload_0        
            //     5: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //     8: invokestatic    com/bv/wifisync/SyncService.access$11:(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;)V
            //    11: aload_0        
            //    12: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //    15: aload_0        
            //    16: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //    19: aload_0        
            //    20: getfield        com/bv/wifisync/SyncService$SyncTask.runNow:Z
            //    23: invokevirtual   com/bv/wifisync/Job.initRun:(Landroid/content/Context;Z)V
            //    26: invokestatic    com/bv/wifisync/SyncService.access$8:()Lcom/bv/wifisync/HostList;
            //    29: aload_0        
            //    30: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //    33: invokevirtual   com/bv/wifisync/HostList.save:(Landroid/content/Context;)V
            //    36: bipush          10
            //    38: invokestatic    android/os/Process.setThreadPriority:(I)V
            //    41: aload_0        
            //    42: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //    45: aload_0        
            //    46: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //    49: iconst_1       
            //    50: invokestatic    com/bv/wifisync/SyncService.access$10:(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
            //    53: aload_0        
            //    54: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //    57: aload_0        
            //    58: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //    61: new             Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;
            //    64: dup            
            //    65: aload_0        
            //    66: aconst_null    
            //    67: invokespecial   com/bv/wifisync/SyncService$SyncTask$JobProgress.<init>:(Lcom/bv/wifisync/SyncService$SyncTask;Lcom/bv/wifisync/SyncService$SyncTask$JobProgress;)V
            //    70: aload_0        
            //    71: getfield        com/bv/wifisync/SyncService$SyncTask.runNow:Z
            //    74: invokevirtual   com/bv/wifisync/Job.run:(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;Z)V
            //    77: aload_0        
            //    78: aload_0        
            //    79: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //    82: invokespecial   com/bv/wifisync/SyncService$SyncTask.clearNotification:(Lcom/bv/wifisync/Job;)V
            //    85: aload_0        
            //    86: iconst_1       
            //    87: invokespecial   com/bv/wifisync/SyncService$SyncTask.vibrate:(Z)V
            //    90: invokestatic    com/bv/wifisync/SyncService.access$8:()Lcom/bv/wifisync/HostList;
            //    93: aload_0        
            //    94: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //    97: invokevirtual   com/bv/wifisync/HostList.save:(Landroid/content/Context;)V
            //   100: aload_0        
            //   101: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   104: iconst_1       
            //   105: invokevirtual   com/bv/wifisync/SyncService.stopForeground:(Z)V
            //   108: aload_0        
            //   109: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   112: invokestatic    com/bv/wifisync/SyncService.access$5:(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;
            //   115: getstatic       com/bv/wifisync/SyncService$NotificationType.Progress:Lcom/bv/wifisync/SyncService$NotificationType;
            //   118: invokevirtual   com/bv/wifisync/SyncService$NotificationType.ordinal:()I
            //   121: invokevirtual   android/app/NotificationManager.cancel:(I)V
            //   124: aload_0        
            //   125: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   128: aload_0        
            //   129: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //   132: iconst_0       
            //   133: invokestatic    com/bv/wifisync/SyncService.access$10:(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
            //   136: return         
            //   137: astore          5
            //   139: invokestatic    com/bv/wifisync/SyncService.access$8:()Lcom/bv/wifisync/HostList;
            //   142: aload_0        
            //   143: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   146: invokevirtual   com/bv/wifisync/HostList.save:(Landroid/content/Context;)V
            //   149: aload_0        
            //   150: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   153: iconst_1       
            //   154: invokevirtual   com/bv/wifisync/SyncService.stopForeground:(Z)V
            //   157: aload_0        
            //   158: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   161: invokestatic    com/bv/wifisync/SyncService.access$5:(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;
            //   164: getstatic       com/bv/wifisync/SyncService$NotificationType.Progress:Lcom/bv/wifisync/SyncService$NotificationType;
            //   167: invokevirtual   com/bv/wifisync/SyncService$NotificationType.ordinal:()I
            //   170: invokevirtual   android/app/NotificationManager.cancel:(I)V
            //   173: aload_0        
            //   174: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   177: aload_0        
            //   178: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //   181: iconst_0       
            //   182: invokestatic    com/bv/wifisync/SyncService.access$10:(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
            //   185: goto            136
            //   188: astore          6
            //   190: aload_0        
            //   191: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   194: aload_0        
            //   195: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   198: ldc             2131099811
            //   200: invokevirtual   com/bv/wifisync/SyncService.getString:(I)Ljava/lang/String;
            //   203: aload_0        
            //   204: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   207: aload           6
            //   209: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
            //   212: invokestatic    com/bv/wifisync/SyncService.access$9:(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V
            //   215: goto            149
            //   218: astore_3       
            //   219: aload_0        
            //   220: aload_3        
            //   221: invokespecial   com/bv/wifisync/SyncService$SyncTask.showJobError:(Ljava/lang/Throwable;)V
            //   224: aload_0        
            //   225: iconst_0       
            //   226: invokespecial   com/bv/wifisync/SyncService$SyncTask.vibrate:(Z)V
            //   229: invokestatic    com/bv/wifisync/SyncService.access$8:()Lcom/bv/wifisync/HostList;
            //   232: aload_0        
            //   233: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   236: invokevirtual   com/bv/wifisync/HostList.save:(Landroid/content/Context;)V
            //   239: aload_0        
            //   240: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   243: iconst_1       
            //   244: invokevirtual   com/bv/wifisync/SyncService.stopForeground:(Z)V
            //   247: aload_0        
            //   248: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   251: invokestatic    com/bv/wifisync/SyncService.access$5:(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;
            //   254: getstatic       com/bv/wifisync/SyncService$NotificationType.Progress:Lcom/bv/wifisync/SyncService$NotificationType;
            //   257: invokevirtual   com/bv/wifisync/SyncService$NotificationType.ordinal:()I
            //   260: invokevirtual   android/app/NotificationManager.cancel:(I)V
            //   263: aload_0        
            //   264: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   267: aload_0        
            //   268: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //   271: iconst_0       
            //   272: invokestatic    com/bv/wifisync/SyncService.access$10:(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
            //   275: goto            136
            //   278: astore          4
            //   280: aload_0        
            //   281: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   284: aload_0        
            //   285: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   288: ldc             2131099811
            //   290: invokevirtual   com/bv/wifisync/SyncService.getString:(I)Ljava/lang/String;
            //   293: aload_0        
            //   294: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   297: aload           4
            //   299: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
            //   302: invokestatic    com/bv/wifisync/SyncService.access$9:(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V
            //   305: goto            239
            //   308: astore_1       
            //   309: invokestatic    com/bv/wifisync/SyncService.access$8:()Lcom/bv/wifisync/HostList;
            //   312: aload_0        
            //   313: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   316: invokevirtual   com/bv/wifisync/HostList.save:(Landroid/content/Context;)V
            //   319: aload_0        
            //   320: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   323: iconst_1       
            //   324: invokevirtual   com/bv/wifisync/SyncService.stopForeground:(Z)V
            //   327: aload_0        
            //   328: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   331: invokestatic    com/bv/wifisync/SyncService.access$5:(Lcom/bv/wifisync/SyncService;)Landroid/app/NotificationManager;
            //   334: getstatic       com/bv/wifisync/SyncService$NotificationType.Progress:Lcom/bv/wifisync/SyncService$NotificationType;
            //   337: invokevirtual   com/bv/wifisync/SyncService$NotificationType.ordinal:()I
            //   340: invokevirtual   android/app/NotificationManager.cancel:(I)V
            //   343: aload_0        
            //   344: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   347: aload_0        
            //   348: getfield        com/bv/wifisync/SyncService$SyncTask.job:Lcom/bv/wifisync/Job;
            //   351: iconst_0       
            //   352: invokestatic    com/bv/wifisync/SyncService.access$10:(Lcom/bv/wifisync/SyncService;Lcom/bv/wifisync/Job;Z)V
            //   355: aload_1        
            //   356: athrow         
            //   357: astore_2       
            //   358: aload_0        
            //   359: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   362: aload_0        
            //   363: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   366: ldc             2131099811
            //   368: invokevirtual   com/bv/wifisync/SyncService.getString:(I)Ljava/lang/String;
            //   371: aload_0        
            //   372: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   375: aload_2        
            //   376: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
            //   379: invokestatic    com/bv/wifisync/SyncService.access$9:(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V
            //   382: goto            319
            //   385: astore          7
            //   387: aload_0        
            //   388: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   391: aload_0        
            //   392: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   395: ldc             2131099811
            //   397: invokevirtual   com/bv/wifisync/SyncService.getString:(I)Ljava/lang/String;
            //   400: aload_0        
            //   401: getfield        com/bv/wifisync/SyncService$SyncTask.this$0:Lcom/bv/wifisync/SyncService;
            //   404: aload           7
            //   406: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
            //   409: invokestatic    com/bv/wifisync/SyncService.access$9:(Lcom/bv/wifisync/SyncService;Ljava/lang/String;Ljava/lang/String;)V
            //   412: goto            100
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                                        
            //  -----  -----  -----  -----  --------------------------------------------
            //  0      90     137    218    Ljava/util/concurrent/CancellationException;
            //  0      90     218    308    Ljava/lang/Throwable;
            //  0      90     308    385    Any
            //  90     100    385    415    Ljava/io/IOException;
            //  139    149    188    218    Ljava/io/IOException;
            //  219    229    308    385    Any
            //  229    239    278    308    Ljava/io/IOException;
            //  309    319    357    385    Ljava/io/IOException;
            // 
            // The error that occurred was:
            // 
            // java.lang.IllegalStateException: Expression is linked from several locations: Label_0100:
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
        
        private void showJobError(final String s, final String s2, final int n) {
            final Notification notification = new Notification(2130837550, (CharSequence)s, System.currentTimeMillis());
            SyncService.this.updateNotification(notification, s, s2, n);
            final Intent intent = new Intent((Context)SyncService.this, (Class)SyncService.class);
            intent.putExtra("notification", n);
            notification.deleteIntent = PendingIntent.getService((Context)SyncService.this, 0, intent, 1207959552);
            SyncService.this.notificationManager.notify(NotificationType.JobError.ordinal(), notification);
            Utils.setLastNotification((Context)SyncService.this, new Utils.LastNotification(s, s2, n));
        }
        
        private void showJobError(final Throwable t) {
            final String errorMessage = Errors.getErrorMessage((Context)SyncService.this, t);
            if (Config.getShowErrorNotification((Context)SyncService.this)) {
                this.showJobError(SyncService.this.getString(2131099932, new Object[] { this.job.getName() }), errorMessage, this.job.id);
            }
        }
        
        private void vibrate(final boolean b) {
            if (Config.getVibrate((Context)SyncService.this)) {
                final Vibrator vibrator = (Vibrator)SyncService.this.getSystemService("vibrator");
                final long[] array = { 0L, 100L, 100L, 400L, 200L };
                final long[] array2 = { 0L, 100L, 100L, 100L, 100L, 100L };
                long[] array3;
                if (b) {
                    array3 = array2;
                }
                else {
                    array3 = array;
                }
                vibrator.vibrate(array3, -1);
            }
        }
        
        String getName() {
            return this.job.getName();
        }
        
        Date getScheduledTime() {
            return this.job.getNextTimeToRun((Context)SyncService.this);
        }
        
        boolean isConnected() {
            return this.job.isConnected((Context)SyncService.this);
        }
        
        boolean isReady() {
            return this.runNow || this.job.isReady((Context)SyncService.this);
        }
        
        public void run() {
            synchronized (this) {
                if (!this.job.removed()) {
                    this.internalRun();
                }
            }
        }
        
        private class JobProgress implements ProgressNotification
        {
            private long lastUpdateTime;
            
            private Notify getUI() {
                while (true) {
                    while (true) {
                        synchronized (SyncService.this) {
                            final SyncService access$1 = SyncService.this;
                            if (SyncService.timerThread != null) {
                                final Notify access$2 = SyncService.timerThread.ui;
                                SyncService.access$7(access$1, access$2);
                                return access$2;
                            }
                        }
                        final Notify access$2 = null;
                        continue;
                    }
                }
            }
            
            @SuppressLint({ "NewApi" })
            private void updateNotification(final ProgressNotification.ProgressAction progressAction, final int n) {
                final long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis - this.lastUpdateTime > 100L) {
                    if (SyncService.timerThread != null) {
                        final StringBuilder sb = new StringBuilder(String.valueOf(Utils.getActionString(progressAction, (Context)SyncService.this)));
                        String string;
                        if (n == 0) {
                            string = "";
                        }
                        else {
                            string = " " + n + "%";
                        }
                        final String string2 = sb.append(string).toString();
                        if (Build$VERSION.SDK_INT < 11) {
                            final Notification access$3 = SyncService.this.runningNotification;
                            int iconLevel;
                            if (SyncService.this.runningNotification.iconLevel == 0) {
                                iconLevel = 1;
                            }
                            else {
                                iconLevel = 0;
                            }
                            access$3.iconLevel = iconLevel;
                            SyncService.this.runningNotification.setLatestEventInfo((Context)SyncService.this, (CharSequence)SyncTask.this.job.getName(), (CharSequence)string2, SyncService.this.runningNotification.contentIntent);
                        }
                        else {
                            final Notification$Builder setContentIntent = new Notification$Builder((Context)SyncService.this).setContentTitle((CharSequence)SyncTask.this.job.getName()).setContentText((CharSequence)string2).setContentIntent(SyncService.this.runningNotification.contentIntent);
                            boolean b;
                            if (SyncService.this.runningNotification.iconLevel == 0) {
                                b = true;
                            }
                            else {
                                b = false;
                            }
                            final Notification$Builder setWhen = setContentIntent.setSmallIcon(2131034112, (int)(b ? 1 : 0)).setOngoing(true).setOnlyAlertOnce(true).setTicker(SyncService.this.runningNotification.tickerText).setAutoCancel(false).setWhen(SyncService.this.runningNotification.when);
                            if (Build$VERSION.SDK_INT >= 14) {
                                setWhen.setProgress(100, n, false);
                            }
                            if (Build$VERSION.SDK_INT < 16) {
                                SyncService.access$4(SyncService.this, setWhen.getNotification());
                            }
                            else {
                                setWhen.setUsesChronometer(true);
                                SyncService.access$4(SyncService.this, setWhen.build());
                            }
                        }
                        SyncService.this.notificationManager.notify(NotificationType.Progress.ordinal(), SyncService.this.runningNotification);
                    }
                    this.lastUpdateTime = currentTimeMillis;
                }
                SyncService.access$6(SyncService.this, currentTimeMillis);
            }
            
            public boolean update(final ProgressNotification.ProgressAction progressAction, final int n, final IFile file) {
                if (progressAction != ProgressNotification.ProgressAction.Listing) {
                    this.updateNotification(progressAction, n);
                }
                boolean b;
                if (SyncService.this.cancelIntent != null) {
                    SyncService.access$1(SyncService.this, null);
                    b = false;
                }
                else {
                    final Notify ui = this.getUI();
                    b = (ui == null || ui.onProgress(SyncTask.this.job, progressAction, n, file));
                }
                return b;
            }
        }
    }
    
    private class TaskComparator implements Comparator<SyncTask>
    {
        private int compareConnectedRouters(final SyncTask syncTask, final SyncTask syncTask2) {
            final boolean connected = syncTask.job.isConnected((Context)SyncService.this);
            final boolean connected2 = syncTask2.job.isConnected((Context)SyncService.this);
            int n;
            if ((!connected || !connected2) && (connected || connected2)) {
                n = 0;
            }
            else {
                n = 1;
            }
            int n2 = 0;
            if (n == 0) {
                if (connected) {
                    n2 = -1;
                }
                else {
                    n2 = 1;
                }
            }
            return n2;
        }
        
        public int compare(final SyncTask syncTask, final SyncTask syncTask2) {
            int n;
            if (syncTask == syncTask2 || (syncTask.runNow && syncTask2.runNow)) {
                n = 0;
            }
            else {
                final Date nextTimeToRun = syncTask.job.getNextTimeToRun((Context)SyncService.this);
                final Date nextTimeToRun2 = syncTask2.job.getNextTimeToRun((Context)SyncService.this);
                if (nextTimeToRun == null && nextTimeToRun2 == null) {
                    n = this.compareConnectedRouters(syncTask, syncTask2);
                }
                else if (syncTask.runNow || nextTimeToRun == null) {
                    n = -1;
                }
                else if (syncTask2.runNow || nextTimeToRun2 == null) {
                    n = 1;
                }
                else {
                    n = this.compareConnectedRouters(syncTask, syncTask2);
                    if (n == 0) {
                        n = (int)(nextTimeToRun.getTime() - nextTimeToRun2.getTime());
                    }
                }
            }
            return n;
        }
    }
    
    private static class TimerThread extends Thread
    {
        private Notify ui;
        
        TimerThread(final Runnable runnable, final Notify ui) {
            super(runnable, "TimerThread");
            this.ui = ui;
        }
        
        static /* synthetic */ void access$1(final TimerThread timerThread, final Notify ui) {
            timerThread.ui = ui;
        }
    }
}
