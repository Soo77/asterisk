-- 회원유형  
INSERT INTO member_type(mem_type_name)
VALUES ('student');
INSERT INTO member_type(mem_type_name)
VALUES ('parents');
INSERT INTO member_type(mem_type_name)
VALUES ('teacher');
INSERT INTO member_type(mem_type_name)
VALUES ('admin');

-- 학교유형
INSERT INTO school_type(sch_type)
VALUES ('primary');
INSERT INTO school_type(sch_type)
VALUES ('middle');
INSERT INTO school_type(sch_type)
VALUES ('high');
INSERT INTO school_type(sch_type)
VALUES ('university');
INSERT INTO school_type(sch_type)
VALUES ('college');

-- 회원 (FK: mem_type_name_no)
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(2, now(), 'M', '2019-01-01', 'hong11', 'hong@test.com', 'hong', password('1111'), 'Seoul', 'Seocho', '1111-2222', 'a.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(2, now(), 'M', '2019-02-02', 'lim11', 'lim@test.com', 'lim', password('1111'), 'Seoul', 'Seocho', '1111-3333', 'b.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(2, now(), 'F', '2019-03-03', 'you11', 'you@test.com', 'you', password('1111'), 'Seoul', 'Seocho', '1111-4444', 'c.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(1, now(), 'F', '2019-04-04', 'kim11', 'kim@test.com', 'kim', password('1111'), 'Seoul', 'Seocho', '1111-5555', 'd.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(1, now(), 'M', '2019-05-05', 'lee11', 'lee@test.com', 'lee', password('1111'), 'Seoul', 'Seocho', '1111-6666', 'e.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(1, now(), 'F', '2019-06-06', 'shim11', 'shim@test.com', 'shim', password('1111'), 'Seoul', 'Seocho', '1111-7777', 'f.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(3, now(), 'M', '2019-07-07', 'shin11', 'shin@test.com', 'shin', password('1111'), 'Seoul', 'Seocho', '1111-8888', 'g.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(3, now(), 'F', '2019-08-08', 'cho11', 'cho@test.com', 'cho', password('1111'), 'Seoul', 'Seocho', '1111-9999', 'h.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(3, now(), 'M', '2019-09-09', 'yim11', 'yim@test.com', 'yim', password('1111'), 'Seoul', 'Seocho', '1111-0000', 'i.gif');

-- 회원 쪽 과외 요일 및 시간 데이터 수정
UPDATE member SET curr_lesson_dt='1010101', curr_lesson_st='18:00', curr_lesson_et='20:00';

-- 학부모
INSERT INTO parents(parents_no, kakaotalk)
VALUES (1, false);
INSERT INTO parents(parents_no, kakaotalk)
VALUES (2, false);
INSERT INTO parents(parents_no, kakaotalk)
VALUES (3, true);

-- 학생 (FK: parents_no, sch_type_no)
INSERT INTO student(std_no, parents_no, sch_type_no)
VALUES (4, 1, 1);
INSERT INTO student(std_no, sch_type_no)
VALUES (5, 2);
INSERT INTO student(std_no, parents_no, sch_type_no)
VALUES (6, 3, 3);

-- 선생님
INSERT INTO teacher(tch_no, acc_no, bank_name, lesson_certi, tch_intro, appr_stat, vid_addr)
VALUES (7, '111-111-111', 'KB STAR', 'a.gif', 'teacher intro1', false, 'video1.mp4');
INSERT INTO teacher(tch_no, acc_no, bank_name, lesson_certi, tch_intro, appr_stat, vid_addr)
VALUES (8, '111-222-111', 'Woori', 'b.gif', 'teacher intro2', true, 'video2.mp4');
INSERT INTO teacher(tch_no, acc_no, bank_name, lesson_certi, tch_intro, appr_stat)
VALUES (9, '111-333-111', 'Shinhan', 'c.gif', 'teacher intro3', false);

-- 선생님 사진 (FK: tch_no)
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (7, 'a.jpg');
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (8, 'b.jpg');
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (9, 'c.jpg');
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (9, 'd.jpg');

-- 학교 (FK: tch_no, sch_type_no)
INSERT INTO school(tch_no, sch_type_no, sch_name, certi, grad, mdt, confirm, grad_date)
VALUES (7, 3, 'bit high school', 'a.gif', true, now(), true, '2019-1-1');
INSERT INTO school(tch_no, sch_type_no, sch_name, certi, grad, mdt, major, confirm)
VALUES (7, 4, 'meiji university', 'b.gif', false, now(), 'physics', true);

INSERT INTO school(tch_no, sch_type_no, sch_name, certi, grad, mdt, major, confirm, grad_date)
VALUES (8, 4, 'bit university', 'c.gif', true, now(), 'computer science', true, '2019-11-27');

-- 쪽지 (FK: sender:mem_no, receiver:mem_no)
INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (1, 2, 'test1', now());
INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (1, 2, 'test2', now());

INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (2, 1, 'test1', now());
INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (2, 1, 'test2', now());

-- 게시판 유형
INSERT INTO board_type(board_name)
VALUES ('study_consulting_board');
INSERT INTO board_type(board_name)
VALUES ('university_consulting_board');
INSERT INTO board_type(board_name)
VALUES ('problem_solving_board');
INSERT INTO board_type(board_name)
VALUES ('notice_board');

-- 게시글 (FK: board_type_no, mem_no)
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (1, 1, 'board_title1', 'board_cont1', now());
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (1, 2, 'board_title2', 'board_cont2', now());
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (1, 3, 'board_title3', 'board_cont3', now());

INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (2, 1, 'board_title1', 'board_cont1', now());
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (2, 2, 'board_title2', 'board_cont2', now());
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (2, 3, 'board_title3', 'board_cont3', now());

INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (3, 1, 'board_title1', 'board_cont1', now());
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (3, 2, 'board_title2', 'board_cont2', now());
INSERT INTO board(board_type_no, mem_no, titl, conts, cdt)
VALUES (3, 3, 'board_title3', 'board_cont3', now());

-- 게시글 첨부파일 (FK: board_no, notice_no)
INSERT INTO board_file(file_name, board_no)
VALUES ('a.gif', 1);
INSERT INTO board_file(file_name, board_no)
VALUES ('b.gif', 1);
INSERT INTO board_file(file_name, board_no)
VALUES ('c.gif', 2);

-- 댓글 (FK: board_no, mem_no)
INSERT INTO comment(board_no, mem_no, conts, cdt)
VALUES (1, 1, 'comment_test1', now());
INSERT INTO comment(board_no, mem_no, conts, cdt)
VALUES (2, 2, 'comment_test2', now());
INSERT INTO comment(board_no, mem_no, conts, cdt)
VALUES (3, 3, 'comment_test3', now());

-- 과목 (FK: sch_type_no)
INSERT INTO subject(sch_type_no, sub_name)
VALUES (1, 'korean');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (1, 'english');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (1, 'math');

INSERT INTO subject(sch_type_no, sub_name)
VALUES (2, 'korean');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (2, 'english');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (2, 'math');

INSERT INTO subject(sch_type_no, sub_name)
VALUES (3, 'korean');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (3, 'english');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (3, 'math');

-- 과외희망(희망과목) (FK: std_no, sub_no)
INSERT INTO wanted_lesson(std_no, sub_no, req, rdt, wanted_fee)
VALUES (4, 1, 'requirement1', now(), 2);
INSERT INTO wanted_lesson(std_no, sub_no, req, rdt, wanted_fee)
VALUES (5, 2, 'requirement2', now(), 1);
INSERT INTO wanted_lesson(std_no, sub_no, req, rdt, wanted_fee)
VALUES (6, 3, 'requirement3', now(), 3);

-- 과외과목(희망과목) (FK: tch_no, sub_no)
INSERT INTO lesson_subject(tch_no, sub_no, sub_conts, rdt, wanted_fee)
VALUES (7, 1, 'This lesson will make you the best Korean speaker', now(), 1);
INSERT INTO lesson_subject(tch_no, sub_no, sub_conts, rdt, wanted_fee)
VALUES (8, 2, "Try this lesson! It never make you disappointed", now(), 2);
INSERT INTO lesson_subject(tch_no, sub_no, sub_conts, rdt, wanted_fee)
VALUES (9, 3, 'Wanna be a best mathematcian? This is for you babe!', now(), 3);

-- 수업 (FK: tch_no, stud_no, sub_no)
INSERT INTO lesson(tch_no, sub_no, lesson_desc, lesson_fee, sdt, edt)
VALUES (7, 4, "World's best Korean lesson", 300000, '2019-1-1', '2019-2-2');
INSERT INTO lesson(tch_no, std_no, sub_no, lesson_desc, lesson_fee, sdt, edt)
VALUES (8, 5, 2, "World's best English lesson", 350000, '2019-2-2', '2019-3-3');
INSERT INTO lesson(tch_no, std_no, sub_no, lesson_desc, lesson_fee, sdt, edt)
VALUES (9, 6, 3, "World's best Mathematics lesson", 400000, '2019-3-3', '2019-4-4');

-- 일별수업! (FK: lesson_no)
INSERT INTO day_lesson(lesson_no, lesson_date, lesson_start_hr, lesson_end_hr, lesson_summ, lesson_eval)
VALUES (1, now(), '16:00', '18:00', 'Beauty of Korean', "Horrible");
INSERT INTO day_lesson(lesson_no, lesson_date, lesson_start_hr, lesson_end_hr, lesson_summ, lesson_eval)
VALUES (2, now(), '16:00', '18:00', 'Beauty of Korean', "He didn't listen to me");
INSERT INTO day_lesson(lesson_no, lesson_date, lesson_start_hr, lesson_end_hr, lesson_summ, lesson_eval)
VALUES (3, now(), '16:00', '18:00', 'Beauty of Korean', "KNOCK KNOCK");

-- 커리큘럼 (FK: lesson_no)
INSERT INTO curriculum(lesson_no, curr_lesson_dt, curr_lesson_st, curr_lesson_et)
VALUES (1, '1010111', '18:00', '20:00');
INSERT INTO curriculum(lesson_no, curr_lesson_dt, curr_lesson_st, curr_lesson_et)
VALUES (2, '1010100', '16:00', '18:00');
INSERT INTO curriculum(lesson_no, curr_lesson_dt, curr_lesson_st, curr_lesson_et)
VALUES (3, '0111111', '17:00', '19:00');

-- 커리큘럼수업내용 (FK: curr_no)
INSERT INTO curr_lesson_conts(lesson_no, lesson_conts, lesson_days)
VALUES (1, 'blah blah1', 2);
INSERT INTO curr_lesson_conts(lesson_no, lesson_conts, lesson_days)
VALUES (2, 'blah blah2', 1);
INSERT INTO curr_lesson_conts(lesson_no, lesson_conts, lesson_days)
VALUES (3, 'blah blah3', 3);

