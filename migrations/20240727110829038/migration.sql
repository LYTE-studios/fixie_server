BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "fixie_user" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "birthday" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "fixie_user" USING btree ("userInfoId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "goal" DROP CONSTRAINT "goal_fk_0";
ALTER TABLE ONLY "goal"
    ADD CONSTRAINT "goal_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "fixie_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "fixie_user"
    ADD CONSTRAINT "fixie_user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240727110829038', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240727110829038', "timestamp" = now();

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
