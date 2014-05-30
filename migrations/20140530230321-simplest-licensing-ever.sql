CREATE TYPE WIDGET_TYPE AS ENUM('bolt', 'screw');

CREATE TABLE products (
    code VARCHAR PRIMARY KEY,
    name VARCHAR NOT NULL,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO products(code, name) VALUES ('LR', 'LiveReload');

CREATE TABLE license_types (
    code VARCHAR PRIMARY KEY,
    name VARCHAR NOT NULL,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO license_types(code, name) VALUES ('A', 'Personal License');
INSERT INTO license_types(code, name) VALUES ('B', 'Business License');
INSERT INTO license_types(code, name) VALUES ('E', 'Site License');

CREATE TABLE stores (
    code VARCHAR PRIMARY KEY,
    name VARCHAR NOT NULL,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO stores(code, name) VALUES ('StackSocial', 'StackSocial.com');

CREATE TABLE licenses (
    id SERIAL PRIMARY KEY,
    product_code VARCHAR NOT NULL REFERENCES products ON DELETE RESTRICT,
    license_type VARCHAR NOT NULL REFERENCES license_types ON DELETE RESTRICT,
    license_code VARCHAR NOT NULL UNIQUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    claimed BOOLEAN NOT NULL DEFAULT FALSE,
    claimed_at TIMESTAMPTZ NULL,
    claim_store VARCHAR NULL REFERENCES stores ON DELETE RESTRICT,
    claim_txn VARCHAR NULL,
    claim_qty INTEGER NULL,
    claim_ticket VARCHAR NULL,
    claim_company VARCHAR NULL,
    claim_first_name VARCHAR NULL,
    claim_last_name VARCHAR NULL,
    claim_email VARCHAR NULL,
    claim_notes TEXT NULL
);

