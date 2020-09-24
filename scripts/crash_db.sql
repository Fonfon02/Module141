DROP DATABASE IF EXISTS test_crash;
CREATE DATABASE IF NOT EXISTS test_crash;
USE test_crash;

CREATE TABLE t_test
(
  i INT NOT NULL PRIMARY KEY
);

INSERT INTO t_test VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);



SELECT @counter:=0;
DROP TABLE IF EXISTS t_test2;
CREATE TABLE t_test2
  SELECT @counter:=@counter+1 AS COUNTER, NOW() AS hour, (test.i * 10 * rand() *300),hex(@counter) AS hextest, CHAR(hex(@counter)) as charactertest
    FROM t_test AS test
      CROSS JOIN t_test AS test1
      CROSS JOIN t_test AS test2
      CROSS JOIN t_test AS test3
      CROSS JOIN t_test test4
      CROSS JOIN t_test test5
      CROSS JOIN t_test test6
    WHERE @counter <7000000;
SELECT COUNT(*) FROM t_test2;