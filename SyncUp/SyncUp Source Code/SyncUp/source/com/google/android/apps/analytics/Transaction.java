package com.google.android.apps.analytics;

public class Transaction
{
    private final String orderId;
    private final double shippingCost;
    private final String storeName;
    private final double totalCost;
    private final double totalTax;
    
    private Transaction(final Builder builder) {
        super();
        this.orderId = builder.orderId;
        this.totalCost = builder.totalCost;
        this.storeName = builder.storeName;
        this.totalTax = builder.totalTax;
        this.shippingCost = builder.shippingCost;
    }
    
    String getOrderId() {
        return this.orderId;
    }
    
    double getShippingCost() {
        return this.shippingCost;
    }
    
    String getStoreName() {
        return this.storeName;
    }
    
    double getTotalCost() {
        return this.totalCost;
    }
    
    double getTotalTax() {
        return this.totalTax;
    }
    
    public static class Builder
    {
        private final String orderId;
        private double shippingCost;
        private String storeName;
        private final double totalCost;
        private double totalTax;
        
        public Builder(final String orderId, final double totalCost) {
            super();
            this.storeName = null;
            this.totalTax = 0.0;
            this.shippingCost = 0.0;
            if (orderId == null || orderId.trim().length() == 0) {
                throw new IllegalArgumentException("orderId must not be empty or null");
            }
            this.orderId = orderId;
            this.totalCost = totalCost;
        }
        
        public Transaction build() {
            return new Transaction(this, null);
        }
        
        public Builder setShippingCost(final double shippingCost) {
            this.shippingCost = shippingCost;
            return this;
        }
        
        public Builder setStoreName(final String storeName) {
            this.storeName = storeName;
            return this;
        }
        
        public Builder setTotalTax(final double totalTax) {
            this.totalTax = totalTax;
            return this;
        }
    }
}
