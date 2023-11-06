select * from user;

DELETE FROM user WHERE user.user_id = '108';

<<<<<<< Updated upstream

=======
SELECT count(user.user_id) FROM user WHERE user.nickname = 'nickname';

SELECT user.email FROM user WHERE user.nickname = 'asdf' AND user.phone = '01011112222';
>>>>>>> Stashed changes
