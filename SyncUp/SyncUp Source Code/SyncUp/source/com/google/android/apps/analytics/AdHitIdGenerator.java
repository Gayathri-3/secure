package com.google.android.apps.analytics;

public class AdHitIdGenerator
{
    private boolean adMobSdkInstalled;
    
    public AdHitIdGenerator() {
        super();
        try {
            this.adMobSdkInstalled = (Class.forName("com.google.ads.AdRequest") != null);
        }
        catch (ClassNotFoundException ex) {
            this.adMobSdkInstalled = false;
        }
    }
    
    AdHitIdGenerator(final boolean adMobSdkInstalled) {
        super();
        this.adMobSdkInstalled = adMobSdkInstalled;
    }
    
    int getAdHitId() {
        int generateAdHitId;
        if (!this.adMobSdkInstalled) {
            generateAdHitId = 0;
        }
        else {
            generateAdHitId = AdMobInfo.getInstance().generateAdHitId();
        }
        return generateAdHitId;
    }
}
