CREATE TABLE media_titles (
	media_title_id TEXT PRIMARY KEY,
	media_type TEXT NOT NULL,
	media_primary_title TEXT NOT NULL,
	media_original_title TEXT NOT NULL,
	is_adult_rated BOOLEAN NOT NULL,
	start_year INTEGER,
	end_year INTEGER,
	runtime_minutes INTEGER,
	genre TEXT
);

CREATE TABLE media_names (
	media_name_id TEXT PRIMARY KEY,
	full_name TEXT NOT NULL,
	birth_year INTEGER,
	death_year INTEGER,
	professions TEXT NOT NULL,
	famous_titles TEXT
);