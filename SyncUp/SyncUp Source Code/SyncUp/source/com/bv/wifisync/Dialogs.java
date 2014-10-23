package com.bv.wifisync;

import android.content.*;
import android.text.method.*;
import java.io.*;
import android.os.*;
import android.text.*;
import android.content.pm.*;
import android.app.*;
import android.view.*;
import android.annotation.*;
import android.widget.*;

public class Dialogs
{
    private static AlertDialog internalShowInputDialog(final Context context, final String title, final CharSequence message, final EditText editText, View view, final OnOkClickListener onOkClickListener, final boolean b) {
        editText.setSingleLine(true);
        final AlertDialog$Builder alertDialog$Builder = new AlertDialog$Builder((Context)new ContextThemeWrapper(context, 2131230722));
        alertDialog$Builder.setTitle((CharSequence)title);
        if (message != null) {
            alertDialog$Builder.setMessage(message);
        }
        if (view == null) {
            view = (View)editText;
        }
        alertDialog$Builder.setView(view);
        alertDialog$Builder.setPositiveButton(17039370, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
            }
        });
        alertDialog$Builder.setNegativeButton(17039360, (DialogInterface$OnClickListener)null);
        final AlertDialog show = alertDialog$Builder.show();
        editText.setOnFocusChangeListener((View$OnFocusChangeListener)new View$OnFocusChangeListener() {
            public void onFocusChange(final View view, final boolean b) {
                if (b) {
                    show.getWindow().setSoftInputMode(5);
                }
            }
        });
        final TextView textView = (TextView)show.findViewById(16908299);
        if (textView != null) {
            textView.setLinksClickable(true);
            textView.setMovementMethod(LinkMovementMethod.getInstance());
        }
        final Button button = show.getButton(-1);
        button.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                try {
                    if (onOkClickListener.onClick((DialogInterface)show)) {
                        show.dismiss();
                    }
                }
                catch (Exception ex) {
                    Dialogs.showError(context, ex);
                }
            }
        });
        if (b) {
            button.setEnabled(false);
        }
        editText.addTextChangedListener((TextWatcher)new TextWatcher() {
            public void afterTextChanged(final Editable editable) {
                if (b) {
                    button.setEnabled(Utils.trimText((TextView)editText).length() != 0);
                }
            }
            
            public void beforeTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
            
            public void onTextChanged(final CharSequence charSequence, final int n, final int n2, final int n3) {
            }
        });
        final Editable text = editText.getText();
        if (text != null) {
            editText.setSelection(text.length());
        }
        return show;
    }
    
    static CharSequence readEula(final Context context) {
        CharSequence file;
        try {
            synchronized (Utils.configReadWriteLock) {
                file = readFile(context.getAssets().open("EULA"));
            }
        }
        catch (IOException ex) {
            showError(context, ex);
            System.exit(0);
            file = "";
        }
        return file;
    }
    
    private static CharSequence readFile(final InputStream inputStream) throws IOException {
        final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        try {
            final StringBuilder sb = new StringBuilder();
            while (true) {
                final String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line).append('\n');
            }
            return sb;
        }
        finally {
            bufferedReader.close();
        }
    }
    
    @SuppressLint({ "NewApi" })
    private static void setSelectable(final TextView textView) {
        if (Build$VERSION.SDK_INT >= 11) {
            textView.setTextIsSelectable(true);
        }
    }
    
    static void showAbout(final Context context) throws PackageManager$NameNotFoundException {
        final AlertDialog$Builder alertDialog$Builder = new AlertDialog$Builder((Context)new ContextThemeWrapper(context, 2131230722));
        final String string = context.getString(2131100072, new Object[] { Utils.getAppVersion(context) });
        alertDialog$Builder.setTitle((CharSequence)(String.valueOf(context.getString(2131099954)) + " " + context.getString(2131099649)));
        alertDialog$Builder.setMessage((CharSequence)Html.fromHtml(string));
        alertDialog$Builder.setCancelable(true);
        alertDialog$Builder.setIcon(2130837548);
        final AlertDialog create = alertDialog$Builder.create();
        create.show();
        ((TextView)create.findViewById(16908299)).setMovementMethod(LinkMovementMethod.getInstance());
    }
    
    static void showConfirm(final Context context, final String title, final String s, final View view, final OnConfirmListener onConfirmListener) {
        final AlertDialog$Builder alertDialog$Builder = new AlertDialog$Builder((Context)new ContextThemeWrapper(context, 2131230722));
        alertDialog$Builder.setIcon(17301543);
        alertDialog$Builder.setTitle((CharSequence)title);
        alertDialog$Builder.setMessage((CharSequence)Html.fromHtml(s));
        alertDialog$Builder.setPositiveButton(2131099935, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
            public void onClick(final DialogInterface dialogInterface, final int n) {
                try {
                    onConfirmListener.onConfirm();
                }
                catch (Throwable t) {
                    Dialogs.showError(context, t);
                }
            }
        });
        alertDialog$Builder.setNegativeButton(2131099936, (DialogInterface$OnClickListener)null);
        if (view != null) {
            alertDialog$Builder.setView(view);
        }
        final TextView textView = (TextView)alertDialog$Builder.show().findViewById(16908299);
        if (textView != null) {
            textView.setLinksClickable(true);
            textView.setMovementMethod(LinkMovementMethod.getInstance());
        }
    }
    
    static void showError(final Context context, final String s) {
        Toast.makeText(context, (CharSequence)s, 1).show();
    }
    
    static void showError(final Context context, final Throwable t) {
        showError(context, Errors.getErrorMessage(context, t));
    }
    
    static void showErrorDialog(final Context context, final String title, final String message) {
        new AlertDialog$Builder((Context)new ContextThemeWrapper(context, 2131230722)).setIcon(17301543).setTitle((CharSequence)title).setMessage((CharSequence)message).setPositiveButton(17039370, (DialogInterface$OnClickListener)null).show();
    }
    
    static AlertDialog showInfo(final Context context, final int title, final int n) {
        try {
            final AlertDialog dialogs$9 = new AlertDialog(new ContextThemeWrapper(context, 2131230722)) {};
            dialogs$9.setTitle(title);
            dialogs$9.setMessage((CharSequence)Html.fromHtml(context.getString(n)));
            dialogs$9.setIcon(2130837548);
            dialogs$9.setCancelable(true);
            dialogs$9.show();
            final TextView selectable = (TextView)dialogs$9.findViewById(16908299);
            if (selectable != null) {
                selectable.setAutoLinkMask(15);
                setSelectable(selectable);
            }
            return dialogs$9;
        }
        catch (Exception ex) {
            showError(context, ex);
            return null;
        }
    }
    
    static AlertDialog showInputDialog(final Context context, final String s, final String s2, final EditText editText, final OnOkClickListener onOkClickListener) {
        return internalShowInputDialog(context, s, s2, editText, null, onOkClickListener, true);
    }
    
    static void showMessage(final Context context, final String s) {
        Toast.makeText(context, (CharSequence)s, 0).show();
    }
    
    static AlertDialog showPasswordDialog(final Context context, final EditText editText, final View view, final OnOkClickListener onOkClickListener) {
        return internalShowInputDialog(context, context.getString(2131099938), (CharSequence)Html.fromHtml(context.getString(2131099878)), editText, view, onOkClickListener, false);
    }
    
    static Dialog showWelcome(final Context context) {
        AlertDialog alertDialog;
        synchronized (Utils.configReadWriteLock) {
            if (Config.getInstalled(context)) {
                // monitorexit(Utils.configReadWriteLock)
                alertDialog = null;
            }
           else {
                // monitorexit(Utils.configReadWriteLock)
                alertDialog = new AlertDialog(new ContextThemeWrapper(context, 2131230722)) {};
                alertDialog.setTitle(2131099648);
                alertDialog.setMessage((CharSequence)(Html.fromHtml(context.getString(2131099969)) + "\n\n" + (Object)readEula(context)));
                alertDialog.setIcon(2130837548);
                alertDialog.setCancelable(false);
                alertDialog.setButton(-2, (CharSequence)context.getString(2131099956), (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                    public void onClick(final DialogInterface dialogInterface, final int n) {
                        System.exit(0);
                    }
                });
                alertDialog.setButton(-1, (CharSequence)context.getString(2131099955), (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                    public void onClick(final DialogInterface dialogInterface, final int n) {
                        Config.setInstalled(context);
                    }
                });
                alertDialog.show();
            }
        }
        return (Dialog)alertDialog;
    }
    
    static class NumberPickerDialog extends NumberPickerDialogBase
    {
        NumberPickerDialog(final Context context, final String s, final String s2, final int n, final int n2) {
            super(context, s, s2, n, n2);
        }
        
        @TargetApi(11)
        protected View addPicker(final Context context, final int maxValue) {
            Object addPicker;
            if (Build$VERSION.SDK_INT < 11) {
                addPicker = super.addPicker(context, maxValue);
            }
            else {
                addPicker = new NumberPicker(context);
                ((NumberPicker)addPicker).setLayoutParams(new ViewGroup$LayoutParams(-2, -2));
                ((NumberPicker)addPicker).setGravity(17);
                ((NumberPicker)addPicker).setMinValue(0);
                ((NumberPicker)addPicker).setMaxValue(maxValue);
                ((NumberPicker)addPicker).setOnValueChangedListener((NumberPicker$OnValueChangeListener)new NumberPicker$OnValueChangeListener() {
                    public void onValueChange(final NumberPicker numberPicker, final int n, final int value) {
                        NumberPickerDialog.this.value = value;
                        ((NumberPickerDialogBase)NumberPickerDialog.this).onValueChanged(value);
                    }
                });
                ((NumberPicker)addPicker).setValue(this.value);
            }
            return (View)addPicker;
        }
    }
    
    private static class NumberPickerDialogBase
    {
        private final AlertDialog dialog;
        protected int value;
        
        NumberPickerDialogBase(final Context context, final String title, final String message, final int value, final int n) {
            super();
            this.value = value;
            final LinearLayout view = new LinearLayout(context);
            view.setLayoutParams(new ViewGroup$LayoutParams(-2, -2));
            view.setGravity(17);
            this.dialog = new AlertDialog$Builder(context).setTitle((CharSequence)title).setMessage((CharSequence)"").setView((View)view).setCancelable(true).create();
            view.addView(this.addPicker(context, n));
            this.dialog.setMessage((CharSequence)message);
            this.dialog.setButton(-1, (CharSequence)this.dialog.getContext().getString(17039370), (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n) {
                    NumberPickerDialogBase.this.onButtonOK(NumberPickerDialogBase.this.value);
                }
            });
        }
        
        protected View addPicker(final Context context, final int n) {
            final SeekBar seekBar = new SeekBar(context);
            seekBar.setLayoutParams(new ViewGroup$LayoutParams(-1, -2));
            seekBar.setMax(n * 100);
            seekBar.setOnSeekBarChangeListener((SeekBar$OnSeekBarChangeListener)new SeekBar$OnSeekBarChangeListener() {
                public void onProgressChanged(final SeekBar seekBar, final int n, final boolean b) {
                    NumberPickerDialogBase.this.value = n / 100;
                    NumberPickerDialogBase.this.onValueChanged(NumberPickerDialogBase.this.value);
                }
                
                public void onStartTrackingTouch(final SeekBar seekBar) {
                }
                
                public void onStopTrackingTouch(final SeekBar seekBar) {
                }
            });
            seekBar.setProgress(this.value);
            return (View)seekBar;
        }
        
        protected void onButtonOK(final int n) {
        }
        
        protected void onValueChanged(final int n) {
        }
        
        void setMessage(final String message) {
            this.dialog.setMessage((CharSequence)message);
        }
        
        void show() {
            this.dialog.show();
        }
    }
    
    interface OnConfirmListener
    {
        void onConfirm() throws Exception;
    }
    
    interface OnOkClickListener
    {
        boolean onClick(DialogInterface p0) throws Exception;
    }
}
