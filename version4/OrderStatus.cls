public with sharing class OrderStatus {

    public static final String STATUS_PENDING = 'Pending Payment';
    public static final String STATUS_PAYMENT_FAILED = 'Payment Failed';
    public static final String STATUS_PAID = 'Paid';
    public static final String STATUS_DELIVERING = 'Delivering';
    public static final String STATUS_DELIVERED = 'Delivered';

    private Id orderId;
    private Map<String, List<OrderLineItem>> lineItemsByStatus;

    public OrderStatus(Id orderId) {
        this.orderId = orderId;
        fetchLines();
    }

    public Boolean isPaid() {
        return this.lineItemsByStatus.get(STATUS_PENDING).isEmpty() && 
            this.lineItemsByStatus.get(STATUS_PAYMENT_FAILED).isEmpty();
    }

    public Boolean isDelivered() {
        return !this.lineItemsByStatus.get(STATUS_DELIVERING).isEmpty();
    }

    private Map<String, List<OrderLineItem>> fetchLines() {
        this.lineItemsByStatus = new Map<String, List<OrderLineItem>>();
        this.lineItemsByStatus.put(STATUS_PENDING, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_PAYMENT_FAILED, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_PAID, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_DELIVERING, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_DELIVERED, new List<OrderLineItems>();
        for(OrderLineItem oli : [SELECT Id, Status FROM OrderLineItem WHERE OrderId = :this.orderId]) {
            this.lineItemsByStatus.get(oli.Status).add(oli);
        }
    }
}