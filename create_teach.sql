CREATE TABLE teach (
c_id varchar2(20),
c_id_no varchar2(10),
tmax number(3),
t_time varchar2(30),
t_year varchar2(10),
t_semester varchar2(10),
t_place varchar2(20),
p_id varchar2(20),
CONSTRAINT teach_pk PRIMARY KEY(c_id, c_id_no, p_id),
CONSTRAINT teach_fk1 FOREIGN KEY(c_id, c_id_no) REFERENCES course(c_id, c_id_no) ON DELETE CASCADE,
CONSTRAINT teach_fk2 FOREIGN KEY (p_id) REFERENCES PROFESSOR(p_id) ON DELETE CASCADE 
); 
INSERT INTO teach VALUES ('C001', '01', 1, '월수 10:30 ~ 11:45', '2020', '2학기', '명신관408', '201' );
INSERT INTO teach VALUES ('C001', '02', 1, '월수 13:30 ~ 14:45', '2020', '2학기', '명신관408', '201' );
INSERT INTO teach VALUES ('C002', '01', 50, '월수 15:00 ~ 16:15', '2020', '2학기', '명신관313', '204' );
INSERT INTO teach VALUES ('C003', '01', 50, '화목 13:30 ~ 14:45', '2020', '2학기', null, '202');
INSERT INTO teach VALUES ('C003', '02', 50, '화목 15:00 ~ 16:15', '2020', '2학기', '프라임관203' , '202');
INSERT INTO teach VALUES ('C004', '01', 55, '월수 10:30 ~ 11:45', '2020', '2학기', '명신관309', '203' );
INSERT INTO teach VALUES ('C004', '02', 55, '월수 13:30 ~ 14:45', '2020', '2학기', '명신관309', '203' );
INSERT INTO teach VALUES ('S001', '01', 60, '화목 10:30 ~ 11:45', '2020', '2학기', '명신관309', '205' );
INSERT INTO teach VALUES ('S002', '01', 30, '수금 16:30 ~ 17:45', '2020', '2학기', '명신관309', '207' );
INSERT INTO teach VALUES ('S003', '01', 60, '화목 10:30 ~ 11:45', '2020', '2학기', '명신관421', '209' );
INSERT INTO teach VALUES ('S003', '02', 60, '화목 15:00 ~ 16:15', '2020', '2학기', '명신관421' , '209');
INSERT INTO teach VALUES ('S004', '01', 40, '월수 09:00 ~ 10:15', '2020', '2학기', '명신관309' , '206');
INSERT INTO teach VALUES ('I001', '01', 80, '화목 13:30 ~ 14:45', '2020', '2학기', '프라임관204', '210');
INSERT INTO teach VALUES ('I001', '02', 99, '화목 13:30 ~ 14:45', '2020', '2학기', '명신관702', '211');
INSERT INTO teach VALUES ('T001', '01', 60, '월수 15:00 ~ 16:15', '2020', '2학기', '창학B116', '213');
INSERT INTO teach VALUES ('T002', '01', 50, '월수 10:30 ~ 11:45', '2020', '2학기', '창학B115', '212');
INSERT INTO teach VALUES ('T002', '02', 50, '월수 12:00 ~ 13:15', '2020', '2학기', '사회514', '212' );
INSERT INTO teach VALUES ('A001', '01', 50, '월수 10:00 ~ 12:50', '2020', '2학기', '창학B165', '777');
