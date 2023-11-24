CREATE TABLE au_bon_deal_data_orders (
    order_numbers VARCHAR(50) PRIMARY KEY,
    order_total_cost_ht INT,
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
    ('1', 25, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'alice')),
    ('2', 30, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'bob')),
    ('3', 35, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'charlie')),
    ('4', 40, 14, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'dave')),
    ('5', 45, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'emma')),
    ('6', 50, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'frank')),
    ('7', 55, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'grace')),
    ('8', 60, 22, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'harry')),
    ('9', 65, 24, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT user_uuid FROM au_bon_deal_data_users WHERE user_pseudo = 'isabel'));
