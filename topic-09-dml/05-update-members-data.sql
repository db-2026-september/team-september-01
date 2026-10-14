-- Updates on member
-- Member Oleksandr Kovalenko completed introductory training and is promoted from Newbie to Experienced
UPDATE public.member
SET experience_id = 3
WHERE id = 1;

-- Updates on goals
-- Member 1 successfully achieved their weight loss goal ahead of schedule
UPDATE public.goals
SET status = 'Completed',
    achieved_date = '2026-05-20'
WHERE id = 1 AND status = 'Active';

-- Member 6 revised their target date for waist size reduction
UPDATE public.goals
SET target_date = '2026-10-15'
WHERE id = 6 AND status = 'Active';

-- Updates on attendance
-- Member who was previously 'Booked' for registration 1004 has checked in at reception
UPDATE public.attendance
SET status = 'Checked-In'
WHERE registration_id = 1004;

-- Member 8 contacted support to cancel their session (registration 1007)
UPDATE public.attendance
SET status = 'Cancelled'
WHERE registration_id = 1007;


-- Correcting an incorrectly entered measurement value for member 2 waist size
UPDATE public.personal_progress
SET metric_value = 67.50
WHERE id = 4;
