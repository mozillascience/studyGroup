-- launch with:
-- sqlite3 mtcars.sqlite < mtcars-init.sql

-- drop the results table to start from scratch
drop table results;

-- create results table
create table results (
    mpg float,
    cyl int,
    disp float,
    hp int,
    drat float,
    wt float,
    qsec float,
    vs boolean,
    am boolean,
    gear int,
    carb int,
    name varchar(256)
);

-- set sqlite3 into CSV mode
.mode csv

-- import the mtcars file and store it in the results table
.import mtcars.csv results
