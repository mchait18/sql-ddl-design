-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kQKlMU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Region" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Post" (
    "ID" int   NOT NULL,
    "title" string   NOT NULL,
    "text" string   NOT NULL,
    "user_id" int   NOT NULL,
    "location" string   NOT NULL,
    "region_id" int   NOT NULL,
    "cat_id" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Category" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Users" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "password" string   NOT NULL,
    "preferred_region" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("ID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("ID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_cat_id" FOREIGN KEY("cat_id")
REFERENCES "Category" ("ID");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_preferred_region" FOREIGN KEY("preferred_region")
REFERENCES "Region" ("ID");

