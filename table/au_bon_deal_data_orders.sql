CREATE TABLE au_bon_deal_data_orders (
    order_numbers VARCHAR(50) PRIMARY KEY,
    order_total_cost_ht DECIMAL(10, 2),
    order_total_quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivrer_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_uuid UUID,
    CONSTRAINT fk_user_uuid
        FOREIGN KEY (user_uuid)
        REFERENCES au_bon_deal_data_users(user_uuid)
);

INSERT INTO au_bon_deal_data_orders (order_numbers, order_total_cost_ht, order_total_quantity, created_at, delivrer_at, user_uuid)
VALUES 
    ('1', 25.99, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'alice')),
    ('2', 30.75, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'bob')),
    ('3', 35.50, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'charlie')),
    ('4', 40.25, 14, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'dave')),
    ('5', 45.80, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'emma')),
    ('6', 50.60, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'frank')),
    ('7', 55.35, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'grace')),
    ('8', 60.95, 22, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'harry')),
    ('9', 65.70, 24, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'isabel'));
