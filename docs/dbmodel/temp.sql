ALTER TABLE
  board_file
ADD CONSTRAINT
  cascade_board_no
FOREIGN KEY
  (board_no)
REFERENCES
  board(board_no)
ON DELETE CASCADE;

ALTER TABLE
  curriculum
ADD CONSTRAINT
  cascade_curr
FOREIGN KEY
  (lesson_no)
REFERENCES
  lesson(lesson_no)
ON DELETE CASCADE;

ALTER TABLE
  curr_lesson_conts
ADD CONSTRAINT
  cascade_lesson_conts
FOREIGN KEY
  (lesson_no)
REFERENCES
  curriculum(lesson_no)
ON DELETE CASCADE;