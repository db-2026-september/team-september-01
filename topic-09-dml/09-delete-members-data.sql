-- Member 8 (Victoria) cancelled her class booking, removing the cancelled attendance record
DELETE FROM public.attendance
WHERE registration_id = 1007 AND member_id = 8;

-- Removing an incorrect "No-Show" record for Member 2 (Iryna) upon request
DELETE FROM public.attendance
WHERE registration_id = 1009 AND status = 'No-Show';

-- Member 1 (Oleksandr) requested to remove an accidental Body Fat measurement (metric_type_id = 2)
DELETE FROM public.personal_progress
WHERE member_id = 1 AND metric_type_id = 2;

-- Deleting an outdated/incorrect bicep size measurement (metric_type_id = 6) for Member 8
DELETE FROM public.personal_progress
WHERE member_id = 8 AND metric_type_id = 6;

-- Member 3 (Dmytro) requested to clear his completed goal from the active goals list
DELETE FROM public.goals
WHERE member_id = 3 AND status = 'Completed';
