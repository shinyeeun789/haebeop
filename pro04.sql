-- 회원
CREATE TABLE user(
  id VARCHAR(20) PRIMARY KEY NOT NULL,
  pw VARCHAR(300) NOT NULL,
  NAME VARCHAR(50),
  email VARCHAR(100) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  addr1 VARCHAR(200),
  addr2 VARCHAR(100),
  postcode VARCHAR(10),
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  birth DATE,
  pt INT(11) DEFAULT 0,
  visited INT(11) DEFAULT 0);
  
-- 커뮤니티 카테고리 테이블 생성
CREATE TABLE category(
   cate VARCHAR(5) PRIMARY KEY NOT NULL,
   cateName VARCHAR(100) NOT NULL);


-- 카테고리 테이블 데이터
INSERT INTO category VALUES('A', '자유게시판');
INSERT INTO category VALUES('B', '교육정보');
INSERT INTO category VALUES('C', '교재/학원 추천');
INSERT INTO category VALUES('D', '진로상담');


-- 게시판 테이블 생성
CREATE TABLE board(
  cno INT PRIMARY KEY AUTO_INCREMENT,
  cate VARCHAR(5) NOT NULL,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(1000),
  author VARCHAR(20),
  resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  cnt INT DEFAULT 0,
  FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE);


-- 공지사항 테이블 생성
CREATE TABLE notice (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   nickname VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);


-- faq 테이블 생성
CREATE TABLE faq (
   fno INT  PRIMARY KEY AUTO_INCREMENT ,
   question VARCHAR(1000) NOT NULL,
   answer VARCHAR(1000) NOT NULL,
   cnt INT DEFAULT 0 NOT NULL
);


-- QNA
CREATE TABLE qna(
  qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
  title VARCHAR(100) NOT NULL,   					-- 제목
  content VARCHAR(1000) NOT NULL,   				-- 내용`
  author VARCHAR(16),   								-- 작성자
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
  lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
  par INT DEFAULT 0,													-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE);


-- 자료실
CREATE TABLE dataRoom (
  dno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id VARCHAR(20) NOT NULL,
  title varchar(100) NOT NULL,
  content varchar(2000) NOT NULL,
  regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

             
-- 업로드 된 파일 정보 테이블 생성
CREATE TABLE fileInfo(
  fno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dno INT,
  saveFolder VARCHAR(300) NOT NULL,
  originFile VARCHAR(300) NOT NULL,
  saveFile VARCHAR(300) NOT NULL
);

	
-- 과목(과목코드, 과목명, 과목단가)
CREATE TABLE SUBJECT(
	sno INT AUTO_INCREMENT PRIMARY KEY,
	sname VARCHAR(200) NOT NULL,
	sprice INT DEFAULT 0
);

-- 강의(강의코드, 강의명, 강의파일, 과목코드, 강사코드, 수강인원)
CREATE TABLE lecture(
	lno INT AUTO_INCREMENT PRIMARY KEY,
	lname VARCHAR(500) NOT NULL,
	sno INT NOT NULL,
	tno INT NOT NULL,
	maxStudent INT DEFAULT 0
);


-- 수강(수강코드, 강의코드, 학생아이디, 수강총시간, 수강 완료여부)
CREATE TABLE register(
	rno INT AUTO_INCREMENT PRIMARY KEY,
	lno INT NOT NULL,
	id VARCHAR(20) NOT NULL,
	courseTime TIME DEFAULT 0,
	completed BOOLEAN DEFAULT false
);


-- 강사(강사코드, 강사명, 연락처, 이메일)
CREATE TABLE 

-- 핵심 기능: 공지사항, 자료실, 회원, 자유게시판, 강의별 댓글,  교재와 시범강의, 결제
-- 부가 기능: 파일업로드, 채팅, 타계정 또는 SNS 로그인, 수강평, 달력, 가입 시 축하 이메일 보내기, 비밀번호 변경 시 이메일 보내기, 온라인 평가, 진도관리, 학습 스케줄러, 나의 강의실 등

-- 강의배정이란?
