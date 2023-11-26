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


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: au_bon_deal_data_orders; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_orders (
    order_numbers character varying(50) NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    delivrer_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_uuid uuid,
    CONSTRAINT au_bon_deal_data_orders_order_total_cost_ht_check CHECK ((order_total_cost_ht >= (0)::numeric)),
    CONSTRAINT au_bon_deal_data_orders_order_total_quantity_check CHECK ((order_total_quantity >= 0))
);


ALTER TABLE public.au_bon_deal_data_orders OWNER TO kaly;

--
-- Name: au_bon_deal_data_orders_products; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_orders_products (
    orders_products_id integer NOT NULL,
    order_numbers character varying(50),
    product_uuid uuid
);


ALTER TABLE public.au_bon_deal_data_orders_products OWNER TO kaly;

--
-- Name: au_bon_deal_data_products; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_products (
    product_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    product_name character varying(50) NOT NULL,
    product_description character varying(50),
    product_price numeric(10,2) NOT NULL,
    product_quantity integer NOT NULL,
    created_at date,
    updated_at date,
    CONSTRAINT au_bon_deal_data_products_product_price_check CHECK ((product_price >= (0)::numeric)),
    CONSTRAINT au_bon_deal_data_products_product_quantity_check CHECK ((product_quantity >= 0))
);


ALTER TABLE public.au_bon_deal_data_products OWNER TO kaly;

--
-- Name: au_bon_deal_data_users; Type: TABLE; Schema: public; Owner: kaly
--

CREATE TABLE public.au_bon_deal_data_users (
    user_uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    user_name character varying(50),
    user_password character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT password_constraints CHECK ((((length((user_password)::text) >= 8) AND (length((user_password)::text) <= 20)) AND ((user_password)::text ~ '[A-Z]'::text) AND ((user_password)::text ~ '[a-z]'::text) AND ((user_password)::text ~ '[0-9]'::text) AND ((user_password)::text ~ '[!@#$%^&*()-=_+{};:,.<>?]'::text)))
);


ALTER TABLE public.au_bon_deal_data_users OWNER TO kaly;

--
-- Data for Name: au_bon_deal_data_orders; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_orders (order_numbers, order_total_cost_ht, order_total_quantity, created_at, delivrer_at, user_uuid) FROM stdin;
1	25.99	8	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	b45b4b0a-f149-4400-9096-c8094605e9a2
2	30.75	10	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	980b72fa-395b-48aa-9c49-1f11678dd5cd
3	35.50	12	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	73d6f000-4f19-4e51-b121-33fa337379be
4	40.25	14	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	49c7da4c-1879-4bff-9bd3-de24ff2e6c5e
5	45.80	16	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	6204ab15-5409-448c-8ad5-e9084052e5e6
6	50.60	18	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	\N
7	55.35	20	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	7a8a6a59-b509-4930-a0f8-8b681cc7918c
8	60.95	22	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	32f704d5-dc4b-4b9b-9259-a53f36011500
9	65.70	24	2023-11-26 16:03:01.677663	2023-11-26 16:03:01.677663	ba8ad19d-da81-4259-a3e5-0964132bbb29
\.


--
-- Data for Name: au_bon_deal_data_orders_products; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_orders_products (orders_products_id, order_numbers, product_uuid) FROM stdin;
\.


--
-- Data for Name: au_bon_deal_data_products; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
7acdd788-659d-4f26-bdac-ee0a9a6d1ceb	Product A	Description of Product A	100.50	50	2023-11-26	2023-11-26
5c9c7821-bc34-4b7d-8ae7-146b260eeffd	Product B	Description of Product B	150.75	40	2023-11-26	2023-11-26
5d9ebdb0-d130-4640-a53a-a1d16c67e5e7	Product C	Description of Product C	200.25	30	2023-11-26	2023-11-26
1bee6abe-35f1-4c97-82d5-e4c68e2ed758	Product D	Description of Product D	120.00	35	2023-11-26	2023-11-26
511d06cf-99a2-44e5-a5cb-781c9e619565	Product E	Description of Product E	180.99	20	2023-11-26	2023-11-26
79930f2b-d35e-4ca6-8658-b62a7c8c857a	Product F	Description of Product F	90.25	60	2023-11-26	2023-11-26
8ac86ea5-da7b-4484-b0ee-f22ebe9f8c89	Product G	Description of Product G	210.80	25	2023-11-26	2023-11-26
d1287812-1711-437d-a01c-4433ac708820	Product H	Description of Product H	160.65	45	2023-11-26	2023-11-26
e00f10e2-ffa5-4089-a287-67983a9808d7	Product I	Description of Product I	130.30	55	2023-11-26	2023-11-26
fed5ffb2-2676-4597-a302-8d57f574799c	Product J	Description of Product J	175.20	48	2023-11-26	2023-11-26
2ea0b729-6f0d-429f-a49e-6bc5e3ada706	Product K	Description of Product K	140.75	42	2023-11-26	2023-11-26
\.


--
-- Data for Name: au_bon_deal_data_users; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_users (user_uuid, user_pseudo, user_name, user_password, created_at) FROM stdin;
b45b4b0a-f149-4400-9096-c8094605e9a2	ali23	Alice	Pass@123	2023-11-26 16:02:50.710886
980b72fa-395b-48aa-9c49-1f11678dd5cd	bobby85	Bob	BobP@ss1	2023-11-26 16:02:50.710886
73d6f000-4f19-4e51-b121-33fa337379be	ccrazy	Charlie	Test@Pwd12	2023-11-26 16:02:50.710886
49c7da4c-1879-4bff-9bd3-de24ff2e6c5e	daveyD	Dave	DaveP@ss2	2023-11-26 16:02:50.710886
6204ab15-5409-448c-8ad5-e9084052e5e6	emz	Emma	Emm@123!	2023-11-26 16:02:50.710886
fa45148c-96fe-4fce-a8dc-00d9bc6c9a49	frankieF	Frank	Frankie@1	2023-11-26 16:02:50.710886
7a8a6a59-b509-4930-a0f8-8b681cc7918c	gracieG	Grace	Grac3ful@	2023-11-26 16:02:50.710886
32f704d5-dc4b-4b9b-9259-a53f36011500	hazza	Harry	HarrYp@9	2023-11-26 16:02:50.710886
ba8ad19d-da81-4259-a3e5-0964132bbb29	izzy10	Isabel	IsabelP@10	2023-11-26 16:02:50.710886
\.


--
-- Name: au_bon_deal_data_orders au_bon_deal_data_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders
    ADD CONSTRAINT au_bon_deal_data_orders_pkey PRIMARY KEY (order_numbers);


--
-- Name: au_bon_deal_data_orders_products au_bon_deal_data_orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders_products
    ADD CONSTRAINT au_bon_deal_data_orders_products_pkey PRIMARY KEY (orders_products_id);


--
-- Name: au_bon_deal_data_products au_bon_deal_data_products_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_products
    ADD CONSTRAINT au_bon_deal_data_products_pkey PRIMARY KEY (product_uuid);


--
-- Name: au_bon_deal_data_users au_bon_deal_data_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_users
    ADD CONSTRAINT au_bon_deal_data_users_pkey PRIMARY KEY (user_uuid);


--
-- Name: au_bon_deal_data_users au_bon_deal_data_users_user_pseudo_key; Type: CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_users
    ADD CONSTRAINT au_bon_deal_data_users_user_pseudo_key UNIQUE (user_pseudo);


--
-- Name: au_bon_deal_data_orders_products au_bon_deal_data_orders_products_order_numbers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders_products
    ADD CONSTRAINT au_bon_deal_data_orders_products_order_numbers_fkey FOREIGN KEY (order_numbers) REFERENCES public.au_bon_deal_data_orders(order_numbers);


--
-- Name: au_bon_deal_data_orders_products au_bon_deal_data_orders_products_product_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders_products
    ADD CONSTRAINT au_bon_deal_data_orders_products_product_uuid_fkey FOREIGN KEY (product_uuid) REFERENCES public.au_bon_deal_data_products(product_uuid);


--
-- Name: au_bon_deal_data_orders fk_user_uuid; Type: FK CONSTRAINT; Schema: public; Owner: kaly
--

ALTER TABLE ONLY public.au_bon_deal_data_orders
    ADD CONSTRAINT fk_user_uuid FOREIGN KEY (user_uuid) REFERENCES public.au_bon_deal_data_users(user_uuid);


--
-- PostgreSQL database dump complete
--

