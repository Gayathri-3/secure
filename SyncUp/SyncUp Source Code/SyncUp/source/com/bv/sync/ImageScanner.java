package com.bv.sync;

import java.text.*;
import java.util.*;
import java.io.*;

public class ImageScanner
{
    private final HashMap<Point, String> addressCache;
    private final LinkedList<MovedItem> changed;
    private int fileIndex;
    private int filesCount;
    private Parser imageParser;
    private ProgressNotification progressNotification;
    private IFile root;
    
    public ImageScanner(final Parser imageParser) {
        super();
        this.changed = new LinkedList<MovedItem>();
        this.addressCache = new HashMap<Point, String>();
        this.imageParser = imageParser;
    }
    
    private String append(String string, final String s) {
        if (string.length() != 0) {
            string = String.valueOf(string) + File.separator;
        }
        return String.valueOf(string) + s;
    }
    
    private String buildPath(final IFile file, final Parser parser, final Options options) throws IOException {
        String s = "";
        parser.parse(file.getAbsolutePath());
        if (options.groupByYear || options.groupByMonth || options.groupByDay) {
            final Calendar instance = Calendar.getInstance();
            final Date time = parser.getTime();
            if (time != null) {
                instance.setTime(time);
                if (options.groupByYear && time != null) {
                    s = this.append(s, new StringBuilder().append(instance.get(1)).toString());
                }
                if (options.groupByMonth && time != null) {
                    s = this.append(s, getMonthName(instance.get(2), options.numericMonth));
                }
                if (options.groupByDay && time != null) {
                    s = this.append(s, new StringBuilder().append(this.getDay(instance.get(5), options.doubleDigitDay)).toString());
                }
            }
        }
        if (options.groupByAddress) {
            final String address = this.getAddress(parser);
            if (address != null && Utils.isValidFileName(address)) {
                s = this.append(s, new StringBuilder().append(address).toString());
            }
        }
        if (s.length() == 0 || file.getAbsolutePath().endsWith(s)) {
            s = null;
        }
        return s;
    }
    
    private int calculateFiles(final IFile file, final Options options) throws IOException {
        int n = 0;
        final IFile[] listFiles = file.listFiles();
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            if (this.isMovable(listFiles[i], options)) {
                ++n;
            }
        }
        return n;
    }
    
    private static boolean contains(final String s, final String[] array) {
        final String lowerCase = s.toLowerCase();
        final int length = array.length;
        int n = 0;
        boolean b;
        while (true) {
            b = false;
            if (n >= length) {
                break;
            }
            if (lowerCase.endsWith(array[n])) {
                return true;
            }
            ++n;
        }
        return b;
        b = true;
        return b;
    }
    
    private String getAddress(final Parser parser) throws IOException {
        final double latitude = parser.getLatitude();
        final double longitude = parser.getLongitude();
        String address;
        if (latitude != 0.0 || longitude != 0.0) {
            final Point point = new Point(latitude, longitude);
            address = this.addressCache.get(point);
            if (address == null) {
                address = parser.getAddress();
                if (address != null) {
                    this.addressCache.put(point, address);
                }
            }
        }
        else {
            address = null;
        }
        return address;
    }
    
    private String getDay(final int n, final boolean b) {
        String s;
        if (b) {
            s = String.format("%02d", n);
        }
        else {
            s = new StringBuilder().append(n).toString();
        }
        return s;
    }
    
    private static String getMonthName(final int n, final boolean b) {
        String format;
        if (b) {
            format = String.format("%02d", n + 1);
        }
        else {
            format = new DateFormatSymbols().getMonths()[n];
        }
        return format;
    }
    
    private SyncItem.Type getType(final IFile file) {
        SyncItem.Type type;
        if (file instanceof RemoteFile) {
            type = SyncItem.Type.RemoteFile;
        }
        else {
            type = SyncItem.Type.LocalFile;
        }
        return type;
    }
    
    public static boolean isJpeg(final String s) {
        return contains(s, new String[] { ".jpg", ".jpeg" });
    }
    
    private boolean isMovable(final IFile file, final Options options) throws IOException {
        return file.isFile() && (isJpeg(file.getName()) || (options.groupVideos && isVideo(file.getName())));
    }
    
    public static boolean isVideo(final String s) {
        return contains(s, new String[] { ".3gp", ".mp4", ".avi", ".mov", ".mpg", ".mpeg" });
    }
    
    private IFile mkDirs(final String s) throws IOException {
        final StringTokenizer stringTokenizer = new StringTokenizer(s, File.separator);
        IFile file = this.root;
        while (stringTokenizer.hasMoreTokens()) {
            file = file.createFile(stringTokenizer.nextToken());
            if (!file.exists()) {
                file.mkdir();
            }
        }
        return file;
    }
    
    private void move(final IFile file, final String s) throws IOException {
        final IFile file2 = this.mkDirs(s).createFile(file.getName());
        if (!file2.exists()) {
            file.renameTo(file2);
            this.changed.add(new MovedItem(file.getAbsolutePath(), file.getLastModified(), this.getType(file), file.length(), file2.getAbsolutePath(), false));
        }
    }
    
    private void process(final IFile[] array, final Options options) throws IOException {
        for (int length = array.length, n = 0; n < length && this.process(array[n], options); ++n) {}
    }
    
    private boolean process(final IFile file, final Options options) throws IOException {
        boolean updateProgress = true;
        if (this.isMovable(file, options)) {
            if (this.progressNotification != null) {
                final int fileIndex = 1 + this.fileIndex;
                this.fileIndex = fileIndex;
                updateProgress = this.updateProgress(file, fileIndex);
            }
            if (updateProgress) {
                Object imageParser;
                if (isJpeg(file.getName())) {
                    imageParser = this.imageParser;
                }
                else {
                    imageParser = new VideoParser(null);
                }
                final String buildPath = this.buildPath(file, (Parser)imageParser, options);
                if (buildPath != null) {
                    this.move(file, buildPath);
                }
            }
        }
        return updateProgress;
    }
    
    private boolean updateProgress(final IFile file, final int n) {
        final int filesCount = this.filesCount;
        int n2 = 0;
        if (filesCount != 0) {
            n2 = (int)(100.0f * (n / this.filesCount));
        }
        return this.progressNotification.update(ProgressNotification.ProgressAction.Grouping, n2, file);
    }
    
    public Collection<MovedItem> getChanged() {
        return this.changed;
    }
    
    public void run(final IFile root, final Options options, final ProgressNotification progressNotification) throws IOException {
        this.progressNotification = progressNotification;
        this.root = root;
        this.changed.clear();
        this.fileIndex = 0;
        this.filesCount = this.calculateFiles(root, options);
        this.process(root.listFiles(), options);
    }
    
    public static class Options implements Serializable
    {
        private static final long serialVersionUID = -4288363519466929501L;
        public boolean doubleDigitDay;
        public boolean groupByAddress;
        public boolean groupByDay;
        public boolean groupByMonth;
        public boolean groupByYear;
        public boolean groupVideos;
        public boolean numericMonth;
    }
    
    public interface Parser
    {
        String getAddress() throws IOException;
        
        double getLatitude() throws IOException;
        
        double getLongitude() throws IOException;
        
        Date getTime() throws IOException;
        
        void parse(String p0) throws IOException;
    }
    
    private class Point
    {
        double x;
        double y;
        
        Point(final double x, final double y) {
            super();
            this.x = x;
            this.y = y;
        }
        
        public boolean equals(final Object o) {
            boolean b = true;
            if (o != this) {
                if (o instanceof Point) {
                    final Point point = (Point)o;
                    if (point.x != this.x || point.y != this.y) {
                        b = false;
                    }
                }
                else {
                    b = false;
                }
            }
            return b;
        }
        
        public int hashCode() {
            return new Double(this.x).hashCode() + new Double(this.y).hashCode();
        }
    }
    
    private static class VideoParser implements Parser
    {
        private Date date;
        
        public String getAddress() throws IOException {
            return null;
        }
        
        public double getLatitude() throws IOException {
            return 0.0;
        }
        
        public double getLongitude() throws IOException {
            return 0.0;
        }
        
        public Date getTime() throws IOException {
            return this.date;
        }
        
        public void parse(final String s) throws IOException {
            this.date = new Date(new File(s).lastModified());
        }
    }
}
