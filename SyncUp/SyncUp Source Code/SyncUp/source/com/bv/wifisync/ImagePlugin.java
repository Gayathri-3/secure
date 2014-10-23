package com.bv.wifisync;

import java.util.*;
import android.content.*;
import com.bv.sync.*;
import java.io.*;

class ImagePlugin implements Job.Plugin
{
    private static final long serialVersionUID = 7422073605731017740L;
    private transient Collection<MovedItem> changed;
    final ImageScanner.Options options;
    
    ImagePlugin() {
        super();
        this.options = new ImageScanner.Options();
    }
    
    public void clear() {
        this.changed = null;
    }
    
    public Collection<MovedItem> getChangedItems() {
        return this.changed;
    }
    
    boolean isRunnable() {
        return this.options.groupByYear || this.options.groupByMonth || this.options.groupByDay || this.options.groupByAddress;
    }
    
    public void run(final Job job, final Context context, final ProgressNotification progressNotification) throws IOException {
        if (!this.isRunnable()) {
            return;
        }
        final ImageScanner imageScanner = new ImageScanner((ImageScanner.Parser)new JpegParser(context));
        try {
            imageScanner.run(new LocalFile(job.getPhoneDir()), this.options, progressNotification);
        }
        finally {
            this.changed = imageScanner.getChanged();
        }
    }
}
