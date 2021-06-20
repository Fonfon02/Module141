-- Little sql script that create one million of users, use at your own risk, it's just gonna take a long time, a very long time.
BEGIN;
-- Every users will have the same common base "epsic" 
SELECT 'CREATE USER epsic' || id 
    FROM generate_series(1, 1000000) AS id;
\gexec
-- Use "\du" to display every users before commit it, then you can "ROLLBACK;" or "COMMIT;"
-- \du
COMMIT;
