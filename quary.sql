create table users
(
    id           int auto_increment      primary key,
    lastName     varchar(100)            not null,
    firstName    varchar(100) default '' not null,
    emailAddress varchar(100)            not null,
    password     varchar(100)            not null,
    passwordConfirm     varchar(100)        not null,
    constraint users_emailAddress_uindex
        unique (emailAddress),
    constraint users_lastName_uindex
        unique (lastName)
)    charset = utf8;

INSERT INTO users (lastName,firstName, emailAddress, password, passwordConfirm)
VALUES
("admin", "admin", "admin@admin.com", "admin", "admin"),
("bajurus", "bajurus", "bajurus@bajurus.com", "bajurus", "bajurus"),
("holy", "holy", "holy@holy.com", "holy", "holy"),
("Pushkin", "Pushken", "Pushken@gmail.com", "Pukin", "Pukin"),
("Jew", "Evrei", "Jewforever@gmail.com", "vsemaxaxa", "vsemaxaxa"),
("Taekitoru", "Kitamura", "toxa@gmail.com", "anton", "anton"),
("Dexter", "Dexter", "Dexter@gmail.com", "vietnammoyazhizn", "vietnammoyazhizn"),
("Vova", "Technichan", "Skitls@gmail.com", "yatepervova", "yatepervova"),
("Gossamery", "Gossy", "gossamery@gmail.com", "firemeetgossaline", "firemeetgossaline"),
("Qudie", "Cutie", "qudie@gmail.com", "hiudie", "hiudie"),
("Marlon", "Zanuda", "Marlon@gmail.com", "Hatersgonnahate", "Hatersgonnahate");

SELECT *
FROM users;

drop table users;


create table games
(
    id          int auto_increment      primary key,
    name        varchar(100)            not null,
    description varchar(100)            not null,
    rating      int                     not null,
    author      varchar(100)            not null,
    awards      varchar(100) default '' not null,
    constraint games_name_uindex
        unique (name)
)   charset = utf8;

INSERT INTO games (name, description, rating, author, awards)
VALUES
("Chess", "It is top game in the world", 9, "GrumpyFox", "Игра года"),
("Monopoly", "It is economycal game", 7, "GrumpyFox", "Лучшая семейная игра"),
("Snake", "It is indy game", 3, "Gamos", ""),
("Packman", "It is packman", 4, "‎Namco", ""),
("Fireboy & Watergirl", "It is F&W", 6, "‪EngleSoft‬", "Лучшая семейная игра"),
("Fireboy & Watergirl 2", "It is F&W", 4, "‪EngleSoft‬", ""),
("Fireboy & Watergirl: Treasure Hunt", "It is F&W", 4, "‪EngleSoft‬", ""),
("Fireboy & Watergirl 3", "It is F&W", 4, "‪EngleSoft‬", ""),
("Fireboy & Watergirl 4", "It is F&W", 5, "‪EngleSoft‬", ""),
("RAID: Shadow Legends", "It is RAID", 6, "‎Plarium", "Лучшая мобильная игра");

SELECT *
FROM games;

drop table games;


