package com.google.android.apps.analytics;

class Event
{
    static final String INSTALL_EVENT_CATEGORY = "__##GOOGLEINSTALL##__";
    static final String ITEM_CATEGORY = "__##GOOGLEITEM##__";
    static final String PAGEVIEW_EVENT_CATEGORY = "__##GOOGLEPAGEVIEW##__";
    static final String TRANSACTION_CATEGORY = "__##GOOGLETRANSACTION##__";
    final String accountId;
    final String action;
    private int adHitId;
    private boolean anonymizeIp;
    final String category;
    CustomVariableBuffer customVariableBuffer;
    final long eventId;
    private Item item;
    final String label;
    private int randomVal;
    final int screenHeight;
    final int screenWidth;
    private int timestampCurrent;
    private int timestampFirst;
    private int timestampPrevious;
    private Transaction transaction;
    private boolean useServerTime;
    private int userId;
    final int value;
    private int visits;
    
    Event(final long eventId, final String accountId, final int randomVal, final int timestampFirst, final int timestampPrevious, final int timestampCurrent, final int visits, final String category, final String action, final String label, final int value, final int screenWidth, final int screenHeight) {
        super();
        this.eventId = eventId;
        this.accountId = accountId;
        this.randomVal = randomVal;
        this.timestampFirst = timestampFirst;
        this.timestampPrevious = timestampPrevious;
        this.timestampCurrent = timestampCurrent;
        this.visits = visits;
        this.category = category;
        this.action = action;
        this.label = label;
        this.value = value;
        this.screenHeight = screenHeight;
        this.screenWidth = screenWidth;
        this.userId = -1;
        this.useServerTime = false;
    }
    
    Event(final Event event, final String s) {
        this(event.eventId, s, event.randomVal, event.timestampFirst, event.timestampPrevious, event.timestampCurrent, event.visits, event.category, event.action, event.label, event.value, event.screenWidth, event.screenHeight);
        this.adHitId = event.adHitId;
        this.userId = event.userId;
        this.anonymizeIp = event.anonymizeIp;
        this.useServerTime = event.useServerTime;
        this.customVariableBuffer = event.customVariableBuffer;
        this.transaction = event.transaction;
        this.item = event.item;
    }
    
    Event(final String s, final String s2, final String s3, final String s4, final int n, final int n2, final int n3) {
        this(-1L, s, -1, -1, -1, -1, -1, s2, s3, s4, n, n2, n3);
    }
    
    int getAdHitId() {
        return this.adHitId;
    }
    
    boolean getAnonymizeIp() {
        return this.anonymizeIp;
    }
    
    public CustomVariableBuffer getCustomVariableBuffer() {
        return this.customVariableBuffer;
    }
    
    public Item getItem() {
        return this.item;
    }
    
    int getRandomVal() {
        return this.randomVal;
    }
    
    int getTimestampCurrent() {
        return this.timestampCurrent;
    }
    
    int getTimestampFirst() {
        return this.timestampFirst;
    }
    
    int getTimestampPrevious() {
        return this.timestampPrevious;
    }
    
    public Transaction getTransaction() {
        return this.transaction;
    }
    
    boolean getUseServerTime() {
        return this.useServerTime;
    }
    
    int getUserId() {
        return this.userId;
    }
    
    int getVisits() {
        return this.visits;
    }
    
    public boolean isSessionInitialized() {
        return this.timestampFirst != -1;
    }
    
    void setAdHitId(final int adHitId) {
        this.adHitId = adHitId;
    }
    
    void setAnonymizeIp(final boolean anonymizeIp) {
        this.anonymizeIp = anonymizeIp;
    }
    
    public void setCustomVariableBuffer(final CustomVariableBuffer customVariableBuffer) {
        this.customVariableBuffer = customVariableBuffer;
    }
    
    public void setItem(final Item item) {
        if (!this.category.equals("__##GOOGLEITEM##__")) {
            throw new IllegalStateException("Attempted to add an item to an event of type " + this.category);
        }
        this.item = item;
    }
    
    void setRandomVal(final int randomVal) {
        this.randomVal = randomVal;
    }
    
    void setTimestampCurrent(final int timestampCurrent) {
        this.timestampCurrent = timestampCurrent;
    }
    
    void setTimestampFirst(final int timestampFirst) {
        this.timestampFirst = timestampFirst;
    }
    
    void setTimestampPrevious(final int timestampPrevious) {
        this.timestampPrevious = timestampPrevious;
    }
    
    public void setTransaction(final Transaction transaction) {
        if (!this.category.equals("__##GOOGLETRANSACTION##__")) {
            throw new IllegalStateException("Attempted to add a transction to an event of type " + this.category);
        }
        this.transaction = transaction;
    }
    
    void setUseServerTime(final boolean useServerTime) {
        this.useServerTime = useServerTime;
    }
    
    void setUserId(final int userId) {
        this.userId = userId;
    }
    
    void setVisits(final int visits) {
        this.visits = visits;
    }
    
    public String toString() {
        return "id:" + this.eventId + " " + "random:" + this.randomVal + " " + "timestampCurrent:" + this.timestampCurrent + " " + "timestampPrevious:" + this.timestampPrevious + " " + "timestampFirst:" + this.timestampFirst + " " + "visits:" + this.visits + " " + "value:" + this.value + " " + "category:" + this.category + " " + "action:" + this.action + " " + "label:" + this.label + " " + "width:" + this.screenWidth + " " + "height:" + this.screenHeight;
    }
}
