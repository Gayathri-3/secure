package com.bv.wifisync;

import java.io.*;
import android.os.*;
import android.annotation.*;
import android.text.format.*;
import java.util.*;
import android.graphics.drawable.*;
import java.text.*;
import android.view.*;
import android.content.*;
import android.app.*;
import android.widget.*;
import android.text.method.*;
import android.text.*;

public class AddSchedule extends BrowseActivity
{
    private PropertiesAdapter<ScheduleRow> adapter;
    private SyncSchedule schedule;
    private boolean[] selections;
    private DonateBiller wakeupBiller;
    private TimeDialog wakeupDialog;
    private DonateBiller weeklyBiller;
    private AlertDialog weeklyDialog;
    
    public AddSchedule() {
        super();
        this.weeklyBiller = new DonateBiller((Activity)this, Biller.ChargeType.AddWeeklySchedule) {
            void onPurchase() {
                AddSchedule.this.closeWeeklyDialog();
            }
        };
        this.wakeupBiller = new DonateBiller((Activity)this, Biller.ChargeType.AddWakeupSchedule) {
            void onPurchase() {
                AddSchedule.this.closeWakeupDialog();
            }
        };
    }
    
    static /* synthetic */ void access$11(final AddSchedule addSchedule, final AlertDialog weeklyDialog) {
        addSchedule.weeklyDialog = weeklyDialog;
    }
    
    static /* synthetic */ void access$14(final AddSchedule addSchedule, final TimeDialog wakeupDialog) {
        addSchedule.wakeupDialog = wakeupDialog;
    }
    
    static /* synthetic */ void access$9(final AddSchedule addSchedule, final boolean[] selections) {
        addSchedule.selections = selections;
    }
    
    private void addRows() {
        final ScheduleRow[] array = { new ScheduleAtRow(), new ScheduleIntervalRow(), new ScheduleWeekdayRow(), new ScheduleRoutersRow(), new ScheduleChargingRow(), new ScheduleWakeupRow() };
        List<ScheduleRow> list;
        if (this.schedule.getEnabled()) {
            list = Arrays.asList(array);
        }
        else {
            list = (List<ScheduleRow>)new ArrayList<PropertyRow>();
        }
        this.setListAdapter((ListAdapter)(this.adapter = new PropertiesAdapter<ScheduleRow>((Context)this, (List<PropertyRow>)list)));
    }
    
    private void closeWakeupDialog() {
        if (this.wakeupDialog != null) {
            this.schedule.wakeupInterval = this.wakeupDialog.seconds;
            this.wakeupDialog.dismiss();
            this.wakeupDialog = null;
            this.adapter.notifyDataSetChanged();
        }
    }
    
    private void closeWeeklyDialog() {
        System.arraycopy(this.selections, 0, this.schedule.getWeekdays(), 0, this.selections.length);
        this.adapter.notifyDataSetChanged();
        if (this.weeklyDialog != null) {
            this.weeklyDialog.dismiss();
        }
        this.weeklyDialog = null;
    }
    
    private String formatTime(final int n, final int n2) {
        final Calendar instance = Calendar.getInstance();
        instance.set(11, n);
        instance.set(12, n2);
        instance.set(13, 0);
        instance.set(14, 0);
        return DateUtils.formatDateTime((Context)this, instance.getTimeInMillis(), 1);
    }
    
    private static int getHour(final int n) {
        return n / 60 / 60;
    }
    
    private static int getMinute(final int n) {
        return n % 3600 / 60;
    }
    
    protected void onActivityResult(final int n, final int n2, final Intent intent) {
        if (n2 != -1) {
            return;
        }
        try {
            ((ScheduleRow)this.adapter.getItem(n)).update(intent.getExtras().get("RESULT"));
            this.adapter.notifyDataSetChanged();
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    protected void onButtonClick(final View view) throws IOException {
        if (this.schedule.getEnabled() && this.schedule.wakeupInterval != 0 && !this.schedule.isScheduled()) {
            throw new IOException(this.getString(2131099817));
        }
        final Intent intent = new Intent();
        intent.putExtra("RESULT", (Serializable)this.schedule);
        this.setResult(-1, intent);
        this.finish();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.schedule = (SyncSchedule)this.getData();
        this.setTitle(2131099900);
        this.setHelp(2131099879);
        this.addRows();
    }
    
    @TargetApi(14)
    public boolean onCreateOptionsMenu(final Menu menu) {
        if (Build$VERSION.SDK_INT >= 14) {
            this.getMenuInflater().inflate(2131296266, menu);
            final MenuItem item = menu.findItem(2131361841);
            final Switch switch1 = (Switch)item.getActionView().findViewById(2131361809);
            switch1.setChecked(this.schedule.getEnabled());
            switch1.setOnCheckedChangeListener((CompoundButton$OnCheckedChangeListener)new CompoundButton$OnCheckedChangeListener() {
                public void onCheckedChanged(final CompoundButton compoundButton, final boolean enabled) {
                    AddSchedule.this.schedule.setEnabled(enabled);
                    AddSchedule.this.addRows();
                }
            });
            item.setChecked(this.schedule.getEnabled());
        }
        return super.onCreateOptionsMenu(menu);
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.weeklyBiller.close();
        this.wakeupBiller.close();
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        boolean onOptionsItemSelected;
        if (Build$VERSION.SDK_INT >= 14 && menuItem.getItemId() == 2131361841) {
            this.schedule.setEnabled(menuItem.isChecked());
            onOptionsItemSelected = true;
        }
        else {
            onOptionsItemSelected = super.onOptionsItemSelected(menuItem);
        }
        return onOptionsItemSelected;
    }
    
    private class ScheduleAtRow extends ScheduleRow implements View$OnClickListener
    {
        ScheduleAtRow() {
            super(2131100031, 2130837519);
        }
        
        protected String getValue() {
            String s;
            if (AddSchedule.this.schedule.getExactTime() == 0) {
                s = AddSchedule.this.getString(2131099925);
            }
            else {
                s = AddSchedule.this.getString(2131099902, new Object[] { AddSchedule.this.formatTime(getHour(AddSchedule.this.schedule.getExactTime()), getMinute(AddSchedule.this.schedule.getExactTime())) });
            }
            return s;
        }
        
        public void onClick(final View view) {
            new TimeDialog(AddSchedule.this, DateFormat.is24HourFormat((Context)AddSchedule.this), AddSchedule.this.schedule.getExactTime(), new TimeSetListener(AddSchedule.this) {
                protected void timeChanged(final int exactTime) {
                    AddSchedule.this.schedule.setExactTime(exactTime);
                }
            }) {
                protected String formatMessage(final int n, final int n2) {
                    return String.valueOf(AddSchedule.this.getString(2131099902, new Object[] { AddSchedule.this.formatTime(n, n2) })) + AddSchedule.this.getString(2131099903, new Object[] { AddSchedule.this.formatTime(0, 0) });
                }
                
                protected void onCreate(final Bundle bundle) {
                    super.onCreate(bundle);
                    this.setTitle(2131100031);
                    this.setIcon(2130837519);
                }
                
                public void onTimeChanged(final TimePicker timePicker, final int n, final int n2) {
                    super.onTimeChanged(timePicker, n, n2);
                    this.setTitle(2131100031);
                }
                
                protected void setDefaults() {
                    final Calendar instance = Calendar.getInstance();
                    final int value = instance.get(11);
                    final int value2 = instance.get(12);
                    this.updateTime(value, value2);
                    this.onTimeChanged(null, value, value2);
                }
            }.show();
        }
    }
    
    private class ScheduleChargingRow extends ScheduleRow implements OnCheckedChangeListenerEx, View$OnClickListener
    {
        ScheduleChargingRow() {
            super(2131100066, 2130837506);
        }
        
        public boolean getBooleanValue() {
            return AddSchedule.this.schedule.whenCharging;
        }
        
        protected String getValue() {
            final AddSchedule this$0 = AddSchedule.this;
            int n;
            if (AddSchedule.this.schedule.whenCharging) {
                n = 2131099935;
            }
            else {
                n = 2131099936;
            }
            return this$0.getString(n);
        }
        
        public void onCheckedChanged(final CompoundButton compoundButton, final boolean whenCharging) {
            AddSchedule.this.schedule.whenCharging = whenCharging;
            AddSchedule.this.adapter.notifyDataSetChanged();
        }
        
        public void onClick(final View view) {
            AddSchedule.this.schedule.whenCharging = !AddSchedule.this.schedule.whenCharging;
            AddSchedule.this.adapter.notifyDataSetChanged();
        }
    }
    
    private class ScheduleIntervalRow extends ScheduleRow implements View$OnClickListener
    {
        ScheduleIntervalRow() {
            super(2131100032, 2130837528);
        }
        
        protected String getValue() {
            String s;
            if (AddSchedule.this.schedule.getInterval() == 0) {
                s = AddSchedule.this.getString(2131099925);
            }
            else {
                s = AddSchedule.this.getString(2131099901, new Object[] { getHour(AddSchedule.this.schedule.getInterval()), getMinute(AddSchedule.this.schedule.getInterval()) });
            }
            return s;
        }
        
        public void onClick(final View view) {
            new TimeDialog(AddSchedule.this, true, AddSchedule.this.schedule.getInterval(), new TimeSetListener(AddSchedule.this) {
                protected void timeChanged(final int interval) {
                    AddSchedule.this.schedule.setInterval(interval);
                }
            }) {
                protected String formatMessage(final int n, final int n2) {
                    return AddSchedule.this.getString(2131099901, new Object[] { n, n2 });
                }
                
                protected void onCreate(final Bundle bundle) {
                    super.onCreate(bundle);
                    this.setTitle(2131100032);
                    this.setIcon(2130837528);
                }
                
                public void onTimeChanged(final TimePicker timePicker, final int n, final int n2) {
                    super.onTimeChanged(timePicker, n, n2);
                    this.setTitle(2131100032);
                }
                
                protected void setDefaults() {
                    this.onTimeChanged(null, 0, 0);
                }
            }.show();
        }
    }
    
    private class ScheduleRoutersRow extends ScheduleRow implements View$OnClickListener
    {
        ScheduleRoutersRow() {
            super(2131099904, 2130837540);
        }
        
        private String concat(final String s, String string) {
            if (s.length() != 0) {
                string = String.valueOf(s) + ", " + string;
            }
            return string;
        }
        
        private String formatRouters() {
            String concat = "";
            final Iterator<String> iterator = AddSchedule.this.schedule.routers.iterator();
            while (iterator.hasNext()) {
                concat = this.concat(concat, iterator.next());
            }
            return concat;
        }
        
        protected String getValue() {
            String s;
            if (AddSchedule.this.schedule.routers != null && AddSchedule.this.schedule.routers.size() != 0) {
                s = this.formatRouters();
            }
            else {
                s = AddSchedule.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            final Intent intent = new Intent((Context)AddSchedule.this, (Class)AddRouter.class);
            intent.putExtra("RESULT", (Serializable)AddSchedule.this.schedule);
            AddSchedule.this.startActivityForResult(intent, AddSchedule.this.adapter.getPosition((Object)this));
        }
        
        void update(final Object o) throws Exception {
            AddSchedule.this.schedule.routers = ((SyncSchedule)o).routers;
        }
    }
    
    private abstract class ScheduleRow extends PropertyRow
    {
        private final int imageId;
        
        ScheduleRow(final int n, final int imageId) {
            super((Context)AddSchedule.this, n);
            this.imageId = imageId;
        }
        
        Drawable getImage() {
            Drawable drawable;
            if (this.imageId != 0) {
                drawable = AddSchedule.this.getResources().getDrawable(this.imageId);
            }
            else {
                drawable = null;
            }
            return drawable;
        }
        
        void update(final Object o) throws Exception {
        }
    }
    
    private class ScheduleWakeupRow extends ScheduleRow implements View$OnClickListener
    {
        final /* synthetic */ AddSchedule this$0;
        
        ScheduleWakeupRow() {
            super(2131099908, 2130837555);
        }
        
        private void pickupInterval() {
            AddSchedule.access$14(AddSchedule.this, (TimeDialog)new MyDialog(new TimeSetListener(AddSchedule.this) {
                protected void timeChanged(final int wakeupInterval) {
                    AddSchedule.this.schedule.wakeupInterval = wakeupInterval;
                }
            }));
            AddSchedule.this.wakeupDialog.show();
            AddSchedule.this.wakeupDialog.getButton(-1).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
                public void onClick(final View view) {
                    try {
                        if (AddSchedule.this.wakeupBiller.isPurchased() || AddSchedule.this.wakeupDialog.seconds == 0) {
                            AddSchedule.this.closeWakeupDialog();
                        }
                        else {
                            AddSchedule.this.wakeupBiller.purchase();
                        }
                    }
                    catch (Exception ex) {
                        Dialogs.showError((Context)AddSchedule.this, ex);
                    }
                }
            });
        }
        
        protected String getValue() {
            String s;
            if (AddSchedule.this.schedule.wakeupInterval != 0) {
                s = AddSchedule.this.getString(2131099909, new Object[] { AddSchedule.this.schedule.wakeupInterval / 60 });
            }
            else {
                s = AddSchedule.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            try {
                this.pickupInterval();
            }
            catch (Exception ex) {
                Dialogs.showError((Context)AddSchedule.this, ex);
            }
        }
        
        class MyDialog extends TimeDialog
        {
            protected MyDialog(final TimeSetListener timeSetListener) {
                ScheduleWakeupRow.this.this$0.super(true, ScheduleWakeupRow.this.this$0.schedule.wakeupInterval, timeSetListener);
            }
            
            protected String formatMessage(final int n, final int n2) {
                return String.valueOf(AddSchedule.this.getString(2131099909, new Object[] { n2 + n * 60 })) + AddSchedule.this.getString(2131099881);
            }
            
            protected void onCreate(final Bundle bundle) {
                super.onCreate(bundle);
                this.setTitle(2131099908);
                this.setIcon(2130837555);
            }
            
            public void onTimeChanged(final TimePicker timePicker, final int n, final int n2) {
                super.onTimeChanged(timePicker, n, n2);
                this.setTitle(2131099908);
            }
            
            protected void setDefaults() {
                this.onTimeChanged(null, 0, 0);
            }
        }
    }
    
    private class ScheduleWeekdayRow extends ScheduleRow implements View$OnClickListener
    {
        ScheduleWeekdayRow() {
            super(2131099906, 2130837556);
        }
        
        protected String getValue() {
            String s = "";
            final String[] weekdays = new DateFormatSymbols().getWeekdays();
            for (int i = 0; i < AddSchedule.this.schedule.getWeekdays().length; ++i) {
                if (AddSchedule.this.schedule.getWeekdays()[i]) {
                    s = Utils.concat(s, weekdays[i + 1], ", ");
                }
            }
            if (s.length() == 0) {
                s = AddSchedule.this.getString(2131099925);
            }
            return s;
        }
        
        public void onClick(final View view) {
            final String[] weekdays = new DateFormatSymbols().getWeekdays();
            final String[] array = new String[AddSchedule.this.schedule.getWeekdays().length];
            System.arraycopy(weekdays, 1, array, 0, array.length);
            AddSchedule.access$9(AddSchedule.this, new boolean[AddSchedule.this.schedule.getWeekdays().length]);
            System.arraycopy(AddSchedule.this.schedule.getWeekdays(), 0, AddSchedule.this.selections, 0, AddSchedule.this.selections.length);
            AddSchedule.access$11(AddSchedule.this, new AlertDialog$Builder((Context)new ContextThemeWrapper((Context)AddSchedule.this, 2131230722)).setIcon(((ScheduleRow)this).getImage()).setTitle((CharSequence)AddSchedule.this.getString(2131099906)).setMultiChoiceItems((CharSequence[])array, AddSchedule.this.selections, (DialogInterface$OnMultiChoiceClickListener)new DialogInterface$OnMultiChoiceClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n, final boolean b) {
                    AddSchedule.this.selections[n] = b;
                }
            }).setPositiveButton(17039370, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n) {
                }
            }).create());
            AddSchedule.this.weeklyDialog.show();
            AddSchedule.this.weeklyDialog.getButton(-1).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
                private int getSelectionCount() {
                    int n = 0;
                    final boolean[] access$10 = AddSchedule.this.selections;
                    for (int length = access$10.length, i = 0; i < length; ++i) {
                        if (access$10[i]) {
                            ++n;
                        }
                    }
                    return n;
                }
                
                public void onClick(final View view) {
                    try {
                        if (AddSchedule.this.weeklyBiller.isPurchased() || this.getSelectionCount() == 0) {
                            AddSchedule.this.closeWeeklyDialog();
                        }
                        else {
                            AddSchedule.this.weeklyBiller.purchase();
                        }
                    }
                    catch (Exception ex) {
                        Dialogs.showError((Context)AddSchedule.this, ex);
                    }
                }
            });
        }
    }
    
    abstract class TimeDialog extends TimePickerDialog
    {
        private final TimeSetListener listener;
        int seconds;
        
        protected TimeDialog(final boolean b, final int n, final TimeSetListener listener) {
            super((Context)new ContextThemeWrapper((Context)AddSchedule.this, 2131230722), (TimePickerDialog$OnTimeSetListener)listener, 0, 0, b);
            this.listener = listener;
            if (n != 0) {
                final int n2 = n / 60 / 60;
                final int n3 = n % 3600 / 60;
                this.updateTime(n2, n3);
                this.onTimeChanged(null, n2, n3);
            }
            else {
                this.setDefaults();
            }
        }
        
        protected abstract String formatMessage(final int p0, final int p1);
        
        protected void onCreate(final Bundle bundle) {
            super.onCreate(bundle);
            final View viewById = this.findViewById(16908299);
            if (viewById != null && viewById instanceof TextView) {
                final TextView textView = (TextView)viewById;
                textView.setLinksClickable(true);
                textView.setMovementMethod(LinkMovementMethod.getInstance());
            }
        }
        
        protected void onStop() {
            if (this.listener != null) {
                this.listener.disabled = true;
            }
            super.onStop();
            if (this.listener != null) {
                this.listener.disabled = false;
            }
        }
        
        public void onTimeChanged(final TimePicker timePicker, final int n, final int n2) {
            super.onTimeChanged(timePicker, n, n2);
            String s;
            if (n == 0 && n2 == 0) {
                s = AddSchedule.this.getString(2131099925);
            }
            else {
                s = this.formatMessage(n, n2);
            }
            this.setMessage((CharSequence)Html.fromHtml(s));
            this.seconds = 60 * (n * 60) + n2 * 60;
        }
        
        protected abstract void setDefaults();
    }
    
    private abstract class TimeSetListener implements TimePickerDialog$OnTimeSetListener
    {
        boolean disabled;
        
        public void onTimeSet(final TimePicker timePicker, final int n, final int n2) {
            if (!this.disabled) {
                this.timeChanged(60 * (n * 60) + n2 * 60);
                AddSchedule.this.adapter.notifyDataSetChanged();
            }
        }
        
        protected abstract void timeChanged(final int p0);
    }
}
