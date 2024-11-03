CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password_hash TEXT,
    pin TEXT,
    sso_provider_id INTEGER,
    sso_provider_user_id TEXT,
    name TEXT,
    image_url TEXT,
    quotes TEXT,
    language TEXT,
    currency TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE sso_providers (
    id SERIAL PRIMARY KEY,
    name TEXT,
    url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE wallets (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    name TEXT,
    amount INTEGER,
    is_active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE pockets (
    id SERIAL PRIMARY KEY,
    wallet_id INTEGER,
    name TEXT,
    description TEXT,
    emoji TEXT,
    amount_limit INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (wallet_id) REFERENCES wallets (id)
);

CREATE TABLE pocket_records (
    id SERIAL PRIMARY KEY,
    pocket_id INTEGER,
    name TEXT,
    amount INTEGER,
    is_expense BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (pocket_id) REFERENCES pockets (id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    wallet_id INTEGER,
    name TEXT,
    description TEXT,
    amount INTEGER,
    attachment_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (wallet_id) REFERENCES wallets (id)
);

CREATE TABLE goal_records (
    id SERIAL PRIMARY KEY,
    goal_id INTEGER,
    name TEXT,
    amount INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (goal_id) REFERENCES goals (id)
);

CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    name TEXT,
    description TEXT,
    is_unread BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

