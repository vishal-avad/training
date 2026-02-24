       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMPLE-TEST.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NAME            PIC X(20) VALUE "COBOL Developer".
       01  WS-NUM-A           PIC 9(3)  VALUE 150.
       01  WS-NUM-B           PIC 9(3)  VALUE 75.
       01  WS-RESULT          PIC 9(4)  VALUE 0.
       01  WS-COUNTER         PIC 9(2)  VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY "========================================".
           DISPLAY "  COBOL IS RUNNING ON WINDOWS!".
           DISPLAY "========================================".
           DISPLAY " ".

           DISPLAY "Hello, " WS-NAME "!".
           DISPLAY " ".

           DISPLAY "--- Basic Arithmetic ---".
           ADD WS-NUM-A TO WS-NUM-B GIVING WS-RESULT.
           DISPLAY WS-NUM-A " + " WS-NUM-B " = " WS-RESULT.

           SUBTRACT WS-NUM-B FROM WS-NUM-A GIVING WS-RESULT.
           DISPLAY WS-NUM-A " - " WS-NUM-B " = " WS-RESULT.

           MULTIPLY WS-NUM-A BY WS-NUM-B GIVING WS-RESULT.
           DISPLAY WS-NUM-A " * " WS-NUM-B " = " WS-RESULT.
           DISPLAY " ".

           DISPLAY "--- Loop Example ---".
           PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > 5
               DISPLAY "Count: " WS-COUNTER
           END-PERFORM.
           DISPLAY " ".

           IF WS-NUM-A > WS-NUM-B
               DISPLAY WS-NUM-A " is greater than " WS-NUM-B
           ELSE
               DISPLAY WS-NUM-A " is not greater than " WS-NUM-B
           END-IF.

           DISPLAY " ".
           DISPLAY "Program completed successfully!".
           STOP RUN.
