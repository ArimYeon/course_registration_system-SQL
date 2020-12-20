CREATE OR REPLACE TRIGGER
update_pw_trigger
BEFORE
UPDATE ON students
FOR EACH ROW
DECLARE
user_define_error_len EXCEPTION;
user_define_error_blank EXCEPTION;
len NUMBER;
blank NUMBER;
BEGIN
SELECT LENGTH(:new.s_pwd) INTO len FROM DUAL;
SELECT INSTR(:new.s_pwd, ' ') INTO blank FROM DUAL;
IF len<4 THEN
RAISE user_define_error_len;
ELSIF blank!=0 THEN
RAISE user_define_error_blank;
END IF;
EXCEPTION
WHEN user_define_error_len THEN
RAISE_APPLICATION_ERROR(-20002, '��ȣ�� 4�ڸ� �̻��̾�� �մϴ�');
WHEN user_define_error_blank THEN
RAISE_APPLICATION_ERROR(-20003, '��ȣ�� ������ �Էµ��� �ʽ��ϴ�');
END;
/
