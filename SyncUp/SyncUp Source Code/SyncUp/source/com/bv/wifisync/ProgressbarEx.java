package com.bv.wifisync;

import android.widget.*;
import android.text.style.*;
import android.content.*;
import android.util.*;
import android.graphics.*;

public class ProgressbarEx extends ProgressBar
{
    private final Rect bounds;
    private final TextAppearanceSpan span;
    private String text;
    private final Paint textPaint;
    
    public ProgressbarEx(final Context textSize) {
        super(textSize);
        this.textPaint = new Paint();
        this.bounds = new Rect();
        this.span = new TextAppearanceSpan(textSize, 16973894);
        this.setTextSize(textSize);
    }
    
    public ProgressbarEx(final Context textSize, final AttributeSet set) {
        super(textSize, set);
        this.textPaint = new Paint();
        this.bounds = new Rect();
        this.span = new TextAppearanceSpan(textSize, 16973894);
        this.setTextSize(textSize);
    }
    
    public ProgressbarEx(final Context textSize, final AttributeSet set, final int n) {
        super(textSize, set, n);
        this.textPaint = new Paint();
        this.bounds = new Rect();
        this.span = new TextAppearanceSpan(textSize, 16973894);
        this.setTextSize(textSize);
    }
    
    private void setTextSize(final Context context) {
        final int textSize = this.span.getTextSize();
        this.textPaint.setTypeface(Typeface.DEFAULT_BOLD);
        this.textPaint.setTextSize((float)textSize);
        this.textPaint.setAntiAlias(true);
        this.textPaint.getTextBounds("abcABC$&", 0, "abcABC$&".length(), this.bounds);
    }
    
    protected void onDraw(final Canvas canvas) {
        synchronized (this) {
            super.onDraw(canvas);
            final int n = 5 + this.getLeftPaddingOffset();
            final int n2 = (int)(this.getHeight() / 2 - this.bounds.exactCenterY());
            String text;
            if (this.text == null) {
                text = "";
            }
            else {
                text = this.text;
            }
            canvas.drawText(text, (float)n, (float)n2, this.textPaint);
        }
    }
    
    public void setProgress(final int progress, final String text) {
        synchronized (this) {
            this.setProgress(progress);
            this.text = text;
            this.postInvalidate();
        }
    }
}
