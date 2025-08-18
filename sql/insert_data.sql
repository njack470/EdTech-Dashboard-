/* =========================================================
   EdTech Project — SAMPLE DATA SEED
   Non-PII synthetic demo dataset
   ========================================================= */

-- Insert EdTech tools
INSERT INTO ed_tech_tools (tools_category, tools_used) VALUES
  ('Engagement','Kahoot'),
  ('LMS','Google Classroom'),
  ('Assessment','Nearpod');

-- Insert example classes
INSERT INTO classes (class_topic, class_semester, class_grade, class_section) VALUES
  ('Algebra','Fall','G-09','A'),
  ('Biology','Fall','G-10','B'),
  ('Chemistry','Spring','G-11','C'),
  ('History','Spring','G-12','A'),
  ('English','Fall','G-08','B'),
  ('Geometry','Spring','G-07','C'),
  ('Physics','Fall','G-06','A'),
  ('Civics','Spring','G-05','B'),
  ('Reading','Fall','G-04','C'),
  ('Writing','Spring','G-02','A');

-- Insert 100 students (synthetic)
WITH genders AS (SELECT unnest(ARRAY['Male','Female']) AS g),
     nations AS (SELECT unnest(ARRAY['US','CA','NG','GB','IN']) AS n)
INSERT INTO students (student_gender, student_nationality, student_absent_days)
SELECT
  (SELECT g FROM genders ORDER BY random() LIMIT 1),
  (SELECT n FROM nations ORDER BY random() LIMIT 1),
  CASE WHEN random() < 0.45 THEN 'Above-7' ELSE 'Below-7' END
FROM generate_series(1,100);

-- Insert tool usage records (one per student, random class/tool)
INSERT INTO tools_usage (usage_minutes, performance_score, feedback_rating, tools_id, class_id, student_id)
SELECT
  30 + (random()*100)::INT,                                -- usage minutes
  55 + (random()*30)::INT,                                 -- performance score
  round( (2.5 + (random()*2.3))::numeric, 1 ),             -- feedback rating
  (SELECT tools_id FROM ed_tech_tools ORDER BY random() LIMIT 1),
  (SELECT class_id FROM classes ORDER BY random() LIMIT 1),
  s.student_id
FROM students s;
