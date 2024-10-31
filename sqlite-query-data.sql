-- Sqlite query untuk home page

SELECT 
    u.image_url AS user_image_url,
    w.name AS active_wallet_name,
    w.amount AS active_wallet_amount,
    COALESCE(SUM(CASE WHEN pr.is_expense = 0 THEN pr.amount ELSE 0 END), 0) AS total_income,
    COALESCE(SUM(CASE WHEN pr.is_expense = 1 THEN pr.amount ELSE 0 END), 0) AS total_expense,
    (SELECT COUNT(*) FROM pockets p WHERE p.wallet_id = w.id) AS total_pockets,
    (SELECT COUNT(*) FROM goals g WHERE g.wallet_id = w.id) AS total_goals,
    pr.name AS recent_transaction_name,
    CASE WHEN pr.is_expense = 1 THEN 'Expense' ELSE 'Income' END AS transaction_type,
    pr.amount AS recent_transaction_amount,
    pr.created_at AS recent_transaction_date
FROM 
    users u
JOIN 
    wallets w ON u.id = w.user_id
LEFT JOIN 
    pocket_records pr ON pr.pocket_id IN (SELECT p.id FROM pockets p WHERE p.wallet_id = w.id)
WHERE 
    w.is_active = 1
GROUP BY 
    u.id, w.id, pr.id
ORDER BY 
    pr.created_at DESC
LIMIT 1;

-- Sqlite query untuk page notifications

SELECT 
    name AS notification_name,
    description AS notification_description,
    is_unread AS is_unread,
    created_at AS notification_date
FROM 
    notifications
ORDER BY 
    created_at DESC;
	
-- Sqlite query untuk Income

SELECT 
    pr.name AS transaction_name,
    pr.amount AS transaction_amount,
    pr.created_at AS transaction_date
FROM 
    pocket_records pr
JOIN 
    pockets p ON pr.pocket_id = p.id
JOIN 
    wallets w ON p.wallet_id = w.id
WHERE 
    w.is_active = 1 AND
    pr.is_expense = 0
ORDER BY 
    pr.created_at DESC;
	
-- Sqlite query untuk Expense

SELECT 
    pr.name AS transaction_name,
    pr.amount AS transaction_amount,
    pr.created_at AS transaction_date
FROM 
    pocket_records pr
JOIN 
    pockets p ON pr.pocket_id = p.id
JOIN 
    wallets w ON p.wallet_id = w.id
WHERE 
    w.is_active = 1 AND
    pr.is_expense = 1
ORDER BY 
    pr.created_at DESC;
	
-- Sqlite query untuk halaman wallet 

SELECT 
    name AS wallet_name,
    amount AS wallet_amount,
    is_active AS is_active
FROM 
    wallets
ORDER BY 
    name; 
	
-- Sqlite query untuk halaman budget

SELECT 
    w.name AS wallet_name,
    p.emoji,
    p.name AS pocket_name,
    p.description,
    p.amount_limit,
    MAX(0, 
        COALESCE(SUM(CASE WHEN pr.is_expense = 1 THEN pr.amount ELSE 0 END), 0) - 
        COALESCE(SUM(CASE WHEN pr.is_expense = 0 THEN pr.amount ELSE 0 END), 0)
    ) AS usage
FROM 
    wallets w
JOIN 
    pockets p ON w.id = p.wallet_id
LEFT JOIN 
    pocket_records pr ON p.id = pr.pocket_id
WHERE 
    w.is_active = 1
GROUP BY 
    w.name, p.emoji, p.name, p.description, p.amount_limit;
	
-- Sqlite query untuk halaman goals

SELECT 
    g.name AS goal_name,
    g.description,
    g.amount AS goal_amount,
    COALESCE(SUM(gr.amount), 0) AS current_amount
FROM 
    wallets w
JOIN 
    goals g ON w.id = g.wallet_id
LEFT JOIN 
    goal_records gr ON g.id = gr.goal_id
WHERE 
    w.is_active = 1
GROUP BY 
    g.id, g.name, g.description, g.amount;
	
-- Sqlite query for profile page

SELECT 
    image_url,
    name,
    email,
    quotes,
    language
FROM 
    users
LIMIT 1;

