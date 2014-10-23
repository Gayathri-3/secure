package com.mpatric.mp3agic;

public class MutableInteger
{
    private int value;
    
    public MutableInteger(final int value) {
        super();
        this.value = value;
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof MutableInteger;
        boolean b2 = false;
        if (b) {
            if (super.equals(o)) {
                b2 = true;
            }
            else {
                final MutableInteger mutableInteger = (MutableInteger)o;
                final int value = this.value;
                final int value2 = mutableInteger.value;
                b2 = false;
                if (value == value2) {
                    b2 = true;
                }
            }
        }
        return b2;
    }
    
    public int getValue() {
        return this.value;
    }
    
    public void increment() {
        this.value += 1;
    }
    
    public void setValue(final int value) {
        this.value = value;
    }
}
