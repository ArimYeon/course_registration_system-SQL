CREATE OR REPLACE FUNCTION duplicate_verify
(sStudentId IN VARCHAR2, 
sCourseId IN  VARCHAR2,
nCourseIdNo IN VARCHAR2,
nYear IN VARCHAR2,
nSemester IN VARCHAR2)
RETURN VARCHAR2
IS
CURSOR enrollTimeList IS
SELECT t.t_time
FROM teach t, enroll e
WHERE e.s_id = sStudentId and e.e_year = nYear and e.e_semester = nSemester
	and t.t_year = nYear and t.t_semester = nSemester and 
	e.c_id = t.c_id and e.c_id_no = t.c_id_no;
addTime  teach.t_time%TYPE;
addTime_frontDay VARCHAR2(7);
addTime_backDay VARCHAR2(7);
addTime_startHour VARCHAR2(7);
addTime_startMin VARCHAR2(7);
addTime_endHour VARCHAR2(7);
addTime_endMin VARCHAR2(7);
addTime_start NUMBER;
addTime_end NUMBER;
baseTime_frontDay VARCHAR2(7);
baseTime_backDay VARCHAR2(7);
baseTime_startHour VARCHAR2(7);
baseTime_startMin VARCHAR2(7);
baseTime_endHour VARCHAR2(7);
baseTime_endMin VARCHAR2(7);
baseTime_start NUMBER;
baseTime_end NUMBER;
msg VARCHAR2(10):='success';
BEGIN
SELECT t_time
INTO addTime
FROM teach
WHERE t_year = nYear and t_semester = nSemester and
  c_id = sCourseId and c_id_no = nCourseIdNo;

addTime_frontDay := SUBSTR(addTime, 1, 1);
addTime_backDay := SUBSTR(addTime, 2, 1);
addTime_startHour := SUBSTR(addTime, 4, 2);
addTime_startMin := SUBSTR(addTime, 7, 2);
addTime_endHour := SUBSTR(addTime, 12, 2);
addTime_endMin := SUBSTR(addTime, 15, 2);
addTime_start := TO_NUMBER(addTime_startHour || addTime_startMin);
addTime_end := TO_NUMBER(addTime_endHour || addTime_endMin);


FOR eTime_rec IN enrollTimeList LOOP
	baseTime_frontDay := SUBSTR(eTime_rec.t_time, 1, 1);
	baseTime_backDay := SUBSTR(eTime_rec.t_time, 2, 1);
	baseTime_startHour := SUBSTR(eTime_rec.t_time, 4, 2);
	baseTime_startMin := SUBSTR(eTime_rec.t_time, 7, 2);
	baseTime_endHour := SUBSTR(eTime_rec.t_time, 12, 2);
	baseTime_endMin := SUBSTR(eTime_rec.t_time, 15, 2);
	baseTime_start := TO_NUMBER(baseTime_startHour || baseTime_startMin);
	baseTime_end := TO_NUMBER(baseTime_endHour || baseTime_endMin);
	
	IF addTime_frontDay||addTime_backDay = baseTime_frontDay||baseTime_backDay 
		OR addTime_frontDay = baseTime_frontDay OR addTime_backDay = baseTime_backDay
		OR addTime_frontDay = baseTime_backDay OR addTime_backDay = baseTime_frontDay
	THEN
		IF addTime_start > baseTime_start AND addTime_start > baseTime_end THEN
			null;
		ELSIF addTime_end < baseTime_start AND addTime_end <baseTime_end THEN
			null;
		ELSE
			msg := 'error';
			exit;
		END IF;
	END IF;
END LOOP;
RETURN msg;
END;
/
