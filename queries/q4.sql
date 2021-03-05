USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- 4. List the names of students who have taken a course taught by professor v5 (name).
-- v ORIGINAL QUERY v
-- SELECT name FROM Student,
-- 	(SELECT studId FROM Transcript,
-- 		(SELECT crsCode, semester FROM Professor
-- 			JOIN Teaching
-- 			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
-- 	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
-- WHERE Student.id = alias2.studId;

CREATE INDEX prof_name_idx ON professor(name);

SELECT st.name FROM student st
INNER JOIN transcript tt
ON st.id = tt.studId
INNER JOIN teaching tch
ON tch.crsCode = tt.crsCode
INNER JOIN professor pf
ON pf.id = tch.profId AND pf.name = @v5;

-- The original query returned no students. Creating a primary key on the id for the professor table improved query performance.
-- I added an index to the name column to avoid a full table scan and because searching by name is a common query filter.
-- I changed the query to multiple joins and narrowed the results to professor Amber Hill.