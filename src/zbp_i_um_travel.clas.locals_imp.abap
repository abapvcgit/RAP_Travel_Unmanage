CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Travel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Travel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Travel.

    METHODS read FOR READ
      IMPORTING keys FOR READ Travel RESULT result.

    METHODS cba_BOOKING FOR MODIFY
      IMPORTING entities_cba FOR CREATE Travel\_booking.

    METHODS rba_BOOKING FOR READ
      IMPORTING keys_rba FOR READ Travel\_booking FULL result_requested RESULT result LINK association_links.

    METHODS get_features FOR FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD create.




  ENDMETHOD.

  METHOD delete.
    LOOP AT keys INTO DATA(lr_key).
      DELETE FROM zta_um_travel
     WHERE travel_id = lr_key-TravelId.
      IF sy-subrc EQ 0.
        DELETE FROM zta_um_booking WHERE travel_id = lr_key-TravelId.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD update.
*    DATA : ls_travel TYPE zta_um_travel.
*    LOOP AT entities INTO DATA(ls_entitie).
*      SELECT * INTO ls_travel UP TO 1 ROWS
*      FROM zta_um_travel
*      WHERE travel_id = ls_entitie-TravelId.
*      ENDSELECT.
*      IF sy-subrc EQ 0.
*        IF ls_entitie-%control-BeginDate EQ abap_true.
*          ls_travel-begin_date = ls_entitie-BeginDate.
*        ENDIF.
*        IF ls_entitie-%control-EndDate EQ abap_true.
*          ls_travel-end_date = ls_entitie-EndDate.
*        ENDIF.
*      ENDIF.
*    ENDLOOP.
    " Read all relevant travel instances.


  ENDMETHOD.

  METHOD read.


    SELECT travel_id     AS TravelId,
           agency_id     AS AgencyId,
      customer_id   AS CustomerId,
      begin_date    AS BeginDate,
      end_date      AS EndDate,
      currency_code AS CurrencyCode,
      booking_fee   AS BookingFee,
      total_price   AS TotalPrice,
      description   AS Description,
      travel_status AS TravelStatus,
      createdby     AS Createdby,
      createdat     AS Createdat,
      lastchangedby AS Lastchangedby,
      lastchangedat AS Lastchangedat
    FROM zta_um_travel
    INTO CORRESPONDING FIELDS OF TABLE @result
    FOR ALL ENTRIES IN @keys
    WHERE travel_id = @keys-TravelId.

  ENDMETHOD.

  METHOD cba_BOOKING.

  ENDMETHOD.

  METHOD rba_BOOKING.
  ENDMETHOD.

  METHOD get_features.


    " Read the travel status of the existing travels
    READ ENTITIES OF zi_um_travel IN LOCAL MODE
     ENTITY Travel FIELDS ( CustomerId AgencyId ) WITH CORRESPONDING #( keys )
     RESULT DATA(travels)
     FAILED failed.

    result = VALUE #( FOR travel IN travels
               LET custom = COND #( WHEN travel-CustomerId IS INITIAL
                                   THEN if_abap_behv=>fc-f-mandatory
                                   ELSE if_abap_behv=>fc-f-read_only )
                   agency = COND #( WHEN travel-AgencyId IS INITIAL
                                   THEN if_abap_behv=>fc-f-mandatory
                                   ELSE if_abap_behv=>fc-f-read_only )
                            IN ( %key = travel-%key
                                 %field-CustomerId = custom
                                 %field-AgencyId = agency )
                                     ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_um_travel DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS check_before_save REDEFINITION.

    METHODS finalize          REDEFINITION.

    METHODS save              REDEFINITION.

ENDCLASS.

CLASS lsc_zi_um_travel IMPLEMENTATION.

  METHOD check_before_save.
   BREAK developer.
  ENDMETHOD.

  METHOD finalize.
  ENDMETHOD.

  METHOD save.

  ENDMETHOD.

ENDCLASS.
