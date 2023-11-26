CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE au_bon_deal_data_users (
    user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_pseudo VARCHAR(50) NOT NULL UNIQUE,
    user_name VARCHAR(50),
    user_password VARCHAR(255),

    CONSTRAINT password_constraints CHECK (
        LENGTH(user_password) BETWEEN 8 AND 20 AND
        user_password ~ '[A-Z]' AND
        user_password ~ '[a-z]' AND
        user_password ~ '[0-9]' AND
        user_password ~ '[!@#$%^&*()-=_+{};:,.<>?]'
    ),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO au_bon_deal_data_users (user_pseudo, user_name, user_password, created_at)
VALUES 
    ('ali23', 'Alice', 'Pass@123', CURRENT_TIMESTAMP),
    ('bobby85', 'Bob', 'BobP@ss1', CURRENT_TIMESTAMP),
    ('ccrazy', 'Charlie', 'Test@Pwd12', CURRENT_TIMESTAMP),
    ('daveyD', 'Dave', 'DaveP@ss2', CURRENT_TIMESTAMP),
    ('emz', 'Emma', 'Emm@123!', CURRENT_TIMESTAMP),
    ('frankieF', 'Frank', 'Frankie@1', CURRENT_TIMESTAMP),
    ('gracieG', 'Grace', 'Grac3ful@', CURRENT_TIMESTAMP),
    ('hazza', 'Harry', 'HarrYp@9', CURRENT_TIMESTAMP),
    ('izzy10', 'Isabel', 'IsabelP@10', CURRENT_TIMESTAMP);


