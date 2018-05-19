--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-05-19 16:35:13 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13253)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 18402)
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 18400)
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 216
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- TOC entry 215 (class 1259 OID 18390)
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 18388)
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 214
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- TOC entry 225 (class 1259 OID 18466)
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    street character varying,
    building character varying,
    apartment character varying,
    comment character varying,
    city_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 18464)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 224
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- TOC entry 197 (class 1259 OID 18253)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 18336)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 18334)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 208
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 221 (class 1259 OID 18432)
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying,
    schedule json,
    country_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    phone character varying
);


--
-- TOC entry 220 (class 1259 OID 18430)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 220
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 223 (class 1259 OID 18461)
-- Name: cities_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_products (
    product_id bigint NOT NULL,
    city_id bigint NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18458)
-- Name: cities_toppings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_toppings (
    city_id bigint NOT NULL,
    topping_id bigint NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 18421)
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 18419)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 218
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 199 (class 1259 OID 18263)
-- Name: option_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.option_names (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    is_characteristic boolean
);


--
-- TOC entry 198 (class 1259 OID 18261)
-- Name: option_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.option_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 198
-- Name: option_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.option_names_id_seq OWNED BY public.option_names.id;


--
-- TOC entry 201 (class 1259 OID 18274)
-- Name: option_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.option_values (
    id bigint NOT NULL,
    value character varying,
    option_name_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 18272)
-- Name: option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 200
-- Name: option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.option_values_id_seq OWNED BY public.option_values.id;


--
-- TOC entry 232 (class 1259 OID 18627)
-- Name: order_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_products (
    id bigint NOT NULL,
    quantity integer,
    product_instance_id bigint,
    order_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 18625)
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- TOC entry 230 (class 1259 OID 18613)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    payment_method integer,
    status integer,
    address_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


--
-- TOC entry 229 (class 1259 OID 18611)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 227 (class 1259 OID 18483)
-- Name: prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    value character varying,
    city_id bigint,
    product_instance_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 18481)
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 226
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- TOC entry 205 (class 1259 OID 18302)
-- Name: product_instances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_instances (
    id bigint NOT NULL,
    product_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 18300)
-- Name: product_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_instances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_instances_id_seq OWNED BY public.product_instances.id;


--
-- TOC entry 207 (class 1259 OID 18316)
-- Name: product_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_options (
    id bigint NOT NULL,
    product_instance_id bigint,
    option_value_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 18314)
-- Name: product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_options_id_seq OWNED BY public.product_options.id;


--
-- TOC entry 203 (class 1259 OID 18291)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    is_topping boolean
);


--
-- TOC entry 202 (class 1259 OID 18289)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 202
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 228 (class 1259 OID 18504)
-- Name: products_subcategories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_subcategories (
    product_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 18245)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18347)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subcategories (
    id bigint NOT NULL,
    name character varying,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18345)
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 210
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- TOC entry 213 (class 1259 OID 18364)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    phone character varying DEFAULT ''::character varying NOT NULL,
    role integer NOT NULL,
    jti character varying NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18362)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3134 (class 2604 OID 18405)
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- TOC entry 3133 (class 2604 OID 18393)
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- TOC entry 3137 (class 2604 OID 18469)
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- TOC entry 3127 (class 2604 OID 18339)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3136 (class 2604 OID 18435)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 3135 (class 2604 OID 18424)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3122 (class 2604 OID 18266)
-- Name: option_names id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_names ALTER COLUMN id SET DEFAULT nextval('public.option_names_id_seq'::regclass);


--
-- TOC entry 3123 (class 2604 OID 18277)
-- Name: option_values id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_values ALTER COLUMN id SET DEFAULT nextval('public.option_values_id_seq'::regclass);


--
-- TOC entry 3140 (class 2604 OID 18630)
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- TOC entry 3139 (class 2604 OID 18616)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3138 (class 2604 OID 18486)
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- TOC entry 3125 (class 2604 OID 18305)
-- Name: product_instances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_instances ALTER COLUMN id SET DEFAULT nextval('public.product_instances_id_seq'::regclass);


--
-- TOC entry 3126 (class 2604 OID 18319)
-- Name: product_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options ALTER COLUMN id SET DEFAULT nextval('public.product_options_id_seq'::regclass);


--
-- TOC entry 3124 (class 2604 OID 18294)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3128 (class 2604 OID 18350)
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- TOC entry 3129 (class 2604 OID 18367)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3355 (class 0 OID 18402)
-- Dependencies: 217
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- TOC entry 3353 (class 0 OID 18390)
-- Dependencies: 215
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- TOC entry 3363 (class 0 OID 18466)
-- Dependencies: 225
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.addresses (id, street, building, apartment, comment, city_id, created_at, updated_at) FROM stdin;
1	Universitetskaya	1/2	2-336	guards	1	2018-05-12 15:28:59.26046	2018-05-12 15:28:59.26046
2	Sportivnaya	28	64	домофон есть	1	2018-05-13 15:52:46.946295	2018-05-13 15:52:46.946295
\.


--
-- TOC entry 3335 (class 0 OID 18253)
-- Dependencies: 197
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-05-12 14:43:03.893249	2018-05-12 14:43:03.893249
\.


--
-- TOC entry 3347 (class 0 OID 18336)
-- Dependencies: 209
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	pizza	2018-05-12 14:48:39.376901	2018-05-12 14:48:39.376901
2	Sushi	2018-05-17 00:02:12.166846	2018-05-17 00:02:12.166846
3	Burger	2018-05-17 00:03:00.19336	2018-05-17 00:03:00.19336
\.


--
-- TOC entry 3359 (class 0 OID 18432)
-- Dependencies: 221
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (id, name, schedule, country_id, created_at, updated_at, currency, phone) FROM stdin;
1	Kazan	\N	1	2018-05-12 14:47:57.667417	2018-05-12 14:47:57.667417	\N	\N
2	Kazan	{"opens_at":"8:00","closes_at":"23:00"}	1	2018-05-16 19:40:40.327999	2018-05-16 19:40:40.327999	RUB	\N
3	Kazan	{"opens_at":"8:00"}	1	2018-05-16 19:42:39.546353	2018-05-16 19:42:39.546353	RUB	0000000000
4	Kazan	{"opens_at":"8:00","closes_at":"23:00"}	1	2018-05-16 19:42:47.186384	2018-05-16 19:42:47.186384	RUB	0000000000
\.


--
-- TOC entry 3361 (class 0 OID 18461)
-- Dependencies: 223
-- Data for Name: cities_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities_products (product_id, city_id) FROM stdin;
1	1
2	4
2	1
\.


--
-- TOC entry 3360 (class 0 OID 18458)
-- Dependencies: 222
-- Data for Name: cities_toppings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities_toppings (city_id, topping_id) FROM stdin;
\.


--
-- TOC entry 3357 (class 0 OID 18421)
-- Dependencies: 219
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
1	Russia	2018-05-12 14:45:28.87958	2018-05-12 14:45:28.87958
\.


--
-- TOC entry 3337 (class 0 OID 18263)
-- Dependencies: 199
-- Data for Name: option_names; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.option_names (id, name, created_at, updated_at, category_id, is_characteristic) FROM stdin;
3	quantity	2018-05-17 00:02:12.223843	2018-05-17 00:02:12.223843	2	\N
1	size	2018-05-12 14:48:39.419341	2018-05-12 14:48:39.419341	1	\N
2	dough	2018-05-12 14:48:39.473752	2018-05-12 14:48:39.473752	1	\N
\.


--
-- TOC entry 3339 (class 0 OID 18274)
-- Dependencies: 201
-- Data for Name: option_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.option_values (id, value, option_name_id, created_at, updated_at) FROM stdin;
1	28cm	1	2018-05-12 15:05:42.857649	2018-05-12 15:05:42.857649
2	thin	2	2018-05-12 15:05:42.933137	2018-05-12 15:05:42.933137
3	28cm	1	2018-05-12 15:07:51.876328	2018-05-12 15:07:51.876328
4	thin	2	2018-05-12 15:07:51.923503	2018-05-12 15:07:51.923503
5	28cm	1	2018-05-16 00:06:39.488326	2018-05-16 00:06:39.488326
6	thin	2	2018-05-16 00:06:39.594302	2018-05-16 00:06:39.594302
7	28cm	1	2018-05-16 00:34:13.728966	2018-05-16 00:34:13.728966
8	thin	2	2018-05-16 00:34:13.807056	2018-05-16 00:34:13.807056
9	28cm	1	2018-05-16 00:48:19.787389	2018-05-16 00:48:19.787389
10	thin	2	2018-05-16 00:48:19.864695	2018-05-16 00:48:19.864695
11	28cm	1	2018-05-16 00:48:44.776565	2018-05-16 00:48:44.776565
12	thin	2	2018-05-16 00:48:44.824418	2018-05-16 00:48:44.824418
13	28cm	1	2018-05-16 00:48:56.318183	2018-05-16 00:48:56.318183
14	thin	2	2018-05-16 00:48:56.344513	2018-05-16 00:48:56.344513
15	28cm	1	2018-05-16 00:50:24.263812	2018-05-16 00:50:24.263812
16	thin	2	2018-05-16 00:50:24.340886	2018-05-16 00:50:24.340886
17	28cm	1	2018-05-16 00:50:50.374431	2018-05-16 00:50:50.374431
18	thin	2	2018-05-16 00:50:50.403086	2018-05-16 00:50:50.403086
\.


--
-- TOC entry 3370 (class 0 OID 18627)
-- Dependencies: 232
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_products (id, quantity, product_instance_id, order_id, created_at, updated_at) FROM stdin;
1	2	1	1	2018-05-12 16:32:09.664145	2018-05-12 16:32:09.664145
2	1	2	1	2018-05-12 16:32:09.700882	2018-05-12 16:32:09.700882
3	2	1	2	2018-05-13 15:30:10.017221	2018-05-13 15:30:10.017221
4	1	2	2	2018-05-13 15:30:10.03232	2018-05-13 15:30:10.03232
5	2	1	3	2018-05-13 15:37:18.483688	2018-05-13 15:37:18.483688
6	1	2	3	2018-05-13 15:37:18.489617	2018-05-13 15:37:18.489617
7	2	1	4	2018-05-13 15:40:23.947362	2018-05-13 15:40:23.947362
8	1	2	4	2018-05-13 15:40:23.96653	2018-05-13 15:40:23.96653
9	2	1	5	2018-05-13 15:52:47.13829	2018-05-13 15:52:47.13829
10	1	2	5	2018-05-13 15:52:47.147794	2018-05-13 15:52:47.147794
11	2	1	6	2018-05-13 16:17:32.622752	2018-05-13 16:17:32.622752
12	1	2	6	2018-05-13 16:17:32.644245	2018-05-13 16:17:32.644245
\.


--
-- TOC entry 3368 (class 0 OID 18613)
-- Dependencies: 230
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, payment_method, status, address_id, created_at, updated_at, user_id) FROM stdin;
1	\N	0	1	2018-05-12 16:32:09.64785	2018-05-12 16:32:09.64785	\N
2	\N	0	1	2018-05-13 15:30:09.985448	2018-05-13 15:30:09.985448	\N
3	\N	0	1	2018-05-13 15:37:18.426584	2018-05-13 15:37:18.426584	\N
4	\N	0	1	2018-05-13 15:40:23.940148	2018-05-13 15:40:23.940148	\N
5	\N	0	2	2018-05-13 15:52:47.132873	2018-05-13 15:52:47.132873	\N
6	\N	0	1	2018-05-13 16:17:32.578076	2018-05-13 16:17:32.578076	\N
\.


--
-- TOC entry 3365 (class 0 OID 18483)
-- Dependencies: 227
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prices (id, value, city_id, product_instance_id, created_at, updated_at) FROM stdin;
1	255	1	2	2018-05-12 15:07:51.928579	2018-05-12 15:07:51.928579
2	255	1	3	2018-05-16 00:06:39.620117	2018-05-16 00:06:39.620117
3	255	1	6	2018-05-16 00:34:13.834539	2018-05-16 00:34:13.834539
4	255	1	7	2018-05-16 00:48:19.893535	2018-05-16 00:48:19.893535
5	255	1	8	2018-05-16 00:48:44.857456	2018-05-16 00:48:44.857456
6	255	1	9	2018-05-16 00:48:56.368127	2018-05-16 00:48:56.368127
7	255	1	10	2018-05-16 00:50:24.36801	2018-05-16 00:50:24.36801
8	255	2	11	2018-05-16 00:50:50.431491	2018-05-16 00:50:50.431491
\.


--
-- TOC entry 3343 (class 0 OID 18302)
-- Dependencies: 205
-- Data for Name: product_instances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_instances (id, product_id, created_at, updated_at) FROM stdin;
1	1	2018-05-12 15:05:42.825724	2018-05-12 15:05:42.825724
2	1	2018-05-12 15:07:51.873079	2018-05-12 15:07:51.873079
3	1	2018-05-16 00:06:39.441955	2018-05-16 00:06:39.441955
4	1	2018-05-16 00:07:37.799516	2018-05-16 00:07:37.799516
5	1	2018-05-16 00:09:12.254107	2018-05-16 00:09:12.254107
6	1	2018-05-16 00:34:13.710034	2018-05-16 00:34:13.710034
7	1	2018-05-16 00:48:19.765154	2018-05-16 00:48:19.765154
8	1	2018-05-16 00:48:44.761117	2018-05-16 00:48:44.761117
9	1	2018-05-16 00:48:56.308771	2018-05-16 00:48:56.308771
10	1	2018-05-16 00:50:24.239414	2018-05-16 00:50:24.239414
11	1	2018-05-16 00:50:50.361188	2018-05-16 00:50:50.361188
\.


--
-- TOC entry 3345 (class 0 OID 18316)
-- Dependencies: 207
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_options (id, product_instance_id, option_value_id, created_at, updated_at) FROM stdin;
1	1	1	2018-05-12 15:05:42.908752	2018-05-12 15:05:42.908752
2	1	2	2018-05-12 15:05:42.937238	2018-05-12 15:05:42.937238
3	2	3	2018-05-12 15:07:51.921018	2018-05-12 15:07:51.921018
4	2	4	2018-05-12 15:07:51.926437	2018-05-12 15:07:51.926437
5	3	5	2018-05-16 00:06:39.573845	2018-05-16 00:06:39.573845
6	3	6	2018-05-16 00:06:39.609984	2018-05-16 00:06:39.609984
7	6	7	2018-05-16 00:34:13.788726	2018-05-16 00:34:13.788726
8	6	8	2018-05-16 00:34:13.823193	2018-05-16 00:34:13.823193
9	7	9	2018-05-16 00:48:19.852814	2018-05-16 00:48:19.852814
10	7	10	2018-05-16 00:48:19.881887	2018-05-16 00:48:19.881887
11	8	11	2018-05-16 00:48:44.803572	2018-05-16 00:48:44.803572
12	8	12	2018-05-16 00:48:44.845322	2018-05-16 00:48:44.845322
13	9	13	2018-05-16 00:48:56.334443	2018-05-16 00:48:56.334443
14	9	14	2018-05-16 00:48:56.357982	2018-05-16 00:48:56.357982
15	10	15	2018-05-16 00:50:24.328333	2018-05-16 00:50:24.328333
16	10	16	2018-05-16 00:50:24.356743	2018-05-16 00:50:24.356743
17	11	17	2018-05-16 00:50:50.392284	2018-05-16 00:50:50.392284
18	11	18	2018-05-16 00:50:50.420442	2018-05-16 00:50:50.420442
\.


--
-- TOC entry 3341 (class 0 OID 18291)
-- Dependencies: 203
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, description, created_at, updated_at, category_id, is_topping) FROM stdin;
1	Margharita	basic pizza with tomato and cheese	2018-05-12 14:49:06.075508	2018-05-12 14:49:06.075508	1	f
2	eferf	ergwewwergwergwergwerg	2018-05-18 23:34:07.220249	2018-05-18 23:34:07.220249	2	f
\.


--
-- TOC entry 3366 (class 0 OID 18504)
-- Dependencies: 228
-- Data for Name: products_subcategories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_subcategories (product_id, subcategory_id) FROM stdin;
\.


--
-- TOC entry 3334 (class 0 OID 18245)
-- Dependencies: 196
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20180430225902
20180430225957
20180430230037
20180430230214
20180430230429
20180501004308
20180501005355
20180501174129
20180501180808
20180505200933
20180507141550
20180509143940
20180509144253
20180509191706
20180509193022
20180509193203
20180509201245
20180509201310
20180509210811
20180510125621
20180510134202
20180510134707
20180510135101
20180510140343
20180510150938
20180510200859
20180513214648
20180515231353
\.


--
-- TOC entry 3349 (class 0 OID 18347)
-- Dependencies: 211
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subcategories (id, name, category_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3351 (class 0 OID 18364)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, created_at, updated_at, phone, role, jti) FROM stdin;
9	tiran678@icloud.com	$2a$11$8dxfHU8/13n8FkKStAmP2.RCzlB.oG1n3wNFY8mqGzG9Q2EfX0Y5G	2018-05-14 22:45:50.585012	2018-05-14 23:39:23.070175	89991571024	0	6e52401f-efe8-4bcd-9b63-1d4d0c40e05d
10	tiran123678@icloud.com	$2a$11$3qJ7ASJ97H8hdoeEnKW5sOpgqA6A1jhoADtDhQctEL.M1cByKJEU.	2018-05-16 00:03:37.258264	2018-05-16 00:03:37.258264	89991571124	0	0d27d0a4-c0d1-46d5-9c90-e2ec1171bcb8
11	tiran113678@icloud.com	$2a$11$N/d3Z7EpsEOJvs/MkN3Q9Ol2sHkB0X8m4jlYoyhZ8jkBtGuAIkUlm	2018-05-16 00:05:58.848998	2018-05-16 00:05:58.848998	89991575124	0	e4193bf0-b345-4db2-a399-4086379928a7
12	tes4567ht@test.test	$2a$11$iBLL.x7YmNYYjFQl5KD4Cep3.CghT8GDQV5vSD3ogyrH2qdFbNKbK	2018-05-16 18:54:06.24466	2018-05-16 18:54:06.24466	80001552040	0	ecac2b97-dc06-462e-afc4-1e4cf20a16d8
13	tes67ht@test.test	$2a$11$yZd1Ano4cB7BpDHqAn5N/e.qMEuP5Jh7vZMKJyjEia4hmsb6XzQHu	2018-05-16 18:56:01.473505	2018-05-16 18:56:01.473505	8000152040	0	4d71a71b-eec3-4006-aa5d-4d52d62dce6a
\.


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 216
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 214
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 224
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.addresses_id_seq', 2, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 208
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 220
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 4, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 218
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 198
-- Name: option_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.option_names_id_seq', 3, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 200
-- Name: option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.option_values_id_seq', 18, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_products_id_seq', 12, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 226
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prices_id_seq', 8, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_instances_id_seq', 11, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_options_id_seq', 18, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 202
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 210
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 1, false);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- TOC entry 3175 (class 2606 OID 18410)
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 18398)
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 18474)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3144 (class 2606 OID 18260)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3162 (class 2606 OID 18344)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3181 (class 2606 OID 18440)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 18429)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3147 (class 2606 OID 18271)
-- Name: option_names option_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_names
    ADD CONSTRAINT option_names_pkey PRIMARY KEY (id);


--
-- TOC entry 3150 (class 2606 OID 18282)
-- Name: option_values option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 18632)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 18618)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 18491)
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- TOC entry 3156 (class 2606 OID 18307)
-- Name: product_instances product_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_instances
    ADD CONSTRAINT product_instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3160 (class 2606 OID 18321)
-- Name: product_options product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (id);


--
-- TOC entry 3153 (class 2606 OID 18299)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3142 (class 2606 OID 18252)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3165 (class 2606 OID 18355)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 18374)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 1259 OID 18411)
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- TOC entry 3177 (class 1259 OID 18412)
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- TOC entry 3173 (class 1259 OID 18399)
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- TOC entry 3185 (class 1259 OID 18480)
-- Name: index_addresses_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_city_id ON public.addresses USING btree (city_id);


--
-- TOC entry 3182 (class 1259 OID 18446)
-- Name: index_cities_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_on_country_id ON public.cities USING btree (country_id);


--
-- TOC entry 3145 (class 1259 OID 18413)
-- Name: index_option_names_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_option_names_on_category_id ON public.option_names USING btree (category_id);


--
-- TOC entry 3148 (class 1259 OID 18288)
-- Name: index_option_values_on_option_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_option_values_on_option_name_id ON public.option_values USING btree (option_name_id);


--
-- TOC entry 3194 (class 1259 OID 18644)
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_order_id ON public.order_products USING btree (order_id);


--
-- TOC entry 3195 (class 1259 OID 18643)
-- Name: index_order_products_on_product_instance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_product_instance_id ON public.order_products USING btree (product_instance_id);


--
-- TOC entry 3190 (class 1259 OID 18624)
-- Name: index_orders_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_address_id ON public.orders USING btree (address_id);


--
-- TOC entry 3191 (class 1259 OID 18645)
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 3186 (class 1259 OID 18502)
-- Name: index_prices_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_city_id ON public.prices USING btree (city_id);


--
-- TOC entry 3187 (class 1259 OID 18503)
-- Name: index_prices_on_product_instance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_product_instance_id ON public.prices USING btree (product_instance_id);


--
-- TOC entry 3154 (class 1259 OID 18313)
-- Name: index_product_instances_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_instances_on_product_id ON public.product_instances USING btree (product_id);


--
-- TOC entry 3157 (class 1259 OID 18333)
-- Name: index_product_options_on_option_value_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_options_on_option_value_id ON public.product_options USING btree (option_value_id);


--
-- TOC entry 3158 (class 1259 OID 18332)
-- Name: index_product_options_on_product_instance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_options_on_product_instance_id ON public.product_options USING btree (product_instance_id);


--
-- TOC entry 3151 (class 1259 OID 18382)
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- TOC entry 3163 (class 1259 OID 18361)
-- Name: index_subcategories_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subcategories_on_category_id ON public.subcategories USING btree (category_id);


--
-- TOC entry 3166 (class 1259 OID 18375)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 3167 (class 1259 OID 18457)
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- TOC entry 3168 (class 1259 OID 18456)
-- Name: index_users_on_phone; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_phone ON public.users USING btree (phone);


--
-- TOC entry 3201 (class 2606 OID 18308)
-- Name: product_instances fk_rails_0ed6f91991; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_instances
    ADD CONSTRAINT fk_rails_0ed6f91991 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3198 (class 2606 OID 18414)
-- Name: option_names fk_rails_24c8ca9191; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_names
    ADD CONSTRAINT fk_rails_24c8ca9191 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3204 (class 2606 OID 18356)
-- Name: subcategories fk_rails_3937626525; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT fk_rails_3937626525 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3203 (class 2606 OID 18327)
-- Name: product_options fk_rails_642e6bad49; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT fk_rails_642e6bad49 FOREIGN KEY (option_value_id) REFERENCES public.option_values(id);


--
-- TOC entry 3209 (class 2606 OID 18619)
-- Name: orders fk_rails_774ef80392; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_774ef80392 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- TOC entry 3199 (class 2606 OID 18283)
-- Name: option_values fk_rails_885a92f060; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_values
    ADD CONSTRAINT fk_rails_885a92f060 FOREIGN KEY (option_name_id) REFERENCES public.option_names(id);


--
-- TOC entry 3205 (class 2606 OID 18441)
-- Name: cities fk_rails_996e05be41; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_996e05be41 FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 3206 (class 2606 OID 18475)
-- Name: addresses fk_rails_ab048f757c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_ab048f757c FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 3211 (class 2606 OID 18633)
-- Name: order_products fk_rails_af66a0eccc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_af66a0eccc FOREIGN KEY (product_instance_id) REFERENCES public.product_instances(id);


--
-- TOC entry 3202 (class 2606 OID 18322)
-- Name: product_options fk_rails_c6d89fd25b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT fk_rails_c6d89fd25b FOREIGN KEY (product_instance_id) REFERENCES public.product_instances(id);


--
-- TOC entry 3207 (class 2606 OID 18492)
-- Name: prices fk_rails_e3a3a8b4a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT fk_rails_e3a3a8b4a5 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 3212 (class 2606 OID 18638)
-- Name: order_products fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3210 (class 2606 OID 18646)
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3200 (class 2606 OID 18383)
-- Name: products fk_rails_fb915499a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 3208 (class 2606 OID 18497)
-- Name: prices fk_rails_fde84f0b19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT fk_rails_fde84f0b19 FOREIGN KEY (product_instance_id) REFERENCES public.product_instances(id);


-- Completed on 2018-05-19 16:35:14 MSK

--
-- PostgreSQL database dump complete
--

