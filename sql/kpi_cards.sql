/* =========================================================
   EdTech Project — KPI Cards Script
   Generates the 5 main KPIs used in Power BI dashboard
   Source: analytics.v_usage_enriched
   ========================================================= */

SELECT
    -- 1) Total Students
    COUNT(DISTINCT student_id) AS total_students,

    -- 2) Average Daily Usage (Minutes)
    ROUND(AVG(usage_minutes)::numeric, 2) AS avg_daily_usage_minutes,

    -- 3) Average Performance (%)
    ROUND(AVG(performance_score)::numeric, 2) AS avg_performance_percent,

    -- 4) Average Feedback (1–5 scale)
    ROUND(AVG(feedback_rating)::numeric, 2) AS avg_feedback_rating,

    -- 5) High Engagement % (students with ≥ 60 min usage)
    ROUND(
        AVG(CASE WHEN usage_minutes >= 60 THEN 1 ELSE 0 END)::numeric * 100,
        2
    ) AS high_engagement_percent
FROM analytics.v_usage_enriched;
