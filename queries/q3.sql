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


SELECT name FROM student st
INNER JOIN transcript tt 
ON st.id = tt.studId AND tt.crsCode = @v4;

-- There was a minor cost improvement from using a join instead of a subquery in the WHERE clause.
-- I created a primary key on the transcript table using the course code, semester, and student id columns to avoid a full table scan.