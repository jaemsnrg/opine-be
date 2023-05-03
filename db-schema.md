# Table schema - created at https://dbdiagram.io (/d/63bd78856afaa541e5d18a4a)


Table orders as O {
  id bigserial [pk]
  product bigint [not null, ref: > P.id]
  customer bigint [not null, ref: > C.id] 
  quantity bigint [not null]
  created_at timestamptz [not null, default: `now()`]

  Indexes {
    product
    customer
  }
}

Table customers as C {
  id bigserial [pk]
  first_name varchar [not null]
  last_name varchar [not null]
  email varchar [not null]
  phone varchar [not null]
  address varchar [not null]

  Indexes {
    email
  }
}

Table products as P {
  id bigserial [pk]
  name varchar [not null]
}