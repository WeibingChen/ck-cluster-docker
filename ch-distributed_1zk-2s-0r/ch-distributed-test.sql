# ch01
create database test;
# ch02
create database test;
# ch01
create table test.test_shard_2_all on cluster shard_2(
    id UInt32,
    name String
)ENGINE Distributed(shard_2, test, test_shard_2_local, rand());
# ch01
create table test.test_shard_2_local on cluster shard_2(
    id UInt32,
    name String
)ENGINE = MergeTree() order by id PARTITION BY id;
# ch01
insert into test.test_shard_2_all values (1, 'xiaoli'),(2, 'xiaoli'), (3, 'xiaoli');

# ch01
insert into test.test_shard_2_local values (4, 'xiaozhang'),(5, 'xiaowang');