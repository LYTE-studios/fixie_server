BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "purchase_item" (
    "id" bigserial PRIMARY KEY,
    "benefitIdentifier" text NOT NULL,
    "expiryDate" timestamp without time zone,
    "created" timestamp without time zone,
    "internalInfo" text,
    "userId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "purchase_item"
    ADD CONSTRAINT "purchase_item_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "fixie_user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20241014142210265', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241014142210265', "timestamp" = now();

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
