package com.bv.wifisync;

import android.os.*;
import java.util.*;
import android.graphics.drawable.*;
import java.io.*;
import android.content.*;
import android.app.*;
import android.text.method.*;
import android.text.*;
import android.view.*;
import android.widget.*;
import com.bv.sync.*;

public class AddHost extends BrowseActivity
{
    private PropertiesAdapter<PropertyRow> adapter;
    private Host host;
    private boolean newHost;
    private PropertyRow[] rows;
    private ValidateTask validateTask;
    
    static /* synthetic */ void access$6(final AddHost addHost, final ValidateTask validateTask) {
        addHost.validateTask = validateTask;
    }
    
    private void enableButtons() {
        this.buttonOk.setEnabled(this.host.name != null && this.host.domain != null && this.host.user != null);
        this.adapter.notifyDataSetChanged();
        this.setHelp();
    }
    
    private int find(final String s, final String[] array) {
        for (int i = 0; i < array.length; ++i) {
            if (s.equalsIgnoreCase(array[i])) {
                return i;
            }
        }
        return -1;
    }
    
    private void setDefaultDomain(final CifsUtils.HostInfo hostInfo) {
        if (hostInfo.domains.length == 1) {
            this.host.domain = hostInfo.domains[0];
        }
        else if (hostInfo.domains.length > 1 && (this.host.domain == null || this.find(this.host.domain, hostInfo.domains) == -1) && this.find(hostInfo.name, hostInfo.domains) != -1) {
            this.host.domain = hostInfo.name;
        }
    }
    
    private void setHelp() {
        final ValidateTask validateTask = this.validateTask;
        int help = 0;
        if (validateTask != null) {
            help = Errors.getHelp(this.validateTask.error);
        }
        if (help == 0) {
            if (this.newHost) {
                help = 2131099858;
            }
            else {
                help = 2131099859;
            }
        }
        this.setHelp(help);
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n2 == -1) {
            final PropertyRow propertyRow = this.rows[n];
            if (propertyRow instanceof HostRow) {
                final CifsUtils.HostInfo defaultDomain = (CifsUtils.HostInfo)intent.getSerializableExtra("RESULT");
                if (!defaultDomain.name.equals(this.host.name)) {
                    this.host.domain = null;
                }
                this.host.name = defaultDomain.name;
                if (defaultDomain.domains != null) {
                    this.setDefaultDomain(defaultDomain);
                }
                this.host.setIp(defaultDomain.ip);
                this.host.setMac(defaultDomain.mac);
            }
            else if (propertyRow instanceof DomainRow) {
                final DomainRow domainRow = (DomainRow)propertyRow;
                final int intExtra = intent.getIntExtra("RESULT", -1);
                if (domainRow.domains != null && domainRow.domains.length > intExtra && intExtra != -1) {
                    this.host.domain = domainRow.domains[intExtra];
                }
                else {
                    this.host.domain = null;
                    Dialogs.showMessage((Context)this, this.getString(2131099815));
                }
            }
            this.enableButtons();
        }
    }
    
    public void onButtonClick(final View view) throws IOException {
        Utils.checkWifi((Context)this);
        Dialogs.showMessage((Context)this, this.getString(2131099960));
        if (this.validateTask == null) {
            ((Utils.ProgressTask<Void, Progress, Result>)(this.validateTask = new ValidateTask())).run(null);
        }
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.host = (Host)this.getData();
        this.newHost = (this.host.name == null);
        if (this.newHost) {
            this.host.user = "Guest";
        }
        String title;
        if (this.newHost) {
            title = this.getString(2131099896);
        }
        else {
            title = this.host.name;
        }
        this.setTitle((CharSequence)title);
        if (this.newHost) {
            this.rows = new PropertyRow[] { new HostRow(), new DomainRow(), new UserRow(), new PasswordRow() };
        }
        else {
            this.rows = new PropertyRow[] { new HostRow(), new DomainRow(), new UserRow(), new PasswordRow(), new MacRow() };
        }
        this.setListAdapter((ListAdapter)(this.adapter = new PropertiesAdapter<PropertyRow>((Context)this, Arrays.asList(this.rows))));
        this.enableButtons();
    }
    
    private class DomainRow extends PropertyRow implements View$OnClickListener
    {
        private String[] domains;
        final /* synthetic */ AddHost this$0;
        
        DomainRow() {
            super((Context)AddHost.this, AddHost.this.getString(2131099892));
        }
        
        static /* synthetic */ void access$0(final DomainRow domainRow, final String[] domains) {
            domainRow.domains = domains;
        }
        
        protected boolean getEnabled() {
            return AddHost.this.host.getIp() != null;
        }
        
        Drawable getImage() {
            return AddHost.this.getResources().getDrawable(2130837514);
        }
        
        protected String getValue() {
            String s;
            if (AddHost.this.host.getIp() == null) {
                s = AddHost.this.getString(2131099925);
            }
            else {
                s = AddHost.this.host.domain;
            }
            return s;
        }
        
        public void onClick(final View view) {
            Label_0047: {
                try {
                    Utils.checkWifi((Context)AddHost.this);
                    if (AddHost.this.host.getIp() == null) {
                        throw new IOException(AddHost.this.getString(2131099962));
                    }
                    break Label_0047;
                }
                catch (Exception ex) {
                    Dialogs.showError((Context)AddHost.this, ex);
                }
                return;
            }
            Dialogs.showMessage((Context)AddHost.this, AddHost.this.getString(2131099961));
            ((Utils.ProgressTask<Void, Progress, Result>)new FetchDomain()).run(null);
        }
        
        private class FetchDomain extends Utils.ProgressTask<Void, Void, CifsUtils.HostInfo>
        {
            FetchDomain() {
                super((Activity)DomainRow.this.this$0, "FetchDomain");
            }
            
            protected CifsUtils.HostInfo atBackground(final Void... array) throws Exception {
                final CifsUtils.HostInfo netbiosInfo = CifsUtils.getNetbiosInfo(AddHost.this.host.getIp());
                if (netbiosInfo == null) {
                    throw new IOException(AddHost.this.getString(2131099814, new Object[] { AddHost.this.host.name }));
                }
                DomainRow.access$0(DomainRow.this, netbiosInfo.domains);
                return netbiosInfo;
            }
            
            protected void onPostExecute(final CifsUtils.HostInfo hostInfo) {
                super.onPostExecute(hostInfo);
                if (this.error == null && !this.isCancelled()) {
                    final Intent intent = new Intent((Context)AddHost.this, (Class)EnumBrowser.class);
                    final int[] array = new int[hostInfo.domains.length];
                    for (int i = 0; i < array.length; ++i) {
                        array[i] = 2130837514;
                    }
                    int n;
                    if (DomainRow.this.domains.length == 0) {
                        n = 2131099871;
                    }
                    else {
                        n = 2131099870;
                    }
                    intent.putExtra("RESULT", (Serializable)new EnumBrowser.SimpleEnumeration(2131099892, n, DomainRow.this.domains, array));
                    AddHost.this.startActivityForResult(intent, AddHost.this.adapter.getPosition((Object)DomainRow.this));
                }
            }
        }
    }
    
    private class HostRow extends PropertyRow implements View$OnClickListener
    {
        HostRow() {
            super((Context)AddHost.this, AddHost.this.getString(2131099895));
        }
        
        Drawable getImage() {
            return AddHost.this.getResources().getDrawable(2130837508);
        }
        
        protected String getValue() {
            return AddHost.this.host.name;
        }
        
        public void onClick(final View view) {
            try {
                Utils.checkWifi((Context)AddHost.this);
                AddHost.this.startActivityForResult(new Intent((Context)AddHost.this, (Class)HostBrowser.class), AddHost.this.adapter.getPosition((Object)this));
            }
            catch (Exception ex) {
                Dialogs.showError((Context)AddHost.this, ex);
            }
        }
    }
    
    private class MacRow extends PropertyRow implements View$OnClickListener
    {
        MacRow() {
            super((Context)AddHost.this, AddHost.this.getString(2131099939));
        }
        
        private String append(String string, final String s, final String s2) {
            if (string.length() != 0) {
                string = String.valueOf(string) + s2;
            }
            return String.valueOf(string) + s;
        }
        
        private void showMacAddress() {
            final EditText editText = new EditText((Context)new ContextThemeWrapper((Context)AddHost.this, 2131230722));
            editText.setInputType(524288);
            editText.setText((CharSequence)this.toHex(AddHost.this.host.getMac()));
            editText.setHint((CharSequence)"##:##:##:##:##:##");
            editText.setFilters(new InputFilter[] { new MacFilter((MacFilter)null) });
            final AlertDialog showInputDialog = Dialogs.showInputDialog((Context)AddHost.this, AddHost.this.getString(2131099940), AddHost.this.getString(2131099941), editText, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
                public boolean onClick(final DialogInterface dialogInterface) throws IOException {
                    AddHost.this.host.setMac(MacRow.this.toBytes(Utils.trimText((TextView)editText)));
                    AddHost.this.enableButtons();
                    return true;
                }
            });
            showInputDialog.setIcon(2130837518);
            showInputDialog.show();
        }
        
        private byte[] toBytes(final String s) throws IOException {
            if (!s.matches("^[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}")) {
                throw new IOException(String.valueOf(s) + " does not look like a valid mac address");
            }
            return Host.parseMacAddress(s);
        }
        
        private String toHex(final byte[] array) {
            String append = "";
            if (array != null) {
                for (int i = 0; i < array.length; ++i) {
                    append = this.append(append, Integer.toString(256 + (0xFF & array[i]), 16).substring(1), ":");
                }
            }
            return append;
        }
        
        Drawable getImage() {
            return AddHost.this.getResources().getDrawable(2130837518);
        }
        
        protected String getValue() {
            String s = this.toHex(AddHost.this.host.getMac());
            if (s.length() == 0) {
                s = AddHost.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            this.showMacAddress();
        }
        
        private class MacFilter implements InputFilter
        {
            private boolean isValidDigit(final String s) {
                try {
                    final int intValue = Integer.valueOf(s, 16);
                    boolean b = false;
                    if (intValue <= 255) {
                        b = true;
                    }
                    return b;
                }
                catch (NumberFormatException ex) {
                    return false;
                }
            }
            
            private boolean isValidMac(final String s) {
                final int length = s.length();
                final int length2 = "00:00:00:00:00:00".length();
                boolean b = false;
                if (length <= length2) {
                    final String[] split = s.split(":");
                    for (int length3 = split.length, i = 0; i < length3; ++i) {
                        final boolean validDigit = this.isValidDigit(split[i]);
                        b = false;
                        if (!validDigit) {
                            return b;
                        }
                    }
                    b = true;
                }
                return b;
            }
            
            public CharSequence filter(final CharSequence charSequence, final int n, final int n2, final Spanned spanned, final int n3, final int n4) {
                if (n2 <= n) {
                    return null;
                }
                final String string = spanned.toString();
                if (this.isValidMac(String.valueOf(string.substring(0, n3)) + (Object)charSequence.subSequence(n, n2) + string.substring(n4))) {
                    return null;
                }
                return "";
                s = null;
                return s;
            }
        }
    }
    
    private class PasswordRow extends PropertyRow implements View$OnClickListener
    {
        private boolean errorShown;
        
        PasswordRow() {
            super((Context)AddHost.this, AddHost.this.getString(2131099894));
        }
        
        private void onCheck(final EditText selection, final boolean b) {
            int inputType;
            if (b) {
                inputType = 524288;
            }
            else {
                inputType = 129;
            }
            selection.setInputType(inputType);
            Object instance;
            if (b) {
                instance = null;
            }
            else {
                instance = PasswordTransformationMethod.getInstance();
            }
            selection.setTransformationMethod((TransformationMethod)instance);
            this.setSelection(selection);
        }
        
        private void setSelection(final EditText editText) {
            final Editable text = editText.getText();
            if (text != null) {
                editText.setSelection(text.length());
            }
        }
        
        Drawable getImage() {
            return AddHost.this.getResources().getDrawable(2130837534);
        }
        
        protected String getValue() {
            String string;
            try {
                if (AddHost.this.host.getPassword((Context)AddHost.this) == null) {
                    string = AddHost.this.getString(2131099925);
                }
                else {
                    string = "*******";
                }
            }
            catch (Exception ex) {
                if (!this.errorShown) {
                    Dialogs.showError((Context)AddHost.this, ex);
                    this.errorShown = true;
                }
                string = null;
            }
            return string;
        }
        
        public void onClick(final View view) {
            final View inflate = ((LayoutInflater)new ContextThemeWrapper((Context)AddHost.this, 2131230722).getSystemService("layout_inflater")).inflate(2130903045, (ViewGroup)null);
            final EditText selection = (EditText)inflate.findViewById(2131361805);
            final CheckBox checkBox = (CheckBox)inflate.findViewById(2131361806);
            checkBox.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)new CompoundButton$OnCheckedChangeListener() {
                public void onCheckedChanged(final CompoundButton compoundButton, final boolean b) {
                    PasswordRow.this.onCheck(selection, b);
                }
            });
            while (true) {
                try {
                    selection.setHint(2131099894);
                    checkBox.setEnabled(AddHost.this.newHost);
                    selection.setText((CharSequence)AddHost.this.host.getPassword((Context)AddHost.this));
                    this.setSelection(selection);
                    Dialogs.showPasswordDialog((Context)AddHost.this, selection, inflate, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
                        public boolean onClick(final DialogInterface dialogInterface) throws Exception {
                            final Editable text = selection.getText();
                            String string;
                            if (text != null) {
                                string = ((CharSequence)text).toString();
                            }
                            else {
                                string = null;
                            }
                            AddHost.this.host.setPassword(string);
                            AddHost.this.enableButtons();
                            return true;
                        }
                    }).setIcon(2130837534);
                    this.onCheck(selection, false);
                }
                catch (Exception ex) {
                    Dialogs.showError((Context)AddHost.this, ex);
                    continue;
                }
                break;
            }
        }
    }
    
    private class UserRow extends PropertyRow implements View$OnClickListener
    {
        UserRow() {
            super((Context)AddHost.this, AddHost.this.getString(2131099893));
        }
        
        Drawable getImage() {
            return AddHost.this.getResources().getDrawable(2130837553);
        }
        
        protected String getValue() {
            return AddHost.this.host.user;
        }
        
        public void onClick(final View view) {
            final EditText editText = new EditText((Context)new ContextThemeWrapper((Context)AddHost.this, 2131230722));
            editText.setInputType(524288);
            editText.setText((CharSequence)AddHost.this.host.user);
            editText.setHint(2131099893);
            Dialogs.showInputDialog((Context)AddHost.this, AddHost.this.getString(2131099937), AddHost.this.getString(2131099877), editText, (Dialogs.OnOkClickListener)new Dialogs.OnOkClickListener() {
                public boolean onClick(final DialogInterface dialogInterface) {
                    AddHost.this.host.user = Utils.trimText((TextView)editText);
                    AddHost.this.enableButtons();
                    return true;
                }
            }).setIcon(2130837553);
        }
    }
    
    private class ValidateTask extends Utils.ProgressTask<Void, Void, Void>
    {
        ValidateTask() {
            super((Activity)AddHost.this, "HostValidator");
        }
        
        protected Void atBackground(final Void... array) throws Exception {
            final StringBuilder sb = new StringBuilder("smb://");
            String s;
            if (AddHost.this.newHost) {
                s = AddHost.this.host.getIp();
            }
            else {
                s = AddHost.this.host.resolveName((Context)AddHost.this);
            }
            new RemoteFile(AddHost.this.host.domain, AddHost.this.host.user, AddHost.this.host.getPassword((Context)AddHost.this), sb.append(s).append("/").toString()).listFiles();
            return null;
        }
        
        protected void onPostExecute(final Void void1) {
            super.onPostExecute(void1);
            if (this.error != null) {
                AddHost.this.setHelp();
            }
            AddHost.access$6(AddHost.this, null);
            if (this.error == null) {
                if (!Utils.isDebugBuild((Context)AddHost.this)) {
                    AddHost.this.adapter.dispatchGoogleAnalytics((Activity)AddHost.this);
                }
                final Intent intent = new Intent();
                intent.putExtra("RESULT", (Serializable)AddHost.this.host);
                AddHost.this.setResult(-1, intent);
                AddHost.this.finish();
            }
        }
    }
}
