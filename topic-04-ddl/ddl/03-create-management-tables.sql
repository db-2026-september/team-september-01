CREATE TYPE membership_status_enum AS ENUM ('Active', 'Expired', 'Suspended', 'Cancelled');
CREATE TYPE class_status_enum AS ENUM ('Scheduled', 'In Progress', 'Completed', 'Cancelled');
CREATE TYPE membership_plan_enum AS ENUM ('Premium Monthly', 'Premium Annual', 'Standard Monthly', 'Standard Annual');
CREATE TYPE membership_type_enum AS ENUM ('Premium', 'Standard');


CREATE TABLE public.staff (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    title VARCHAR(20) NOT NULL
);

CREATE TABLE public.frontdesk_shifts (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    staff_id INTEGER NOT NULL,
    shift_start TIMESTAMP NOT NULL,
    shift_end TIMESTAMP NOT NULL
);

CREATE TABLE public.membership_plans (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name membership_plan_enum NOT NULL DEFAULT 'Standard Monthly',
    type membership_type_enum NOT NULL DEFAULT 'Standard',
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    discount INTEGER DEFAULT 0 NOT NULL CHECK (discount BETWEEN 0 AND 100)
);

CREATE TABLE public.client_memberships (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INTEGER NOT NULL,
    plan_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status membership_status_enum DEFAULT 'Active' NOT NULL
);

CREATE TABLE public.class_schedule (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    class_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    trainer_id INTEGER NOT NULL,
    scheduled_start TIMESTAMP NOT NULL,
    scheduled_end TIMESTAMP NOT NULL,
    actual_start TIMESTAMP,
    actual_end TIMESTAMP,
    status class_status_enum DEFAULT 'Scheduled' NOT NULL
);

CREATE TABLE public.class_registrations (
    schedule_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,

    PRIMARY KEY (schedule_id, member_id)
);
