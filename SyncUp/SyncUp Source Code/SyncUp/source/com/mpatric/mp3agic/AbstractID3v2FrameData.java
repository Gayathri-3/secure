package com.mpatric.mp3agic;

public abstract class AbstractID3v2FrameData
{
    boolean unsynchronisation;
    
    public AbstractID3v2FrameData(final boolean unsynchronisation) {
        super();
        this.unsynchronisation = unsynchronisation;
    }
    
    public boolean equals(final Object o) {
        final boolean b = o instanceof AbstractID3v2FrameData;
        boolean b2 = false;
        if (b) {
            final AbstractID3v2FrameData abstractID3v2FrameData = (AbstractID3v2FrameData)o;
            final boolean unsynchronisation = this.unsynchronisation;
            final boolean unsynchronisation2 = abstractID3v2FrameData.unsynchronisation;
            b2 = false;
            if (unsynchronisation == unsynchronisation2) {
                b2 = true;
            }
        }
        return b2;
    }
    
    protected abstract int getLength();
    
    protected byte[] packAndUnsynchroniseFrameData() {
        byte[] array = this.packFrameData();
        if (this.unsynchronisation && BufferTools.sizeUnsynchronisationWouldAdd(array) > 0) {
            array = BufferTools.unsynchroniseBuffer(array);
        }
        return array;
    }
    
    protected abstract byte[] packFrameData();
    
    protected void synchroniseAndUnpackFrameData(final byte[] array) throws InvalidDataException {
        if (this.unsynchronisation && BufferTools.sizeSynchronisationWouldSubtract(array) > 0) {
            this.unpackFrameData(BufferTools.synchroniseBuffer(array));
        }
        else {
            this.unpackFrameData(array);
        }
    }
    
    protected byte[] toBytes() {
        return this.packAndUnsynchroniseFrameData();
    }
    
    protected abstract void unpackFrameData(final byte[] p0) throws InvalidDataException;
}
