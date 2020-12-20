CREATE OR REPLACE VIEW enroll_count
AS
SELECT s.c_id, s.c_id_no, count(*) count
FROM senroll s
WHERE s.e_year=(select Date2EnrollYear(SYSDATE) from dual) and
s.e_semester=(select Date2EnrollSemester(SYSDATE) from dual)
GROUP BY s.c_id, s.c_id_no;
