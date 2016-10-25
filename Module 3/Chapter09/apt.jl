create table categories (
  id integer not null,
  catname varchar(40) not null,
  primary key(id)
);

create table quotes (
  id      integer not null,
  cid     integer not null,
  author  varchar(100),
  quoname varchar(250) not null,
  primary key(id)
);
