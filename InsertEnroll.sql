CREATE 	OR REPLACE PROCEDURE InsertEnroll
(sStudentId IN VARCHAR2, 
sCourseId IN  VARCHAR2,
nCourseIdNo IN VARCHAR2,
result OUT VARCHAR2)
IS
too_many_sumCourseUnit	EXCEPTION;
too_many_courses 		EXCEPTION;
too_many_students 	EXCEPTION;
duplicate_time 		EXCEPTION;
nYear			VARCHAR2(10);
nSemester 		VARCHAR2(10);
nSumCourseUnit 		NUMBER;
nCourseUnit		NUMBER;
nCnt			NUMBER;
nTeachMax		NUMBER;
msg 			VARCHAR2(10);
BEGIN
result := '';
DBMS_OUTPUT.PUT_LINE('#');
DBMS_OUTPUT.PUT_LINE(sStudentId||'���� �����ȣ '||sCourseId||', �й�'||TO_CHAR(nCourseIdNo)||'�� ���� ����� ��û�Ͽ����ϴ�.');

nYear := Date2EnrollYear(SYSDATE);
nSemester := Date2EnrollSemester(SYSDATE);

/*���� ó�� 1 : �ִ����� �ʰ�����*/
SELECT SUM(c.c_unit)
INTO nSumCourseUnit
FROM course c, enroll e
WHERE e.s_id = sStudentId and e.e_year = nYear and e.e_semester = nSemester
 and e.c_id =c.c_id and e.c_id_no = c.c_id_no;

SELECT c_unit
INTO nCourseUnit
FROM course
WHERE c_id = sCourseId and c_id_no = nCourseIdNo;

IF (nSumCourseUnit + nCourseUnit > 18)
THEN
  RAISE too_many_sumCourseUnit;
END IF;

/*���� ó�� 2 : ������ ���� ��û ����*/
SELECT COUNT(*)
INTO  nCnt
FROM enroll
WHERE s_id = sStudentId and c_id = sCourseId;

IF (nCnt > 0)
THEN
  	RAISE too_many_courses;
END IF;

/*���� ó�� 3 : ������û �ο�  �ʰ� ����*/
SELECT tmax
INTO nTeachMax
FROM teach
WHERE t_year = nYear and t_semester = nSemester
and c_id = sCourseId and c_id_no = nCourseIdNo;

SELECT COUNT(*)
INTO nCnt
FROM enroll
WHERE e_year = nYear and e_semester = nSemester
and c_id = sCourseId and c_id_no = nCourseIdNo;

IF (nCnt >=nTeachmax)
THEN 
 RAISE too_many_students;
END IF;

/*���� ó�� 4 : ��û�� ����� �ð� �ߺ� ����*/
msg := duplicate_verify(sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);
IF msg = 'error' THEN
 RAISE duplicate_time;
END IF;


/*���� ��û ���*/
INSERT INTO enroll(c_id, c_id_no, s_id, e_year, e_semester) VALUES (sCourseId, nCourseIdNo, sStudentId, nYear, nSemester);

COMMIT;
result := '������û ����� �Ϸ�Ǿ����ϴ�.';

EXCEPTION
  WHEN too_many_sumCourseUnit	THEN    
	result := '�ִ������� �ʰ��Ͽ����ϴ�';	
  WHEN too_many_courses		THEN
	result := '�̹� ��ϵ� ������ ��û�Ͽ����ϴ�';
  WHEN too_many_students	THEN
	result := '������û �ο��� �ʰ��Ǿ� ����� �Ұ����մϴ�';
  WHEN duplicate_time		THEN
	result := '�̹� ��ϵ� ���� �� �ߺ��Ǵ� �ð��� �����մϴ�';
  WHEN OTHERS THEN
        ROLLBACK;
        result := SQLCODE;

END;
/
