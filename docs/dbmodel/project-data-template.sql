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

-- 회원 (FK: mem_type_no)
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(1, now(), 'M', '2019-01-01', 'hong11', 'hong@test.com', 'hong', password('1111'), 'Seoul', 'Seocho', '1111-2222', 'a.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(2, now(), 'M', '2019-02-02', 'lim11', 'lim@test.com', 'lim', password('1111'), 'Seoul', 'Seocho', '1111-3333', 'b.gif');
INSERT INTO member(mem_type_no, reg_date, gender, dob, id, email, name, pwd, addr_city, addr_sub, tel, profile_photo)
VALUES(3, now(), 'F', '2019-02-02', 'you11', 'you@test.com', 'you', password('1111'), 'Seoul', 'Seocho', '1111-4444', 'c.gif');

-- 학부모
INSERT INTO parents(kakaotalk)
VALUES (false);
INSERT INTO parents(kakaotalk)
VALUES (false);
INSERT INTO parents(kakaotalk)
VALUES (true);

-- 학생 (FK: parents_no, sch_type_no)
INSERT INTO student(parents_no, sch_type_no)
VALUES (1,1);
INSERT INTO student(sch_type_no)
VALUES (2);
INSERT INTO student(parents_no, sch_type_no)
VALUES (3,3);

-- 선생님
INSERT INTO teacher(acc_no, bank_name, lesson_certi, tch_intro, appr_stat, vid_addr)
VALUES ('111-111-111', 'KB STAR', 'a.gif', 'teacher intro1', false, 'video1.mp4');
INSERT INTO teacher(acc_no, bank_name, lesson_certi, tch_intro, appr_stat, vid_addr)
VALUES ('111-222-111', 'Woori', 'b.gif', 'teacher intro2', true, 'video2.mp4');
INSERT INTO teacher(acc_no, bank_name, lesson_certi, tch_intro, appr_stat)
VALUES ('111-333-111', 'Shinhan', 'c.gif', 'teacher intro3', false);

-- 선생님 사진 (FK: tch_no)
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (1, 'a.jpg');
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (2, 'b.jpg');
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (3, 'c.jpg');
INSERT INTO teacher_photo(tch_no, tch_photo)
VALUES (3, 'd.jpg');

-- 학교 (FK: tch_no, sch_type_no)
INSERT INTO school(tch_no, sch_type_no, sch_name, certi, grad, mdt, confirm, grad_date)
VALUES (1, 3, 'bit high school', 'a.gif', true, now(), true, '2019-1-1');
INSERT INTO school(tch_no, sch_type_no, sch_name, certi, grad, mdt, major, confirm)
VALUES (1, 4, 'meiji university', 'b.gif', false, now(), 'physics', true);

INSERT INTO school(tch_no, sch_type_no, sch_name, certi, grad, mdt, major, confirm, grad_date)
VALUES (2, 4, 'bit university', 'c.gif', true, now(), 'computer science', true, '2019-11-27');

-- 쪽지 (FK: sender:mem_no, receiver:mem_no)
INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (1, 2, 'test1', now());
INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (1, 2, 'test2', now());

INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (2, 1, 'test1', now());
INSERT INTO message(sender, receiver, message_conts, send_date)
VALUES (2, 1, 'test2', now());

-- 공지사항 (FK: mem_no)
INSERT INTO notice(mem_no, titl, conts, cdt)
VALUES (1, 'notice_title1', 'notice_cont1', now());
INSERT INTO notice(mem_no, titl, conts, cdt)
VALUES (1, 'notice_title2', 'notice_cont2', now());
INSERT INTO notice(mem_no, titl, conts, cdt)
VALUES (1, 'notice_title3', 'notice_cont3', now());

-- 게시판 유형
INSERT INTO board_type(board_name)
VALUES ('study_consulting_board');
INSERT INTO board_type(board_name)
VALUES ('university_consulting_board');
INSERT INTO board_type(board_name)
VALUES ('problem_solving_board');

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

INSERT INTO board_file(file_name, notice_no)
VALUES ('a.gif', 1);
INSERT INTO board_file(file_name, notice_no)
VALUES ('b.gif', 1);
INSERT INTO board_file(file_name, notice_no)
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
VALUES (2, 'korean');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (2, 'english');
INSERT INTO subject(sch_type_no, sub_name)
VALUES (2, 'math');

-- 과외희망(희망과목) (FK: std_no, sub_no)
INSERT INTO wanted_lesson(std_no, sub_no, req, rdt)
VALUES (1, 1, 'requirement1', now());
INSERT INTO wanted_lesson(std_no, sub_no, req, rdt)
VALUES (2, 2, 'requirement2', now());
INSERT INTO wanted_lesson(std_no, sub_no, req, rdt)
VALUES (3, 3, 'requirement3', now());

-- 과외과목(희망과목) (FK: tch_no, sub_no)
INSERT INTO lesson_subject(tch_no, sub_no, sub_conts, rdt, wanted_fee)
VALUES (1, 1, 'This lesson will make you the best Korean speaker', now(), 300000);
INSERT INTO lesson_subject(tch_no, sub_no, sub_conts, rdt, wanted_fee)
VALUES (2, 2, "Try this lesson! It never make you disappointed", now(), 350000);
INSERT INTO lesson_subject(tch_no, sub_no, sub_conts, rdt, wanted_fee)
VALUES (3, 3, 'Wanna be a best mathematcian? This is for you babe!', now(), 400000);

-- 수업 (FK: tch_no, stud_no, sub_no)
INSERT INTO lesson(tch_no, sub_no, lesson_desc, lesson_fee, sdt, edt)
VALUES (1, 1, "World's best Korean lesson", 300000, '2019-1-1', '2019-2-2');
INSERT INTO lesson(tch_no, std_no, sub_no, lesson_desc, lesson_fee, sdt, edt)
VALUES (2, 2, 2, "World's best English lesson", 350000, '2019-2-2', '2019-3-3');
INSERT INTO lesson(tch_no, std_no, sub_no, lesson_desc, lesson_fee, sdt, edt)
VALUES (3, 3, 3, "World's best Mathematics lesson", 400000, '2019-3-3', '2019-4-4');

-- 일별수업! (FK: lesson_no)
INSERT INTO day_lesson(lesson_no, lesson_date, lesson_start_hr, lesson_end_hr, lesson_summ, lesson_eval)
VALUES (1, now(), 17, 18, 'Beauty of Korean', "Horrible");
INSERT INTO day_lesson(lesson_no, lesson_date, lesson_start_hr, lesson_end_hr, lesson_summ, lesson_eval)
VALUES (2, now(), 17, 18, 'Beauty of Korean', "He didn't listen to me");
INSERT INTO day_lesson(lesson_no, lesson_date, lesson_start_hr, lesson_end_hr, lesson_summ, lesson_eval)
VALUES (3, now(), 17, 18, 'Beauty of Korean', "KNOCK KNOCK");

-- 커리큘럼 (FK: lesson_no)
INSERT INTO curriculum(lesson_no)
VALUES (1);
INSERT INTO curriculum(lesson_no)
VALUES (2);
INSERT INTO curriculum(lesson_no)
VALUES (3);

-- 커리큘럼수업내용 (FK: curr_no)
INSERT INTO curr_lesson_conts(curr_no, lesson_conts, lesson_days)
VALUES (1, 'blah blah1', 2);
INSERT INTO curr_lesson_conts(curr_no, lesson_conts, lesson_days)
VALUES (2, 'blah blah2', 1);
INSERT INTO curr_lesson_conts(curr_no, lesson_conts, lesson_days)
VALUES (3, 'blah blah3', 3);