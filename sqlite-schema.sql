CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "email" TEXT,
    "password_hash" TEXT,
    "pin" TEXT,
    "sso_provider_id" INTEGER,
    "sso_provider_user_id" TEXT,
    "name" TEXT,
    "image_url" TEXT,
    "quotes" TEXT,
    "language" TEXT,
    "currency" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME
);

CREATE TABLE "sso_providers" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "url" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME
);

CREATE TABLE "wallets" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "name" TEXT,
    "amount" INTEGER,
    "is_active" BOOLEAN,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id")
);

CREATE TABLE "pockets" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "wallet_id" INTEGER,
    "name" TEXT,
    "description" TEXT,
    "emoji" TEXT,
    "amount_limit" INTEGER,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME,
    FOREIGN KEY ("wallet_id") REFERENCES "wallets" ("id")
);

CREATE TABLE "pocket_records" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "pocket_id" INTEGER,
    "name" TEXT,
    "amount" INTEGER,
    "is_expense" BOOLEAN,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME,
    FOREIGN KEY ("pocket_id") REFERENCES "pockets" ("id")
);

CREATE TABLE "goals" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "wallet_id" INTEGER,
    "name" TEXT,
    "description" TEXT,
    "amount" INTEGER,
    "attachment_url" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME,
    FOREIGN KEY ("wallet_id") REFERENCES "wallets" ("id")
);

CREATE TABLE "goal_records" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "goal_id" INTEGER,
    "name" TEXT,
    "amount" INTEGER,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME,
    FOREIGN KEY ("goal_id") REFERENCES "goals" ("id")
);

CREATE TABLE "notifications" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "name" TEXT,
    "description" TEXT,
    "is_unread" BOOLEAN,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" DATETIME,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id")
);

