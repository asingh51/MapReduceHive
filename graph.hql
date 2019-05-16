drop table P;
drop table C;
drop table kmeans;

create table P (
  x double,
  Y double)
row format delimited fields terminated by ',' stored as textfile;

create table C (
  x double,
  Y double)
row format delimited fields terminated by ',' stored as textfile;

load data local inpath '${hiveconf:P}' overwrite into table P;
load data local inpath '${hiveconf:C}' overwrite into table C;


Create table kmeans as select C.x+P.x, C.x, C.y from P,C;

select P.x, P.y, kmeans;