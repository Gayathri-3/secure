package com.google.android.apps.analytics;

interface HitStore
{
    void clearReferrer();
    
    void deleteHit(long p0);
    
    int getNumStoredHits();
    
    Referrer getReferrer();
    
    String getSessionId();
    
    int getStoreId();
    
    String getVisitorCustomVar(int p0);
    
    String getVisitorId();
    
    void loadExistingSession();
    
    Hit[] peekHits();
    
    Hit[] peekHits(int p0);
    
    void putEvent(Event p0);
    
    void setAnonymizeIp(boolean p0);
    
    boolean setReferrer(String p0);
    
    void setSampleRate(int p0);
    
    void startNewVisit();
}
