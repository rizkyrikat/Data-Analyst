create table bi_data
like bi;

select * 
from bi_data;

insert bi_data
select *
from bi;

select * 
from bi_data;

alter table bi_data
rename column fNAME to FirstName;

alter table bi_data
rename column lNAME to LastName;

-- standardizing Gender

select distinct gender
from bi_data;

update bi_data
set gender = 'Male'
where gender in ('M', 'male');

update bi_data
set gender = 'Female'
where gender in ('F', 'female');

-- standardizing Country

select distinct country
from bi_data;

UPDATE bi_data
SET country = 'Norway'
WHERE country IN ('Norge', 'norway');

UPDATE bi_data
SET country = 'South Africa'
WHERE country = 'Rsa';

UPDATE bi_data
SET country = 'Somalia'
WHERE country = 'Somali';

-- standardizing prevEducation

select distinct prevEducation
from bi_data;

UPDATE bi_data
SET prevEducation = 'Diploma'
WHERE prevEducation 
IN ('diploma', 'DIPLOMA', 'Diplomaaa');

UPDATE bi_data
SET prevEducation = 'Bachelors'
WHERE prevEducation = 'Barrrchelors';

UPDATE bi_data
SET prevEducation = 'High School'
WHERE prevEducation = 'HighSchool';

-- missing values

select *
from bi_data
where Python is null
or Python = '';

update bi_data
set Python = 
(SELECT (AVG(Python)) FROM 
(SELECT Python FROM bi_data) AS subquery)
WHERE Python IS NULL or python = '';

update bi_data
Set python = round(python);

select *
from bi_data;
