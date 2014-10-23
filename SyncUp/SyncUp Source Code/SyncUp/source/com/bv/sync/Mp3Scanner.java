package com.bv.sync;

import java.util.*;
import com.mpatric.mp3agic.*;
import java.io.*;

public class Mp3Scanner
{
    private final List<MovedItem> changed;
    private int fileIndex;
    private int filesCount;
    private final Parser parser;
    private ProgressNotification progressNotification;
    private IFile root;
    
    public Mp3Scanner() {
        super();
        this.changed = new ArrayList<MovedItem>();
        this.parser = (Parser)new DefaultParser((DefaultParser)null);
    }
    
    Mp3Scanner(final Parser parser) {
        super();
        this.changed = new ArrayList<MovedItem>();
        this.parser = parser;
    }
    
    private String append(String string, final String s) {
        if (string.length() != 0) {
            string = String.valueOf(string) + File.separator;
        }
        return String.valueOf(string) + s.trim();
    }
    
    private String buildPath(final IFile file, final Options options) throws IOException {
        String s = "";
        this.parser.parse(file.getAbsolutePath());
        if (options.groupByArtist) {
            final String field = this.parser.getField(FieldType.Artist);
            if (field != null && Utils.isValidFileName(field)) {
                s = this.append(s, field);
            }
        }
        if (options.groupByAlbum) {
            final String field2 = this.parser.getField(FieldType.Album);
            if (field2 != null && Utils.isValidFileName(field2)) {
                s = this.append(s, field2);
            }
        }
        final boolean renameSongs = options.renameSongs;
        Object o = null;
        if (renameSongs) {
            final String field3 = this.parser.getField(FieldType.Title);
            o = null;
            if (field3 != null) {
                final boolean validFileName = Utils.isValidFileName(field3);
                o = null;
                if (validFileName) {
                    o = field3;
                }
            }
        }
        String s2;
        if (o != null) {
            s2 = this.append(s, String.valueOf(o) + ".mp3");
        }
        else {
            s2 = this.append(s, file.getName());
        }
        if (s2.length() == 0 || file.getAbsolutePath().endsWith(s2)) {
            s2 = null;
        }
        return s2;
    }
    
    private int calculateFiles(final IFile file) throws IOException {
        int n = 0;
        final IFile[] listFiles = file.listFiles();
        for (int length = listFiles.length, i = 0; i < length; ++i) {
            if (isMp3(listFiles[i].getName())) {
                ++n;
            }
        }
        return n;
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
    
    private static boolean isMp3(final String s) {
        return s.toLowerCase().endsWith(".mp3");
    }
    
    private IFile mkDirs(final String s) throws IOException {
        final StringTokenizer stringTokenizer = new StringTokenizer(s, File.separator);
        IFile file = this.root;
        final LinkedList<String> list = new LinkedList<String>();
        while (stringTokenizer.hasMoreTokens()) {
            list.add(stringTokenizer.nextToken());
        }
        list.removeLast();
        final Iterator<Object> iterator = list.iterator();
        while (iterator.hasNext()) {
            file = file.createFile(iterator.next());
            if (!file.exists()) {
                file.mkdir();
            }
        }
        return file;
    }
    
    private void move(final IFile file, final String s) throws IOException {
        final IFile file2 = this.mkDirs(s).createFile(new File(s).getName());
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
        if (file.isFile() && isMp3(file.getName())) {
            if (this.progressNotification != null) {
                final int fileIndex = 1 + this.fileIndex;
                this.fileIndex = fileIndex;
                updateProgress = this.updateProgress(file, fileIndex);
            }
            if (updateProgress) {
                final String buildPath = this.buildPath(file, options);
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
        this.fileIndex = 0;
        this.changed.clear();
        this.filesCount = this.calculateFiles(root);
        this.process(root.listFiles(), options);
    }
    
    private class DefaultParser implements Parser
    {
        private Mp3File file;
        
        public String getField(final FieldType fieldType) {
            final Mp3File file = this.file;
            String s = null;
            if (file == null) {
                return s;
            }
            try {
                final ID3v2 id3v2Tag = this.file.getId3v2Tag();
                s = null;
                if (id3v2Tag != null) {
                    s = fieldType.getValue(id3v2Tag);
                }
                if (s == null) {
                    final ID3v1 id3v1Tag = this.file.getId3v1Tag();
                    if (id3v1Tag != null) {
                        s = fieldType.getValue(id3v1Tag);
                    }
                }
                return s;
            }
            catch (IllegalArgumentException ex) {
                ex.printStackTrace();
                return s;
            }
        }
        
        public void parse(final String s) throws IOException {
            try {
                this.file = new Mp3File(s, false);
            }
            catch (UnsupportedTagException ex) {
                ex.printStackTrace();
            }
            catch (InvalidDataException ex2) {
                ex2.printStackTrace();
            }
        }
    }
    
    enum FieldType
    {
        Album {
            String getValue(final ID3v1 id3v1) {
                return id3v1.getAlbum();
            }
        }, 
        Artist {
            String getValue(final ID3v1 id3v1) {
                return id3v1.getArtist();
            }
        }, 
        Title {
            String getValue(final ID3v1 id3v1) {
                return id3v1.getTitle();
            }
        };
        
        abstract String getValue(final ID3v1 p0);
    }
    
    public static class Options implements Serializable
    {
        private static final long serialVersionUID = -7891396382469107685L;
        public boolean groupByAlbum;
        public boolean groupByArtist;
        public boolean renameSongs;
    }
    
    interface Parser
    {
        String getField(FieldType p0);
        
        void parse(String p0) throws IOException;
    }
}
