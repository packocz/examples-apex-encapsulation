public class OrderDeliveryDispatcher implements Queueable {
    
    private Id orderId;
    public OrderDeliveryDispatcher(Id orderId) {
        this.orderId = orderId;
    }

    public void execute(QueueableContext context) {
        //do some fancy stuff       
    }
}