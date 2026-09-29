-- =============================================================================
-- Migration: 01-create-member-tables.sql
-- Module: Member Management
-- Author: Sofia Hrebeniuk
-- Target DB: PostgreSQL 14+ / Supabase
-- Description: DDL script for Member module entities, relations, and indexes.
-- =============================================================================

-- =============================================================================
-- 1. CLEANUP (Idempotency)
-- =============================================================================
DROP TABLE IF EXISTS attendance CASCADE;
DROP TABLE IF EXISTS goals CASCADE;
DROP TABLE IF EXISTS personal_progress CASCADE;
DROP TABLE IF EXISTS member CASCADE;
DROP TABLE IF EXISTS member_status CASCADE;
DROP TABLE IF EXISTS member_experience CASCADE;

DROP TYPE IF EXISTS member_status_enum CASCADE;
DROP TYPE IF EXISTS experience_level_enum CASCADE;

-- -----------------------------------------------------------------------------
-- 2. ENUMS (Справочники для статусов и уровня опыта)
-- -----------------------------------------------------------------------------
CREATE TYPE member_status_enum AS ENUM (
    'active',
    'on_pause',
    'inactive',
    'suspended'
);

CREATE TYPE experience_level_enum AS ENUM (
    'newbie',
    'experienced',
    'professional'
);

-- -----------------------------------------------------------------------------
-- 3. TABLES CREATION
-- -----------------------------------------------------------------------------

-- Core Member Table
CREATE TABLE member (
                        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                        first_name VARCHAR(50) NOT NULL,
                        last_name VARCHAR(50) NOT NULL,
                        status member_status_enum NOT NULL DEFAULT 'active',
                        experience_level experience_level_enum NOT NULL DEFAULT 'newbie',

);

-- Attendance Tracking Table
CREATE TABLE attendance (
                            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                            member_id UUID NOT NULL,
                            date DATE NOT NULL DEFAULT CURRENT_DATE,
                            time TIME NOT NULL DEFAULT CURRENT_TIME,

                            CONSTRAINT fk_attendance_member
                                FOREIGN KEY (member_id)
                                    REFERENCES member(id)
                                    ON DELETE CASCADE
);

-- Fitness Goals Table
CREATE TABLE goals (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       member_id UUID NOT NULL,
                       goal_description TEXT NOT NULL,
                       target_date DATE NOT NULL,
                       is_completed BOOLEAN NOT NULL DEFAULT false,


                       CONSTRAINT fk_goals_member
                           FOREIGN KEY (member_id)
                               REFERENCES member(id)
                               ON DELETE CASCADE,

                       CONSTRAINT chk_target_date_future
                           CHECK (target_date >= CURRENT_DATE)
);

-- Personal Athletic Progress Table
CREATE TABLE personal_progress (
                                   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                   member_id UUID NOT NULL,
                                   metrics TEXT NOT NULL,


                                   CONSTRAINT fk_progress_member
                                       FOREIGN KEY (member_id)
                                           REFERENCES member(id)
                                           ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------
-- 4. INDEXES
-- -----------------------------------------------------------------------------
CREATE INDEX idx_attendance_member_id ON attendance(member_id);
CREATE INDEX idx_goals_member_id ON goals(member_id);
CREATE INDEX idx_personal_progress_member_id ON personal_progress(member_id);

-- -----------------------------------------------------------------------------
-- 5. COMMENTS
-- -----------------------------------------------------------------------------
COMMENT ON TABLE member IS 'Core entity storing general info and status for gym members';
COMMENT ON TABLE attendance IS 'Logs of member check-ins and visits';
COMMENT ON TABLE goals IS 'Target goals set by members with deadline tracking';
COMMENT ON TABLE personal_progress IS 'Tracks member fitness progress and athletic metrics over time';