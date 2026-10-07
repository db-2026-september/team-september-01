-- PostgreSQL script
DROP TABLE IF EXISTS public.fitness_floor CASCADE;
DROP TABLE IF EXISTS public.fitness_room CASCADE;
DROP TABLE IF EXISTS public.equipment CASCADE;
DROP TABLE IF EXISTS public.equipment_status CASCADE;
DROP TABLE IF EXISTS public.room_equipment CASCADE;
DROP TABLE IF EXISTS public.cleaning_schedule CASCADE;
DROP TABLE IF EXISTS public.maintenance_schedule CASCADE;
DROP TYPE IF EXISTS equipment_status_enum;
DROP TYPE IF EXISTS common_status_enum;
