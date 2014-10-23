package jcifs.smb;

import java.io.*;
import jcifs.*;
import jcifs.util.*;

public final class NtlmChallenge implements Serializable
{
    public byte[] challenge;
    public UniAddress dc;
    
    NtlmChallenge(final byte[] challenge, final UniAddress dc) {
        super();
        this.challenge = challenge;
        this.dc = dc;
    }
    
    public String toString() {
        return "NtlmChallenge[challenge=0x" + Hexdump.toHexString(this.challenge, 0, 2 * this.challenge.length) + ",dc=" + this.dc.toString() + "]";
    }
}
