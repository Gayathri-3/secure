package com.bv.wifisync;

import android.app.backup.*;
import android.content.*;
import java.io.*;
import java.util.*;
import android.util.*;

public class HostList extends ArrayList<Host>
{
    private static final String TAG = "HostList";
    private static final long serialVersionUID = 5339620888330146302L;
    private transient BackupManager backupManager;
    private transient long lastSaveTime;
    private int nextId;
    
    HostList(final Context context) {
        super();
        this.lastSaveTime = System.currentTimeMillis();
        this.backupManager = new BackupManager(context);
    }
    
    private HostList(final ArrayList<Host> list) throws IOException {
        super(list);
        this.lastSaveTime = System.currentTimeMillis();
    }
    
    private boolean assignUniqueIds() {
        boolean b = false;
        final HashSet<Integer> set = new HashSet<Integer>();
        final Iterator<Host> iterator = this.iterator();
        while (iterator.hasNext()) {
            final Iterator<Job> iterator2 = iterator.next().getJobs().iterator();
            while (iterator2.hasNext()) {
                set.add(iterator2.next().id);
            }
        }
        for (final Host host : this) {
            if (set.contains(host.id)) {
                b = true;
                final int n = 1 + this.nextId;
                this.nextId = n;
                host.id = n;
                Log.w("HostList", "Reassigned id for host: " + host.name + " " + host.id + " new id: " + this.nextId);
            }
            set.add(host.id);
            for (final Job job : host.getJobs()) {
                if (job.id == 0) {
                    b = true;
                    final int n2 = 1 + this.nextId;
                    this.nextId = n2;
                    job.id = n2;
                    Log.w("HostList", "Reassigned id for job: " + job.getName() + " " + job.id + " new id: " + this.nextId);
                    set.add(job.id);
                }
            }
        }
        return b;
    }
    
    private boolean fixHostIds() {
        return this.fixNextId() | this.assignUniqueIds();
    }
    
    private boolean fixNextId() {
        boolean b = false;
        for (final Host host : this) {
            if (host.id > this.nextId) {
                this.nextId = host.id;
                b = true;
            }
            for (final Job job : host.getJobs()) {
                if (job.id > this.nextId) {
                    this.nextId = job.id;
                    b = true;
                }
            }
        }
        return b;
    }
    
    private void init(final Context context) throws IOException {
        this.lastSaveTime = System.currentTimeMillis();
        this.backupManager = new BackupManager(context);
        if (this.fixHostIds()) {
            this.save(context);
        }
        this.validate(context);
    }
    
    static HostList load(final Context context) throws ClassNotFoundException, IOException {
    Label_0021_Outer:
        while (true) {
            while (true) {
                ArrayList<Host> config;
                while (true) {
                    try {
                        config = Utils.readConfig(context);
                        if (config instanceof HostList) {
                            final HostList list = (HostList)config;
                            list.init(context);
                            return list;
                        }
                    }
                    catch (FileNotFoundException ex) {
                        config = (ArrayList<Host>)new ArrayList();
                        continue Label_0021_Outer;
                    }
                    break;
                }
                final HostList list = new HostList(config);
                continue;
            }
        }
    }
    
    private void save(final Context context, final boolean b) throws IOException {
        // monitorenter(this)
        Label_0017: {
            if (b) {
                break Label_0017;
            }
            try {
                if (this.saveNeeded(this.lastSaveTime)) {
                    Utils.writeConfig(context, this, this.backupManager);
                }
                this.lastSaveTime = System.currentTimeMillis();
            }
            finally {}
            // monitorexit(this)
        }
    }
    
    private boolean saveNeeded(final long n) {
        final Iterator<Host> iterator = this.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().changedSince(n)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean add(final Host host) {
        synchronized (this) {
            final int n = 1 + this.nextId;
            this.nextId = n;
            host.id = n;
            return super.add(host);
        }
    }
    
    void addJob(final Job job, final Host host) {
        synchronized (this) {
            job.host = host;
            final int n = 1 + this.nextId;
            this.nextId = n;
            job.id = n;
            job.host.addJob(job);
        }
    }
    
    void checkConnected(final Context context, final long n, final ChangeListener changeListener) throws InterruptedException {
        new ConnectionDetector(context, n, changeListener).run();
    }
    
    int getJobCount() {
        // monitorenter(this)
        int n = 0;
        try {
            final Iterator<Host> iterator = this.iterator();
            while (iterator.hasNext()) {
                n += iterator.next().getJobs().size();
            }
            return n;
        }
        finally {}
        // monitorexit(this)
    }
    
    List<Job> getJobs() {
        synchronized (this) {
            final LinkedList<Job> list = new LinkedList<Job>();
            final Iterator<Host> iterator = this.iterator();
            while (iterator.hasNext()) {
                list.addAll(iterator.next().getJobs());
            }
            return list;
        }
    }
    
    Throwable getMostRecentError() {
        // monitorenter(this)
        long lastRun = 0L;
        Throwable lastResult = null;
        try {
            final Iterator<Host> iterator = this.iterator();
            while (iterator.hasNext()) {
                for (final Job job : iterator.next().getJobs()) {
                    if (lastRun < job.lastRun) {
                        lastResult = job.lastResult;
                        lastRun = job.lastRun;
                    }
                }
            }
            return lastResult;
        }
        finally {}
        // monitorexit(this)
    }
    
    boolean hasFailedJobs() {
        synchronized (this) {
            final Iterator<Host> iterator = this.iterator();
            while (iterator.hasNext()) {
                for (final Job job : iterator.next().getJobs()) {
                    if (job.lastResult != null && !job.running) {
                        return true;
                    }
                }
            }
            return false;
        }
    }
    
    boolean noRunJob() {
        synchronized (this) {
            final Iterator<Host> iterator = this.iterator();
            while (iterator.hasNext()) {
                for (final Job job : iterator.next().getJobs()) {
                    if (job.lastRun != 0L && !job.running) {
                        return false;
                    }
                }
            }
            return true;
        }
    }
    
    boolean noScheduledJobs() {
        synchronized (this) {
            final Iterator<Host> iterator = this.iterator();
            while (iterator.hasNext()) {
                for (final Job job : iterator.next().getJobs()) {
                    if (job.isScheduled() || job.isRouterDependant()) {
                        return false;
                    }
                }
            }
            return true;
        }
    }
    
    public Host remove(final int n) {
        synchronized (this) {
            return super.remove(n);
        }
    }
    
    public boolean remove(final Object o) {
        synchronized (this) {
            return super.remove(o);
        }
    }
    
    void save(final Context context) throws IOException {
        this.save(context, true);
    }
    
    void saveIfChanged(final Context context) throws IOException {
        this.save(context, false);
    }
    
    public int size() {
        synchronized (this) {
            return super.size();
        }
    }
    
    void updateHost(final Host host, final Host host2) {
        synchronized (this) {
            host.update(host2);
        }
    }
    
    void updateJob(final Context context, final Job job, final Job job2) throws IOException {
        synchronized (this) {
            job.update(context, job2);
        }
    }
    
    void validate(final Context context) throws IOException {
        Job job = null;
    Block_3:
        while (true) {
            final SparseArray sparseArray = new SparseArray();
            while (true) {
                final Host host;
                synchronized (this) {
                    final Iterator<Host> iterator = this.iterator();
                    if (!iterator.hasNext()) {
                        return;
                    }
                    host = iterator.next();
                    host.validate(context);
                    if (sparseArray.get(host.id) != null) {
                        throw new IOException(context.getString(2131099821, new Object[] { host.name }));
                    }
                }
                sparseArray.put(host.id, (Object)host.name);
                final Iterator<Job> iterator2 = host.getJobs().iterator();
                while (iterator2.hasNext()) {
                    job = iterator2.next();
                    job.validate(context);
                    if (sparseArray.get(job.id) != null) {
                        break Block_3;
                    }
                    sparseArray.put(job.id, (Object)job.getName());
                }
                continue;
            }
        }
        throw new IOException(context.getString(2131099821, new Object[] { job.getName() }));
    }
    
    interface ChangeListener
    {
        void onChanged();
    }
    
    private class ConnectionDetector
    {
        private static final long RESOLVE_TIMEOUT = 300000L;
        private final Context context;
        private final long lastReconnect;
        private final ChangeListener listener;
        
        ConnectionDetector(final Context context, final long lastReconnect, final ChangeListener listener) {
            super();
            this.listener = listener;
            this.context = context;
            this.lastReconnect = lastReconnect;
        }
        
        void run() throws InterruptedException {
            LinkedList<CheckTask> list;
            Iterator<Host> iterator;
            boolean b = false;
            Iterator<Object> iterator2 = null;
            Iterator<Object> iterator3 = null;
            CheckTask checkTask;
            CheckTask checkTask2;
            Label_0058_Outer:Label_0074_Outer:
            while (true) {
                list = new LinkedList<CheckTask>();
                while (true) {
                Label_0166:
                    while (true) {
                    Label_0129:
                        while (true) {
                            synchronized (this) {
                                iterator = HostList.this.iterator();
                                while (iterator.hasNext()) {
                                    list.add(new CheckTask(this.context, iterator.next()));
                                }
                                // monitorexit(this)
                                if (Config.getForceWifi(this.context) && !Utils.isWifiConnected(this.context)) {
                                    b = false;
                                    iterator2 = list.iterator();
                                    if (iterator2.hasNext()) {
                                        break Label_0129;
                                    }
                                    iterator3 = list.iterator();
                                    if (!iterator3.hasNext()) {
                                        return;
                                    }
                                    break Label_0166;
                                }
                            }
                            b = true;
                            continue Label_0058_Outer;
                        }
                        checkTask = iterator2.next();
                        if (!b) {
                            checkTask.host.setConnected(false);
                            continue Label_0074_Outer;
                        }
                        checkTask.start();
                        continue Label_0074_Outer;
                    }
                    checkTask2 = iterator3.next();
                    if (checkTask2.isAlive()) {
                        checkTask2.join();
                        continue;
                    }
                    continue;
                }
            }
        }
        
        private class CheckTask extends Thread
        {
            private final Context context;
            private final Host host;
            
            CheckTask(final Context context, final Host host) {
                super("CheckTask");
                this.host = host;
                this.context = context;
            }
            
            private boolean resolveName() throws InterruptedException, IOException {
                this.host.lastResolve = System.currentTimeMillis();
                final String ip = this.host.getIp();
                final byte[] mac = this.host.getMac();
                this.host.resolveName(this.context);
                if (!ip.equals(this.host.getIp()) || (mac == null && this.host.getMac() != null)) {
                    HostList.this.save(this.context);
                }
                final boolean isUp = this.host.isUp;
                this.host.setConnected(isUp);
                return isUp;
            }
            
            public void run() {
                while (true) {
                    while (true) {
                        Label_0120: {
                            try {
                                final boolean up = this.host.isUp();
                                if (up ^ this.host.getConnected()) {
                                    this.host.setConnected(up);
                                    ConnectionDetector.this.listener.onChanged();
                                }
                                if (!up) {
                                    if (this.host.lastResolve < ConnectionDetector.this.lastReconnect) {
                                        break Label_0120;
                                    }
                                    if (System.currentTimeMillis() - this.host.lastResolve > 300000L) {
                                        break Label_0120;
                                    }
                                }
                                final int n = 0;
                                if (n != 0 && this.resolveName()) {
                                    ConnectionDetector.this.listener.onChanged();
                                }
                                return;
                            }
                            catch (Exception ex) {
                                ex.printStackTrace();
                                return;
                            }
                        }
                        final int n = 1;
                        continue;
                    }
                }
            }
        }
    }
}
