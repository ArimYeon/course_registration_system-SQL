CREATE TABLE course(
	c_id varchar2(20),
	c_id_no varchar2(10),
	c_name varchar2(40),
	c_unit NUMBER(10),
	CONSTRAINT course_pk PRIMARY KEY (c_id, c_id_no),
CONSTRAINT course_ck CHECK(c_unit>=0)
);
INSERT INTO COURSE VALUES ('C001', '01', '�����ͺ��̽����α׷���',3);
INSERT INTO COURSE VALUES ('C001', '02', '�����ͺ��̽����α׷���', 3);
INSERT INTO COURSE VALUES ('C002', '01', '����Ʈ����������', 3);
INSERT INTO COURSE VALUES ('C003', '01', '�ü��', 3);
INSERT INTO COURSE VALUES ('C003', '02', '�ü��', 3);
INSERT INTO COURSE VALUES ('C004', '01', '�ڷᱸ��', 3);
INSERT INTO COURSE VALUES ('C004', '02', '�ڷᱸ��', 3);
INSERT INTO COURSE VALUES ('S001', '01', '�����Ϸ�', 3);
INSERT INTO COURSE VALUES ('S002', '01', '��ǻ��Ư��', 3);
INSERT INTO COURSE VALUES ('S003', '01', '�����ͻ��̾𽺰���', 3);
INSERT INTO COURSE VALUES ('S003', '02', '�����ͻ��̾𽺰���', 3);
INSERT INTO COURSE VALUES ('S004', '01', '�ΰ�����', 3);
INSERT INTO COURSE VALUES ('I001', '01', '���α׷����Թ�', 3);
INSERT INTO COURSE VALUES ('I001', '02', '���α׷����Թ�', 3);
INSERT INTO COURSE VALUES ('T001', '01', '���������1', 3);
INSERT INTO COURSE VALUES ('T002', '01', 'ȸ�ͺм��Թ�', 3);
INSERT INTO COURSE VALUES ('T002', '02', 'ȸ�ͺм��Թ�', 3);
INSERT INTO COURSE VALUES ('A001', '01', '����̼�', 3);
