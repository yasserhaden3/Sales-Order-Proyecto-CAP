using {SalesOrder as Service  } from '../SR_sales';

annotate Service.Status WITH {
    @title : 'Status'
  CODE @Common : { 
    Text : name,
    TextArrangement : #TextOnly,
   }
}

