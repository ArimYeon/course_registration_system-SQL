CREATE OR REPLACE FUNCTION Date2EnrollSemester
(dDate IN DATE)
RETURN VARCHAR2
IS
sMonth enroll%ROWTYPE;
BEGIN
	SELECT TO_CHAR(dDate, 'MM')
	INTO sMonth.e_semester
	FROM DUAL;

	IF(sMonth.e_semester>='11' and sMonth.e_semester<='12') THEN
		sMonth.e_semester := '2학기';
	ELSIF(sMonth.e_semester>='01' and sMonth.e_semester<='04') THEN
		sMonth.e_semester := '2학기';
	ELSIF(sMonth.e_semester>='05' and sMonth.e_semester<='10') THEN
		sMonth.e_semester := '2학기';
	END IF;
	RETURN sMonth.e_semester;
END;
/
