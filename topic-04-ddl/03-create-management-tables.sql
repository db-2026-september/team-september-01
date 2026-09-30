CREATE TABLE IF NOT EXISTS staff (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS frontdesk_shifts (
    id BIGSERIAL PRIMARY KEY,
    staff_id BIGINT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
);

CREATE TABLE IF NOT EXISTS membership_plans (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    discount NUMERIC(10, 2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS client_memberships (
    id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL,
    plan_id BIGINT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Active',
);

CREATE TABLE IF NOT EXISTS class_schedule (
    id BIGSERIAL PRIMARY KEY,
    class_id BIGINT,
    trainer_id BIGINT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS class_registrations (
    id BIGSERIAL PRIMARY KEY,
    schedule_id BIGINT,
    member_id BIGINT NOT NULL,
);
