INSERT INTO public.member_experience (level)
VALUES
    ('Scheduled'),
    ('Newbie'),
    ('Experienced'),
    ('Professional');

INSERT INTO public.metric_type (metric_name, unit)
VALUES
    ('Weight', 'kg'),
    ('Body Fat', '%'),
    ('Waist Size', 'cm'),
    ('Chest Size', 'cm'),
    ('Hip Size', 'cm'),
    ('Bicep Size', 'cm');

INSERT INTO public.member (first_name, last_name, experience_id)
VALUES
    ('Oleksandr', 'Kovalenko', 2),
    ('Iryna', 'Bondarenko', 3),
    ('Dmytro', 'Melnyk', 1),
    ('Tetiana', 'Shevchenko', 4),
    ('Andrii', 'Koval', 2),
    ('Kateryna', 'Boiko', 3),
    ('Yurii', 'Kryvenko', 2),
    ('Victoria', 'Tymoshenko', 4),
    ('Maksym', 'Hnatyuk', 1),
    ('Olha', 'Savchenko', 3);

INSERT INTO public.goals (member_id, goal_description, target_date, achieved_date, status)
VALUES
    (1, 'Lose 5 kg and improve cardio', '2026-06-30', NULL, 'Active'),
    (2, 'Gain 3 kg of muscle mass', '2026-07-15', NULL, 'Active'),
    (3, 'Prepare for regular gym workouts', '2026-05-01', '2026-04-28', 'Completed'),
    (4, 'Maintain physical form', '2026-08-01', NULL, 'Active'),
    (5, 'Improve flexibility and core strength', '2026-06-15', NULL, 'Active'),
    (6, 'Reduce waist size by 4 cm', '2026-09-01', NULL, 'Active'),
    (7, 'Attend 3 classes per week', '2026-05-30', NULL, 'Active'),
    (8, 'Increase upper body strength', '2026-10-01', NULL, 'Active'),
    (9, 'Complete onboarding training plan', '2026-05-10', NULL, 'Active'),
    (10, 'Maintain muscle tone', '2026-12-31', NULL, 'Active');


INSERT INTO public.attendance (registration_id, member_id, recorded_at, status)
VALUES
    (1001, 1, '2026-05-01 08:30:00', 'Checked-In'),
    (1002, 2, '2026-05-01 09:15:00', 'Checked-In'),
    (1003, 4, '2026-05-01 10:00:00', 'Checked-In'),
    (1004, 5, '2026-05-02 14:00:00', 'Booked'),
    (1005, 6, '2026-05-02 17:30:00', 'Checked-In'),
    (1006, 7, '2026-05-03 18:00:00', 'Checked-In'),
    (1007, 8, '2026-05-03 19:15:00', 'Cancelled'),
    (1008, 10, '2026-05-04 07:45:00', 'Checked-In'),
    (1009, 2, '2026-05-04 09:00:00', 'No-Show'),
    (1010, 4, '2026-05-05 10:30:00', 'Checked-In');

INSERT INTO public.personal_progress (member_id, metric_type_id, metric_value, notes, progress_date)
VALUES
    (1, 1, 82.50, 'Initial weight measurement', '2026-05-01 08:00:00'),
    (1, 2, 24.50, NULL, '2026-05-01 08:00:00'),
    (2, 1, 64.00, NULL, '2026-05-01 09:00:00'),
    (2, 3, 68.00, NULL, '2026-05-01 09:00:00'),
    (4, 1, 57.00, NULL, '2026-05-01 10:30:00'),
    (4, 4, 92.00, NULL, '2026-05-01 10:30:00'),
    (5, 1, 78.00, NULL, '2026-05-02 13:30:00'),
    (6, 5, 96.00, NULL, '2026-05-02 17:00:00'),
    (8, 6, 34.00, NULL, '2026-05-03 19:00:00'),
    (10, 1, 61.50, 'Regular check-in', '2026-05-04 07:30:00');
