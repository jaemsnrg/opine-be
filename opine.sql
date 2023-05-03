CREATE TYPE "orderstatus" AS ENUM (
  'processing',
  'issue',
  'complete'
);

CREATE TABLE "orders" (
  "id" bigserial PRIMARY KEY,
  "product" bigint NOT NULL,
  "customer" bigint NOT NULL,
  "quantity" bigint NOT NULL,
  "order_status" orderstatus NOT NULL DEFAULT 'processing',
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "customers" (
  "id" bigserial PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "address" varchar NOT NULL
);

CREATE TABLE "products" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE INDEX ON "orders" ("product");

CREATE INDEX ON "orders" ("customer");

CREATE INDEX ON "customers" ("email");

ALTER TABLE "orders" ADD FOREIGN KEY ("product") REFERENCES "products" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customer") REFERENCES "customers" ("id");
