BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "goal" DROP COLUMN "days";
ALTER TABLE "goal" ADD COLUMN "days" json;

--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240801150317439', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240801150317439', "timestamp" = now();

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
