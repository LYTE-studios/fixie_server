BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "goal" DROP COLUMN "targetPeriod";
ALTER TABLE "goal" DROP COLUMN "repetition";
ALTER TABLE "goal" DROP COLUMN "days";
ALTER TABLE "goal" DROP COLUMN "setEnd";
--
-- ACTION CREATE TABLE
--
CREATE TABLE "repeatable_days" (
    "id" bigserial PRIMARY KEY,
    "day" bigint NOT NULL,
    "extraInfo" text,
    "_goalDaysGoalId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "repeatable_days"
    ADD CONSTRAINT "repeatable_days_fk_0"
    FOREIGN KEY("_goalDaysGoalId")
    REFERENCES "goal"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240802105303247', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240802105303247', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
