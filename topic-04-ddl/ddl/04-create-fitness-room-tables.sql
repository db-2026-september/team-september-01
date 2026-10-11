-- PostgreSQL script
-- Enums
CREATE TYPE equipment_status_enum AS ENUM ('Maintained', 'Broken', 'In-Repair');
CREATE TYPE common_status_enum AS ENUM ('Scheduled', 'In Progress', 'Completed');
CREATE TYPE room_type_enum AS ENUM ('Yoga', 'Gym', 'Pool', 'Spinning', 'Pilates', 'Dance', 'Multipurpose');

-- Tables
CREATE TABLE public.fitness_floor (
    floor_number INTEGER PRIMARY KEY,
    floor_name VARCHAR(20) NOT NULL
);

CREATE TABLE public.fitness_room (
    room_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    floor_number INTEGER NOT NULL,
    room_name VARCHAR(20) NOT NULL,
    room_type room_type_enum NOT NULL DEFAULT 'Multipurpose',
    door_number INTEGER NOT NULL UNIQUE,
    max_capacity INTEGER NOT NULL CHECK( max_capacity > 0)
);

CREATE TABLE public.equipment (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE public.equipment_item (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    equipment_id INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    serial_number VARCHAR(8) UNIQUE
);

CREATE TABLE public.equipment_status (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    status equipment_status_enum DEFAULT 'Maintained' NOT NULL UNIQUE
);

CREATE TABLE public.room_equipment (
    room_id INTEGER NOT NULL,
    equipment_item_id  INTEGER NOT NULL,

    PRIMARY KEY(room_id, equipment_item_id)
);

CREATE TABLE public.cleaning_schedule (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_id INTEGER NOT NULL,
    cleaner_id INTEGER NOT NULL,
    status common_status_enum DEFAULT 'Scheduled' NOT NULL,
    cleaning_date TIMESTAMP NOT NULL,
    duration INTEGER NOT NULL CHECK( duration > 0)
);

CREATE TABLE public.maintenance_schedule (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    maintainer_id INTEGER NOT NULL,
    equipment_item_id INTEGER NOT NULL,
    status common_status_enum DEFAULT 'Scheduled' NOT NULL,
    maintenance_date TIMESTAMP  NOT NULL,
    duration INTEGER  NOT NULL CHECK( duration > 0)
);
