CREATE OR REPLACE PROCEDURE sumUnit
(sid IN VARCHAR2,
year IN VARCHAR2,
semester IN VARCHAR2,
total OUT NUMBER)
IS
CURSOR enrollList (v_sid senroll.s_id%TYPE, v_year senroll.e_year%TYPE, 
v_semester senroll.e_semester%TYPE) IS
SELECT c_unit
FROM senroll
WHERE s_id = v_sid and e_year = v_year and e_semester = v_semester;
num NUMBER := 0;
BEGIN
FOR enrollrec IN enrollList(sid, year, semester) LOOP
num := num + enrollrec.c_unit;
END LOOP;
total := num;
END;
/
