BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "goal" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "goal" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "userId" bigint NOT NULL,
    "picture" text,
    "target" bigint NOT NULL,
    "unit" text,
    "categoryId" bigint NOT NULL,
    "end" timestamp without time zone,
    "setRemind" boolean NOT NULL,
    "remindHour" bigint,
    "remindMinutes" bigint,
    "remindHalf" boolean,
    "remindTimezone" text,
    "currentStreak" bigint,
    "highestStreak" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "goal"
    ADD CONSTRAINT "goal_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "fixie_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "goal"
    ADD CONSTRAINT "goal_fk_1"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240802111326645', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240802111326645', "timestamp" = now();

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
