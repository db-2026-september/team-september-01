-- MEMBER MODULE RELATIONS SCRIPT
-- Author: Sofia Hrebeniuk

ALTER TABLE public.member
    ADD CONSTRAINT fk_member_member_experience
    FOREIGN KEY (experience_id)
    REFERENCES public.member_experience (id);

ALTER TABLE public.attendance
    ADD CONSTRAINT fk_attendance_member
    FOREIGN KEY (member_id)
    REFERENCES public.member (id);

ALTER TABLE public.goals
    ADD CONSTRAINT fk_goals_member
    FOREIGN KEY (member_id)
    REFERENCES public.member (id);

ALTER TABLE public.personal_progress
    ADD CONSTRAINT fk_personal_progress_member
    FOREIGN KEY (member_id)
    REFERENCES public.member (id);

ALTER TABLE public.personal_progress
    ADD CONSTRAINT fk_personal_progress_metric_type
    FOREIGN KEY (metric_type_id)
    REFERENCES public.metric_type (id);
