@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZEA_MNG_I_TRAVEL as select from ztravel_bodh
composition [*] of ZEA_MNG_I_BOOKING as _Item
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt ,
   _Item // Make association public
}
