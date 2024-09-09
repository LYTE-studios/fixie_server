BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "repeatable_days" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "goal" DROP COLUMN "setRemind";
ALTER TABLE "goal" DROP COLUMN "remindHour";
ALTER TABLE "goal" DROP COLUMN "remindMinutes";
ALTER TABLE "goal" DROP COLUMN "remindHalf";
ALTER TABLE "goal" DROP COLUMN "currentStreak";
ALTER TABLE "goal" ADD COLUMN "repetition" bigint;
ALTER TABLE "goal" ADD COLUMN "repeatEvery" bigint;
ALTER TABLE "goal" ADD COLUMN "weekdays" json;
ALTER TABLE "goal" ADD COLUMN "reminders" json;

--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240909052010285', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240909052010285', "timestamp" = now();

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
