# EdTech Usage & Student Performance Dashboard

## 📝 Executive Summary  

This project analyzes how the use of EdTech tools (Google Classroom, Kahoot, and Nearpod) influences student engagement, performance, and feedback**. Using PostgreSQL (Supabase) for data modeling and Power BI for visualization, I developed a dashboard that helps school administrators understand where digital learning is effective and where gaps exist.  

The analysis found that:  
- Avg Daily Usage = 66 min
- High Engagement (≥60 min) = 57% of students
- Avg Performance = 65%
- Avg Feedback Rating = 3.9/5
- Grades 9–11 most engaged
- Google Classroom strongest all-around tool

**Recommendations include:** prioritizing Google Classroom as the core platform, targeting low-engagement students through teacher support and training, leveraging Kahoot strategically for engagement bursts, and focusing resources on boosting usage among younger grades. Schools should also track clear KPIs — aiming for ≥70% of students in the high-engagement band and feedback scores of ≥4.2/5.  

## Business Problem
School administrators are investing heavily in EdTech tools (Google Classroom, Kahoot, Nearpod), but it’s unclear which tools drive engagement, improve performance, and earn positive student feedback.

## Results
- Students average 66 minutes of daily EdTech usage, with 57% meeting the high engagement benchmark (≥60 minutes).  
- Google Classroom delivers balanced outcomes across usage, performance, and feedback, while Kahoot drives the highest engagement but not always higher performance.  
- Nearpod receives consistently positive feedback, making it a strong complementary tool.  
- Engagement is highest in Grades 9–11, while younger grades (4–7) show lower adoption.  
- Overall student feedback averages 3.9/5, indicating generally positive experiences with room for improvement.  

## Business Recommendations
1. Prioritize Google Classroom for balanced outcomes.
2. Target low-engagement students (43%) with extra support.
3. Optimize mix: Nearpod for feedback, Kahoot for engagement bursts.
4. Focus on younger grades (G-04 to G-07) to close the usage gap.
5. Set KPI benchmarks: ≥70% engagement, ≥4.2/5 feedback, performance growth each semester.

## Next Steps

To build on these findings, schools and administrators should consider:  

1. **Monitor KPIs Over Time**  
   - Track high-engagement % and feedback scores each semester to measure progress against targets (≥70% engagement, ≥4.2/5 feedback).  

2. **Run Pilot Programs**  
   - Test focused interventions (e.g., targeted support for Grades 4–7, structured Kahoot review sessions) and measure their impact on performance.  

3. **Expand Data Sources**  
   - Integrate attendance, demographic, or subject-specific performance data to uncover deeper drivers of engagement.  

4. **Teacher Training & Adoption**  
   - Provide professional development so instructors can better integrate EdTech tools into lessons, especially in younger grades.  

5. **Iterate Dashboard & Insights**  
   - Add trend analysis (semester-over-semester comparisons) and predictive models to forecast engagement and performance outcomes.  
 
---

## Dashboard Preview

![Dashboard Screenshot](assets/dashboard_cover.jpg)


[View Interactive Dashboard on Power BI Service](https://app.powerbi.com/view?r=eyJrIjoiMzQwNzBiOWQtMzA0Yi00MzRlLTk1MTItOTZjOGM1ZjIyN2M4IiwidCI6IjJjNWVlNjM4LWE5NjMtNDljMC1hYzI2LTgyOGRkOWI3OGQ1ZSIsImMiOjR9)

---


## Repository Contents

- `record_level_export.csv` → Exported dataset from the `analytics.v_usage_enriched` view.  
- `EdTech_Dashboard.pbix` → Power BI report file (download to explore locally).  
- `sql/` folder → All SQL scripts used in the project:  
   - `create_tables.sql` → Creates base tables + unified analysis view.  
   - `insert_data.sql` → Seeds synthetic demo data (100 students, random usage).     
   - `kpi_cards.sql` → Script for 5 dashboard KPI cards.  
   - `engagement_charts.sql` → Queries for visuals (usage by tool, grade, performance).  
- `assets/` → Project visuals and diagrams:
   - `dashboard_cover.png` → Screenshot of the Power BI dashboard.  
   - `erd_edtech.png` → Entity Relationship Diagram (ERD) of the EdTech database schema.  
  

---

## Key Features

KPI Cards (Top Row):
- Total Students  
- Avg Daily Usage (Minutes)  
- Avg Performance %  
- Avg Feedback (1–5 scale)  
- High Engagement % (≥60 min usage)

Engagement Visuals:
- Avg Daily Usage by Tool  
- Usage vs Performance by Tool (scatter)  
- High vs Low Engagement (pie)  
- Avg Daily Usage by Grade  
- Avg Performance % by Tool Category  

---

## Tech Stack

- Database: PostgreSQL (via Supabase)  
- Data Modeling:SQL (views, KPIs, engagement banding)  
- Visualization: Power BI Desktop + Power BI Service  

---

## How to Reproduce

1. Database Setup
   - Run `sql/create_tables.sql` in Supabase/Postgres.  
   - (Optional) Run `sql/insert_data.sql` to generate synthetic demo data.  

2. Analysis Views
   - Use scripts in `sql/kpi_cards.sql` and `sql/engagement_charts.sql`.  
   - Export results as CSV (`record_level_export.csv`) if needed for Power BI.  

3. Dashboard
   - Open `EdTech_Dashboard.pbix` in Power BI Desktop.  
   - Or view the [live interactive dashboard] (https://app.powerbi.com/view?r=eyJrIjoiMzQwNzBiOWQtMzA0Yi00MzRlLTk1MTItOTZjOGM1ZjIyN2M4IiwidCI6IjJjNWVlNjM4LWE5NjMtNDljMC1hYzI2LTgyOGRkOWI3OGQ1ZSIsImMiOjR9)

---

 ## Author

- Nylah Jackson
- Graduate Student in Information Systems 
- [LinkedIn Profile](www.linkedin.com/in/nylah-jackson-38187623a)  

---

*License: MIT*
