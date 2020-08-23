--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
-- Name: api_logs_method_enum; Type: TYPE; Schema: public; Owner: node_api
--

CREATE TYPE public.api_logs_method_enum AS ENUM (
    'get',
    'post',
    'put',
    'delete'
);


ALTER TYPE public.api_logs_method_enum OWNER TO node_api;

--
-- Name: user_accounts_provider_enum; Type: TYPE; Schema: public; Owner: node_api
--

CREATE TYPE public.user_accounts_provider_enum AS ENUM (
    'google',
    'kakao',
    'naver',
    'local'
);


ALTER TYPE public.user_accounts_provider_enum OWNER TO node_api;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_logs; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.api_logs (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at date,
    log text,
    method text NOT NULL,
    url text NOT NULL,
    response_time integer NOT NULL,
    user_id bigint
);


ALTER TABLE public.api_logs OWNER TO node_api;

--
-- Name: api_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.api_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_logs_id_seq OWNER TO node_api;

--
-- Name: api_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.api_logs_id_seq OWNED BY public.api_logs.id;


--
-- Name: base_cache_signaling; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.base_cache_signaling
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_cache_signaling OWNER TO node_api;

--
-- Name: base_registry_signaling; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.base_registry_signaling
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_registry_signaling OWNER TO node_api;

--
-- Name: example_board_comments; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.example_board_comments (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at date,
    comment character varying(50) NOT NULL,
    report_count integer DEFAULT 0 NOT NULL,
    example_board_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.example_board_comments OWNER TO node_api;

--
-- Name: example_board_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.example_board_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.example_board_comments_id_seq OWNER TO node_api;

--
-- Name: example_board_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.example_board_comments_id_seq OWNED BY public.example_board_comments.id;


--
-- Name: example_board_depth_comments; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.example_board_depth_comments (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at date,
    comment character varying(50) NOT NULL,
    report_count integer DEFAULT 0 NOT NULL,
    ref_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.example_board_depth_comments OWNER TO node_api;

--
-- Name: example_board_depth_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.example_board_depth_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.example_board_depth_comments_id_seq OWNER TO node_api;

--
-- Name: example_board_depth_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.example_board_depth_comments_id_seq OWNED BY public.example_board_depth_comments.id;


--
-- Name: example_boards; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.example_boards (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at date,
    title character varying(50) NOT NULL,
    content text NOT NULL,
    report_count integer DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.example_boards OWNER TO node_api;

--
-- Name: example_boards_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.example_boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.example_boards_id_seq OWNER TO node_api;

--
-- Name: example_boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.example_boards_id_seq OWNED BY public.example_boards.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO node_api;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO node_api;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: pet; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.pet (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    user_id character varying(255)
);


ALTER TABLE public.pet OWNER TO node_api;

--
-- Name: user; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public."user" (
    id character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO node_api;

--
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.user_accounts (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at date,
    provider public.user_accounts_provider_enum NOT NULL,
    client_id character varying(50) NOT NULL,
    user_id bigint
);


ALTER TABLE public.user_accounts OWNER TO node_api;

--
-- Name: user_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.user_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accounts_id_seq OWNER TO node_api;

--
-- Name: user_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.user_accounts_id_seq OWNED BY public.user_accounts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: node_api
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at date,
    nickname character varying(45) NOT NULL,
    name character varying(10) NOT NULL,
    birthday date NOT NULL,
    profile character varying(200) NOT NULL,
    phone character varying(25) NOT NULL,
    email character varying(35) NOT NULL
);


ALTER TABLE public.users OWNER TO node_api;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: node_api
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO node_api;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: node_api
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: api_logs id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.api_logs ALTER COLUMN id SET DEFAULT nextval('public.api_logs_id_seq'::regclass);


--
-- Name: example_board_comments id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_comments ALTER COLUMN id SET DEFAULT nextval('public.example_board_comments_id_seq'::regclass);


--
-- Name: example_board_depth_comments id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_depth_comments ALTER COLUMN id SET DEFAULT nextval('public.example_board_depth_comments_id_seq'::regclass);


--
-- Name: example_boards id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_boards ALTER COLUMN id SET DEFAULT nextval('public.example_boards_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: user_accounts id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.user_accounts ALTER COLUMN id SET DEFAULT nextval('public.user_accounts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: user_accounts PK_125e915cf23ad1cfb43815ce59b; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT "PK_125e915cf23ad1cfb43815ce59b" PRIMARY KEY (id);


--
-- Name: example_board_comments PK_4baff59ae62647d1ef69999f52c; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_comments
    ADD CONSTRAINT "PK_4baff59ae62647d1ef69999f52c" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: pet PK_b1ac2e88e89b9480e0c5b53fa60; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT "PK_b1ac2e88e89b9480e0c5b53fa60" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: api_logs PK_ea3f2ad34a2921407593ff4425b; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.api_logs
    ADD CONSTRAINT "PK_ea3f2ad34a2921407593ff4425b" PRIMARY KEY (id);


--
-- Name: example_boards PK_f0b8f268d3251dbb7f369dfb3fe; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_boards
    ADD CONSTRAINT "PK_f0b8f268d3251dbb7f369dfb3fe" PRIMARY KEY (id);


--
-- Name: example_board_depth_comments PK_f976a7135820312726f9fda8f33; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_depth_comments
    ADD CONSTRAINT "PK_f976a7135820312726f9fda8f33" PRIMARY KEY (id);


--
-- Name: user_accounts REL_6711686e2dc4fcf9c7c83b8373; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT "REL_6711686e2dc4fcf9c7c83b8373" UNIQUE (user_id);


--
-- Name: users UQ_bd91baecdc2f47c94fb68977af8; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_bd91baecdc2f47c94fb68977af8" UNIQUE (nickname, phone, email);


--
-- Name: user_accounts UQ_dbdda3aa4f8ded2203dfe546525; Type: CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT "UQ_dbdda3aa4f8ded2203dfe546525" UNIQUE (client_id, user_id);


--
-- Name: example_board_depth_comments FK_23949306750c268ee62b082b69f; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_depth_comments
    ADD CONSTRAINT "FK_23949306750c268ee62b082b69f" FOREIGN KEY (ref_id) REFERENCES public.example_board_comments(id);


--
-- Name: user_accounts FK_6711686e2dc4fcf9c7c83b83735; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT "FK_6711686e2dc4fcf9c7c83b83735" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: example_board_depth_comments FK_80ab0a8ab4440b9b0d4ac8ebf7f; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_depth_comments
    ADD CONSTRAINT "FK_80ab0a8ab4440b9b0d4ac8ebf7f" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: example_board_comments FK_d12cc952adda32dbed18e31fcde; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_comments
    ADD CONSTRAINT "FK_d12cc952adda32dbed18e31fcde" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: example_board_comments FK_e29047afed4a16d822aa5ce9d3c; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_board_comments
    ADD CONSTRAINT "FK_e29047afed4a16d822aa5ce9d3c" FOREIGN KEY (example_board_id) REFERENCES public.example_boards(id);


--
-- Name: api_logs FK_ebafe127b747fe9c15a2c3ef520; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.api_logs
    ADD CONSTRAINT "FK_ebafe127b747fe9c15a2c3ef520" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: example_boards FK_f8cef808835ef4cf1a4ef6d10f7; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.example_boards
    ADD CONSTRAINT "FK_f8cef808835ef4cf1a4ef6d10f7" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: pet fk_user_pet; Type: FK CONSTRAINT; Schema: public; Owner: node_api
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT fk_user_pet FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

