-- Drop tables first to avoid dependency errors
DROP TABLE IF EXISTS specialization CASCADE;
DROP TABLE IF EXISTS trainer_specialization CASCADE;
DROP TABLE IF EXISTS trainer CASCADE;
DROP TABLE IF EXISTS trainer_availability CASCADE;
DROP TABLE IF EXISTS class CASCADE;
DROP TABLE IF EXISTS trainer_class CASCADE;
DROP TABLE IF EXISTS personal_training CASCADE;

-- Drop custom enum types
DROP TYPE IF EXISTS training_status_enum;
DROP TYPE IF EXISTS class_level_enum;
DROP TYPE IF EXISTS trainer_status_enum;
