/* =========================================================
   EdTech Project — CREATE TABLES & ANALYSIS VIEW
   DB: PostgreSQL (Supabase compatible)
   ========================================================= */

CREATE TABLE IF NOT EXISTS students(
  student_id SERIAL PRIMARY KEY,
  student_gender TEXT NOT NULL,
  student_nationality TEXT NOT NULL,
  student_absent_days TEXT NOT NULL
    CHECK (student_absent_days IN ('Above-7','Below-7'))
);

CREATE TABLE IF NOT EXISTS classes(
  class_id SERIAL PRIMARY KEY,
  class_topic TEXT NOT NULL,
  class_semester VARCHAR(6) NOT NULL
    CHECK (class_semester IN ('Fall','Spring')),
  class_grade TEXT NOT NULL,
  class_section CHAR(1) NOT NULL
    CHECK (class_section IN ('A','B','C'))
);

CREATE TABLE IF NOT EXISTS ed_tech_tools(
  tools_id SERIAL PRIMARY KEY,
  tools_category TEXT NOT NULL
    CHECK (tools_category IN ('LMS','Engagement','Assessment')),
  tools_used TEXT NOT NULL
    CHECK (tools_used IN ('Kahoot','Google Classroom','Nearpod'))
);

CREATE TABLE IF NOT EXISTS tools_usage(
  usage_id SERIAL PRIMARY KEY,
  usage_minutes INTEGER NOT NULL,
  performance_score INTEGER NOT NULL
    CHECK (performance_score BETWEEN 0 AND 100),
  feedback_rating DECIMAL(2,1) NOT NULL
    CHECK (feedback_rating BETWEEN 0 AND 5),
  tools_id INTEGER NOT NULL REFERENCES ed_tech_tools(tools_id),
  class_id INTEGER NOT NULL REFERENCES classes(class_id),
  student_id INTEGER NOT NULL REFERENCES students(student_id),
  CONSTRAINT un_students_tools_classes UNIQUE (student_id, tools_id, class_id)
);

-- Master joined view for analysis
CREATE SCHEMA IF NOT EXISTS analytics;

CREATE OR REPLACE VIEW analytics.v_usage_enriched AS
SELECT
  tu.usage_id,
  tu.usage_minutes,
  tu.performance_score,
  tu.feedback_rating,
  tu.tools_id,
  tu.class_id,
  tu.student_id,
  c.class_grade,
  c.class_topic,
  c.class_semester,
  c.class_section,
  ett.tools_used      AS tool_name,
  ett.tools_category  AS tool_category,
  s.student_gender,
  s.student_nationality,
  s.student_absent_days
FROM tools_usage tu
JOIN classes       c   ON c.class_id  = tu.class_id
JOIN ed_tech_tools ett ON ett.tools_id = tu.tools_id
JOIN students      s   ON s.student_id = tu.student_id;
