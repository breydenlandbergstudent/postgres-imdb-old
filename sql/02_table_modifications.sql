-- MEDIA TITLE
ALTER TABLE media_title
	ALTER COLUMN genres TYPE TEXT[] USING STRING_TO_ARRAY(genres, ','); -- convert genres from TEXT to TEXT[]

-- MEDIA NAME
ALTER TABLE media_name
	ADD COLUMN first_name TEXT,
	ADD COLUMN last_name TEXT,
	ADD COLUMN suffix TEXT,
	ALTER COLUMN full_name TYPE TEXT[] USING STRING_TO_ARRAY(full_name, ' '),
	ALTER COLUMN professions TYPE TEXT[] USING STRING_TO_ARRAY(professions, ','), -- convert professions from TEXT to TEXT[]
	ALTER COLUMN famous_titles TYPE TEXT[] USING STRING_TO_ARRAY(famous_titles, ','); -- convert famous_titles from TEXT to TEXT[]
	
-- set first name/last name/suffix
UPDATE media_name
	-- set first name to first element of full_name
	-- set last name to last element of full_name if the last element NOT LIKE '%.'
	-- set suffix to last element of full_name if the last element LIKE '%.'
	
-- set middle names
ALTER TABLE media_name
	-- rename full_name to middle_names
	
-- MEDIA TITLE CREW
ALTER TABLE media_title_crew
	ALTER COLUMN directors TYPE TEXT[] USING STRING_TO_ARRAY(directors, ','), -- convert directors from TEXT to TEXT[]
	ALTER COLUMN writers TYPE TEXT[] USING STRING_TO_ARRAY(writers, ','), -- convert writers from TEXT to TEXT[]
	
	ADD CONSTRAINT fk_crew_media_title_id
		FOREIGN KEY(media_title_id)
			REFERENCES media_title(media_title_id);
		
-- MEDIA TITLE PRINCIPAL CREW
--ALTER TABLE media_title_principal_crew
--	ADD CONSTRAINT fk_principal_media_title_id
--		FOREIGN KEY(media_title_id)
--			REFERENCES media_title(media_title_id),
--	ADD CONSTRAINT fk_principal_media_name_id
--		FOREIGN KEY(media_name_id)
--			REFERENCES media_name(media_name_id);

-- MEDIA TITLE EPISODE
--ALTER TABLE media_title_episode
--	ADD CONSTRAINT fk_episode_media_title_id
--		FOREIGN KEY(media_title_id)
--			REFERENCES media_title(media_title_id)

-- MEDIA TITLE RATING
--ALTER TABLE media_title_rating
--	ADD CONSTRAINT fk_rating_media_title_id
--		FOREIGN KEY(media_title_id)
--			REFERENCES media_title(media_title_id);