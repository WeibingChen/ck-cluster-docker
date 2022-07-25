
# ch-01
create database test;
create table test.replicated_sales_1 (id String, price Float32, create_time DateTime)
engine  = ReplicatedMergeTree('/clickhouse/tables/{shard}/replicated_sales_1', '{replica}')
partition by toYYYYMMDD(create_time)
order by id;

# ch-02
create database test;
create table test.replicated_sales_1 (id String, price Float32, create_time DateTime)
engine  = ReplicatedMergeTree('/clickhouse/tables/{shard}/replicated_sales_1', '{replica}')
partition by toYYYYMMDD(create_time)
order by id;
# ch-01
INSERT INTO TABLE test.replicated_sales_1 VALUES('1',99.9,'2021-07-07 00:00:00');
INSERT INTO TABLE test.replicated_sales_1 VALUES('2',199.9,'2021-97-07 00:00:00');

# ch-02
select * from test.replicated_sales_1;
