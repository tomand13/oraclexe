/*
���ϸ� : ex07-select-join.sql

JOIN
    SQL���� �� �� �̻��� ���̺����� ���õ� ����� �����ϱ� ���� �����Դϴ�.
    
*/

/*
Natural Join
    �� ���̺����� ������ ������ �̸��� ��ġ�ϴ� ���� ������� �ڵ����� 
    ���̺��� ������ �� �ֽ��ϴ�.
*/
SELECT department_id, department_name,
        location_id, city
FROM departments
NATURAL JOIN locations;

SELECT * FROM departments;
SELECT * FROM locations;

--------------------------------------------------------------------------------

/*
USING ���� ����
    ���������� ������ �����ϰ����ϴ� ���� �����ݴϴ�.
*/

SELECT employee_id, last_name,
        location_id, department_id
FROM employees JOIN departments
USING (department_id);

/*
ON ���� ����
    ON ���� ����Ͽ� ���� ������ �����մϴ�.
    
*/
SELECT e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
FROM employees e JOIN departments d
-- e�� employees ���̺� d�� department ���̺�
ON (e.department_id = d.department_id);

SELECT e.employee_id, e.last_name,
    e.department_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;


-- ON �� ����Ͽ� 3-Way ���� 
SELECT e.employee_id,l.city, d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

-- ���ο� �߰� ���� ����
SELECT e.employee_id, e.last_name, e.manager_id, e.department_id,
    d.department_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND e.manager_id = 149;

SELECT * FROM employees
WHERE manager_id = 149;

SELECT e.employee_id, e.last_name, e.manager_id, e.department_id,
    d.department_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;   -- AND�� ����

-------------------------------------------------------------------------------

/*
���̺� ��ü ����
    ON ���� ����ϴ� Self Join
*/
SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager 
ON worker.manager_id = manager.employee_id;

/*
NoneQuiJoin
    ��ȣ ������ ���� �ٸ� �����ڸ� �����ϴ� ���� �����Դϴ�.
*/

CREATE TABLE job_grades ( --���̺��� ����
grade_level CHAR(1),
lowest_sal NUMBER(8,2) NOT NULL,
highest_sal NUMBER(8,2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTRAINT jobgrades_grade_pk PRIMARY KEY (grade_level);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;

SELECT * FROM job_grades