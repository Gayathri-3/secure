package com.bv.wifisync;

import java.util.*;
import android.content.*;
import com.bv.sync.*;
import java.io.*;

public class Mp3Plugin implements Job.Plugin
{
    private static final long serialVersionUID = 3458345423111073999L;
    private transient Collection<MovedItem> changed;
    final Mp3Scanner.Options options;
    
    public Mp3Plugin() {
        super();
        this.options = new Mp3Scanner.Options();
    }
    
    public void clear() {
        this.changed = null;
    }
    
    public Collection<MovedItem> getChangedItems() {
        return this.changed;
    }
    
    boolean isRunnable() {
        return this.options.groupByAlbum || this.options.groupByArtist || this.options.renameSongs;
    }
    
    public void run(final Job job, final Context context, final ProgressNotification progressNotification) throws IOException {
        if (!this.isRunnable()) {
            return;
        }
        final Mp3Scanner mp3Scanner = new Mp3Scanner();
        try {
            mp3Scanner.run(new LocalFile(job.getPhoneDir()), this.options, progressNotification);
        }
        finally {
            this.changed = mp3Scanner.getChanged();
        }
    }
}
