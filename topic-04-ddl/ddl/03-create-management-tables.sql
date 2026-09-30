CREATE TYPE membership_status AS ENUM ('Active', 'Expired', 'Suspended', 'Cancelled');

CREATE TABLE Staff (
    id integer PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    title varchar(20) NOT NULL
);

CREATE TABLE FrontdeskShifts (
    id integer PRIMARY KEY,
    staff_id integer NOT NULL,
    shift_start timestamp NOT NULL,
    shift_end timestamp NOT NULL
);

CREATE TABLE MembershipPlans (
    id integer PRIMARY KEY,
    name varchar(20) NOT NULL,
    type varchar(20) NOT NULL,
    price decimal(10,2) NOT NULL,
    discount decimal(10,2) DEFAULT 0 NOT NULL
);

CREATE TABLE ClientMemberships (
    id integer PRIMARY KEY,
    member_id integer NOT NULL,
    plan_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status membership_status DEFAULT 'Active' NOT NULL
);

CREATE TABLE ClassSchedule (
    id integer PRIMARY KEY,
    class_id integer NOT NULL,
    room_id integer NOT NULL,
    trainer_id integer NOT NULL,
    class_date timestamp NOT NULL,
    duration integer NOT NULL CHECK( duration > 0),

    duration_unit VARCHAR(10) GENERATED ALWAYS AS ('Minutes') STORED
);

CREATE TABLE ClassRegistrations (
    schedule_id integer NOT NULL,
    member_id integer NOT NULL,

    PRIMARY KEY (schedule_id, member_id)
);
