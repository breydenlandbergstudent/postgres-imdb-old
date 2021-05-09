COPY media_title
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbTitleBasics.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;

COPY media_name
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbName.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;

COPY media_title_crew
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbTitleCrew.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;

COPY media_title_principal_crew
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbTitlePrincipals.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;

COPY media_title_episode
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbTitleEpisode.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;

COPY media_title_rating
FROM 'C:\Users\Breyden Landberg\Documents\PostgreSQL Datasets\IMDb Dataset\Kaggle IMDB Data\ImdbTitleRatings.csv'
NULL '\N'
DELIMITER ','
CSV HEADER;