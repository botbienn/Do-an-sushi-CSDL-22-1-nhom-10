BULK INSERT khach_hang 
FROM '~/Documents/study/CSDL/Sushi/main SQL/data gen/testing Data/datas/khach_hang.csv'
WITH
(
    FIELDTERMINATOR = ',',  -- Defines the delimiter for columns (comma for CSV)
    ROWTERMINATOR = '\n',   -- Defines the row delimiter (newline)
    FIRSTROW = 2           -- Skips the header row in the CSV file (if applicable)
);
