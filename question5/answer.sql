create table markets (
    m_id bigint AUTO_INCREMENT not null ,
    m_name varchar(255) not null,
    m_address text not null,
    m_score bigint not null,
    level int not null,
    primary key (m_id)
);

create table products (
    p_id bigint AUTO_INCREMENT not null,
    p_name varchar(255) not null,
    p_weight bigint not null,
    primary key (p_id)
);

create table prices (
    m_id bigint not null,
    p_id bigint not null,
    price bigint not null,
    foreign key (m_id) references markets(m_id),
    foreign key (p_id) references products(p_id),
    primary key (m_id, p_id)
);

create table capacities (
    level int not null,
    capacity bigint not null,
    primary key (level)
);

alter table markets add foreign key (level) references capacities(level);