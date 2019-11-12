-- 선생님
DROP TABLE IF EXISTS teacher RESTRICT;

-- 학생
DROP TABLE IF EXISTS student RESTRICT;

-- 학부모
DROP TABLE IF EXISTS parents RESTRICT;

-- 게시글
DROP TABLE IF EXISTS board RESTRICT;

-- 쪽지
DROP TABLE IF EXISTS message RESTRICT;

-- 수업
DROP TABLE IF EXISTS lesson RESTRICT;

-- 커리큘럼
DROP TABLE IF EXISTS curriculum RESTRICT;

-- 회원
DROP TABLE IF EXISTS member RESTRICT;

-- 일별수업
DROP TABLE IF EXISTS day_lesson RESTRICT;

-- 댓글
DROP TABLE IF EXISTS comment RESTRICT;

-- 과외희망(희망과목)
DROP TABLE IF EXISTS wanted_lesson RESTRICT;

-- 학교
DROP TABLE IF EXISTS school RESTRICT;

-- 과외과목(희망과목)
DROP TABLE IF EXISTS lesson_subject RESTRICT;

-- 과목
DROP TABLE IF EXISTS subject RESTRICT;

-- 게시판유형
DROP TABLE IF EXISTS board_type RESTRICT;

-- 게시글첨부파일
DROP TABLE IF EXISTS board_file RESTRICT;

-- 선생님 사진
DROP TABLE IF EXISTS teacher_photo RESTRICT;

-- 회원유형
DROP TABLE IF EXISTS member_type RESTRICT;

-- 학교유형
DROP TABLE IF EXISTS school_type RESTRICT;

-- 커리큘럼수업내용
DROP TABLE IF EXISTS curr_lesson_conts RESTRICT;

-- 선생님
CREATE TABLE teacher (
  tch_no       INTEGER      NOT NULL, -- 선생님번호
  acc_no       VARCHAR(30)  NOT NULL, -- 계좌번호
  bank_name    VARCHAR(15)  NOT NULL, -- 은행명
  lesson_certi VARCHAR(255) NOT NULL, -- 과외신고서
  tch_intro    TEXT         NOT NULL, -- 자기소개
  appr_stat    BOOLEAN      NOT NULL DEFAULT false, -- 승인상태
  vid_addr     VARCHAR(255) NULL      -- 자기소개영상주소
);

-- 선생님
ALTER TABLE teacher
  ADD CONSTRAINT PK_teacher -- 선생님 기본키
    PRIMARY KEY (
      tch_no -- 선생님번호
    );

-- 선생님 유니크 인덱스
CREATE UNIQUE INDEX UIX_teacher
  ON teacher ( -- 선생님
    acc_no ASC -- 계좌번호
  );

-- 학생
CREATE TABLE student (
  std_no         INTEGER NOT NULL, -- 학생번호
  parents_no     INTEGER NULL,     -- 학부모번호
  sch_type_no    INTEGER NULL,     -- 학교유형번호
  req_to_teacher TEXT    NULL      -- 선생님께바라는점
);

-- 학생
ALTER TABLE student
  ADD CONSTRAINT PK_student -- 학생 기본키
    PRIMARY KEY (
      std_no -- 학생번호
    );

-- 학부모
CREATE TABLE parents (
  parents_no INTEGER NOT NULL, -- 학부모번호
  kakaotalk  BOOLEAN NOT NULL DEFAULT false -- 카톡수신여부
);

-- 학부모
ALTER TABLE parents
  ADD CONSTRAINT PK_parents -- 학부모 기본키
    PRIMARY KEY (
      parents_no -- 학부모번호
    );

-- 게시글
CREATE TABLE board (
  board_no      INTEGER     NOT NULL, -- 게시글번호
  board_type_no INTEGER     NOT NULL, -- 게시판유형번호
  mem_no        INTEGER     NOT NULL, -- 회원번호
  titl          VARCHAR(50) NOT NULL, -- 제목
  conts         TEXT        NOT NULL, -- 내용
  cdt           DATETIME    NOT NULL, -- 작성일
  vw_cnt        INTEGER     NOT NULL DEFAULT 0 -- 조회수
);

-- 게시글
ALTER TABLE board
  ADD CONSTRAINT PK_board -- 게시글 기본키
    PRIMARY KEY (
      board_no -- 게시글번호
    );

ALTER TABLE board
  MODIFY COLUMN board_no INTEGER NOT NULL AUTO_INCREMENT;

-- 쪽지
CREATE TABLE message (
  message_no    INTEGER  NOT NULL, -- 쪽지번호
  sender        INTEGER  NOT NULL, -- 발신인
  receiver      INTEGER  NOT NULL, -- 수신인
  message_conts TEXT     NOT NULL, -- 쪽지내용
  send_date     DATETIME NOT NULL, -- 보낸날짜
  is_read       BOOLEAN  NOT NULL DEFAULT false -- 수신여부
);

-- 쪽지
ALTER TABLE message
  ADD CONSTRAINT PK_message -- 쪽지 기본키
    PRIMARY KEY (
      message_no -- 쪽지번호
    );

ALTER TABLE message
  MODIFY COLUMN message_no INTEGER NOT NULL AUTO_INCREMENT;

-- 수업
CREATE TABLE lesson (
  lesson_no       INTEGER  NOT NULL, -- 수업번호
  tch_no          INTEGER  NOT NULL, -- 선생님번호
  std_no          INTEGER  NULL,     -- 학생번호
  sub_no          INTEGER  NOT NULL, -- 과목번호
  lesson_desc     TEXT     NOT NULL, -- 수업소개
  lesson_fee      INTEGER  NOT NULL, -- 수업료
  lesson_stat     INTEGER  NOT NULL DEFAULT 0, -- 수업상태
  std_lesson_stop BOOLEAN  NOT NULL DEFAULT false, -- 학생수업중단신청여부
  tch_lesson_stop BOOLEAN  NOT NULL DEFAULT false, -- 선생님수업중단신청여부
  sdt             DATETIME NOT NULL, -- 시작일
  edt             DATETIME NOT NULL, -- 종료일
  tch_review      TEXT     NULL,     -- 선생님후기내용
  std_review      TEXT     NULL,     -- 학생후기내용
  tch_eval        INTEGER  NULL,     -- 선생님별점
  payment         INTEGER  NULL,     -- 결제수단
  pay_day         DATETIME NULL,     -- 결제일
  cal_date        DATETIME NULL,     -- 정산일
  cal_stat        INTEGER  NULL     DEFAULT 0, -- 정산상태
  std_stop_reason TEXT     NULL,     -- 학생중단사유
  tch_stop_reason TEXT     NULL,     -- 선생님중단사유
  ref_stat        BOOLEAN  NULL     DEFAULT 0, -- 환불상태
  ref_date        DATETIME NULL,     -- 환불일
  ref_amount      INTEGER  NULL      -- 환불금액
);

-- 수업
ALTER TABLE lesson
  ADD CONSTRAINT PK_lesson -- 수업 기본키
    PRIMARY KEY (
      lesson_no -- 수업번호
    );

ALTER TABLE lesson
  MODIFY COLUMN lesson_no INTEGER NOT NULL AUTO_INCREMENT;

-- 커리큘럼
CREATE TABLE curriculum (
  lesson_no      INTEGER      NOT NULL, -- 수업번호
  curr_lesson_dt VARCHAR(255) NOT NULL, -- 수업요일
  curr_lesson_st VARCHAR(255) NOT NULL, -- 수업시작시간
  curr_lesson_et VARCHAR(255) NOT NULL, -- 수업종료시간
  total_hr       INTEGER      NOT NULL DEFAULT 0 -- 총수업시간
);

-- 커리큘럼
ALTER TABLE curriculum
  ADD CONSTRAINT PK_curriculum -- 커리큘럼 기본키
    PRIMARY KEY (
      lesson_no -- 수업번호
    );

-- 회원
CREATE TABLE member (
  mem_no         INTEGER      NOT NULL, -- 회원번호
  mem_type_no    INTEGER      NOT NULL, -- 회원구분번호
  reg_date       DATETIME     NOT NULL, -- 가입일
  gender         VARCHAR(1)   NOT NULL, -- 성별
  dob            DATETIME     NOT NULL, -- 생년월일
  id             VARCHAR(15)  NOT NULL, -- 아이디
  email          VARCHAR(40)  NOT NULL, -- 이메일
  name           VARCHAR(15)  NOT NULL, -- 이름
  pwd            VARCHAR(255) NOT NULL, -- 비밀번호
  addr_city      VARCHAR(255) NULL,     -- 주소(시/도)
  addr_sub       VARCHAR(255) NULL,     -- 주소(시/군/구)
  tel            VARCHAR(30)  NULL,     -- 전화번호
  profile_photo  VARCHAR(255) NULL,     -- 프로필사진
  curr_lesson_dt VARCHAR(255) NULL,     -- 수업요일
  curr_lesson_st VARCHAR(255) NULL,     -- 수업시작시간
  curr_lesson_et VARCHAR(255) NULL,     -- 수업종료시간
  email_checked  BOOLEAN      NULL     DEFAULT false, -- 이메일인증여부
  activation_key VARCHAR(255) NULL      -- 인증번호
);

-- 회원
ALTER TABLE member
  ADD CONSTRAINT PK_member -- 회원 기본키
    PRIMARY KEY (
      mem_no -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_member
  ON member ( -- 회원
    email ASC -- 이메일
  );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_member2
  ON member ( -- 회원
    id ASC -- 아이디
  );

-- 회원 유니크 인덱스3
CREATE UNIQUE INDEX UIX_member3
  ON member ( -- 회원
    tel ASC -- 전화번호
  );

ALTER TABLE member
  MODIFY COLUMN mem_no INTEGER NOT NULL AUTO_INCREMENT;

-- 일별수업
CREATE TABLE day_lesson (
  day_lesson_no   INTEGER      NOT NULL, -- 일별수업번호
  lesson_no       INTEGER      NOT NULL, -- 수업번호
  lesson_date     DATETIME     NOT NULL, -- 수업일
  lesson_start_hr VARCHAR(255) NOT NULL, -- 수업시작시간
  lesson_end_hr   VARCHAR(255) NOT NULL, -- 수업종료시간
  lesson_summ     TEXT         NOT NULL, -- 수업내용정리
  lesson_eval     TEXT         NOT NULL  -- 수업평가
);

-- 일별수업
ALTER TABLE day_lesson
  ADD CONSTRAINT PK_day_lesson -- 일별수업 기본키
    PRIMARY KEY (
      day_lesson_no -- 일별수업번호
    );

ALTER TABLE day_lesson
  MODIFY COLUMN day_lesson_no INTEGER NOT NULL AUTO_INCREMENT;

-- 댓글
CREATE TABLE comment (
  cmt_no   INTEGER  NOT NULL, -- 댓글번호
  board_no INTEGER  NOT NULL, -- 게시글번호
  mem_no   INTEGER  NOT NULL, -- 회원번호
  conts    TEXT     NOT NULL, -- 내용
  cdt      DATETIME NOT NULL  -- 댓글작성일
);

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT PK_comment -- 댓글 기본키
    PRIMARY KEY (
      cmt_no -- 댓글번호
    );

ALTER TABLE comment
  MODIFY COLUMN cmt_no INTEGER NOT NULL AUTO_INCREMENT;

-- 과외희망(희망과목)
CREATE TABLE wanted_lesson (
  wtd_lesson_no INTEGER  NOT NULL, -- 과외희망번호
  std_no        INTEGER  NOT NULL, -- 학생번호
  sub_no        INTEGER  NOT NULL, -- 과목번호
  req           TEXT     NOT NULL, -- 선생님께바라는점
  rdt           DATETIME NOT NULL, -- 등록일
  wanted_fee    INTEGER  NULL      -- 희망수업료
);

-- 과외희망(희망과목)
ALTER TABLE wanted_lesson
  ADD CONSTRAINT PK_wanted_lesson -- 과외희망(희망과목) 기본키
    PRIMARY KEY (
      wtd_lesson_no -- 과외희망번호
    );

ALTER TABLE wanted_lesson
  MODIFY COLUMN wtd_lesson_no INTEGER NOT NULL AUTO_INCREMENT;

-- 학교
CREATE TABLE school (
  sch_no      INTEGER      NOT NULL, -- 학교번호
  tch_no      INTEGER      NOT NULL, -- 선생님번호
  sch_type_no INTEGER      NOT NULL, -- 학교유형번호
  sch_name    VARCHAR(30)  NOT NULL, -- 학교명
  grad        BOOLEAN      NOT NULL DEFAULT false, -- 졸업유무
  mdt         DATETIME     NOT NULL, -- 변경일
  major       VARCHAR(50)  NULL,     -- 전공
  certi       VARCHAR(255) NULL,     -- 증명서
  confirm     BOOLEAN      NULL     DEFAULT false, -- 검증여부
  grad_date   DATETIME     NULL      -- 졸업일
);

-- 학교
ALTER TABLE school
  ADD CONSTRAINT PK_school -- 학교 기본키
    PRIMARY KEY (
      sch_no -- 학교번호
    );

ALTER TABLE school
  MODIFY COLUMN sch_no INTEGER NOT NULL AUTO_INCREMENT;

-- 과외과목(희망과목)
CREATE TABLE lesson_subject (
  lesson_sub_no INTEGER  NOT NULL, -- 과외과목번호
  tch_no        INTEGER  NOT NULL, -- 선생님번호
  sub_no        INTEGER  NOT NULL, -- 과목번호
  sub_conts     TEXT     NOT NULL, -- 과외내용
  rdt           DATETIME NOT NULL, -- 등록일
  wanted_fee    INTEGER  NULL      -- 희망수업료
);

-- 과외과목(희망과목)
ALTER TABLE lesson_subject
  ADD CONSTRAINT PK_lesson_subject -- 과외과목(희망과목) 기본키
    PRIMARY KEY (
      lesson_sub_no -- 과외과목번호
    );

ALTER TABLE lesson_subject
  MODIFY COLUMN lesson_sub_no INTEGER NOT NULL AUTO_INCREMENT;

-- 과목
CREATE TABLE subject (
  sub_no      INTEGER     NOT NULL, -- 과목번호
  sch_type_no INTEGER     NOT NULL, -- 학교유형번호
  sub_name    VARCHAR(15) NOT NULL  -- 과목명
);

-- 과목
ALTER TABLE subject
  ADD CONSTRAINT PK_subject -- 과목 기본키
    PRIMARY KEY (
      sub_no -- 과목번호
    );

ALTER TABLE subject
  MODIFY COLUMN sub_no INTEGER NOT NULL AUTO_INCREMENT;

-- 게시판유형
CREATE TABLE board_type (
  board_type_no INTEGER     NOT NULL, -- 게시판유형번호
  board_name    VARCHAR(50) NOT NULL  -- 게시판명
);

-- 게시판유형
ALTER TABLE board_type
  ADD CONSTRAINT PK_board_type -- 게시판유형 기본키
    PRIMARY KEY (
      board_type_no -- 게시판유형번호
    );

ALTER TABLE board_type
  MODIFY COLUMN board_type_no INTEGER NOT NULL AUTO_INCREMENT;

-- 게시글첨부파일
CREATE TABLE board_file (
  file_no   INTEGER      NOT NULL, -- 게시글첨부파일번호
  file_name VARCHAR(255) NOT NULL, -- 첨부파일명
  board_no  INTEGER      NULL      -- 게시글번호
);

-- 게시글첨부파일
ALTER TABLE board_file
  ADD CONSTRAINT PK_board_file -- 게시글첨부파일 기본키
    PRIMARY KEY (
      file_no -- 게시글첨부파일번호
    );

ALTER TABLE board_file
  MODIFY COLUMN file_no INTEGER NOT NULL AUTO_INCREMENT;

-- 선생님 사진
CREATE TABLE teacher_photo (
  tch_photo_no INTEGER      NOT NULL, -- 선생님사진번호
  tch_no       INTEGER      NOT NULL, -- 선생님번호
  tch_photo    VARCHAR(255) NOT NULL  -- 선생님사진
);

-- 선생님 사진
ALTER TABLE teacher_photo
  ADD CONSTRAINT PK_teacher_photo -- 선생님 사진 기본키
    PRIMARY KEY (
      tch_photo_no -- 선생님사진번호
    );

ALTER TABLE teacher_photo
  MODIFY COLUMN tch_photo_no INTEGER NOT NULL AUTO_INCREMENT;

-- 회원유형
CREATE TABLE member_type (
  mem_type_no   INTEGER      NOT NULL, -- 회원구분번호
  mem_type_name VARCHAR(255) NOT NULL  -- 회원구분
);

-- 회원유형
ALTER TABLE member_type
  ADD CONSTRAINT PK_member_type -- 회원유형 기본키
    PRIMARY KEY (
      mem_type_no -- 회원구분번호
    );

ALTER TABLE member_type
  MODIFY COLUMN mem_type_no INTEGER NOT NULL AUTO_INCREMENT;

-- 학교유형
CREATE TABLE school_type (
  sch_type_no INTEGER     NOT NULL, -- 학교유형번호
  sch_type    VARCHAR(20) NOT NULL  -- 학교유형
);

-- 학교유형
ALTER TABLE school_type
  ADD CONSTRAINT PK_school_type -- 학교유형 기본키
    PRIMARY KEY (
      sch_type_no -- 학교유형번호
    );

ALTER TABLE school_type
  MODIFY COLUMN sch_type_no INTEGER NOT NULL AUTO_INCREMENT;

-- 커리큘럼수업내용
CREATE TABLE curr_lesson_conts (
  curr_lesson_no INTEGER NOT NULL, -- 커리큘럼수업내용번호
  lesson_no      INTEGER NOT NULL, -- 수업번호
  lesson_conts   TEXT    NOT NULL, -- 수업내용
  lesson_days    INTEGER NOT NULL  -- 수업일수
);

-- 커리큘럼수업내용
ALTER TABLE curr_lesson_conts
  ADD CONSTRAINT PK_curr_lesson_conts -- 커리큘럼수업내용 기본키
    PRIMARY KEY (
      curr_lesson_no -- 커리큘럼수업내용번호
    );

ALTER TABLE curr_lesson_conts
  MODIFY COLUMN curr_lesson_no INTEGER NOT NULL AUTO_INCREMENT;

-- 선생님
ALTER TABLE teacher
  ADD CONSTRAINT FK_member_TO_teacher -- 회원 -> 선생님
    FOREIGN KEY (
      tch_no -- 선생님번호
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 학생
ALTER TABLE student
  ADD CONSTRAINT FK_member_TO_student -- 회원 -> 학생
    FOREIGN KEY (
      std_no -- 학생번호
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 학생
ALTER TABLE student
  ADD CONSTRAINT FK_parents_TO_student -- 학부모 -> 학생
    FOREIGN KEY (
      parents_no -- 학부모번호
    )
    REFERENCES parents ( -- 학부모
      parents_no -- 학부모번호
    );

-- 학생
ALTER TABLE student
  ADD CONSTRAINT FK_school_type_TO_student -- 학교유형 -> 학생
    FOREIGN KEY (
      sch_type_no -- 학교유형번호
    )
    REFERENCES school_type ( -- 학교유형
      sch_type_no -- 학교유형번호
    );

-- 학부모
ALTER TABLE parents
  ADD CONSTRAINT FK_member_TO_parents -- 회원 -> 학부모
    FOREIGN KEY (
      parents_no -- 학부모번호
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 게시글
ALTER TABLE board
  ADD CONSTRAINT FK_member_TO_board -- 회원 -> 게시글
    FOREIGN KEY (
      mem_no -- 회원번호
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 게시글
ALTER TABLE board
  ADD CONSTRAINT FK_board_type_TO_board -- 게시판유형 -> 게시글
    FOREIGN KEY (
      board_type_no -- 게시판유형번호
    )
    REFERENCES board_type ( -- 게시판유형
      board_type_no -- 게시판유형번호
    );

-- 쪽지
ALTER TABLE message
  ADD CONSTRAINT FK_member_TO_message -- 회원 -> 쪽지
    FOREIGN KEY (
      sender -- 발신인
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 쪽지
ALTER TABLE message
  ADD CONSTRAINT FK_member_TO_message2 -- 회원 -> 쪽지2
    FOREIGN KEY (
      receiver -- 수신인
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 수업
ALTER TABLE lesson
  ADD CONSTRAINT FK_teacher_TO_lesson -- 선생님 -> 수업
    FOREIGN KEY (
      tch_no -- 선생님번호
    )
    REFERENCES teacher ( -- 선생님
      tch_no -- 선생님번호
    );

-- 수업
ALTER TABLE lesson
  ADD CONSTRAINT FK_student_TO_lesson -- 학생 -> 수업
    FOREIGN KEY (
      std_no -- 학생번호
    )
    REFERENCES student ( -- 학생
      std_no -- 학생번호
    );

-- 수업
ALTER TABLE lesson
  ADD CONSTRAINT FK_subject_TO_lesson -- 과목 -> 수업
    FOREIGN KEY (
      sub_no -- 과목번호
    )
    REFERENCES subject ( -- 과목
      sub_no -- 과목번호
    );

-- 커리큘럼
ALTER TABLE curriculum
  ADD CONSTRAINT FK_lesson_TO_curriculum -- 수업 -> 커리큘럼
    FOREIGN KEY (
      lesson_no -- 수업번호
    )
    REFERENCES lesson ( -- 수업
      lesson_no -- 수업번호
    );

-- 회원
ALTER TABLE member
  ADD CONSTRAINT FK_member_type_TO_member -- 회원유형 -> 회원
    FOREIGN KEY (
      mem_type_no -- 회원구분번호
    )
    REFERENCES member_type ( -- 회원유형
      mem_type_no -- 회원구분번호
    );

-- 일별수업
ALTER TABLE day_lesson
  ADD CONSTRAINT FK_lesson_TO_day_lesson -- 수업 -> 일별수업
    FOREIGN KEY (
      lesson_no -- 수업번호
    )
    REFERENCES lesson ( -- 수업
      lesson_no -- 수업번호
    );

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT FK_member_TO_comment -- 회원 -> 댓글
    FOREIGN KEY (
      mem_no -- 회원번호
    )
    REFERENCES member ( -- 회원
      mem_no -- 회원번호
    );

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT FK_board_TO_comment -- 게시글 -> 댓글
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES board ( -- 게시글
      board_no -- 게시글번호
    );

-- 과외희망(희망과목)
ALTER TABLE wanted_lesson
  ADD CONSTRAINT FK_student_TO_wanted_lesson -- 학생 -> 과외희망(희망과목)
    FOREIGN KEY (
      std_no -- 학생번호
    )
    REFERENCES student ( -- 학생
      std_no -- 학생번호
    );

-- 과외희망(희망과목)
ALTER TABLE wanted_lesson
  ADD CONSTRAINT FK_subject_TO_wanted_lesson -- 과목 -> 과외희망(희망과목)
    FOREIGN KEY (
      sub_no -- 과목번호
    )
    REFERENCES subject ( -- 과목
      sub_no -- 과목번호
    );

-- 학교
ALTER TABLE school
  ADD CONSTRAINT FK_teacher_TO_school -- 선생님 -> 학교
    FOREIGN KEY (
      tch_no -- 선생님번호
    )
    REFERENCES teacher ( -- 선생님
      tch_no -- 선생님번호
    );

-- 학교
ALTER TABLE school
  ADD CONSTRAINT FK_school_type_TO_school -- 학교유형 -> 학교
    FOREIGN KEY (
      sch_type_no -- 학교유형번호
    )
    REFERENCES school_type ( -- 학교유형
      sch_type_no -- 학교유형번호
    );

-- 과외과목(희망과목)
ALTER TABLE lesson_subject
  ADD CONSTRAINT FK_teacher_TO_lesson_subject -- 선생님 -> 과외과목(희망과목)
    FOREIGN KEY (
      tch_no -- 선생님번호
    )
    REFERENCES teacher ( -- 선생님
      tch_no -- 선생님번호
    );

-- 과외과목(희망과목)
ALTER TABLE lesson_subject
  ADD CONSTRAINT FK_subject_TO_lesson_subject -- 과목 -> 과외과목(희망과목)
    FOREIGN KEY (
      sub_no -- 과목번호
    )
    REFERENCES subject ( -- 과목
      sub_no -- 과목번호
    );

-- 과목
ALTER TABLE subject
  ADD CONSTRAINT FK_school_type_TO_subject -- 학교유형 -> 과목
    FOREIGN KEY (
      sch_type_no -- 학교유형번호
    )
    REFERENCES school_type ( -- 학교유형
      sch_type_no -- 학교유형번호
    );

-- 게시글첨부파일
ALTER TABLE board_file
  ADD CONSTRAINT FK_board_TO_board_file -- 게시글 -> 게시글첨부파일
    FOREIGN KEY (
      board_no -- 게시글번호
    )
    REFERENCES board ( -- 게시글
      board_no -- 게시글번호
    );

-- 선생님 사진
ALTER TABLE teacher_photo
  ADD CONSTRAINT FK_teacher_TO_teacher_photo -- 선생님 -> 선생님 사진
    FOREIGN KEY (
      tch_no -- 선생님번호
    )
    REFERENCES teacher ( -- 선생님
      tch_no -- 선생님번호
    );

-- 커리큘럼수업내용
ALTER TABLE curr_lesson_conts
  ADD CONSTRAINT FK_curriculum_TO_curr_lesson_conts -- 커리큘럼 -> 커리큘럼수업내용
    FOREIGN KEY (
      lesson_no -- 수업번호
    )
    REFERENCES curriculum ( -- 커리큘럼
      lesson_no -- 수업번호
    );