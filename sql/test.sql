use vrink;

alter table review
    change counting count tinyint;

select *
from review;

alter table review
    add foreign key (editor_id) references editor_detail (editor_id);

alter table review
    add column editor_id int not null;

desc review;

ALTER TABLE `product_image`
    ADD CONSTRAINT `FK_product_TO_product_image_1` FOREIGN KEY (
                                                                `product_id`
        )
        REFERENCES `product` (
                              `product_id`
            );

ALTER TABLE `price_option`
    ADD CONSTRAINT `FK_product_TO_price_option_1` FOREIGN KEY (
                                                               `product_id`
        )
        REFERENCES `product` (
                              `product_id`
            );

ALTER TABLE `price_option_detail`
    ADD CONSTRAINT `FK_price_option_TO_price_option_detail_1` FOREIGN KEY (
                                                                           `price_option_id`
        )
        REFERENCES `price_option` (
                                   `price_option_id`
            );

ALTER TABLE `message`
    ADD CONSTRAINT `FK_user_TO_message_1` FOREIGN KEY (
                                                       `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `review`
    ADD CONSTRAINT `FK_editor_detail_TO_review_1` FOREIGN KEY (
                                                               `editor_id`
        )
        REFERENCES `editor_detail` (
                                    `editor_id`
            );

ALTER TABLE `review`
    ADD CONSTRAINT `FK_user_TO_review_1` FOREIGN KEY (
                                                      `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `qna`
    ADD CONSTRAINT `FK_user_TO_qna_1` FOREIGN KEY (
                                                   `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `payment`
    ADD CONSTRAINT `FK_order_TO_payment_1` FOREIGN KEY (
                                                        `order_id`
        )
        REFERENCES `order` (
                            `order_id`
            );

ALTER TABLE `order`
    ADD CONSTRAINT `FK_product_TO_order_1` FOREIGN KEY (
                                                        `product_id`
        )
        REFERENCES `product` (
                              `product_id`
            );

ALTER TABLE `order`
    ADD CONSTRAINT `FK_user_TO_order_1` FOREIGN KEY (
                                                     `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `payment_state`
    ADD CONSTRAINT `FK_payment_TO_payment_state_1` FOREIGN KEY (
                                                                `payment_id`
        )
        REFERENCES `payment` (
                              `payment_id`
            );

ALTER TABLE `community`
    ADD CONSTRAINT `FK_user_TO_community_1` FOREIGN KEY (
                                                         `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `suggest`
    ADD CONSTRAINT `FK_user_TO_suggest_1` FOREIGN KEY (
                                                       `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `editor_detail`
    ADD CONSTRAINT `FK_user_TO_editor_detail_1` FOREIGN KEY (
                                                             `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `community_reply`
    ADD CONSTRAINT `FK_community_TO_community_reply_1` FOREIGN KEY (
                                                                    `community_id`
        )
        REFERENCES `community` (
                                `community_id`
            );

ALTER TABLE `suggest_reply`
    ADD CONSTRAINT `FK_suggest_TO_suggest_reply_1` FOREIGN KEY (
                                                                `suggest_id`
        )
        REFERENCES `suggest` (
                              `suggest_id`
            );

ALTER TABLE `follow`
    ADD CONSTRAINT `FK_user_TO_follow_1` FOREIGN KEY (
                                                      `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `apply`
    ADD CONSTRAINT `FK_user_TO_apply_1` FOREIGN KEY (
                                                     `apply_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

ALTER TABLE `report`
    ADD CONSTRAINT `FK_user_TO_report_1` FOREIGN KEY (
                                                      `user_id`
        )
        REFERENCES `user` (
                           `user_id`
            );

SELECT editor_id,
       user_id,
       content,
       count
FROM review
WHERE editor_id = 0;
select *
from review;
select *
from editor_detail;
insert into editor_detail(user_id, image, content, vrm)
    value (1, 'tt', 'tt', 'tt');

select *
from review;

SELECT r.review_id,
       r.editor_id,
       r.user_id,
       r.content,
       r.count,
       CASE
           WHEN count = 2 THEN '★'
           WHEN count = 4 THEN '★★'
           WHEN count = 6 THEN '★★★'
           WHEN count = 8 THEN '★★★★'
           WHEN count = 10 THEN '★★★★★'
           ELSE ''
           END AS star,
       u.nickname,
       r.created_at
FROM review r
         LEFT JOIN user u ON r.user_id = u.user_id
WHERE editor_id = 1;

INSERT INTO community(user_id, title, content) value ()

SELECT *
FROM community;

SELECT community_id,
       user_id,
       title,
       content,
       created_at
FROM community
WHERE community_id = 2;

use vrink;
SELECT *
FROM community_reply;
select *
from user;
SELECT *
FROM editor_detail;

SELECT r.editor_id
     , profile_image
     , introduce
     , nickname
     , COALESCE(ROUND(avg(r.count / 2), 1), 0.0) as count
FROM editor_detail e
         LEFT JOIN user u ON e.user_id = u.user_id
         LEFT JOIN review r ON e.editor_id = r.editor_id
GROUP BY r.editor_id, profile_image, introduce, nickname
LIMIT;

SELECT r.editor_id
     , profile_image
     , introduce
     , nickname
     , COALESCE(ROUND(avg(r.count / 2), 1), 0.0) as count
FROM editor_detail e
         LEFT JOIN user u
                   ON e.user_id = u.user_id
         LEFT JOIN review r ON e.editor_id = r.editor_id
GROUP BY r.editor_id, profile_image, introduce, nickname;

SELECT e.editor_id,
       profile_image,
       introduce,
       nickname,
       COALESCE(ROUND(avg(r.count / 2), 1), 0.0) as count
FROM editor_detail e
         LEFT JOIN user u ON e.user_id = u.user_id
         LEFT JOIN review r ON e.editor_id = r.editor_id
GROUP BY e.editor_id, profile_image, introduce, nickname;
select *
from editor_detail;

insert into editor_detail(user_id, profile_image, introduce, image, content, vrm)
    value (1, null, 'ㅎㅇ', 'ㅎㅇ', 'ㅎㅇ', null);


use vrink;
SELECT community_id, title, nickname, c.created_at
FROM community c
         LEFT JOIN user u on c.user_id = u.user_id
WHERE

select *
from community;



insert into community(user_id, title, content)
    value (1, 'ㅅㄷㄴㅅ', 'ㅅㄷㄴㅅ');
use vrink;
SELECT qna_id
     , user_id
     , title
     , type
     , status
     , DATE_FORMAT(created_at, '%Y-%m-%d') AS created_at
FROM qna
WHERE user_id = #{userId}


select *
from qna;

CREATE TABLE `question`
(
    `q_id`       VARCHAR(255) NOT NULL,
    `qna_id`     int          NOT NULL,
    `user_id`    int          NOT NULL,
    `content`    longtext     NOT NULL,
    `created_at` timestamp    NOT NULL DEFAULT now()
);

ALTER TABLE `question`
    ADD CONSTRAINT `PK_QUESTION` PRIMARY KEY (
                                              `q_id`
        );

ALTER TABLE question
    MODIFY q_id INT NOT NULL;
ALTER TABLE question
    MODIFY q_id INT NOT NULL AUTO_INCREMENT;

desc question;

insert into question(qna_id, user_id, content, title)
    value (1, 1, 'test', 'test');



select *
from qna;
use vrink;


SELECT content
FROM analyzing_review
WHERE editor_id = 1
  AND ar_id = (SELECT max(ar_id) FROM analyzing_review WHERE editor_id = 1)


SELECT *
from community_reply;
delete
from community_reply
where 1 = 1;

select *
from community_reply;

SELECT *
FROM community;
SELECT user_id
FROM community
WHERE community_id = 122;


ALTER TABLE community_reply
    DROP FOREIGN KEY FK_community_TO_community_reply_1;
ALTER TABLE community_reply
    ADD CONSTRAINT FK_community_TO_community_reply_1
        FOREIGN KEY (community_id)
            REFERENCES community (community_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE;

ALTER TABLE community_reply
    ADD CONSTRAINT FK_community_TO_community_reply_1
        FOREIGN KEY (community_id)
            REFERENCES community (community_id)
            ON DELETE SET NULL;

select *
from payment;

SELECT *
FROM payment_state;

INSERT INTO payment_state(payment_id, customer_recognize, point)
    VALUE (1, 0, 1235);


# 구매 목록 조인

SELECT ps.point, customer_recognize, payment_state_id, ps.created_at, u.nickname, p.editor_id, p.user_id
FROM payment_state ps
         LEFT JOIN payment p ON ps.payment_id = p.payment_id
         LEFT JOIN editor_detail ed ON ed.editor_id = p.editor_id
         LEFT JOIN user u ON ed.user_id = u.user_id
WHERE p.user_id = 1
  AND customer_recognize = 0;


select *
FROM user;

select nickname
from editor_detail ed
         left join user u on u.user_id = ed.user_id;


CREATE TABLE `ad`
(
    `ad_id`       int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `ad_com_name` varchar(100)                   NOT NULL,
    `imgae`       text                           NOT NULL,
    `price`       int                            NOT NULL,
    `created_at`  timestamp                      NOT NULL DEFAULT now(),
    `ad_period`   int                            NOT NULL
);
UPDATE user
SET point = point + 1111
WHERE user_id = 1;

select *
from user;


select *
from payment;

SELECT ps.point
     , customer_recognize
     , editor_recognize
     , payment_state_id
     , ps.created_at
     , u.nickname
     , p.editor_id
     , p.user_id
     , ed.image
     , sum(pd.quantity)
     , ps.state
     , p.payment_id
FROM payment_state ps
         LEFT JOIN payment p ON ps.payment_id = p.payment_id
         LEFT JOIN payment_detail pd ON p.payment_id = pd.payment_id
         LEFT JOIN editor_detail ed ON ed.editor_id = p.editor_id
         LEFT JOIN user u ON ed.user_id = u.user_id
WHERE p.user_id = 0
  AND customer_recognize = 0
  AND ps.created_at = (select max(created_at) from payment_state where payment_id = p.payment_id)

group by ps.point, customer_recognize, editor_recognize, payment_state_id, ps.created_at, u.nickname, p.editor_id,
         p.user_id, ed.image, ps.state, p.payment_id;

select *
from payment_detail;

select *
from user;

SELECT r.reply_id
     , r.community_id
     , r.user_id
     , r.content
     , DATE_FORMAT(r.created_at, '%Y-%m-%d') AS created_at
     , u.nickname
     , c.title
FROM community_reply r
         LEFT JOIN user u ON r.user_id = u.user_id
         LEFT JOIN community c ON r.community_id = c.community_id
WHERE r.community_id = 291
LIMIT 0,5;
SELECT c.community_id, c.user_id, title, c.content, c.created_at, nickname, count(cr.community_id) AS count

FROM community c
         LEFT JOIN user u ON c.user_id = u.user_id
         LEFT JOIN community_reply cr ON c.community_id = cr.community_id
GROUP BY c.community_id, c.user_id, title, c.content, c.created_at, nickname;


UPDATE user
SET email='qwer1234@gamil.com'
WHERE user_id = 1;

SELECT *
FROM user;

INSERT INTO payment_state(payment_id, editor_recognize, customer_recognize, state, point)
    value (3, 0, 0, 'payment_done', 19000);

SELECT ps.point
     , editor_recognize
     , customer_recognize
     , payment_state_id
     , ps.created_at
     , u.nickname
     , p.editor_id
     , p.user_id
     , ed.image
     , SUM(pd.quantity) as quantity
     , ps.state
     , p.payment_id
FROM payment_state ps
         JOIN (SELECT payment_id, MAX(created_at) as max_created_at
               FROM payment_state
               GROUP BY payment_id) as ps_max
              ON ps.payment_id = ps_max.payment_id AND ps.created_at = ps_max.max_created_at
         LEFT JOIN payment p ON ps.payment_id = p.payment_id
         LEFT JOIN payment_detail pd ON p.payment_id = pd.payment_id
         LEFT JOIN editor_detail ed ON ed.editor_id = p.editor_id
         LEFT JOIN user u ON ed.user_id = u.user_id
WHERE p.user_id = 0
GROUP BY ps.point, customer_recognize, editor_recognize, payment_state_id, ps.created_at, u.nickname, p.editor_id,
         p.user_id, ed.image, ps.state, p.payment_id;

select *
from payment;

select *
from payment_state;

select state
from payment_state;

update payment_state
set customer_recognize = 1
where payment_state_id = 29;

select *
from user;
select *
from user
where user_id = 52;
SELECT user_id
FROM editor_detail
WHERE editor_id = 52;

SELECT *
FROM editor_detail;
UPDATE user
SET point = ifnull(point, 0) + 1111
WHERE user_id = (SELECT user_id
                 FROM editor_detail
                 WHERE editor_id = 52);

update user
set point = null
where user_id = 136;

SELECT *
FROM user
WHERE user_id = 136;

CREATE TABLE `refund_reason`
(
    `refund_id`        int          NOT NULL primary key auto_increment,
    `payment_id`       int          NOT NULL,
    `payment_state_id` int          NOT NULL,
    `reason`           varchar(100) NOT NULL,
    `reason_detail`    text         NULL,
    `created_at`       timestamp    NOT NULL DEFAULT now()
);


ALTER TABLE `refund_reason`
    ADD CONSTRAINT `PK_REFUND_REASON` PRIMARY KEY (
                                                   `refund_id`
        );

INSERT INTO refund_reason(payment_id, payment_state_id, reason, reason_detail)
    VALUE ()

SELECT *
FROM payment_state;

select *
from refund_reason;

SELECT *
FROM refund_reason;


select *
from payment_state;
select *
from refund_reason;

UPDATE user
SET password = '$2a$10$XozbWTHCHD3o5JplgB6c/ecU.zT6CmedOEy1b8QjJgdOXM/..NdTO'
WHERE user_id = 141;

# SELECT editor_recognize FROM payment_state
# WHERE
#     created_at = (SELECT MAX(created_at) FROM payment_state where payment_id = #{paymentId});

# 의뢰 리스트
SELECT p.payment_id,
       p.name,
       u.nickname,
       DATE_FORMAT(p.created_at, '%Y-%m-%d') AS created_at,
       (CASE
            WHEN ps.state = 'payment_done' THEN '진행중'
            WHEN ps.state = 'c_cancel' THEN '의뢰자 결제 취소'
            WHEN ps.state = 'e_cancel' THEN '작가 결제 취소'
            ELSE '거래 완료'
           END)                              AS state
FROM payment_state ps
         LEFT JOIN payment p ON ps.payment_id = p.payment_id

         LEFT JOIN user u ON p.user_id = u.user_id
         JOIN (SELECT payment_id, MAX(created_at) AS max_created_at
               FROM payment_state
               GROUP BY payment_id) AS ps_max
              ON ps.payment_id = ps_max.payment_id AND ps.created_at = ps_max.max_created_at
WHERE editor_id = 7;

SELECT COUNT(payment_id)
FROM payment
WHERE editor_id = 7;

SELECT *
FROM payment
WHERE editor_id = 7;
select *
FROM payment_state;
select *
from payment_detail;



SELECT *
FROM editor_detail;
SELECT *
FROM user
where user_id = 2;

SELECT COUNT(ps.payment_id)
FROM payment_state ps
         JOIN (SELECT payment_id, MAX(created_at) as max_created_at
               FROM payment_state
               GROUP BY payment_id) as ps_max
              ON ps.payment_id = ps_max.payment_id AND ps.created_at = ps_max.max_created_at
         LEFT JOIN payment p ON ps.payment_id = p.payment_id
         LEFT JOIN payment_detail pd ON p.payment_id = pd.payment_id
         LEFT JOIN editor_detail ed ON ed.editor_id = p.editor_id
         LEFT JOIN user u ON ed.user_id = u.user_id

WHERE p.user_id = #{userId} AND customer_recognize =0

GROUP BY ps.point, customer_recognize, editor_recognize, payment_state_id, ps.created_at, u.nickname,
         p.editor_id, p.user_id, ed.thumbnail, ps.state, p.payment_id


SELECT p.payment_id, p.name, u.nickname, u.phone, u.email, p.created_at, p.request
FROM payment p
         LEFT JOIN user u on p.user_id = u.user_id
         JOIN (SELECT payment_id, MAX(created_at) as max_created_at
               FROM payment_state
               GROUP BY payment_id) ps_max
         LEFT JOIN payment_state ps
                   ON p.payment_id = ps_max.payment_id
                       AND ps.created_at = ps_max.max_created_at
WHERE p.payment_id = 58
GROUP BY p.payment_id;



SELECT *
FROM payment;
SELECT *
FROM payment_detail
WHERE payment_id =

DESC payment;

SELECT p.payment_id,
       p.editor_id,
       p.name,
       u.nickname,
       u.phone,
       u.email,
       p.created_at,
       p.request,
       (CASE
            WHEN ps.state = 'payment_done' THEN '진행중'
            WHEN ps.state = 'c_cancel' THEN '의뢰자 결제 취소'
            WHEN ps.state = 'e_cancel' THEN '작가 결제 취소'
            ELSE '거래 완료'
           END)                         AS state,
       ifnull(ps.customer_recognize, 0) AS customer_recognize
FROM payment p
         LEFT JOIN user u on p.user_id = u.user_id
         JOIN (SELECT payment_id, MAX(created_at) AS max_created_at
               FROM payment_state
               GROUP BY payment_id) ps_max
         LEFT JOIN payment_state ps
                   ON p.payment_id = ps_max.payment_id
                       AND ps.created_at = ps_max.max_created_at
WHERE p.payment_id = 56
GROUP BY p.payment_id;

select *
from payment_state;

SELECT p.payment_id,
       p.editor_id,
       p.name,
       u.nickname,
       u.phone,
       u.email,
       p.created_at,
       p.request,
       (CASE
            WHEN ps.state = 'payment_done' THEN '진행중'
            WHEN ps.state = 'c_cancel' THEN '의뢰자 결제 취소'
            WHEN ps.state = 'e_cancel' THEN '작가 결제 취소'
            ELSE '거래 완료'
           END)                         AS state,
       ifnull(ps.customer_recognize, 0) AS customer_recognize,
       ps.editor_recognize
FROM payment p
         LEFT JOIN user u on p.user_id = u.user_id
         JOIN (SELECT payment_id, MAX(created_at) AS max_created_at
               FROM payment_state
               GROUP BY payment_id) ps_max
         LEFT JOIN payment_state ps
                   ON p.payment_id = ps_max.payment_id
                       AND ps.created_at = ps_max.max_created_at
WHERE ps.payment_id = 40
GROUP BY p.payment_id;

select *
from payment_state
where payment_id = 40;

select *
from payment_state;

select *
from payment;

CREATE TABLE `review_count`
(
    `count_id`  int NOT NULL primary key auto_increment,
    `user_id`   int NOT NULL references user (user_id),
    `editor_id` int NOT NULL references editor_detail (editor_id),
    `count`     int NOT NULL DEFAULT 0 COMMENT '리뷰 작성 가능 회수'
);

desc review_count;

select *
from review_count;

insert into review_count (user_id, editor_id)
    value (1, 1);

SELECT 1
FROM review_count
WHERE editor_id = 1
  AND user_id = 1;

select * from review_count;
DESC follow;

SELECT 1 FROM follow
WHERE user_id = 1111 AND editor_id = 4;


SELECT * FROM payment_state;



