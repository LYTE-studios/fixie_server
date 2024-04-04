BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "goal" ALTER COLUMN "picture" DROP NOT NULL;
ALTER TABLE "goal" ALTER COLUMN "days" DROP NOT NULL;

--
-- MIGRATION VERSION FOR fixie
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fixie', '20240404124127909', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240404124127909', "timestamp" = now();

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
