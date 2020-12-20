CREATE TABLE professor (
p_id varchar2(20),
p_name varchar2(10),
p_major varchar2(30),
CONSTRAINT professor_pk PRIMARY KEY(p_id)
);
INSERT INTO PROFESSOR VALUES ('201', '심준호', '컴퓨터과학전공');
INSERT INTO PROFESSOR VALUES ('202', '김주균', '컴퓨터과학전공');
INSERT INTO PROFESSOR VALUES ('203', '유석종', '컴퓨터과학전공');
INSERT INTO PROFESSOR VALUES ('204', '문봉희', '컴퓨터과학전공');
INSERT INTO PROFESSOR VALUES ('205', '박영훈', '컴퓨터과학전공');
INSERT INTO PROFESSOR VALUES ('206', '채희준', '소프트웨어융합전공');
INSERT INTO PROFESSOR VALUES ('207', '김윤진', '소프트웨어융합전공');
INSERT INTO PROFESSOR VALUES ('208', '정영주', '소프트웨어융합전공');
INSERT INTO PROFESSOR VALUES ('209', '박동철', '소프트웨어융합전공');
INSERT INTO PROFESSOR VALUES ('210', '이종우', 'IT공학전공');
INSERT INTO PROFESSOR VALUES ('211', '동서연', 'IT공학전공');
INSERT INTO PROFESSOR VALUES ('212', '강명욱', '통계학과');
INSERT INTO PROFESSOR VALUES ('213', '여인권', '통계학과');
INSERT INTO PROFESSOR VALUES ('777', '오경미', '회화과');
