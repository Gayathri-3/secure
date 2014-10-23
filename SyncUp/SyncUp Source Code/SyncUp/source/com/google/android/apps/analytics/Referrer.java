package com.google.android.apps.analytics;

class Referrer
{
    private final int index;
    private final String referrer;
    private final long timeStamp;
    private final int visit;
    
    Referrer(final String referrer, final long timeStamp, final int visit, final int index) {
        super();
        this.referrer = referrer;
        this.timeStamp = timeStamp;
        this.visit = visit;
        this.index = index;
    }
    
    int getIndex() {
        return this.index;
    }
    
    String getReferrerString() {
        return this.referrer;
    }
    
    long getTimeStamp() {
        return this.timeStamp;
    }
    
    int getVisit() {
        return this.visit;
    }
}
