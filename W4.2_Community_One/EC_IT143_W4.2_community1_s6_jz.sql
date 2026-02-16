TRUNCATE TABLE t_community1_record_count;

INSERT INTO t_community1_record_count (TotalRecords)
SELECT TotalRecords
FROM v_community1_record_count;
