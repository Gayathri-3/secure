package com.bv.wifisync;

import java.util.*;
import android.graphics.drawable.*;
import android.app.*;
import android.annotation.*;
import android.text.method.*;
import android.content.*;
import android.util.*;
import android.view.animation.*;
import android.content.res.*;
import android.text.style.*;
import java.io.*;
import android.os.*;
import android.widget.*;
import android.graphics.*;
import android.text.*;
import android.view.*;

abstract class BrowseActivity extends ListActivity implements View$OnClickListener
{
    private static final String DONATE_LINK = "DONATE";
    protected Button buttonOk;
    private HashMap<Drawable, BitmapDrawable> cache;
    private Serializable data;
    private DonateBiller donateBiller;
    private int help;
    private View helpLayout;
    protected TextViewEx helpTextView;
    private boolean helpVisible;
    private final Rect mLastTouch;
    private ProgressbarEx progressBar;
    private View progressPanel;
    
    BrowseActivity() {
        super();
        this.donateBiller = new DonateBiller((Activity)this, Biller.ChargeType.Donate) {
            void onPurchase() {
            }
        };
        this.mLastTouch = new Rect();
        this.cache = new HashMap<Drawable, BitmapDrawable>();
    }
    
    static /* synthetic */ void access$1(final BrowseActivity browseActivity, final boolean helpVisible) {
        browseActivity.helpVisible = helpVisible;
    }
    
    @TargetApi(11)
    private void doSetSubtitle(final String subtitle) {
        this.getActionBar().setSubtitle((CharSequence)subtitle);
    }
    
    private void replaceSpan(final SpannableString spannableString, final URLSpan urlSpan) {
        final int spanStart = spannableString.getSpanStart((Object)urlSpan);
        final int spanEnd = spannableString.getSpanEnd((Object)urlSpan);
        final int spanFlags = spannableString.getSpanFlags((Object)urlSpan);
        spannableString.removeSpan((Object)urlSpan);
        spannableString.setSpan((Object)new URLSpan(urlSpan.getURL()) {
            public void onClick(final View view) {
                BrowseActivity.this.showDonate();
            }
        }, spanStart, spanEnd, spanFlags);
    }
    
    private void setupHelpWindow() {
        this.helpLayout = this.findViewById(2131361794);
        final TextView textView = (TextView)this.findViewById(2131361801);
        textView.setText((CharSequence)"?");
        textView.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                final SharedPreferences sharedPreferences = BrowseActivity.this.getSharedPreferences("app", 0);
                final BrowseActivity this$0 = BrowseActivity.this;
                final boolean access$0 = BrowseActivity.this.helpVisible;
                boolean b = false;
                if (!access$0) {
                    b = true;
                }
                BrowseActivity.access$1(this$0, b);
                final SharedPreferences$Editor edit = sharedPreferences.edit();
                edit.putBoolean("hintMinimized", BrowseActivity.this.helpVisible);
                edit.commit();
                BrowseActivity.this.showHelp(BrowseActivity.this.helpVisible, true);
            }
        });
        this.helpTextView = (TextViewEx)this.findViewById(2131361800);
        if (Build$VERSION.SDK_INT < 11) {
            this.helpTextView.setMovementMethod((MovementMethod)new MyMovementMethod(LinkMovementMethod.getInstance()));
        }
        else {
            this.helpTextView.setOnTouchListener((View$OnTouchListener)new View$OnTouchListener() {
                public boolean onTouch(final View view, final MotionEvent motionEvent) {
                    if (motionEvent.getAction() == 1) {
                        BrowseActivity.this.mLastTouch.right = (int)motionEvent.getX();
                        BrowseActivity.this.mLastTouch.bottom = (int)motionEvent.getY();
                    }
                    return false;
                }
            });
            this.helpTextView.setOnClickListener((View$OnClickListener)new View$OnClickListener() {
                public void onClick(final View view) {
                    try {
                        BrowseActivity.this.spanClicked(BrowseActivity.this.helpTextView);
                    }
                    catch (Exception ex) {
                        Dialogs.showError((Context)BrowseActivity.this, ex);
                    }
                }
            });
        }
        final View helpLayout = this.helpLayout;
        int visibility;
        if (Config.getAssistantVisible((Context)this)) {
            visibility = 0;
        }
        else {
            visibility = 8;
        }
        helpLayout.setVisibility(visibility);
        final DisplayMetrics displayMetrics = new DisplayMetrics();
        this.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        this.helpTextView.setMaxHeight(displayMetrics.heightPixels / 3);
    }
    
    private void showAnimation(final String s, final boolean b) {
        final Animation outAnimation = AnimationUtils.makeOutAnimation((Context)this, b);
        outAnimation.setAnimationListener((Animation$AnimationListener)new Animation$AnimationListener() {
            public void onAnimationEnd(final Animation animation) {
                BrowseActivity.this.showHelp(s, b);
            }
            
            public void onAnimationRepeat(final Animation animation) {
            }
            
            public void onAnimationStart(final Animation animation) {
            }
        });
        this.helpLayout.startAnimation(outAnimation);
    }
    
    private void showDonate() {
        try {
            this.donate();
        }
        catch (Exception ex) {
            Dialogs.showError((Context)this, ex);
        }
    }
    
    private void showHelp(final String s, final boolean b) {
        final SpannableString text = new SpannableString((CharSequence)Html.fromHtml(s));
        for (final URLSpan urlSpan : (URLSpan[])text.getSpans(0, s.length(), (Class)URLSpan.class)) {
            if ("DONATE".equals(urlSpan.getURL())) {
                this.replaceSpan(text, urlSpan);
            }
        }
        this.helpTextView.setText((CharSequence)text);
        final TextView textView = (TextView)this.findViewById(2131361801);
        final TextViewEx helpTextView = this.helpTextView;
        int visibility = 0;
        if (!b) {
            visibility = 8;
        }
        helpTextView.setVisibility(visibility);
        final Resources resources = this.getResources();
        int n;
        if (b) {
            n = 2130837521;
        }
        else {
            n = 2130837520;
        }
        textView.setCompoundDrawablesWithIntrinsicBounds((Drawable)null, (Drawable)null, resources.getDrawable(n), (Drawable)null);
        CharSequence text2;
        if (b) {
            text2 = null;
        }
        else {
            text2 = "?";
        }
        textView.setText(text2);
    }
    
    private void showHelp(final boolean b, final boolean b2) {
        String string;
        if (this.help == 0 || !b) {
            string = "";
        }
        else {
            string = this.getString(this.help);
        }
        String string2;
        if (b) {
            string2 = String.valueOf(string) + "\n" + this.getString(2131099856);
        }
        else {
            string2 = "";
        }
        if (b2) {
            this.showAnimation(string2, b);
        }
        else {
            this.showHelp(string2, b);
        }
    }
    
    private boolean showHelp() {
        final boolean boolean1 = this.getSharedPreferences("app", 0).getBoolean("hintMinimized", true);
        this.showHelp(boolean1, false);
        return boolean1;
    }
    
    private void spanClicked(final TextView textView) {
        final int right = this.mLastTouch.right;
        final int bottom = this.mLastTouch.bottom;
        final int n = right - textView.getTotalPaddingLeft();
        final int n2 = bottom - textView.getTotalPaddingTop();
        final int n3 = n + textView.getScrollX();
        final int n4 = n2 + textView.getScrollY();
        final Layout layout = textView.getLayout();
        final int offsetForHorizontal = layout.getOffsetForHorizontal(layout.getLineForVertical(n4), (float)n3);
        final CharSequence text = textView.getText();
        if (text instanceof SpannableString) {
            final ClickableSpan[] array = (ClickableSpan[])((SpannableString)text).getSpans(offsetForHorizontal, offsetForHorizontal, (Class)ClickableSpan.class);
            if (array.length != 0) {
                array[0].onClick((View)textView);
            }
        }
    }
    
    protected void dispatchEvent(final String s, final String s2) {
        if (!Utils.isDebugBuild((Context)this)) {
            Utils.getTracker((Context)this).trackEvent("/" + this.getLocalClassName(), s, s2, 1);
            Utils.getTracker((Context)this).dispatch();
        }
    }
    
    protected void dispatchEvent(final String s, final String s2, final int n) {
        if (!Utils.isDebugBuild((Context)this)) {
            Utils.getTracker((Context)this).trackEvent("/" + this.getLocalClassName(), s, s2, n);
            Utils.getTracker((Context)this).dispatch();
        }
    }
    
    protected void donate() throws IOException, RemoteException {
        if (this.donateBiller.isPurchased()) {
            Dialogs.showMessage((Context)this, this.getString(2131100055));
        }
        else {
            this.donateBiller.charge();
        }
    }
    
    protected Serializable getData() {
        return this.data;
    }
    
    protected abstract void onButtonClick(final View p0) throws Exception;
    
    public void onClick(final View view) {
        if (!Utils.isDebugBuild((Context)this)) {
            Utils.getTracker((Context)this).trackEvent("/" + this.getLocalClassName(), this.buttonOk.getText().toString(), "Click", 1);
        }
        try {
            this.onButtonClick(view);
        }
        catch (Throwable t) {
            if (!Utils.isDebugBuild((Context)this)) {
                Utils.getTracker((Context)this).trackEvent("/" + this.getLocalClassName(), this.buttonOk.getText().toString(), "Fail", 1);
            }
            Dialogs.showError((Context)this, t);
        }
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(5);
        this.setContentView(2130903040);
        this.setProgressBarIndeterminateVisibility(false);
        this.setProgressBarVisibility(false);
        this.helpVisible = this.getSharedPreferences("app", 0).getBoolean("hintMinimized", true);
        (this.buttonOk = (Button)this.findViewById(2131361795)).setOnClickListener((View$OnClickListener)this);
        this.buttonOk.setText(17039370);
        this.progressPanel = this.findViewById(2131361792);
        this.findViewById(2131361808).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                try {
                    BrowseActivity.this.onProgressCancelClick(view);
                }
                catch (Throwable t) {
                    Dialogs.showError((Context)BrowseActivity.this, t);
                }
            }
        });
        this.progressBar = (ProgressbarEx)this.findViewById(2131361807);
        this.getListView().setItemsCanFocus(false);
        this.setupHelpWindow();
        if (bundle == null || bundle.isEmpty()) {
            this.data = this.getIntent().getSerializableExtra("RESULT");
        }
        else {
            this.data = bundle.getSerializable("RESULT");
        }
        if (!Utils.isDebugBuild((Context)this)) {
            Utils.getTracker((Context)this).trackPageView("/" + this.getLocalClassName());
        }
    }
    
    protected void onDestroy() {
        super.onDestroy();
        if (!Utils.isDebugBuild((Context)this)) {
            Utils.getTracker((Context)this).dispatch();
        }
        this.donateBiller.close();
    }
    
    protected void onListItemClick(final ListView listView, final View view, final int n, final long n2) {
        final ListAdapter listAdapter = this.getListAdapter();
        if (listAdapter != null) {
            final Object item = listAdapter.getItem(n);
            if (item != null && item instanceof View$OnClickListener) {
                ((View$OnClickListener)item).onClick(view);
            }
        }
    }
    
    @TargetApi(11)
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        if (Build$VERSION.SDK_INT >= 11 && menuItem != null && menuItem.getItemId() == 16908332) {
            this.onBackPressed();
        }
        return super.onOptionsItemSelected(menuItem);
    }
    
    protected void onProgressCancelClick(final View view) throws Exception {
        this.progressBar.setProgress(0, this.getString(2131099918));
    }
    
    protected void onSaveInstanceState(final Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.data != null) {
            bundle.putSerializable("RESULT", this.data);
        }
    }
    
    protected Drawable scaleListImage(final Drawable drawable) {
        BitmapDrawable bitmapDrawable = null;
        if (drawable != null) {
            bitmapDrawable = this.cache.get(drawable);
            if (bitmapDrawable == null) {
                final Drawable drawable2 = this.getResources().getDrawable(2130837522);
                final Bitmap bitmap = ((BitmapDrawable)drawable).getBitmap();
                final Bitmap bitmap2 = ((BitmapDrawable)drawable2).getBitmap();
                final int width = bitmap.getWidth();
                final int height = bitmap.getHeight();
                final Matrix matrix = new Matrix();
                final float n = bitmap2.getWidth() / width;
                matrix.postScale(n, n);
                bitmapDrawable = new BitmapDrawable(this.getResources(), Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true));
                this.cache.put(drawable, bitmapDrawable);
            }
        }
        return (Drawable)bitmapDrawable;
    }
    
    protected void setHelp(final int help) {
        if (this.help != help) {
            this.help = help;
            this.showHelp();
        }
    }
    
    public void setProgress(final int n, final String s) {
        this.progressBar.setProgress(n, s);
    }
    
    void setProgressVisible(final boolean b) {
        if (this.progressPanel.getVisibility() == 0 != b) {
            final View progressPanel = this.progressPanel;
            int visibility;
            if (b) {
                visibility = 0;
            }
            else {
                visibility = 8;
            }
            progressPanel.setVisibility(visibility);
            if (!b) {
                this.progressBar.setProgress(0, null);
            }
        }
    }
    
    protected void setSubtitle(final String s) {
        if (Build$VERSION.SDK_INT >= 11) {
            this.doSetSubtitle(s);
        }
    }
    
    protected void trackEvent(final String s, final String s2) {
        if (!Utils.isDebugBuild((Context)this)) {
            Utils.getTracker((Context)this).trackEvent("/" + this.getLocalClassName(), s, s2, 1);
        }
    }
    
    private class MyMovementMethod implements MovementMethod
    {
        private MovementMethod method;
        
        MyMovementMethod(final MovementMethod method) {
            super();
            this.method = method;
        }
        
        public boolean canSelectArbitrarily() {
            return Build$VERSION.SDK_INT >= 11 || this.method.canSelectArbitrarily();
        }
        
        public void initialize(final TextView textView, final Spannable spannable) {
            this.method.initialize(textView, spannable);
        }
        
        public boolean onGenericMotionEvent(final TextView textView, final Spannable spannable, final MotionEvent motionEvent) {
            return false;
        }
        
        public boolean onKeyDown(final TextView textView, final Spannable spannable, final int n, final KeyEvent keyEvent) {
            try {
                return this.method.onKeyDown(textView, spannable, n, keyEvent);
            }
            catch (Exception ex) {
                return true;
            }
        }
        
        public boolean onKeyOther(final TextView textView, final Spannable spannable, final KeyEvent keyEvent) {
            return this.method.onKeyOther(textView, spannable, keyEvent);
        }
        
        public boolean onKeyUp(final TextView textView, final Spannable spannable, final int n, final KeyEvent keyEvent) {
            try {
                return this.method.onKeyUp(textView, spannable, n, keyEvent);
            }
            catch (Exception ex) {
                return true;
            }
        }
        
        public void onTakeFocus(final TextView textView, final Spannable spannable, final int n) {
            this.method.onTakeFocus(textView, spannable, n);
        }
        
        public boolean onTouchEvent(final TextView textView, final Spannable spannable, final MotionEvent motionEvent) {
            try {
                return this.method.onTouchEvent(textView, spannable, motionEvent);
            }
            catch (Exception ex) {
                return true;
            }
        }
        
        public boolean onTrackballEvent(final TextView textView, final Spannable spannable, final MotionEvent motionEvent) {
            return this.method.onTrackballEvent(textView, spannable, motionEvent);
        }
    }
}
