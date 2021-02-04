--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-1.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Rates" (
    id integer NOT NULL,
    value real NOT NULL,
    id_currency integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL
);


--
-- Name: Rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Rates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Rates_id_seq" OWNED BY public."Rates".id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currencies (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL
);


--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.currencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    symbol character varying(255) NOT NULL
);


--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- Name: Rates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Rates" ALTER COLUMN id SET DEFAULT nextval('public."Rates_id_seq"'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- Data for Name: Rates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Rates" (id, value, id_currency, "createdAt") FROM stdin;
1	11934.231	1	2021-02-04 17:24:47.892-03
2	12934.231	2	2021-02-04 17:24:59.36-03
3	13934.231	3	2021-02-04 17:25:12.556-03
4	14934.231	1	2021-02-04 17:25:24.504-03
5	11934.231	2	2021-02-04 17:25:36.022-03
6	10934.231	3	2021-02-04 17:25:46.514-03
7	15934.231	1	2021-02-04 17:25:57.118-03
8	22934.23	2	2021-02-04 17:26:09.26-03
9	33934.23	3	2021-02-04 17:26:19.11-03
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.currencies (id, description, symbol) FROM stdin;
1	bitcoin	BTC
2	etherum	ETH
3	cardano	ADA
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.currency (id, description, symbol) FROM stdin;
1	bitcoin	BTC
2	etherum	ETH
\.


--
-- Name: Rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Rates_id_seq"', 9, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.currencies_id_seq', 3, true);


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.currency_id_seq', 2, true);


--
-- Name: Rates Rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Rates"
    ADD CONSTRAINT "Rates_pkey" PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- Name: Rates Rates_id_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Rates"
    ADD CONSTRAINT "Rates_id_currency_fkey" FOREIGN KEY (id_currency) REFERENCES public.currencies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

