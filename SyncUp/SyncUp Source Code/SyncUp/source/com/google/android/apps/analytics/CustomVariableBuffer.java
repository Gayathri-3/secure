package com.google.android.apps.analytics;

class CustomVariableBuffer
{
    private CustomVariable[] customVariables;
    
    public CustomVariableBuffer() {
        super();
        this.customVariables = new CustomVariable[5];
    }
    
    private void throwOnInvalidIndex(final int n) {
        if (n < 1 || n > 5) {
            throw new IllegalArgumentException("Index must be between 1 and 5 inclusive.");
        }
    }
    
    public void clearCustomVariableAt(final int n) {
        this.throwOnInvalidIndex(n);
        this.customVariables[n - 1] = null;
    }
    
    public CustomVariable[] getCustomVariableArray() {
        return this.customVariables.clone();
    }
    
    public CustomVariable getCustomVariableAt(final int n) {
        this.throwOnInvalidIndex(n);
        return this.customVariables[n - 1];
    }
    
    public boolean hasCustomVariables() {
        int n = 0;
        boolean b;
        while (true) {
            final int length = this.customVariables.length;
            b = false;
            if (n >= length) {
                break;
            }
            if (this.customVariables[n] != null) {
                b = true;
                break;
            }
            ++n;
        }
        return b;
    }
    
    public boolean isIndexAvailable(final int n) {
        this.throwOnInvalidIndex(n);
        return this.customVariables[n - 1] == null;
    }
    
    public void setCustomVariable(final CustomVariable customVariable) {
        this.throwOnInvalidIndex(customVariable.getIndex());
        this.customVariables[-1 + customVariable.getIndex()] = customVariable;
    }
}
