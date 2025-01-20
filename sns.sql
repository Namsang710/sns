DROP TABLE s_like;
DROP TABLE s_follow;
DROP TABLE s_comment;
DROP TABLE s_post;
DROP TABLE s_account;


PURGE RECYCLEBIN;


CREATE TABLE s_account (
id VARCHAR2(30),
nickname VARCHAR2(30),
password VARCHAR2(30)
);

CREATE TABLE s_post (
pid NUMBER,
content VARCHAR2(300),
author VARCHAR2(30),
pdate DATE,
image VARCHAR2(10)
);

CREATE TABLE s_comment(
cid NUMBER,
pid NUMBER,
author VARCHAR2(30),
cdate DATE,
content VARCHAR2(200)
);

CREATE TABLE s_follow(
follower VARCHAR2(30),
following VARCHAR2(30)
);

CREATE TABLE s_like(
pid NUMBER,
id VARCHAR2(30)
);

ALTER TABLE s_account
ADD CONSTRAINT account_id_pk PRIMARY KEY (id);

ALTER TABLE s_post
ADD CONSTRAINT post_pid_pk PRIMARY KEY (pid);

ALTER TABLE s_comment
ADD CONSTRAINT comment_cid_pk PRIMARY KEY (cid);

ALTER TABLE s_follow
ADD CONSTRAINT follow_follower_following_pk PRIMARY KEY (follower, following);

ALTER TABLE s_like
ADD CONSTRAINT like_pid_id_pk (pid, id);

ALTER TABLE s_post
ADD CONSTRAINT post_author_fk FOREIGN KEY (author) REFERENCES s_account (id);

ALTER TABLE s_comment
ADD CONSTRAINT comment_author_fk FOREIGN KEY (author) REFERENCES s_account (id);

ALTER TABLE s_comment
ADD CONSTRAINT comment_pid_fk FOREIGN KEY (pid) REFERENCES s_post (pid);

ALTER TABLE s_follow
ADD CONSTRAINT follow_follower_fk FOREIGN KEY (follower) REFERENCES s_account (id);

ALTER TABLE s_follow
ADD CONSTRAINT follow_following_fk FOREIGN KEY (following) REFERENCES s_account (id);

ALTER TABLE s_like
ADD CONSTRAINT like_pid_fk FOREIGN KEY (pid) REFERENCES s_post (pid);

ALTER TABLE s_like
ADD CONSTRAINT like_id_fk FOREIGN KEY (id) REFERENCES  s_account (id);

CREATE SEQUENCE seq_post_pid;
CREATE SEQUENCE seq_comment_cid;
