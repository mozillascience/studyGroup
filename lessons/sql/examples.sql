-- launch sqlite3 with a DB file
-- sqlite3 mtcars.sqlite

---------
-- help for sqlite
-- .help

---------
-- export the mtcars results again

.headers on
.mode csv
.output export-mtcars.csv
select * from results;
.output

---------
-- CREATE

create table datatypes (
    numbers float,
    integers int,
    strings varchar(32),
    truths boolean
);

---------
-- DROP

drop table datatypes;

---------
-- SELECT * FROM TABLE
-- get all the rows and columns from a table called 'results'

select * from results;

---------
-- SELECT count() WHERE
-- count the number of rows in the table called 'results'

select count(*) from results;

---------
-- SELECT ... WHERE
-- filter the results to include only cars with 6 cylinder engines

select count(*) from results where cyl=6;

---------
-- SELECT COL AS COLNAME
-- "rename" a column within a result set
-- here we call 'wt' by its full name, 'weight'

select wt as weight from results where weight > 5;

---------
-- INSERT ...
-- add rows to the database, according to the schema
-- columns are:
--      mpg float, cyl int, disp float, hp int, drat float, wt float,
--      qsec float, vs boolean, am boolean, gear int, carb int, name varchar(256)

insert into results values (4.3,12,320.0,774,13.62,8.31,75.5,0,1,2,6,"Powell Motors Homer");

-- retrieve our new row:
select * from results where name='Powell Motors Homer';

-- and the heaviest cars by weight are:
select * from results where wt > 5;

---------
-- UPDATE ... WHERE
-- change values in the table WHERE the filter is matched

update results set cyl=16 where name='Powell Motors Homer';
select cyl from results where name='Powell Motors Homer';

---------
-- ALTER ...
-- change the table schema by adding or removing columns
-- NB: sqlite3 does not allow dropping columns

alter table results add column emissions float;

-- check the schema now
.schema results

---------
-- DELETE ... WHERE
-- remove rows that match WHERE clause

select count(*) from results;
select count(*) from results where cyl=4;
delete from results where cyl=4;
select count(*) from results;

-- SELECT ... JOIN
