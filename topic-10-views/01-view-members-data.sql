-- HORIZONTAL VIEW
-- Exposes basic public profile info for members without
-- revealing internal metadata or technical IDs.
CREATE OR REPLACE VIEW public.vw_member_basic_info AS
SELECT
    first_name,
    last_name
FROM public.member;

-- VERTICAL VIEW
-- Isolates currently active targets from the 'goals' table
-- to give trainers a focused view of what clients are currently working on
CREATE OR REPLACE  VIEW public.vw_active_goals AS
SELECT
    id,
    member_id,
    goal_description,
    target_date
FROM public.goals
WHERE status = 'Active';


-- Mixed View
-- Hides service metadata (ID and status) and filters
-- only successfully checked-in visits from the 'attendance' table for clean reporting.
CREATE VIEW public.vw_checked_in_attendance AS
SELECT
    member_id,
    recorded_at
FROM public.attendance
WHERE status = 'Checked-In';


-- Join View
-- Connects the 'member' and 'member_experience' tables using a JOIN
-- to show readable text instead of numeric IDs.
CREATE VIEW public.vw_member_with_experience_level AS
SELECT
    m.first_name,
    m.last_name,
    e.level AS experience_level
FROM public.member m
JOIN public.member_experience e ON m.experience_id = e.id;



-- View with Subquery
-- Purpose: Calculates the total number of personal trainings for each member
-- using a scalar subquery.
-- Bridges the 'member' table with the 'personal_training' table
-- to dynamically compute training statistics per user.
CREATE OR REPLACE VIEW public.vw_member_training_count AS
SELECT
    m.first_name,
    m.last_name,
    (
        SELECT COUNT(*)
        FROM public.personal_training pt
        WHERE pt.member_id = m.id
    ) AS total_trainings
FROM public.member m;

-- Union View
-- Purpose: Combines regular attendance visits and personal training sessions.
-- Merges records from 'attendance' and 'personal_training'
-- tables into a single timeline to provide a complete history of member activity.
CREATE OR REPLACE VIEW public.vw_member_activity_stream AS
SELECT
    member_id,
    recorded_at AS activity_date,
    'Regular Visit' AS activity_type
FROM public.attendance

UNION

SELECT
    member_id,
    scheduled_start AS activity_date,
    'Personal Training' AS activity_type
FROM public.personal_training;


-- View Selecting from Another View
-- Purpose: Summarizes total activities per member based on the detailed activity stream view.
-- Demonstrates view composition by querying 'vw_member_activity_stream'
-- to calculate aggregate engagement statistics (total count and last active date) for each member.
CREATE OR REPLACE VIEW public.vw_member_activity_summary AS
SELECT
    member_id,
    COUNT(*) AS total_activities,
    MAX(activity_date) AS last_activity_date
FROM public.vw_member_activity_stream
GROUP BY member_id;

-- View with CHECK OPTION
-- Purpose: Manages active goals and enforces integrity constraints on inserts/updates.
-- Relation to design: Uses WITH CHECK OPTION on the 'goals' table to ensure that
-- no user can insert or modify a goal through this view unless its status remains 'Active'.
CREATE OR REPLACE VIEW public.vw_active_goals_maintenance AS
SELECT
    id,
    member_id,
    goal_description,
    target_date,
    status
FROM public.goals
WHERE status = 'Active'
    WITH CHECK OPTION;
