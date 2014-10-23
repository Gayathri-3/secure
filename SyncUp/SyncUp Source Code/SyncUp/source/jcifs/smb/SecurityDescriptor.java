package jcifs.smb;

import java.io.*;

public class SecurityDescriptor
{
    public ACE[] aces;
    public int type;
    
    public SecurityDescriptor() {
        super();
    }
    
    public SecurityDescriptor(final byte[] array, final int n, final int n2) throws IOException {
        super();
        this.decode(array, n, n2);
    }
    
    public int decode(final byte[] array, final int n, final int n2) throws IOException {
        final int n3 = 1 + (n + 1);
        this.type = ServerMessageBlock.readInt2(array, n3);
        final int n4 = n3 + 2;
        ServerMessageBlock.readInt4(array, n4);
        final int n5 = n4 + 4;
        ServerMessageBlock.readInt4(array, n5);
        final int n6 = n5 + 4;
        ServerMessageBlock.readInt4(array, n6);
        final int int4 = ServerMessageBlock.readInt4(array, n6 + 4);
        final int n7 = 1 + (1 + (n + int4));
        ServerMessageBlock.readInt2(array, n7);
        final int n8 = n7 + 2;
        final int int2 = ServerMessageBlock.readInt4(array, n8);
        int n9 = n8 + 4;
        if (int2 > 4096) {
            throw new IOException("Invalid SecurityDescriptor");
        }
        if (int4 != 0) {
            this.aces = new ACE[int2];
            for (int i = 0; i < int2; ++i) {
                this.aces[i] = new ACE();
                n9 += this.aces[i].decode(array, n9);
            }
        }
        else {
            this.aces = null;
        }
        return n9 - n;
    }
    
    public String toString() {
        String s = "SecurityDescriptor:\n";
        if (this.aces != null) {
            for (int i = 0; i < this.aces.length; ++i) {
                s = String.valueOf(s) + this.aces[i].toString() + "\n";
            }
        }
        else {
            s = String.valueOf(s) + "NULL";
        }
        return s;
    }
}
