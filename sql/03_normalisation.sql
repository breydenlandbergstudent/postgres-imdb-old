CREATE TABLE media_name_temp(
	media_name_id TEXT,
	full_name TEXT,
	middle_name TEXT,
	first_name TEXT,
	last_name TEXT,
	prefix TEXT,
	suffix TEXT,
	
	CONSTRAINT fk_name_temp_media_name_id
		FOREIGN KEY(media_name_id)
			REFERENCES media_name(media_name_id)
);

INSERT INTO media_name_temp(media_name_id, full_name)
SELECT media_name_id, full_name
FROM media_name;

UPDATE media_name_temp AS mnt
	SET prefix = (CASE
	/*
		This pattern matching block of code will:
		
		1. Handle the 'Mr.', 'Ms.', 'Mrs.', and 'Dr.' prefixes. While the dataset does not adhere to a strict standard, it is consistent in that all instances
		   of the Mister, Miss, Missus, and Doctor suffixes are 'Mr.', 'Ms.', 'Mrs.', and 'Dr.', respectively. Lt. St.
		   
		3. Not handle any other prefixes. IMDb has limitations on what prefixes are allowed.
		   This information can be found at: https://help.imdb.com/article/contribution/names-biographical-data/names/GSA3M6SFHRAERXZ3#
	*/
		WHEN full_name LIKE 'Mr.%' OR full_name LIKE 'Ms.%' OR full_name LIKE 'Dr.%'
		  OR full_name LIKE 'St.%' OR full_name LIKE 'Lt.%' 				THEN LEFT(full_name, 3)
		WHEN full_name LIKE 'Mrs.%'							THEN LEFT(full_name, 4)
		END),
		
		suffix = (CASE
	/*
		This pattern matching block of code will:
		
		1. Handle all generational suffixes from I - XI. There is no extra layer of discrimination; the IMDb dataset does not
		   have a strict standard for naming and thus one gets names like 'Atano III'. Take for example, attempting to differentiate between a 
		   instance of a valid generational suffix in a name like 'Atano III', a name like 'Charles XX' - also a valid generational suffix in
		   this instance - and a name like 'Missy XX' where the 'XX' is not a generational suffix. This is to my knowledge, impossible.
		
		2. Handle the 'Jr.' and 'Sr.' suffixes. While the dataset does not adhere to a strict standard, it is consistent in that all instances
		   of the Junior and Senior suffixes are 'Jr.' and 'Sr.', respectively.
		
		3. Not handle 'M.D.', 'Ph.D', etc. or any variations of these or other suffixes. IMDb has limitations on what suffixes are allowed.
		   This information can be found at: https://help.imdb.com/article/contribution/names-biographical-data/names/GSA3M6SFHRAERXZ3#
	*/
		WHEN(full_name LIKE '% I'   OR full_name LIKE '% V'  OR full_name LIKE '% X')  AND prefix IS NULL THEN RIGHT(full_name, 1)
		WHEN(full_name LIKE '% _I'  OR full_name LIKE '% IV' OR full_name LIKE '% IX' 
			 					     OR full_name LIKE '% X_') AND prefix IS NULL THEN RIGHT(full_name, 2)
		WHEN(full_name LIKE '% __I' OR full_name LIKE '% _I_'
		  OR full_name LIKE '% Jr.' OR full_name LIKE '% Sr.')			       AND prefix IS NULL THEN RIGHT(full_name, 3)
		WHEN(full_name LIKE '% __II')						       AND prefix IS NULL THEN RIGHT(full_name, 4)
		WHEN(full_name LIKE '% XVIII') 						       AND prefix IS NULL THEN RIGHT(full_name, 5)
		END);