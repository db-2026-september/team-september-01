-- PostgreSQL script
-- Enums
CREATE TYPE trainer_status_enum AS ENUM ('Active', 'Inactive', 'On-Leave');
CREATE TYPE class_level_enum AS ENUM ('Beginner', 'Intermediate', 'Advanced');
CREATE TYPE training_status_enum AS ENUM ('Scheduled', 'In Progress', 'Completed', 'Cancelled');

-- Tables
CREATE TABLE public.specialization (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE public.trainer_specialization (
    trainer_id INTEGER NOT NULL,
    specialization_id INTEGER NOT NULL,
    certification_date DATE NOT NULL,
    certificate_number VARCHAR(8) NOT NULL UNIQUE,

    PRIMARY KEY (trainer_id, specialization_id)
);

CREATE TABLE public.trainer (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    status trainer_status_enum NOT NULL DEFAULT 'Active'
);

CREATE TABLE public.trainer_availability (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trainer_id INTEGER NOT NULL,
    availability_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

CREATE TABLE public.class (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    class_name VARCHAR(10) NOT NULL,
    description VARCHAR(30),
    level class_level_enum NOT NULL DEFAULT 'Beginner',
    capacity INTEGER NOT NULL CHECK (capacity > 0),
    duration INTEGER NOT NULL
);

CREATE TABLE public.trainer_class (
    trainer_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL,
    assigned_date DATE NOT NULL,
    approved boolean NOT NULL DEFAULT false,
    approved_by INTEGER,
    approved_at TIMESTAMP,

    PRIMARY KEY (trainer_id, class_id)
);

CREATE TABLE public.personal_training (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trainer_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    scheduled_start TIMESTAMP NOT NULL,
    scheduled_end TIMESTAMP NOT NULL,
    actual_start TIMESTAMP,
    actual_end TIMESTAMP,
    status training_status_enum NOT NULL DEFAULT 'Scheduled',
    notes VARCHAR(30)
);
