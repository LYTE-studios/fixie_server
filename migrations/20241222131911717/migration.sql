BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_theme" (
    "id" bigserial PRIMARY KEY,
    "validFrom" timestamp without time zone NOT NULL,
    "validUntil" timestamp without time zone NOT NULL,
    "disabled" boolean,
    "primaryColor" text,
    "mainGradientFirstColor" text,
    "mainGradientSecondColor" text,
    "backgroundColor" text
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "category" ADD COLUMN "presetId" bigint;

--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20241222131911717', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241222131911717', "timestamp" = now();

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
