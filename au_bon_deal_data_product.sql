CREATE TABLE au_bon_deal_data_product (
    product_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    product_name VARCHAR(50),
    product_description VARCHAR(50),
    product_price INT,
    product_quantity INT,
    created_at DATE,
    updated_at DATE
);

INSERT INTO au_bon_deal_data_product (product_name, product_description, product_price, product_quantity, created_at, updated_at)
VALUES 
    ('Product A', 'Description of Product A', 100, 50, CURRENT_DATE, CURRENT_DATE),
    ('Product B', 'Description of Product B', 150, 40, CURRENT_DATE, CURRENT_DATE),
    ('Product C', 'Description of Product C', 200, 30, CURRENT_DATE, CURRENT_DATE),
    ('Product D', 'Description of Product D', 120, 35, CURRENT_DATE, CURRENT_DATE),
    ('Product E', 'Description of Product E', 180, 20, CURRENT_DATE, CURRENT_DATE),
    ('Product F', 'Description of Product F', 90, 60, CURRENT_DATE, CURRENT_DATE),
    ('Product G', 'Description of Product G', 210, 25, CURRENT_DATE, CURRENT_DATE),
    ('Product H', 'Description of Product H', 160, 45, CURRENT_DATE, CURRENT_DATE),
    ('Product I', 'Description of Product I', 130, 55, CURRENT_DATE, CURRENT_DATE),
    ('Product J', 'Description of Product J', 175, 48, CURRENT_DATE, CURRENT_DATE),
    ('Product K', 'Description of Product K', 140, 42, CURRENT_DATE, CURRENT_DATE);

