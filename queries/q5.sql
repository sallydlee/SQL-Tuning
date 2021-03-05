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

CREATE INDEX crs_name_dept_idx ON course(crsCode, crsName, deptId);
CREATE INDEX crs_idx ON transcript(crsCode);

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT name FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;

-- crsCode & dept pairs on the course table are not unique so an index was made with the crsCode, crsName, and deptId columns
-- an index was also made for the transcript table's crsCode column to avoid full table scans



