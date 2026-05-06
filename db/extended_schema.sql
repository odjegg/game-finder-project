/* 
 Add your SQL code here to create the new tables for your feature.
*/


CREATE TABLE IF NOT EXISTS USERS (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_name TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  dob TEXT,
  bio TEXT
);

CREATE TABLE IF NOT EXISTS REVIEWS (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER,
  game_id INTEGER,
  rating REAL,
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES USERS (id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
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
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);

  CREATE TABLE IF NOT EXISTS PREVIOUSLY_PLAYED (
  user_id INTEGER,
  game_id INTEGER,
  PRIMARY KEY(user_id, game_id),
  FOREIGN KEY (user_id) REFERENCES USERS (id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);


CREATE TABLE IF NOT EXISTS REGIONS (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS GAME_REGIONS (
  game_id INTEGER,
  region_id INTEGER,
  is_available BOOLEAN NOT NULL
  PRIMARY KEY (game_id, region_id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id),
  FOREIGN KEY (region_id) REFERENCES REGIONS (id)
);

CREATE TABLE IF NOT EXISTS FRIENDS (
  user_id INTEGER,
  friend_id INTEGER,
  -- stops duplicates
  CHECK (user_id < friend_id),
  PRIMARY KEY (user_id, friend_id),
  FOREIGN KEY (user_id) REFERENCES USERS (id),
  FOREIGN KEY (friend_id) REFERENCES USERS (id)
);

CREATE TABLE IF NOT EXISTS MESSAGES (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sender_id INTEGER,
  reciever_id INTEGER,
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES USERS (id),
  FOREIGN KEY (reciever_id) REFERENCES USERS (id)
);

CREATE TABLE IF NOT EXISTS TAGS (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS GAME_TAGS (
  game_id INTEGER,
  tag_id INTEGER,
  PRIMARY KEY (game_id, tag_id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id),
  FOREIGN KEY (tag_id) REFERENCES TAGS (id)
);

CREATE TABLE IF NOT EXISTS STREAMER_POPULARITY (
  game_id INTEGER PRIMARY KEY,
  streamer_count INTEGER NOT NULL,
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);

CREATE TABLE IF NOT EXISTS STORES (id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS GAME_STORES (
  game_id INTEGER,
  store_id INTEGER,
  purchase_link TEXT,
  PRIMARY KEY (game_id, store_id),
  FOREIGN KEY (game_id) REFERENCES GAMES (id),
  FOREIGN KEY (store_id) REFERENCES STORES (id)
);

CREATE TABLE IF NOT EXISTS TROPHIES (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  game_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  FOREIGN KEY (game_id) REFERENCES GAMES (id)
);

-- Addition of new atributes into the GAMES table

ALTER TABLE GAMES
ADD COLUMN age_restriction INTEGER;

ALTER TABLE GAMES
ADD COLUMN description TEXT;


ALTER TABLE GAMES
ADD COLUMN difficulty TEXT;


ALTER TABLE GAMES
ADD COLUMN average_length INTEGER;

/*
  Add some sample data to the tables you create.  
*/

INSERT INTO USERS (user_name, email, password, dob, bio) VALUES
('PixelHunter', 'pixelhunter@email.com', 'hunter123', '2005-04-12', 'Loves RPG and adventure games'),
('ShadowNinja', 'shadow@email.com', 'ninja456', '2004-11-03', 'Competitive FPS player'),
('RetroKing', 'retroking@email.com', 'retro789', '2003-07-19', 'Collector of retro games'),
('Stardust', 'stardust@email.com', 'star321', '2006-01-25', 'Enjoys indie and relaxing games'),
('DragonSlayer', 'dragon@email.com', 'dragon654', '2005-09-14', 'MMORPG enthusiast'),
('SpeedRunner', 'speed@email.com', 'speed999', '2004-06-08', 'Speedruns platform games'),
('CraftMaster', 'craft@email.com', 'craft111', '2005-12-01', 'Sandbox and survival gamer'),
('NoScopePro', 'noscope@email.com', 'scope222', '2003-03-30', 'Shooter game specialist');

INSERT INTO REVIEWS (user_id, game_id, rating, comment)
VALUES
(1, 3, 5, 'Amazing gameplay and story.'),
(2, 1, 4.5, 'Really relaxing and enjoyable.'),
(1, 5, 3.2, 'Good game but gets repetitive after a while.'),
(3, 2, 5, 'One of the best multiplayer games I have played.'),
(4, 4, 2.1, 'Did not enjoy the controls very much.');


INSERT INTO USERS (user_name, email, password, dob, bio)
VALUES
('alex_gamer', 'alex@example.com', 'alex123', '2005-03-14', 'Loves RPG and adventure games.'),
('sarahplays', 'sarah@example.com', 'sarah456', '2004-11-22', 'Competitive FPS player and streamer.'),
('mike_dev', 'mike@example.com', 'mike789', '2003-07-08', 'Indie game developer and Minecraft fan.'),
('emma_online', 'emma@example.com', 'emma321', '2005-01-30', 'Enjoys relaxing simulation games.'),
('joshgaming', 'josh@example.com', 'josh654', '2004-09-17', 'Huge fan of multiplayer and strategy games.');


INSERT INTO WISHLIST (user_id, game_id)
VALUES
(1, 3),
(1, 5),
(2, 1),
(3, 4),
(4, 2);

INSERT INTO PREVIOUSLY_PLAYED (user_id, game_id)
VALUES
(1, 2),
(1, 4),
(2, 1),
(3, 5),
(4, 3);

INSERT INTO TROPHIES (game_id, name, description)
VALUES
(1, 'Master Explorer', 'Discover every region on the map.'),
(1, 'First Victory', 'Win your first match.'),
(2, 'Collector', 'Unlock 100 unique items.'),
(3, 'Speed Runner', 'Complete the game in under 3 hours.'),
(4, 'Sharpshooter', 'Achieve 80% accuracy in a match.');

INSERT INTO REGIONS (name)
VALUES
('North America'),
('Europe'),
('Asia'),
('South America'),
('Oceania');

INSERT INTO GAME_REGIONS (game_id, region_id, is_available)
VALUES
(1, 1, TRUE),
(1, 2, TRUE),
(2, 3, FALSE),
(3, 2, TRUE),
(4, 5, TRUE);

INSERT INTO FRIENDS (user_id, friend_id) VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 4),
(2, 6),
(3, 4),
(3, 7),
(4, 5),
(5, 6),
(6, 7);

INSERT INTO MESSAGES (sender_id, reciever_id, message) VALUES
(1, 2, 'Hey, have you played Stardew Valley yet?'),
(2, 1, 'Yeah, it is really relaxing!'),
(3, 5, 'Want to join our Minecraft server later?'),
(5, 3, 'Sure, send me the IP address.'),
(4, 6, 'Did you finish the Elden Ring boss fight?'),
(6, 4, 'Finally did after like 20 tries.'),
(7, 1, 'What game are you buying next?'),
(1, 7, 'Probably Hollow Knight Silksong if it releases soon.'),
(2, 8, 'You were insane in that match yesterday.'),
(8, 2, 'Thanks bro, my aim was actually good for once.');

INSERT INTO TAGS (name) VALUES
('RPG'),
('Adventure'),
('Open World'),
('Multiplayer'),
('Survival'),
('Sandbox'),
('Shooter'),
('Puzzle'),
('Horror'),
('Strategy');

INSERT INTO GAME_TAGS (game_id, tag_id) VALUES
(1, 1),
(1, 2),
(1, 5),

(2, 3),
(2, 4),
(2, 7),

(3, 1),
(3, 3),
(3, 10),

(4, 2),
(4, 8),

(5, 5),
(5, 6),
(5, 9);

INSERT INTO STREAMER_POPULARITY (game_id, streamer_count) VALUES
(1, 12500),
(2, 48200),
(3, 26750),
(4, 8900),
(5, 15400);

INSERT INTO STORES (id, name) VALUES
(1, 'Steam'),
(2, 'Epic Games Store'),
(3, 'PlayStation Store'),
(4, 'Xbox Store'),
(5, 'Nintendo eShop'),
(6, 'GOG'),
(7, 'Origin'),
(8, 'Battle.net');

INSERT INTO GAME_STORES (game_id, store_id, purchase_link)
VALUES
(1, 1, 'https://store.example.com/minecraft'),
(1, 2, 'https://gameshop.example.com/minecraft'),
(2, 1, 'https://store.example.com/fifa'),
(3, 3, 'https://steam.example.com/stardewvalley'),
(4, 2, 'https://gameshop.example.com/cod');