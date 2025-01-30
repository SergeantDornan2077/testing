--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1+b1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1+b1)

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
-- Name: hub; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.hub (
    hid integer NOT NULL,
    ownerid integer,
    state boolean,
    hub_id character varying(255),
    system boolean,
    last_datetime timestamp with time zone,
    gas boolean DEFAULT false,
    water boolean DEFAULT false,
    door boolean DEFAULT false,
    command text,
    type_device text,
    new_device_name text,
    device_name text
);


ALTER TABLE public.hub OWNER TO admin;

--
-- Name: hub_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.hub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hub_id_seq OWNER TO admin;

--
-- Name: hub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.hub_id_seq OWNED BY public.hub.hid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    uid integer NOT NULL,
    username character varying(255) NOT NULL,
    id_tel character varying(255) NOT NULL,
    fcm_token character varying(255)
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.uid;


--
-- Name: hub hid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.hub ALTER COLUMN hid SET DEFAULT nextval('public.hub_id_seq'::regclass);


--
-- Name: users uid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: hub hub_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.hub
    ADD CONSTRAINT hub_pkey PRIMARY KEY (hid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- Name: hub hub_ownerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.hub
    ADD CONSTRAINT hub_ownerid_fkey FOREIGN KEY (ownerid) REFERENCES public.users(uid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

