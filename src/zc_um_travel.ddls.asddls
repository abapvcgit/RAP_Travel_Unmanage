@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel BO Projection View'



@ Search.searchable: true
@Metadata.allowExtensions: true

@ObjectModel.semanticKey: ['TravelID']
define root view entity zc_um_travel
  as projection on zi_um_travel as Travel
{
      @Search.defaultSearchElement: true
  key TravelId,
      @Consumption.valueHelpDefinition: [{ association: '_Agency' }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ association: '_Customer'}]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Consumption.valueHelpDefinition: [{ association: '_Currency'}]
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      Description,
      @Consumption.valueHelpDefinition: [{ association: '_Status' }]
      @ObjectModel.text.element: ['TravelStatusTxt']
      TravelStatus,
      _Status.OvStatus   as TravelStatusTxt,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child zc_um_booking,
      _Currency,
      _Customer,
      _Status
}
