CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE item_category AS ENUM(
    'fruits', 'vegetables', 'dairy', 'bakery', 'snack', 'grains', 'meat', 'seafood', 'beverage', 'household', 'personal', 'others'
);

CREATE TYPE item_unit AS ENUM(
    'kg', 'gm', 'lt', 'ml', 'pc', 'dozen'
);

CREATE TABLE users(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(70) NOT NULL UNIQUE,
	password_hash VARCHAR(255) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shopping_lists(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	user_id UUID NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_shopping_list_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE items(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	list_id UUID NOT NULL,
	item_name VARCHAR(100) NOT NULL,
	quantity NUMERIC(8,2) NOT NULL CHECK(quantity > 0),
	unit item_unit NOT NULL,
	category item_category NOT NULL,
	purchased BOOLEAN NOT NULL DEFAULT FALSE,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_item_list FOREIGN KEY(list_id) REFERENCES shopping_lists(id) ON DELETE CASCADE
);

CREATE INDEX idx_items_list_purchased ON items(list_id, purchased);