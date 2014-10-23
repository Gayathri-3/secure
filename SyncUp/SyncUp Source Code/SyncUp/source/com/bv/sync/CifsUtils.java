package com.bv.sync;

import jcifs.netbios.*;
import java.util.*;
import java.net.*;
import java.io.*;

public class CifsUtils
{
    public static HostInfo getNetbiosInfo(String s) {
        HostInfo hostInfo;
        while (true) {
        Label_0154:
            while (true) {
                int n = 0;
                Label_0158: {
                    try {
                        final NbtAddress[] allByAddress = NbtAddress.getAllByAddress(s);
                        final HashSet<String> set = new HashSet<String>();
                        String hostName = null;
                        byte[] array = null;
                        final int length = allByAddress.length;
                        n = 0;
                        if (n >= length) {
                            if (hostName != null) {
                                hostInfo = new HostInfo(s, hostName, array, set.toArray(new String[set.size()]));
                                break;
                            }
                        }
                        else {
                            final NbtAddress nbtAddress = allByAddress[n];
                            if (nbtAddress.getNameType() == 32) {
                                hostName = nbtAddress.getHostName();
                            }
                            else if (nbtAddress.getNameType() == 0) {
                                set.add(nbtAddress.getHostName());
                            }
                            final String hostAddress = nbtAddress.getHostAddress();
                            if (hostAddress != null) {
                                s = hostAddress;
                            }
                            final byte[] macAddress = nbtAddress.getMacAddress();
                            if (!isEmpty(macAddress)) {
                                array = macAddress;
                            }
                            break Label_0158;
                        }
                    }
                    catch (UnknownHostException ex) {}
                    break Label_0154;
                }
                ++n;
                continue;
            }
            hostInfo = null;
            break;
        }
        return hostInfo;
    }
    
    private static boolean isEmpty(final byte[] array) {
        if (array != null) {
            for (final byte b : array) {
                final boolean b2 = false;
                if (b != 0) {
                    return b2;
                }
            }
        }
        return true;
    }
    
    public static class HostInfo implements Serializable
    {
        private static final long serialVersionUID = -9196347319613234862L;
        public final String[] domains;
        public final String ip;
        public byte[] mac;
        public final String name;
        
        public HostInfo(final String ip, final String name, final byte[] mac, final String[] domains) {
            super();
            this.ip = ip;
            this.name = name;
            this.mac = mac;
            this.domains = domains;
        }
        
        private String toHex(final byte[] array) {
            String string = "";
            if (array != null) {
                for (int i = 0; i < array.length; ++i) {
                    string = String.valueOf(string) + Integer.toString(256 + (0xFF & array[i]), 16).substring(1);
                }
            }
            return string;
        }
        
        private String toString(final String[] array) {
            String string = "";
            if (array != null) {
                for (int length = array.length, i = 0; i < length; ++i) {
                    string = String.valueOf(string) + array[i] + " ";
                }
            }
            return string;
        }
        
        public String toString() {
            return "name=" + this.name + "\n" + "ip=" + this.ip + "\n" + "mac=" + this.toHex(this.mac) + "\n" + "domains=" + this.toString(this.domains);
        }
    }
}
