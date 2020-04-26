DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS movie_directors;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS movie_actors;
DROP TABLE IF EXISTS voice_actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS boxoffice;

CREATE TABLE "movies" (
    "movie_id" INT   NOT NULL,
    "income_id" INT   NOT NULL,
    "movie_title" VARCHAR   NOT NULL,
    "duration" VARCHAR   NOT NULL,
    "genre" VARCHAR   NOT NULL,
    "release_date" date   NOT NULL,
    CONSTRAINT "pk_movies" PRIMARY KEY (
        "movie_id"
     )
);

CREATE TABLE "reviews" (
    "review_id" INT   NOT NULL,
    "imdb_rating" FLOAT   NOT NULL,
    "number_of_reviews" INT   NOT NULL,
    "movie_id" INT   NOT NULL,
    CONSTRAINT "pk_reviews" PRIMARY KEY (
        "review_id"
     )
);

CREATE TABLE "movie_directors" (
    "movie_id" INT   NOT NULL,
    "director_id" INT   NOT NULL,
    CONSTRAINT "pk_movie_directors" PRIMARY KEY (
        "movie_id","director_id"
     )
);

CREATE TABLE "boxoffice" (
    "income_id" INT   NOT NULL,
    "gross_income" FLOAT   NOT NULL,
    CONSTRAINT "pk_boxoffice" PRIMARY KEY (
        "income_id"
     )
);

CREATE TABLE "directors" (
    "director_id" INT   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_directors" PRIMARY KEY (
        "director_id"
     )
);

CREATE TABLE "movie_actors" (
    "movie_id" INT   NOT NULL,
    "actor_id" INT   NOT NULL,
    CONSTRAINT "pk_movie_actors" PRIMARY KEY (
        "movie_id","actor_id"
     )
);

CREATE TABLE "voice_actors" (
    "actor_id" INT   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_voice_actors" PRIMARY KEY (
        "actor_id"
     )
);

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_income_id" FOREIGN KEY("income_id")
REFERENCES "boxoffice" ("income_id");

ALTER TABLE "reviews" ADD CONSTRAINT "fk_reviews_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "movie_directors" ADD CONSTRAINT "fk_movie_directors_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "movie_directors" ADD CONSTRAINT "fk_movie_directors_director_id" FOREIGN KEY("director_id")
REFERENCES "directors" ("director_id");

ALTER TABLE "movie_actors" ADD CONSTRAINT "fk_movie_actors_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "movie_actors" ADD CONSTRAINT "fk_movie_actors_actor_id" FOREIGN KEY("actor_id")
REFERENCES "voice_actors" ("actor_id");

