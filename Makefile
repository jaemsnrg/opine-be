
postgres:
	docker run --name postgresdb -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:alpine3.17

createdb:
	docker exec -it postgresdb createdb --username=root --owner=root opine_db

dropdb:
	docker exec -it postgresdb dropdb opine_db

migrateup: 
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/opine_db?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/opine_db?sslmode=disable" -verbose down

sqlc: 
	sqlc generate

.PHONY: postgres createdb dropdb sqlc