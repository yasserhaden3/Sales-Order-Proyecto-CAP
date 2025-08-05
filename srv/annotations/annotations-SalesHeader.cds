using {SalesOrder as Service} from '../SR_sales';
using from './annotations-SalesItems';

annotate  Service.SalesHeader with @odata.draft.enabled;

annotate Service.SalesHeader with {
    FIRSTNAME    @title : 'Name';
    LASTNAME     @title : 'Last Name';
    COUNTRY      @title : 'Country';
    CREATION     @title : 'Creation Date';
    DELIVERYDATE @title : 'Delivery Date';
    EMAIL        @title : 'Email';
    orderstatus  @title : 'Order Status';
    orderstatus  @Common: {
        Text           : orderstatus.name,
        TextArrangement: #TextOnly,
    }

};


annotate Service.SalesHeader with @(
    UI.HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders',

        Title         : {
            $Type: 'UI.DataField',
            Value: ID

        },

        Description   : {
            $Type: 'UI.DataField',
            Value: FIRSTNAME
        }

    },
    UI.SelectionFields           : [

        ID,
        orderstatus_CODE,
        FIRSTNAME,
        LASTNAME,
        DELIVERYDATE,
        CREATION,
    ],


    UI.FieldGroup #HeaderCustomer: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: FIRSTNAME
            },
            {
                $Type: 'UI.DataField',
                Value: LASTNAME
            },
            {
                $Type: 'UI.DataField',
                Value: EMAIL
            }
        ]
    },

    UI.FieldGroup #HeaderDates   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: CREATION
            },
            {
                $Type: 'UI.DataField',
                Value: DELIVERYDATE
            },
        ]
    },

        UI.FieldGroup #HeaderStatus   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: orderstatus_CODE,
                Criticality : orderstatus.Criticality,
                Label : '',
            },

        ]
    },
  UI.Facets : [
  {
$Type : 'UI.CollectionFacet',
Facets : [
    {
    $Type : 'UI.ReferenceFacet',
    Target : 'toItems/@UI.LineItem',
    Label : 'Items',

    }
],

  }

  ],
    UI.HeaderFacets              : [
        {
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#HeaderCustomer',
        ID    : 'CustomerInfo',

    },
            {
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#HeaderDates',
        ID    : 'DatesInfo',
        Label : 'Dates',

    },
            {
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#HeaderStatus',
        ID    : 'Status',
        Label : 'Order Status',

    },

    ],


    UI.LineItem                  : [
        {
            $Type                : 'UI.DataField',
            Value                : FIRSTNAME,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },

        },
        {
            $Type                : 'UI.DataField',
            Value                : LASTNAME,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Value: EMAIL,

        },
        {
            $Type: 'UI.DataField',
            Value: CREATION,
        },

        {
            $Type: 'UI.DataField',
            Value: DELIVERYDATE,
        },
        {
            $Type                : 'UI.DataField',
            Value                : orderstatus_CODE,
            Criticality          : orderstatus.Criticality,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },

        },
    ]

);
