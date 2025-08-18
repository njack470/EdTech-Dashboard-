/* =========================================================
   EdTech Project — Engagement Charts Datasets
   Source table/view: analytics.v_usage_enriched
   Outputs:
     A) Avg Daily Usage by Tool
     B) Usage vs Performance by Tool (for scatter)
     C) High vs Low Engagement split (pie)
     D) Avg Daily Usage by Grade
     E) Avg Performance % by Tool Category
   ========================================================= */

-- A) Avg Daily Usage by Tool
CREATE OR REPLACE VIEW analytics.v_usage_by_tool AS
SELECT
  tool_name,
  ROUND(AVG(usage_minutes)::numeric, 2) AS avg_usage_minutes
FROM analytics.v_usage_enriched
GROUP BY tool_name
ORDER BY avg_usage_minutes DESC;

-- B) Usage vs Performance by Tool (scatter)
CREATE OR REPLACE VIEW analytics.v_usage_vs_performance_by_tool AS
SELECT
  tool_name,
  ROUND(AVG(usage_minutes)::numeric, 2)      AS avg_usage_minutes,
  ROUND(AVG(performance_score)::numeric, 2)  AS avg_performance_percent,
  COUNT(DISTINCT student_id)                 AS distinct_students
FROM analytics.v_usage_enriched
GROUP BY tool_name
ORDER BY tool_name;

-- C) High vs Low Engagement (pie)
-- Threshold: 60 minutes
CREATE OR REPLACE VIEW analytics.v_engagement_split AS
SELECT
  CASE WHEN usage_minutes >= 60 THEN 'High (≥60 min)' ELSE 'Low (<60 min)' END AS engagement_band,
  COUNT(*) AS records,
  ROUND( 100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percent_of_total
FROM analytics.v_usage_enriched
GROUP BY engagement_band
ORDER BY engagement_band;

-- D) Avg Daily Usage by Grade
CREATE OR REPLACE VIEW analytics.v_usage_by_grade AS
SELECT
  class_grade,
  ROUND(AVG(usage_minutes)::numeric, 2) AS avg_usage_minutes
FROM analytics.v_usage_enriched
GROUP BY class_grade
ORDER BY class_grade;

-- E) Avg Performance % by Tool Category
CREATE OR REPLACE VIEW analytics.v_performance_by_tool_category AS
SELECT
  tool_category,
  ROUND(AVG(performance_score)::numeric, 2) AS avg_performance_percent
FROM analytics.v_usage_enriched
GROUP BY tool_category
ORDER BY tool_category;
