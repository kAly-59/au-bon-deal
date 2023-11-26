CREATE TABLE au_bon_deal_data_orders_products (
    orders_products_id INT PRIMARY KEY,
    order_numbers VARCHAR(50),
    product_uuid UUID,
    FOREIGN KEY (order_numbers) REFERENCES au_bon_deal_data_orders(order_numbers),
    FOREIGN KEY (product_uuid) REFERENCES au_bon_deal_data_products(product_uuid)
);