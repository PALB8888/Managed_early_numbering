CLASS lhc_ZEA_MNG_I_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zea_mng_i_travel RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zea_mng_i_travel.

    METHODS earlynumbering_cba_Item FOR NUMBERING
      IMPORTING entities FOR CREATE zea_mng_i_travel\_Item.

ENDCLASS.

CLASS lhc_ZEA_MNG_I_TRAVEL IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
  "Get max travel ID from active table
  SELECT SINGLE FROM ztravel_bodh FIELDS MAX( travel_id ) AS travelID INTO @DATA(travel_id_max).
  "Get max travel ID from draft table
  SELECT SINGLE FROM ZTRAVEL_DFT_BODH FIELDS MAX( travelid ) INTO @DATA(max_travelid_draft).
  IF max_travelid_draft > travel_id_max.
    travel_id_max = max_travelid_draft.
  ENDIF.

 LOOP AT entities INTO DATA(entity).
 IF entity-TravelId IS INITIAL .
 travel_id_max += 1.
 entity-TravelID = travel_id_max.
 ENDIF.

  APPEND VALUE #( %cid      = entity-%cid
                 %key      = entity-%key
                 %is_draft = entity-%is_draft
               ) TO mapped-zea_mng_i_travel.
  ENDLOOP .

  ENDMETHOD.

  METHOD earlynumbering_cba_Item.

    "Get max travel ID from active table
  SELECT SINGLE FROM zbooking_bodh FIELDS MAX( travel_id ) AS travelID INTO @DATA(booking_id_max).
  "Get max travel ID from draft table
  SELECT SINGLE FROM ZBOOKIG_DFT_BODH FIELDS MAX( travelid ) INTO @DATA(max_booking_draft).
  IF max_booking_draft > booking_id_max.
     booking_id_max = max_booking_draft.
  ENDIF.

 LOOP AT entities INTO DATA(entity).
 LOOP AT entity-%target INTO DATA(lv_entity) .
* IF entity-TravelId IS INITIAL .
* booking_id_max += 1.
* entity- = booking_id_max.
* ENDIF.
  IF lv_entity-BookingId IS INITIAL .
  APPEND VALUE #( %cid      = lv_entity-%cid
                  travelid  = entity-TravelId
                  bookingid =  booking_id_max
                 %is_draft = entity-%is_draft
               ) TO mapped-zea_mng_i_booking.
  ELSE .
    APPEND VALUE #( %cid      = lv_entity-%cid
                 %key      = lv_entity-%key
                 %is_draft = entity-%is_draft
               ) TO mapped-zea_mng_i_booking.

  ENDIF .
  ENDLOOP .
  ENDLOOP .
  ENDMETHOD.

ENDCLASS.
