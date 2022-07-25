# ch01
create database test;
# ch02
create database test;
# ch03
create database test;
# ch04
create database test;

# ch01
create table test.test_shard_test_all on cluster shard_2_replica_1(
    id UInt32,
    name String
)ENGINE Distributed(shard_2_replica_1, test, test_shard_test_local, rand());

# ch01
create table test.test_shard_test_local on cluster shard_2_replica_1(
    id UInt32,
    name String
)ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/replicated_sales_1', '{replica}')
order by id 
PARTITION BY id;

# ch01
insert into test.test_shard_test_all values (1, 'xiaoli'),(2, 'xiaoli'), (3, 'xiaoli');

# ch01
insert into test.test_shard_test_all values (4, 'xiaozhang'),(5, 'xiaowang'), (6, 'xiaozhao');

# ch01

insert into test.test_shard_test_local values (7, 'xiaochen'), (8, 'xiaoxu');
