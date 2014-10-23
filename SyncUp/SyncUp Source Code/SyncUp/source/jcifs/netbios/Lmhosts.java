package jcifs.netbios;

import java.util.*;
import jcifs.util.*;
import jcifs.*;
import jcifs.smb.*;
import java.io.*;

public class Lmhosts
{
    private static final String FILENAME;
    private static final Hashtable TAB;
    private static int alt;
    private static long lastModified;
    private static LogStream log;
    
    static {
        FILENAME = Config.getProperty("jcifs.netbios.lmhosts");
        TAB = new Hashtable();
        Lmhosts.lastModified = 1L;
        Lmhosts.log = LogStream.getInstance();
    }
    
    public static NbtAddress getByName(final String s) {
        synchronized (Lmhosts.class) {
            return getByName(new Name(s, 32, null));
        }
    }
    
    static NbtAddress getByName(final Name name) {
        // monitorenter(Lmhosts.class)
        NbtAddress nbtAddress = null;
        try {
            final String filename = Lmhosts.FILENAME;
            nbtAddress = null;
            if (filename != null) {
                final File file = new File(Lmhosts.FILENAME);
                final long lastModified = file.lastModified();
                final long n = lcmp(lastModified, Lmhosts.lastModified);
                nbtAddress = null;
                if (n > 0) {
                    Lmhosts.lastModified = lastModified;
                    Lmhosts.TAB.clear();
                    Lmhosts.alt = 0;
                    populate(new FileReader(file));
                }
                nbtAddress = Lmhosts.TAB.get(name);
            }
            return nbtAddress;
        }
        catch (FileNotFoundException ex) {
            if (LogStream.level > 1) {
                Lmhosts.log.println("lmhosts file: " + Lmhosts.FILENAME);
                ex.printStackTrace(Lmhosts.log);
                return nbtAddress;
            }
            return nbtAddress;
        }
        catch (IOException ex2) {
            if (LogStream.level > 0) {
                ex2.printStackTrace(Lmhosts.log);
                return nbtAddress;
            }
            return nbtAddress;
        }
        finally {}
        // monitorexit(Lmhosts.class)
    }
    
    static void populate(final Reader reader) throws IOException {
        final BufferedReader bufferedReader = new BufferedReader(reader);
        while (true) {
            final String line = bufferedReader.readLine();
            if (line == null) {
                return;
            }
            final String trim = line.toUpperCase().trim();
            if (trim.length() == 0) {
                continue;
            }
            if (trim.charAt(0) == '#') {
                if (trim.startsWith("#INCLUDE ")) {
                    final String string = "smb:" + trim.substring(trim.indexOf(92)).replace('\\', '/');
                    if (Lmhosts.alt > 0) {
                        try {
                            populate(new InputStreamReader(new SmbFileInputStream(string)));
                            Lmhosts.alt -= 1;
                            String line2;
                            do {
                                line2 = bufferedReader.readLine();
                                if (line2 != null) {
                                    continue;
                                }
                                break;
                            } while (!line2.toUpperCase().trim().startsWith("#END_ALTERNATE"));
                        }
                        catch (IOException ex) {
                            Lmhosts.log.println("lmhosts URL: " + string);
                            ex.printStackTrace(Lmhosts.log);
                        }
                    }
                    else {
                        populate(new InputStreamReader(new SmbFileInputStream(string)));
                    }
                }
                else if (trim.startsWith("#BEGIN_ALTERNATE")) {
                    Lmhosts.alt += 1;
                }
                else {
                    if (trim.startsWith("#END_ALTERNATE") && Lmhosts.alt > 0) {
                        Lmhosts.alt -= 1;
                        throw new IOException("no lmhosts alternate includes loaded");
                    }
                    continue;
                }
            }
            else {
                if (!Character.isDigit(trim.charAt(0))) {
                    continue;
                }
                final char[] charArray = trim.toCharArray();
                int n = 46;
                int i = 0;
                int n2 = 0;
                while (i < charArray.length && n == 46) {
                    int n3 = 0;
                    while (i < charArray.length) {
                        n = charArray[i];
                        if (n < 48 || n > 57) {
                            break;
                        }
                        n3 = -48 + (n + n3 * 10);
                        ++i;
                    }
                    n2 = n3 + (n2 << 8);
                    ++i;
                }
                while (i < charArray.length && Character.isWhitespace(charArray[i])) {
                    ++i;
                }
                int n4;
                for (n4 = i; n4 < charArray.length && !Character.isWhitespace(charArray[n4]); ++n4) {}
                final Name name = new Name(trim.substring(i, n4), 32, null);
                Lmhosts.TAB.put(name, new NbtAddress(name, n2, false, 0, false, false, true, true, NbtAddress.UNKNOWN_MAC_ADDRESS));
            }
        }
    }
}
