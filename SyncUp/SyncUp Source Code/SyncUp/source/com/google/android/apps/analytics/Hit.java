package com.google.android.apps.analytics;

public class Hit
{
    final long hitId;
    final String hitString;
    
    Hit(final String hitString, final long hitId) {
        super();
        this.hitString = hitString;
        this.hitId = hitId;
    }
}
