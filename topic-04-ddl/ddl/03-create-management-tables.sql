CREATE TYPE membership_status_enum AS ENUM ('Active', 'Expired', 'Suspended', 'Cancelled');

CREATE TABLE public.staff (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    title VARCHAR(20) NOT NULL
);

CREATE TABLE public.frontdesk_shifts (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    staff_id INTEGER NOT NULL,
    shift_start timestamp NOT NULL,
    shift_end timestamp NOT NULL
);

CREATE TABLE public.membership_plans (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    type VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0 NOT NULL
);

CREATE TABLE public.client_memberships (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INTEGER NOT NULL,
    plan_id INTEGER NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status membership_status_enum DEFAULT 'Active' NOT NULL
);

CREATE TABLE public.class_schedule (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    class_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    trainer_id INTEGER NOT NULL,
    class_date timestamp NOT NULL,
    duration INTEGER NOT NULL CHECK( duration > 0),

    duration_unit VARCHAR(10) GENERATED ALWAYS AS ('Minutes') STORED
);

CREATE TABLE public.class_registrations (
    schedule_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,

    PRIMARY KEY (schedule_id, member_id)
);
