-- Crear tabla Country
CREATE TABLE Country (
    country_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    abbreviation TEXT NOT NULL,
    confederation TEXT NOT NULL
);

-- Crear tabla Country_History
CREATE TABLE Country_History (
    ranking_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_id INTEGER,
    fifa_ranking INTEGER,
    total_points INTEGER,
    previous_points INTEGER,
    ranking_change INTEGER,
    ranking_date TEXT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Crear tabla Player
CREATE TABLE Player (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Crear tabla Match
CREATE TABLE Match (
    match_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    home_country_id INTEGER,
    away_country_id INTEGER,
    home_score INTEGER,
    away_score INTEGER,
    FOREIGN KEY (home_country_id) REFERENCES Country(country_id),
    FOREIGN KEY (away_country_id) REFERENCES Country(country_id)
);

-- Crear tabla Match_History
CREATE TABLE Match_History (
    result_id INTEGER PRIMARY KEY AUTOINCREMENT,
    match_id INTEGER,
    home_score INTEGER,
    away_score INTEGER,
    result_date TEXT,
    FOREIGN KEY (match_id) REFERENCES Match(match_id)
);

-- Crear tabla Goal
CREATE TABLE Goal (
    goal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    match_id INTEGER,
    player_id INTEGER,
    minute INTEGER,
    own_goal BOOLEAN,
    penalty BOOLEAN,
    FOREIGN KEY (match_id) REFERENCES Match(match_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id)
);
