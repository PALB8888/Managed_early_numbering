@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define  root view entity ZEA_MNG_P_TRAVEL provider contract transactional_query  as projection on ZEA_MNG_I_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
        @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Item   : redirected to  composition child ZEA_MNG_P_BOOKING 
}
