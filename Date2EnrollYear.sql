CREATE OR REPLACE FUNCTION Date2EnrollYear
(dDate IN DATE)
RETURN VARCHAR2
IS
month VARCHAR2(10);
year NUMBER;
result enroll.e_year%TYPE;
BEGIN
	SELECT TO_NUMBER(TO_CHAR(dDate, 'YYYY'))
	INTO year
	FROM DUAL;
	
	SELECT TO_CHAR(dDate, 'MM')
	INTO month
	FROM DUAL;

	IF(month>='11' and month<='12') THEN
		year := year+1;
		select to_char(year) into result from dual;
	ELSE
		select to_char(year) into result from dual;
	END IF;
	
	RETURN result;
END;
/
