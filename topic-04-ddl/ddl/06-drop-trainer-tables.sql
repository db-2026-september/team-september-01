-- PostgreSQL script
DROP TABLE IF EXISTS public.trainer CASCADE;
DROP TABLE IF EXISTS public.trainer_availability CASCADE;
DROP TABLE IF EXISTS public.class CASCADE;
DROP TABLE IF EXISTS public.trainer_class CASCADE;
DROP TABLE IF EXISTS public.personal_training CASCADE;
DROP TABLE IF EXISTS public.class_registrations CASCADE;
DROP TYPE IF EXISTS trainer_status_enum;
DROP TYPE IF EXISTS class_level_enum;
DROP TYPE IF EXISTS training_status_enum;
