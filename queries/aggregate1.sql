-- Вывести названия категорий и кол-во стримов в каждой категории
select category.name as category_name, count(*) from category
left join `stream` on `stream`.category_id = category.id
group by category_name;

-- Вывести названия стримов и среднюю сумму доната для каждого стрима
select `stream`.name as stream_name, avg(donate.sum) as avg_donate_sum from `stream`
left join donate on `stream`.id = donate.stream_id
group by stream_name;

-- Вывести названия стримов и минимальную + максимальную сумму доната для каждого стрима в категории dota 2
select `stream`.name as stream_name, min(donate.sum) as min_donate_sum, max(donate.sum) as max_donate_sum
from `stream`
left join donate on `stream`.id = donate.stream_id
left join category on category.id = `stream`.category_id
where category.name = 'dota2'
group by stream_name;

-- Вывести имя пользователя, чат, и сообщения, которые пользователь оставлял в чате,где пользователь
-- является подписчиком канала, в чате которого оставлял сообщения(type_id = 1)
select user.username, channel_chat_message.channel_chat_id as chat_id, group_concat(channel_chat_message.text) as user_messages
from participant
left join user on user.id = participant.user_id
left join channel_chat_message on channel_chat_message.participant_id = participant.id
where participant.type_id = 1
group by chat_id;