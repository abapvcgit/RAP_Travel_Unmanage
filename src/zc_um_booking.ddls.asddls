@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking BO Projection View'

@Search.searchable: true
@Metadata.allowExtensions: true
define view entity zc_um_booking
  as projection on zi_um_booking
{
  key TravelId,
      @Search.defaultSearchElement: true
  key BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ association: '_Carrier'}]
      @ObjectModel.text.element: ['CarrierName']
      CarrierId,
      _Carrier.Name as CarrierName,
      @Consumption.valueHelpDefinition: [{ association: '_Connection'}]
      ConnectionId,
      FlightDate,
      @Consumption.valueHelpDefinition: [{ association: '_Currency'}]
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Carrier,
      _Connection,
      _Currency,
      _Flight,
      _Travel : redirected to parent zc_um_travel
}
