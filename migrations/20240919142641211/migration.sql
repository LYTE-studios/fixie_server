BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "fixie_user" DROP COLUMN "locale";
--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_locales" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "locale" text
);


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240919142641211', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240919142641211', "timestamp" = now();

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
