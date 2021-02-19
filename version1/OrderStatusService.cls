public with sharing class OrderStatusService {

    public static final String STATUS_PENDING = 'Pending Payment';
    public static final String STATUS_PAID = 'Paid';
    public static final String STATUS_DELIVERING = 'Delivering';
    public static final String STATUS_DELIVERED = 'Delivered';
    
    public static void updateOrderStatus(Order customerOrder) {
        if(customerOrder == null) {
            return;
        }
        Map<String, List<OrderLineItem>> orderLinesByStatus = new Map<String, List<OrderLineItem>>();
        this.lineItemsByStatus.put(STATUS_PENDING, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_PAID, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_DELIVERING, new List<OrderLineItems>();
        this.lineItemsByStatus.put(STATUS_DELIVERED, new List<OrderLineItems>();
        for(OrderLineItem oli : [SELECT Id, Status FROM OrderLineItem WHERE OrderId = :this.orderId]) {
            if(this.lineItemsByStatus.containsKey(oli.Status)) {
                this.lineItemsByStatus.get(oli.Status).add(oli);
            } 
        }

        if(OrderStatus.STATUS_PENDING.equals(customerOrder.Status && 
            currentStatus.lineItemsByStatus.get(OrderStatus.STATUS_PENDING).isEmpty()) {
            update new Order(Id = orderId, Status = OrderStatus.STATUS_PAID);
            System.enqueueJob(new OrderDeliveryDispatcher(customerOrder.Id));
            return;
        } 
        
        if(OrderStatus.STATUS_DELIVERING.equals(customerOrder.Status && 
            currentStatus.lineItemsByStatus.get(OrderStatus.STATUS_DELIVERING).isEmpty()) {
            update new Order(Id = orderId, Status = OrderStatus.DELIVERED);
            return;
        }  
    }
}