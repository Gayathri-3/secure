package com.mpatric.mp3agic;

import java.util.*;

public class ID3v2FrameSet
{
    private ArrayList<ID3v2Frame> frames;
    private String id;
    
    public ID3v2FrameSet(final String id) {
        super();
        this.id = id;
        this.frames = new ArrayList<ID3v2Frame>();
    }
    
    public void addFrame(final ID3v2Frame id3v2Frame) {
        this.frames.add(id3v2Frame);
    }
    
    public void clear() {
        this.frames.clear();
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof ID3v2FrameSet;
        boolean b2 = false;
        if (b) {
            if (super.equals(o)) {
                b2 = true;
            }
            else {
                final ID3v2FrameSet set = (ID3v2FrameSet)o;
                if (this.id == null) {
                    final String id = set.id;
                    b2 = false;
                    if (id != null) {
                        return b2;
                    }
                }
                else {
                    final String id2 = set.id;
                    b2 = false;
                    if (id2 == null) {
                        return b2;
                    }
                    if (!this.id.equals(set.id)) {
                        b2 = false;
                        return b2;
                    }
                }
                if (this.frames == null) {
                    final ArrayList<ID3v2Frame> frames = set.frames;
                    b2 = false;
                    if (frames != null) {
                        return b2;
                    }
                }
                else {
                    final ArrayList<ID3v2Frame> frames2 = set.frames;
                    b2 = false;
                    if (frames2 == null) {
                        return b2;
                    }
                    if (!this.frames.equals(set.frames)) {
                        b2 = false;
                        return b2;
                    }
                }
                b2 = true;
            }
        }
        return b2;
    }
    
    public List<ID3v2Frame> getFrames() {
        return this.frames;
    }
    
    public String getId() {
        return this.id;
    }
    
    public String toString() {
        return String.valueOf(this.id) + ": " + this.frames.size();
    }
}
