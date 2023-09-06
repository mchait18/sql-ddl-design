-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kQKlMU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Doctor" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "Specialty" string   NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Patient" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "insurance" string   NULL,
    "birthday" date   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Vists" (
    "ID" int   NOT NULL,
    "dr_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "appt_date" date   NOT NULL,
    CONSTRAINT "pk_Vists" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Diagnoses" (
    "ID" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "notes" string   NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Disease" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "description" string   NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Vists" ADD CONSTRAINT "fk_Vists_dr_id" FOREIGN KEY("dr_id")
REFERENCES "Doctor" ("ID");

ALTER TABLE "Vists" ADD CONSTRAINT "fk_Vists_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Disease" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Vists" ("ID");

