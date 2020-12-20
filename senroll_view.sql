CREATE OR REPLACE VIEW senroll 
AS
SELECT e.s_id, c.c_id, c.c_id_no, c.c_name,  p.p_name, t.t_time, NVL(t.t_place, 'πÃ¡§') t_place, c.c_unit, e.e_year, e.e_semester
FROM enroll e, course c, teach t, professor p
WHERE e.c_id=c.c_id AND e.c_id_no=c.c_id_no AND t.p_id=p.p_id AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no;
