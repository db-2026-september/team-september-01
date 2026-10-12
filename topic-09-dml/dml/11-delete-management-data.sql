BEGIN;

-- Class ID 8 is cancelled. 
-- We must first remove all member sign-ups from class_registrations before removing the session from class_schedule.
-- Remove all member bookings for Class ID 8
DELETE FROM public.class_registrations
WHERE schedule_id = 8;
-- Now it is safe to delete the class session itself from the schedule
DELETE FROM public.class_schedule
WHERE id = 8;


-- Member 2 decided not to attend tonight's Class ID 5.
DELETE FROM public.class_registrations
WHERE schedule_id = 5 AND member_id = 2;

-- Alexander (ID 1) cancelled his visit shift on Sunday due to a holiday.
DELETE FROM public.frontdesk_shifts
WHERE staff_id = 1 AND shift_start = '2026-10-18 10:00:00';

COMMIT;
