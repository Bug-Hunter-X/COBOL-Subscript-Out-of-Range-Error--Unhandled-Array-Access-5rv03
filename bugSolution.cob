01  WS-AREA. 
    05  WS-COUNT PIC 9(5) VALUE 0. 
    05  WS-TABLE OCCURS 100 TIMES. 
       10  WS-ITEM PIC X(50). 

       05 WS-TABLE-SIZE PIC 9(5) VALUE 100.

PROCEDURE DIVISION.

    PERFORM UNTIL WS-COUNT > 100
       ADD 1 TO WS-COUNT
       IF WS-COUNT <= WS-TABLE-SIZE THEN
           MOVE "Item " & WS-COUNT TO WS-TABLE(WS-COUNT)
       ELSE
           DISPLAY "Error: Table is full" 
           EXIT PERFORM
       END-IF
    END-PERFORM

    * Now process WS-TABLE safely
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > WS-COUNT
        DISPLAY WS-TABLE(I)
    END-PERFORM.

    STOP RUN.

    
    *
    * Added size check to prevent subscript out of range error.
    *