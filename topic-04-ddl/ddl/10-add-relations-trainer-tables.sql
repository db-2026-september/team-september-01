-- PostgreSQL script
-- Set references as foreign keys

ALTER TABLE public.trainer_availability
ADD CONSTRAINT fk_trainer_availability_trainer
FOREIGN KEY (trainer_id)
REFERENCES public.trainer(id);

ALTER TABLE public.trainer_class
ADD CONSTRAINT fk_trainer_class_trainer
FOREIGN KEY (trainer_id)
REFERENCES public.trainer(id);

ALTER TABLE public.trainer_class
ADD CONSTRAINT fk_trainer_class_class
FOREIGN KEY (class_id)
REFERENCES public.class(id);

ALTER TABLE public.trainer_class
ADD CONSTRAINT fk_trainer_class_staff
FOREIGN KEY (approved_by)
REFERENCES public.staff(id);

ALTER TABLE public.personal_training
ADD CONSTRAINT fk_personal_training_trainer
FOREIGN KEY (trainer_id)
REFERENCES public.trainer(id);

ALTER TABLE public.personal_training
ADD CONSTRAINT fk_personal_training_member
FOREIGN KEY (member_id)
REFERENCES public.member(id);

ALTER TABLE public.trainer_specialization
ADD CONSTRAINT fk_trainer_specialization_trainer
FOREIGN KEY (trainer_id)
REFERENCES public.trainer(id);

ALTER TABLE public.trainer_specialization
ADD CONSTRAINT fk_trainer_specialization_specialization
FOREIGN KEY (specialization_id)
REFERENCES public.specialization(id);
