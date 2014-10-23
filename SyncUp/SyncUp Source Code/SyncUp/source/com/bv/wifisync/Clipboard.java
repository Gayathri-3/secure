package com.bv.wifisync;

import android.content.*;
import android.os.*;
import android.annotation.*;
import java.util.*;
import java.io.*;
import com.bv.sync.*;
import android.net.wifi.*;

class Clipboard
{
    private static final String TAG = "Clipboard";
    private static IFile[] files;
    private static CutSubscriber subscriber;
    private static CopyType type;
    
    @SuppressLint({ "Wakelock" })
    private static PowerManager$WakeLock acquireWakeLock(final Context context) {
        final PowerManager$WakeLock wakeLock = ((PowerManager)context.getSystemService("power")).newWakeLock(1, context.getString(2131099649));
        wakeLock.acquire();
        return wakeLock;
    }
    
    static void clear() {
        Clipboard.files = null;
        Clipboard.subscriber = null;
    }
    
    static void clearSubscriber(final CutSubscriber cutSubscriber) {
        if (cutSubscriber == Clipboard.subscriber) {
            Clipboard.subscriber = null;
        }
    }
    
    static void copy(final IFile[] files) {
        synchronized (Clipboard.class) {
            Clipboard.files = files;
            Clipboard.type = CopyType.Copy;
        }
    }
    
    static void cut(final IFile[] files, final CutSubscriber subscriber) {
        synchronized (Clipboard.class) {
            Clipboard.files = files;
            Clipboard.type = CopyType.Cut;
            Clipboard.subscriber = subscriber;
        }
    }
    
    static int delete(final Context context, final IFile[] array, final ProgressNotification progressNotification) throws IOException, InterruptedException {
        final ArrayList<SyncItem> list = new ArrayList<SyncItem>();
        try {
            FileManager.delete(array, progressNotification, list);
            Utils.updateMediaFiles(context, list, progressNotification);
            return list.size();
        }
        finally {
            Utils.updateMediaFiles(context, list, progressNotification);
        }
    }
    
    static CopyType getDataType() {
        return Clipboard.type;
    }
    
    static boolean hasData() {
        synchronized (Clipboard.class) {
            return Clipboard.files != null && Clipboard.files.length != 0;
        }
    }
    
    private static boolean lockIsNeeded(final IFile... array) {
        final int length = array.length;
        int n = 0;
        boolean b;
        while (true) {
            b = false;
            if (n >= length) {
                break;
            }
            if (array[n] instanceof RemoteFile) {
                return true;
            }
            ++n;
        }
        return b;
        b = true;
        return b;
    }
    
    private static WifiManager$WifiLock lockWifi(final Context context) {
        final WifiManager$WifiLock wifiLock = ((WifiManager)context.getSystemService("wifi")).createWifiLock(1, "Clipboard");
        wifiLock.acquire();
        return wifiLock;
    }
    
    static int paste(final Context p0, final IFile p1, final ProgressNotification p2) throws IOException, InterruptedException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: ldc             Lcom/bv/wifisync/Clipboard;.class
        //     2: monitorenter   
        //     3: getstatic       com/bv/wifisync/Clipboard.files:[Lcom/bv/sync/IFile;
        //     6: astore          4
        //     8: ldc             Lcom/bv/wifisync/Clipboard;.class
        //    10: monitorexit    
        //    11: new             Ljava/util/ArrayList;
        //    14: dup            
        //    15: invokespecial   java/util/ArrayList.<init>:()V
        //    18: astore          5
        //    20: aload_0        
        //    21: invokestatic    com/bv/wifisync/Clipboard.acquireWakeLock:(Landroid/content/Context;)Landroid/os/PowerManager$WakeLock;
        //    24: astore          6
        //    26: aload           4
        //    28: invokestatic    com/bv/wifisync/Clipboard.lockIsNeeded:([Lcom/bv/sync/IFile;)Z
        //    31: ifne            55
        //    34: iconst_1       
        //    35: anewarray       Lcom/bv/sync/IFile;
        //    38: dup            
        //    39: iconst_0       
        //    40: aload_1        
        //    41: aastore        
        //    42: invokestatic    com/bv/wifisync/Clipboard.lockIsNeeded:([Lcom/bv/sync/IFile;)Z
        //    45: istore          11
        //    47: aconst_null    
        //    48: astore          9
        //    50: iload           11
        //    52: ifeq            65
        //    55: aload_0        
        //    56: invokestatic    com/bv/wifisync/Clipboard.lockWifi:(Landroid/content/Context;)Landroid/net/wifi/WifiManager$WifiLock;
        //    59: astore          8
        //    61: aload           8
        //    63: astore          9
        //    65: getstatic       com/bv/wifisync/Clipboard.type:Lcom/bv/wifisync/Clipboard$CopyType;
        //    68: getstatic       com/bv/wifisync/Clipboard$CopyType.Copy:Lcom/bv/wifisync/Clipboard$CopyType;
        //    71: if_acmpne       146
        //    74: aload           4
        //    76: aload_1        
        //    77: aload_2        
        //    78: aload           5
        //    80: invokestatic    com/bv/sync/FileManager.copy:([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
        //    83: aload           9
        //    85: ifnull          93
        //    88: aload           9
        //    90: invokevirtual   android/net/wifi/WifiManager$WifiLock.release:()V
        //    93: getstatic       com/bv/wifisync/Clipboard.type:Lcom/bv/wifisync/Clipboard$CopyType;
        //    96: getstatic       com/bv/wifisync/Clipboard$CopyType.Cut:Lcom/bv/wifisync/Clipboard$CopyType;
        //    99: if_acmpne       106
        //   102: aconst_null    
        //   103: putstatic       com/bv/wifisync/Clipboard.files:[Lcom/bv/sync/IFile;
        //   106: aload_0        
        //   107: aload           5
        //   109: aload_2        
        //   110: invokestatic    com/bv/wifisync/Utils.updateMediaFiles:(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
        //   113: getstatic       com/bv/wifisync/Clipboard.subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;
        //   116: ifnull          127
        //   119: getstatic       com/bv/wifisync/Clipboard.subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;
        //   122: invokeinterface com/bv/wifisync/Clipboard$CutSubscriber.onPaste:()V
        //   127: aload           6
        //   129: invokevirtual   android/os/PowerManager$WakeLock.release:()V
        //   132: aload           5
        //   134: invokeinterface java/util/List.size:()I
        //   139: ireturn        
        //   140: astore_3       
        //   141: ldc             Lcom/bv/wifisync/Clipboard;.class
        //   143: monitorexit    
        //   144: aload_3        
        //   145: athrow         
        //   146: aload           4
        //   148: aload_1        
        //   149: aload_2        
        //   150: aload           5
        //   152: invokestatic    com/bv/sync/FileManager.move:([Lcom/bv/sync/IFile;Lcom/bv/sync/IFile;Lcom/bv/sync/ProgressNotification;Ljava/util/List;)V
        //   155: goto            83
        //   158: astore          10
        //   160: aload           9
        //   162: ifnull          170
        //   165: aload           9
        //   167: invokevirtual   android/net/wifi/WifiManager$WifiLock.release:()V
        //   170: getstatic       com/bv/wifisync/Clipboard.type:Lcom/bv/wifisync/Clipboard$CopyType;
        //   173: getstatic       com/bv/wifisync/Clipboard$CopyType.Cut:Lcom/bv/wifisync/Clipboard$CopyType;
        //   176: if_acmpne       183
        //   179: aconst_null    
        //   180: putstatic       com/bv/wifisync/Clipboard.files:[Lcom/bv/sync/IFile;
        //   183: aload_0        
        //   184: aload           5
        //   186: aload_2        
        //   187: invokestatic    com/bv/wifisync/Utils.updateMediaFiles:(Landroid/content/Context;Ljava/util/Collection;Lcom/bv/sync/ProgressNotification;)V
        //   190: getstatic       com/bv/wifisync/Clipboard.subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;
        //   193: ifnull          204
        //   196: getstatic       com/bv/wifisync/Clipboard.subscriber:Lcom/bv/wifisync/Clipboard$CutSubscriber;
        //   199: invokeinterface com/bv/wifisync/Clipboard$CutSubscriber.onPaste:()V
        //   204: aload           10
        //   206: athrow         
        //   207: astore          7
        //   209: aload           6
        //   211: invokevirtual   android/os/PowerManager$WakeLock.release:()V
        //   214: aload           7
        //   216: athrow         
        //    Exceptions:
        //  throws java.io.IOException
        //  throws java.lang.InterruptedException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  3      11     140    146    Any
        //  26     61     207    217    Any
        //  65     83     158    207    Any
        //  88     127    207    217    Any
        //  141    144    140    146    Any
        //  146    155    158    207    Any
        //  165    207    207    217    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0055:
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
    
    enum CopyType
    {
        Copy("Copy", 0), 
        Cut("Cut", 1);
    }
    
    interface CutSubscriber
    {
        void onPaste();
    }
}
