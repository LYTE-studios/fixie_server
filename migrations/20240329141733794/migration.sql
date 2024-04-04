BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "goal" (
    "id" serial PRIMARY KEY,
    "title" text NOT NULL,
    "picture" text NOT NULL,
    "target" integer NOT NULL,
    "targetPeriod" integer NOT NULL,
    "category" text NOT NULL,
    "repetition" text NOT NULL,
    "days" json NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" ADD COLUMN "goals" json;

--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240329141733794', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240329141733794', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240115074239642', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074239642', "timestamp" = now();


COMMIT;
