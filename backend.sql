CREATE DATABASE tikku;

CREATE TABLE "users" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "picture"       VARCHAR(255),
    "firstName"     VARCHAR(255),
    "lastName"      VARCHAR(255),
    "phoneNumber"   VARCHAR(255),
    "email"         VARCHAR(255),
    "password"      VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "resetPassword" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "email"         VARCHAR(255),
    "userId"        INT,
    "code"          VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "movies" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "title"         VARCHAR(255),
    "picture"       VARCHAR(255),
    "releaseDate"   TIMESTAMPTZ,
    "director"      VARCHAR(255),
    "duration"      TIME,
    "synopsis"      TEXT,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "genre" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name"          VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "movieGenre" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "movieId"       INT,
    "genreId"       INT,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "casts" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name"          VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "movieCasts" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "movieId"       INT,
    "castId"        INT,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "cinemas" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "picture"       VARCHAR(255),
    "name"          VARCHAR(255),
    "address"       VARCHAR(255),
    "city"          VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "movieSchedules" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "movieId"       INT,
    "cinemaId"      INT,
    "price"         BIGINT,
    "startDate"     DATE,
    "endDate"       DATE,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "movieSchedulesTimes" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "time"          TIME,
    "movieScheduleId"   INT,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "status" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name"          VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "transactions" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "bookingDate"   TIMESTAMPTZ,
    "movieId"       INT,
    "cinemaId"      INT,
    "movieScheduleID"   INT,
    "fullName"      VARCHAR(255),
    "email"         VARCHAR(255),
    "phoneNumber"   VARCHAR(255),
    "statusId"      INT,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "reservedSeat" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "seatNum"       VARCHAR(255),
    "transactionId" INT,
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

CREATE TABLE "paymentMethod" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "picture"       VARCHAR(255),
    "name"          VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
)  ;

CREATE TABLE "subscribers" (
    "id"            INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "email"         VARCHAR(255),
    "createdAt"     TIMESTAMPTZ DEFAULT now(),
    "updatedAt"     TIMESTAMPTZ
);

---INSERT DATA---

INSERT INTO "users" ("picture","firstName","lastName","phoneNumber","email","password") VALUES ('', 'John', 'Doe', '00112233', 'john@gmail.com', 'john123');

INSERT INTO "resetPassword" ("email", "userId", "code") VALUES ('john@gmail.com','2', 'secret');

INSERT INTO "movies" ("title","picture","releaseDate","director","duration","synopsis") VALUES ('John Wick', 'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_SX300.jpg', '24 October 2014', 'Chad Stahelski', '01:41:00', 'An ex-hitman comes out of retirement to track down the gangsters that killed his dog, the last gift he got from his deceased wife.'),
('Harry Potter and the Deathly Hallows: Part 2', 'https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg', '24 October 2014', 'David Yates', '02:10:00', 'Harry, Ron and Hermione race against time to destroy the remaining Horcruxes. Meanwhile, students and teachers unite to defend Hogwarts against Lord Voldemort and his minions. Others are also searching'),
('Spider-Man: Homecoming', 'https://m.media-amazon.com/images/M/MV5BNTk4ODQ1MzgzNl5BMl5BanBnXkFtZTgwMTMyMzM4MTI@._V1_SX300.jpg', '2017-07-07 00:00:00-07', 'Jon Watts', '02:13:00', 'Peter Parker tries to balance his two very contradictory lives - stopping Adrian Toomes\'s sale of Chitauri weapons and living his days like a high school student.');

INSERT INTO "genre" ("name") VALUES ('Adventure');

INSERT INTO "movieGenre" ("movieId", "genreId") VALUES (1,1);

INSERT INTO "casts" ("name") VALUES ('Keanu Reeves');

INSERT INTO "movieGenre" ("movieId", "castsId") VALUES (1,1);

INSERT INTO "cinemas" ("picture","name","address","city") VALUES ('', 'ebv.id', 'Whatever street No.12, South Purwokerto', 'Palembang');

INSERT INTO "movieSchedules" ("movieId", "cinemaId", "price", "startDate", "endDate") VALUES (1,1, 40000, '11-11-2022', '11-20-2022');

INSERT INTO "movieSchedulesTimes" ("time","movieScheduleId") VALUES ('01:40:00', 3);

INSERT INTO "status" ("name") VALUES ('Active');

INSERT INTO "transactions" ("bookingDate", "movieId", "cinemaId", "movieScheduleID", "fullName", "email", "phoneNumber", "statusId") VALUES ('2022-11-13 11:13:52', 1, 1, 3, 'John Doe', 'john@gmail.com', '00112233', 1);

INSERT INTO "reservedSeat" ("seatNum", "transactionId") VALUES ('A5,A6', 1);

INSERT INTO "paymentMethod" ("picture", "name") VALUES ('', 'gopay');

INSERT INTO "subscribers" ("email") VALUES ('john@gmail.com');

ALTER TABLE "users" ADD CONSTRAINT "email" UNIQUE ("email");
ALTER TABLE "movies" ADD CONSTRAINT "title" UNIQUE ("title");
ALTER TABLE "genre" ADD CONSTRAINT "genreName" UNIQUE ("name");
ALTER TABLE "casts" ADD CONSTRAINT "castsName" UNIQUE ("name");
ALTER TABLE "cinemas" ADD CONSTRAINT "cinemaName" UNIQUE ("name");
ALTER TABLE "users" ADD CONSTRAINT "phoneNumber" UNIQUE ("phoneNumber");
ALTER TABLE "transactions" DROP CONSTRAINT "t.phoneNumber";
ALTER TABLE "transactions" DROP CONSTRAINT "t.email";

ALTER TABLE "resetPassword" ADD CONSTRAINT "fk_userId" FOREIGN KEY ("userId") REFERENCES users
(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieGenre" ADD CONSTRAINT "fk_movieId" FOREIGN KEY ("movieId") REFERENCES movies
(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieGenre" ADD CONSTRAINT "fk_genreId" FOREIGN KEY ("genreId") REFERENCES genre (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieCasts" ADD CONSTRAINT "fk_movieId" FOREIGN KEY ("movieId") REFERENCES movies
(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieCasts" ADD CONSTRAINT "fk_castId" FOREIGN KEY ("castsId") REFERENCES casts (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieSchedules" ADD CONSTRAINT "fk_movieId" FOREIGN KEY ("movieId") REFERENCES movies (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieSchedules" ADD CONSTRAINT "fk_cinemaId" FOREIGN KEY ("cinemaId") REFERENCES cinemas (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "movieSchedulesTimes" ADD CONSTRAINT "fk_movieScheduleId" FOREIGN KEY ("movieScheduleId") REFERENCES "movieSchedules" (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "transactions" ADD CONSTRAINT "fk_movieId" FOREIGN KEY ("movieId") REFERENCES movies (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "transactions" ADD CONSTRAINT "fk_cinemaId" FOREIGN KEY ("cinemaId") REFERENCES cinemas (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "transactions" ADD CONSTRAINT "fk_movieScheduleId" FOREIGN KEY ("movieScheduleID") REFERENCES "movieSchedules" (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "transactions" ADD CONSTRAINT "fk_statusId" FOREIGN KEY ("statusId") REFERENCES "status" (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "reservedSeat" ADD CONSTRAINT "fk_transactionId" FOREIGN KEY ("transactionId") REFERENCES "transactions" (id) ON DELETE CASCADE ON UPDATE CASCADE;

SELECT m.title, g.name as genre FROM "movies" m JOIN "movieGenre" mg ON mg."movieId" = m.id JOIN "genre" g ON g.id = mg."genreId";

SELECT m.title, c.name as cast FROM "movies" m JOIN "movieCasts" mc ON mc."movieId" = m.id JOIN "casts" c ON c.id = mc."castsId";

SELECT * FROM "movieSchedules" WHERE '2022-12-06' BETWEEN "startDate" AND "endDate";

SELECT m.* FROM "movieSchedules" ms JOIN "movies" m ON ms."movieId" = m.id WHERE '2022-12-06' BETWEEN "startDate" AND "endDate";

SELECT * FROM "movies" WHERE "releaseDate" >= '2022-11-01' AND "releaseDate" < '2022-12-01';

SELECT * FROM "movies" WHERE title LIKE '%Harry%' AND date_part('year',"releaseDate") = date_part('year', '2022-11-02'::DATE) AND date_part('month',"releaseDate") = date_part('month', '2022-11-02'::DATE) ;


