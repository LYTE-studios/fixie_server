BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "repeatable_days" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "repeatable_days" (
    "id" bigserial PRIMARY KEY,
    "day" bigint NOT NULL,
    "extraInfo" text,
    "goalId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "repeatable_days"
    ADD CONSTRAINT "repeatable_days_fk_0"
    FOREIGN KEY("goalId")
    REFERENCES "goal"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240803131246205', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240803131246205', "timestamp" = now();

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
