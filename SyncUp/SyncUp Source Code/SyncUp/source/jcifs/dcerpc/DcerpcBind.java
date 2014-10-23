package jcifs.dcerpc;

import jcifs.util.*;
import jcifs.dcerpc.ndr.*;

public class DcerpcBind extends DcerpcMessage
{
    static final String[] result_message;
    DcerpcBinding binding;
    int max_recv;
    int max_xmit;
    
    static {
        result_message = new String[] { "0", "DCERPC_BIND_ERR_ABSTRACT_SYNTAX_NOT_SUPPORTED", "DCERPC_BIND_ERR_PROPOSED_TRANSFER_SYNTAXES_NOT_SUPPORTED", "DCERPC_BIND_ERR_LOCAL_LIMIT_EXCEEDED" };
    }
    
    public DcerpcBind() {
        super();
    }
    
    DcerpcBind(final DcerpcBinding binding, final DcerpcHandle dcerpcHandle) {
        super();
        this.binding = binding;
        this.max_xmit = dcerpcHandle.max_xmit;
        this.max_recv = dcerpcHandle.max_recv;
        this.ptype = 11;
        this.flags = 3;
    }
    
    static String getResultMessage(final int n) {
        String string;
        if (n < 4) {
            string = DcerpcBind.result_message[n];
        }
        else {
            string = "0x" + Hexdump.toHexString(n, 4);
        }
        return string;
    }
    
    public void decode_out(final NdrBuffer ndrBuffer) throws NdrException {
        ndrBuffer.dec_ndr_short();
        ndrBuffer.dec_ndr_short();
        ndrBuffer.dec_ndr_long();
        ndrBuffer.advance(ndrBuffer.dec_ndr_short());
        ndrBuffer.align(4);
        ndrBuffer.dec_ndr_small();
        ndrBuffer.align(4);
        this.result = ndrBuffer.dec_ndr_short();
        ndrBuffer.dec_ndr_short();
        ndrBuffer.advance(20);
    }
    
    public void encode_in(final NdrBuffer ndrBuffer) throws NdrException {
        ndrBuffer.enc_ndr_short(this.max_xmit);
        ndrBuffer.enc_ndr_short(this.max_recv);
        ndrBuffer.enc_ndr_long(0);
        ndrBuffer.enc_ndr_small(1);
        ndrBuffer.enc_ndr_small(0);
        ndrBuffer.enc_ndr_short(0);
        ndrBuffer.enc_ndr_short(0);
        ndrBuffer.enc_ndr_small(1);
        ndrBuffer.enc_ndr_small(0);
        ((rpc.uuid_t)this.binding.uuid).encode(ndrBuffer);
        ndrBuffer.enc_ndr_short(this.binding.major);
        ndrBuffer.enc_ndr_short(this.binding.minor);
        ((rpc.uuid_t)DcerpcBind.DCERPC_UUID_SYNTAX_NDR).encode(ndrBuffer);
        ndrBuffer.enc_ndr_long(2);
    }
    
    public int getOpnum() {
        return 0;
    }
    
    public DcerpcException getResult() {
        DcerpcException ex;
        if (this.result != 0) {
            ex = new DcerpcException(getResultMessage(this.result));
        }
        else {
            ex = null;
        }
        return ex;
    }
}
