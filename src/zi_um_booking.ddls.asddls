@AbapCatalog.sqlViewName: 'ZVNUMBOOKIMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking view'

define view zi_um_booking
  as select from zta_um_booking as Booking
  association        to parent zi_um_travel as _Travel     on  $projection.TravelId = _Travel.TravelId

  association [1..1] to /DMO/I_Carrier      as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection   as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                           and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Flight       as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                           and $projection.ConnectionId = _Flight.ConnectionID
                                                           and $projection.FlightDate   = _Flight.FlightDate
  association [0..1] to I_Currency          as _Currency   on  $projection.CurrencyCode = _Currency.Currency
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      currency_code as CurrencyCode,
      flight_price  as FlightPrice,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat,
      /* Associations */
      _Travel,
       _Carrier,
      _Connection,
      _Flight,
      _Currency

}
