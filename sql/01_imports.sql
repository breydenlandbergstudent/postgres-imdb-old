COPY media_titles
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbTitleBasics.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;

COPY media_names
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbName.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;