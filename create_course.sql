CREATE TABLE course(
	c_id varchar2(20),
	c_id_no varchar2(10),
	c_name varchar2(40),
	c_unit NUMBER(10),
	CONSTRAINT course_pk PRIMARY KEY (c_id, c_id_no),
CONSTRAINT course_ck CHECK(c_unit>=0)
);
INSERT INTO COURSE VALUES ('C001', '01', '데이터베이스프로그래밍',3);
INSERT INTO COURSE VALUES ('C001', '02', '데이터베이스프로그래밍', 3);
INSERT INTO COURSE VALUES ('C002', '01', '소프트웨어의이해', 3);
INSERT INTO COURSE VALUES ('C003', '01', '운영체제', 3);
INSERT INTO COURSE VALUES ('C003', '02', '운영체제', 3);
INSERT INTO COURSE VALUES ('C004', '01', '자료구조', 3);
INSERT INTO COURSE VALUES ('C004', '02', '자료구조', 3);
INSERT INTO COURSE VALUES ('S001', '01', '컴파일러', 3);
INSERT INTO COURSE VALUES ('S002', '01', '컴퓨터특강', 3);
INSERT INTO COURSE VALUES ('S003', '01', '데이터사이언스개론', 3);
INSERT INTO COURSE VALUES ('S003', '02', '데이터사이언스개론', 3);
INSERT INTO COURSE VALUES ('S004', '01', '인공지능', 3);
INSERT INTO COURSE VALUES ('I001', '01', '프로그래밍입문', 3);
INSERT INTO COURSE VALUES ('I001', '02', '프로그래밍입문', 3);
INSERT INTO COURSE VALUES ('T001', '01', '기초통계학1', 3);
INSERT INTO COURSE VALUES ('T002', '01', '회귀분석입문', 3);
INSERT INTO COURSE VALUES ('T002', '02', '회귀분석입문', 3);
INSERT INTO COURSE VALUES ('A001', '01', '교양미술', 3);
