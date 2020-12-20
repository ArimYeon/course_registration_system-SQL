CREATE TABLE enroll(
    c_id varchar2(20),
    c_id_no varchar2(10),
    s_id varchar2(10),
    e_year varchar2(10),
    e_semester varchar2(10),
    CONSTRAINT enroll_fk1 FOREIGN KEY(c_id, c_id_no) REFERENCES course(c_id, c_id_no) ON DELETE CASCADE,
    CONSTRAINT enroll_fk2 FOREIGN KEY(s_id) REFERENCES students(s_id) ON DELETE CASCADE,
    CONSTRAINT enroll_pk PRIMARY KEY(c_id, s_id)
);
