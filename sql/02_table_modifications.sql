-- begin data cleansing...
-- MEDIA TITLE
ALTER TABLE media_title
	ALTER COLUMN genres TYPE TEXT[] USING STRING_TO_ARRAY(genres, ','); -- convert genres from TEXT to TEXT[]

-- MEDIA NAME
-- DECIDED NOT TO SPLIT UP NAMES INTO SEPARATE COLUMNS! INPUT DATA IS NOT CONSISTENT AND THUS IMPOSSIBLE TO MAKE A GENERALISED SOLUTION!
ALTER TABLE media_name
	ALTER COLUMN professions TYPE TEXT[] USING STRING_TO_ARRAY(professions, ','), -- convert professions from TEXT to TEXT[]
	ALTER COLUMN famous_titles TYPE TEXT[] USING STRING_TO_ARRAY(famous_titles, ','); -- convert famous_titles from TEXT to TEXT[]
	
-- MEDIA TITLE CREW
ALTER TABLE media_title_crew
	ALTER COLUMN directors TYPE TEXT[] USING STRING_TO_ARRAY(directors, ','), -- convert directors from TEXT to TEXT[]
	ALTER COLUMN writers TYPE TEXT[] USING STRING_TO_ARRAY(writers, ','); -- convert writers from TEXT to TEXT[]
		
-- MEDIA TITLE PRINCIPAL CREW
/* 
	remove principal crew rows where either the title they were in does not exist in the media_title table 
	or the name of the principal crewmember does not exist in the media_name table
	AKA remove staff that either don't exist or worked on titles that don't exist 
*/
DELETE FROM media_title_principal_crew WHERE NOT EXISTS (SELECT FROM media_title WHERE media_title.media_title_id = media_title_principal_crew.media_title_id);
DELETE FROM media_title_principal_crew WHERE NOT EXISTS (SELECT FROM media_name WHERE media_name.media_name_id = media_title_principal_crew.media_name_id);

-- add foreign keys to media_title_principal_crew
ALTER TABLE media_title_principal_crew
	ADD CONSTRAINT fk_principal_media_title_id
		FOREIGN KEY(media_title_id)
			REFERENCES media_title(media_title_id),
	ADD CONSTRAINT fk_principal_media_name_id
		FOREIGN KEY(media_name_id)
			REFERENCES media_name(media_name_id);

-- MEDIA TITLE EPISODE
/*
	remove episode rows where the title does not exist in the media_title table
	AKA remove episodes that don't exist
*/
DELETE FROM media_title_episode WHERE NOT EXISTS (SELECT FROM media_title WHERE media_title.media_title_id = media_title_episode.media_title_id);

-- add foreign key to media_title_episode
ALTER TABLE media_title_episode
	ADD CONSTRAINT fk_episode_media_title_id
		FOREIGN KEY(media_title_id)
			REFERENCES media_title(media_title_id);

-- MEDIA TITLE RATING
/*
	remove episode rows where the title does not exist in the media_title table
	AKA remove episodes that don't exist
*/
DELETE FROM media_title_rating WHERE NOT EXISTS (SELECT FROM media_title WHERE media_title.media_title_id = media_title_rating.media_title_id);

-- add foreign key to media_title_rating
ALTER TABLE media_title_rating
	ADD CONSTRAINT fk_rating_media_title_id
		FOREIGN KEY(media_title_id)
			REFERENCES media_title(media_title_id);