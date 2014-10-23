package com.bv.wifisync;

import android.util.*;
import android.net.wifi.*;
import android.os.*;
import android.graphics.drawable.*;
import java.io.*;
import java.util.*;
import com.bv.sync.*;
import java.util.concurrent.*;
import android.content.*;
import java.text.*;
import android.annotation.*;

class Job implements Serializable
{
    private static final String STATE_FILE = "state.dat";
    private static final String TAG = "Job";
    private static final int WIFI_MODE_FULL_HIGH_PERF = 3;
    private static final long serialVersionUID = -4783979084868644006L;
    private transient boolean canceled;
    CifsSync.Options.Direction direction;
    Filter filter;
    private List<HistoryItem> history;
    transient Host host;
    int id;
    private int interval;
    Throwable lastResult;
    long lastRun;
    Boolean mirror;
    private String name;
    boolean overwrite;
    private String pcDir;
    private String phoneDir;
    Plugin plugin;
    transient boolean running;
    SyncSchedule schedule;
    private LinkedHashSet<String> scheduleRouters;
    private ScheduleType scheduleType;
    boolean skipMediaScan;
    private String stateFilePath;
    transient CifsSync.SyncStats syncStats;
    boolean trackDeletions;
    
    Job() {
        super();
        this.direction = CifsSync.Options.Direction.Both;
        this.overwrite = true;
        this.mirror = false;
        this.initSchedule();
    }
    
    private void addHistory(final Context context, final HistoryItem historyItem) throws IOException {
        if (this.history == null) {
            this.history = new LinkedList<HistoryItem>();
        }
        synchronized (this.history) {
            while (true) {
                final int size = this.history.size();
                if (size <= 0 || size < Config.getMaxHistoryLines()) {
                    break;
                }
                this.history.remove(0).remove(context);
            }
            this.history.add(historyItem);
        }
    }
    
    private void addHistoryResult(final HistoryItem historyItem, final Context context, final Collection<SyncItem> collection) throws IOException {
        final LinkedList<SyncFile> list = new LinkedList<SyncFile>();
        final LinkedList<SyncFile> list2 = new LinkedList<SyncFile>();
        final LinkedList<SyncFile> list3 = new LinkedList<SyncFile>();
        this.splitFiles(collection, list, list2, list3);
        historyItem.localFileCount = list.size();
        historyItem.remoteFilesCount = list2.size();
        historyItem.deletedFilesCount = list3.size();
        if (historyItem.localFileCount != 0 || historyItem.remoteFilesCount != 0 || historyItem.deletedFilesCount != 0) {
            historyItem.workDir = this.getNewHistoryItemPath(context).getAbsolutePath();
            if (historyItem.localFileCount != 0) {
                Utils.writeObjectToFile(historyItem.getLocalFilesPath(), list, true);
            }
            if (historyItem.remoteFilesCount != 0) {
                Utils.writeObjectToFile(historyItem.getRemoteFilesPath(), list2, true);
            }
            if (historyItem.deletedFilesCount != 0) {
                Utils.writeObjectToFile(historyItem.getDeletedFilesPath(), list3, true);
            }
        }
        historyItem.reconnects = this.syncStats.reconnects;
        historyItem.transferBytes = this.syncStats.writeBytes;
        historyItem.transferTime = this.syncStats.readTime + this.syncStats.writeTime;
    }
    
    private Date checkWakeup(final Context context, Date o) {
        final long n = ((Date)o).getTime() - 1000 * this.schedule.wakeupInterval;
        final long currentTimeMillis = System.currentTimeMillis();
        Label_0039: {
            if (n > currentTimeMillis) {
                o = new Date(n);
            }
            else {
                if (this.host.getLastWakeUp() < n && !this.host.isUp() && this.isConnected(context)) {
                    while (true) {
                        try {
                            this.host.wakeup(context);
                            o = new Date(currentTimeMillis + 1000 * this.schedule.wakeupInterval);
                            break Label_0039;
                        }
                        catch (Exception ex) {
                            ex.printStackTrace();
                            continue;
                        }
                        break;
                    }
                }
                final long n2 = this.host.getLastWakeUp() + 1000 * this.schedule.wakeupInterval;
                if (((Date)o).getTime() < n2) {
                    o = new Date(n2);
                }
            }
        }
        Log.i("Job", String.valueOf(this.getName()) + " reschedule for wakeup " + o);
        return (Date)o;
    }
    
    private boolean deletionTrackIsValid() {
        return this.trackDeletions && (this.direction == CifsSync.Options.Direction.Both || (this.direction == CifsSync.Options.Direction.toLocal && !this.mirror) || (this.direction == CifsSync.Options.Direction.toRemote && !this.mirror));
    }
    
    private List<SyncItem> doSync(final Context context, final ProgressNotification progressNotification) throws Exception {
        final LocalFile localFolder = this.getLocalFolder(context);
        final HashMap<String, Long> deletionTrack = this.readDeletionTrack(context);
        final WifiManager$WifiLock lockWifi = this.lockWifi(context);
        try {
            progressNotification.update(ProgressNotification.ProgressAction.Connecting, 0, null);
            final RemoteFile remoteFolder = this.getRemoteFolder(context);
            Label_0185: {
                if (!Config.getIgnoreTimeZones(context)) {
                    break Label_0185;
                }
                CifsSync.Options.VerifyTimeZone verifyTimeZone = CifsSync.Options.VerifyTimeZone.All;
                while (true) {
                    final CifsSync.Options options = new CifsSync.Options(this.direction, this.overwrite, verifyTimeZone, this.getFileFilter(localFolder, remoteFolder));
                    options.ignoreSymLinks = Config.getIgnoreSymLinks(context);
                    options.mirror = this.mirror;
                    options.minFreeSpace = Config.getMinFreeSpace(context);
                    final CifsSync cifsSync = new CifsSync(options, deletionTrack);
                    try {
                        return cifsSync.sync(localFolder, remoteFolder, progressNotification);
                        verifyTimeZone = CifsSync.Options.VerifyTimeZone.OneHour;
                    }
                    finally {
                        this.syncStats = cifsSync.getStats();
                        progressNotification.update(ProgressNotification.ProgressAction.Saving, 0, null);
                        if (this.trackDeletions && !this.removed()) {
                            this.writeDeletionTrack(context, deletionTrack);
                        }
                    }
                }
            }
        }
        finally {
            lockWifi.release();
        }
    }
    
    private boolean equals(final String s, final String s2) {
        return s == s2 || (s != null && s.equals(s2)) || (s2 != null && s2.equals(s));
    }
    
    private long getDateFilter(final int n) {
        final Calendar instance = Calendar.getInstance();
        instance.set(11, 0);
        instance.set(12, 0);
        instance.set(13, 0);
        instance.set(14, 0);
        instance.add(6, -n);
        return instance.getTime().getTime();
    }
    
    private IFileFilter[] getFileFilter(final LocalFile localFile, final RemoteFile remoteFile) {
        final ArrayList<ExtensionFilter> list = new ArrayList<ExtensionFilter>();
        if (this.filter != null) {
            if (Utils.hasData(this.filter.includeLocalFiles)) {
                list.add(new FileFilter(this.filter.includeLocalFiles, IFileFilter.Action.Include, new IFile[] { localFile, remoteFile }));
            }
            if (Utils.hasData(this.filter.includeRemoteFiles)) {
                list.add(new FileFilter(this.filter.includeRemoteFiles, IFileFilter.Action.Include, new IFile[] { localFile, remoteFile }));
            }
            if (Utils.hasData(this.filter.includeExtensions)) {
                list.add((FileFilter)new ExtensionFilter(this.filter.includeExtensions, IFileFilter.Action.Include));
            }
            if (this.filter.includeModifiedDate != 0) {
                list.add((FileFilter)new DateFilter(this.getDateFilter(this.filter.includeModifiedDate), IFileFilter.Action.Include));
            }
            if (this.filter.ignoreHidden) {
                list.add((FileFilter)new IgnoreHiddenFilter());
            }
            if (this.filter.ignoreReadProtected) {
                list.add((FileFilter)new IgnoreReadProtectedFilter());
            }
            if (Utils.hasData(this.filter.localFiles)) {
                list.add(new FileFilter(this.filter.localFiles, IFileFilter.Action.Exclude, new IFile[] { localFile, remoteFile }));
            }
            if (Utils.hasData(this.filter.remoteFiles)) {
                list.add(new FileFilter(this.filter.remoteFiles, IFileFilter.Action.Exclude, new IFile[] { localFile, remoteFile }));
            }
            if (Utils.hasData(this.filter.extensions)) {
                list.add((FileFilter)new ExtensionFilter(this.filter.extensions, IFileFilter.Action.Exclude));
            }
            if (this.filter.modifiedDate != 0) {
                list.add((FileFilter)new DateFilter(this.getDateFilter(this.filter.modifiedDate), IFileFilter.Action.Exclude));
            }
        }
        IFileFilter[] array;
        if (list.size() != 0) {
            array = list.toArray(new IFileFilter[list.size()]);
        }
        else {
            array = null;
        }
        return array;
    }
    
    private File getNewHistoryItemPath(final Context context) throws IOException {
        final File file = new File(this.getWorkingDir(context), "history");
        return new File(file, new StringBuilder().append(getNextAvailableDir(context, file)).toString());
    }
    
    private static int getNextAvailableDir(final Context context, final File file) throws IOException {
        int i = 1;
        while (i < Integer.MAX_VALUE) {
            final File file2 = new File(file, new StringBuilder().append(i).toString());
            if (!file2.exists()) {
                if (!file2.mkdirs()) {
                    throw new IOException(String.valueOf(context.getString(2131099793)) + file2.getAbsolutePath());
                }
                return i;
            }
            else {
                ++i;
            }
        }
        throw new IOException(context.getString(2131099794));
    }
    
    private File getOldWorkingDir(final Context context) throws IOException {
        return new File(new File(context.getCacheDir(), "jobs"), new StringBuilder().append(this.id).toString());
    }
    
    private String getSpecialDirectory(final String s) {
        return Environment.getExternalStoragePublicDirectory(s).getAbsolutePath();
    }
    
    private SyncType getSpecialType(final String s, final String s2) {
        SyncType syncType;
        if (s.startsWith(this.getSpecialDirectory(Environment.DIRECTORY_MUSIC)) || this.equals(s2, "Music")) {
            syncType = SyncType.Music;
        }
        else if (s.startsWith(this.getSpecialDirectory(Environment.DIRECTORY_MOVIES)) || this.equals(s2, "Videos")) {
            syncType = SyncType.Movies;
        }
        else if (s.startsWith(this.getSpecialDirectory(Environment.DIRECTORY_PICTURES)) || s.startsWith(this.getSpecialDirectory(Environment.DIRECTORY_DCIM)) || this.equals(s2, "DCIM", "Pictures", "Camera")) {
            syncType = SyncType.Pictures;
        }
        else if (s.equals(Environment.getExternalStorageDirectory().getAbsolutePath()) || "/sdcard".equals(s)) {
            syncType = SyncType.SDCard;
        }
        else if (s.equals("/")) {
            syncType = SyncType.Root;
        }
        else if (s.startsWith(this.getSpecialDirectory(Environment.DIRECTORY_DOWNLOADS))) {
            syncType = SyncType.Downloads;
        }
        else {
            syncType = SyncType.Folder;
        }
        return syncType;
    }
    
    private File getStateFile(final Context context) throws IOException {
        File file2;
        if (this.stateFilePath != null) {
            final File file = new File(this.stateFilePath);
            if (!file.exists()) {
                this.trackWarning(context, "Warn", "DeletionTrack", "NotExists");
            }
            Utils.mkdirs(context, file.getParentFile());
            file2 = file;
        }
        else {
            final File file3 = new File(this.getWorkingDir(context), "state.dat");
            this.stateFilePath = file3.getAbsolutePath();
            file2 = file3;
        }
        return file2;
    }
    
    private File getWorkingDir(final Context context) throws IOException {
        final int id = this.id;
        final File file = new File(new File(context.getFilesDir(), "jobs"), new StringBuilder().append(this.id).toString());
        if (id != 0 && !file.exists()) {
            Log.i("Job", "Job directory is missing, recreating " + file.getAbsolutePath());
        }
        Utils.mkdirs(context, file);
        return file;
    }
    
    private void initSchedule() {
        if (this.schedule == null) {
            int interval = 0;
            int interval2;
            if (this.scheduleType == null || this.scheduleType == ScheduleType.Interval) {
                interval2 = this.interval;
            }
            else {
                final ScheduleType scheduleType = this.scheduleType;
                final ScheduleType time = ScheduleType.Time;
                interval2 = 0;
                interval = 0;
                if (scheduleType == time) {
                    interval = this.interval;
                    interval2 = 0;
                }
            }
            this.schedule = new SyncSchedule(interval2, interval, this.scheduleRouters, false, 0);
            this.interval = 0;
            this.scheduleType = null;
            this.scheduleRouters = null;
        }
    }
    
    private boolean isMediaJob() {
        final SyncType syncType = this.getSyncType();
        return syncType == SyncType.Music || syncType == SyncType.Pictures;
    }
    
    private WifiManager$WifiLock lockWifi(final Context context) {
        final WifiManager wifiManager = (WifiManager)context.getSystemService("wifi");
        int n;
        if (Build$VERSION.SDK_INT >= 12) {
            n = 3;
        }
        else {
            n = 1;
        }
        final WifiManager$WifiLock wifiLock = wifiManager.createWifiLock(n, context.getString(2131099649));
        wifiLock.acquire();
        return wifiLock;
    }
    
    private Drawable overlayImage(final Context context, final int n, final int n2) {
        return (Drawable)new LayerDrawable(new Drawable[] { context.getResources().getDrawable(n), context.getResources().getDrawable(n2) });
    }
    
    private HashMap<String, Long> readDeletionTrack(final Context context) throws ClassNotFoundException, IOException {
        HashMap<String, Long> hashMap;
        if (this.deletionTrackIsValid()) {
            final File stateFile = this.getStateFile(context);
            final boolean exists = stateFile.exists();
            hashMap = null;
            if (exists) {
                hashMap = (HashMap<String, Long>)Utils.readObjectFromFile(stateFile, true);
            }
            if (hashMap == null) {
                hashMap = new HashMap<String, Long>();
            }
        }
        else {
            this.removeDeletionTrackFile(context);
            hashMap = null;
        }
        return hashMap;
    }
    
    private void readObject(final ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        if (this.mirror == null) {
            this.mirror = (this.trackDeletions && this.direction != CifsSync.Options.Direction.Both);
        }
        this.initSchedule();
    }
    
    private void refreshMedia(final Context context, final ProgressNotification progressNotification) throws InterruptedException {
        if (this.isMediaJob() && this.plugin.getChangedItems() != null) {
            final Collection<String> createdList = this.toCreatedList(this.plugin.getChangedItems());
            if (createdList.size() != 0) {
                Utils.refreshMedia(context, createdList, progressNotification);
            }
            final Collection<String> deletedList = this.toDeletedList(this.plugin.getChangedItems());
            if (deletedList.size() != 0) {
                Utils.refreshDeletedMedia(context, deletedList, progressNotification);
            }
        }
    }
    
    private void removeDeletionTrackFile(final Context context) throws IOException {
        if (this.stateFilePath != null) {
            Utils.deleteFile(context, new File(this.stateFilePath));
            this.stateFilePath = null;
        }
    }
    
    private void runPlugin(final Context context, final ProgressNotification progressNotification) throws IOException, InterruptedException {
        if (this.plugin == null) {
            return;
        }
        try {
            this.plugin.run(this, context, progressNotification);
        }
        finally {
            if (!this.skipMediaScan) {
                this.refreshMedia(context, progressNotification);
            }
            this.plugin.clear();
        }
    }
    
    private void splitFiles(final Collection<SyncItem> collection, final LinkedList<SyncFile> list, final LinkedList<SyncFile> list2, final LinkedList<SyncFile> list3) throws IOException {
        for (final SyncItem syncItem : collection) {
            final SyncFile syncFile = new SyncFile(syncItem.absolutePath, syncItem.size, syncItem.lastModified, syncItem.isFolder);
            if (syncItem.type == SyncItem.Type.Deleted) {
                list3.add(syncFile);
            }
            else {
                LinkedList<SyncFile> list4;
                if (syncItem.type == SyncItem.Type.RemoteFile) {
                    list4 = list2;
                }
                else {
                    list4 = list;
                }
                list4.add(syncFile);
            }
        }
    }
    
    private Collection<String> toCreatedList(final Collection<MovedItem> collection) {
        final ArrayList<String> list = new ArrayList<String>();
        final Iterator<MovedItem> iterator = collection.iterator();
        while (iterator.hasNext()) {
            list.add(iterator.next().newPath);
        }
        return list;
    }
    
    private Collection<String> toDeletedList(final Collection<MovedItem> collection) {
        final ArrayList<String> list = new ArrayList<String>();
        final Iterator<MovedItem> iterator = collection.iterator();
        while (iterator.hasNext()) {
            list.add(iterator.next().absolutePath);
        }
        return list;
    }
    
    private void trackWarning(final Context context, final String s, final String s2, final String s3) {
        try {
            if (!Utils.isDebugBuild(context)) {
                Utils.getTracker(context).trackEvent(s, s2, s3, 1);
            }
        }
        catch (Throwable t) {
            t.printStackTrace();
        }
    }
    
    private void writeDeletionTrack(final Context context, final HashMap<String, Long> hashMap) throws IOException {
        Utils.deleteFile(context, this.getStateFile(context));
        this.stateFilePath = null;
        final File stateFile = this.getStateFile(context);
        final File file = new File(String.valueOf(stateFile.getAbsolutePath()) + ".tmp");
        Utils.writeObjectToFile(file, hashMap, true);
        Utils.renameFile(context, file, stateFile);
    }
    
    void cancel() {
        this.canceled = true;
    }
    
    boolean equals(final String s, final String... array) {
        final int length = array.length;
        int n = 0;
        boolean b;
        while (true) {
            b = false;
            if (n >= length) {
                break;
            }
            if (array[n].equalsIgnoreCase(s)) {
                return true;
            }
            ++n;
        }
        return b;
        b = true;
        return b;
    }
    
    String getDefaultName() {
        final String phoneDir = this.getPhoneDir();
        String name;
        if ("/".equals(phoneDir)) {
            name = "/";
        }
        else if (phoneDir != null) {
            name = new File(phoneDir).getName();
        }
        else {
            name = "";
        }
        return name;
    }
    
    Drawable getDrawable(final Context context) {
        final int iconId = this.getIconId();
        Drawable drawable;
        if (this.lastResult != null && (!this.running || !(this.lastResult instanceof NeverFinishedException))) {
            drawable = this.overlayImage(context, iconId, 2130837505);
        }
        else {
            drawable = context.getResources().getDrawable(iconId);
        }
        return drawable;
    }
    
    List<HistoryItem> getHistory() {
        if (this.history == null) {
            this.history = new LinkedList<HistoryItem>();
        }
        synchronized (this.history) {
            return new LinkedList<HistoryItem>(this.history);
        }
    }
    
    int getIconId() {
        return (new int[] { 2130837530, 2130837532, 2130837536, 2130837554, 2130837545, 2130837535, 2130837516 })[this.getSyncType().ordinal()];
    }
    
    LocalFile getLocalFolder(final Context context) throws IOException {
        return new LocalFileEx(context, new File(this.getPhoneDir()));
    }
    
    String getName() {
        String s;
        if (this.name == null) {
            s = this.getDefaultName();
        }
        else {
            s = this.name;
        }
        return s;
    }
    
    Date getNextTimeToRun(final Context context) {
        synchronized (this) {
            Date date;
            if (this.host == null) {
                date = null;
            }
            else {
                date = this.schedule.getNextTimeToRun(context, this.lastRun);
                if (date != null && this.schedule.wakeupInterval != 0) {
                    date = this.checkWakeup(context, date);
                }
            }
            return date;
        }
    }
    
    String getPcDir() {
        return this.pcDir;
    }
    
    String getPhoneDir() {
        String s;
        if (this.phoneDir != null && this.phoneDir.length() > 0 && !this.phoneDir.startsWith("/")) {
            s = new File(Environment.getExternalStorageDirectory(), this.phoneDir).getAbsolutePath();
        }
        else {
            s = this.phoneDir;
        }
        return s;
    }
    
    RemoteFile getRemoteFolder(final Context context) throws Exception {
        final String string = "smb://" + this.host.resolveName(context) + "/" + this.getPcDir();
        if (this.canceled) {
            throw new CancellationException();
        }
        return new RemoteFile(this.host.domain, this.host.user, this.host.getPassword(context), string);
    }
    
    SyncType getSyncType() {
        final String phoneDir = this.getPhoneDir();
        SyncType syncType;
        if (phoneDir == null) {
            syncType = SyncType.Folder;
        }
        else {
            syncType = this.getSpecialType(phoneDir, this.getName());
        }
        return syncType;
    }
    
    void initRun(final Context context, final boolean b) throws IOException {
        this.canceled = false;
        this.lastRun = System.currentTimeMillis();
        this.running = true;
        this.lastResult = new NeverFinishedException(context.getString(2131099944));
        this.addHistory(context, new HistoryItem(null));
    }
    
    boolean isCanceled() {
        return this.canceled;
    }
    
    boolean isChargingDependant() {
        return this.schedule.whenCharging;
    }
    
    boolean isConnected(final Context context) {
        synchronized (this) {
            return this.schedule.isConnected(context);
        }
    }
    
    boolean isReady(final Context context) {
        boolean ready = this.schedule.isReady(context, this.lastRun);
        if (ready && this.schedule.wakeupInterval != 0) {
            ready = (this.getNextTimeToRun(context).getTime() <= System.currentTimeMillis());
        }
        return ready;
    }
    
    boolean isRouterDependant() {
        synchronized (this) {
            return this.schedule.isRouterDependant();
        }
    }
    
    boolean isScheduled() {
        return this.schedule.isScheduled();
    }
    
    void remove(final Context p0) throws IOException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: getfield        com/bv/wifisync/Job.history:Ljava/util/List;
        //     4: ifnull          40
        //     7: aload_0        
        //     8: getfield        com/bv/wifisync/Job.history:Ljava/util/List;
        //    11: astore          5
        //    13: aload           5
        //    15: monitorenter   
        //    16: aload_0        
        //    17: getfield        com/bv/wifisync/Job.history:Ljava/util/List;
        //    20: invokeinterface java/util/List.iterator:()Ljava/util/Iterator;
        //    25: astore          7
        //    27: aload           7
        //    29: invokeinterface java/util/Iterator.hasNext:()Z
        //    34: ifne            116
        //    37: aload           5
        //    39: monitorexit    
        //    40: aload_0        
        //    41: getfield        com/bv/wifisync/Job.id:I
        //    44: ifeq            91
        //    47: aload_0        
        //    48: aload_1        
        //    49: invokespecial   com/bv/wifisync/Job.getOldWorkingDir:(Landroid/content/Context;)Ljava/io/File;
        //    52: astore_3       
        //    53: aload_3        
        //    54: invokevirtual   java/io/File.exists:()Z
        //    57: ifeq            65
        //    60: aload_1        
        //    61: aload_3        
        //    62: invokestatic    com/bv/wifisync/Utils.rmdir:(Landroid/content/Context;Ljava/io/File;)V
        //    65: aload_0        
        //    66: aload_1        
        //    67: invokespecial   com/bv/wifisync/Job.getWorkingDir:(Landroid/content/Context;)Ljava/io/File;
        //    70: astore          4
        //    72: aload           4
        //    74: invokevirtual   java/io/File.exists:()Z
        //    77: ifeq            86
        //    80: aload_1        
        //    81: aload           4
        //    83: invokestatic    com/bv/wifisync/Utils.rmdir:(Landroid/content/Context;Ljava/io/File;)V
        //    86: aload_0        
        //    87: iconst_0       
        //    88: putfield        com/bv/wifisync/Job.id:I
        //    91: aload_0        
        //    92: monitorenter   
        //    93: aload_0        
        //    94: getfield        com/bv/wifisync/Job.host:Lcom/bv/wifisync/Host;
        //    97: ifnull          113
        //   100: aload_0        
        //   101: getfield        com/bv/wifisync/Job.host:Lcom/bv/wifisync/Host;
        //   104: aload_0        
        //   105: invokevirtual   com/bv/wifisync/Host.remove:(Lcom/bv/wifisync/Job;)V
        //   108: aload_0        
        //   109: aconst_null    
        //   110: putfield        com/bv/wifisync/Job.host:Lcom/bv/wifisync/Host;
        //   113: aload_0        
        //   114: monitorexit    
        //   115: return         
        //   116: aload           7
        //   118: invokeinterface java/util/Iterator.next:()Ljava/lang/Object;
        //   123: checkcast       Lcom/bv/wifisync/Job$HistoryItem;
        //   126: aload_1        
        //   127: invokevirtual   com/bv/wifisync/Job$HistoryItem.remove:(Landroid/content/Context;)V
        //   130: goto            27
        //   133: astore          6
        //   135: aload           5
        //   137: monitorexit    
        //   138: aload           6
        //   140: athrow         
        //   141: astore_2       
        //   142: aload_0        
        //   143: monitorexit    
        //   144: aload_2        
        //   145: athrow         
        //    Exceptions:
        //  throws java.io.IOException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  16     40     133    141    Any
        //  93     115    141    146    Any
        //  116    138    133    141    Any
        //  142    144    141    146    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0113:
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
    
    boolean removed() {
        return this.host == null;
    }
    
    void run(final Context context, final ProgressNotification progressNotification, final boolean b) throws Throwable {
        while (true) {
            try {
                this.sync(context, progressNotification);
                this.lastResult = null;
                return;
            }
            catch (Exception ex) {
                if (!this.removed()) {
                    throw ex;
                }
            }
            finally {
                this.running = false;
                this.canceled = false;
            }
            this.running = false;
            this.canceled = false;
        }
    }
    
    void setName(final String name) {
        this.name = name;
    }
    
    void setPcDir(final String pcDir) {
        if (!this.equals(this.pcDir, pcDir) && this.filter != null) {
            final Filter filter = this.filter;
            this.filter.includeRemoteFiles = null;
            filter.remoteFiles = null;
        }
        this.pcDir = pcDir;
    }
    
    void setPhoneDir(final String phoneDir) {
        if (!this.equals(this.phoneDir, phoneDir) && this.filter != null) {
            final Filter filter = this.filter;
            this.filter.includeLocalFiles = null;
            filter.localFiles = null;
        }
        this.phoneDir = phoneDir;
    }
    
    void showHistory(final Context context) {
        final Intent intent = new Intent(context, (Class)HistoryBrowser.class);
        intent.putExtra("RESULT", (Serializable)this);
        context.startActivity(intent);
    }
    
    void sync(final Context p0, final ProgressNotification p1) throws Throwable {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: getfield        com/bv/wifisync/Job.history:Ljava/util/List;
        //     4: astore_3       
        //     5: aload_3        
        //     6: monitorenter   
        //     7: aload_0        
        //     8: getfield        com/bv/wifisync/Job.history:Ljava/util/List;
        //    11: iconst_m1      
        //    12: aload_0        
        //    13: getfield        com/bv/wifisync/Job.history:Ljava/util/List;
        //    16: invokeinterface java/util/List.size:()I
        //    21: iadd           
        //    22: invokeinterface java/util/List.get:(I)Ljava/lang/Object;
        //    27: checkcast       Lcom/bv/wifisync/Job$HistoryItem;
        //    30: astore          5
        //    32: aload_3        
        //    33: monitorexit    
        //    34: aconst_null    
        //    35: astore          6
        //    37: aload_1        
        //    38: invokestatic    com/bv/wifisync/Utils.checkWifi:(Landroid/content/Context;)V
        //    41: aload_0        
        //    42: aload_1        
        //    43: aload_2        
        //    44: invokespecial   com/bv/wifisync/Job.runPlugin:(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
        //    47: aload_0        
        //    48: aload_1        
        //    49: aload_2        
        //    50: invokespecial   com/bv/wifisync/Job.doSync:(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)Ljava/util/List;
        //    53: astore          6
        //    55: aload_1        
        //    56: aload_2        
        //    57: invokestatic    com/bv/wifisync/LocalFileEx.compact:(Landroid/content/Context;Lcom/bv/sync/ProgressNotification;)V
        //    60: aload_0        
        //    61: aconst_null    
        //    62: putfield        com/bv/wifisync/Job.lastResult:Ljava/lang/Throwable;
        //    65: aload           5
        //    67: invokestatic    java/lang/System.currentTimeMillis:()J
        //    70: putfield        com/bv/wifisync/Job$HistoryItem.endTime:J
        //    73: aload           6
        //    75: ifnull          118
        //    78: aload           6
        //    80: invokeinterface java/util/Collection.size:()I
        //    85: ifeq            118
        //    88: aload_0        
        //    89: invokevirtual   com/bv/wifisync/Job.removed:()Z
        //    92: ifne            118
        //    95: aload_0        
        //    96: aload           5
        //    98: aload_1        
        //    99: aload           6
        //   101: invokespecial   com/bv/wifisync/Job.addHistoryResult:(Lcom/bv/wifisync/Job$HistoryItem;Landroid/content/Context;Ljava/util/Collection;)V
        //   104: aload_0        
        //   105: getfield        com/bv/wifisync/Job.skipMediaScan:Z
        //   108: ifne            118
        //   111: aload_1        
        //   112: aload           6
        //   114: aload_2        
        //   115: invokestatic    com/bv/wifisync/Utils.updateMediaFiles:(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
        //   118: aload_0        
        //   119: getfield        com/bv/wifisync/Job.lastResult:Ljava/lang/Throwable;
        //   122: ifnull          226
        //   125: aload_0        
        //   126: getfield        com/bv/wifisync/Job.lastResult:Ljava/lang/Throwable;
        //   129: athrow         
        //   130: astore          4
        //   132: aload_3        
        //   133: monitorexit    
        //   134: aload           4
        //   136: athrow         
        //   137: astore          8
        //   139: aload_0        
        //   140: aload           8
        //   142: putfield        com/bv/wifisync/Job.lastResult:Ljava/lang/Throwable;
        //   145: aload           8
        //   147: instanceof      Lcom/bv/sync/CifsSync$SyncException;
        //   150: ifeq            192
        //   153: aload           8
        //   155: checkcast       Lcom/bv/sync/CifsSync$SyncException;
        //   158: getfield        com/bv/sync/CifsSync$SyncException.result:Ljava/util/List;
        //   161: astore          6
        //   163: aload           5
        //   165: aload_1        
        //   166: aload           8
        //   168: iconst_0       
        //   169: invokestatic    com/bv/wifisync/Errors.getErrorMessage:(Landroid/content/Context;Ljava/lang/Throwable;Z)Ljava/lang/String;
        //   172: putfield        com/bv/wifisync/Job$HistoryItem.error:Ljava/lang/String;
        //   175: aload           5
        //   177: iconst_1       
        //   178: putfield        com/bv/wifisync/Job$HistoryItem.isError:Z
        //   181: aload           5
        //   183: invokestatic    java/lang/System.currentTimeMillis:()J
        //   186: putfield        com/bv/wifisync/Job$HistoryItem.endTime:J
        //   189: goto            73
        //   192: aload           8
        //   194: instanceof      Lcom/bv/sync/CifsSync$SyncCancellationException;
        //   197: ifeq            163
        //   200: aload           8
        //   202: checkcast       Lcom/bv/sync/CifsSync$SyncCancellationException;
        //   205: getfield        com/bv/sync/CifsSync$SyncCancellationException.syncResult:Ljava/util/List;
        //   208: astore          6
        //   210: goto            163
        //   213: astore          7
        //   215: aload           5
        //   217: invokestatic    java/lang/System.currentTimeMillis:()J
        //   220: putfield        com/bv/wifisync/Job$HistoryItem.endTime:J
        //   223: aload           7
        //   225: athrow         
        //   226: return         
        //    Exceptions:
        //  throws java.lang.Throwable
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                 
        //  -----  -----  -----  -----  ---------------------
        //  7      34     130    137    Any
        //  37     65     137    213    Ljava/lang/Throwable;
        //  37     65     213    226    Any
        //  132    134    130    137    Any
        //  139    181    213    226    Any
        //  192    210    213    226    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0073:
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
    
    public String toString() {
        String name = "";
        if (this.host != null) {
            name = this.host.name;
        }
        return String.valueOf(name) + ":" + this.getName();
    }
    
    void update(final Context context, final Job job) throws IOException {
        while (true) {
            while (true) {
                Label_0178: {
                    synchronized (this) {
                        if (this.equals(job.getPhoneDir(), this.getPhoneDir()) && this.equals(job.getPcDir(), this.getPcDir())) {
                            if (this.direction == job.direction) {
                                break Label_0178;
                            }
                            if (this.direction != CifsSync.Options.Direction.toLocal && job.direction != CifsSync.Options.Direction.toLocal) {
                                break Label_0178;
                            }
                        }
                        final int n = 1;
                        if (n != 0) {
                            this.removeDeletionTrackFile(context);
                        }
                        this.setPhoneDir(job.getPhoneDir());
                        this.setPcDir(job.getPcDir());
                        this.direction = job.direction;
                        this.overwrite = job.overwrite;
                        this.trackDeletions = job.trackDeletions;
                        this.mirror = job.mirror;
                        this.schedule = job.schedule;
                        this.plugin = job.plugin;
                        this.filter = job.filter;
                        this.skipMediaScan = job.skipMediaScan;
                        this.name = job.name;
                        return;
                    }
                }
                final int n = 0;
                continue;
            }
        }
    }
    
    void validate(final Context context) throws IOException {
        Log.i("Job", "Validating job " + this.getName());
        this.getWorkingDir(context);
        Log.i("Job", "Validated job " + this.getName() + " id: " + this.id);
    }
    
    static class Filter implements Serializable
    {
        private static final long serialVersionUID = 7561554538908381810L;
        LinkedHashSet<String> extensions;
        boolean ignoreHidden;
        boolean ignoreReadProtected;
        LinkedHashSet<String> includeExtensions;
        LinkedHashSet<String> includeLocalFiles;
        int includeModifiedDate;
        LinkedHashSet<String> includeRemoteFiles;
        LinkedHashSet<String> localFiles;
        int modifiedDate;
        LinkedHashSet<String> remoteFiles;
    }
    
    static class HistoryItem implements Serializable
    {
        private static final long serialVersionUID = 9019662863943528958L;
        int deletedFilesCount;
        final String description;
        long endTime;
        String error;
        boolean isError;
        int localFileCount;
        long reconnects;
        int remoteFilesCount;
        final long time;
        long transferBytes;
        long transferTime;
        String workDir;
        
        HistoryItem(final String description) {
            super();
            this.time = System.currentTimeMillis();
            this.description = description;
        }
        
        HistoryItem(final String s, final String error) {
            this(s);
            this.error = error;
            this.isError = true;
        }
        
        File getDeletedFilesPath() {
            return new File(new File(this.workDir), "deleted");
        }
        
        File getLocalFilesPath() {
            return new File(new File(this.workDir), "local");
        }
        
        File getRemoteFilesPath() {
            return new File(new File(this.workDir), "remote");
        }
        
        void remove(final Context context) throws IOException {
            if (this.workDir != null) {
                final File file = new File(this.workDir);
                if (file.exists()) {
                    Utils.rmdir(context, file);
                }
                this.workDir = null;
            }
        }
        
        @SuppressLint({ "SimpleDateFormat" })
        public String toString() {
            return String.valueOf(new SimpleDateFormat().format(new Date(this.time))) + "\t " + this.description;
        }
    }
    
    static class NeverFinishedException extends Exception
    {
        private static final long serialVersionUID = 3115773371155930780L;
        
        public NeverFinishedException(final String s) {
            super(s);
        }
    }
    
    interface Plugin extends Serializable
    {
        void clear();
        
        Collection<MovedItem> getChangedItems();
        
        void run(Job p0, Context p1, ProgressNotification p2) throws IOException;
    }
    
    @Deprecated
    private enum ScheduleType
    {
        Interval("Interval", 0), 
        Time("Time", 1);
    }
    
    enum SyncType
    {
        Downloads("Downloads", 6), 
        Folder("Folder", 0), 
        Movies("Movies", 3), 
        Music("Music", 1), 
        Pictures("Pictures", 2), 
        Root("Root", 5), 
        SDCard("SDCard", 4);
    }
}
