CREATE PROCEDURE usp_load_community1_record_count
AS
BEGIN
    TRUNCATE TABLE t_community1_record_count;

    INSERT INTO t_community1_record_count (TotalRecords)
    SELECT TotalRecords
    FROM v_community1_record_count;
END;
