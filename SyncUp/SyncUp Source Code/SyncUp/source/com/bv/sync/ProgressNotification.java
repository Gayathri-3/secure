package com.bv.sync;

public interface ProgressNotification
{
    boolean update(ProgressAction p0, int p1, IFile p2);
    
    public enum ProgressAction
    {
        Connecting("Connecting", 6), 
        Copying("Copying", 1), 
        Deleting("Deleting", 2), 
        Grouping("Grouping", 4), 
        Listing("Listing", 9), 
        Moving("Moving", 5), 
        Saving("Saving", 7), 
        Synchronizing("Synchronizing", 0), 
        TrackingDeletions("TrackingDeletions", 3), 
        UpdateMediaStore("UpdateMediaStore", 8);
    }
}
