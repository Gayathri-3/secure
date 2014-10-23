package com.bv.wifisync;

import android.content.*;
import com.bv.sync.*;
import java.util.concurrent.*;
import android.database.*;
import android.os.*;
import java.io.*;
import java.util.zip.*;
import android.database.sqlite.*;

class LocalFileEx extends LocalFile
{
    private static final String DB_NAME = "timestamps.db";
    private static final String LOCAL_FIELD = "local_time";
    private static final long MIN_COMPACT_SIZE = 15728640L;
    private static final String PATH_FIELD = "path";
    private static final String REMOTE_FIELD = "remote_time";
    private static final String TABLE_NAME = "FILES";
    private static SQLiteOpenHelper dbHelper;
    private static SQLiteStatement deleteStatement;
    private static SQLiteStatement insertStatement;
    private static final long serialVersionUID = -2651581374062004591L;
    private static long updateCount;
    
    LocalFileEx(final Context context, final File file) throws IOException {
        super(file);
        init(context);
    }
    
    private LocalFileEx(final File file) {
        super(file);
    }
    
    private static void backup(final Context context) throws IOException {
        synchronized (LocalFileEx.class) {
            if (LocalFileEx.updateCount > 0L) {
                final File backupFile = getBackupFile(context);
                final File parentFile = backupFile.getParentFile();
                parentFile.mkdirs();
                new File(parentFile, "syncme.wireless").mkdir();
                copy(getDbFile(context), backupFile, Compression.Encrypt);
                LocalFileEx.updateCount = 0L;
            }
        }
    }
    
    static void compact(final Context context, final ProgressNotification progressNotification) throws IOException {
        init(context);
        if (LocalFileEx.updateCount > 0L && getDbFile(context).length() > 15728640L) {
            doCompact(progressNotification);
        }
        backup(context);
    }
    
    private static void copy(final File file, final File file2, final Compression compression) throws IOException {
        Label_0080: {
            if (compression != Compression.Decrypt) {
                break Label_0080;
            }
            ZipFile zipFile = new ZipFile(file);
            InputStream inputStream = zipFile.getInputStream((ZipEntry)zipFile.entries().nextElement());
            try {
                while (true) {
                    final OutputStream output = getOutput(file2, compression);
                    try {
                        final byte[] array = new byte[61440];
                        while (true) {
                            final int read = inputStream.read(array);
                            if (read <= 0) {
                                break;
                            }
                            output.write(array, 0, read);
                        }
                        return;
                        inputStream = new FileInputStream(file);
                        zipFile = null;
                    }
                    finally {
                        output.close();
                    }
                }
            }
            finally {
                inputStream.close();
                if (zipFile != null) {
                    zipFile.close();
                }
            }
        }
    }
    
    private static void doCompact(final ProgressNotification progressNotification) {
    Label_0050_Outer:
        while (true) {
            final SQLiteDatabase readableDatabase = LocalFileEx.dbHelper.getReadableDatabase();
            final Cursor rawQuery = readableDatabase.rawQuery("select count(*) as count from FILES", (String[])null);
            while (true) {
                int int1;
                int n;
                int n2;
                try {
                    rawQuery.moveToFirst();
                    int1 = rawQuery.getInt(rawQuery.getColumnIndex("count"));
                    rawQuery.close();
                    n = 0;
                    n2 = 0;
                    if (n2 >= int1) {
                        return;
                    }
                }
                finally {
                    rawQuery.close();
                }
                final Cursor rawQuery2 = readableDatabase.rawQuery("select path from FILES limit 100 offset " + n2, (String[])null);
                try {
                    while (rawQuery2.moveToNext()) {
                        final String string = rawQuery2.getString(rawQuery2.getColumnIndex("path"));
                        final LocalFile localFile = new LocalFile(string);
                        if (!localFile.exists()) {
                            remove(string);
                            --n2;
                        }
                        if (progressNotification != null) {
                            ++n;
                            if (!progressNotification.update(ProgressNotification.ProgressAction.Synchronizing, (int)(100.0f * (n / int1)), localFile)) {
                                throw new CancellationException();
                            }
                            continue Label_0050_Outer;
                        }
                    }
                    rawQuery2.close();
                    n2 += 100;
                    continue;
                }
                finally {
                    rawQuery2.close();
                }
                break;
            }
        }
    }
    
    private static File getBackupFile(final Context context) {
        File file = context.getExternalFilesDir((String)null);
        if (file != null) {
            file = file.getParentFile();
        }
        if (file != null) {
            file = file.getParentFile();
        }
        File file2;
        if (file != null && file.canWrite()) {
            file2 = new File(new File(file, ".bvaisoft"), "timestamps.db");
        }
        else {
            file2 = new File(new File(Environment.getExternalStorageDirectory(), ".bvaisoft"), "timestamps.db");
        }
        return file2;
    }
    
    private static File getDbFile(final Context context) {
        return new File(context.getFilesDir(), "timestamps.db");
    }
    
    private static OutputStream getOutput(final File file, final Compression compression) throws IOException {
        OutputStream outputStream;
        if (compression == Compression.Encrypt) {
            outputStream = new ZipOutputStream(new FileOutputStream(file));
            ((ZipOutputStream)outputStream).putNextEntry(new ZipEntry(file.getName()));
        }
        else {
            outputStream = new FileOutputStream(file);
        }
        return outputStream;
    }
    
    private static void init(final Context context) throws IOException {
        synchronized (LocalFileEx.class) {
            if (LocalFileEx.dbHelper == null) {
                final File dbFile = getDbFile(context);
                final File backupFile = getBackupFile(context);
                if (!dbFile.exists() && backupFile.exists()) {
                    copy(backupFile, dbFile, Compression.Decrypt);
                }
                LocalFileEx.dbHelper = new DBHelper(context);
                final SQLiteDatabase writableDatabase = LocalFileEx.dbHelper.getWritableDatabase();
                LocalFileEx.insertStatement = writableDatabase.compileStatement("insert or replace into FILES values(?,?,?);");
                LocalFileEx.deleteStatement = writableDatabase.compileStatement("delete from FILES where path=?;");
            }
        }
    }
    
    private static void remove(final String s) {
        synchronized (LocalFileEx.deleteStatement) {
            LocalFileEx.deleteStatement.bindString(1, s);
            synchronized (LocalFileEx.class) {
                LocalFileEx.deleteStatement.execute();
            }
        }
    }
    
    public void delete() throws IOException {
        final String absolutePath = this.getAbsolutePath();
        super.delete();
        remove(absolutePath);
    }
    
    public long getLastModified() {
        final String absolutePath = this.getAbsolutePath();
        final Cursor query = LocalFileEx.dbHelper.getReadableDatabase().query("FILES", new String[] { "local_time", "remote_time" }, "path=?", new String[] { absolutePath }, (String)null, (String)null, (String)null);
        try {
            long n = super.getLastModified();
            if (query.moveToFirst()) {
                if (query.getLong(query.getColumnIndex("local_time")) == n) {
                    n = query.getLong(query.getColumnIndex("remote_time"));
                }
                else {
                    remove(absolutePath);
                }
            }
            return n;
        }
        finally {
            query.close();
        }
    }
    
    protected LocalFile getNewFile(final File file) {
        return new LocalFileEx(file);
    }
    
    public void setLastModified(final long lastModified) throws IOException {
        if (this.file.setLastModified(lastModified)) {
            return;
        }
        synchronized (LocalFileEx.insertStatement) {
            LocalFileEx.insertStatement.bindString(1, this.getAbsolutePath());
            LocalFileEx.insertStatement.bindLong(2, this.getLastModified());
            LocalFileEx.insertStatement.bindLong(3, lastModified);
            synchronized (LocalFileEx.class) {
                LocalFileEx.insertStatement.executeInsert();
                LocalFileEx.updateCount += 1L;
            }
        }
    }
    
    private enum Compression
    {
        Decrypt("Decrypt", 1), 
        Encrypt("Encrypt", 0);
    }
    
    private static class DBHelper extends SQLiteOpenHelper
    {
        DBHelper(final Context context) {
            super(context, getDbFile(context).getAbsolutePath(), (SQLiteDatabase$CursorFactory)null, 1);
        }
        
        public void onCreate(final SQLiteDatabase sqLiteDatabase) {
            sqLiteDatabase.execSQL("create table FILES (path text not null primary key, local_time integer not null, remote_time integer not null);");
        }
        
        public void onUpgrade(final SQLiteDatabase sqLiteDatabase, final int n, final int n2) {
        }
    }
}
