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
1	25	8	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	451e7857-d6fd-4942-bb3f-b647a57bf6cb
2	30	10	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	074a651c-bc5c-4a61-a8d8-d8c932769122
3	35	12	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	bfe774bb-a4a8-4835-b36c-f216aeacd7fa
4	40	14	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	2ccb2e7b-3f88-496a-9944-ec15ae4bb60a
5	45	16	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	72caa081-5875-4ed1-9e79-5b1497f4b695
6	50	18	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	6e2188a0-b0c4-4f87-b983-ef1b02cce8f0
7	55	20	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	af293972-f9dd-494d-a9f1-f9c4bf1cbca3
8	60	22	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	b77804ea-dfef-4066-8a43-3058fa80b01d
9	65	24	2023-11-25 14:02:18.325191	2023-11-25 14:02:18.325191	9ab01ccb-84a4-4d01-89db-90bbf461e66d
\.


--
-- Data for Name: au_bon_deal_data_product; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_product (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
ef7ea229-15ee-47c7-9593-3ba9aead640e	Product A	Description of Product A	100	50	2023-11-25	2023-11-25
944e48d7-f50e-43b4-a401-714c5e1056b3	Product B	Description of Product B	150	40	2023-11-25	2023-11-25
a8ffcc31-e1f3-47b8-b568-3a3375b7f492	Product C	Description of Product C	200	30	2023-11-25	2023-11-25
42d47eb6-f0ed-4bc5-9888-220436f68ba6	Product D	Description of Product D	120	35	2023-11-25	2023-11-25
ccb2d335-a3dd-46bf-86b1-7a740be552a7	Product E	Description of Product E	180	20	2023-11-25	2023-11-25
ebc9ba78-7fa4-480e-ab4a-8b98167fb267	Product F	Description of Product F	90	60	2023-11-25	2023-11-25
888c6bf6-953f-4fb9-bd41-bcef2d7ad327	Product G	Description of Product G	210	25	2023-11-25	2023-11-25
8d84b32c-ad2e-4c57-90a8-7ec9581d6458	Product H	Description of Product H	160	45	2023-11-25	2023-11-25
635c7037-bd14-421d-a97d-8aa90e0e3eda	Product I	Description of Product I	130	55	2023-11-25	2023-11-25
b148b525-3e48-48de-a50c-d175cea615ad	Product J	Description of Product J	175	48	2023-11-25	2023-11-25
97a1cd83-fe33-4336-8ca9-51310996d4cd	Product K	Description of Product K	140	42	2023-11-25	2023-11-25
\.


--
-- Data for Name: au_bon_deal_data_users; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_users (user_uuid, user_pseudo, user_name, user_password, created_at) FROM stdin;
451e7857-d6fd-4942-bb3f-b647a57bf6cb	alice	Alice	pass123	2023-11-25 14:02:10.975369
074a651c-bc5c-4a61-a8d8-d8c932769122	bob	Bob	bobpwd	2023-11-25 14:02:10.975369
bfe774bb-a4a8-4835-b36c-f216aeacd7fa	charlie	Charlie	testpwd	2023-11-25 14:02:10.975369
2ccb2e7b-3f88-496a-9944-ec15ae4bb60a	dave	Dave	davepass	2023-11-25 14:02:10.975369
72caa081-5875-4ed1-9e79-5b1497f4b695	emma	Emma	emm@123	2023-11-25 14:02:10.975369
6e2188a0-b0c4-4f87-b983-ef1b02cce8f0	frank	Frank	frankie	2023-11-25 14:02:10.975369
af293972-f9dd-494d-a9f1-f9c4bf1cbca3	grace	Grace	grac3ful	2023-11-25 14:02:10.975369
b77804ea-dfef-4066-8a43-3058fa80b01d	harry	Harry	harryp	2023-11-25 14:02:10.975369
9ab01ccb-84a4-4d01-89db-90bbf461e66d	isabel	Isabel	isabelpass	2023-11-25 14:02:10.975369
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

