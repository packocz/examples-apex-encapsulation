public with sharing class OrderStatusService {

    public static void updateOrderStatus(Order customerOrder) {
        if(customerOrder == null) {
            return;
        }
        OrderStatus currentStatus = new OrderStatus(customerOrder.Id);

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