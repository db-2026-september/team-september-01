-- MEMBER MODULE RELATIONS (FOREIGN KEYS)
-- Author: Sofia Hrebeniuk

ALTER TABLE member
    ADD CONSTRAINT fk_member_member_experience
        FOREIGN KEY (experience_id) REFERENCES member_experience (id);

ALTER TABLE attendance
    ADD CONSTRAINT fk_attendance_member
        FOREIGN KEY (member_id) REFERENCES member (id);

ALTER TABLE goals
    ADD CONSTRAINT fk_goals_member
        FOREIGN KEY (member_id) REFERENCES member (id);

ALTER TABLE personal_progress
    ADD CONSTRAINT fk_personal_progress_member
        FOREIGN KEY (member_id) REFERENCES member (id);

ALTER TABLE personal_progress
    ADD CONSTRAINT fk_personal_progress_metric_type
        FOREIGN KEY (metric_type_id) REFERENCES metric_type (id);
