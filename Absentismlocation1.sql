CREATE TABLE AbsenteeismLocation1 (
	EmployeeNumber numeric, 
	Surname TEXT,
	GivenName TEXT,
	Gender TEXT,
	City TEXT,
	JobTitle text,
	DepartmentName text,
	StoreLocation text,
	Division text,
	Age numeric,
	LengthService numeric,
	AbsentHours numeric,
	BusinessUnit text);
	
ALTER TABLE absenteeismlocation1 
DROP COLUMN surname;

	ALTER TABLE absenteeismlocation1
DROP COLUMN age;

	ALTER TABLE absenteeismlocation1
DROP COLUMN givenname;

	ALTER TABLE absenteeismlocation1
DROP COLUMN gender;

	ALTER TABLE absenteeismlocation1
DROP COLUMN jobtitle;

	ALTER TABLE absenteeismlocation1
	DROP COLUMN lengthservice;
	
	ALTER TABLE absenteeismlocation1
DROP COLUMN businessunit;