CREATE TABLE member_experience
(
    id    SERIAL PRIMARY KEY,
    level VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE metric_type
(
    id          SERIAL PRIMARY KEY,
    metric_name VARCHAR(50) NOT NULL UNIQUE,
    unit        VARCHAR(20) NOT NULL
);


CREATE TABLE member
(
    id            SERIAL PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    experience_id INT         NOT NULL
);


CREATE TABLE attendance
(
    id              SERIAL PRIMARY KEY,
    member_id       INT       NOT NULL,
    attendance_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE goals
(
    id               SERIAL PRIMARY KEY,
    member_id        INT NOT NULL,
    goal_description VARCHAR(255),
    target_date      DATE
);

CREATE TABLE personal_progress
(
    id             SERIAL PRIMARY KEY,
    member_id      INT            NOT NULL,
    metric_type_id INT            NOT NULL,
    metric_value   DECIMAL(10, 2) NOT NULL,
    notes          TEXT,
    progress_date  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_member_experience_id ON member (experience_id);
CREATE INDEX idx_attendance_member_id ON attendance (member_id);
CREATE INDEX idx_goals_member_id ON goals (member_id);
CREATE INDEX idx_personal_progress_member_id ON personal_progress (member_id);
CREATE INDEX idx_personal_progress_metric_type_id ON personal_progress (metric_type_id);
