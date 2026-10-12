BEGIN;

INSERT INTO public.staff (first_name, last_name, title) VALUES
-- Administration & Front Desk
('Alexander', 'Petrenko', 'Club Manager'),
('Vadim', 'Pavlenko', 'Front Desk Manager'),
('Maria', 'Kovalenko', 'Receptionist'),
('Dmitry', 'Shevchenko', 'Receptionist'),
-- Trainers & Coaches
('Oleg', 'Vlasov', 'Fitness Trainer'),
('Yaroslav', 'Mudryi', 'Yoga Instructor'),
('Katerina', 'Zinchenko', 'Pilates Coach'),
('Sergey', 'Kravchenko', 'Boxing Coach'),
('Irina', 'Savchenko', 'Fitness Trainer'),
('Maxim', 'Dudka', 'CrossFit Trainer'),
-- Maintenance & Technical Staff
('Vasyl', 'Gonchar', 'Technician'),
('Roman', 'Koval', 'Electrician'),
-- Cleaning Staff
('Galyna', 'Sydorenko', 'Cleaner'),
('Nadiya', 'Pavliuk', 'Cleaner'),
-- Additional Specialists
('Diana', 'Chorna', 'Massage Therapist'),
('Evgen', 'Bilous', 'Massage Therapist'),
('Olena', 'Kravets', 'Fitness Nutritionist');


INSERT INTO public.frontdesk_shifts (staff_id, shift_start, shift_end) VALUES
(3, '2026-10-13 07:00:00', '2026-10-13 15:00:00'), 
(4, '2026-10-13 15:00:00', '2026-10-13 23:00:00'),
(2, '2026-10-13 09:00:00', '2026-10-13 17:00:00'),
(4, '2026-10-14 07:00:00', '2026-10-14 15:00:00'), 
(3, '2026-10-14 15:00:00', '2026-10-14 23:00:00'), 
(1, '2026-10-14 09:00:00', '2026-10-14 18:00:00'),
(3, '2026-10-15 07:00:00', '2026-10-15 15:00:00'), 
(4, '2026-10-15 15:00:00', '2026-10-15 23:00:00'), 
(2, '2026-10-15 12:00:00', '2026-10-15 20:00:00'),
(4, '2026-10-16 07:00:00', '2026-10-16 15:00:00'),
(3, '2026-10-16 15:00:00', '2026-10-16 23:00:00'),
(3, '2026-10-17 08:00:00', '2026-10-17 16:00:00'),
(2, '2026-10-17 16:00:00', '2026-10-17 22:00:00'),
(4, '2026-10-18 08:00:00', '2026-10-18 16:00:00'),
(1, '2026-10-18 10:00:00', '2026-10-18 15:00:00');


INSERT INTO public.membership_plans (name, type, price, discount) VALUES
('Standard Monthly', 'Standard', 600.00, 0),
('Standard Annual', 'Standard', 5500.00, 10),
('Premium Monthly', 'Premium', 1200.00, 0),
('Premium Annual', 'Premium', 11000.00, 15);


INSERT INTO public.client_memberships (member_id, plan_id, start_date, end_date, status) VALUES
-- Standard Monthly
(1, 1, '2026-10-01', '2026-11-01', 'Active'),    
(2, 1, '2026-10-10', '2026-11-10', 'Active'),    
(3, 1, '2026-09-01', '2026-10-01', 'Expired'),  
-- Standard Annual 
(4, 2, '2026-01-15', '2027-01-15', 'Active'),    
(5, 2, '2025-10-01', '2026-10-01', 'Expired'), 
-- Premium Monthly
(6, 3, '2026-09-25', '2026-10-25', 'Active'),    
(7, 3, '2026-10-12', '2026-11-12', 'Active'),    
(8, 3, '2026-08-15', '2026-09-15', 'Expired'),   
-- Premium Annual
(9, 4, '2026-03-10', '2027-03-10', 'Suspended'), 
(10, 4, '2026-07-14', '2027-07-14', 'Active');


INSERT INTO public.class_schedule (class_id, room_id, trainer_id, scheduled_start, scheduled_end, actual_start, actual_end, status) VALUES
(1, 1, 5, '2026-10-12 09:00:00', '2026-10-12 10:00:00', '2026-10-12 09:02:00', '2026-10-12 10:01:00', 'Completed'),
(2, 2, 6, '2026-10-12 11:00:00', '2026-10-12 12:00:00', '2026-10-12 11:00:00', '2026-10-12 12:00:00', 'Completed'),
(3, 1, 7, '2026-10-12 18:00:00', '2026-10-12 19:00:00', '2026-10-12 17:55:00', '2026-10-12 18:55:00', 'Completed'),
(4, 3, 8, '2026-10-13 16:30:00', '2026-10-13 17:30:00', '2026-10-13 16:30:00', NULL, 'In Progress'),
(1, 1, 5, '2026-10-13 19:00:00', '2026-10-13 20:00:00', NULL, NULL, 'Scheduled'),
(5, 2, 9, '2026-10-14 09:00:00', '2026-10-14 10:00:00', NULL, NULL, 'Scheduled'),
(6, 1, 10, '2026-10-14 12:00:00', '2026-10-14 13:00:00', NULL, NULL, 'Scheduled'),
(2, 2, 6, '2026-10-14 18:30:00', '2026-10-14 19:30:00', NULL, NULL, 'Scheduled'),
(3, 3, 7, '2026-10-15 10:00:00', '2026-10-15 11:00:00', NULL, NULL, 'Scheduled'),
(4, 1, 8, '2026-10-15 17:00:00', '2026-10-15 18:00:00', NULL, NULL, 'Scheduled');


INSERT INTO public.class_registrations (schedule_id, member_id) VALUES
(1, 1), 
(1, 2),  
(1, 4), 
(1, 6), 

(2, 2),  
(2, 4),  
(2, 7),  
(2, 10), 

(4, 1), 
(4, 4),  
(4, 6), 
(4, 7), 
(4, 10), 

(5, 1), 
(5, 2), 
(5, 6),  

(6, 2),  
(6, 4),  
(6, 10), 

(8, 1),  
(8, 6),  
(8, 7), 
(8, 10); 

COMMIT;
