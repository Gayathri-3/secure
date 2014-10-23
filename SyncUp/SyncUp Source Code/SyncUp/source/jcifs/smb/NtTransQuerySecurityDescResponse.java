package jcifs.smb;

import java.io.*;

class NtTransQuerySecurityDescResponse extends SmbComNtTransactionResponse
{
    SecurityDescriptor securityDescriptor;
    
    int readDataWireFormat(final byte[] array, final int n, final int n2) {
        int n3;
        if (this.errorCode != 0) {
            n3 = 4;
        }
        else {
            try {
                this.securityDescriptor = new SecurityDescriptor();
                n3 = n + this.securityDescriptor.decode(array, n, n2) - n;
            }
            catch (IOException ex) {
                throw new RuntimeException(ex.getMessage());
            }
        }
        return n3;
    }
    
    int readParametersWireFormat(final byte[] array, final int n, final int n2) {
        this.length = ServerMessageBlock.readInt4(array, n);
        return 4;
    }
    
    int readSetupWireFormat(final byte[] array, final int n, final int n2) {
        return 0;
    }
    
    public String toString() {
        return new String("NtTransQuerySecurityResponse[" + super.toString() + "]");
    }
    
    int writeDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeParametersWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeSetupWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
