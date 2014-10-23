package jcifs.netbios;

import java.io.*;

class NodeStatusResponse extends NameServicePacket
{
    NbtAddress[] addressArray;
    private byte[] macAddress;
    private int numberOfNames;
    private NbtAddress queryAddress;
    private byte[] stats;
    
    NodeStatusResponse(final NbtAddress queryAddress) {
        super();
        this.queryAddress = queryAddress;
        this.recordName = new Name();
        this.macAddress = new byte[6];
    }
    
    private int readNodeNameArray(final byte[] array, int n) {
        final int n2 = n;
        this.addressArray = new NbtAddress[this.numberOfNames];
        final String scope = this.queryAddress.hostName.scope;
        int n3 = 0;
        int n4 = 0;
        boolean groupName;
        int nodeType;
        boolean isBeingDeleted;
        boolean isInConflict;
        boolean isActive;
        boolean isPermanent;
        int n5;
        String s;
        int n6;
        Label_0043_Outer:Label_0173_Outer:
        while (true) {
        Label_0188:
            while (true) {
                Label_0173:Label_0158_Outer:
                while (true) {
                Label_0158:
                    while (true) {
                    Label_0141:
                        while (true) {
                        Label_0111:
                            while (true) {
                            Label_0239_Outer:
                                while (true) {
                                    Label_0430: {
                                        Label_0421: {
                                            try {
                                                if (n4 >= this.numberOfNames) {
                                                    break;
                                                }
                                                break Label_0421;
                                                // iftrue(Label_0439:, array[n5] == 32)
                                                // iftrue(Label_0469:, 0x2 & array[n + 16] != 0x2)
                                                // iftrue(Label_0457:, 0x8 & array[n + 16] != 0x8)
                                                // iftrue(Label_0445:, 0x80 & array[n + 16] != 0x80)
                                                // iftrue(Label_0463:, 0x4 & array[n + 16] != 0x4)
                                                // iftrue(Label_0451:, 0x10 & array[n + 16] != 0x10)
                                                // iftrue(Label_0272:, this.queryAddress.hostName != NbtAddress.UNKNOWN_NAME)
                                                // iftrue(Label_0362:, n3 != 0 || this.queryAddress.hostName.hexCode != n6 || this.queryAddress.hostName != NbtAddress.UNKNOWN_NAME && !this.queryAddress.hostName.name.equals((Object)s))
                                                while (true) {
                                                    while (true) {
                                                    Block_5:
                                                        while (true) {
                                                            this.queryAddress.groupName = groupName;
                                                            this.queryAddress.nodeType = nodeType;
                                                            this.queryAddress.isBeingDeleted = isBeingDeleted;
                                                            this.queryAddress.isInConflict = isInConflict;
                                                            this.queryAddress.isActive = isActive;
                                                            this.queryAddress.isPermanent = isPermanent;
                                                            this.queryAddress.macAddress = this.macAddress;
                                                            this.queryAddress.isDataFromNodeStatus = true;
                                                            n3 = 1;
                                                            this.addressArray[n4] = this.queryAddress;
                                                            break Label_0430;
                                                            Block_6: {
                                                                Block_4: {
                                                                    Block_8: {
                                                                        Block_3: {
                                                                            break Block_3;
                                                                            break Block_8;
                                                                            break Block_6;
                                                                        }
                                                                        s = new String(array, n, 1 + (n5 - n), Name.OEM_ENCODING);
                                                                        n6 = (0xFF & array[n + 15]);
                                                                        break Block_4;
                                                                    }
                                                                    isPermanent = true;
                                                                    break Label_0188;
                                                                }
                                                                groupName = true;
                                                                break Label_0111;
                                                                while (true) {
                                                                    isActive = true;
                                                                    continue Label_0173;
                                                                    continue Label_0158_Outer;
                                                                }
                                                            }
                                                            isInConflict = true;
                                                            continue Label_0158;
                                                            nodeType = (0x60 & array[n + 16]) >> 5;
                                                            break Block_5;
                                                            this.queryAddress.hostName = new Name(s, n6, scope);
                                                            continue Label_0043_Outer;
                                                        }
                                                        isBeingDeleted = true;
                                                        continue Label_0141;
                                                        continue Label_0239_Outer;
                                                    }
                                                    continue;
                                                }
                                                Label_0362: {
                                                    this.addressArray[n4] = new NbtAddress(new Name(s, n6, scope), this.queryAddress.address, groupName, nodeType, isBeingDeleted, isInConflict, isActive, isPermanent, this.macAddress);
                                                }
                                                break Label_0430;
                                            }
                                            catch (UnsupportedEncodingException ex) {}
                                            break;
                                        }
                                        n5 = n + 14;
                                        continue Label_0173_Outer;
                                    }
                                    n += 18;
                                    ++n4;
                                    continue Label_0043_Outer;
                                    Label_0439: {
                                        --n5;
                                    }
                                    continue Label_0173_Outer;
                                }
                                Label_0445: {
                                    groupName = false;
                                }
                                continue Label_0111;
                            }
                            Label_0451: {
                                isBeingDeleted = false;
                            }
                            continue Label_0141;
                        }
                        Label_0457: {
                            isInConflict = false;
                        }
                        continue Label_0158;
                    }
                    Label_0463: {
                        isActive = false;
                    }
                    continue Label_0173;
                }
                Label_0469: {
                    isPermanent = false;
                }
                continue Label_0188;
            }
        }
        return n - n2;
    }
    
    int readBodyWireFormat(final byte[] array, final int n) {
        return this.readResourceRecordWireFormat(array, n);
    }
    
    int readRDataWireFormat(final byte[] array, final int n) {
        this.numberOfNames = (0xFF & array[n]);
        final int n2 = 18 * this.numberOfNames;
        final int n3 = -1 + (this.rDataLength - n2);
        final int n4 = n + 1;
        this.numberOfNames = (0xFF & array[n]);
        System.arraycopy(array, n4 + n2, this.macAddress, 0, 6);
        final int n5 = n4 + this.readNodeNameArray(array, n4);
        System.arraycopy(array, n5, this.stats = new byte[n3], 0, n3);
        return n5 + n3 - n;
    }
    
    public String toString() {
        return new String("NodeStatusResponse[" + super.toString() + "]");
    }
    
    int writeBodyWireFormat(final byte[] array, final int n) {
        return 0;
    }
    
    int writeRDataWireFormat(final byte[] array, final int n) {
        return 0;
    }
}
