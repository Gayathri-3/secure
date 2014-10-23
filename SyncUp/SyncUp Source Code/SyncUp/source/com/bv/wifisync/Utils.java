package com.bv.wifisync;

import com.google.android.apps.analytics.*;
import java.nio.*;
import android.view.*;
import android.view.animation.*;
import android.util.*;
import android.graphics.drawable.*;
import android.webkit.*;
import android.net.wifi.*;
import android.content.pm.*;
import android.location.*;
import android.annotation.*;
import android.net.*;
import java.util.zip.*;
import android.content.*;
import java.net.*;
import java.text.*;
import java.util.*;
import android.widget.*;
import android.app.backup.*;
import java.io.*;
import android.database.*;
import android.provider.*;
import android.text.*;
import android.media.*;
import com.bv.sync.*;
import java.util.concurrent.*;
import android.os.*;
import android.app.*;

class Utils
{
    static final int SMB_TCP_PORT = 445;
    static final int SMB_TEST_TIMEOUT = 400;
    private static final String TAG = "Utils";
    static final Object[] configReadWriteLock;
    private static String[] imageExtensions;
    private static Boolean isDebugBuild;
    private static String[] musicExtensions;
    private static GoogleAnalyticsTracker tracker;
    private static String[] videoExtensions;
    
    static /* synthetic */ int[] $SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction() {
        int[] $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction = Utils.$SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction;
        if ($switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction == null) {
            $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction = new int[ProgressNotification.ProgressAction.values().length];
            while (true) {
                try {
                    $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Connecting.ordinal()] = 7;
                    try {
                        $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Copying.ordinal()] = 2;
                        try {
                            $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Deleting.ordinal()] = 3;
                            try {
                                $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Grouping.ordinal()] = 5;
                                try {
                                    $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Listing.ordinal()] = 10;
                                    try {
                                        $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Moving.ordinal()] = 6;
                                        try {
                                            $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Saving.ordinal()] = 8;
                                            try {
                                                $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.Synchronizing.ordinal()] = 1;
                                                try {
                                                    $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.TrackingDeletions.ordinal()] = 4;
                                                    try {
                                                        $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction[ProgressNotification.ProgressAction.UpdateMediaStore.ordinal()] = 9;
                                                        Utils.$SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction = $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction;
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
                            catch (NoSuchFieldError noSuchFieldError7) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError8) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError9) {}
                }
                catch (NoSuchFieldError noSuchFieldError10) {
                    continue;
                }
                break;
            }
        }
        return $switch_TABLE$com$bv$sync$ProgressNotification$ProgressAction;
    }
    
    static {
        configReadWriteLock = new Object[0];
        Utils.imageExtensions = new String[] { ".jpg", ".jpeg", ".png", ".bmp", ".ico", ".gif" };
        Utils.videoExtensions = new String[] { ".mpg", ".mpeg", ".avi", ".mov", ".flv", ".wma", ".wmv", ".3gp", ".mp4", ".m4a", ".aac" };
        Utils.musicExtensions = new String[] { ".mp3", ".mid", ".ogg" };
    }
    
    @TargetApi(9)
    private static void addAdress(final List<NetInfo> list, final NetworkInterface networkInterface, final InterfaceAddress interfaceAddress) {
        final int int1 = ByteBuffer.wrap(interfaceAddress.getAddress().getAddress()).getInt();
        final short networkPrefixLength = interfaceAddress.getNetworkPrefixLength();
        if (int1 != 0 && networkPrefixLength != 0) {
            final NetInfo netInfo = new NetInfo(networkInterface.getDisplayName(), int1, networkPrefixLength);
            final NetInfo find = find(netInfo, list);
            if (find == null) {
                list.add(netInfo);
            }
            else if (find.mask > netInfo.mask && netInfo.mask != 0) {
                find.mask = netInfo.mask;
            }
        }
    }
    
    @TargetApi(9)
    private static void addInterface(final List<NetInfo> list, final NetworkInterface networkInterface) {
        for (final InterfaceAddress interfaceAddress : networkInterface.getInterfaceAddresses()) {
            if (interfaceAddress.getAddress().getAddress().length == 4) {
                addAdress(list, networkInterface, interfaceAddress);
            }
        }
    }
    
    static void animate(final View view) {
        view.startAnimation(AnimationUtils.loadAnimation(view.getContext(), 2130968576));
    }
    
    static void checkWifi(final Context context) throws IOException {
        if (Config.getForceWifi(context) && !isWifiConnected(context)) {
            throw new IOException(context.getString(2131099807));
        }
    }
    
    static String concat(final String s, String string, final String s2) {
        if (s.length() != 0) {
            string = String.valueOf(s) + s2 + string;
        }
        return string;
    }
    
    static void deleteFile(final Context context, final File file) throws IOException {
        Log.i("Utils", "Removing local file: " + file.getAbsolutePath());
        if (file.exists() && !file.delete()) {
            throw new IOException(context.getString(2131099799, new Object[] { file.getAbsolutePath() }));
        }
    }
    
    private static boolean endsWith(final String s, final String[] array) {
        final int length = array.length;
        int n = 0;
        boolean b;
        while (true) {
            b = false;
            if (n >= length) {
                break;
            }
            if (s.endsWith(array[n])) {
                return true;
            }
            ++n;
        }
        return b;
        b = true;
        return b;
    }
    
    @TargetApi(9)
    private static void enumerateInterfaces(final List<NetInfo> list) throws SocketException {
        for (final NetworkInterface networkInterface : Collections.list(NetworkInterface.getNetworkInterfaces())) {
            if (networkInterface.isUp() && !networkInterface.isLoopback() && !networkInterface.getName().startsWith("rmnet0")) {
                addInterface(list, networkInterface);
            }
        }
    }
    
    private static NetInfo find(final NetInfo netInfo, final List<NetInfo> list) {
        for (final NetInfo netInfo2 : list) {
            if (netInfo.ip == netInfo2.ip) {
                return netInfo2;
            }
        }
        return null;
    }
    
    static String getActionString(final ProgressNotification.ProgressAction progressAction, final Context context) {
        if (progressAction != null) {
            switch ($SWITCH_TABLE$com$bv$sync$ProgressNotification$ProgressAction()[progressAction.ordinal()]) {
                case 2: {
                    return context.getString(2131099947);
                }
                case 3: {
                    return context.getString(2131099949);
                }
                case 6: {
                    return context.getString(2131099948);
                }
                case 5: {
                    return context.getString(2131100014);
                }
                case 1: {
                    return context.getString(2131099946);
                }
                case 4: {
                    return context.getString(2131099950);
                }
                case 7: {
                    return context.getString(2131099919);
                }
                case 8: {
                    return context.getString(2131100068);
                }
                case 9: {
                    return context.getString(2131100082);
                }
                case 10: {
                    return context.getString(2131100067);
                }
            }
        }
        return "";
    }
    
    static String getAppVersion(final Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        }
        catch (PackageManager$NameNotFoundException ex) {
            Log.e("Utils", ex.getLocalizedMessage(), (Throwable)ex);
            return null;
        }
    }
    
    static String[] getBroadcastAddress(final Context context) throws SocketException {
        final List<NetInfo> netInfo = getNetInfo(context);
        final String[] array = new String[netInfo.size()];
        int n = 0;
        final Iterator<NetInfo> iterator = netInfo.iterator();
        while (iterator.hasNext()) {
            final byte[] broadcastBytes = getBroadcastBytes(iterator.next());
            final int n2 = n + 1;
            array[n] = String.valueOf(0xFF & broadcastBytes[0]) + "." + (0xFF & broadcastBytes[1]) + "." + (0xFF & broadcastBytes[2]) + "." + (0xFF & broadcastBytes[3]);
            n = n2;
        }
        return array;
    }
    
    static byte[] getBroadcastBytes(final NetInfo netInfo) {
        return ipToBytes(netInfo.ip | (-1 << 32 - netInfo.mask ^ -1));
    }
    
    private static int getCidr(final int n) {
        for (int i = 1; i < 32; ++i) {
            if ((n & i << i) == 0x0) {
                return i;
            }
        }
        return 0;
    }
    
    private static File getConfigBackupFile(final Context context) {
        return new File(context.getFilesDir(), "hosts.dat.bak");
    }
    
    private static File getConfigFile(final Context context) {
        return new File(context.getFilesDir(), "hosts.dat");
    }
    
    static Drawable getFileImage(final Context context, final File file) {
        while (true) {
            try {
                final List queryIntentActivities = context.getPackageManager().queryIntentActivities(getFileTypeIntent(file), 0);
                if (!queryIntentActivities.isEmpty()) {
                    Collections.sort((List<Object>)queryIntentActivities, (Comparator<? super Object>)new Comparator<ResolveInfo>() {
                        public int compare(final ResolveInfo resolveInfo, final ResolveInfo resolveInfo2) {
                            return resolveInfo.preferredOrder - resolveInfo2.preferredOrder;
                        }
                    });
                    return queryIntentActivities.get(0).loadIcon(context.getPackageManager());
                }
            }
            catch (Exception ex) {}
            return context.getResources().getDrawable(2130837522);
        }
    }
    
    static Intent getFileTypeIntent(final File file) {
        final Intent intent = new Intent();
        intent.setAction("android.intent.action.VIEW");
        final MimeTypeMap singleton = MimeTypeMap.getSingleton();
        final String substring = file.getName().substring(1 + file.getName().lastIndexOf("."));
        intent.setData(Uri.fromFile(file));
        intent.setDataAndType(Uri.fromFile(file), singleton.getMimeTypeFromExtension(substring));
        return intent;
    }
    
    static LastNotification getLastNotification(final Context context) {
        final SharedPreferences sharedPreferences = context.getSharedPreferences("app", 0);
        final int int1 = sharedPreferences.getInt("notification", 0);
        LastNotification lastNotification = null;
        if (int1 != 0) {
            lastNotification = new LastNotification(sharedPreferences.getString("notificationTitle", (String)null), sharedPreferences.getString("notificationDetails", (String)null), int1);
        }
        return lastNotification;
    }
    
    static List<NetInfo> getNetInfo(final Context context) throws SocketException {
        final ArrayList<NetInfo> list = new ArrayList<NetInfo>();
        if (isEmulator()) {
            list.add(new NetInfo("Emulator", 167938561, 24));
        }
        if (isWifiConnected(context)) {
            final DhcpInfo dhcpInfo = ((WifiManager)context.getSystemService("wifi")).getDhcpInfo();
            if (dhcpInfo.ipAddress != 0 && dhcpInfo.netmask != 0) {
                list.add(new NetInfo("wlan0", Integer.reverseBytes(dhcpInfo.ipAddress), getCidr(dhcpInfo.netmask)));
            }
        }
        try {
            if (Build$VERSION.SDK_INT >= 9) {
                enumerateInterfaces(list);
            }
            return list;
        }
        catch (Throwable t) {
            Dialogs.showError(context, t);
            return list;
        }
    }
    
    private static OutputStream getStream(final File file, final boolean b) throws IOException {
        final FileOutputStream fileOutputStream = new FileOutputStream(file);
        OutputStream outputStream;
        if (b) {
            outputStream = new ZipOutputStream(fileOutputStream);
            ((ZipOutputStream)outputStream).putNextEntry(new ZipEntry(file.getName()));
        }
        else {
            outputStream = fileOutputStream;
        }
        return outputStream;
    }
    
    static GoogleAnalyticsTracker getTracker(final Context context) {
        synchronized (Utils.class) {
            if (Utils.tracker == null) {
                Utils.tracker = GoogleAnalyticsTracker.getInstance();
                if (isDebugBuild(context)) {
                    Utils.tracker.setDebug(true);
                }
                Utils.tracker.startNewSession("UA-27375313-1", context.getApplicationContext());
            }
            return Utils.tracker;
        }
    }
    
    static <T> boolean hasData(final Collection<T> collection) {
        return collection != null && collection.size() != 0;
    }
    
    static String humanReadableSize(final long n) {
        String s;
        if (n < 1024L) {
            s = String.valueOf(n) + " B";
        }
        else {
            final int n2 = (int)(Math.log(n) / Math.log(1024.0));
            s = String.format(Locale.getDefault(), "%.1f %cB", n / Math.pow(1024.0, n2), "KMGTPE".charAt(n2 - 1));
        }
        return s;
    }
    
    static byte[] ipToBytes(final int n) {
        return new byte[] { (byte)(n >> 24), (byte)(n << 8 >> 24), (byte)(n << 16 >> 24), (byte)(n << 24 >> 24) };
    }
    
    static boolean isDebugBuild(final Context context) {
        Label_0042: {
            if (Utils.isDebugBuild != null) {
                break Label_0042;
            }
            final PackageManager packageManager = context.getPackageManager();
            try {
                Utils.isDebugBuild = ((0x2 & packageManager.getPackageInfo(context.getPackageName(), 0).applicationInfo.flags) != 0x0);
                return Utils.isDebugBuild;
            }
            catch (PackageManager$NameNotFoundException ex) {
                Log.e("Utils", ex.getLocalizedMessage(), (Throwable)ex);
                Utils.isDebugBuild = false;
                return Utils.isDebugBuild;
            }
        }
    }
    
    static boolean isDrive(final String s) {
        boolean b = true;
        final String stripUrlPrefix = stripUrlPrefix(s);
        if (stripUrlPrefix == null || stripUrlPrefix.length() != 3 || stripUrlPrefix.charAt(b ? 1 : 0) != '$') {
            b = false;
        }
        return b;
    }
    
    static boolean isEmulator() {
        return "sdk".equals(Build.PRODUCT) || "sdk_x86".equals(Build.PRODUCT);
    }
    
    static boolean isGeoCoderAvailable(final Context context) {
        while (true) {
            boolean b = true;
            try {
                final List fromLocationName = new Geocoder(context).getFromLocationName("1600 Amphitheatre Parkway, Mountain View, CA", 1);
                if (fromLocationName != null && !fromLocationName.isEmpty()) {
                    return b;
                }
            }
            catch (IOException ex) {}
            b = false;
            return b;
        }
    }
    
    @SuppressLint({ "DefaultLocale" })
    private static boolean isMediaFile(final SyncItem syncItem) {
        final String lowerCase = syncItem.absolutePath.toLowerCase();
        return endsWith(lowerCase, Utils.imageExtensions) || endsWith(lowerCase, Utils.videoExtensions) || endsWith(lowerCase, Utils.musicExtensions);
    }
    
    static boolean isRootRemoteFolder(final IFile file) {
        boolean b = file instanceof RemoteFile;
        if (b) {
            final String stripUrlPrefix = stripUrlPrefix(file.getAbsolutePath());
            b = (stripUrlPrefix == null || stripUrlPrefix.length() == 0);
        }
        return b;
    }
    
    static boolean isShare(final String s) {
        final String stripUrlPrefix = stripUrlPrefix(s);
        return stripUrlPrefix != null && new File(stripUrlPrefix).getParent() == null;
    }
    
    static boolean isWifiConnected(final Context context) {
        boolean b = true;
        if (!isEmulator()) {
            final NetworkInfo networkInfo = ((ConnectivityManager)context.getSystemService("connectivity")).getNetworkInfo((int)(b ? 1 : 0));
            if (networkInfo == null || !networkInfo.isConnected()) {
                b = false;
            }
        }
        return b;
    }
    
    static InetAddress makeAddress(final int n) throws UnknownHostException {
        return InetAddress.getByAddress(ipToBytes(n));
    }
    
    static void mkdirs(final Context context, final File file) throws IOException {
        if (!file.exists() && !file.mkdirs()) {
            throw new IOException(String.valueOf(context.getString(2131099793)) + file.getAbsolutePath());
        }
    }
    
    private static boolean needsMediaRefresh(final Context context, final SyncItem syncItem) {
        boolean b = syncItem.type == SyncItem.Type.LocalFile || syncItem.type == SyncItem.Type.Deleted;
        if (b) {
            b = (!syncItem.absolutePath.startsWith("smb://") && isMediaFile(syncItem));
        }
        if (b && syncItem.type == SyncItem.Type.Deleted && Config.getNoMediaRescan(context)) {
            b = false;
        }
        return b;
    }
    
    static ArrayList<Host> readConfig(final Context context) throws ClassNotFoundException, IOException {
        while (true) {
            final Object[] configReadWriteLock = Utils.configReadWriteLock;
            // monitorenter(configReadWriteLock)
            while (true) {
                Iterator<Host> iterator;
                try {
                    final ObjectInputStream objectInputStream = new ObjectInputStream(context.openFileInput("hosts.dat"));
                    try {
                        final Serializable s = (Serializable)objectInputStream.readObject();
                        objectInputStream.close();
                        // monitorexit(configReadWriteLock)
                        ArrayList<Host> list = (ArrayList<Host>)s;
                        if (list == null) {
                            list = new ArrayList<Host>();
                        }
                        iterator = list.iterator();
                        if (!iterator.hasNext()) {
                            return list;
                        }
                    }
                    finally {
                        objectInputStream.close();
                    }
                }
                catch (IOException ex) {
                    try {
                        final File configBackupFile = getConfigBackupFile(context);
                        if (configBackupFile.exists()) {
                            final File configFile = getConfigFile(context);
                            deleteFile(context, configFile);
                            renameFile(context, configBackupFile, configFile);
                        }
                        throw ex;
                    }
                    finally {}
                    // monitorexit(configReadWriteLock)
                }
                final Host host = iterator.next();
                final Iterator<Job> iterator2 = host.getJobs().iterator();
                while (iterator2.hasNext()) {
                    iterator2.next().host = host;
                }
                continue;
            }
        }
    }
    
    static Serializable readObjectFromFile(final File file, final boolean b) throws OptionalDataException, ClassNotFoundException, IOException {
        final ZipFile zipFile = new ZipFile(file);
        try {
            final ObjectInputStream objectInputStream = new ObjectInputStream(zipFile.getInputStream((ZipEntry)zipFile.entries().nextElement()));
            try {
                return (Serializable)objectInputStream.readObject();
            }
            finally {
                objectInputStream.close();
            }
        }
        finally {
            zipFile.close();
        }
    }
    
    static void refreshDeletedMedia(final Context context, final Collection<String> collection, final ProgressNotification progressNotification) throws InterruptedException {
        ((FileScanner)new DeleteFileScanner(context, collection, progressNotification)).run();
    }
    
    static void refreshMedia(final Context context, final Collection<String> collection, final ProgressNotification progressNotification) throws InterruptedException {
        new FileScanner(context, collection, progressNotification).run();
    }
    
    static void renameFile(final Context context, final File file, final File file2) throws IOException {
        Log.i("Utils", "Renaming local file: " + file.getAbsolutePath() + " to " + file2.getAbsolutePath());
        if (file.exists() && !file.renameTo(file2)) {
            throw new IOException(context.getString(2131099801, new Object[] { file.getAbsolutePath(), file2.getAbsolutePath() }));
        }
    }
    
    static void rmdir(final Context context, final File file) throws IOException {
        System.out.println("Removing local directory: " + file.getAbsolutePath());
        final File[] listFiles = file.listFiles();
        if (listFiles == null) {
            throw new IOException(context.getString(2131099813));
        }
        for (final File file2 : listFiles) {
            if (file2.isDirectory()) {
                rmdir(context, file2);
            }
            else if (!file2.delete()) {
                throw new IOException(context.getString(2131099799, new Object[] { file2.getAbsolutePath() }));
            }
        }
        if (!file.delete()) {
            throw new IOException(context.getString(2131099800, new Object[] { file.getAbsolutePath() }));
        }
    }
    
    static void setHostName(final InetAddress inetAddress) {
        try {
            final Field declaredField = InetAddress.class.getDeclaredField("hostName");
            declaredField.setAccessible(true);
            declaredField.set(inetAddress, "unknown");
        }
        catch (Throwable t) {
            Log.e("Utils", t.getLocalizedMessage(), t);
        }
    }
    
    static void setLastNotification(final Context context, final LastNotification lastNotification) {
        final SharedPreferences$Editor edit = context.getSharedPreferences("app", 0).edit();
        int jobId = 0;
        if (lastNotification != null) {
            jobId = lastNotification.jobId;
        }
        edit.putInt("notification", jobId);
        String title;
        if (lastNotification == null) {
            title = null;
        }
        else {
            title = lastNotification.title;
        }
        edit.putString("notificationTitle", title);
        String details = null;
        if (lastNotification != null) {
            details = lastNotification.details;
        }
        edit.putString("notificationDetails", details);
        edit.commit();
    }
    
    static void setPostMortem(final Context context) {
        final Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
        if (defaultUncaughtExceptionHandler == null || !(defaultUncaughtExceptionHandler instanceof PostMortem)) {
            Thread.setDefaultUncaughtExceptionHandler((Thread.UncaughtExceptionHandler)new PostMortem(defaultUncaughtExceptionHandler, context));
            Log.i("Utils", "Post mortem initialized");
        }
    }
    
    static boolean smbReachable(final InetAddress inetAddress) throws ArpTableFullException {
        while (true) {
            try {
                final Socket socket = new Socket();
                socket.connect(new InetSocketAddress(inetAddress, 445), 400);
                socket.close();
                return true;
            }
            catch (SocketException ex) {
                if (ex.getMessage().equals("No buffer space available")) {
                    throw new ArpTableFullException("Arp table is full, waiting one minute");
                }
            }
            catch (IOException ex2) {}
            return false;
        }
    }
    
    static void stopTracker() {
        synchronized (Utils.class) {
            if (Utils.tracker != null) {
                Utils.tracker.stopSession();
                Utils.tracker = null;
            }
        }
    }
    
    static String stripQuotes(String substring) {
        if (substring != null && substring.length() != 0) {
            final char char1 = substring.charAt(0);
            boolean b = false;
            if (char1 == '\"') {
                b = true;
            }
            int length;
            if (substring.charAt(-1 + substring.length()) == '\"') {
                length = -1 + substring.length();
            }
            else {
                length = substring.length();
            }
            substring = substring.substring(b ? 1 : 0, length);
        }
        return substring;
    }
    
    static String stripUrlPrefix(final String s) {
        int n = s.indexOf("//");
        if (n != -1) {
            n = s.indexOf("/", n + 3);
        }
        final int n2 = n + 1;
        String substring;
        if (n2 > -1 + s.length()) {
            substring = null;
        }
        else {
            substring = s.substring(n2);
        }
        return substring;
    }
    
    static String toDate(final Context context, final long n) {
        return DateFormat.getDateTimeInstance().format(new Date(n));
    }
    
    static String trimText(final TextView textView) {
        final CharSequence text = textView.getText();
        String trim;
        if (text != null) {
            trim = text.toString().trim();
        }
        else {
            trim = null;
        }
        return trim;
    }
    
    static void updateMediaFiles(final Context context, final Collection<SyncItem> collection, final ProgressNotification progressNotification) throws InterruptedException {
        final ArrayList<String> list = new ArrayList<String>();
        final ArrayList<String> list2 = new ArrayList<String>();
        for (final SyncItem syncItem : collection) {
            if (needsMediaRefresh(context, syncItem)) {
                if (syncItem.type == SyncItem.Type.Deleted) {
                    list2.add(syncItem.absolutePath);
                }
                else {
                    list.add(syncItem.absolutePath);
                }
            }
        }
        if (list.size() != 0) {
            refreshMedia(context, list, progressNotification);
        }
        if (list2.size() != 0) {
            refreshDeletedMedia(context, list2, progressNotification);
        }
    }
    
    static String urlToPath(final String s) {
        String s2 = stripUrlPrefix(s);
        String replace;
        if (s2 == null) {
            replace = null;
        }
        else {
            if (s2.length() >= 3 && s2.charAt(1) == '$') {
                s2 = String.valueOf(s2.substring(0, 1)) + ":" + s2.substring(2);
            }
            if (s2.charAt(-1 + s2.length()) == '/') {
                s2 = s2.substring(0, -1 + s2.length());
            }
            replace = s2.replace("/", "\\");
        }
        return replace;
    }
    
    static void writeConfig(final Context context, final ArrayList<Host> list, final BackupManager backupManager) throws IOException {
        synchronized (Utils.configReadWriteLock) {
            final File configFile = getConfigFile(context);
            final File configBackupFile = getConfigBackupFile(context);
            deleteFile(context, configBackupFile);
            renameFile(context, configFile, configBackupFile);
            try {
                writeStream(context.openFileOutput("hosts.dat", 0), list);
                // monitorexit(Utils.configReadWriteLock)
                backupManager.dataChanged();
            }
            catch (IOException ex) {
                deleteFile(context, configFile);
                renameFile(context, configBackupFile, configFile);
                throw ex;
            }
        }
    }
    
    static void writeObjectToFile(final File file, final Serializable s, final boolean b) throws IOException {
        writeStream(getStream(file, b), s);
    }
    
    private static void writeStream(final OutputStream outputStream, final Serializable s) throws IOException {
        final ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream);
        try {
            objectOutputStream.writeObject(s);
        }
        finally {
            objectOutputStream.close();
        }
    }
    
    class PostMortem implements Thread.UncaughtExceptionHandler
    {
        private final Thread.UncaughtExceptionHandler oldHandler;
        private final /* synthetic */ Context val$context;
        
        PostMortem(final Thread.UncaughtExceptionHandler oldHandler, final Context val$context) {
            this.val$context = val$context;
            super();
            this.oldHandler = oldHandler;
        }
        
        public void uncaughtException(final Thread thread, final Throwable t) {
            try {
                Errors.getErrorMessage(this.val$context, t);
            }
            catch (Throwable t2) {
                t2.printStackTrace();
                if (this.oldHandler != null) {
                    this.oldHandler.uncaughtException(thread, t);
                }
            }
            finally {
                if (this.oldHandler != null) {
                    this.oldHandler.uncaughtException(thread, t);
                }
            }
        }
    }
    
    static class ArpTableFullException extends SocketException
    {
        private static final long serialVersionUID = -7721324369178596674L;
        
        public ArpTableFullException(final String s) {
            super(s);
        }
    }
    
    private static class DeleteFileScanner extends FileScanner
    {
        DeleteFileScanner(final Context context, final Collection<String> collection, final ProgressNotification progressNotification) {
            super(context, collection, progressNotification);
        }
        
        private void removeFile(final String s, final Uri uri) {
            final Cursor query = this.context.getContentResolver().query(uri, new String[] { "_id" }, "_data=?", new String[] { s }, (String)null);
            if (query == null) {
                return;
            }
            try {
                if (query.moveToFirst()) {
                    final int delete = this.context.getContentResolver().delete(uri, "_id=?", new String[] { query.getString(query.getColumnIndex("_id")) });
                    if (delete != 1) {
                        Log.w("Utils", "Deleted media store count is: " + delete + " for " + s);
                    }
                }
            }
            finally {
                query.close();
            }
        }
        
        @SuppressLint({ "DefaultLocale" })
        protected void doScan(final String s) {
            final String lowerCase = s.toLowerCase();
            if (endsWith(lowerCase, Utils.imageExtensions)) {
                this.removeFile(s, MediaStore$Images$Media.EXTERNAL_CONTENT_URI);
            }
            else if (endsWith(lowerCase, Utils.videoExtensions)) {
                this.removeFile(s, MediaStore$Video$Media.EXTERNAL_CONTENT_URI);
            }
            else {
                super.doScan(s);
            }
        }
        
        public void onScanCompleted(final String s, final Uri uri) {
            try {
                final File file = new File(s);
                if (uri == null) {
                    Log.e("Utils", "Failed to scan: " + s);
                }
                else if (file.exists() && file.length() == 0L) {
                    this.context.getContentResolver().delete(uri, (String)null, (String[])null);
                }
            }
            catch (Exception ex) {
                Dialogs.showError(this.context, ex);
            }
        }
    }
    
    static final class FileNameInputFilter implements InputFilter
    {
        public CharSequence filter(final CharSequence charSequence, final int n, final int n2, final Spanned spanned, final int n3, final int n4) {
            for (int i = n; i < n2; ++i) {
                if (!this.isValid(charSequence.charAt(i))) {
                    return "";
                }
            }
            return null;
        }
        
        boolean isValid(final char c) {
            for (final char c2 : new char[] { '/', '\\', '*', '?', '%', ':', '|', '\"', '>', '<' }) {
                final boolean b = false;
                if (c == c2) {
                    return b;
                }
            }
            return true;
        }
    }
    
    private static class FileScanner implements MediaScannerConnection$MediaScannerConnectionClient
    {
        private boolean connected;
        private MediaScannerConnection connection;
        protected final Context context;
        private final Collection<String> files;
        private final ProgressNotification progress;
        
        FileScanner(final Context context, final Collection<String> files, final ProgressNotification progress) {
            super();
            this.context = context;
            this.progress = progress;
            this.files = files;
        }
        
        private void scanFile(final String s, final int n) {
            this.doScan(s);
            if (this.progress != null && !this.progress.update(ProgressNotification.ProgressAction.UpdateMediaStore, (int)(100.0f * (n / this.files.size())), new LocalFile(s))) {
                throw new CancellationException();
            }
        }
        
        protected void doScan(final String s) {
            this.connection.scanFile(s, (String)null);
        }
        
        public void onMediaScannerConnected() {
            synchronized (this) {
                this.connected = true;
                this.notify();
            }
        }
        
        public void onScanCompleted(final String s, final Uri uri) {
        }
        
        void run() throws InterruptedException {
            while (true) {
                synchronized (this) {
                    (this.connection = new MediaScannerConnection(this.context, (MediaScannerConnection$MediaScannerConnectionClient)this)).connect();
                    this.wait(5000L);
                    int n = 0;
                    try {
                        if (this.connected) {
                            for (final String s : this.files) {
                                ++n;
                                this.scanFile(s, n);
                            }
                            return;
                        }
                    }
                    finally {
                        this.connection.disconnect();
                    }
                }
                Log.w("Utils", "Timeout connecting to MediaScanner");
            }
        }
    }
    
    static class LastNotification
    {
        final String details;
        final int jobId;
        final String title;
        
        LastNotification(final String title, final String details, final int jobId) {
            super();
            this.title = title;
            this.details = details;
            this.jobId = jobId;
        }
    }
    
    static class NetInfo
    {
        final int ip;
        int mask;
        final String name;
        
        NetInfo(final String name, final int ip, final int mask) {
            super();
            this.name = name;
            this.ip = ip;
            this.mask = mask;
        }
    }
    
    abstract static class ProgressTask<Params, Progress, Result> extends AsyncTask<Params, Progress, Result>
    {
        private final Activity activity;
        protected Throwable error;
        private final String name;
        
        ProgressTask(final Activity activity, final String name) {
            super();
            this.activity = activity;
            this.name = name;
        }
        
        protected abstract Result atBackground(final Params... p0) throws Exception;
        
        protected Result doInBackground(final Params... array) {
            try {
                Thread.currentThread().setName(this.name);
                return this.atBackground(array);
            }
            catch (Throwable error) {
                this.error = error;
                return null;
            }
        }
        
        protected void onCancelled() {
            super.onCancelled();
            this.activity.setProgressBarIndeterminateVisibility(false);
        }
        
        protected void onPostExecute(final Result result) {
            this.activity.setProgressBarIndeterminateVisibility(false);
            if (!this.isCancelled() && this.error != null) {
                Dialogs.showError((Context)this.activity, this.error);
            }
        }
        
        void run(final Params... array) {
            this.execute((Object[])array);
            this.activity.setProgressBarIndeterminateVisibility(true);
        }
    }
}
