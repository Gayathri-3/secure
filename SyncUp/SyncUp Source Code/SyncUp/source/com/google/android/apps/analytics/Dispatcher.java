package com.google.android.apps.analytics;

interface Dispatcher
{
    void dispatchHits(Hit[] p0);
    
    void init(Callbacks p0);
    
    boolean isDryRun();
    
    void setDryRun(boolean p0);
    
    void stop();
    
    public interface Callbacks
    {
        void dispatchFinished();
        
        void hitDispatched(long p0);
    }
}
