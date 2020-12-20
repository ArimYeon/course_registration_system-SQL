CREATE OR REPLACE VIEW insertview
AS
SELECT c.c_id, c.c_id_no, c.c_name, p.p_name, t.t_time, NVL(t.t_place, 'πÃ¡§') t_place, c.c_unit, t.tmax
from course c, professor p, teach t
where t.p_id=p.p_id and t.c_id=c.c_id and t.c_id_no=c.c_id_no;
