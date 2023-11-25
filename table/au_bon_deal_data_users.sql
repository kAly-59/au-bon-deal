CREATE TABLE au_bon_deal_data_users (
    user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_pseudo VARCHAR(50),
    user_name VARCHAR(50),
    user_password VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO au_bon_deal_data_users (user_pseudo, user_name, user_password, created_at)
VALUES 
    ('alice', 'Alice', 'pass123', CURRENT_TIMESTAMP),
    ('bob', 'Bob', 'bobpwd', CURRENT_TIMESTAMP),
    ('charlie', 'Charlie', 'testpwd', CURRENT_TIMESTAMP),
    ('dave', 'Dave', 'davepass', CURRENT_TIMESTAMP),
    ('emma', 'Emma', 'emm@123', CURRENT_TIMESTAMP),
    ('frank', 'Frank', 'frankie', CURRENT_TIMESTAMP),
    ('grace', 'Grace', 'grac3ful', CURRENT_TIMESTAMP),
    ('harry', 'Harry', 'harryp', CURRENT_TIMESTAMP),
    ('isabel', 'Isabel', 'isabelpass', CURRENT_TIMESTAMP);