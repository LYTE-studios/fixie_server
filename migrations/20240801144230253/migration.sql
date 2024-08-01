BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "fixie_user" ADD COLUMN "highestStreak" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "goal" ADD COLUMN "currentStreak" bigint;
ALTER TABLE "goal" ADD COLUMN "highestStreak" bigint;
ALTER TABLE "goal" ADD COLUMN "unit" text;
--
-- ACTION DROP TABLE
--
DROP TABLE "journal_log" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "journal_log" (
    "id" bigserial PRIMARY KEY,
    "goalId" bigint NOT NULL,
    "text" text NOT NULL,
    "picture" text,
    "loggedValue" double precision,
    "createdAt" timestamp without time zone NOT NULL,
    "modifiedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "journal_log"
    ADD CONSTRAINT "journal_log_fk_0"
    FOREIGN KEY("goalId")
    REFERENCES "goal"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240801144230253', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240801144230253', "timestamp" = now();

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
