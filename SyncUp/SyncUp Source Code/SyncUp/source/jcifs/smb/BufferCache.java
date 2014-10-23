package jcifs.smb;

import jcifs.*;

public class BufferCache
{
    private static final int MAX_BUFFERS;
    static Object[] cache;
    private static int freeBuffers;
    
    static {
        MAX_BUFFERS = Config.getInt("jcifs.smb.maxBuffers", 16);
        BufferCache.cache = new Object[BufferCache.MAX_BUFFERS];
        BufferCache.freeBuffers = 0;
    }
    
    public static byte[] getBuffer() {
        byte[] array2;
        while (true) {
            while (true) {
                int n = 0;
                Label_0085: {
                    synchronized (BufferCache.cache) {
                        if (BufferCache.freeBuffers > 0) {
                            n = 0;
                            if (n < BufferCache.MAX_BUFFERS) {
                                if (BufferCache.cache[n] != null) {
                                    final byte[] array = (byte[])BufferCache.cache[n];
                                    BufferCache.cache[n] = null;
                                    BufferCache.freeBuffers -= 1;
                                    // monitorexit(BufferCache.cache)
                                    array2 = array;
                                    break;
                                }
                                break Label_0085;
                            }
                        }
                        final byte[] array3 = new byte[65535];
                        // monitorexit(BufferCache.cache)
                        array2 = array3;
                    }
                    break;
                }
                ++n;
                continue;
            }
        }
        return array2;
    }
    
    static void getBuffers(final SmbComTransaction smbComTransaction, final SmbComTransactionResponse smbComTransactionResponse) {
        synchronized (BufferCache.cache) {
            smbComTransaction.txn_buf = getBuffer();
            smbComTransactionResponse.txn_buf = getBuffer();
        }
    }
    
    public static void releaseBuffer(final byte[] array) {
        while (true) {
            while (true) {
                int n = 0;
                Label_0061: {
                    synchronized (BufferCache.cache) {
                        if (BufferCache.freeBuffers < BufferCache.MAX_BUFFERS) {
                            n = 0;
                            if (n < BufferCache.MAX_BUFFERS) {
                                if (BufferCache.cache[n] != null) {
                                    break Label_0061;
                                }
                                BufferCache.cache[n] = array;
                                BufferCache.freeBuffers += 1;
                            }
                        }
                        break;
                    }
                }
                ++n;
                continue;
            }
        }
    }
}
