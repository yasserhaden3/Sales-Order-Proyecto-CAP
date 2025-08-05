using{com.cap2014 as entities}  from '../db/schema';

service SalesOrder {
    entity SalesHeader as projection on entities.SalesHeader;
    entity SalesItem as projection on entities.SalesItem;
    entity Status as projection on entities.Status;

    

}
