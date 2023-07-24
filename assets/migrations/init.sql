CREATE TABLE EPISODE_INFO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      sitcom TEXT,
      isReleased INTEGER,
      number INTEGER,
      season INTEGER
);

INSERT INTO EPISODE_INFO (id, name, sitcom, isReleased, number, season) VALUES (1, 'Ozymandias','Breaking Bad', 1, 14, 5);