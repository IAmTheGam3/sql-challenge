-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/WE0K6J
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "DEPARTMENTS" (
    "dept_no" VARCHAR(4),   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_DEPARTMENTS_dept_name" UNIQUE (
        "dept_name"
    )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "PK(emp_no," dept_no)   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "PK(dept_no," emp_no)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "fk_DEPARTMENTS_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Manager" ("dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

