-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kQKlMU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Team" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "city" string   NOT NULL,
    "Ranking" int   NOT NULL,
    CONSTRAINT "pk_Team" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Goals" (
    "ID" int   NOT NULL,
    "Match_id" int   NOT NULL,
    "player" string   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Players" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Matches" (
    "ID" int   NOT NULL,
    "mdate" date   NOT NULL,
    "stadium" string   NOT NULL,
    "team1" int   NOT NULL,
    "team2" int   NOT NULL,
    "ref_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Referees" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "League" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_League" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Season" (
    "ID" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Team" ADD CONSTRAINT "fk_Team_ID" FOREIGN KEY("ID")
REFERENCES "Matches" ("team1");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_Match_id" FOREIGN KEY("Match_id")
REFERENCES "Matches" ("ID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_ID" FOREIGN KEY("ID")
REFERENCES "Goals" ("player");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Team" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team2" FOREIGN KEY("team2")
REFERENCES "Team" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_ref_id" FOREIGN KEY("ref_id")
REFERENCES "Referees" ("ID");

ALTER TABLE "League" ADD CONSTRAINT "fk_League_team_id" FOREIGN KEY("team_id")
REFERENCES "Team" ("ID");

ALTER TABLE "Season" ADD CONSTRAINT "fk_Season_ID" FOREIGN KEY("ID")
REFERENCES "Matches" ("season_id");

