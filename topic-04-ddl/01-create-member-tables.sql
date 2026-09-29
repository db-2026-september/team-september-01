DROP TABLE IF EXISTS "PersonalProgress";
DROP TABLE IF EXISTS "Goals";
DROP TABLE IF EXISTS "Attendance";
DROP TABLE IF EXISTS "Member";
DROP TABLE IF EXISTS "MetricType";
DROP TABLE IF EXISTS "MemberExperience";


CREATE TABLE "MemberExperience"
(
    "id"    SERIAL PRIMARY KEY,
    "level" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE "MetricType"
(
    "id"          SERIAL PRIMARY KEY,
    "metric_name" VARCHAR(50) NOT NULL UNIQUE,
    "unit"        VARCHAR(20) NOT NULL
);


CREATE TABLE "Member"
(
    "id"            SERIAL PRIMARY KEY,
    "first_name"    VARCHAR(50) NOT NULL,
    "last_name"     VARCHAR(50) NOT NULL,
    "experience_id" INT         NOT NULL,
    CONSTRAINT "fk_member_experience"
        FOREIGN KEY ("experience_id")
            REFERENCES "MemberExperience" ("id")
            ON DELETE RESTRICT
);


CREATE TABLE "Attendance"
(
    "id"              SERIAL PRIMARY KEY,
    "member_id"       INT       NOT NULL,
    "attendance_date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_attendance_member"
        FOREIGN KEY ("member_id")
            REFERENCES "Member" ("id")
            ON DELETE RESTRICT
);

CREATE TABLE "Goals"
(
    "id"               SERIAL PRIMARY KEY,
    "member_id"        INT NOT NULL,
    "goal_description" VARCHAR(255),
    "target_date"      DATE,
    CONSTRAINT "fk_goals_member"
        FOREIGN KEY ("member_id")
            REFERENCES "Member" ("id")
            ON DELETE RESTRICT
);

CREATE TABLE "PersonalProgress"
(
    "id"             SERIAL PRIMARY KEY,
    "member_id"      INT            NOT NULL,
    "metric_type_id" INT            NOT NULL,
    "metric_value"   DECIMAL(10, 2) NOT NULL,
    "notes"          TEXT,
    "progress_date"  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_personal_progress_member"
        FOREIGN KEY ("member_id")
            REFERENCES "Member" ("id")
            ON DELETE RESTRICT,
    CONSTRAINT "fk_personal_progress_metric_type"
        FOREIGN KEY ("metric_type_id")
            REFERENCES "MetricType" ("id")
            ON DELETE RESTRICT
);

CREATE INDEX "idx_member_experience_id" ON "Member" ("experience_id");
CREATE INDEX "idx_attendance_member_id" ON "Attendance" ("member_id");
CREATE INDEX "idx_goals_member_id" ON "Goals" ("member_id");
CREATE INDEX "idx_personal_progress_member_id" ON "PersonalProgress" ("member_id");
CREATE INDEX "idx_personal_progress_metric_type_id" ON "PersonalProgress" ("metric_type_id");