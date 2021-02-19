public with sharing class OrderStatusService {

    public static void updateOrderStatus(Order customerOrder) {
        if(customerOrder == null) {
            return;
        }
        OrderStatus currentStatus = new OrderStatus(customerOrder.Id);

        if(OrderStatus.STATUS_PENDING.equals(customerOrder.Status) && 
            currentStatus.isPaid()) {
            update new Order(Id = orderId, Status = OrderStatus.STATUS_PAID);
            new OrderDeliveryDispatcher(customerOrder.Id).dispatch();
            return;
        } 
        
        if(OrderStatus.STATUS_DELIVERING.equals(customerOrder.Status) && 
            currentStatus.isDelivered()) {
            update new Order(Id = orderId, Status = OrderStatus.DELIVERED);
            return;
        }  
    }
}