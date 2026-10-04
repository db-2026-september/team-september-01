-- PostgreSQL script
-- Set references as foreign keys

ALTER TABLE public.fitness_room
ADD CONSTRAINT fk_fitness_room_floor
FOREIGN KEY (floor_number)
REFERENCES public.fitness_floor(floor_number);

ALTER TABLE public.room_equipment
ADD CONSTRAINT fk_room_equipment_fitness_room
FOREIGN KEY (room_id)
REFERENCES public.fitness_room(room_id);

ALTER TABLE public.room_equipment
ADD CONSTRAINT fk_room_equipment_equipment_item
FOREIGN KEY (equipment_item_id)
REFERENCES public.equipment_item(id);

ALTER TABLE public.cleaning_schedule
ADD CONSTRAINT fk_cleaning_schedule_fitness_room
FOREIGN KEY (room_id)
REFERENCES public.fitness_room(room_id);

ALTER TABLE public.equipment_item
ADD CONSTRAINT fk_equipment_item_equipment
FOREIGN KEY (equipment_id)
REFERENCES public.equipment(id);

ALTER TABLE public.equipment_item
ADD CONSTRAINT fk_equipment_item_equipment_status
FOREIGN KEY (status_id)
REFERENCES public.equipment_status(id);

ALTER TABLE public.maintenance_schedule
ADD CONSTRAINT fk_maintenance_schedule_equipment
FOREIGN KEY (equipment_item_id)
REFERENCES public.equipment_item(id);
