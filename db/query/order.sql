-- name: CreateOrder :one
INSERT INTO orders (
  product, customer, quantity, order_status
) VALUES (
  $1, $2, $3, $4
)
RETURNING *;

-- name: GetOrder :one
SELECT * FROM orders 
WHERE id = $1 LIMIT 1;

-- name: ListOrders :many
SELECT * FROM orders
ORDER BY id
LIMIT $1 
OFFSET $2;

-- name: UpdateOrder :one
UPDATE orders SET order_status = $2
WHERE id = $1
RETURNING *;

-- name: DeleteOrder :exec
DELETE FROM orders 
WHERE id = $1;