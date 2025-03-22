--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customer_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_info (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    business_name character varying(100) NOT NULL,
    message text
);


ALTER TABLE public.customer_info OWNER TO postgres;

--
-- Name: customer_info_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_info_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_info_customer_id_seq OWNER TO postgres;

--
-- Name: customer_info_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_info_customer_id_seq OWNED BY public.customer_info.customer_id;


--
-- Name: customer_info customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_info ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_info_customer_id_seq'::regclass);


--
-- Name: customer_info customer_info_business_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_info
    ADD CONSTRAINT customer_info_business_name_key UNIQUE (business_name);


--
-- Name: customer_info customer_info_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_info
    ADD CONSTRAINT customer_info_email_key UNIQUE (email);


--
-- Name: customer_info customer_info_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_info
    ADD CONSTRAINT customer_info_name_key UNIQUE (name);


--
-- Name: customer_info customer_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_info
    ADD CONSTRAINT customer_info_pkey PRIMARY KEY (customer_id);


--
-- PostgreSQL database dump complete
--

