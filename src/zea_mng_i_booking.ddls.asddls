@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INterface view for Booking'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZEA_MNG_I_BOOKING as select from zbooking_bodh
 association to parent ZEA_MNG_I_TRAVEL as _Header on $projection.TravelId = _Header.TravelId
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    booking_status as BookingStatus,
    local_last_changed_at as LocalLastChangedAt ,
   _Header
}
