       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-WORLD.
       AUTHOR. SAMPLE-PROGRAM.

      * A sample COBOL program demonstrating basic features:
      *   - Variables and data types
      *   - Arithmetic operations
      *   - Conditional logic
      *   - PERFORM loops
      *   - String handling

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-NAME            PIC X(30) VALUE SPACES.
       01  WS-GREETING        PIC X(60) VALUE SPACES.

       01  WS-NUM-A           PIC 9(5)  VALUE 150.
       01  WS-NUM-B           PIC 9(5)  VALUE 75.
       01  WS-RESULT          PIC 9(6)  VALUE 0.

       01  WS-COUNTER         PIC 9(2)  VALUE 0.
       01  WS-FACTORIAL       PIC 9(10) VALUE 1.
       01  WS-FACT-INPUT      PIC 9(2)  VALUE 10.

       01  WS-DATE.
           05 WS-YEAR         PIC 9(4).
           05 WS-MONTH        PIC 9(2).
           05 WS-DAY          PIC 9(2).

       01  WS-FORMATTED-DATE  PIC X(10) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.

           DISPLAY "========================================".
           DISPLAY "  COBOL IS RUNNING LOCALLY ON WINDOWS!  ".
           DISPLAY "========================================".
           DISPLAY SPACES.

      * --- String Handling ---
           MOVE "GnuCOBOL Developer" TO WS-NAME.
           DISPLAY "Greeting: Hello, " WS-NAME "!".
           DISPLAY SPACES.

      * --- Arithmetic ---
           DISPLAY "--- Arithmetic Operations ---".
           ADD WS-NUM-A TO WS-NUM-B GIVING WS-RESULT.
           DISPLAY "  " WS-NUM-A " + " WS-NUM-B " = " WS-RESULT.

           SUBTRACT WS-NUM-B FROM WS-NUM-A GIVING WS-RESULT.
           DISPLAY "  " WS-NUM-A " - " WS-NUM-B " = " WS-RESULT.

           MULTIPLY WS-NUM-A BY WS-NUM-B GIVING WS-RESULT.
           DISPLAY "  " WS-NUM-A " * " WS-NUM-B " = " WS-RESULT.
           DISPLAY SPACES.

      * --- Conditional Logic ---
           DISPLAY "--- Conditional Logic ---".
           IF WS-NUM-A > WS-NUM-B
               DISPLAY "  " WS-NUM-A " is greater than " WS-NUM-B
           ELSE
               DISPLAY "  " WS-NUM-A " is not greater than " WS-NUM-B
           END-IF.

           EVALUATE TRUE
               WHEN WS-NUM-A > 100
                   DISPLAY "  Category: LARGE (> 100)"
               WHEN WS-NUM-A > 50
                   DISPLAY "  Category: MEDIUM (51-100)"
               WHEN OTHER
                   DISPLAY "  Category: SMALL (<= 50)"
           END-EVALUATE.
           DISPLAY SPACES.

      * --- Loop: Compute Factorial ---
           DISPLAY "--- Factorial Calculation ---".
           MOVE 1 TO WS-FACTORIAL.
           PERFORM VARYING WS-COUNTER FROM 1 BY 1
               UNTIL WS-COUNTER > WS-FACT-INPUT
               MULTIPLY WS-COUNTER BY WS-FACTORIAL
           END-PERFORM.
           DISPLAY "  " WS-FACT-INPUT "! = " WS-FACTORIAL.
           DISPLAY SPACES.

      * --- Date Handling ---
           DISPLAY "--- Current Date ---".
           ACCEPT WS-DATE FROM DATE YYYYMMDD.
           DISPLAY "  Today is: " WS-YEAR "-" WS-MONTH "-" WS-DAY.
           DISPLAY SPACES.

           DISPLAY "========================================".
           DISPLAY "  PROGRAM COMPLETED SUCCESSFULLY        ".
           DISPLAY "========================================".

           STOP RUN.

