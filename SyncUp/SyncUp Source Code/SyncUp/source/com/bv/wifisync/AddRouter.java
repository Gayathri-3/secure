package com.bv.wifisync;

import android.app.*;
import java.io.*;
import android.os.*;
import android.content.*;
import android.net.wifi.*;
import java.util.*;
import android.view.*;
import android.text.*;
import android.graphics.*;
import android.widget.*;

public class AddRouter extends BrowseActivity
{
    private RoutersAdapter adapter;
    private DonateBiller biller;
    private SyncSchedule schedule;
    
    public AddRouter() {
        super();
        this.biller = new DonateBiller((Activity)this, Biller.ChargeType.AddRouter) {
            void onPurchase() {
                AddRouter.this.closeActivity();
            }
        };
    }
    
    private void closeActivity() {
        LinkedHashSet<String> routers = new LinkedHashSet<String>();
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            final RouterInfo routerInfo = (RouterInfo)this.adapter.getItem(i);
            if (routerInfo.checked) {
                routers.add(routerInfo.name);
            }
        }
        final SyncSchedule schedule = this.schedule;
        if (routers.size() == 0) {
            routers = null;
        }
        schedule.routers = routers;
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.schedule);
        this.setResult(-1, intent);
        this.finish();
    }
    
    private int getCheckCount() {
        int n = 0;
        for (int i = 0; i < this.adapter.getCount(); ++i) {
            if (((RouterInfo)this.adapter.getItem(i)).checked) {
                ++n;
            }
        }
        return n;
    }
    
    protected void onButtonClick(final View view) throws IOException {
        if (!this.biller.isPurchased() && this.getCheckCount() != 0) {
            this.biller.purchase();
        }
        else {
            this.closeActivity();
        }
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.schedule = (SyncSchedule)this.getData();
        this.setTitle((CharSequence)this.getString(2131099904));
        this.buttonOk.setText(17039370);
        this.setHelp(2131099876);
        this.setListAdapter((ListAdapter)(this.adapter = new RoutersAdapter()));
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.biller.close();
    }
    
    private class RouterInfo implements View$OnClickListener, OnCheckedChangeListenerEx
    {
        boolean active;
        boolean checked;
        final String name;
        
        RouterInfo(final String name, final boolean checked) {
            super();
            this.name = name;
            this.checked = checked;
        }
        
        public boolean getBooleanValue() {
            return this.checked;
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean checked) {
            this.checked = checked;
            AddRouter.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            this.checked = !this.checked;
            AddRouter.this.adapter.notifyDataSetChanged();
        }
    }
    
    private class RoutersAdapter extends ArrayAdapter<RouterInfo>
    {
        public RoutersAdapter() {
            super((Context)AddRouter.this, 2131361802);
            final WifiManager wifiManager = (WifiManager)AddRouter.this.getSystemService("wifi");
            List<WifiConfiguration> configuredNetworks = (List<WifiConfiguration>)wifiManager.getConfiguredNetworks();
            if (configuredNetworks == null) {
                configuredNetworks = new LinkedList<WifiConfiguration>();
            }
            final WifiInfo connectionInfo = wifiManager.getConnectionInfo();
            this.sort(configuredNetworks, connectionInfo);
            this.addRouters(configuredNetworks, connectionInfo);
        }
        
        private void addRouterItem(final String s, final boolean active) {
            final String stripQuotes = Utils.stripQuotes(s);
            final RouterInfo routerInfo = new RouterInfo(stripQuotes, AddRouter.this.schedule.routers != null && AddRouter.this.schedule.routers.contains(stripQuotes));
            if (active) {
                routerInfo.active = active;
            }
            this.add((Object)routerInfo);
        }
        
        private void addRouters(final List<WifiConfiguration> list, final WifiInfo wifiInfo) {
            if (Utils.isEmulator()) {
                for (int i = 0; i < 20; ++i) {
                    this.addRouterItem("router" + i, i == 0);
                }
            }
            for (final WifiConfiguration wifiConfiguration : list) {
                if (wifiConfiguration != null && wifiConfiguration.SSID != null && wifiConfiguration.SSID.length() != 0) {
                    this.addRouterItem(wifiConfiguration.SSID, this.isCurrent(wifiConfiguration, wifiInfo));
                }
            }
        }
        
        private boolean isCurrent(final WifiConfiguration wifiConfiguration, final WifiInfo wifiInfo) {
            return wifiConfiguration.status == 0 || (wifiInfo != null && wifiInfo.getNetworkId() == wifiConfiguration.networkId);
        }
        
        private void sort(final List<WifiConfiguration> list, final WifiInfo wifiInfo) {
            final Iterator<WifiConfiguration> iterator = list.iterator();
            while (iterator.hasNext()) {
                if (iterator.next().status == 1) {
                    iterator.remove();
                }
            }
            Collections.sort((List<Object>)list, (Comparator<? super Object>)new Comparator<WifiConfiguration>() {
                private boolean isSelected(final WifiConfiguration wifiConfiguration) {
                    return AddRouter.this.schedule.routers != null && AddRouter.this.schedule.routers.contains(Utils.stripQuotes(wifiConfiguration.SSID));
                }
                
                public int compare(final WifiConfiguration wifiConfiguration, final WifiConfiguration wifiConfiguration2) {
                    int n;
                    if (RoutersAdapter.this.isCurrent(wifiConfiguration2, wifiInfo)) {
                        n = Integer.MAX_VALUE;
                    }
                    else if (RoutersAdapter.this.isCurrent(wifiConfiguration, wifiInfo)) {
                        n = -2147483647;
                    }
                    else if (this.isSelected(wifiConfiguration) && this.isSelected(wifiConfiguration2)) {
                        n = 0;
                    }
                    else if (this.isSelected(wifiConfiguration2)) {
                        n = 2147483646;
                    }
                    else if (this.isSelected(wifiConfiguration)) {
                        n = -2147483646;
                    }
                    else {
                        n = wifiConfiguration2.priority - wifiConfiguration.priority;
                    }
                    return n;
                }
            });
        }
        
        public View getView(final int n, final View view, final ViewGroup viewGroup) {
            View inflate = view;
            if (inflate == null) {
                inflate = ((LayoutInflater)AddRouter.this.getSystemService("layout_inflater")).inflate(2130903043, (ViewGroup)null);
            }
            final TextView textView = (TextView)inflate.findViewById(2131361802);
            final RouterInfo onCheckedChangeListener = (RouterInfo)this.getItem(n);
            textView.setText((CharSequence)Html.fromHtml("<big>" + onCheckedChangeListener.name + "</big>"));
            Typeface typeface;
            if (onCheckedChangeListener.checked) {
                typeface = Typeface.DEFAULT_BOLD;
            }
            else {
                typeface = Typeface.DEFAULT;
            }
            textView.setTypeface(typeface);
            final ImageView imageView = (ImageView)inflate.findViewById(2131361796);
            int imageResource;
            if (onCheckedChangeListener.active) {
                imageResource = 2130837540;
            }
            else {
                imageResource = 2130837539;
            }
            imageView.setImageResource(imageResource);
            final CheckBox checkBox = (CheckBox)inflate.findViewById(2131361798);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)null);
            checkBox.setChecked(onCheckedChangeListener.checked);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)onCheckedChangeListener);
            checkBox.setVisibility(0);
            return inflate;
        }
    }
}
