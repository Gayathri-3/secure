package com.bv.wifisync;

import com.bv.sync.*;
import java.io.*;
import android.os.*;
import android.content.*;
import android.widget.*;
import android.app.*;
import java.util.concurrent.atomic.*;
import java.net.*;
import android.graphics.drawable.*;
import java.util.*;
import android.view.*;

public class HostBrowser extends BrowseActivity
{
    private HostsAdapter adapter;
    private HostFetcher hostFetcher;
    
    private String buildIpStartString(final int n, final int n2) {
        final int n3 = n & -1 << 32 - n2;
        final byte[] array = { (byte)(n3 >> 24), (byte)(n3 << 8 >> 24), (byte)(n3 << 16 >> 24), (byte)(n3 << 24 >> 24) };
        String string = "";
        for (int n4 = 0; n4 < array.length && n4 < n2 / 8; ++n4) {
            string = String.valueOf(string) + (0xFF & array[n4]) + ".";
        }
        return string;
    }
    
    private void cancelScan() {
        if (this.hostFetcher != null) {
            this.hostFetcher.cancel();
        }
    }
    
    private void finish(final CifsUtils.HostInfo hostInfo) {
        this.cancelScan();
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)hostInfo);
        this.setResult(-1, intent);
        this.finish();
    }
    
    private String[] getStartIps() {
        String[] array;
        try {
            final List<Utils.NetInfo> netInfo = Utils.getNetInfo((Context)this);
            array = new String[netInfo.size()];
            final Iterator<Utils.NetInfo> iterator = netInfo.iterator();
            int n = 0;
            while (iterator.hasNext()) {
                final Utils.NetInfo netInfo2 = iterator.next();
                final int n2 = n + 1;
                array[n] = this.buildIpStartString(netInfo2.ip, netInfo2.mask);
                n = n2;
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
            array = new String[0];
        }
        return array;
    }
    
    public void onBackPressed() {
        this.cancelScan();
        super.onBackPressed();
    }
    
    public void onButtonClick(final View view) throws IOException {
        this.cancelScan();
        this.hostFetcher = new HostFetcher();
        this.adapter.clear();
        ((Utils.ProgressTask<Void, Progress, Result>)this.hostFetcher).run(null);
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setTitle(2131099943);
        this.setHelp(2131099863);
        this.setListAdapter((ListAdapter)(this.adapter = new HostsAdapter()));
        this.buttonOk.setText(2131100009);
        this.buttonOk.setOnClickListener((View$OnClickListener)this);
        try {
            ((Utils.ProgressTask<Void, Progress, Result>)(this.hostFetcher = new HostFetcher())).run(null);
        }
        catch (IOException ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131296261, menu);
        return true;
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        if (menuItem.getItemId() == 2131361832) {
            final String[] startIps = this.getStartIps();
            final AutoCompleteTextView hostBrowser$1 = new AutoCompleteTextView(new ContextThemeWrapper((Context)this, 2131230722)) {
                public boolean enoughToFilter() {
                    return true;
                }
            };
            if (startIps.length > 1) {
                hostBrowser$1.setAdapter((ListAdapter)new ArrayAdapter((Context)this, 17367043, (Object[])startIps));
            }
            if (startIps.length > 0) {
                hostBrowser$1.setText((CharSequence)startIps[0]);
            }
            hostBrowser$1.setInputType(0x80000 | hostBrowser$1.getInputType());
            Dialogs.showInputDialog((Context)this, this.getString(2131100011), this.getString(2131100012), (EditText)hostBrowser$1, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
                public boolean onClick(final DialogInterface dialogInterface) throws IOException {
                    Utils.checkWifi((Context)HostBrowser.this);
                    ((Utils.ProgressTask<String, Progress, Result>)new IpFinder()).run(Utils.trimText((TextView)hostBrowser$1));
                    Dialogs.showMessage((Context)HostBrowser.this, HostBrowser.this.getString(2131099960));
                    return true;
                }
            }).setIcon(2130837508);
            hostBrowser$1.dismissDropDown();
        }
        return super.onOptionsItemSelected(menuItem);
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        this.cancelScan();
        super.onProgressCancelClick(view);
    }
    
    private class HostFetcher extends Utils.ProgressTask<Void, ProgressInfo, Void>
    {
        private List<Utils.NetInfo> networks;
        private ThreadedQueue<InetAddress> scanner;
        
        HostFetcher() throws IOException {
            super((Activity)HostBrowser.this, "HostFetcher");
            Utils.checkWifi((Context)HostBrowser.this);
            this.networks = Utils.getNetInfo((Context)HostBrowser.this);
        }
        
        static /* synthetic */ void access$4(final HostFetcher hostFetcher, final Object[] array) {
            hostFetcher.publishProgress(array);
        }
        
        private CifsUtils.HostInfo getHostInfo(final InetAddress inetAddress) throws Utils.ArpTableFullException {
            int i = 0;
            while (i < 120) {
                Serializable netbiosInfo = null;
                try {
                    if (!Utils.smbReachable(inetAddress)) {
                        break;
                    }
                    final String hostAddress = inetAddress.getHostAddress();
                    netbiosInfo = CifsUtils.getNetbiosInfo(hostAddress);
                    if (netbiosInfo == null) {
                        netbiosInfo = new CifsUtils.HostInfo(hostAddress, hostAddress, null, new String[] { hostAddress });
                    }
                }
                catch (Utils.ArpTableFullException ex) {
                    try {
                        Thread.sleep(2000L);
                        ++i;
                    }
                    catch (InterruptedException ex2) {}
                }
                return (CifsUtils.HostInfo)netbiosInfo;
            }
            Serializable netbiosInfo = null;
            return (CifsUtils.HostInfo)netbiosInfo;
        }
        
        private void restoreUIState() {
            if (HostBrowser.this.hostFetcher == this) {
                HostBrowser.this.setProgressVisible(false);
                HostBrowser.this.setTitle(2131099943);
            }
        }
        
        private Void scan(final int n, final int n2) throws UnknownHostException, InterruptedException, IOException {
            final int n3 = -1 << 32 - n2;
            final int n4 = n & n3;
            final int n5 = n4 + (n3 ^ -1);
            final AtomicInteger atomicInteger = new AtomicInteger();
            final Connector[] array = new Connector[16];
            for (int i = 0; i < array.length; ++i) {
                array[i] = new Connector(atomicInteger, n5, n4);
            }
            this.scanner = new ThreadedQueue<InetAddress>((ThreadedQueue.Runner<InetAddress>[])array);
            for (int n6 = n4; n6 < n5 && !this.isCancelled(); ++n6) {
                final InetAddress address = Utils.makeAddress(n6);
                Utils.setHostName(address);
                this.scanner.add(address);
                Utils.checkWifi((Context)HostBrowser.this);
            }
            if (this.isCancelled()) {
                this.scanner.cancel();
            }
            else {
                this.scanner.waitFor();
            }
            return null;
        }
        
        protected Void atBackground(final Void... array) throws InterruptedException, IOException {
            for (final Utils.NetInfo netInfo : this.networks) {
                HostBrowser.this.runOnUiThread((Runnable)new Runnable() {
                    public void run() {
                        HostBrowser.this.setTitle((CharSequence)(String.valueOf(HostBrowser.this.getString(2131099943)) + " " + netInfo.name));
                    }
                });
                this.scan(netInfo.ip, netInfo.mask);
            }
            return null;
        }
        
        void cancel() {
            this.cancel(true);
            if (this.scanner != null) {
                this.scanner.cancel();
            }
        }
        
        protected void onCancelled() {
            super.onCancelled();
            this.restoreUIState();
        }
        
        protected void onPostExecute(final Void void1) {
            super.onPostExecute(void1);
            this.restoreUIState();
            if (this.error != null && !this.isCancelled()) {
                Dialogs.showError((Context)HostBrowser.this, this.error);
            }
            else if (HostBrowser.this.adapter.isEmpty()) {
                Dialogs.showMessage((Context)HostBrowser.this, HostBrowser.this.getString(2131099959));
            }
        }
        
        protected void onPreExecute() {
            HostBrowser.this.setProgressVisible(true);
        }
        
        protected void onProgressUpdate(final ProgressInfo... array) {
            final ProgressInfo progressInfo = array[0];
            HostBrowser.this.setProgress(progressInfo.percent, progressInfo.hostInfo.ip);
            if (progressInfo.hostInfo.name != null) {
                HostBrowser.this.adapter.add((Object)new HostInfoRow(progressInfo.hostInfo));
                HostBrowser.this.adapter.notifyDataSetChanged();
            }
        }
        
        class Connector implements ThreadedQueue.Runner<InetAddress>
        {
            private final /* synthetic */ AtomicInteger val$counter;
            private final /* synthetic */ int val$highest;
            private final /* synthetic */ int val$lowest;
            
            Connector(final AtomicInteger val$counter, final int val$highest, final int val$lowest) {
                this.val$counter = val$counter;
                this.val$highest = val$highest;
                this.val$lowest = val$lowest;
                super();
            }
            
            private boolean clearArpTable() throws InterruptedException {
                return false;
            }
            
            public void run(final InetAddress inetAddress) {
                int n = 0;
                CifsUtils.HostInfo access$3;
                while (true) {
                    access$3 = null;
                    if (n >= 120) {
                        break;
                    }
                    try {
                        access$3 = HostFetcher.this.getHostInfo(inetAddress);
                        break;
                    }
                    catch (Utils.ArpTableFullException ex) {
                        try {
                            if (!this.clearArpTable()) {
                                Thread.sleep(2000L);
                            }
                            ++n;
                        }
                        catch (InterruptedException ex2) {
                            access$3 = null;
                        }
                    }
                }
                final int n2 = (int)(100.0f * (this.val$counter.incrementAndGet() / (this.val$highest - this.val$lowest)));
                if (access$3 == null) {
                    access$3 = new CifsUtils.HostInfo(inetAddress.getHostAddress(), null, null, null);
                }
                HostFetcher.access$4(HostFetcher.this, new ProgressInfo[] { new ProgressInfo(n2, access$3) });
            }
        }
    }
    
    private class HostInfoRow extends PropertyRow implements View$OnClickListener
    {
        final CifsUtils.HostInfo hostInfo;
        
        HostInfoRow(final CifsUtils.HostInfo hostInfo) {
            super((Context)HostBrowser.this, hostInfo.name);
            this.hostInfo = hostInfo;
        }
        
        Drawable getImage() {
            return HostBrowser.this.getResources().getDrawable(2130837508);
        }
        
        protected String getMissingValueText() {
            return HostBrowser.this.getString(2131100083);
        }
        
        protected String getValue() {
            String ip;
            if (this.hostInfo.ip.equals(this.hostInfo.name)) {
                ip = null;
            }
            else {
                ip = this.hostInfo.ip;
            }
            return ip;
        }
        
        public void onClick(final View view) {
            HostBrowser.this.finish(this.hostInfo);
        }
    }
    
    private class HostsAdapter extends PropertiesAdapter<HostInfoRow>
    {
        public HostsAdapter() {
            super((Context)HostBrowser.this, new ArrayList());
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            final View view2 = super.getView(n, view, viewGroup);
            view2.findViewById(2131361799).setVisibility(8);
            return view2;
        }
    }
    
    private class IpFinder extends Utils.ProgressTask<String, Void, CifsUtils.HostInfo>
    {
        IpFinder() {
            super((Activity)HostBrowser.this, "IpFinder");
        }
        
        protected CifsUtils.HostInfo atBackground(final String... array) throws Exception {
            final InetAddress byName = InetAddress.getByName(array[0]);
            final String hostAddress = byName.getHostAddress();
            CifsUtils.HostInfo netbiosInfo = CifsUtils.getNetbiosInfo(hostAddress);
            if (netbiosInfo == null) {
                if (!Utils.smbReachable(byName)) {
                    throw new IOException(HostBrowser.this.getString(2131099814));
                }
                netbiosInfo = new CifsUtils.HostInfo(hostAddress, hostAddress, null, new String[] { hostAddress });
            }
            return netbiosInfo;
        }
        
        protected void onPostExecute(final CifsUtils.HostInfo hostInfo) {
            super.onPostExecute(hostInfo);
            if (this.error == null && !this.isCancelled()) {
                HostBrowser.this.finish(hostInfo);
            }
        }
    }
    
    private static class ProgressInfo
    {
        final CifsUtils.HostInfo hostInfo;
        final int percent;
        
        ProgressInfo(final int percent, final CifsUtils.HostInfo hostInfo) {
            super();
            this.percent = percent;
            this.hostInfo = hostInfo;
        }
    }
}
