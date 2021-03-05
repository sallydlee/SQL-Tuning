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


-- 1. List the name of the student with id equal to v1 (id).
SELECT name FROM Student WHERE id = @v1;

-- Altered table to define id as primary key and avoid a full table scan.
-- Cost changed from 41 to 0.1.