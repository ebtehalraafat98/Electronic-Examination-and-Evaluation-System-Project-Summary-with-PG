🎓 Electronic Examination and Evaluation System Project Summary (ZU_EES)📌
1. Project IntroductionThis project is a comprehensive electronic system designed to manage examinations and evaluation processes at Zagazig University (ZU).
2. The system aims to transform traditional assessment and review processes into an efficient and accurate digital platform.
3. System Core ObjectivesUser Management: To support and manage the permissions of all stakeholders: students (across different degrees and levels), professors, and heads of scientific departments.
4. Question Bank: To establish and maintain a centralized question bank that professors can utilize to develop exams for various courses.Exam Management: To link exams to specific courses and define total marks and passing scores for each exam.
5. Automatic Result Calculation: To record student answers and automatically calculate scores for display of results per course.Evaluation System: To enable students to evaluate both the courses and the professor responsible for teaching the course.
💻 3. Technical and Conceptual StructureComponentDetailNotesDatabaseZU_EES (Zagazig University Examination & Evaluation System)The adopted database name.
Data Model (ERD)Strong Relationships: The model is built on 1:M and M:M relationships, using associative entities like Answer and Evaluation to resolve complex links.
Complexity: Ternary logic was applied within the Answer entity (linking Student, Exam, and Question).
Technology UsedPostgreSQLWe used DDL (table definition and constraints) and DML (data insertion) using PostgreSQL syntax.
ERD EnhancementsNormalization & GeneralizationThe tables are confirmed to be highly normalized (near 3NF), and the Generalization concept was used for user classification (Professors and Students).
⚙️ 4. Database SetupTo set up the database structure, please follow these steps:Create the database named ZU_EES.
Execute the DDL scripts for table creation (respecting the table and Foreign Key dependencies).
Execute the DML (INSERT INTO) scripts to populate the tables with data necessary for testing.
Key System Functions Demonstrated (SQL Queries):Viewing the student's total results per course.
Calculating the average evaluation for professors and courses for the Head of Department.
Identifying the top 10 scoring students for a specific course.Determining the highest-evaluated professor for a given course.
