-- liquibase formatted sql
-- changeset elerphore:1

create table discounts
(
    id             integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    discount_value double precision
);

create table customers
(
    id         integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name       varchar(45) unique,
    discount_1 integer,
    discount_2 integer,

    constraint fk_discount1 foreign key (discount_1) references discounts (id) on delete cascade on update cascade,
    constraint fk_discount2 foreign key (discount_2) references discounts (id) on delete cascade on update cascade
);

create table storeitems
(
    id             integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    storeitem_name varchar(45)      not null,
    price          double precision not null,
    description    varchar(200)     not null DEFAULT '',
    average_rating double precision          default 0 not null,
    discount_id    integer,

    constraint fk_discount1 foreign key (discount_id) references discounts (id) on delete cascade on update cascade
);

create table statistics
(
    id             integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    statistic_type integer,
    storeitem_id   integer,
    customer_id    integer,
    total_price    double precision,
    discount_sum   double precision,
    orders_amount  integer,

    constraint fk_storeitem foreign key (storeitem_id) references storeitems (id) on delete cascade on update cascade,
    constraint fk_customer foreign key (customer_id) references customers (id) on delete cascade on update cascade
);

create table store_item_customer_rating
(
    id           integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    customer_id  integer,
    storeitem_id integer,
    rating       double precision,

    constraint fk_storeitem foreign key (storeitem_id) references storeitems (id) on delete cascade on update cascade
);

create table orders
(
    id           integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    customer_id  integer,
    create_date  date,
    discount_sum double precision,
    total_price  double precision,
    order_number varchar(10)
);

create table order_storeitem
(
    id           integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    order_id     integer,
    storeitem_id integer,
    amount       integer,
    price        double precision,
    discount     double precision,

    constraint fk_order foreign key (order_id) references orders (id) on delete cascade on update cascade,
    constraint fk_storeitem foreign key (storeitem_id) references storeitems (id) on delete cascade on update cascade
);
