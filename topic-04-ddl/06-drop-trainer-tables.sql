-- Drop tables first to avoid dependency errors
DROP TABLE IF EXISTS PersonalTraining CASCADE;
DROP TABLE IF EXISTS TrainerClass CASCADE;
DROP TABLE IF EXISTS Class CASCADE;
DROP TABLE IF EXISTS TrainerAvailability CASCADE;
DROP TABLE IF EXISTS Trainer CASCADE;

-- Drop custom enum types
DROP TYPE IF EXISTS training_status;
DROP TYPE IF EXISTS class_level;
DROP TYPE IF EXISTS trainer_status;