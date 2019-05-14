CREATE TABLE Employees (
    emp_no int  NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar (30)  NOT NULL,
    last_name varchar (30)  NOT NULL,
    gender varchar (10)  NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE  Titles  (
     emp_no  int   NOT NULL,
     title  varchar (30)  NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL,
    CONSTRAINT  pk_Titles  PRIMARY KEY (
         emp_no , title , from_date 
     )
);

CREATE TABLE  Salaries  (
     emp_no  int   NOT NULL,
     salary  money   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL,
    CONSTRAINT  pk_Salaries  PRIMARY KEY (
         emp_no , from_date 
     )
);

CREATE TABLE  Departments  (
     dept_no  varchar (10)  NOT NULL,
     dept_name  varchar (30)   NOT NULL,
    CONSTRAINT  pk_Departments  PRIMARY KEY (
         dept_no 
     )
);

CREATE TABLE  DeptMgr  (
     dept_no  varchar (10)   NOT NULL,
     emp_no  int   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL,
    CONSTRAINT  pk_DeptMgr  PRIMARY KEY (
         dept_no , emp_no , from_date 
     )
);

CREATE TABLE  DeptEmp  (
     emp_no  int   NOT NULL,
     dept_no  varchar (10)   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL,
    CONSTRAINT  pk_DeptEmp  PRIMARY KEY (
         emp_no , dept_no , from_date 
     )
);

ALTER TABLE  Titles  ADD CONSTRAINT  fk_Titles_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  Salaries  ADD CONSTRAINT  fk_Salaries_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  DeptMgr  ADD CONSTRAINT  fk_DeptMgr_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

ALTER TABLE  DeptMgr  ADD CONSTRAINT  fk_DeptMgr_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  DeptEmp  ADD CONSTRAINT  fk_DeptEmp_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  DeptEmp  ADD CONSTRAINT  fk_DeptEmp_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

