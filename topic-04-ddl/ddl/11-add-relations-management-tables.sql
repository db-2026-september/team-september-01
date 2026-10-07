ALTER TABLE public.frontdesk_shifts
ADD CONSTRAINT fk_frontdesk_shifts_staff
FOREIGN KEY (staff_id) REFERENCES public.staff(id);

ALTER TABLE public.client_memberships
ADD CONSTRAINT fk_client_memberships_plan
FOREIGN KEY (plan_id) REFERENCES public.membership_plans(id);

ALTER TABLE public.class_registrations
ADD CONSTRAINT fk_class_registrations_schedule
FOREIGN KEY (schedule_id) REFERENCES public.class_schedule(id);

ALTER TABLE public.class_schedule
ADD CONSTRAINT fk_class_schedule_class
FOREIGN KEY (class_id) REFERENCES public.class(id);

ALTER TABLE public.class_schedule
ADD CONSTRAINT fk_class_schedule_trainer
FOREIGN KEY (trainer_id) REFERENCES public.trainer(id);

ALTER TABLE public.class_schedule
ADD CONSTRAINT fk_class_schedule_room
FOREIGN KEY (room_id) REFERENCES public.fitness_room(room_id);

ALTER TABLE public.cleaning_schedule
ADD CONSTRAINT fk_cleaning_schedule_cleaner
FOREIGN KEY (cleaner_id) REFERENCES public.staff(id);

ALTER TABLE public.maintenance_schedule
ADD CONSTRAINT fk_maintenance_schedule_maintainer
FOREIGN KEY (maintainer_id) REFERENCES public.staff(id);
