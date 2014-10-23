package com.google.android.apps.analytics;

import android.os.*;
import android.content.*;
import android.util.*;
import android.net.*;
import java.util.*;

public class GoogleAnalyticsTracker
{
    public static final String LOG_TAG = "GoogleAnalyticsTracker";
    public static final String PRODUCT = "GoogleAnalytics";
    public static final String VERSION = "1.4.2";
    public static final String WIRE_VERSION = "4.8.1ma";
    private static GoogleAnalyticsTracker instance;
    private String accountId;
    private AdHitIdGenerator adHitIdGenerator;
    private boolean anonymizeIp;
    private ConnectivityManager connectivityManager;
    private CustomVariableBuffer customVariableBuffer;
    private boolean debug;
    private int dispatchPeriod;
    private Runnable dispatchRunner;
    private Dispatcher dispatcher;
    private boolean dispatcherIsBusy;
    private boolean dryRun;
    private Handler handler;
    private HitStore hitStore;
    private Map<String, Map<String, Item>> itemMap;
    private Context parent;
    private boolean powerSaveMode;
    private int sampleRate;
    private Map<String, Transaction> transactionMap;
    private boolean useServerTime;
    private String userAgentProduct;
    private String userAgentVersion;
    
    static {
        GoogleAnalyticsTracker.instance = new GoogleAnalyticsTracker();
    }
    
    private GoogleAnalyticsTracker() {
        super();
        this.debug = false;
        this.dryRun = false;
        this.anonymizeIp = false;
        this.useServerTime = false;
        this.sampleRate = 100;
        this.userAgentProduct = "GoogleAnalytics";
        this.userAgentVersion = "1.4.2";
        this.transactionMap = new HashMap<String, Transaction>();
        this.itemMap = new HashMap<String, Map<String, Item>>();
        this.dispatchRunner = new Runnable() {
            public void run() {
                GoogleAnalyticsTracker.this.dispatch();
            }
        };
    }
    
    private void cancelPendingDispatches() {
        if (this.handler != null) {
            this.handler.removeCallbacks(this.dispatchRunner);
        }
    }
    
    private void createEvent(final String s, final String s2, final String s3, final String s4, final int n) {
        final Event event = new Event(s, s2, s3, s4, n, this.parent.getResources().getDisplayMetrics().widthPixels, this.parent.getResources().getDisplayMetrics().heightPixels);
        event.setCustomVariableBuffer(this.customVariableBuffer);
        event.setAdHitId(this.adHitIdGenerator.getAdHitId());
        event.setUseServerTime(this.useServerTime);
        this.customVariableBuffer = new CustomVariableBuffer();
        this.hitStore.putEvent(event);
        this.resetPowerSaveMode();
    }
    
    public static GoogleAnalyticsTracker getInstance() {
        return GoogleAnalyticsTracker.instance;
    }
    
    private void maybeScheduleNextDispatch() {
        if (this.dispatchPeriod >= 0 && this.handler.postDelayed(this.dispatchRunner, (long)(1000 * this.dispatchPeriod)) && this.debug) {
            Log.v("GoogleAnalyticsTracker", "Scheduled next dispatch");
        }
    }
    
    private void resetPowerSaveMode() {
        if (this.powerSaveMode) {
            this.powerSaveMode = false;
            this.maybeScheduleNextDispatch();
        }
    }
    
    public void addItem(final Item item) {
        if (this.transactionMap.get(item.getOrderId()) == null) {
            Log.i("GoogleAnalyticsTracker", "No transaction with orderId " + item.getOrderId() + " found, creating one");
            this.transactionMap.put(item.getOrderId(), new Transaction.Builder(item.getOrderId(), 0.0).build());
        }
        Map<String, Item> map = this.itemMap.get(item.getOrderId());
        if (map == null) {
            map = new HashMap<String, Item>();
            this.itemMap.put(item.getOrderId(), map);
        }
        map.put(item.getItemSKU(), item);
    }
    
    public void addTransaction(final Transaction transaction) {
        this.transactionMap.put(transaction.getOrderId(), transaction);
    }
    
    public void clearTransactions() {
        this.transactionMap.clear();
        this.itemMap.clear();
    }
    
    public boolean dispatch() {
        boolean b = false;
        if (this.debug) {
            Log.v("GoogleAnalyticsTracker", "Called dispatch");
        }
        if (this.dispatcherIsBusy) {
            if (this.debug) {
                Log.v("GoogleAnalyticsTracker", "...but dispatcher was busy");
            }
            this.maybeScheduleNextDispatch();
        }
        else {
            final NetworkInfo activeNetworkInfo = this.connectivityManager.getActiveNetworkInfo();
            if (activeNetworkInfo == null || !activeNetworkInfo.isAvailable()) {
                if (this.debug) {
                    Log.v("GoogleAnalyticsTracker", "...but there was no network available");
                }
                this.maybeScheduleNextDispatch();
                b = false;
            }
            else if (this.hitStore.getNumStoredHits() != 0) {
                final Hit[] peekHits = this.hitStore.peekHits();
                this.dispatcher.dispatchHits(peekHits);
                this.dispatcherIsBusy = true;
                this.maybeScheduleNextDispatch();
                if (this.debug) {
                    Log.v("GoogleAnalyticsTracker", "Sending " + peekHits.length + " hits to dispatcher");
                }
                b = true;
            }
            else {
                this.powerSaveMode = true;
                final boolean debug = this.debug;
                b = false;
                if (debug) {
                    Log.v("GoogleAnalyticsTracker", "...but there was nothing to dispatch");
                    b = false;
                }
            }
        }
        return b;
    }
    
    void dispatchFinished() {
        this.dispatcherIsBusy = false;
    }
    
    public boolean getAnonymizeIp() {
        return this.anonymizeIp;
    }
    
    public boolean getDebug() {
        return this.debug;
    }
    
    Dispatcher getDispatcher() {
        return this.dispatcher;
    }
    
    HitStore getHitStore() {
        return this.hitStore;
    }
    
    public int getSampleRate() {
        return this.sampleRate;
    }
    
    String getSessionIdForAds() {
        String sessionId;
        if (this.hitStore == null) {
            sessionId = null;
        }
        else {
            sessionId = this.hitStore.getSessionId();
        }
        return sessionId;
    }
    
    public String getVisitorCustomVar(final int n) {
        if (n < 1 || n > 5) {
            throw new IllegalArgumentException("Index must be between 1 and 5 inclusive.");
        }
        return this.hitStore.getVisitorCustomVar(n);
    }
    
    String getVisitorIdForAds() {
        String visitorId;
        if (this.hitStore == null) {
            visitorId = null;
        }
        else {
            visitorId = this.hitStore.getVisitorId();
        }
        return visitorId;
    }
    
    public boolean isDryRun() {
        return this.dryRun;
    }
    
    void returnToInitialState() {
        GoogleAnalyticsTracker.instance = new GoogleAnalyticsTracker();
    }
    
    void setAdHitIdGenerator(final AdHitIdGenerator adHitIdGenerator) {
        this.adHitIdGenerator = adHitIdGenerator;
    }
    
    public void setAnonymizeIp(final boolean anonymizeIp) {
        this.anonymizeIp = anonymizeIp;
        if (this.hitStore != null) {
            this.hitStore.setAnonymizeIp(this.anonymizeIp);
        }
    }
    
    public boolean setCustomVar(final int n, final String s, final String s2) {
        return this.setCustomVar(n, s, s2, 3);
    }
    
    public boolean setCustomVar(final int n, final String s, final String s2, final int n2) {
        try {
            final CustomVariable customVariable = new CustomVariable(n, s, s2, n2);
            if (this.customVariableBuffer == null) {
                this.customVariableBuffer = new CustomVariableBuffer();
            }
            this.customVariableBuffer.setCustomVariable(customVariable);
            return true;
        }
        catch (IllegalArgumentException ex) {
            return false;
        }
    }
    
    public void setDebug(final boolean debug) {
        this.debug = debug;
    }
    
    public void setDispatchPeriod(final int dispatchPeriod) {
        final int dispatchPeriod2 = this.dispatchPeriod;
        this.dispatchPeriod = dispatchPeriod;
        if (dispatchPeriod2 <= 0) {
            this.maybeScheduleNextDispatch();
        }
        else if (dispatchPeriod2 > 0) {
            this.cancelPendingDispatches();
            this.maybeScheduleNextDispatch();
        }
    }
    
    public boolean setDispatcher(final Dispatcher dispatcher) {
        boolean b;
        if (this.dispatcherIsBusy) {
            b = false;
        }
        else {
            if (this.dispatcher != null) {
                this.dispatcher.stop();
            }
            (this.dispatcher = dispatcher).init((Dispatcher.Callbacks)new DispatcherCallbacks());
            this.dispatcher.setDryRun(this.dryRun);
            b = true;
        }
        return b;
    }
    
    public void setDryRun(final boolean b) {
        this.dryRun = b;
        if (this.dispatcher != null) {
            this.dispatcher.setDryRun(b);
        }
    }
    
    public void setProductVersion(final String userAgentProduct, final String userAgentVersion) {
        this.userAgentProduct = userAgentProduct;
        this.userAgentVersion = userAgentVersion;
    }
    
    public boolean setReferrer(final String referrer) {
        if (this.hitStore == null) {
            throw new IllegalStateException("Can't set a referrer before starting the tracker");
        }
        return this.hitStore.setReferrer(referrer);
    }
    
    public void setSampleRate(final int sampleRate) {
        if (sampleRate < 0 || sampleRate > 100) {
            Log.w("GoogleAnalyticsTracker", "Invalid sample rate: " + sampleRate + " (should be between 0 and 100");
        }
        else {
            this.sampleRate = sampleRate;
            if (this.hitStore != null) {
                this.hitStore.setSampleRate(this.sampleRate);
            }
        }
    }
    
    public void setUseServerTime(final boolean useServerTime) {
        this.useServerTime = useServerTime;
    }
    
    @Deprecated
    public void start(final String s, final int n, final Context context) {
        this.startNewSession(s, n, context);
    }
    
    void start(final String s, final int n, final Context context, final HitStore hitStore, final Dispatcher dispatcher, final boolean b) {
        this.start(s, n, context, hitStore, dispatcher, b, new DispatcherCallbacks());
    }
    
    void start(final String accountId, final int dispatchPeriod, final Context context, final HitStore hitStore, final Dispatcher dispatcher, final boolean b, final Dispatcher.Callbacks callbacks) {
        this.accountId = accountId;
        if (context == null) {
            throw new NullPointerException("Context cannot be null");
        }
        this.parent = context.getApplicationContext();
        this.hitStore = hitStore;
        this.adHitIdGenerator = new AdHitIdGenerator();
        if (b) {
            this.hitStore.startNewVisit();
        }
        (this.dispatcher = dispatcher).init(callbacks);
        this.dispatcherIsBusy = false;
        if (this.connectivityManager == null) {
            this.connectivityManager = (ConnectivityManager)this.parent.getSystemService("connectivity");
        }
        if (this.handler == null) {
            this.handler = new Handler(context.getMainLooper());
        }
        else {
            this.cancelPendingDispatches();
        }
        this.setDispatchPeriod(dispatchPeriod);
    }
    
    void start(final String s, final int n, final Context context, final boolean b) {
        if (context == null) {
            throw new NullPointerException("Context cannot be null");
        }
        HitStore hitStore;
        if (this.hitStore == null) {
            hitStore = new PersistentHitStore(context);
            hitStore.setAnonymizeIp(this.anonymizeIp);
            hitStore.setSampleRate(this.sampleRate);
        }
        else {
            hitStore = this.hitStore;
        }
        Dispatcher dispatcher;
        if (this.dispatcher == null) {
            dispatcher = new NetworkDispatcher(this.userAgentProduct, this.userAgentVersion);
            dispatcher.setDryRun(this.dryRun);
        }
        else {
            dispatcher = this.dispatcher;
        }
        this.start(s, n, context, hitStore, dispatcher, b);
    }
    
    @Deprecated
    public void start(final String s, final Context context) {
        this.start(s, -1, context);
    }
    
    public void startNewSession(final String s, final int n, final Context context) {
        this.start(s, n, context, true);
    }
    
    public void startNewSession(final String s, final Context context) {
        this.startNewSession(s, -1, context);
    }
    
    @Deprecated
    public void stop() {
        if (this.dispatcher != null) {
            this.dispatcher.stop();
        }
        this.cancelPendingDispatches();
    }
    
    public void stopSession() {
        this.stop();
    }
    
    public void trackEvent(final String s, final String s2, final String s3, final int n) {
        if (s == null) {
            throw new IllegalArgumentException("category cannot be null");
        }
        if (s2 == null) {
            throw new IllegalArgumentException("action cannot be null");
        }
        this.createEvent(this.accountId, s, s2, s3, n);
    }
    
    public void trackPageView(final String s) {
        this.createEvent(this.accountId, "__##GOOGLEPAGEVIEW##__", s, null, -1);
    }
    
    public void trackTransactions() {
        for (final Transaction transaction : this.transactionMap.values()) {
            final Event event = new Event(this.accountId, "__##GOOGLETRANSACTION##__", "", "", 0, this.parent.getResources().getDisplayMetrics().widthPixels, this.parent.getResources().getDisplayMetrics().heightPixels);
            event.setTransaction(transaction);
            this.hitStore.putEvent(event);
            final Map<String, Item> map = this.itemMap.get(transaction.getOrderId());
            if (map != null) {
                for (final Item item : map.values()) {
                    final Event event2 = new Event(this.accountId, "__##GOOGLEITEM##__", "", "", 0, this.parent.getResources().getDisplayMetrics().widthPixels, this.parent.getResources().getDisplayMetrics().heightPixels);
                    event2.setItem(item);
                    this.hitStore.putEvent(event2);
                }
            }
        }
        this.clearTransactions();
        this.resetPowerSaveMode();
    }
    
    final class DispatcherCallbacks implements Dispatcher.Callbacks
    {
        public void dispatchFinished() {
            GoogleAnalyticsTracker.this.handler.post((Runnable)new Runnable() {
                public void run() {
                    GoogleAnalyticsTracker.this.dispatchFinished();
                }
            });
        }
        
        public void hitDispatched(final long n) {
            GoogleAnalyticsTracker.this.hitStore.deleteHit(n);
        }
    }
}
