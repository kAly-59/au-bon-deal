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
    order_total_cost_ht numeric(10,2),
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
    product_price numeric(10,2),
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
1	25.99	8	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	451e7857-d6fd-4942-bb3f-b647a57bf6cb
2	30.75	10	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	074a651c-bc5c-4a61-a8d8-d8c932769122
3	35.50	12	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	bfe774bb-a4a8-4835-b36c-f216aeacd7fa
4	40.25	14	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	2ccb2e7b-3f88-496a-9944-ec15ae4bb60a
5	45.80	16	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	72caa081-5875-4ed1-9e79-5b1497f4b695
6	50.60	18	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	6e2188a0-b0c4-4f87-b983-ef1b02cce8f0
7	55.35	20	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	af293972-f9dd-494d-a9f1-f9c4bf1cbca3
8	60.95	22	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	b77804ea-dfef-4066-8a43-3058fa80b01d
9	65.70	24	2023-11-25 14:53:14.520387	2023-11-25 14:53:14.520387	9ab01ccb-84a4-4d01-89db-90bbf461e66d
\.


--
-- Data for Name: au_bon_deal_data_product; Type: TABLE DATA; Schema: public; Owner: kaly
--

COPY public.au_bon_deal_data_product (product_uuid, product_name, product_description, product_price, product_quantity, created_at, updated_at) FROM stdin;
7b874455-f9ab-4798-9753-b8b50f2a7157	Product A	Description of Product A	100.50	50	2023-11-25	2023-11-25
c2075a7e-804d-4a1b-996f-04452e4f70be	Product B	Description of Product B	150.75	40	2023-11-25	2023-11-25
eb4539e1-ee7a-4b3f-85c5-41fb0b49c124	Product C	Description of Product C	200.25	30	2023-11-25	2023-11-25
1b4a7ec1-20e3-451d-88bd-492052639875	Product D	Description of Product D	120.00	35	2023-11-25	2023-11-25
4664493e-a739-475d-84fe-002fdeaefdce	Product E	Description of Product E	180.99	20	2023-11-25	2023-11-25
7b68b317-b934-40c6-ac1a-47020c915eb1	Product F	Description of Product F	90.25	60	2023-11-25	2023-11-25
e8a31060-0349-4a2d-b18f-0a7826e79c68	Product G	Description of Product G	210.80	25	2023-11-25	2023-11-25
ecde61d5-2c18-41d9-8742-5db2e4c947c6	Product H	Description of Product H	160.65	45	2023-11-25	2023-11-25
f5f58bd9-20c8-4bd7-b3ad-4d1d7590f9f1	Product J	Description of Product J	175.20	48	2023-11-25	2023-11-25
61bf6d1b-6172-4f12-93a9-62c06dcf2fa9	Product K	Description of Product K	140.75	42	2023-11-25	2023-11-25
4b26129a-b05c-49e9-b698-b1175187d4e7	Product I	Description of Product I	99.99	55	2023-11-25	2023-11-25
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

