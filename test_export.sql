--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: insert_order_for_user(character varying, integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: kaly
--

CREATE FUNCTION public.insert_order_for_user(order_number character varying, order_cost integer, order_quantity integer, user_pseudo_to_insert character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    user_id UUID;
BEGIN
    SELECT user_uuid INTO user_id
    FROM au_bon_deal_data_users
    WHERE user_pseudo = user_pseudo_to_insert;

    INSERT INTO au_bon_deal_data_orders (order_numbers, order_total_cost_ht, order_total_quantity, created_at, delivrer_at, user_uuid)
    VALUES (order_number, order_cost, order_quantity, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, user_id);
END;
$$;


ALTER FUNCTION public.insert_order_for_user(order_number character varying, order_cost integer, order_quantity integer, user_pseudo_to_insert character varying) OWNER TO kaly;

--
-- Name: set_user_uuid(); Type: FUNCTION; Schema: public; Owner: kaly
--

CREATE FUNCTION public.set_user_uuid() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.user_uuid := (
        SELECT user_uuid
        FROM au_bon_deal_data_users
        WHERE user_pseudo = NEW.user_pseudo
    );
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_user_uuid() OWNER TO kaly;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: au_bon_deal_data_orders; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_orders (
    order_numbers character varying(50) NOT NULL,
    order_total_cost_ht integer,
    order_total_quantity integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    delivrer_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_uuid uuid
);


ALTER TABLE public.au_bon_deal_data_orders OWNER TO kaly;

--
-- Name: au_bon_deal_data_product; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_product (
    product_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(50),
    product_description character varying(50),
    product_price integer,
    product_quantity integer,
    created_at date,
    updated_at date
);


ALTER TABLE public.au_bon_deal_data_product OWNER TO kaly;

--
-- Name: au_bon_deal_data_users; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_users (
    user_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_pseudo character varying(50),
    user_name character varying(50),
    user_password character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.au_bon_deal_data_users OWNER TO kaly;

--
-- Data for Name: au_bon_deal_data_orders; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_orders (order_numbers, order_total_cost_ht, order_total_quantity, created_at, delivrer_at, user_uuid) FROM stdin;
1	25	8	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	03b95b4b-d636-4bdc-9ae3-803a52615cb0
2	30	10	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	4c6027e8-b722-40a2-a298-a68b41fe591c
3	35	12	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	09660a11-cc85-4b06-9473-b603e8b5c6bd
4	40	14	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	788b21c0-7113-4ccb-97f1-35bce4ebbfbe
5	45	16	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	c20fcec9-eb1b-454a-b04e-9148c31771fc
6	50	18	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	2518ef7f-e355-43f9-96b2-d089867bb32e
7	55	20	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	7750e809-b896-4b1a-9759-d20f48e4b9d0
8	60	22	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	32e0c2c6-ed3b-489e-833b-10ea99295005
9	65	24	2023-11-24 14:47:55.334361	2023-11-24 14:47:55.334361	88a8f5c2-7cca-4c3c-aa65-2fc931160889
\.


--
-- Data for Name: au_bon_deal_data_product; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_product (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
7a91016b-ac6f-4319-9240-02cfd9744db6	Product A	Description of Product A	100	50	2023-11-24	2023-11-24
7da77a63-2726-41c5-b8b5-892301bb34cf	Product B	Description of Product B	150	40	2023-11-24	2023-11-24
72010ec0-72b7-46df-b932-4173969cdf5a	Product C	Description of Product C	200	30	2023-11-24	2023-11-24
4c7868d6-7c90-4df7-8b9f-9261f62b1b74	Product D	Description of Product D	120	35	2023-11-24	2023-11-24
e859be61-f59f-46a3-b496-dd8fa8172e73	Product E	Description of Product E	180	20	2023-11-24	2023-11-24
9c46bbcb-cfe3-4c91-af90-b0ba24b8dd6a	Product F	Description of Product F	90	60	2023-11-24	2023-11-24
0769782e-12b2-4ccd-9222-f7e1ab5f1ee6	Product G	Description of Product G	210	25	2023-11-24	2023-11-24
8063938a-b2e1-4b21-9224-eb6870ce3e4f	Product H	Description of Product H	160	45	2023-11-24	2023-11-24
494175d4-aaea-4591-b662-f6da8d854ed8	Product I	Description of Product I	130	55	2023-11-24	2023-11-24
bdc6adc4-8603-4b2d-a372-05eb0dd6eb29	Product J	Description of Product J	175	48	2023-11-24	2023-11-24
5068fa5a-786a-4e61-8e24-22d4b15297fa	Product K	Description of Product K	140	42	2023-11-24	2023-11-24
\.


--
-- Data for Name: au_bon_deal_data_users; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_users (user_uuid, user_pseudo, user_name, user_password, created_at) FROM stdin;
03b95b4b-d636-4bdc-9ae3-803a52615cb0	alice	Alice	pass123	2023-11-24 14:14:39.881423
4c6027e8-b722-40a2-a298-a68b41fe591c	bob	Bob	bobpwd	2023-11-24 14:14:39.881423
09660a11-cc85-4b06-9473-b603e8b5c6bd	charlie	Charlie	testpwd	2023-11-24 14:14:39.881423
788b21c0-7113-4ccb-97f1-35bce4ebbfbe	dave	Dave	davepass	2023-11-24 14:14:39.881423
c20fcec9-eb1b-454a-b04e-9148c31771fc	emma	Emma	emm@123	2023-11-24 14:14:39.881423
2518ef7f-e355-43f9-96b2-d089867bb32e	frank	Frank	frankie	2023-11-24 14:14:39.881423
7750e809-b896-4b1a-9759-d20f48e4b9d0	grace	Grace	grac3ful	2023-11-24 14:14:39.881423
32e0c2c6-ed3b-489e-833b-10ea99295005	harry	Harry	harryp	2023-11-24 14:14:39.881423
88a8f5c2-7cca-4c3c-aa65-2fc931160889	isabel	Isabel	isabelpass	2023-11-24 14:14:39.881423
\.


--
-- Name: au_bon_deal_data_orders au_bon_deal_data_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders
    ADD CONSTRAINT au_bon_deal_data_orders_pkey PRIMARY KEY (order_numbers);


--
-- Name: au_bon_deal_data_product au_bon_deal_data_product_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_product
    ADD CONSTRAINT au_bon_deal_data_product_pkey PRIMARY KEY (product_uuid);


--
-- Name: au_bon_deal_data_users au_bon_deal_data_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_users
    ADD CONSTRAINT au_bon_deal_data_users_pkey PRIMARY KEY (user_uuid);


--
-- Name: au_bon_deal_data_orders fk_user_uuid; Type: FK CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders
    ADD CONSTRAINT fk_user_uuid FOREIGN KEY (user_uuid) REFERENCES public.au_bon_deal_data_users(user_uuid);


--
-- PostgreSQL database dump complete
--

