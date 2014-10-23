package com.google.android.apps.analytics;

import android.util.*;
import java.net.*;
import java.io.*;
import java.util.*;
import android.content.*;
import android.database.*;
import android.database.sqlite.*;

class PersistentHitStore implements HitStore
{
    private static final String ACCOUNT_ID = "account_id";
    private static final String ACTION = "action";
    private static final String CATEGORY = "category";
    private static final String CREATE_CUSTOM_VARIABLES_TABLE;
    private static final String CREATE_CUSTOM_VAR_CACHE_TABLE;
    private static final String CREATE_EVENTS_TABLE;
    private static final String CREATE_HITS_TABLE;
    private static final String CREATE_INSTALL_REFERRER_TABLE = "CREATE TABLE install_referrer (referrer TEXT PRIMARY KEY NOT NULL);";
    private static final String CREATE_ITEM_EVENTS_TABLE;
    private static final String CREATE_REFERRER_TABLE = "CREATE TABLE IF NOT EXISTS referrer (referrer TEXT PRIMARY KEY NOT NULL,timestamp_referrer INTEGER NOT NULL,referrer_visit INTEGER NOT NULL DEFAULT 1,referrer_index INTEGER NOT NULL DEFAULT 1);";
    private static final String CREATE_SESSION_TABLE;
    private static final String CREATE_TRANSACTION_EVENTS_TABLE;
    private static final String CUSTOMVAR_ID = "cv_id";
    private static final String CUSTOMVAR_INDEX = "cv_index";
    private static final String CUSTOMVAR_NAME = "cv_name";
    private static final String CUSTOMVAR_SCOPE = "cv_scope";
    private static final String CUSTOMVAR_VALUE = "cv_value";
    private static final String CUSTOM_VARIABLE_COLUMN_TYPE = "CHAR(64) NOT NULL";
    private static final String DATABASE_NAME = "google_analytics.db";
    private static final int DATABASE_VERSION = 5;
    private static final String EVENT_ID = "event_id";
    private static final String HIT_ID = "hit_id";
    private static final String HIT_STRING = "hit_string";
    private static final String HIT_TIMESTAMP = "hit_time";
    private static final String ITEM_CATEGORY = "item_category";
    private static final String ITEM_COUNT = "item_count";
    private static final String ITEM_ID = "item_id";
    private static final String ITEM_NAME = "item_name";
    private static final String ITEM_PRICE = "item_price";
    private static final String ITEM_SKU = "item_sku";
    private static final String LABEL = "label";
    private static final int MAX_HITS = 1000;
    private static final String ORDER_ID = "order_id";
    private static final String RANDOM_VAL = "random_val";
    static final String REFERRER = "referrer";
    static final String REFERRER_COLUMN = "referrer";
    static final String REFERRER_INDEX = "referrer_index";
    static final String REFERRER_VISIT = "referrer_visit";
    private static final String SCREEN_HEIGHT = "screen_height";
    private static final String SCREEN_WIDTH = "screen_width";
    private static final String SHIPPING_COST = "tran_shippingcost";
    private static final String STORE_ID = "store_id";
    private static final String STORE_NAME = "tran_storename";
    private static final String TIMESTAMP_CURRENT = "timestamp_current";
    private static final String TIMESTAMP_FIRST = "timestamp_first";
    private static final String TIMESTAMP_PREVIOUS = "timestamp_previous";
    static final String TIMESTAMP_REFERRER = "timestamp_referrer";
    private static final String TOTAL_COST = "tran_totalcost";
    private static final String TOTAL_TAX = "tran_totaltax";
    private static final String TRANSACTION_ID = "tran_id";
    private static final String USER_ID = "user_id";
    private static final String VALUE = "value";
    private static final String VISITS = "visits";
    private boolean anonymizeIp;
    private DataBaseHelper databaseHelper;
    private volatile int numStoredHits;
    private Random random;
    private int sampleRate;
    private boolean sessionStarted;
    private int storeId;
    private long timestampCurrent;
    private long timestampFirst;
    private long timestampPrevious;
    private boolean useStoredVisitorVars;
    private CustomVariableBuffer visitorCVCache;
    private int visits;
    
    static {
        CREATE_EVENTS_TABLE = "CREATE TABLE events (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", "event_id") + String.format(" '%s' INTEGER NOT NULL,", "user_id") + String.format(" '%s' CHAR(256) NOT NULL,", "account_id") + String.format(" '%s' INTEGER NOT NULL,", "random_val") + String.format(" '%s' INTEGER NOT NULL,", "timestamp_first") + String.format(" '%s' INTEGER NOT NULL,", "timestamp_previous") + String.format(" '%s' INTEGER NOT NULL,", "timestamp_current") + String.format(" '%s' INTEGER NOT NULL,", "visits") + String.format(" '%s' CHAR(256) NOT NULL,", "category") + String.format(" '%s' CHAR(256) NOT NULL,", "action") + String.format(" '%s' CHAR(256), ", "label") + String.format(" '%s' INTEGER,", "value") + String.format(" '%s' INTEGER,", "screen_width") + String.format(" '%s' INTEGER);", "screen_height");
        CREATE_SESSION_TABLE = "CREATE TABLE IF NOT EXISTS session (" + String.format(" '%s' INTEGER PRIMARY KEY,", "timestamp_first") + String.format(" '%s' INTEGER NOT NULL,", "timestamp_previous") + String.format(" '%s' INTEGER NOT NULL,", "timestamp_current") + String.format(" '%s' INTEGER NOT NULL,", "visits") + String.format(" '%s' INTEGER NOT NULL);", "store_id");
        CREATE_CUSTOM_VARIABLES_TABLE = "CREATE TABLE custom_variables (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", "cv_id") + String.format(" '%s' INTEGER NOT NULL,", "event_id") + String.format(" '%s' INTEGER NOT NULL,", "cv_index") + String.format(" '%s' CHAR(64) NOT NULL,", "cv_name") + String.format(" '%s' CHAR(64) NOT NULL,", "cv_value") + String.format(" '%s' INTEGER NOT NULL);", "cv_scope");
        CREATE_CUSTOM_VAR_CACHE_TABLE = "CREATE TABLE IF NOT EXISTS custom_var_cache (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", "cv_id") + String.format(" '%s' INTEGER NOT NULL,", "event_id") + String.format(" '%s' INTEGER NOT NULL,", "cv_index") + String.format(" '%s' CHAR(64) NOT NULL,", "cv_name") + String.format(" '%s' CHAR(64) NOT NULL,", "cv_value") + String.format(" '%s' INTEGER NOT NULL);", "cv_scope");
        CREATE_TRANSACTION_EVENTS_TABLE = "CREATE TABLE transaction_events (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", "tran_id") + String.format(" '%s' INTEGER NOT NULL,", "event_id") + String.format(" '%s' TEXT NOT NULL,", "order_id") + String.format(" '%s' TEXT,", "tran_storename") + String.format(" '%s' TEXT NOT NULL,", "tran_totalcost") + String.format(" '%s' TEXT,", "tran_totaltax") + String.format(" '%s' TEXT);", "tran_shippingcost");
        CREATE_ITEM_EVENTS_TABLE = "CREATE TABLE item_events (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", "item_id") + String.format(" '%s' INTEGER NOT NULL,", "event_id") + String.format(" '%s' TEXT NOT NULL,", "order_id") + String.format(" '%s' TEXT NOT NULL,", "item_sku") + String.format(" '%s' TEXT,", "item_name") + String.format(" '%s' TEXT,", "item_category") + String.format(" '%s' TEXT NOT NULL,", "item_price") + String.format(" '%s' TEXT NOT NULL);", "item_count");
        CREATE_HITS_TABLE = "CREATE TABLE IF NOT EXISTS hits (" + String.format(" '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,", "hit_id") + String.format(" '%s' TEXT NOT NULL,", "hit_string") + String.format(" '%s' INTEGER NOT NULL);", "hit_time");
    }
    
    PersistentHitStore(final Context context) {
        this(context, "google_analytics.db", 5);
    }
    
    PersistentHitStore(final Context context, final String s) {
        this(context, s, 5);
    }
    
    PersistentHitStore(final Context context, final String s, final int n) {
        super();
        this.sampleRate = 100;
        this.random = new Random();
        this.databaseHelper = new DataBaseHelper(context, s, n, this);
        this.loadExistingSession();
        this.visitorCVCache = this.getVisitorVarBuffer();
    }
    
    PersistentHitStore(final DataBaseHelper databaseHelper) {
        super();
        this.sampleRate = 100;
        this.random = new Random();
        this.databaseHelper = databaseHelper;
        this.loadExistingSession();
        this.visitorCVCache = this.getVisitorVarBuffer();
    }
    
    private static boolean endTransaction(final SQLiteDatabase sqLiteDatabase) {
        try {
            sqLiteDatabase.endTransaction();
            return true;
        }
        catch (SQLiteException ex) {
            Log.e("GoogleAnalyticsTracker", "exception ending transaction:" + ex.toString());
            return false;
        }
    }
    
    static String formatReferrer(String decode) {
        String string;
        if (decode == null) {
            string = null;
        }
        else {
            Label_0018: {
                if (!decode.contains("=")) {
                    if (decode.contains("%3D")) {
                        try {
                            decode = URLDecoder.decode(decode, "UTF-8");
                            break Label_0018;
                        }
                        catch (UnsupportedEncodingException ex) {
                            string = null;
                            return string;
                        }
                    }
                    string = null;
                    return string;
                }
            }
            final Map<String, String> urlParameters = Utils.parseURLParameters(decode);
            boolean b;
            if (urlParameters.get("utm_campaign") != null) {
                b = true;
            }
            else {
                b = false;
            }
            boolean b2;
            if (urlParameters.get("utm_medium") != null) {
                b2 = true;
            }
            else {
                b2 = false;
            }
            boolean b3;
            if (urlParameters.get("utm_source") != null) {
                b3 = true;
            }
            else {
                b3 = false;
            }
            boolean b4;
            if (urlParameters.get("gclid") != null) {
                b4 = true;
            }
            else {
                b4 = false;
            }
            if (!b4 && (!b || !b2 || !b3)) {
                Log.w("GoogleAnalyticsTracker", "Badly formatted referrer missing campaign, medium and source or click ID");
                string = null;
            }
            else {
                final String[][] array = { { "utmcid", urlParameters.get("utm_id") }, { "utmcsr", urlParameters.get("utm_source") }, { "utmgclid", urlParameters.get("gclid") }, { "utmccn", urlParameters.get("utm_campaign") }, { "utmcmd", urlParameters.get("utm_medium") }, { "utmctr", urlParameters.get("utm_term") }, { "utmcct", urlParameters.get("utm_content") } };
                final StringBuilder sb = new StringBuilder();
                int i = 0;
                int n = 1;
                while (i < array.length) {
                    if (array[i][1] != null) {
                        final String replace = array[i][1].replace("+", "%20").replace(" ", "%20");
                        if (n != 0) {
                            n = 0;
                        }
                        else {
                            sb.append("|");
                        }
                        sb.append(array[i][0]).append("=").append(replace);
                    }
                    ++i;
                }
                string = sb.toString();
            }
        }
        return string;
    }
    
    private Referrer getAndUpdateReferrer(final SQLiteDatabase sqLiteDatabase) {
        final Referrer currentReferrer = this.readCurrentReferrer(sqLiteDatabase);
        Referrer referrer = null;
        if (currentReferrer != null) {
            if (currentReferrer.getTimeStamp() != 0L) {
                referrer = currentReferrer;
            }
            else {
                final int index = currentReferrer.getIndex();
                final String referrerString = currentReferrer.getReferrerString();
                final ContentValues contentValues = new ContentValues();
                contentValues.put("referrer", referrerString);
                contentValues.put("timestamp_referrer", this.timestampCurrent);
                contentValues.put("referrer_visit", this.visits);
                contentValues.put("referrer_index", index);
                final boolean setReferrerDatabase = this.setReferrerDatabase(sqLiteDatabase, contentValues);
                referrer = null;
                if (setReferrerDatabase) {
                    referrer = new Referrer(referrerString, this.timestampCurrent, this.visits, index);
                }
            }
        }
        return referrer;
    }
    
    private void putEvent(final Event event, final SQLiteDatabase sqLiteDatabase, final boolean b) {
        if (!event.isSessionInitialized()) {
            event.setRandomVal(this.random.nextInt(Integer.MAX_VALUE));
            event.setTimestampFirst((int)this.timestampFirst);
            event.setTimestampPrevious((int)this.timestampPrevious);
            event.setTimestampCurrent((int)this.timestampCurrent);
            event.setVisits(this.visits);
        }
        event.setAnonymizeIp(this.anonymizeIp);
        if (event.getUserId() == -1) {
            event.setUserId(this.storeId);
        }
        this.putCustomVariables(event, sqLiteDatabase);
        final Referrer andUpdateReferrer = this.getAndUpdateReferrer(sqLiteDatabase);
        final String[] split = event.accountId.split(",");
        if (split.length == 1) {
            this.writeEventToDatabase(event, andUpdateReferrer, sqLiteDatabase, b);
        }
        else {
            for (int length = split.length, i = 0; i < length; ++i) {
                this.writeEventToDatabase(new Event(event, split[i]), andUpdateReferrer, sqLiteDatabase, b);
            }
        }
    }
    
    private boolean setReferrerDatabase(final SQLiteDatabase sqLiteDatabase, final ContentValues contentValues) {
        while (true) {
            try {
                sqLiteDatabase.beginTransaction();
                sqLiteDatabase.delete("referrer", (String)null, (String[])null);
                sqLiteDatabase.insert("referrer", (String)null, contentValues);
                sqLiteDatabase.setTransactionSuccessful();
                if (sqLiteDatabase.inTransaction()) {
                    final boolean endTransaction = endTransaction(sqLiteDatabase);
                    final boolean b = false;
                    if (!endTransaction) {
                        return b;
                    }
                }
            }
            catch (SQLiteException ex) {
                Log.e("GoogleAnalyticsTracker", ex.toString());
                final boolean inTransaction = sqLiteDatabase.inTransaction();
                boolean b = false;
                if (!inTransaction) {
                    return b;
                }
                final boolean endTransaction2 = endTransaction(sqLiteDatabase);
                b = false;
                if (!endTransaction2) {
                    b = false;
                    return b;
                }
                return b;
            }
            finally {
                if (sqLiteDatabase.inTransaction()) {
                    final boolean endTransaction3 = endTransaction(sqLiteDatabase);
                    final boolean b = false;
                    if (!endTransaction3) {
                        return b;
                    }
                }
            }
            return true;
        }
    }
    
    public void clearReferrer() {
        try {
            this.databaseHelper.getWritableDatabase().delete("referrer", (String)null, (String[])null);
        }
        catch (SQLiteException ex) {
            Log.e("GoogleAnalyticsTracker", ex.toString());
        }
    }
    
    public void deleteHit(final long n) {
        synchronized (this) {
            try {
                this.numStoredHits -= this.databaseHelper.getWritableDatabase().delete("hits", "hit_id = ?", new String[] { Long.toString(n) });
            }
            catch (SQLiteException ex) {
                Log.e("GoogleAnalyticsTracker", ex.toString());
            }
        }
    }
    
    CustomVariableBuffer getCustomVariables(final long p0, final SQLiteDatabase p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     3: dup            
        //     4: invokespecial   com/google/android/apps/analytics/CustomVariableBuffer.<init>:()V
        //     7: astore          4
        //     9: iconst_1       
        //    10: anewarray       Ljava/lang/String;
        //    13: astore          9
        //    15: aload           9
        //    17: iconst_0       
        //    18: lload_1        
        //    19: invokestatic    java/lang/Long.toString:(J)Ljava/lang/String;
        //    22: aastore        
        //    23: aload_3        
        //    24: ldc_w           "custom_variables"
        //    27: aconst_null    
        //    28: ldc_w           "event_id= ?"
        //    31: aload           9
        //    33: aconst_null    
        //    34: aconst_null    
        //    35: aconst_null    
        //    36: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    39: astore          10
        //    41: aload           10
        //    43: astore          6
        //    45: aload           6
        //    47: invokeinterface android/database/Cursor.moveToNext:()Z
        //    52: ifeq            163
        //    55: aload           4
        //    57: new             Lcom/google/android/apps/analytics/CustomVariable;
        //    60: dup            
        //    61: aload           6
        //    63: aload           6
        //    65: ldc             "cv_index"
        //    67: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    72: invokeinterface android/database/Cursor.getInt:(I)I
        //    77: aload           6
        //    79: aload           6
        //    81: ldc             "cv_name"
        //    83: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    88: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    93: aload           6
        //    95: aload           6
        //    97: ldc             "cv_value"
        //    99: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   104: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   109: aload           6
        //   111: aload           6
        //   113: ldc             "cv_scope"
        //   115: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   120: invokeinterface android/database/Cursor.getInt:(I)I
        //   125: invokespecial   com/google/android/apps/analytics/CustomVariable.<init>:(ILjava/lang/String;Ljava/lang/String;I)V
        //   128: invokevirtual   com/google/android/apps/analytics/CustomVariableBuffer.setCustomVariable:(Lcom/google/android/apps/analytics/CustomVariable;)V
        //   131: goto            45
        //   134: astore          5
        //   136: ldc_w           "GoogleAnalyticsTracker"
        //   139: aload           5
        //   141: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   144: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   147: pop            
        //   148: aload           6
        //   150: ifnull          160
        //   153: aload           6
        //   155: invokeinterface android/database/Cursor.close:()V
        //   160: aload           4
        //   162: areturn        
        //   163: aload           6
        //   165: ifnull          160
        //   168: aload           6
        //   170: invokeinterface android/database/Cursor.close:()V
        //   175: goto            160
        //   178: astore          7
        //   180: aconst_null    
        //   181: astore          6
        //   183: aload           6
        //   185: ifnull          195
        //   188: aload           6
        //   190: invokeinterface android/database/Cursor.close:()V
        //   195: aload           7
        //   197: athrow         
        //   198: astore          7
        //   200: goto            183
        //   203: astore          5
        //   205: aconst_null    
        //   206: astore          6
        //   208: goto            136
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  9      41     203    211    Landroid/database/sqlite/SQLiteException;
        //  9      41     178    183    Any
        //  45     131    134    136    Landroid/database/sqlite/SQLiteException;
        //  45     131    198    203    Any
        //  136    148    198    203    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0045:
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
    
    DataBaseHelper getDatabaseHelper() {
        return this.databaseHelper;
    }
    
    Item getItem(final long p0, final SQLiteDatabase p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: anewarray       Ljava/lang/String;
        //     4: astore          10
        //     6: aload           10
        //     8: iconst_0       
        //     9: lload_1        
        //    10: invokestatic    java/lang/Long.toString:(J)Ljava/lang/String;
        //    13: aastore        
        //    14: aload_3        
        //    15: ldc_w           "item_events"
        //    18: aconst_null    
        //    19: ldc_w           "event_id= ?"
        //    22: aload           10
        //    24: aconst_null    
        //    25: aconst_null    
        //    26: aconst_null    
        //    27: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    30: astore          11
        //    32: aload           11
        //    34: astore          5
        //    36: aload           5
        //    38: invokeinterface android/database/Cursor.moveToFirst:()Z
        //    43: ifeq            179
        //    46: new             Lcom/google/android/apps/analytics/Item$Builder;
        //    49: dup            
        //    50: aload           5
        //    52: aload           5
        //    54: ldc             "order_id"
        //    56: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    61: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    66: aload           5
        //    68: aload           5
        //    70: ldc             "item_sku"
        //    72: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    77: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    82: aload           5
        //    84: aload           5
        //    86: ldc             "item_price"
        //    88: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    93: invokeinterface android/database/Cursor.getDouble:(I)D
        //    98: aload           5
        //   100: aload           5
        //   102: ldc             "item_count"
        //   104: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   109: invokeinterface android/database/Cursor.getLong:(I)J
        //   114: invokespecial   com/google/android/apps/analytics/Item$Builder.<init>:(Ljava/lang/String;Ljava/lang/String;DJ)V
        //   117: aload           5
        //   119: aload           5
        //   121: ldc             "item_name"
        //   123: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   128: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   133: invokevirtual   com/google/android/apps/analytics/Item$Builder.setItemName:(Ljava/lang/String;)Lcom/google/android/apps/analytics/Item$Builder;
        //   136: aload           5
        //   138: aload           5
        //   140: ldc             "item_category"
        //   142: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   147: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   152: invokevirtual   com/google/android/apps/analytics/Item$Builder.setItemCategory:(Ljava/lang/String;)Lcom/google/android/apps/analytics/Item$Builder;
        //   155: invokevirtual   com/google/android/apps/analytics/Item$Builder.build:()Lcom/google/android/apps/analytics/Item;
        //   158: astore          12
        //   160: aload           12
        //   162: astore          9
        //   164: aload           5
        //   166: ifnull          176
        //   169: aload           5
        //   171: invokeinterface android/database/Cursor.close:()V
        //   176: aload           9
        //   178: areturn        
        //   179: aload           5
        //   181: ifnull          191
        //   184: aload           5
        //   186: invokeinterface android/database/Cursor.close:()V
        //   191: aconst_null    
        //   192: astore          9
        //   194: goto            176
        //   197: astore          6
        //   199: aconst_null    
        //   200: astore          7
        //   202: ldc_w           "GoogleAnalyticsTracker"
        //   205: aload           6
        //   207: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   210: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   213: pop            
        //   214: aload           7
        //   216: ifnull          191
        //   219: aload           7
        //   221: invokeinterface android/database/Cursor.close:()V
        //   226: goto            191
        //   229: astore          4
        //   231: aconst_null    
        //   232: astore          5
        //   234: aload           5
        //   236: ifnull          246
        //   239: aload           5
        //   241: invokeinterface android/database/Cursor.close:()V
        //   246: aload           4
        //   248: athrow         
        //   249: astore          4
        //   251: goto            234
        //   254: astore          4
        //   256: aload           7
        //   258: astore          5
        //   260: goto            234
        //   263: astore          6
        //   265: aload           5
        //   267: astore          7
        //   269: goto            202
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  0      32     197    202    Landroid/database/sqlite/SQLiteException;
        //  0      32     229    234    Any
        //  36     160    263    272    Landroid/database/sqlite/SQLiteException;
        //  36     160    249    254    Any
        //  202    214    254    263    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 107, Size: 107
        //     at java.util.ArrayList.rangeCheck(Unknown Source)
        //     at java.util.ArrayList.get(Unknown Source)
        //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3262)
        //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
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
    
    public int getNumStoredHits() {
        return this.numStoredHits;
    }
    
    public int getNumStoredHitsFromDb() {
        Cursor rawQuery = null;
        try {
            rawQuery = this.databaseHelper.getReadableDatabase().rawQuery("SELECT COUNT(*) from hits", (String[])null);
            final boolean moveToFirst = rawQuery.moveToFirst();
            int n = 0;
            if (moveToFirst) {
                n = (int)rawQuery.getLong(0);
            }
            return n;
        }
        catch (SQLiteException ex) {
            Log.e("GoogleAnalyticsTracker", ex.toString());
            int n = 0;
            if (rawQuery != null) {
                rawQuery.close();
                n = 0;
                return n;
            }
            return n;
        }
        finally {
            if (rawQuery != null) {
                rawQuery.close();
            }
        }
    }
    
    public Referrer getReferrer() {
        try {
            return this.readCurrentReferrer(this.databaseHelper.getReadableDatabase());
        }
        catch (SQLiteException ex) {
            Log.e("GoogleAnalyticsTracker", ex.toString());
            return null;
        }
    }
    
    public String getSessionId() {
        String string;
        if (!this.sessionStarted) {
            string = null;
        }
        else {
            string = Integer.toString((int)this.timestampCurrent);
        }
        return string;
    }
    
    public int getStoreId() {
        return this.storeId;
    }
    
    long getTimestampCurrent() {
        return this.timestampCurrent;
    }
    
    long getTimestampFirst() {
        return this.timestampFirst;
    }
    
    long getTimestampPrevious() {
        return this.timestampPrevious;
    }
    
    Transaction getTransaction(final long p0, final SQLiteDatabase p1) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: anewarray       Ljava/lang/String;
        //     4: astore          9
        //     6: aload           9
        //     8: iconst_0       
        //     9: lload_1        
        //    10: invokestatic    java/lang/Long.toString:(J)Ljava/lang/String;
        //    13: aastore        
        //    14: aload_3        
        //    15: ldc_w           "transaction_events"
        //    18: aconst_null    
        //    19: ldc_w           "event_id= ?"
        //    22: aload           9
        //    24: aconst_null    
        //    25: aconst_null    
        //    26: aconst_null    
        //    27: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    30: astore          10
        //    32: aload           10
        //    34: astore          5
        //    36: aload           5
        //    38: invokeinterface android/database/Cursor.moveToFirst:()Z
        //    43: ifeq            166
        //    46: new             Lcom/google/android/apps/analytics/Transaction$Builder;
        //    49: dup            
        //    50: aload           5
        //    52: aload           5
        //    54: ldc             "order_id"
        //    56: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    61: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    66: aload           5
        //    68: aload           5
        //    70: ldc             "tran_totalcost"
        //    72: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    77: invokeinterface android/database/Cursor.getDouble:(I)D
        //    82: invokespecial   com/google/android/apps/analytics/Transaction$Builder.<init>:(Ljava/lang/String;D)V
        //    85: aload           5
        //    87: aload           5
        //    89: ldc             "tran_storename"
        //    91: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    96: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   101: invokevirtual   com/google/android/apps/analytics/Transaction$Builder.setStoreName:(Ljava/lang/String;)Lcom/google/android/apps/analytics/Transaction$Builder;
        //   104: aload           5
        //   106: aload           5
        //   108: ldc             "tran_totaltax"
        //   110: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   115: invokeinterface android/database/Cursor.getDouble:(I)D
        //   120: invokevirtual   com/google/android/apps/analytics/Transaction$Builder.setTotalTax:(D)Lcom/google/android/apps/analytics/Transaction$Builder;
        //   123: aload           5
        //   125: aload           5
        //   127: ldc             "tran_shippingcost"
        //   129: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   134: invokeinterface android/database/Cursor.getDouble:(I)D
        //   139: invokevirtual   com/google/android/apps/analytics/Transaction$Builder.setShippingCost:(D)Lcom/google/android/apps/analytics/Transaction$Builder;
        //   142: invokevirtual   com/google/android/apps/analytics/Transaction$Builder.build:()Lcom/google/android/apps/analytics/Transaction;
        //   145: astore          11
        //   147: aload           11
        //   149: astore          8
        //   151: aload           5
        //   153: ifnull          163
        //   156: aload           5
        //   158: invokeinterface android/database/Cursor.close:()V
        //   163: aload           8
        //   165: areturn        
        //   166: aload           5
        //   168: ifnull          178
        //   171: aload           5
        //   173: invokeinterface android/database/Cursor.close:()V
        //   178: aconst_null    
        //   179: astore          8
        //   181: goto            163
        //   184: astore          6
        //   186: aconst_null    
        //   187: astore          5
        //   189: ldc_w           "GoogleAnalyticsTracker"
        //   192: aload           6
        //   194: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   197: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   200: pop            
        //   201: aload           5
        //   203: ifnull          178
        //   206: aload           5
        //   208: invokeinterface android/database/Cursor.close:()V
        //   213: goto            178
        //   216: astore          4
        //   218: aconst_null    
        //   219: astore          5
        //   221: aload           5
        //   223: ifnull          233
        //   226: aload           5
        //   228: invokeinterface android/database/Cursor.close:()V
        //   233: aload           4
        //   235: athrow         
        //   236: astore          4
        //   238: goto            221
        //   241: astore          6
        //   243: goto            189
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  0      32     184    189    Landroid/database/sqlite/SQLiteException;
        //  0      32     216    221    Any
        //  36     147    241    246    Landroid/database/sqlite/SQLiteException;
        //  36     147    236    241    Any
        //  189    201    236    241    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0163:
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
    
    public String getVisitorCustomVar(final int n) {
        final CustomVariable customVariable = this.visitorCVCache.getCustomVariableAt(n);
        String value;
        if (customVariable == null || customVariable.getScope() != 1) {
            value = null;
        }
        else {
            value = customVariable.getValue();
        }
        return value;
    }
    
    public String getVisitorId() {
        String format;
        if (!this.sessionStarted) {
            format = null;
        }
        else {
            format = String.format("%d.%d", this.storeId, this.timestampFirst);
        }
        return format;
    }
    
    CustomVariableBuffer getVisitorVarBuffer() {
        try {
            return this.getVisitorVarBuffer(this.databaseHelper.getReadableDatabase());
        }
        catch (SQLiteException ex) {
            Log.e("GoogleAnalyticsTracker", ex.toString());
            return new CustomVariableBuffer();
        }
    }
    
    CustomVariableBuffer getVisitorVarBuffer(final SQLiteDatabase p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     3: dup            
        //     4: invokespecial   com/google/android/apps/analytics/CustomVariableBuffer.<init>:()V
        //     7: astore_2       
        //     8: iconst_1       
        //     9: anewarray       Ljava/lang/String;
        //    12: astore          7
        //    14: aload           7
        //    16: iconst_0       
        //    17: iconst_1       
        //    18: invokestatic    java/lang/Integer.toString:(I)Ljava/lang/String;
        //    21: aastore        
        //    22: aload_1        
        //    23: ldc_w           "custom_var_cache"
        //    26: aconst_null    
        //    27: ldc_w           "cv_scope= ?"
        //    30: aload           7
        //    32: aconst_null    
        //    33: aconst_null    
        //    34: aconst_null    
        //    35: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    38: astore          8
        //    40: aload           8
        //    42: astore          4
        //    44: aload           4
        //    46: invokeinterface android/database/Cursor.moveToNext:()Z
        //    51: ifeq            158
        //    54: aload_2        
        //    55: new             Lcom/google/android/apps/analytics/CustomVariable;
        //    58: dup            
        //    59: aload           4
        //    61: aload           4
        //    63: ldc             "cv_index"
        //    65: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    70: invokeinterface android/database/Cursor.getInt:(I)I
        //    75: aload           4
        //    77: aload           4
        //    79: ldc             "cv_name"
        //    81: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    86: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    91: aload           4
        //    93: aload           4
        //    95: ldc             "cv_value"
        //    97: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   102: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   107: aload           4
        //   109: aload           4
        //   111: ldc             "cv_scope"
        //   113: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   118: invokeinterface android/database/Cursor.getInt:(I)I
        //   123: invokespecial   com/google/android/apps/analytics/CustomVariable.<init>:(ILjava/lang/String;Ljava/lang/String;I)V
        //   126: invokevirtual   com/google/android/apps/analytics/CustomVariableBuffer.setCustomVariable:(Lcom/google/android/apps/analytics/CustomVariable;)V
        //   129: goto            44
        //   132: astore_3       
        //   133: ldc_w           "GoogleAnalyticsTracker"
        //   136: aload_3        
        //   137: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   140: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   143: pop            
        //   144: aload           4
        //   146: ifnull          156
        //   149: aload           4
        //   151: invokeinterface android/database/Cursor.close:()V
        //   156: aload_2        
        //   157: areturn        
        //   158: aload           4
        //   160: ifnull          156
        //   163: aload           4
        //   165: invokeinterface android/database/Cursor.close:()V
        //   170: goto            156
        //   173: astore          5
        //   175: aconst_null    
        //   176: astore          4
        //   178: aload           4
        //   180: ifnull          190
        //   183: aload           4
        //   185: invokeinterface android/database/Cursor.close:()V
        //   190: aload           5
        //   192: athrow         
        //   193: astore          5
        //   195: goto            178
        //   198: astore_3       
        //   199: aconst_null    
        //   200: astore          4
        //   202: goto            133
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  8      40     198    205    Landroid/database/sqlite/SQLiteException;
        //  8      40     173    178    Any
        //  44     129    132    133    Landroid/database/sqlite/SQLiteException;
        //  44     129    193    198    Any
        //  133    144    193    198    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0044:
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
    
    int getVisits() {
        return this.visits;
    }
    
    public void loadExistingSession() {
        try {
            this.loadExistingSession(this.databaseHelper.getWritableDatabase());
        }
        catch (SQLiteException ex) {
            Log.e("GoogleAnalyticsTracker", ex.toString());
        }
    }
    
    public void loadExistingSession(final SQLiteDatabase p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_1        
        //     1: ldc_w           "session"
        //     4: aconst_null    
        //     5: aconst_null    
        //     6: aconst_null    
        //     7: aconst_null    
        //     8: aconst_null    
        //     9: aconst_null    
        //    10: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    13: astore          6
        //    15: aload           6
        //    17: astore_3       
        //    18: aload_3        
        //    19: invokeinterface android/database/Cursor.moveToFirst:()Z
        //    24: ifeq            139
        //    27: aload_0        
        //    28: aload_3        
        //    29: iconst_0       
        //    30: invokeinterface android/database/Cursor.getLong:(I)J
        //    35: putfield        com/google/android/apps/analytics/PersistentHitStore.timestampFirst:J
        //    38: aload_0        
        //    39: aload_3        
        //    40: iconst_1       
        //    41: invokeinterface android/database/Cursor.getLong:(I)J
        //    46: putfield        com/google/android/apps/analytics/PersistentHitStore.timestampPrevious:J
        //    49: aload_0        
        //    50: aload_3        
        //    51: iconst_2       
        //    52: invokeinterface android/database/Cursor.getLong:(I)J
        //    57: putfield        com/google/android/apps/analytics/PersistentHitStore.timestampCurrent:J
        //    60: aload_0        
        //    61: aload_3        
        //    62: iconst_3       
        //    63: invokeinterface android/database/Cursor.getInt:(I)I
        //    68: putfield        com/google/android/apps/analytics/PersistentHitStore.visits:I
        //    71: aload_0        
        //    72: aload_3        
        //    73: iconst_4       
        //    74: invokeinterface android/database/Cursor.getInt:(I)I
        //    79: putfield        com/google/android/apps/analytics/PersistentHitStore.storeId:I
        //    82: aload_0        
        //    83: aload_1        
        //    84: invokevirtual   com/google/android/apps/analytics/PersistentHitStore.readCurrentReferrer:(Landroid/database/sqlite/SQLiteDatabase;)Lcom/google/android/apps/analytics/Referrer;
        //    87: astore          10
        //    89: aload_0        
        //    90: getfield        com/google/android/apps/analytics/PersistentHitStore.timestampFirst:J
        //    93: lconst_0       
        //    94: lcmp           
        //    95: ifeq            133
        //    98: aload           10
        //   100: ifnull          309
        //   103: aload           10
        //   105: invokevirtual   com/google/android/apps/analytics/Referrer.getTimeStamp:()J
        //   108: lconst_0       
        //   109: lcmp           
        //   110: ifeq            133
        //   113: goto            309
        //   116: aload_0        
        //   117: iload           11
        //   119: putfield        com/google/android/apps/analytics/PersistentHitStore.sessionStarted:Z
        //   122: aload_3        
        //   123: ifnull          132
        //   126: aload_3        
        //   127: invokeinterface android/database/Cursor.close:()V
        //   132: return         
        //   133: iconst_0       
        //   134: istore          11
        //   136: goto            116
        //   139: aload_0        
        //   140: iconst_0       
        //   141: putfield        com/google/android/apps/analytics/PersistentHitStore.sessionStarted:Z
        //   144: aload_0        
        //   145: iconst_1       
        //   146: putfield        com/google/android/apps/analytics/PersistentHitStore.useStoredVisitorVars:Z
        //   149: aload_0        
        //   150: ldc_w           2147483647
        //   153: new             Ljava/security/SecureRandom;
        //   156: dup            
        //   157: invokespecial   java/security/SecureRandom.<init>:()V
        //   160: invokevirtual   java/security/SecureRandom.nextInt:()I
        //   163: iand           
        //   164: putfield        com/google/android/apps/analytics/PersistentHitStore.storeId:I
        //   167: aload_3        
        //   168: invokeinterface android/database/Cursor.close:()V
        //   173: new             Landroid/content/ContentValues;
        //   176: dup            
        //   177: invokespecial   android/content/ContentValues.<init>:()V
        //   180: astore          7
        //   182: aload           7
        //   184: ldc             "timestamp_first"
        //   186: lconst_0       
        //   187: invokestatic    java/lang/Long.valueOf:(J)Ljava/lang/Long;
        //   190: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Long;)V
        //   193: aload           7
        //   195: ldc             "timestamp_previous"
        //   197: lconst_0       
        //   198: invokestatic    java/lang/Long.valueOf:(J)Ljava/lang/Long;
        //   201: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Long;)V
        //   204: aload           7
        //   206: ldc             "timestamp_current"
        //   208: lconst_0       
        //   209: invokestatic    java/lang/Long.valueOf:(J)Ljava/lang/Long;
        //   212: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Long;)V
        //   215: aload           7
        //   217: ldc             "visits"
        //   219: iconst_0       
        //   220: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
        //   223: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
        //   226: aload           7
        //   228: ldc             "store_id"
        //   230: aload_0        
        //   231: getfield        com/google/android/apps/analytics/PersistentHitStore.storeId:I
        //   234: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
        //   237: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
        //   240: aload_1        
        //   241: ldc_w           "session"
        //   244: aconst_null    
        //   245: aload           7
        //   247: invokevirtual   android/database/sqlite/SQLiteDatabase.insert:(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
        //   250: pop2           
        //   251: aconst_null    
        //   252: astore_3       
        //   253: goto            122
        //   256: astore          4
        //   258: aconst_null    
        //   259: astore_3       
        //   260: ldc_w           "GoogleAnalyticsTracker"
        //   263: aload           4
        //   265: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   268: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   271: pop            
        //   272: aload_3        
        //   273: ifnull          132
        //   276: aload_3        
        //   277: invokeinterface android/database/Cursor.close:()V
        //   282: goto            132
        //   285: astore_2       
        //   286: aconst_null    
        //   287: astore_3       
        //   288: aload_3        
        //   289: ifnull          298
        //   292: aload_3        
        //   293: invokeinterface android/database/Cursor.close:()V
        //   298: aload_2        
        //   299: athrow         
        //   300: astore_2       
        //   301: goto            288
        //   304: astore          4
        //   306: goto            260
        //   309: iconst_1       
        //   310: istore          11
        //   312: goto            116
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  0      15     256    260    Landroid/database/sqlite/SQLiteException;
        //  0      15     285    288    Any
        //  18     122    304    309    Landroid/database/sqlite/SQLiteException;
        //  18     122    300    304    Any
        //  139    173    304    309    Landroid/database/sqlite/SQLiteException;
        //  139    173    300    304    Any
        //  173    251    256    260    Landroid/database/sqlite/SQLiteException;
        //  173    251    285    288    Any
        //  260    272    300    304    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0116:
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
    
    public Event[] peekEvents(final int p0, final SQLiteDatabase p1, final int p2) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Ljava/util/ArrayList;
        //     3: dup            
        //     4: invokespecial   java/util/ArrayList.<init>:()V
        //     7: astore          4
        //     9: aload_2        
        //    10: ldc_w           "events"
        //    13: aconst_null    
        //    14: aconst_null    
        //    15: aconst_null    
        //    16: aconst_null    
        //    17: aconst_null    
        //    18: ldc             "event_id"
        //    20: iload_1        
        //    21: invokestatic    java/lang/Integer.toString:(I)Ljava/lang/String;
        //    24: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    27: astore          11
        //    29: aload           11
        //    31: astore          8
        //    33: aload           8
        //    35: invokeinterface android/database/Cursor.moveToNext:()Z
        //    40: ifeq            433
        //    43: new             Lcom/google/android/apps/analytics/Event;
        //    46: dup            
        //    47: aload           8
        //    49: iconst_0       
        //    50: invokeinterface android/database/Cursor.getLong:(I)J
        //    55: aload           8
        //    57: iconst_2       
        //    58: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    63: aload           8
        //    65: iconst_3       
        //    66: invokeinterface android/database/Cursor.getInt:(I)I
        //    71: aload           8
        //    73: iconst_4       
        //    74: invokeinterface android/database/Cursor.getInt:(I)I
        //    79: aload           8
        //    81: iconst_5       
        //    82: invokeinterface android/database/Cursor.getInt:(I)I
        //    87: aload           8
        //    89: bipush          6
        //    91: invokeinterface android/database/Cursor.getInt:(I)I
        //    96: aload           8
        //    98: bipush          7
        //   100: invokeinterface android/database/Cursor.getInt:(I)I
        //   105: aload           8
        //   107: bipush          8
        //   109: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   114: aload           8
        //   116: bipush          9
        //   118: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   123: aload           8
        //   125: bipush          10
        //   127: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   132: aload           8
        //   134: bipush          11
        //   136: invokeinterface android/database/Cursor.getInt:(I)I
        //   141: aload           8
        //   143: bipush          12
        //   145: invokeinterface android/database/Cursor.getInt:(I)I
        //   150: aload           8
        //   152: bipush          13
        //   154: invokeinterface android/database/Cursor.getInt:(I)I
        //   159: invokespecial   com/google/android/apps/analytics/Event.<init>:(JLjava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V
        //   162: astore          12
        //   164: aload           12
        //   166: aload           8
        //   168: iconst_1       
        //   169: invokeinterface android/database/Cursor.getInt:(I)I
        //   174: invokevirtual   com/google/android/apps/analytics/Event.setUserId:(I)V
        //   177: aload           8
        //   179: ldc             "event_id"
        //   181: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   186: istore          13
        //   188: aload           8
        //   190: iload           13
        //   192: invokeinterface android/database/Cursor.getLong:(I)J
        //   197: lstore          14
        //   199: ldc_w           "__##GOOGLETRANSACTION##__"
        //   202: aload           12
        //   204: getfield        com/google/android/apps/analytics/Event.category:Ljava/lang/String;
        //   207: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //   210: ifeq            314
        //   213: aload_0        
        //   214: lload           14
        //   216: aload_2        
        //   217: invokevirtual   com/google/android/apps/analytics/PersistentHitStore.getTransaction:(JLandroid/database/sqlite/SQLiteDatabase;)Lcom/google/android/apps/analytics/Transaction;
        //   220: astore          20
        //   222: aload           20
        //   224: ifnonnull       255
        //   227: ldc_w           "GoogleAnalyticsTracker"
        //   230: new             Ljava/lang/StringBuilder;
        //   233: dup            
        //   234: invokespecial   java/lang/StringBuilder.<init>:()V
        //   237: ldc_w           "missing expected transaction for event "
        //   240: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   243: lload           14
        //   245: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //   248: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   251: invokestatic    android/util/Log.w:(Ljava/lang/String;Ljava/lang/String;)I
        //   254: pop            
        //   255: aload           12
        //   257: aload           20
        //   259: invokevirtual   com/google/android/apps/analytics/Event.setTransaction:(Lcom/google/android/apps/analytics/Transaction;)V
        //   262: aload           4
        //   264: aload           12
        //   266: invokeinterface java/util/List.add:(Ljava/lang/Object;)Z
        //   271: pop            
        //   272: goto            33
        //   275: astore          5
        //   277: aload           8
        //   279: astore          6
        //   281: ldc_w           "GoogleAnalyticsTracker"
        //   284: aload           5
        //   286: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   289: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   292: pop            
        //   293: iconst_0       
        //   294: anewarray       Lcom/google/android/apps/analytics/Event;
        //   297: astore          10
        //   299: aload           6
        //   301: ifnull          311
        //   304: aload           6
        //   306: invokeinterface android/database/Cursor.close:()V
        //   311: aload           10
        //   313: areturn        
        //   314: ldc_w           "__##GOOGLEITEM##__"
        //   317: aload           12
        //   319: getfield        com/google/android/apps/analytics/Event.category:Ljava/lang/String;
        //   322: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //   325: ifeq            397
        //   328: aload_0        
        //   329: lload           14
        //   331: aload_2        
        //   332: invokevirtual   com/google/android/apps/analytics/PersistentHitStore.getItem:(JLandroid/database/sqlite/SQLiteDatabase;)Lcom/google/android/apps/analytics/Item;
        //   335: astore          18
        //   337: aload           18
        //   339: ifnonnull       370
        //   342: ldc_w           "GoogleAnalyticsTracker"
        //   345: new             Ljava/lang/StringBuilder;
        //   348: dup            
        //   349: invokespecial   java/lang/StringBuilder.<init>:()V
        //   352: ldc_w           "missing expected item for event "
        //   355: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   358: lload           14
        //   360: invokevirtual   java/lang/StringBuilder.append:(J)Ljava/lang/StringBuilder;
        //   363: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   366: invokestatic    android/util/Log.w:(Ljava/lang/String;Ljava/lang/String;)I
        //   369: pop            
        //   370: aload           12
        //   372: aload           18
        //   374: invokevirtual   com/google/android/apps/analytics/Event.setItem:(Lcom/google/android/apps/analytics/Item;)V
        //   377: goto            262
        //   380: astore          7
        //   382: aload           8
        //   384: ifnull          394
        //   387: aload           8
        //   389: invokeinterface android/database/Cursor.close:()V
        //   394: aload           7
        //   396: athrow         
        //   397: iload_3        
        //   398: iconst_1       
        //   399: if_icmple       421
        //   402: aload_0        
        //   403: lload           14
        //   405: aload_2        
        //   406: invokevirtual   com/google/android/apps/analytics/PersistentHitStore.getCustomVariables:(JLandroid/database/sqlite/SQLiteDatabase;)Lcom/google/android/apps/analytics/CustomVariableBuffer;
        //   409: astore          16
        //   411: aload           12
        //   413: aload           16
        //   415: invokevirtual   com/google/android/apps/analytics/Event.setCustomVariableBuffer:(Lcom/google/android/apps/analytics/CustomVariableBuffer;)V
        //   418: goto            262
        //   421: new             Lcom/google/android/apps/analytics/CustomVariableBuffer;
        //   424: dup            
        //   425: invokespecial   com/google/android/apps/analytics/CustomVariableBuffer.<init>:()V
        //   428: astore          16
        //   430: goto            411
        //   433: aload           8
        //   435: ifnull          445
        //   438: aload           8
        //   440: invokeinterface android/database/Cursor.close:()V
        //   445: aload           4
        //   447: aload           4
        //   449: invokeinterface java/util/List.size:()I
        //   454: anewarray       Lcom/google/android/apps/analytics/Event;
        //   457: invokeinterface java/util/List.toArray:([Ljava/lang/Object;)[Ljava/lang/Object;
        //   462: checkcast       [Lcom/google/android/apps/analytics/Event;
        //   465: astore          10
        //   467: goto            311
        //   470: astore          7
        //   472: aconst_null    
        //   473: astore          8
        //   475: goto            382
        //   478: astore          7
        //   480: aload           6
        //   482: astore          8
        //   484: goto            382
        //   487: astore          5
        //   489: aconst_null    
        //   490: astore          6
        //   492: goto            281
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  9      29     487    495    Landroid/database/sqlite/SQLiteException;
        //  9      29     470    478    Any
        //  33     272    275    281    Landroid/database/sqlite/SQLiteException;
        //  33     272    380    382    Any
        //  281    299    478    487    Any
        //  314    377    275    281    Landroid/database/sqlite/SQLiteException;
        //  314    377    380    382    Any
        //  402    430    275    281    Landroid/database/sqlite/SQLiteException;
        //  402    430    380    382    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0281:
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
    
    public Hit[] peekHits() {
        return this.peekHits(1000);
    }
    
    public Hit[] peekHits(final int p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: new             Ljava/util/ArrayList;
        //     3: dup            
        //     4: invokespecial   java/util/ArrayList.<init>:()V
        //     7: astore_2       
        //     8: aload_0        
        //     9: getfield        com/google/android/apps/analytics/PersistentHitStore.databaseHelper:Lcom/google/android/apps/analytics/PersistentHitStore$DataBaseHelper;
        //    12: invokevirtual   com/google/android/apps/analytics/PersistentHitStore$DataBaseHelper.getReadableDatabase:()Landroid/database/sqlite/SQLiteDatabase;
        //    15: ldc_w           "hits"
        //    18: aconst_null    
        //    19: aconst_null    
        //    20: aconst_null    
        //    21: aconst_null    
        //    22: aconst_null    
        //    23: ldc             "hit_id"
        //    25: iload_1        
        //    26: invokestatic    java/lang/Integer.toString:(I)Ljava/lang/String;
        //    29: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    32: astore          8
        //    34: aload           8
        //    36: astore          4
        //    38: aload           4
        //    40: invokeinterface android/database/Cursor.moveToNext:()Z
        //    45: ifeq            114
        //    48: aload_2        
        //    49: new             Lcom/google/android/apps/analytics/Hit;
        //    52: dup            
        //    53: aload           4
        //    55: iconst_1       
        //    56: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //    61: aload           4
        //    63: iconst_0       
        //    64: invokeinterface android/database/Cursor.getLong:(I)J
        //    69: invokespecial   com/google/android/apps/analytics/Hit.<init>:(Ljava/lang/String;J)V
        //    72: invokeinterface java/util/List.add:(Ljava/lang/Object;)Z
        //    77: pop            
        //    78: goto            38
        //    81: astore_3       
        //    82: ldc_w           "GoogleAnalyticsTracker"
        //    85: aload_3        
        //    86: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //    89: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //    92: pop            
        //    93: iconst_0       
        //    94: anewarray       Lcom/google/android/apps/analytics/Hit;
        //    97: astore          7
        //    99: aload           4
        //   101: ifnull          111
        //   104: aload           4
        //   106: invokeinterface android/database/Cursor.close:()V
        //   111: aload           7
        //   113: areturn        
        //   114: aload           4
        //   116: ifnull          126
        //   119: aload           4
        //   121: invokeinterface android/database/Cursor.close:()V
        //   126: aload_2        
        //   127: aload_2        
        //   128: invokeinterface java/util/List.size:()I
        //   133: anewarray       Lcom/google/android/apps/analytics/Hit;
        //   136: invokeinterface java/util/List.toArray:([Ljava/lang/Object;)[Ljava/lang/Object;
        //   141: checkcast       [Lcom/google/android/apps/analytics/Hit;
        //   144: astore          7
        //   146: goto            111
        //   149: astore          5
        //   151: aconst_null    
        //   152: astore          4
        //   154: aload           4
        //   156: ifnull          166
        //   159: aload           4
        //   161: invokeinterface android/database/Cursor.close:()V
        //   166: aload           5
        //   168: athrow         
        //   169: astore          5
        //   171: goto            154
        //   174: astore_3       
        //   175: aconst_null    
        //   176: astore          4
        //   178: goto            82
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  8      34     174    181    Landroid/database/sqlite/SQLiteException;
        //  8      34     149    154    Any
        //  38     78     81     82     Landroid/database/sqlite/SQLiteException;
        //  38     78     169    174    Any
        //  82     99     169    174    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0038:
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
    
    void putCustomVariables(final Event event, final SQLiteDatabase sqLiteDatabase) {
        if (!"__##GOOGLEITEM##__".equals(event.category) && !"__##GOOGLETRANSACTION##__".equals(event.category)) {
            CustomVariableBuffer customVariableBuffer = null;
            CustomVariable customVariable;
            CustomVariableBuffer customVariableBuffer2 = null;
            int n = 0;
            ContentValues contentValues;
            int n2 = 0;
            CustomVariable customVariable2;
            CustomVariable customVariable3;
            Label_0063_Outer:Label_0121_Outer:
            while (true) {
                while (true) {
                    Label_0334: {
                    Label_0323:
                        while (true) {
                            Label_0317: {
                                Label_0311: {
                                    Label_0304: {
                                        try {
                                            customVariableBuffer = event.getCustomVariableBuffer();
                                            if (!this.useStoredVisitorVars) {
                                                break Label_0304;
                                            }
                                            if (customVariableBuffer == null) {
                                                customVariableBuffer = new CustomVariableBuffer();
                                                event.setCustomVariableBuffer(customVariableBuffer);
                                            }
                                            break Label_0311;
                                            Label_0274: {
                                                this.visitorCVCache.clearCustomVariableAt(customVariable.getIndex());
                                            }
                                            break Label_0334;
                                            // iftrue(Label_0274:, customVariable.getScope() != 1)
                                            // iftrue(Label_0109:, n2 > 5)
                                            // iftrue(Label_0317:, customVariable2 == null || customVariable3 != null)
                                            // iftrue(Label_0026:, n > 5)
                                            // iftrue(Label_0334:, customVariableBuffer2.isIndexAvailable(n))
                                        Block_11:
                                            while (true) {
                                                customVariable = customVariableBuffer2.getCustomVariableAt(n);
                                                contentValues = new ContentValues();
                                                contentValues.put("event_id", 0);
                                                contentValues.put("cv_index", customVariable.getIndex());
                                                contentValues.put("cv_name", customVariable.getName());
                                                contentValues.put("cv_scope", customVariable.getScope());
                                                contentValues.put("cv_value", customVariable.getValue());
                                                sqLiteDatabase.update("custom_var_cache", contentValues, "cv_index = ?", new String[] { Integer.toString(customVariable.getIndex()) });
                                                break Block_11;
                                                while (true) {
                                                    Block_6: {
                                                        break Block_6;
                                                        customVariableBuffer.setCustomVariable(customVariable2);
                                                        break Label_0317;
                                                    }
                                                    customVariable2 = this.visitorCVCache.getCustomVariableAt(n2);
                                                    customVariable3 = customVariableBuffer.getCustomVariableAt(n2);
                                                    continue Label_0121_Outer;
                                                }
                                                Label_0109:
                                                this.useStoredVisitorVars = false;
                                                customVariableBuffer2 = customVariableBuffer;
                                                break Label_0323;
                                                continue Label_0063_Outer;
                                            }
                                            this.visitorCVCache.setCustomVariable(customVariable);
                                            break Label_0334;
                                        }
                                        catch (SQLiteException ex) {
                                            Log.e("GoogleAnalyticsTracker", ex.toString());
                                            break;
                                        }
                                    }
                                    customVariableBuffer2 = customVariableBuffer;
                                    break Label_0323;
                                }
                                n2 = 1;
                                continue Label_0121_Outer;
                            }
                            ++n2;
                            continue Label_0121_Outer;
                        }
                        if (customVariableBuffer2 != null) {
                            n = 1;
                            continue;
                        }
                        break;
                    }
                    ++n;
                    continue;
                }
            }
        }
        Label_0026:;
    }
    
    public void putEvent(final Event p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: getfield        com/google/android/apps/analytics/PersistentHitStore.numStoredHits:I
        //     4: sipush          1000
        //     7: if_icmplt       21
        //    10: ldc_w           "GoogleAnalyticsTracker"
        //    13: ldc_w           "Store full. Not storing last event."
        //    16: invokestatic    android/util/Log.w:(Ljava/lang/String;Ljava/lang/String;)I
        //    19: pop            
        //    20: return         
        //    21: aload_0        
        //    22: getfield        com/google/android/apps/analytics/PersistentHitStore.sampleRate:I
        //    25: bipush          100
        //    27: if_icmpeq       91
        //    30: aload_1        
        //    31: invokevirtual   com/google/android/apps/analytics/Event.getUserId:()I
        //    34: iconst_m1      
        //    35: if_icmpne       82
        //    38: aload_0        
        //    39: getfield        com/google/android/apps/analytics/PersistentHitStore.storeId:I
        //    42: istore          12
        //    44: iload           12
        //    46: sipush          10000
        //    49: irem           
        //    50: bipush          100
        //    52: aload_0        
        //    53: getfield        com/google/android/apps/analytics/PersistentHitStore.sampleRate:I
        //    56: imul           
        //    57: if_icmplt       91
        //    60: invokestatic    com/google/android/apps/analytics/GoogleAnalyticsTracker.getInstance:()Lcom/google/android/apps/analytics/GoogleAnalyticsTracker;
        //    63: invokevirtual   com/google/android/apps/analytics/GoogleAnalyticsTracker.getDebug:()Z
        //    66: ifeq            20
        //    69: ldc_w           "GoogleAnalyticsTracker"
        //    72: ldc_w           "User has been sampled out. Aborting hit."
        //    75: invokestatic    android/util/Log.v:(Ljava/lang/String;Ljava/lang/String;)I
        //    78: pop            
        //    79: goto            20
        //    82: aload_1        
        //    83: invokevirtual   com/google/android/apps/analytics/Event.getUserId:()I
        //    86: istore          12
        //    88: goto            44
        //    91: aload_0        
        //    92: monitorenter   
        //    93: aload_0        
        //    94: getfield        com/google/android/apps/analytics/PersistentHitStore.databaseHelper:Lcom/google/android/apps/analytics/PersistentHitStore$DataBaseHelper;
        //    97: invokevirtual   com/google/android/apps/analytics/PersistentHitStore$DataBaseHelper.getWritableDatabase:()Landroid/database/sqlite/SQLiteDatabase;
        //   100: astore          5
        //   102: aload           5
        //   104: invokevirtual   android/database/sqlite/SQLiteDatabase.beginTransaction:()V
        //   107: aload_0        
        //   108: getfield        com/google/android/apps/analytics/PersistentHitStore.sessionStarted:Z
        //   111: ifne            120
        //   114: aload_0        
        //   115: aload           5
        //   117: invokevirtual   com/google/android/apps/analytics/PersistentHitStore.storeUpdatedSession:(Landroid/database/sqlite/SQLiteDatabase;)V
        //   120: aload_0        
        //   121: aload_1        
        //   122: aload           5
        //   124: iconst_1       
        //   125: invokespecial   com/google/android/apps/analytics/PersistentHitStore.putEvent:(Lcom/google/android/apps/analytics/Event;Landroid/database/sqlite/SQLiteDatabase;Z)V
        //   128: aload           5
        //   130: invokevirtual   android/database/sqlite/SQLiteDatabase.setTransactionSuccessful:()V
        //   133: aload           5
        //   135: invokevirtual   android/database/sqlite/SQLiteDatabase.inTransaction:()Z
        //   138: ifeq            147
        //   141: aload           5
        //   143: invokestatic    com/google/android/apps/analytics/PersistentHitStore.endTransaction:(Landroid/database/sqlite/SQLiteDatabase;)Z
        //   146: pop            
        //   147: aload_0        
        //   148: monitorexit    
        //   149: goto            20
        //   152: astore          4
        //   154: aload_0        
        //   155: monitorexit    
        //   156: aload           4
        //   158: athrow         
        //   159: astore_2       
        //   160: ldc_w           "GoogleAnalyticsTracker"
        //   163: new             Ljava/lang/StringBuilder;
        //   166: dup            
        //   167: invokespecial   java/lang/StringBuilder.<init>:()V
        //   170: ldc_w           "Can't get db: "
        //   173: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   176: aload_2        
        //   177: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   180: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   183: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   186: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   189: pop            
        //   190: aload_0        
        //   191: monitorexit    
        //   192: goto            20
        //   195: astore          8
        //   197: ldc_w           "GoogleAnalyticsTracker"
        //   200: new             Ljava/lang/StringBuilder;
        //   203: dup            
        //   204: invokespecial   java/lang/StringBuilder.<init>:()V
        //   207: ldc_w           "putEventOuter:"
        //   210: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   213: aload           8
        //   215: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   218: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   221: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   224: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   227: pop            
        //   228: aload           5
        //   230: invokevirtual   android/database/sqlite/SQLiteDatabase.inTransaction:()Z
        //   233: ifeq            147
        //   236: aload           5
        //   238: invokestatic    com/google/android/apps/analytics/PersistentHitStore.endTransaction:(Landroid/database/sqlite/SQLiteDatabase;)Z
        //   241: pop            
        //   242: goto            147
        //   245: astore          6
        //   247: aload           5
        //   249: invokevirtual   android/database/sqlite/SQLiteDatabase.inTransaction:()Z
        //   252: ifeq            261
        //   255: aload           5
        //   257: invokestatic    com/google/android/apps/analytics/PersistentHitStore.endTransaction:(Landroid/database/sqlite/SQLiteDatabase;)Z
        //   260: pop            
        //   261: aload           6
        //   263: athrow         
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  93     102    159    195    Landroid/database/sqlite/SQLiteException;
        //  93     102    152    159    Any
        //  102    133    195    245    Landroid/database/sqlite/SQLiteException;
        //  102    133    245    264    Any
        //  133    156    152    159    Any
        //  160    192    152    159    Any
        //  197    228    245    264    Any
        //  228    264    152    159    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0120:
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
    
    Referrer readCurrentReferrer(final SQLiteDatabase p0) {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: ldc             "referrer"
        //     3: iconst_4       
        //     4: anewarray       Ljava/lang/String;
        //     7: dup            
        //     8: iconst_0       
        //     9: ldc             "referrer"
        //    11: aastore        
        //    12: dup            
        //    13: iconst_1       
        //    14: ldc             "timestamp_referrer"
        //    16: aastore        
        //    17: dup            
        //    18: iconst_2       
        //    19: ldc             "referrer_visit"
        //    21: aastore        
        //    22: dup            
        //    23: iconst_3       
        //    24: ldc             "referrer_index"
        //    26: aastore        
        //    27: aconst_null    
        //    28: aconst_null    
        //    29: aconst_null    
        //    30: aconst_null    
        //    31: aconst_null    
        //    32: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
        //    35: astore          8
        //    37: aload           8
        //    39: astore_3       
        //    40: aload_3        
        //    41: invokeinterface android/database/Cursor.moveToFirst:()Z
        //    46: ifeq            208
        //    49: aload_3        
        //    50: aload_3        
        //    51: ldc             "timestamp_referrer"
        //    53: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    58: invokeinterface android/database/Cursor.getLong:(I)J
        //    63: lstore          9
        //    65: aload_3        
        //    66: aload_3        
        //    67: ldc             "referrer_visit"
        //    69: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    74: invokeinterface android/database/Cursor.getInt:(I)I
        //    79: istore          11
        //    81: aload_3        
        //    82: aload_3        
        //    83: ldc             "referrer_index"
        //    85: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //    90: invokeinterface android/database/Cursor.getInt:(I)I
        //    95: istore          12
        //    97: new             Lcom/google/android/apps/analytics/Referrer;
        //   100: dup            
        //   101: aload_3        
        //   102: aload_3        
        //   103: ldc             "referrer"
        //   105: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
        //   110: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
        //   115: lload           9
        //   117: iload           11
        //   119: iload           12
        //   121: invokespecial   com/google/android/apps/analytics/Referrer.<init>:(Ljava/lang/String;JII)V
        //   124: astore          7
        //   126: aload_3        
        //   127: ifnull          136
        //   130: aload_3        
        //   131: invokeinterface android/database/Cursor.close:()V
        //   136: aload           7
        //   138: areturn        
        //   139: astore          4
        //   141: aconst_null    
        //   142: astore          5
        //   144: ldc_w           "GoogleAnalyticsTracker"
        //   147: aload           4
        //   149: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
        //   152: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
        //   155: pop            
        //   156: aload           5
        //   158: ifnull          168
        //   161: aload           5
        //   163: invokeinterface android/database/Cursor.close:()V
        //   168: aconst_null    
        //   169: astore          7
        //   171: goto            136
        //   174: astore_2       
        //   175: aconst_null    
        //   176: astore_3       
        //   177: aload_3        
        //   178: ifnull          187
        //   181: aload_3        
        //   182: invokeinterface android/database/Cursor.close:()V
        //   187: aload_2        
        //   188: athrow         
        //   189: astore_2       
        //   190: goto            177
        //   193: astore_2       
        //   194: aload           5
        //   196: astore_3       
        //   197: goto            177
        //   200: astore          4
        //   202: aload_3        
        //   203: astore          5
        //   205: goto            144
        //   208: aconst_null    
        //   209: astore          7
        //   211: goto            126
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type                                     
        //  -----  -----  -----  -----  -----------------------------------------
        //  0      37     139    144    Landroid/database/sqlite/SQLiteException;
        //  0      37     174    177    Any
        //  40     126    200    208    Landroid/database/sqlite/SQLiteException;
        //  40     126    189    193    Any
        //  144    156    193    200    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IndexOutOfBoundsException: Index: 105, Size: 105
        //     at java.util.ArrayList.rangeCheck(Unknown Source)
        //     at java.util.ArrayList.get(Unknown Source)
        //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3262)
        //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
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
    
    public void setAnonymizeIp(final boolean anonymizeIp) {
        this.anonymizeIp = anonymizeIp;
    }
    
    public boolean setReferrer(final String s) {
        final String formatReferrer = formatReferrer(s);
        boolean b;
        if (formatReferrer == null) {
            b = false;
        }
        else {
            while (true) {
                while (true) {
                    Label_0157: {
                        try {
                            final SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
                            final Referrer currentReferrer = this.readCurrentReferrer(writableDatabase);
                            final ContentValues contentValues = new ContentValues();
                            contentValues.put("referrer", formatReferrer);
                            contentValues.put("timestamp_referrer", 0L);
                            contentValues.put("referrer_visit", 0);
                            if (currentReferrer == null) {
                                break Label_0157;
                            }
                            long n = currentReferrer.getIndex();
                            if (currentReferrer.getTimeStamp() > 0L) {
                                ++n;
                            }
                            contentValues.put("referrer_index", n);
                            if (!this.setReferrerDatabase(writableDatabase, contentValues)) {
                                break;
                            }
                            this.startNewVisit();
                            b = true;
                        }
                        catch (SQLiteException ex) {
                            Log.e("GoogleAnalyticsTracker", ex.toString());
                            b = false;
                        }
                        return b;
                    }
                    long n = 1L;
                    continue;
                }
            }
            b = false;
        }
        return b;
    }
    
    public void setSampleRate(final int sampleRate) {
        this.sampleRate = sampleRate;
    }
    
    public void startNewVisit() {
        synchronized (this) {
            this.sessionStarted = false;
            this.useStoredVisitorVars = true;
            this.numStoredHits = this.getNumStoredHitsFromDb();
        }
    }
    
    void storeUpdatedSession(final SQLiteDatabase sqLiteDatabase) {
        final SQLiteDatabase writableDatabase = this.databaseHelper.getWritableDatabase();
        writableDatabase.delete("session", (String)null, (String[])null);
        if (this.timestampFirst == 0L) {
            final long timestampCurrent = System.currentTimeMillis() / 1000L;
            this.timestampFirst = timestampCurrent;
            this.timestampPrevious = timestampCurrent;
            this.timestampCurrent = timestampCurrent;
            this.visits = 1;
        }
        else {
            this.timestampPrevious = this.timestampCurrent;
            this.timestampCurrent = System.currentTimeMillis() / 1000L;
            if (this.timestampCurrent == this.timestampPrevious) {
                this.timestampCurrent += 1L;
            }
            this.visits += 1;
        }
        final ContentValues contentValues = new ContentValues();
        contentValues.put("timestamp_first", this.timestampFirst);
        contentValues.put("timestamp_previous", this.timestampPrevious);
        contentValues.put("timestamp_current", this.timestampCurrent);
        contentValues.put("visits", this.visits);
        contentValues.put("store_id", this.storeId);
        writableDatabase.insert("session", (String)null, contentValues);
        this.sessionStarted = true;
    }
    
    void writeEventToDatabase(final Event event, final Referrer referrer, final SQLiteDatabase sqLiteDatabase, final boolean b) throws SQLiteException {
        final ContentValues contentValues = new ContentValues();
        contentValues.put("hit_string", HitBuilder.constructHitRequestPath(event, referrer));
        long currentTimeMillis;
        if (b) {
            currentTimeMillis = System.currentTimeMillis();
        }
        else {
            currentTimeMillis = 0L;
        }
        contentValues.put("hit_time", currentTimeMillis);
        sqLiteDatabase.insert("hits", (String)null, contentValues);
        this.numStoredHits += 1;
    }
    
    static class DataBaseHelper extends SQLiteOpenHelper
    {
        private final int databaseVersion;
        private final PersistentHitStore store;
        
        public DataBaseHelper(final Context context, final PersistentHitStore persistentHitStore) {
            this(context, "google_analytics.db", 5, persistentHitStore);
        }
        
        DataBaseHelper(final Context context, final String s, final int databaseVersion, final PersistentHitStore store) {
            super(context, s, (SQLiteDatabase$CursorFactory)null, databaseVersion);
            this.databaseVersion = databaseVersion;
            this.store = store;
        }
        
        public DataBaseHelper(final Context context, final String s, final PersistentHitStore persistentHitStore) {
            this(context, s, 5, persistentHitStore);
        }
        
        private void createECommerceTables(final SQLiteDatabase sqLiteDatabase) {
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS transaction_events;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_TRANSACTION_EVENTS_TABLE);
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS item_events;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_ITEM_EVENTS_TABLE);
        }
        
        private void createHitTable(final SQLiteDatabase sqLiteDatabase) {
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS hits;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_HITS_TABLE);
        }
        
        private void createReferrerTable(final SQLiteDatabase sqLiteDatabase) {
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS referrer;");
            sqLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS referrer (referrer TEXT PRIMARY KEY NOT NULL,timestamp_referrer INTEGER NOT NULL,referrer_visit INTEGER NOT NULL DEFAULT 1,referrer_index INTEGER NOT NULL DEFAULT 1);");
        }
        
        private void fixReferrerTable(final SQLiteDatabase p0) {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: aload_1        
            //     1: ldc             "referrer"
            //     3: aconst_null    
            //     4: aconst_null    
            //     5: aconst_null    
            //     6: aconst_null    
            //     7: aconst_null    
            //     8: aconst_null    
            //     9: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
            //    12: astore          9
            //    14: aload           9
            //    16: astore_3       
            //    17: aload_3        
            //    18: invokeinterface android/database/Cursor.getColumnNames:()[Ljava/lang/String;
            //    23: astore          10
            //    25: iconst_0       
            //    26: istore          11
            //    28: iconst_0       
            //    29: istore          12
            //    31: iconst_0       
            //    32: istore          13
            //    34: iload           11
            //    36: aload           10
            //    38: arraylength    
            //    39: if_icmpge       418
            //    42: aload           10
            //    44: iload           11
            //    46: aaload         
            //    47: ldc             "referrer_index"
            //    49: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
            //    52: ifeq            61
            //    55: iconst_1       
            //    56: istore          13
            //    58: goto            412
            //    61: aload           10
            //    63: iload           11
            //    65: aaload         
            //    66: ldc             "referrer_visit"
            //    68: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
            //    71: ifeq            412
            //    74: iconst_1       
            //    75: istore          12
            //    77: goto            412
            //    80: aload_3        
            //    81: invokeinterface android/database/Cursor.moveToFirst:()Z
            //    86: ifeq            406
            //    89: aload_3        
            //    90: ldc             "referrer_visit"
            //    92: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
            //    97: istore          19
            //    99: aload_3        
            //   100: ldc             "referrer_index"
            //   102: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
            //   107: istore          20
            //   109: aload_3        
            //   110: aload_3        
            //   111: ldc             "referrer"
            //   113: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
            //   118: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
            //   123: astore          21
            //   125: aload_3        
            //   126: aload_3        
            //   127: ldc             "timestamp_referrer"
            //   129: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
            //   134: invokeinterface android/database/Cursor.getLong:(I)J
            //   139: lstore          22
            //   141: iload           19
            //   143: iconst_m1      
            //   144: if_icmpne       287
            //   147: iconst_1       
            //   148: istore          24
            //   150: goto            431
            //   153: new             Lcom/google/android/apps/analytics/Referrer;
            //   156: dup            
            //   157: aload           21
            //   159: lload           22
            //   161: iload           24
            //   163: iload           26
            //   165: invokespecial   com/google/android/apps/analytics/Referrer.<init>:(Ljava/lang/String;JII)V
            //   168: astore          14
            //   170: aload_1        
            //   171: invokevirtual   android/database/sqlite/SQLiteDatabase.beginTransaction:()V
            //   174: aload_0        
            //   175: aload_1        
            //   176: invokespecial   com/google/android/apps/analytics/PersistentHitStore$DataBaseHelper.createReferrerTable:(Landroid/database/sqlite/SQLiteDatabase;)V
            //   179: aload           14
            //   181: ifnull          260
            //   184: new             Landroid/content/ContentValues;
            //   187: dup            
            //   188: invokespecial   android/content/ContentValues.<init>:()V
            //   191: astore          15
            //   193: aload           15
            //   195: ldc             "referrer"
            //   197: aload           14
            //   199: invokevirtual   com/google/android/apps/analytics/Referrer.getReferrerString:()Ljava/lang/String;
            //   202: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/String;)V
            //   205: aload           15
            //   207: ldc             "timestamp_referrer"
            //   209: aload           14
            //   211: invokevirtual   com/google/android/apps/analytics/Referrer.getTimeStamp:()J
            //   214: invokestatic    java/lang/Long.valueOf:(J)Ljava/lang/Long;
            //   217: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Long;)V
            //   220: aload           15
            //   222: ldc             "referrer_visit"
            //   224: aload           14
            //   226: invokevirtual   com/google/android/apps/analytics/Referrer.getVisit:()I
            //   229: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   232: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   235: aload           15
            //   237: ldc             "referrer_index"
            //   239: aload           14
            //   241: invokevirtual   com/google/android/apps/analytics/Referrer.getIndex:()I
            //   244: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   247: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   250: aload_1        
            //   251: ldc             "referrer"
            //   253: aconst_null    
            //   254: aload           15
            //   256: invokevirtual   android/database/sqlite/SQLiteDatabase.insert:(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
            //   259: pop2           
            //   260: aload_1        
            //   261: invokevirtual   android/database/sqlite/SQLiteDatabase.setTransactionSuccessful:()V
            //   264: aload_3        
            //   265: ifnull          274
            //   268: aload_3        
            //   269: invokeinterface android/database/Cursor.close:()V
            //   274: aload_1        
            //   275: invokevirtual   android/database/sqlite/SQLiteDatabase.inTransaction:()Z
            //   278: ifeq            286
            //   281: aload_1        
            //   282: invokestatic    com/google/android/apps/analytics/PersistentHitStore.access$900:(Landroid/database/sqlite/SQLiteDatabase;)Z
            //   285: pop            
            //   286: return         
            //   287: aload_3        
            //   288: iload           19
            //   290: invokeinterface android/database/Cursor.getInt:(I)I
            //   295: istore          24
            //   297: goto            431
            //   300: aload_3        
            //   301: iload           20
            //   303: invokeinterface android/database/Cursor.getInt:(I)I
            //   308: istore          25
            //   310: iload           25
            //   312: istore          26
            //   314: goto            153
            //   317: astore          5
            //   319: aconst_null    
            //   320: astore          6
            //   322: ldc             "GoogleAnalyticsTracker"
            //   324: aload           5
            //   326: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
            //   329: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
            //   332: pop            
            //   333: aload           6
            //   335: ifnull          345
            //   338: aload           6
            //   340: invokeinterface android/database/Cursor.close:()V
            //   345: aload_1        
            //   346: invokevirtual   android/database/sqlite/SQLiteDatabase.inTransaction:()Z
            //   349: ifeq            286
            //   352: aload_1        
            //   353: invokestatic    com/google/android/apps/analytics/PersistentHitStore.access$900:(Landroid/database/sqlite/SQLiteDatabase;)Z
            //   356: pop            
            //   357: goto            286
            //   360: astore_2       
            //   361: aconst_null    
            //   362: astore_3       
            //   363: aload_3        
            //   364: ifnull          373
            //   367: aload_3        
            //   368: invokeinterface android/database/Cursor.close:()V
            //   373: aload_1        
            //   374: invokevirtual   android/database/sqlite/SQLiteDatabase.inTransaction:()Z
            //   377: ifeq            385
            //   380: aload_1        
            //   381: invokestatic    com/google/android/apps/analytics/PersistentHitStore.access$900:(Landroid/database/sqlite/SQLiteDatabase;)Z
            //   384: pop            
            //   385: aload_2        
            //   386: athrow         
            //   387: astore_2       
            //   388: goto            363
            //   391: astore_2       
            //   392: aload           6
            //   394: astore_3       
            //   395: goto            363
            //   398: astore          5
            //   400: aload_3        
            //   401: astore          6
            //   403: goto            322
            //   406: aconst_null    
            //   407: astore          14
            //   409: goto            170
            //   412: iinc            11, 1
            //   415: goto            34
            //   418: iload           13
            //   420: ifeq            80
            //   423: iload           12
            //   425: ifne            264
            //   428: goto            80
            //   431: iload           20
            //   433: iconst_m1      
            //   434: if_icmpne       300
            //   437: iconst_1       
            //   438: istore          26
            //   440: goto            153
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                                     
            //  -----  -----  -----  -----  -----------------------------------------
            //  0      14     317    322    Landroid/database/sqlite/SQLiteException;
            //  0      14     360    363    Any
            //  17     264    398    406    Landroid/database/sqlite/SQLiteException;
            //  17     264    387    391    Any
            //  287    310    398    406    Landroid/database/sqlite/SQLiteException;
            //  287    310    387    391    Any
            //  322    333    391    398    Any
            // 
            // The error that occurred was:
            // 
            // java.lang.IndexOutOfBoundsException: Index: 205, Size: 205
            //     at java.util.ArrayList.rangeCheck(Unknown Source)
            //     at java.util.ArrayList.get(Unknown Source)
            //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3262)
            //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
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
        
        private void migrateEventsToHits(final SQLiteDatabase sqLiteDatabase, final int n) {
            this.store.loadExistingSession(sqLiteDatabase);
            this.store.visitorCVCache = this.store.getVisitorVarBuffer(sqLiteDatabase);
            final Event[] peekEvents = this.store.peekEvents(1000, sqLiteDatabase, n);
            for (int i = 0; i < peekEvents.length; ++i) {
                this.store.putEvent(peekEvents[i], sqLiteDatabase, false);
            }
            sqLiteDatabase.execSQL("DELETE from events;");
            sqLiteDatabase.execSQL("DELETE from item_events;");
            sqLiteDatabase.execSQL("DELETE from transaction_events;");
            sqLiteDatabase.execSQL("DELETE from custom_variables;");
        }
        
        private void migratePreV4Referrer(final SQLiteDatabase p0) {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: aconst_null    
            //     1: astore_2       
            //     2: aload_1        
            //     3: ldc             "install_referrer"
            //     5: iconst_1       
            //     6: anewarray       Ljava/lang/String;
            //     9: dup            
            //    10: iconst_0       
            //    11: ldc             "referrer"
            //    13: aastore        
            //    14: aconst_null    
            //    15: aconst_null    
            //    16: aconst_null    
            //    17: aconst_null    
            //    18: aconst_null    
            //    19: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
            //    22: astore          8
            //    24: aload           8
            //    26: astore          5
            //    28: aload           5
            //    30: invokeinterface android/database/Cursor.moveToFirst:()Z
            //    35: ifeq            290
            //    38: aload           5
            //    40: iconst_0       
            //    41: invokeinterface android/database/Cursor.getString:(I)Ljava/lang/String;
            //    46: astore          9
            //    48: aload_1        
            //    49: ldc             "session"
            //    51: aconst_null    
            //    52: aconst_null    
            //    53: aconst_null    
            //    54: aconst_null    
            //    55: aconst_null    
            //    56: aconst_null    
            //    57: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
            //    60: astore          10
            //    62: aload           10
            //    64: astore          4
            //    66: aload           4
            //    68: invokeinterface android/database/Cursor.moveToFirst:()Z
            //    73: ifeq            284
            //    76: aload           4
            //    78: iconst_0       
            //    79: invokeinterface android/database/Cursor.getLong:(I)J
            //    84: lstore          11
            //    86: new             Landroid/content/ContentValues;
            //    89: dup            
            //    90: invokespecial   android/content/ContentValues.<init>:()V
            //    93: astore          13
            //    95: aload           13
            //    97: ldc             "referrer"
            //    99: aload           9
            //   101: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/String;)V
            //   104: aload           13
            //   106: ldc             "timestamp_referrer"
            //   108: lload           11
            //   110: invokestatic    java/lang/Long.valueOf:(J)Ljava/lang/Long;
            //   113: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Long;)V
            //   116: aload           13
            //   118: ldc             "referrer_visit"
            //   120: iconst_1       
            //   121: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   124: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   127: aload           13
            //   129: ldc             "referrer_index"
            //   131: iconst_1       
            //   132: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   135: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   138: aload_1        
            //   139: ldc             "referrer"
            //   141: aconst_null    
            //   142: aload           13
            //   144: invokevirtual   android/database/sqlite/SQLiteDatabase.insert:(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
            //   147: pop2           
            //   148: aload           5
            //   150: ifnull          160
            //   153: aload           5
            //   155: invokeinterface android/database/Cursor.close:()V
            //   160: aload           4
            //   162: ifnull          172
            //   165: aload           4
            //   167: invokeinterface android/database/Cursor.close:()V
            //   172: return         
            //   173: astore          6
            //   175: aconst_null    
            //   176: astore          4
            //   178: ldc             "GoogleAnalyticsTracker"
            //   180: aload           6
            //   182: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
            //   185: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
            //   188: pop            
            //   189: aload_2        
            //   190: ifnull          199
            //   193: aload_2        
            //   194: invokeinterface android/database/Cursor.close:()V
            //   199: aload           4
            //   201: ifnull          172
            //   204: aload           4
            //   206: invokeinterface android/database/Cursor.close:()V
            //   211: goto            172
            //   214: astore_3       
            //   215: aconst_null    
            //   216: astore          4
            //   218: aconst_null    
            //   219: astore          5
            //   221: aload           5
            //   223: ifnull          233
            //   226: aload           5
            //   228: invokeinterface android/database/Cursor.close:()V
            //   233: aload           4
            //   235: ifnull          245
            //   238: aload           4
            //   240: invokeinterface android/database/Cursor.close:()V
            //   245: aload_3        
            //   246: athrow         
            //   247: astore_3       
            //   248: aconst_null    
            //   249: astore          4
            //   251: goto            221
            //   254: astore_3       
            //   255: goto            221
            //   258: astore_3       
            //   259: aload_2        
            //   260: astore          5
            //   262: goto            221
            //   265: astore          6
            //   267: aload           5
            //   269: astore_2       
            //   270: aconst_null    
            //   271: astore          4
            //   273: goto            178
            //   276: astore          6
            //   278: aload           5
            //   280: astore_2       
            //   281: goto            178
            //   284: lconst_0       
            //   285: lstore          11
            //   287: goto            86
            //   290: aconst_null    
            //   291: astore          4
            //   293: goto            148
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                                     
            //  -----  -----  -----  -----  -----------------------------------------
            //  2      24     173    178    Landroid/database/sqlite/SQLiteException;
            //  2      24     214    221    Any
            //  28     62     265    276    Landroid/database/sqlite/SQLiteException;
            //  28     62     247    254    Any
            //  66     148    276    284    Landroid/database/sqlite/SQLiteException;
            //  66     148    254    258    Any
            //  178    189    258    265    Any
            // 
            // The error that occurred was:
            // 
            // java.lang.IndexOutOfBoundsException: Index: 141, Size: 141
            //     at java.util.ArrayList.rangeCheck(Unknown Source)
            //     at java.util.ArrayList.get(Unknown Source)
            //     at com.strobel.decompiler.ast.AstBuilder.convertToAst(AstBuilder.java:3262)
            //     at com.strobel.decompiler.ast.AstBuilder.build(AstBuilder.java:113)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:210)
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
        
        void createCustomVariableTables(final SQLiteDatabase sqLiteDatabase) {
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS custom_variables;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_CUSTOM_VARIABLES_TABLE);
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS custom_var_cache;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_CUSTOM_VAR_CACHE_TABLE);
            for (int i = 1; i <= 5; ++i) {
                final ContentValues contentValues = new ContentValues();
                contentValues.put("event_id", 0);
                contentValues.put("cv_index", i);
                contentValues.put("cv_name", "");
                contentValues.put("cv_scope", 3);
                contentValues.put("cv_value", "");
                sqLiteDatabase.insert("custom_var_cache", "event_id", contentValues);
            }
        }
        
        public void onCreate(final SQLiteDatabase sqLiteDatabase) {
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS events;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_EVENTS_TABLE);
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS install_referrer;");
            sqLiteDatabase.execSQL("CREATE TABLE install_referrer (referrer TEXT PRIMARY KEY NOT NULL);");
            sqLiteDatabase.execSQL("DROP TABLE IF EXISTS session;");
            sqLiteDatabase.execSQL(PersistentHitStore.CREATE_SESSION_TABLE);
            if (this.databaseVersion > 1) {
                this.createCustomVariableTables(sqLiteDatabase);
            }
            if (this.databaseVersion > 2) {
                this.createECommerceTables(sqLiteDatabase);
            }
            if (this.databaseVersion > 3) {
                this.createHitTable(sqLiteDatabase);
                this.createReferrerTable(sqLiteDatabase);
            }
        }
        
        public void onDowngrade(final SQLiteDatabase p0, final int p1, final int p2) {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: ldc             "GoogleAnalyticsTracker"
            //     2: new             Ljava/lang/StringBuilder;
            //     5: dup            
            //     6: invokespecial   java/lang/StringBuilder.<init>:()V
            //     9: ldc_w           "Downgrading database version from "
            //    12: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    15: iload_2        
            //    16: invokevirtual   java/lang/StringBuilder.append:(I)Ljava/lang/StringBuilder;
            //    19: ldc_w           " to "
            //    22: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    25: iload_3        
            //    26: invokevirtual   java/lang/StringBuilder.append:(I)Ljava/lang/StringBuilder;
            //    29: ldc_w           " not recommended."
            //    32: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    35: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //    38: invokestatic    android/util/Log.w:(Ljava/lang/String;Ljava/lang/String;)I
            //    41: pop            
            //    42: aload_1        
            //    43: ldc             "CREATE TABLE IF NOT EXISTS referrer (referrer TEXT PRIMARY KEY NOT NULL,timestamp_referrer INTEGER NOT NULL,referrer_visit INTEGER NOT NULL DEFAULT 1,referrer_index INTEGER NOT NULL DEFAULT 1);"
            //    45: invokevirtual   android/database/sqlite/SQLiteDatabase.execSQL:(Ljava/lang/String;)V
            //    48: aload_1        
            //    49: invokestatic    com/google/android/apps/analytics/PersistentHitStore.access$600:()Ljava/lang/String;
            //    52: invokevirtual   android/database/sqlite/SQLiteDatabase.execSQL:(Ljava/lang/String;)V
            //    55: aload_1        
            //    56: invokestatic    com/google/android/apps/analytics/PersistentHitStore.access$300:()Ljava/lang/String;
            //    59: invokevirtual   android/database/sqlite/SQLiteDatabase.execSQL:(Ljava/lang/String;)V
            //    62: aload_1        
            //    63: invokestatic    com/google/android/apps/analytics/PersistentHitStore.access$100:()Ljava/lang/String;
            //    66: invokevirtual   android/database/sqlite/SQLiteDatabase.execSQL:(Ljava/lang/String;)V
            //    69: new             Ljava/util/HashSet;
            //    72: dup            
            //    73: invokespecial   java/util/HashSet.<init>:()V
            //    76: astore          5
            //    78: aload_1        
            //    79: ldc             "custom_var_cache"
            //    81: aconst_null    
            //    82: aconst_null    
            //    83: aconst_null    
            //    84: aconst_null    
            //    85: aconst_null    
            //    86: aconst_null    
            //    87: aconst_null    
            //    88: invokevirtual   android/database/sqlite/SQLiteDatabase.query:(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
            //    91: astore          6
            //    93: aload           6
            //    95: invokeinterface android/database/Cursor.moveToNext:()Z
            //   100: ifeq            274
            //   103: aload           5
            //   105: aload           6
            //   107: aload           6
            //   109: ldc             "cv_index"
            //   111: invokeinterface android/database/Cursor.getColumnIndex:(Ljava/lang/String;)I
            //   116: invokeinterface android/database/Cursor.getInt:(I)I
            //   121: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   124: invokeinterface java/util/Set.add:(Ljava/lang/Object;)Z
            //   129: pop            
            //   130: goto            93
            //   133: astore          8
            //   135: ldc             "GoogleAnalyticsTracker"
            //   137: new             Ljava/lang/StringBuilder;
            //   140: dup            
            //   141: invokespecial   java/lang/StringBuilder.<init>:()V
            //   144: ldc_w           "Error on downgrade: "
            //   147: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   150: aload           8
            //   152: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
            //   155: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   158: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //   161: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
            //   164: pop            
            //   165: aload           6
            //   167: invokeinterface android/database/Cursor.close:()V
            //   172: iconst_1       
            //   173: istore          10
            //   175: iload           10
            //   177: iconst_5       
            //   178: if_icmpgt       331
            //   181: aload           5
            //   183: iload           10
            //   185: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   188: invokeinterface java/util/Set.contains:(Ljava/lang/Object;)Z
            //   193: ifne            268
            //   196: new             Landroid/content/ContentValues;
            //   199: dup            
            //   200: invokespecial   android/content/ContentValues.<init>:()V
            //   203: astore          13
            //   205: aload           13
            //   207: ldc             "event_id"
            //   209: iconst_0       
            //   210: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   213: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   216: aload           13
            //   218: ldc             "cv_index"
            //   220: iload           10
            //   222: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   225: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   228: aload           13
            //   230: ldc             "cv_name"
            //   232: ldc             ""
            //   234: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/String;)V
            //   237: aload           13
            //   239: ldc             "cv_scope"
            //   241: iconst_3       
            //   242: invokestatic    java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
            //   245: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/Integer;)V
            //   248: aload           13
            //   250: ldc             "cv_value"
            //   252: ldc             ""
            //   254: invokevirtual   android/content/ContentValues.put:(Ljava/lang/String;Ljava/lang/String;)V
            //   257: aload_1        
            //   258: ldc             "custom_var_cache"
            //   260: ldc             "event_id"
            //   262: aload           13
            //   264: invokevirtual   android/database/sqlite/SQLiteDatabase.insert:(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
            //   267: pop2           
            //   268: iinc            10, 1
            //   271: goto            175
            //   274: aload           6
            //   276: invokeinterface android/database/Cursor.close:()V
            //   281: goto            172
            //   284: astore          7
            //   286: aload           6
            //   288: invokeinterface android/database/Cursor.close:()V
            //   293: aload           7
            //   295: athrow         
            //   296: astore          11
            //   298: ldc             "GoogleAnalyticsTracker"
            //   300: new             Ljava/lang/StringBuilder;
            //   303: dup            
            //   304: invokespecial   java/lang/StringBuilder.<init>:()V
            //   307: ldc_w           "Error inserting custom variable on downgrade: "
            //   310: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   313: aload           11
            //   315: invokevirtual   android/database/sqlite/SQLiteException.toString:()Ljava/lang/String;
            //   318: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   321: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //   324: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;)I
            //   327: pop            
            //   328: goto            268
            //   331: return         
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                                     
            //  -----  -----  -----  -----  -----------------------------------------
            //  93     130    133    172    Landroid/database/sqlite/SQLiteException;
            //  93     130    284    296    Any
            //  135    165    284    296    Any
            //  181    268    296    331    Landroid/database/sqlite/SQLiteException;
            // 
            // The error that occurred was:
            // 
            // java.lang.IllegalStateException: Expression is linked from several locations: Label_0268:
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
        
        public void onOpen(final SQLiteDatabase sqLiteDatabase) {
            if (sqLiteDatabase.isReadOnly()) {
                Log.w("GoogleAnalyticsTracker", "Warning: Need to update database, but it's read only.");
            }
            else {
                this.fixReferrerTable(sqLiteDatabase);
            }
        }
        
        public void onUpgrade(final SQLiteDatabase sqLiteDatabase, final int n, final int n2) {
            if (n > n2) {
                this.onDowngrade(sqLiteDatabase, n, n2);
            }
            else {
                if (n < 2 && n2 > 1) {
                    this.createCustomVariableTables(sqLiteDatabase);
                }
                if (n < 3 && n2 > 2) {
                    this.createECommerceTables(sqLiteDatabase);
                }
                if (n < 4 && n2 > 3) {
                    this.createHitTable(sqLiteDatabase);
                    this.createReferrerTable(sqLiteDatabase);
                    this.migrateEventsToHits(sqLiteDatabase, n);
                    this.migratePreV4Referrer(sqLiteDatabase);
                }
            }
        }
    }
}
