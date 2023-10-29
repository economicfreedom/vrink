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
from  qna;

CREATE TABLE `question` (
	`q_id`	VARCHAR(255)	NOT NULL,
	`qna_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`content`	longtext	NOT NULL,
	`created_at`	timestamp	NOT NULL	DEFAULT now()
);

ALTER TABLE `question` ADD CONSTRAINT `PK_QUESTION` PRIMARY KEY (
	`q_id`
);

ALTER TABLE question MODIFY q_id INT NOT NULL;
ALTER TABLE question MODIFY q_id INT NOT NULL AUTO_INCREMENT;

desc question;

insert into question(qna_id,user_id,content,title)
value (1,1,'test','test');



select * from qna;