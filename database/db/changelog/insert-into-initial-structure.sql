-- liquibase formatted sql
-- changeset elerphore:2

insert into discounts(discount_value)
values (2),
       (4),
       (8);

insert into customers(name, discount_1, discount_2)
values ('Иван', null, null),
       ('Пётр', 1, null),
       ('Макс', 2, 3);

insert into storeitems(storeitem_name, price)
values ('Яблоко', 11),
       ('Банан', 25),
       ('Груша', 16),
       ('Апельсин', 16),
       ('Шоколадка', 123),
       ('Кока-Кола', 90);

insert into store_item_customer_rating(customer_id, storeitem_id, rating)
values (1, 1, 1),
       (1, 2, 2),
       (2, 2, 3),
       (2, 3, 4),
       (3, 3, 5),
       (3, 4, 3);
