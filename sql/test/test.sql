select * from user;

DELETE FROM user WHERE user.user_id = '108';

SELECT count(user.user_id) FROM user WHERE user.nickname = 'nickname';

SELECT user.email FROM user WHERE user.nickname = 'asdf' AND user.phone = '01011112222';

SELECT COUNT(user_id) FROM user WHERE user.email = 'asdf@asdf.com' AND user.name = '엄준식';

SELECT user_id FROM user WHERE user.email = 'asdf@asdf.com';