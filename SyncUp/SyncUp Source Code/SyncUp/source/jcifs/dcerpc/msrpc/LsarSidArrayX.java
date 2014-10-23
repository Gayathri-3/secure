package jcifs.dcerpc.msrpc;

import jcifs.smb.*;

class LsarSidArrayX extends lsarpc.LsarSidArray
{
    LsarSidArrayX(final SID[] array) {
        super();
        this.num_sids = array.length;
        this.sids = new lsarpc.LsarSidPtr[array.length];
        for (int i = 0; i < array.length; ++i) {
            this.sids[i] = new lsarpc.LsarSidPtr();
            this.sids[i].sid = array[i];
        }
    }
}
