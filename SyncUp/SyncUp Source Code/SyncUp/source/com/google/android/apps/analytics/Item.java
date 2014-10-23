package com.google.android.apps.analytics;

public class Item
{
    private final String itemCategory;
    private final long itemCount;
    private final String itemName;
    private final double itemPrice;
    private final String itemSKU;
    private final String orderId;
    
    private Item(final Builder builder) {
        super();
        this.orderId = builder.orderId;
        this.itemSKU = builder.itemSKU;
        this.itemPrice = builder.itemPrice;
        this.itemCount = builder.itemCount;
        this.itemName = builder.itemName;
        this.itemCategory = builder.itemCategory;
    }
    
    String getItemCategory() {
        return this.itemCategory;
    }
    
    long getItemCount() {
        return this.itemCount;
    }
    
    String getItemName() {
        return this.itemName;
    }
    
    double getItemPrice() {
        return this.itemPrice;
    }
    
    String getItemSKU() {
        return this.itemSKU;
    }
    
    String getOrderId() {
        return this.orderId;
    }
    
    public static class Builder
    {
        private String itemCategory;
        private final long itemCount;
        private String itemName;
        private final double itemPrice;
        private final String itemSKU;
        private final String orderId;
        
        public Builder(final String orderId, final String itemSKU, final double itemPrice, final long itemCount) {
            super();
            this.itemName = null;
            this.itemCategory = null;
            if (orderId == null || orderId.trim().length() == 0) {
                throw new IllegalArgumentException("orderId must not be empty or null");
            }
            if (itemSKU == null || itemSKU.trim().length() == 0) {
                throw new IllegalArgumentException("itemSKU must not be empty or null");
            }
            this.orderId = orderId;
            this.itemSKU = itemSKU;
            this.itemPrice = itemPrice;
            this.itemCount = itemCount;
        }
        
        public Item build() {
            return new Item(this, null);
        }
        
        public Builder setItemCategory(final String itemCategory) {
            this.itemCategory = itemCategory;
            return this;
        }
        
        public Builder setItemName(final String itemName) {
            this.itemName = itemName;
            return this;
        }
    }
}
