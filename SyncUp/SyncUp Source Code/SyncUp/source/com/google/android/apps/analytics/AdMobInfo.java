package com.google.android.apps.analytics;

import java.util.*;

public class AdMobInfo
{
    private static final AdMobInfo INSTANCE;
    private int adHitId;
    private Random random;
    
    static {
        INSTANCE = new AdMobInfo();
    }
    
    private AdMobInfo() {
        super();
        this.random = new Random();
    }
    
    public static AdMobInfo getInstance() {
        return AdMobInfo.INSTANCE;
    }
    
    public int generateAdHitId() {
        return this.adHitId = this.random.nextInt();
    }
    
    public int getAdHitId() {
        return this.adHitId;
    }
    
    public String getJoinId() {
        final int adHitId = this.adHitId;
        String format = null;
        if (adHitId != 0) {
            final GoogleAnalyticsTracker instance = GoogleAnalyticsTracker.getInstance();
            final String visitorIdForAds = instance.getVisitorIdForAds();
            final String sessionIdForAds = instance.getSessionIdForAds();
            format = null;
            if (visitorIdForAds != null) {
                format = null;
                if (sessionIdForAds != null) {
                    format = String.format("A,%s,%s,%d", visitorIdForAds, sessionIdForAds, this.adHitId);
                }
            }
        }
        return format;
    }
    
    public void setAdHitId(final int adHitId) {
        this.adHitId = adHitId;
    }
}
