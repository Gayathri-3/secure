package com.bv.sync;

import java.io.*;
import jcifs.smb.*;
import jcifs.util.transport.*;
import java.util.*;
import java.util.concurrent.*;

public class CifsSync
{
    static final int BUFFER_SIZE = 60;
    private static final int MAX_TIMEZONES = 25;
    private static final long RESOLUTION_SEC = 2L;
    private static final int SECOND = 1000;
    private static final String SMB_PREFIX = "smb://";
    public static final String TMP_EXTENTION = "_(!).(!)_tmp";
    private boolean canceled;
    private long currentSize;
    private final Map<String, Long> deletionTrackMap;
    private final Utils.FileComparator fileComparator;
    private long[] freeSpace;
    protected int leftCount;
    private final Options options;
    private ProgressNotification progress;
    protected int rightCount;
    private final IFile[] roots;
    private SizeCalculator sizeCalculator;
    private ArrayList<SyncItem> syncResult;
    private SyncStats syncStats;
    
    static /* synthetic */ int[] $SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction() {
        int[] $switch_TABLE$com$bv$sync$CifsSync$Options$Direction = CifsSync.$SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction;
        if ($switch_TABLE$com$bv$sync$CifsSync$Options$Direction == null) {
            $switch_TABLE$com$bv$sync$CifsSync$Options$Direction = new int[Options.Direction.values().length];
            while (true) {
                try {
                    $switch_TABLE$com$bv$sync$CifsSync$Options$Direction[Options.Direction.Both.ordinal()] = 1;
                    try {
                        $switch_TABLE$com$bv$sync$CifsSync$Options$Direction[Options.Direction.moveToLocal.ordinal()] = 5;
                        try {
                            $switch_TABLE$com$bv$sync$CifsSync$Options$Direction[Options.Direction.moveToRemote.ordinal()] = 4;
                            try {
                                $switch_TABLE$com$bv$sync$CifsSync$Options$Direction[Options.Direction.toLocal.ordinal()] = 3;
                                try {
                                    $switch_TABLE$com$bv$sync$CifsSync$Options$Direction[Options.Direction.toRemote.ordinal()] = 2;
                                    CifsSync.$SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction = $switch_TABLE$com$bv$sync$CifsSync$Options$Direction;
                                }
                                catch (NoSuchFieldError noSuchFieldError) {}
                            }
                            catch (NoSuchFieldError noSuchFieldError2) {}
                        }
                        catch (NoSuchFieldError noSuchFieldError3) {}
                    }
                    catch (NoSuchFieldError noSuchFieldError4) {}
                }
                catch (NoSuchFieldError noSuchFieldError5) {
                    continue;
                }
                break;
            }
        }
        return $switch_TABLE$com$bv$sync$CifsSync$Options$Direction;
    }
    
    public CifsSync(final Options options, final Map<String, Long> deletionTrackMap) {
        super();
        this.roots = new IFile[2];
        this.fileComparator = new Utils.FileComparator();
        this.freeSpace = new long[2];
        this.options = options;
        this.deletionTrackMap = deletionTrackMap;
        this.syncStats = new SyncStats();
        RemoteFile.totalRetryCount = 0;
    }
    
    static /* synthetic */ void access$6(final CifsSync cifsSync, final boolean canceled) {
        cifsSync.canceled = canceled;
    }
    
    private void calcSize(final IFile file, final IFile file2) throws InterruptedException, IOException {
        if (this.options.direction == Options.Direction.toLocal || this.options.direction == Options.Direction.moveToLocal) {
            this.sizeCalculator = new SizeCalculator(this.options.filters, new IFile[] { file2 });
        }
        else if (this.options.direction == Options.Direction.toRemote || this.options.direction == Options.Direction.moveToRemote) {
            this.sizeCalculator = new SizeCalculator(this.options.filters, new IFile[] { file });
        }
        else {
            if (this.options.direction != Options.Direction.Both) {
                throw new EnumConstantNotPresentException(Options.Direction.class, this.options.direction.name());
            }
            this.sizeCalculator = new SizeCalculator(this.options.filters, new IFile[] { file, file2 });
        }
        this.sizeCalculator.start();
    }
    
    private void checkFreeSpace(final IFile file) throws IOException {
        if (this.options.minFreeSpace != 0L) {
            long n;
            if (file instanceof LocalFile) {
                n = this.freeSpace[0];
            }
            else {
                n = this.freeSpace[1];
            }
            if (n < this.options.minFreeSpace) {
                throw new ErrorCodeException(8, file.getAbsolutePath());
            }
        }
    }
    
    private long compare(final long n, final long n2) throws IOException {
        long n3 = n / 1000L - n2 / 1000L;
        long n4;
        if (n3 >= 0L) {
            n4 = n3;
        }
        else {
            n4 = -n3;
        }
        if (n4 <= 2L) {
            n3 = 0L;
        }
        else if (this.options.verifyTimeZone != Options.VerifyTimeZone.None) {
            final long n5 = n4 % 3600L;
            if (n5 <= 2L) {
                final long n6 = (n4 - n5) / 3600L;
                if (n6 <= 25L) {
                    final int[] timeZoneConflicts = this.syncStats.timeZoneConflicts;
                    final int n7 = -1 + (int)n6;
                    timeZoneConflicts[n7] += 1;
                    System.out.println("Android bug or Time zone change detected: " + n3);
                    if ((n6 == 1L && this.options.verifyTimeZone == Options.VerifyTimeZone.OneHour) || this.options.verifyTimeZone == Options.VerifyTimeZone.All) {
                        n3 = 0L;
                    }
                }
            }
        }
        return n3;
    }
    
    private long compare(final IFile file, final IFile file2) throws IOException {
        final boolean exists = this.exists(file);
        final boolean exists2 = this.exists(file2);
        long compareTimes;
        if (exists && exists2) {
            compareTimes = this.compareTimes(file, file2);
            if (compareTimes != 0L) {
                System.out.println("Syncing " + file.getAbsolutePath() + ", " + file2.getAbsolutePath());
                System.out.println("Local modified: " + file.getLastModified() + ", remote modified: " + file2.getLastModified());
            }
        }
        else if (exists) {
            System.err.println("File was deleted during sync " + file2.getAbsolutePath());
            compareTimes = 1L;
        }
        else {
            if (!exists2) {
                throw new FileNotFoundException(file.getAbsolutePath());
            }
            System.err.println("File was deleted during sync " + file.getAbsolutePath());
            compareTimes = -1L;
        }
        return compareTimes;
    }
    
    private long compareTimes(final IFile file, final IFile file2) throws IOException {
        final long lastModified = file.getLastModified();
        final long lastModified2 = file2.getLastModified();
        long compare;
        if (file.length() != file2.length()) {
            compare = lastModified - lastModified2;
        }
        else {
            compare = this.compare(lastModified, lastModified2);
        }
        return compare;
    }
    
    private void copy(final IFile file, final IFile file2) throws IOException {
        try {
            if (this.isSyncable(file) && this.isSyncable(file2)) {
                if (file.isDirectory()) {
                    this.copyDir(file, file2);
                }
                else {
                    this.copyFile(file, file2);
                }
            }
        }
        catch (IOException ex) {
            if (ex instanceof SyncException) {
                throw ex;
            }
            throw new SyncException(file.getAbsolutePath(), file2.getAbsolutePath(), this.syncResult, ex);
        }
    }
    
    private void copy(final IFile file, final IFile file2, final boolean b) throws IOException {
        boolean b2;
        if (b) {
            b2 = false;
        }
        else {
            b2 = true;
        }
        boolean b3;
        if (this.options.direction != Options.Direction.Both && this.options.direction != Options.Direction.toLocal && this.options.direction != Options.Direction.moveToLocal) {
            b3 = false;
        }
        else {
            b3 = true;
        }
        boolean b4;
        if (this.options.direction != Options.Direction.Both && this.options.direction != Options.Direction.toRemote && this.options.direction != Options.Direction.moveToRemote) {
            b4 = false;
        }
        else {
            b4 = true;
        }
        final boolean b5 = (b && b4) || (b2 && b3);
        boolean b6;
        if ((!b || !b3) && (!b2 || !b4)) {
            b6 = false;
        }
        else {
            b6 = true;
        }
        boolean b7;
        if (this.options.direction != Options.Direction.moveToRemote && this.options.direction != Options.Direction.moveToLocal) {
            b7 = false;
        }
        else {
            b7 = true;
        }
        if (b6 && !b7 && this.isDeleted(file)) {
            this.delete(file);
        }
        else if (b5) {
            this.copy(file, file2);
            int n;
            if ((!b || this.options.direction != Options.Direction.moveToRemote) && (!b2 || this.options.direction != Options.Direction.moveToLocal)) {
                n = 0;
            }
            else {
                n = 1;
            }
            if (n != 0) {
                this.delete(file);
            }
        }
    }
    
    private void copyBytes(final IFile file, final IFile file2) throws IOException {
        final byte[] array = new byte[61440];
        final OutputStream outputStream = file2.getOutputStream();
        try {
            final InputStream inputStream = file.getInputStream();
            try {
                while (true) {
                    final int read = this.read(array, inputStream);
                    if (read == -1) {
                        break;
                    }
                    this.write(array, outputStream, read);
                    this.updateProgress(ProgressNotification.ProgressAction.Synchronizing, read, file);
                }
                inputStream.close();
                outputStream.close();
                if (1 == 0) {
                    file2.delete();
                }
                System.out.println("Write speed KB/sec: " + this.syncStats.writeBytes / 1024.0f / (this.syncStats.writeTime / 1000L));
                System.out.println("Read speed KB/sec: " + this.syncStats.readBytes / 1024.0f / (this.syncStats.readTime / 1000L));
            }
            finally {
                inputStream.close();
            }
        }
        finally {
            outputStream.close();
            if (0 == 0) {
                file2.delete();
            }
        }
    }
    
    private IFile copyDir(final IFile file, final IFile file2) throws IOException {
        final IFile file3 = file2.createFile(file.getName());
        if (!file3.exists()) {
            System.out.println("Creating dir: " + file3.getAbsolutePath());
            file3.mkdir();
            this.updateProgress(ProgressNotification.ProgressAction.Synchronizing, 0L, file3);
            this.trackCopyDir(file3);
        }
        final IFile[] listFiles = file.listFiles();
        if (file instanceof LocalFile) {
            this.leftCount += listFiles.length;
        }
        else {
            this.rightCount += listFiles.length;
        }
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            this.copy(listFiles[i], file3);
        }
        return file3;
    }
    
    private IFile copyFile(final IFile file, final IFile file2) throws IOException {
        this.checkFreeSpace(file2);
        final IFile file3 = file2.createFile(String.valueOf(file.getName()) + "_(!).(!)_tmp");
        IFile file4;
        long lastModified;
        while (true) {
            try {
                this.copyBytes(file, file3);
                file4 = file2.createFile(file.getName());
                if (file4.exists()) {
                    file4.delete();
                }
                file3.renameTo(file4);
                lastModified = file.getLastModified();
                if (lastModified < 0L) {
                    throw new ErrorCodeException(7, file.getAbsolutePath());
                }
            }
            catch (SmbException ex) {
                if (ex.getNtStatus() != -1073741816) {
                    throw ex;
                }
                System.err.println("Retrying copy file on invalid handle");
                this.copyBytes(file, file3);
                continue;
            }
            break;
        }
        while (true) {
            try {
                file4.setLastModified(lastModified);
                System.out.println("Created file:" + file4.getAbsolutePath() + ", setting modified: " + file4.getLastModified());
                this.trackCopyFile(file4);
                return file4;
            }
            catch (IOException ex3) {
                try {
                    file.setLastModified(file4.getLastModified());
                }
                catch (IOException ex2) {
                    if (this.options.direction != Options.Direction.moveToLocal && this.options.direction != Options.Direction.toLocal) {
                        throw ex2;
                    }
                    continue;
                }
            }
            break;
        }
    }
    
    private boolean delete(final IFile file) throws IOException {
        return this.isSyncable(file) && this.internalDelete(file);
    }
    
    private void deleteTempFile(final IFile file) throws IOException {
        try {
            file.delete();
        }
        catch (SmbException ex) {
            if (ex.getNtStatus() != -1073741757) {
                throw ex;
            }
            System.out.println("Got locked temp file: " + file.getAbsolutePath());
        }
    }
    
    private boolean exists(final IFile file) throws IOException {
        try {
            final boolean exists = file.exists();
            boolean b = false;
            if (exists) {
                final long n = lcmp(file.length(), 0L);
                b = false;
                if (n >= 0) {
                    b = true;
                }
            }
            return b;
        }
        catch (SmbException ex) {
            final int ntStatus = ex.getNtStatus();
            final boolean b = false;
            if (ntStatus != -1073741275) {
                throw ex;
            }
            return b;
        }
    }
    
    private String getRelativePath(final IFile file) {
        String relativePath = null;
        final String normalizePath = this.normalizePath(file.getAbsolutePath());
        final IFile[] roots = this.roots;
        for (int length = roots.length, i = 0; i < length; ++i) {
            relativePath = getRelativePath(normalizePath, this.normalizePath(roots[i].getAbsolutePath()));
            if (relativePath != null) {
                break;
            }
        }
        return relativePath;
    }
    
    public static String getRelativePath(final String s, String string) {
        if (string.charAt(-1 + string.length()) != '/') {
            string = String.valueOf(string) + '/';
        }
        String string2;
        if (s.startsWith(string)) {
            String s2 = s.substring(string.length());
            if (s2.length() > 0 && s2.charAt(-1 + s2.length()) == '/') {
                s2 = s2.substring(0, -1 + s2.length());
            }
            string2 = new StringBuilder().append(s2).toString();
        }
        else {
            string2 = null;
        }
        return string2;
    }
    
    private boolean internalDelete(final IFile file) throws IOException {
        boolean b = true;
        final boolean directory = file.isDirectory();
        if (directory) {
            final IFile[] listFiles = file.listFiles();
            if (file instanceof LocalFile) {
                this.leftCount += listFiles.length;
            }
            else {
                this.rightCount += listFiles.length;
            }
            for (int n = 0; !this.canceled && n < listFiles.length; ++n) {
                b &= this.delete(listFiles[n]);
            }
        }
        if (!this.canceled && b) {
            System.err.println("Removing: " + file.getAbsolutePath());
            final SyncItem syncItem = new SyncItem(file.getAbsolutePath(), file.getLastModified(), SyncItem.Type.Deleted, file.length(), directory);
            final String relativePath = this.getRelativePath(file);
            file.delete();
            if (this.options.minFreeSpace != 0L) {
                int n2;
                if (file instanceof LocalFile) {
                    n2 = 0;
                }
                else {
                    n2 = 1;
                }
                final long[] freeSpace = this.freeSpace;
                freeSpace[n2] += syncItem.size;
            }
            this.syncResult.add(syncItem);
            this.trackDelete(file, relativePath);
            this.updateProgress(ProgressNotification.ProgressAction.Synchronizing, 0L, file);
        }
        return b;
    }
    
    private void internalSyncDirs(final IFile file, final IFile file2) throws IOException {
        final IFile[] normalize = this.normalize(file);
        final IFile[] normalize2 = this.normalize(file2);
        this.leftCount += normalize.length;
        this.rightCount += normalize2.length;
        int n = 0;
        int n2 = 0;
        while (n < normalize.length && n2 < normalize2.length) {
            final IFile file3 = normalize[n];
            final IFile file4 = normalize2[n2];
            final int compare = this.fileComparator.compare(file3, file4);
            if (compare < 0) {
                this.copy(file3, file2, true);
                normalize[n] = null;
                ++n;
            }
            else if (compare > 0) {
                this.copy(file4, file, false);
                normalize2[n2] = null;
                ++n2;
            }
            else {
                this.sync(file3, file4);
                normalize[n] = (normalize2[n2] = null);
                ++n;
                ++n2;
            }
        }
        for (int i = n; i < normalize.length; ++i) {
            this.copy(normalize[i], file2, true);
            normalize[i] = null;
        }
        for (int j = n2; j < normalize2.length; ++j) {
            this.copy(normalize2[j], file, false);
            normalize2[j] = null;
        }
    }
    
    private boolean isDeleted(final IFile file) throws IOException {
        boolean b = true;
        if (!this.options.mirror || this.options.direction == Options.Direction.Both) {
            if (this.deletionTrackMap != null) {
                final Long n = this.deletionTrackMap.get(this.getRelativePath(file));
                if (n != null && (file.isDirectory() || this.compare(file.getLastModified(), n) == 0L)) {
                    return b;
                }
            }
            b = false;
        }
        return b;
    }
    
    private boolean isSyncable(final IFile file) throws IOException {
        boolean b = false;
        if (this.options.filters != null) {
            final IFileFilter[] filters = this.options.filters;
            for (int length = filters.length, i = 0; i < length; ++i) {
                final boolean accept = filters[i].accept(file);
                b = false;
                if (!accept) {
                    return b;
                }
            }
        }
        if (this.options.ignoreSymLinks && file.isDirectory() && file.isSymlink()) {
            System.err.println(String.valueOf(file.getAbsolutePath()) + " is symlink, skipping");
        }
        else {
            b = true;
        }
        return b;
    }
    
    private boolean isTrackedFile(final IFile file) throws IOException {
        boolean b = false;
        switch ($SWITCH_TABLE$com$bv$sync$CifsSync$Options$Direction()[this.options.direction.ordinal()]) {
            default: {
                throw new IOException("Unknown sync direction: " + this.options.direction);
            }
            case 1:
            case 3:
            case 5: {
                b = (file instanceof LocalFile);
                break;
            }
            case 2:
            case 4: {
                b = (file instanceof RemoteFile);
                break;
            }
        }
        return b;
    }
    
    public static String[] listComputers(final String s, final String s2, final String s3) throws IOException {
        String string = "smb://";
        if (s != null && s.length() != 0) {
            string = String.valueOf(string) + s + "/";
        }
        SmbFile smbFile;
        if (s2 != null && s3 != null && s.length() != 0 && s2.length() != 0 && s3.length() != 0) {
            smbFile = new SmbFile(string, new NtlmPasswordAuthentication(s, s2, s3));
        }
        else {
            smbFile = new SmbFile(string);
        }
        return smbFile.list();
    }
    
    public static String[] listDomains(final String s, final String s2) throws IOException {
        SmbFile smbFile;
        if (s != null && s2 != null) {
            smbFile = new SmbFile("smb://", new NtlmPasswordAuthentication(null, s, s2));
        }
        else {
            smbFile = new SmbFile("smb://", NtlmPasswordAuthentication.ANONYMOUS);
        }
        return smbFile.list();
    }
    
    private IFile[] normalize(final IFile file) throws IOException {
        try {
            final TreeMap<String, IFile> removeTempFiles = this.removeTempFiles(file);
            return removeTempFiles.values().toArray(new IFile[removeTempFiles.size()]);
        }
        catch (SyncCancellationException ex) {
            throw ex;
        }
        catch (IOException ex2) {
            throw new SyncException(file.getAbsolutePath(), null, this.syncResult, ex2);
        }
        catch (Throwable t) {
            throw new SyncException(file.getAbsolutePath(), null, this.syncResult, new TransportException(t.getMessage(), t));
        }
    }
    
    private void printStats() {
        for (int i = 0; i < this.syncStats.timeZoneConflicts.length; ++i) {
            if (this.syncStats.timeZoneConflicts[i] != 0) {
                System.out.println("Time zone conflicts " + (i + 1) + " hours diff: " + this.syncStats.timeZoneConflicts[i]);
            }
        }
    }
    
    private int read(final byte[] array, final InputStream inputStream) throws IOException {
        final long currentTimeMillis = System.currentTimeMillis();
        final int read = inputStream.read(array);
        final SyncStats syncStats = this.syncStats;
        syncStats.readTime += System.currentTimeMillis() - currentTimeMillis;
        final SyncStats syncStats2 = this.syncStats;
        syncStats2.readBytes += read;
        return read;
    }
    
    private TreeMap<String, IFile> removeTempFiles(final IFile file) throws IOException {
        final TreeMap<String, IFile> treeMap = new TreeMap<String, IFile>(new Comparator<String>() {
            public int compare(final String s, final String s2) {
                return s.compareToIgnoreCase(s2);
            }
        });
        file.listFiles(new IFileFilter() {
            public boolean accept(final IFile file) throws IOException {
                if (CifsSync.this.progress != null) {
                    CifsSync.access$6(CifsSync.this, !CifsSync.this.progress.update(ProgressNotification.ProgressAction.Listing, 0, file));
                }
                if (CifsSync.this.canceled) {
                    throw new SyncCancellationException(CifsSync.this.syncResult);
                }
                if (file.getAbsolutePath().endsWith("_(!).(!)_tmp")) {
                    CifsSync.this.deleteTempFile(file);
                }
                else {
                    treeMap.put(CifsSync.this.fileComparator.stripSeparator(file.getName()), file);
                }
                return false;
            }
        });
        return treeMap;
    }
    
    private void sync(final IFile file, final IFile file2) throws IOException {
        final boolean directory = file.isDirectory();
        final boolean directory2 = file2.isDirectory();
        if (directory && directory2) {
            this.syncDirs(file, file2);
        }
        else {
            if (directory || directory2) {
                throw new ErrorCodeException(6, String.valueOf(file.getAbsolutePath()) + "\n" + file2.getAbsolutePath());
            }
            if (this.options.overwrite) {
                this.syncFiles(file, file2);
            }
            else {
                this.updateProgress(file.length(), file2.length(), file, file2);
            }
        }
        if (this.options.overwrite) {
            if (this.options.direction == Options.Direction.moveToRemote) {
                this.delete(file);
            }
            if (this.options.direction == Options.Direction.moveToLocal) {
                this.delete(file2);
            }
        }
    }
    
    private void syncDirs(final IFile file, final IFile file2) throws IOException {
        if (this.isSyncable(file) && this.isSyncable(file2)) {
            this.internalSyncDirs(file, file2);
        }
    }
    
    private void syncFiles(final IFile file, final IFile file2) throws IOException {
        long compare;
        long length;
        long length2;
        try {
            if (!this.isSyncable(file) || !this.isSyncable(file2)) {
                return;
            }
            compare = this.compare(file, file2);
            length = file.length();
            length2 = file2.length();
            if (compare == 0L) {
                this.updateProgress(length, length2, file, file2);
                return;
            }
            if (compare > 0L && this.options.direction != Options.Direction.toLocal && this.options.direction != Options.Direction.moveToLocal) {
                this.copyFile(file, file2.getParent());
                return;
            }
        }
        catch (IOException ex) {
            throw new SyncException(file.getAbsolutePath(), file2.getAbsolutePath(), this.syncResult, ex);
        }
        if (compare < 0L && this.options.direction != Options.Direction.toRemote && this.options.direction != Options.Direction.moveToRemote) {
            this.copyFile(file2, file.getParent());
        }
        else {
            this.updateProgress(length, length2, file, file2);
        }
    }
    
    private void trackCopy(final IFile file) throws IOException {
        if (this.deletionTrackMap != null && this.isTrackedFile(file)) {
            this.deletionTrackMap.put(this.getRelativePath(file), file.getLastModified());
            if (file instanceof LocalFile) {
                this.leftCount += 1;
            }
            else {
                this.rightCount += 1;
            }
            if (this.options.minFreeSpace != 0L) {
                int n;
                if (file instanceof LocalFile) {
                    n = 0;
                }
                else {
                    n = 1;
                }
                final long[] freeSpace = this.freeSpace;
                freeSpace[n] -= file.length();
            }
        }
    }
    
    private void trackCopyDir(final IFile file) throws IOException {
        SyncItem.Type type;
        if (file instanceof RemoteFile) {
            type = SyncItem.Type.RemoteFile;
        }
        else {
            type = SyncItem.Type.LocalFile;
        }
        this.syncResult.add(new SyncItem(file.getAbsolutePath(), file.getLastModified(), type, 0L, true));
        this.trackCopy(file);
    }
    
    private void trackCopyFile(final IFile file) throws IOException {
        SyncItem.Type type;
        if (file instanceof RemoteFile) {
            type = SyncItem.Type.RemoteFile;
        }
        else {
            type = SyncItem.Type.LocalFile;
        }
        this.syncResult.add(new SyncItem(file.getAbsolutePath(), file.getLastModified(), type, file.length(), false));
        this.trackCopy(file);
    }
    
    private void trackDelete(final IFile file, final String s) throws IOException {
        if (this.deletionTrackMap != null && this.isTrackedFile(file)) {
            this.deletionTrackMap.remove(s);
            if (file instanceof LocalFile) {
                this.leftCount -= 1;
            }
            else {
                this.rightCount -= 1;
            }
        }
    }
    
    private void updateProgress(final ProgressNotification.ProgressAction progressAction, final long n, final IFile file) {
        this.currentSize += n;
        if (this.progress != null) {
            final long n2 = lcmp(this.sizeCalculator.getSize(), 0L);
            int n3 = 0;
            if (n2 != 0) {
                n3 = (int)(100.0f * (this.currentSize / this.sizeCalculator.getSize()));
            }
            if (n3 > 100) {
                System.err.println("Invalid percent, done " + this.currentSize + " total " + this.sizeCalculator.getSize());
            }
            this.canceled = !this.progress.update(progressAction, n3, file);
            if (this.canceled) {
                throw new SyncCancellationException(this.syncResult);
            }
        }
    }
    
    private void validateDir(final IFile file) throws IOException {
        if (!file.exists() || !file.isDirectory()) {
            throw new FileNotFoundException(file.getAbsolutePath());
        }
    }
    
    private void write(final byte[] array, final OutputStream outputStream, final int n) throws IOException {
        final long currentTimeMillis = System.currentTimeMillis();
        outputStream.write(array, 0, n);
        final SyncStats syncStats = this.syncStats;
        syncStats.writeTime += System.currentTimeMillis() - currentTimeMillis;
        final SyncStats syncStats2 = this.syncStats;
        syncStats2.writeBytes += n;
    }
    
    public SyncStats getStats() {
        this.syncStats.reconnects = RemoteFile.totalRetryCount;
        return this.syncStats;
    }
    
    String normalizePath(final String s) {
        return s;
    }
    
    public List<SyncItem> sync(final IFile file, final IFile file2, final ProgressNotification progress) throws IOException, InterruptedException {
        this.canceled = false;
        this.currentSize = 0L;
        this.rightCount = 0;
        this.leftCount = 0;
        this.syncResult = new ArrayList<SyncItem>();
        System.out.println("Validating directories");
        this.validateDir(file);
        this.validateDir(file2);
        this.calcSize(file, file2);
        Thread.sleep(10L);
        if (this.options.minFreeSpace != 0L) {
            this.freeSpace[0] = file.getFreeSpace();
            this.freeSpace[1] = file2.getFreeSpace();
        }
        this.progress = progress;
        this.roots[0] = file;
        this.roots[1] = file2;
        try {
            System.out.println("Starting sync");
            final long currentTimeMillis = System.currentTimeMillis();
            try {
                this.internalSyncDirs(file, file2);
                this.trackDeletions();
                System.out.println("Sync finished, duration " + (System.currentTimeMillis() - currentTimeMillis) / 1000L + " seconds");
                final ArrayList<SyncItem> syncResult = this.syncResult;
                this.printStats();
                return syncResult;
            }
            catch (SyncException ex) {
                throw ex;
            }
            catch (IOException ex2) {
                throw new SyncException(null, null, this.syncResult, ex2);
            }
        }
        finally {}
    }
    
    protected void trackDeletions() throws IOException {
        if (this.deletionTrackMap != null && (this.options.direction == Options.Direction.Both || (this.options.direction == Options.Direction.toLocal && !this.options.mirror) || (this.options.direction == Options.Direction.toRemote && !this.options.mirror))) {
            final Map<String, Long> track = new DeletionTracker((DeletionTracker)null).track();
            this.deletionTrackMap.clear();
            this.deletionTrackMap.putAll(track);
        }
    }
    
    void updateProgress(long n, long n2, final IFile file, final IFile file2) {
        if (this.options.direction == Options.Direction.moveToLocal || this.options.direction == Options.Direction.toLocal) {
            n = 0L;
        }
        else if (this.options.direction == Options.Direction.moveToRemote || this.options.direction == Options.Direction.toRemote) {
            n2 = 0L;
        }
        final long n3 = n + n2;
        if (n3 != 0L && file != null) {
            this.updateProgress(ProgressNotification.ProgressAction.Synchronizing, n3, file);
        }
    }
    
    private class DeletionTracker
    {
        private long count;
        private final HashMap<String, Long> result;
        private long total;
        
        private DeletionTracker() {
            super();
            this.result = new HashMap<String, Long>();
        }
        
        private void add(final IFile file) throws IOException {
            final String access$3 = CifsSync.this.getRelativePath(file);
            final long lastModified = file.getLastModified();
            this.result.put(access$3, lastModified);
            CifsSync.this.deletionTrackMap.put(access$3, lastModified);
            if (CifsSync.this.progress != null) {
                this.updateProgress(file);
            }
        }
        
        private void addDirectory(final IFile file) throws IOException {
            this.addFiles(file.listFiles(new IFileFilter() {
                public boolean accept(final IFile file) throws IOException {
                    final boolean directory = file.isDirectory();
                    if (!directory && CifsSync.this.isSyncable(file)) {
                        DeletionTracker.this.add(file);
                    }
                    return directory;
                }
            }));
        }
        
        private void addFiles(final IFile[] array) throws IOException {
            for (int i = 0; i < array.length; ++i) {
                final IFile file = array[i];
                array[i] = null;
                if (CifsSync.this.isSyncable(file)) {
                    this.add(file);
                    this.addDirectory(file);
                }
            }
        }
        
        private void updateProgress(final IFile file) {
            this.count += 1L;
            final long n = lcmp(this.total, 0L);
            int n2 = 0;
            if (n != 0) {
                n2 = (int)(100.0f * (this.count / this.total));
            }
            CifsSync.access$6(CifsSync.this, !CifsSync.this.progress.update(ProgressNotification.ProgressAction.TrackingDeletions, n2, file));
            if (CifsSync.this.canceled) {
                throw new SyncCancellationException(CifsSync.this.syncResult);
            }
        }
        
        Map<String, Long> track() throws IOException {
            boolean b;
            if (CifsSync.this.options.direction == Options.Direction.toLocal) {
                b = true;
            }
            else {
                b = false;
            }
            IFile file;
            if (b) {
                file = CifsSync.this.roots[1];
            }
            else {
                file = CifsSync.this.roots[0];
            }
            if (CifsSync.this.options.direction != Options.Direction.moveToLocal && CifsSync.this.options.direction != Options.Direction.moveToRemote) {
                int n;
                if (b) {
                    n = CifsSync.this.rightCount;
                }
                else {
                    n = CifsSync.this.leftCount;
                }
                this.total = n;
            }
            this.addDirectory(file);
            return this.result;
        }
    }
    
    public static class Options
    {
        public Direction direction;
        public IFileFilter[] filters;
        public boolean ignoreSymLinks;
        public long minFreeSpace;
        public boolean mirror;
        public boolean overwrite;
        public VerifyTimeZone verifyTimeZone;
        
        public Options() {
            super();
            this.direction = Direction.Both;
            this.verifyTimeZone = VerifyTimeZone.OneHour;
        }
        
        public Options(final Direction direction, final boolean overwrite, final VerifyTimeZone verifyTimeZone, final IFileFilter[] filters) {
            this();
            this.direction = direction;
            this.overwrite = overwrite;
            this.verifyTimeZone = verifyTimeZone;
            this.filters = filters;
        }
        
        public enum Direction
        {
            Both("Both", 0), 
            moveToLocal("moveToLocal", 4), 
            moveToRemote("moveToRemote", 3), 
            toLocal("toLocal", 2), 
            toRemote("toRemote", 1);
        }
        
        public enum VerifyTimeZone
        {
            All("All", 2), 
            None("None", 0), 
            OneHour("OneHour", 1);
        }
    }
    
    public static class SyncCancellationException extends CancellationException
    {
        private static final long serialVersionUID = 1L;
        public final transient List<SyncItem> syncResult;
        
        SyncCancellationException(final List<SyncItem> syncResult) {
            super();
            this.syncResult = syncResult;
        }
    }
    
    public static class SyncException extends IOException
    {
        private static final long serialVersionUID = -8622550597504924183L;
        public final String destPath;
        public final transient List<SyncItem> result;
        public final String sourcePath;
        public final List<IFile> syncResult;
        
        SyncException(final String sourcePath, final String destPath, final List<SyncItem> result, final IOException ex) {
            super(ex.getMessage());
            this.initCause(ex);
            this.sourcePath = sourcePath;
            this.destPath = destPath;
            this.result = result;
            this.syncResult = null;
        }
    }
    
    public static class SyncStats
    {
        public long readBytes;
        public long readTime;
        public long reconnects;
        public final int[] timeZoneConflicts;
        public long writeBytes;
        public long writeTime;
        
        public SyncStats() {
            super();
            this.timeZoneConflicts = new int[25];
        }
    }
}
