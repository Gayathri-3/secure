package jcifs.util;

import java.io.*;

public class MimeMap
{
    private static final int IN_SIZE = 7000;
    private static final int ST_COMM = 2;
    private static final int ST_EXT = 5;
    private static final int ST_GAP = 4;
    private static final int ST_START = 1;
    private static final int ST_TYPE = 3;
    private byte[] in;
    private int inLen;
    
    public MimeMap() throws IOException {
        super();
        this.in = new byte[7000];
        final InputStream resourceAsStream = this.getClass().getClassLoader().getResourceAsStream("jcifs/util/mime.map");
        this.inLen = 0;
        while (true) {
            final int read = resourceAsStream.read(this.in, this.inLen, 7000 - this.inLen);
            if (read == -1) {
                break;
            }
            this.inLen += read;
        }
        if (this.inLen < 100 || this.inLen == 7000) {
            throw new IOException("Error reading jcifs/util/mime.map resource");
        }
        resourceAsStream.close();
    }
    
    public String getMimeType(final String s) throws IOException {
        return this.getMimeType(s, "application/octet-stream");
    }
    
    public String getMimeType(final String s, String s2) throws IOException {
        final byte[] array = new byte[128];
        final byte[] array2 = new byte[16];
        final byte[] bytes = s.toLowerCase().getBytes("ASCII");
        int n = 1;
        int n2 = 0;
        int n3 = 0;
    Label_0044:
        for (int i = 0; i < this.inLen; ++i) {
            final byte b = this.in[i];
            Label_0203: {
                switch (n) {
                    case 1: {
                        if (b == 32 || b == 9) {
                            break;
                        }
                        if (b == 35) {
                            n = 2;
                            break;
                        }
                        n = 3;
                    }
                    case 3: {
                        if (b == 32 || b == 9) {
                            n = 4;
                            break;
                        }
                        final int n4 = n3 + 1;
                        array[n3] = b;
                        n3 = n4;
                        break;
                    }
                    case 2: {
                        if (b == 10) {
                            n = 1;
                            n3 = 0;
                            n2 = 0;
                            break;
                        }
                        break;
                    }
                    case 4: {
                        if (b != 32 && b != 9) {
                            n = 5;
                            break Label_0203;
                        }
                        break;
                    }
                    case 5: {
                        switch (b) {
                            default: {
                                final int n5 = n2 + 1;
                                array2[n2] = b;
                                n2 = n5;
                                continue;
                            }
                            case 9:
                            case 10:
                            case 32:
                            case 35: {
                                int n6;
                                for (n6 = 0; n6 < n2 && n2 == bytes.length && array2[n6] == bytes[n6]; ++n6) {}
                                if (n6 == bytes.length) {
                                    s2 = new String(array, 0, n3, "ASCII");
                                    break Label_0044;
                                }
                                if (b == 35) {
                                    n = 2;
                                }
                                else if (b == 10) {
                                    n = 1;
                                    n3 = 0;
                                }
                                n2 = 0;
                                continue;
                            }
                        }
                        break;
                    }
                }
            }
        }
        return s2;
    }
}
