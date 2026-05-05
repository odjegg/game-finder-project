/* 
 Add your SQL code here to create the new tables for your feature. 
*/
CREATE TABLE IF NOT EXISTS REVIEWS (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  game_id INT,
  rating INT,
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES USERS (id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);

CREATE TABLE IF NOT EXISTS USERS (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_name TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  dob TEXT,
  bio TEXT
);

CREATE TABLE IF NOT EXISTS WISHLIST (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  game_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (user_id, game_id),
  FOREIGN KEY (user_id) REFERENCES USERS (id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);

CREATE TABLE IF NOT EXISTS ACHIVEMENTS (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  game_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  difficulty TEXT,
  FOREIGN KEY (game_id) REFERENCES GAMES (id)

  CREATE TABLE IF NOT EXISTS PREVIOUSLY_PLAYED (
  user_id INTEGER NOT NULL,
  game_id INTEGER NOT NULL,

  PRIMARY KEY(user_id, game_id),
  UNIQUE (user_id, game_id)
  FOREIGN KEY (user_id) REFERENCES USERS (id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);

/*
  Add some sample data to the tables you create. 
*/