public class OrderDeliveryDispatcher implements Queueable {
    
    private Id orderId;
    private OrderDeliveryDispatcher(Id orderId) {
        this.orderId = orderId;
    }
    
    public void dispatch(Id orderId) {
        if(SomeGlobalSettingService.isDispatchAsync()) { 
            System.enqueueJob(new OrderDeliveryDispatcher(customerOrder.Id));
        } else {
            dispatchOrderToFulfilment():
        }
    }

    public void execute(QueueableContext context) {
       dispatchOrderToFulfilment();   
    }

    private void dispatchOrderToFulfilment() {
        //do some fancy stuff
    }
}