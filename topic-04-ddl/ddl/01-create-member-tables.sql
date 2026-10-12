-- MEMBER MODULE TABLES CREATION
-- Author: Sofia Hrebeniuk

CREATE TYPE public.member_experience_level_enum AS ENUM ('Scheduled', 'Newbie', 'Experienced', 'Professional');

CREATE TABLE public.member_experience
(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    level public.member_experience_level_enum NOT NULL UNIQUE DEFAULT 'Newbie'
);

CREATE TABLE public.metric_type
(
    id          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    metric_name VARCHAR(50) NOT NULL UNIQUE,
    unit        VARCHAR(20) NOT NULL
);

CREATE TABLE public.member
(
    id            INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    experience_id INTEGER     NOT NULL
);

CREATE TABLE public.attendance
(
    id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    registration_id INTEGER     NOT NULL UNIQUE,
    member_id       INTEGER     NOT NULL,
    recorded_at     TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR(20) NOT NULL DEFAULT 'Present'
);

CREATE TABLE public.goals
(
    id               INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id        INTEGER      NOT NULL,
    goal_description VARCHAR(255) NOT NULL,
    target_date      DATE         NOT NULL,
    achieved_date    DATE,
    status           VARCHAR(20)  NOT NULL DEFAULT 'Active'
);

CREATE TABLE public.personal_progress
(
    id             INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id      INTEGER        NOT NULL,
    metric_type_id INTEGER        NOT NULL,
    metric_value   DECIMAL(10, 2) NOT NULL,
    notes          TEXT,
    progress_date  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_member_experience_id ON public.member (experience_id);
CREATE INDEX idx_attendance_member_id ON public.attendance (member_id);
CREATE INDEX idx_goals_member_id ON public.goals (member_id);
CREATE INDEX idx_personal_progress_member_id ON public.personal_progress (member_id);
CREATE INDEX idx_personal_progress_metric_type_id ON public.personal_progress (metric_type_id);