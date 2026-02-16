CREATE PROCEDURE usp_load_community2_player_count
AS
BEGIN
    TRUNCATE TABLE t_community2_player_count;

    INSERT INTO t_community2_player_count (TeamName, PlayerCount)
    SELECT TeamName, PlayerCount
    FROM v_community2_player_count;
END;
