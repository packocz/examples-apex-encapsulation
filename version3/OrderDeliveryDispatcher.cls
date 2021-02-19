public class OrderDeliveryDispatcher implements Queueable {

    private Id orderId;
    public OrderDeliveryDispatcher(Id orderId) {
        this.orderId = orderId;
    }

    public void dispatch(Id orderId) {
        System.enqueueJob(new OrderDeliveryDispatcher(customerOrder.Id));
    }

    public void execute(QueueableContext context) {
       dispatchOrderToFulfilment();   
    }

    private void dispatchOrderToFulfilment() {
        //do some fancy stuff
    }
}