--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-05-22 13:52:50 MSK

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
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 21961)
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
-- TOC entry 216 (class 1259 OID 21959)
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 216
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- TOC entry 215 (class 1259 OID 21949)
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
-- TOC entry 214 (class 1259 OID 21947)
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 214
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- TOC entry 225 (class 1259 OID 22027)
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
-- TOC entry 224 (class 1259 OID 22025)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 224
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- TOC entry 197 (class 1259 OID 21809)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21892)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21890)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 208
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 221 (class 1259 OID 21991)
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying,
    schedule json,
    country_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency integer,
    phone character varying
);


--
-- TOC entry 220 (class 1259 OID 21989)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 223 (class 1259 OID 22022)
-- Name: cities_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_products (
    product_id bigint NOT NULL,
    city_id bigint NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 22019)
-- Name: cities_toppings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_toppings (
    city_id bigint NOT NULL,
    topping_id bigint NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 21980)
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 21978)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 218
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 199 (class 1259 OID 21819)
-- Name: option_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.option_names (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    is_characteristic boolean,
    is_belongs boolean DEFAULT false NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 21817)
-- Name: option_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.option_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 198
-- Name: option_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.option_names_id_seq OWNED BY public.option_names.id;


--
-- TOC entry 201 (class 1259 OID 21830)
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
-- TOC entry 200 (class 1259 OID 21828)
-- Name: option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 200
-- Name: option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.option_values_id_seq OWNED BY public.option_values.id;


--
-- TOC entry 232 (class 1259 OID 22084)
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
-- TOC entry 231 (class 1259 OID 22082)
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- TOC entry 230 (class 1259 OID 22070)
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
-- TOC entry 229 (class 1259 OID 22068)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 227 (class 1259 OID 22044)
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
-- TOC entry 226 (class 1259 OID 22042)
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 226
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- TOC entry 205 (class 1259 OID 21858)
-- Name: product_instances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_instances (
    id bigint NOT NULL,
    product_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 21856)
-- Name: product_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_instances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_instances_id_seq OWNED BY public.product_instances.id;


--
-- TOC entry 207 (class 1259 OID 21872)
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
-- TOC entry 206 (class 1259 OID 21870)
-- Name: product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_options_id_seq OWNED BY public.product_options.id;


--
-- TOC entry 203 (class 1259 OID 21847)
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
-- TOC entry 202 (class 1259 OID 21845)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 202
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 228 (class 1259 OID 22065)
-- Name: products_subcategories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_subcategories (
    product_id bigint NOT NULL,
    subcategory_id bigint NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 21801)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 21903)
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
-- TOC entry 210 (class 1259 OID 21901)
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 210
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- TOC entry 213 (class 1259 OID 21920)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    phone character varying DEFAULT ''::character varying NOT NULL,
    role integer NOT NULL,
    jti character varying NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 21918)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3136 (class 2604 OID 21964)
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- TOC entry 3135 (class 2604 OID 21952)
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- TOC entry 3139 (class 2604 OID 22030)
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- TOC entry 3128 (class 2604 OID 21895)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3138 (class 2604 OID 21994)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 3137 (class 2604 OID 21983)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3122 (class 2604 OID 21822)
-- Name: option_names id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_names ALTER COLUMN id SET DEFAULT nextval('public.option_names_id_seq'::regclass);


--
-- TOC entry 3124 (class 2604 OID 21833)
-- Name: option_values id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_values ALTER COLUMN id SET DEFAULT nextval('public.option_values_id_seq'::regclass);


--
-- TOC entry 3142 (class 2604 OID 22087)
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- TOC entry 3141 (class 2604 OID 22073)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3140 (class 2604 OID 22047)
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- TOC entry 3126 (class 2604 OID 21861)
-- Name: product_instances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_instances ALTER COLUMN id SET DEFAULT nextval('public.product_instances_id_seq'::regclass);


--
-- TOC entry 3127 (class 2604 OID 21875)
-- Name: product_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options ALTER COLUMN id SET DEFAULT nextval('public.product_options_id_seq'::regclass);


--
-- TOC entry 3125 (class 2604 OID 21850)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3129 (class 2604 OID 21906)
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- TOC entry 3130 (class 2604 OID 21923)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3359 (class 0 OID 21961)
-- Dependencies: 217
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- TOC entry 3357 (class 0 OID 21949)
-- Dependencies: 215
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- TOC entry 3367 (class 0 OID 22027)
-- Dependencies: 225
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.addresses (id, street, building, apartment, comment, city_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3339 (class 0 OID 21809)
-- Dependencies: 197
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-05-22 10:37:16.968401	2018-05-22 10:37:16.968401
\.


--
-- TOC entry 3351 (class 0 OID 21892)
-- Dependencies: 209
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Pizza	2018-05-22 10:37:36.382859	2018-05-22 10:37:36.382859
\.


--
-- TOC entry 3363 (class 0 OID 21991)
-- Dependencies: 221
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (id, name, schedule, country_id, created_at, updated_at, currency, phone) FROM stdin;
1	Osaka	"{ \\"opens_at\\": \\"8am\\", \\"closes_at\\": \\"11pm\\"}"	1	2018-05-22 10:37:36.332585	2018-05-22 10:37:36.332585	1	58000000000
\.


--
-- TOC entry 3365 (class 0 OID 22022)
-- Dependencies: 223
-- Data for Name: cities_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities_products (product_id, city_id) FROM stdin;
1	1
\.


--
-- TOC entry 3364 (class 0 OID 22019)
-- Dependencies: 222
-- Data for Name: cities_toppings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities_toppings (city_id, topping_id) FROM stdin;
\.


--
-- TOC entry 3361 (class 0 OID 21980)
-- Dependencies: 219
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
1	Japan	2018-05-22 10:37:36.233187	2018-05-22 10:37:36.233187
\.


--
-- TOC entry 3341 (class 0 OID 21819)
-- Dependencies: 199
-- Data for Name: option_names; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.option_names (id, name, created_at, updated_at, category_id, is_characteristic, is_belongs) FROM stdin;
1	size	2018-05-22 10:37:36.415714	2018-05-22 10:37:36.415714	1	\N	f
2	dough	2018-05-22 10:37:36.424182	2018-05-22 10:37:36.424182	1	\N	f
3	weight	2018-05-22 10:37:36.42898	2018-05-22 10:37:36.42898	1	\N	t
\.


--
-- TOC entry 3343 (class 0 OID 21830)
-- Dependencies: 201
-- Data for Name: option_values; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.option_values (id, value, option_name_id, created_at, updated_at) FROM stdin;
1	28cm	1	2018-05-22 10:37:36.561282	2018-05-22 10:37:36.561282
2	38cm	1	2018-05-22 10:37:36.575774	2018-05-22 10:37:36.575774
3	42cm	1	2018-05-22 10:37:36.581489	2018-05-22 10:37:36.581489
4	thin	2	2018-05-22 10:37:36.585959	2018-05-22 10:37:36.585959
5	thick	2	2018-05-22 10:37:36.59032	2018-05-22 10:37:36.59032
6	750	3	2018-05-22 10:37:36.594973	2018-05-22 10:37:36.594973
7	650	3	2018-05-22 10:37:36.599421	2018-05-22 10:37:36.599421
8	550	3	2018-05-22 10:37:36.603904	2018-05-22 10:37:36.603904
9	850g	3	2018-05-22 10:37:36.608245	2018-05-22 10:37:36.608245
10	750g	3	2018-05-22 10:37:36.612476	2018-05-22 10:37:36.612476
11	650g	3	2018-05-22 10:37:36.616955	2018-05-22 10:37:36.616955
\.


--
-- TOC entry 3374 (class 0 OID 22084)
-- Dependencies: 232
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_products (id, quantity, product_instance_id, order_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3372 (class 0 OID 22070)
-- Dependencies: 230
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, payment_method, status, address_id, created_at, updated_at, user_id) FROM stdin;
\.


--
-- TOC entry 3369 (class 0 OID 22044)
-- Dependencies: 227
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prices (id, value, city_id, product_instance_id, created_at, updated_at) FROM stdin;
1	255	1	1	2018-05-22 10:37:36.693714	2018-05-22 10:37:36.693714
2	200	1	2	2018-05-22 10:37:36.704466	2018-05-22 10:37:36.704466
3	188	1	3	2018-05-22 10:37:36.711261	2018-05-22 10:37:36.711261
4	188	1	4	2018-05-22 10:37:36.718075	2018-05-22 10:37:36.718075
5	200	1	5	2018-05-22 10:37:36.725915	2018-05-22 10:37:36.725915
6	255	1	6	2018-05-22 10:37:36.732944	2018-05-22 10:37:36.732944
\.


--
-- TOC entry 3347 (class 0 OID 21858)
-- Dependencies: 205
-- Data for Name: product_instances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_instances (id, product_id, created_at, updated_at) FROM stdin;
1	1	2018-05-22 10:37:36.502986	2018-05-22 10:37:36.502986
2	1	2018-05-22 10:37:36.517784	2018-05-22 10:37:36.517784
3	1	2018-05-22 10:37:36.522908	2018-05-22 10:37:36.522908
4	1	2018-05-22 10:37:36.527238	2018-05-22 10:37:36.527238
5	1	2018-05-22 10:37:36.531763	2018-05-22 10:37:36.531763
6	1	2018-05-22 10:37:36.536728	2018-05-22 10:37:36.536728
\.


--
-- TOC entry 3349 (class 0 OID 21872)
-- Dependencies: 207
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_options (id, product_instance_id, option_value_id, created_at, updated_at) FROM stdin;
1	1	3	2018-05-22 10:37:36.757177	2018-05-22 10:37:36.757177
2	2	2	2018-05-22 10:37:36.777867	2018-05-22 10:37:36.777867
3	3	1	2018-05-22 10:37:36.785159	2018-05-22 10:37:36.785159
4	3	5	2018-05-22 10:37:36.791684	2018-05-22 10:37:36.791684
5	2	5	2018-05-22 10:37:36.796912	2018-05-22 10:37:36.796912
6	1	5	2018-05-22 10:37:36.802327	2018-05-22 10:37:36.802327
7	4	4	2018-05-22 10:37:36.80739	2018-05-22 10:37:36.80739
8	5	4	2018-05-22 10:37:36.812881	2018-05-22 10:37:36.812881
9	6	4	2018-05-22 10:37:36.818265	2018-05-22 10:37:36.818265
10	4	1	2018-05-22 10:37:36.823353	2018-05-22 10:37:36.823353
11	5	2	2018-05-22 10:37:36.828109	2018-05-22 10:37:36.828109
12	6	3	2018-05-22 10:37:36.833152	2018-05-22 10:37:36.833152
13	6	6	2018-05-22 10:37:36.838375	2018-05-22 10:37:36.838375
14	5	7	2018-05-22 10:37:36.843441	2018-05-22 10:37:36.843441
15	4	8	2018-05-22 10:37:36.849347	2018-05-22 10:37:36.849347
16	1	9	2018-05-22 10:37:36.854389	2018-05-22 10:37:36.854389
17	2	10	2018-05-22 10:37:36.859424	2018-05-22 10:37:36.859424
18	3	11	2018-05-22 10:37:36.864612	2018-05-22 10:37:36.864612
\.


--
-- TOC entry 3345 (class 0 OID 21847)
-- Dependencies: 203
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, description, created_at, updated_at, category_id, is_topping) FROM stdin;
1	Margharita	Ordinary margharita pizza with meat, tomatoes and cheese	2018-05-22 10:37:36.476906	2018-05-22 10:37:36.476906	1	f
\.


--
-- TOC entry 3370 (class 0 OID 22065)
-- Dependencies: 228
-- Data for Name: products_subcategories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_subcategories (product_id, subcategory_id) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 21801)
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
20180520110241
\.


--
-- TOC entry 3353 (class 0 OID 21903)
-- Dependencies: 211
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subcategories (id, name, category_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3355 (class 0 OID 21920)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, phone, role, jti) FROM stdin;
\.


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 216
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 214
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 224
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 208
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 220
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 218
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 198
-- Name: option_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.option_names_id_seq', 3, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 200
-- Name: option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.option_values_id_seq', 11, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_products_id_seq', 1, false);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 226
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prices_id_seq', 6, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 204
-- Name: product_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_instances_id_seq', 6, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_options_id_seq', 18, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 202
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 1, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 210
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 1, false);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3179 (class 2606 OID 21969)
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 21957)
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 22035)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3146 (class 2606 OID 21816)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3164 (class 2606 OID 21900)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 21999)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 21988)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3149 (class 2606 OID 21827)
-- Name: option_names option_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_names
    ADD CONSTRAINT option_names_pkey PRIMARY KEY (id);


--
-- TOC entry 3152 (class 2606 OID 21838)
-- Name: option_values option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 22089)
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 22075)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 22052)
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- TOC entry 3158 (class 2606 OID 21863)
-- Name: product_instances product_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_instances
    ADD CONSTRAINT product_instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3162 (class 2606 OID 21877)
-- Name: product_options product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (id);


--
-- TOC entry 3155 (class 2606 OID 21855)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3144 (class 2606 OID 21808)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3167 (class 2606 OID 21911)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- TOC entry 3174 (class 2606 OID 21931)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3180 (class 1259 OID 21970)
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- TOC entry 3181 (class 1259 OID 21971)
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- TOC entry 3177 (class 1259 OID 21958)
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- TOC entry 3189 (class 1259 OID 22041)
-- Name: index_addresses_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_city_id ON public.addresses USING btree (city_id);


--
-- TOC entry 3186 (class 1259 OID 22005)
-- Name: index_cities_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_on_country_id ON public.cities USING btree (country_id);


--
-- TOC entry 3147 (class 1259 OID 21972)
-- Name: index_option_names_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_option_names_on_category_id ON public.option_names USING btree (category_id);


--
-- TOC entry 3150 (class 1259 OID 21844)
-- Name: index_option_values_on_option_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_option_values_on_option_name_id ON public.option_values USING btree (option_name_id);


--
-- TOC entry 3198 (class 1259 OID 22101)
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_order_id ON public.order_products USING btree (order_id);


--
-- TOC entry 3199 (class 1259 OID 22100)
-- Name: index_order_products_on_product_instance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_product_instance_id ON public.order_products USING btree (product_instance_id);


--
-- TOC entry 3194 (class 1259 OID 22081)
-- Name: index_orders_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_address_id ON public.orders USING btree (address_id);


--
-- TOC entry 3195 (class 1259 OID 22102)
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 3190 (class 1259 OID 22063)
-- Name: index_prices_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_city_id ON public.prices USING btree (city_id);


--
-- TOC entry 3191 (class 1259 OID 22064)
-- Name: index_prices_on_product_instance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_prices_on_product_instance_id ON public.prices USING btree (product_instance_id);


--
-- TOC entry 3156 (class 1259 OID 21869)
-- Name: index_product_instances_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_instances_on_product_id ON public.product_instances USING btree (product_id);


--
-- TOC entry 3159 (class 1259 OID 21889)
-- Name: index_product_options_on_option_value_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_options_on_option_value_id ON public.product_options USING btree (option_value_id);


--
-- TOC entry 3160 (class 1259 OID 21888)
-- Name: index_product_options_on_product_instance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_options_on_product_instance_id ON public.product_options USING btree (product_instance_id);


--
-- TOC entry 3153 (class 1259 OID 21941)
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- TOC entry 3165 (class 1259 OID 21917)
-- Name: index_subcategories_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subcategories_on_category_id ON public.subcategories USING btree (category_id);


--
-- TOC entry 3168 (class 1259 OID 21934)
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- TOC entry 3169 (class 1259 OID 21932)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 3170 (class 1259 OID 22018)
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- TOC entry 3171 (class 1259 OID 22017)
-- Name: index_users_on_phone; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_phone ON public.users USING btree (phone);


--
-- TOC entry 3172 (class 1259 OID 21933)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 3205 (class 2606 OID 21864)
-- Name: product_instances fk_rails_0ed6f91991; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_instances
    ADD CONSTRAINT fk_rails_0ed6f91991 FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 3202 (class 2606 OID 21973)
-- Name: option_names fk_rails_24c8ca9191; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_names
    ADD CONSTRAINT fk_rails_24c8ca9191 FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 3208 (class 2606 OID 21912)
-- Name: subcategories fk_rails_3937626525; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT fk_rails_3937626525 FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 3207 (class 2606 OID 21883)
-- Name: product_options fk_rails_642e6bad49; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT fk_rails_642e6bad49 FOREIGN KEY (option_value_id) REFERENCES public.option_values(id) ON DELETE CASCADE;


--
-- TOC entry 3213 (class 2606 OID 22076)
-- Name: orders fk_rails_774ef80392; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_774ef80392 FOREIGN KEY (address_id) REFERENCES public.addresses(id) ON DELETE SET NULL;


--
-- TOC entry 3203 (class 2606 OID 21839)
-- Name: option_values fk_rails_885a92f060; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.option_values
    ADD CONSTRAINT fk_rails_885a92f060 FOREIGN KEY (option_name_id) REFERENCES public.option_names(id) ON DELETE CASCADE;


--
-- TOC entry 3209 (class 2606 OID 22000)
-- Name: cities fk_rails_996e05be41; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_996e05be41 FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- TOC entry 3210 (class 2606 OID 22036)
-- Name: addresses fk_rails_ab048f757c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_ab048f757c FOREIGN KEY (city_id) REFERENCES public.cities(id) ON DELETE SET NULL;


--
-- TOC entry 3215 (class 2606 OID 22090)
-- Name: order_products fk_rails_af66a0eccc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_af66a0eccc FOREIGN KEY (product_instance_id) REFERENCES public.product_instances(id) ON DELETE CASCADE;


--
-- TOC entry 3206 (class 2606 OID 21878)
-- Name: product_options fk_rails_c6d89fd25b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT fk_rails_c6d89fd25b FOREIGN KEY (product_instance_id) REFERENCES public.product_instances(id) ON DELETE CASCADE;


--
-- TOC entry 3211 (class 2606 OID 22053)
-- Name: prices fk_rails_e3a3a8b4a5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT fk_rails_e3a3a8b4a5 FOREIGN KEY (city_id) REFERENCES public.cities(id) ON DELETE SET NULL;


--
-- TOC entry 3216 (class 2606 OID 22095)
-- Name: order_products fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 3214 (class 2606 OID 22103)
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3204 (class 2606 OID 21942)
-- Name: products fk_rails_fb915499a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- TOC entry 3212 (class 2606 OID 22058)
-- Name: prices fk_rails_fde84f0b19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT fk_rails_fde84f0b19 FOREIGN KEY (product_instance_id) REFERENCES public.product_instances(id) ON DELETE CASCADE;


-- Completed on 2018-05-22 13:52:51 MSK

--
-- PostgreSQL database dump complete
--

