CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Booking.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Booking.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Booking.

    METHODS read FOR READ
      IMPORTING keys FOR READ Booking RESULT result.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD update.
  BREAK DEVELOPER.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.
