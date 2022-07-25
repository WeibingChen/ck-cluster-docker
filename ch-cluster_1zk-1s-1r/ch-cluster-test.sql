# ch01
create database test;
# ch02
create database test;

# ch01
create table test.replicated_sales_1 on cluster shard_1
(id String, price Float32, create_time DateTime)
engine  = ReplicatedMergeTree('/clickhouse/tables/{shard}/replicated_sales_1', '{replica}')
partition by toYYYYMMDD(create_time)
order by id;

# ch01
INSERT INTO TABLE test.replicated_sales_1 VALUES('1',99.9,'2021-07-07 00:00:00');
INSERT INTO TABLE test.replicated_sales_1 VALUES('2',199.9,'2021-97-07 00:00:00');

# ch01
select * from test.replicated_sales_1;
# ch02
select * from test.replicated_sales_1;

