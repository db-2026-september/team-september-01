BEGIN;

-- Updates on staff 
-- Promoting Vadim Pavlenko from Front Desk Manager to General Club Manager
UPDATE public.staff
SET title = 'Club Manager'
WHERE id = 2;

-- Updates on membership_plans
-- Increasing the price of standard monthly plan due to inflation
UPDATE public.membership_plans
SET price = 650.00
WHERE name = 'Standard Monthly';

-- Updates on client_memberships
-- Member 4 requested Suspended on their annual card
UPDATE public.client_memberships
SET status = 'Suspended'
WHERE member_id = 4;

-- Updates on class_schedule
-- Class 5 is delayed by 30 minutes due to trainer's urgent schedule change
UPDATE public.class_schedule
SET scheduled_start = '2026-10-13 19:30:00', scheduled_end = '2026-10-13 20:30:00'
WHERE id = 5 AND status = 'Scheduled';

-- Moving Class 6 to Room 3 because Room 1 requires unexpected quick cleaning
UPDATE public.class_schedule
SET room_id = 3
WHERE id = 6;

COMMIT;
