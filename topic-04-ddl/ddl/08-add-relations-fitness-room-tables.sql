-- PostgreSQL script
-- Set references as foreign keys

ALTER TABLE fitness_center.FitnessRoom
ADD CONSTRAINT fk_fitness_room_floor
FOREIGN KEY (floor_number);
REFERENCES fitness_center.FitnessFloor(floor_number);

ALTER TABLE fitness_center.RoomEquipment
ADD CONSTRAINT fk_room_equipment_fitness_room
FOREIGN KEY (room_id);
REFERENCES fitness_center.FitnessRoom(room_id);

ALTER TABLE fitness_center.RoomEquipment
ADD CONSTRAINT fk_room_equipment_equipment
FOREIGN KEY (equipment_id);
REFERENCES fitness_center.Equipment(id);

ALTER TABLE fitness_center.CleaningSchedule
ADD CONSTRAINT fk_cleaning_schedule_fitness_room
FOREIGN KEY (room_id);
REFERENCES fitness_center.FitnessRoom(room_id);

ALTER TABLE fitness_center.Equipment
ADD CONSTRAINT fk_equipment_equipment_status
FOREIGN KEY (status_id);
REFERENCES fitness_center.EquipmentStatus(id);

ALTER TABLE fitness_center.MaintenanceSchedule
ADD CONSTRAINT fk_maintenance_schedule_equipment
FOREIGN KEY (equipment_id);
REFERENCES fitness_center.Equipment(id);
