CREATE TABLE media_title (
	media_title_id TEXT PRIMARY KEY,
	media_type TEXT NOT NULL,
	media_primary_title TEXT NOT NULL,
	media_original_title TEXT NOT NULL,
	is_adult_rated BOOLEAN NOT NULL,
	start_year INTEGER,
	end_year INTEGER,
	runtime_minutes INTEGER,
	genres TEXT
);

CREATE TABLE media_name (
	media_name_id TEXT PRIMARY KEY,
	full_name TEXT,
	birth_year INTEGER,
	death_year INTEGER,
	professions TEXT NOT NULL,
	famous_titles TEXT
);

CREATE TABLE media_title_crew (
	media_title_id TEXT,
	directors TEXT,
	writers TEXT
);

CREATE TABLE media_title_principal_crew (
	media_title_id TEXT,
	meta_ordering INTEGER NOT NULL,
	media_name_id TEXT,
	category TEXT NOT NULL,
	job TEXT,
	character_played TEXT
);

CREATE TABLE media_title_episode (
	media_title_id TEXT,
	media_title_parent_id TEXT,
	season_number INTEGER,
	episode_number INTEGER
);

CREATE TABLE media_title_rating (
	media_title_id TEXT,
	average_rating NUMERIC(3, 1) NOT NULL,
	vote_count INTEGER NOT NULL
);