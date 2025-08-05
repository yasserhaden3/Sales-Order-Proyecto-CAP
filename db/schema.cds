    namespace com.cap2014;

    using {  
        cuid,
        managed,
        sap.common.CodeList
    } from '@sap/cds/common';


    entity  SalesHeader : cuid, managed{
    
        EMAIL : String(30);
        FIRSTNAME : String(30);
        LASTNAME : String(30);
        COUNTRY : String(30);
        CREATION : Date;
        DELIVERYDATE: Date;
        orderstatus :  Association to Status;
        imageurl : String;
        toItems : Composition of many SalesItem on toItems.SalesOrder = $self;
        

        
    }

    entity  SalesItem : cuid  {

        POS: Int16;
        NAME : String(40);
        DESCRIPTION : String(40);
        RELEASEDATE : Date;
        DISCOUNTDATE: Date;
        PRICE : Decimal(12,2);
        CURRENCY : String(3) default 'USD';
        SalesOrder : Association to SalesHeader;
        
    }

    entity Status : CodeList { 
    
    key CODE : String(10) enum { 
        O = 'Open';
        P = 'In Process';
        C = 'Close';


    };
    Criticality : Integer;
    }

