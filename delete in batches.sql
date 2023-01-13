DECLARE @cutoff datetime = '2020-06-30'

WHILE (SELECT Count(*) FROM table_name  WHERE date < @cutoff ) > 0000000  -- Initially set to 11000000 while testing
BEGIN
    ;WITH CTE AS
    (
    SELECT TOP 200000 *
    FROM table_name
    WHERE date < @cutoff
    ORDER BY date
    )
    DELETE FROM CTE;

    SELECT Count(*) FROM table  WHERE date < @cutoff;
END