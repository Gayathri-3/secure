package com.bv.sync;

public class MovedItem extends SyncItem
{
    public final String newPath;
    
    MovedItem(final String s, final long n, final SyncItem.Type type, final long n2, final String newPath, final boolean b) {
        super(s, n, type, n2, b);
        this.newPath = newPath;
    }
}
