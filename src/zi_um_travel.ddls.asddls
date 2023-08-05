@AbapCatalog.sqlViewName: 'ZVNUMTRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED


define root view zi_um_travel
  as select from zta_um_travel as Travel
  composition [0..*] of zi_um_booking  as _Booking
  association [1] to /DMO/I_Agency     as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [1] to /DMO/I_Customer   as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1] to I_Currency        as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [1] to zvh_travel_status as _Status   on $projection.TravelStatus = _Status.OvStatusID
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      currency_code as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      description   as Description,
      travel_status as TravelStatus,
      @Semantics.user.createdBy: true
      createdby     as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat     as Createdat,
      @Semantics.user.lastChangedBy: true
      lastchangedby as Lastchangedby,
      @Semantics.user.lastChangedBy: true
      lastchangedat as Lastchangedat,
      /* Associations */
      _Booking,
      _Agency,
      _Customer,
      _Currency,
      _Status
}
