-- 학생 삭제
ALTER TABLE student
ADD  CONSTRAINT C_member_TO_student FOREIGN KEY(std_no)
REFERENCES member(mem_no) 
ON DELETE CASCADE;

ALTER TABLE wanted_lesson
ADD  CONSTRAINT C_student_TO_wanted_lesson FOREIGN KEY(std_no)
REFERENCES student(std_no) 
ON DELETE CASCADE;

ALTER TABLE lesson
ADD  CONSTRAINT C_student_TO_lesson FOREIGN KEY(std_no)
REFERENCES student(std_no) 
ON DELETE CASCADE;


-- 선생님 삭제
ALTER TABLE teacher
ADD  CONSTRAINT C_member_TO_teacher FOREIGN KEY(tch_no)
REFERENCES member(mem_no) 
ON DELETE CASCADE;

ALTER TABLE lesson_subject
ADD  CONSTRAINT C_teacher_TO_lesson_subject FOREIGN KEY(tch_no)
REFERENCES teacher(tch_no) 
ON DELETE CASCADE;

ALTER TABLE teacher_photo
ADD  CONSTRAINT C_teacher_TO_teacher_photo FOREIGN KEY(tch_no)
REFERENCES teacher(tch_no) 
ON DELETE CASCADE;

ALTER TABLE school
ADD  CONSTRAINT C_teacher_TO_school FOREIGN KEY(tch_no)
REFERENCES teacher(tch_no) 
ON DELETE CASCADE;

ALTER TABLE lesson
ADD  CONSTRAINT C_teacher_TO_lesson FOREIGN KEY(tch_no)
REFERENCES teacher(tch_no) 
ON DELETE CASCADE;


-- 부모님 삭제
ALTER TABLE parents
ADD  CONSTRAINT C_member_TO_parents FOREIGN KEY(parents_no)
REFERENCES member(mem_no) 
ON DELETE CASCADE;

-- 수업 삭제
ALTER TABLE curriculum
ADD  CONSTRAINT C_lesson_TO_curriculum FOREIGN KEY(lesson_no)
REFERENCES lesson(lesson_no) 
ON DELETE CASCADE;

ALTER TABLE curr_lesson_conts
ADD  CONSTRAINT C_curriculum_TO_curr_lesson_conts FOREIGN KEY(lesson_no)
REFERENCES curriculum(lesson_no) 
ON DELETE CASCADE;

ALTER TABLE day_lesson
ADD  CONSTRAINT C_lesson_TO_day_lesson FOREIGN KEY(lesson_no)
REFERENCES lesson(lesson_no) 
ON DELETE CASCADE;

-- 게시판 삭제
ALTER TABLE board
ADD  CONSTRAINT C_member_TO_board FOREIGN KEY(mem_no)
REFERENCES member(mem_no) 
ON DELETE CASCADE;

ALTER TABLE board_file
ADD  CONSTRAINT C_board_TO_board_file FOREIGN KEY(board_no)
REFERENCES board(board_no) 
ON DELETE CASCADE;

ALTER TABLE comment
ADD  CONSTRAINT C_board_TO_comment FOREIGN KEY(board_no)
REFERENCES board(board_no) 
ON DELETE CASCADE;

-- 메시지 삭제
ALTER TABLE message
ADD  CONSTRAINT C_member_TO_message FOREIGN KEY(sender)
REFERENCES member(mem_no) 
ON DELETE CASCADE;

ALTER TABLE message
ADD  CONSTRAINT C_member_TO_message2 FOREIGN KEY(receiver)
REFERENCES member(mem_no) 
ON DELETE CASCADE;


ALTER TABLE student
ADD  CONSTRAINT C_parents_TO_student FOREIGN KEY(parents_no)
REFERENCES parents(parents_no) 
ON DELETE CASCADE;

ALTER TABLE comment
ADD  CONSTRAINT C_member_TO_comment FOREIGN KEY(mem_no)
REFERENCES member(mem_no) 
ON DELETE CASCADE;