--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE active_admin_comments OWNER TO ats;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO ats;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE active_storage_attachments OWNER TO ats;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_storage_attachments_id_seq OWNER TO ats;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE active_storage_attachments_id_seq OWNED BY active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE active_storage_blobs OWNER TO ats;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_storage_blobs_id_seq OWNER TO ats;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE active_storage_blobs_id_seq OWNED BY active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE active_storage_variant_records OWNER TO ats;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_storage_variant_records_id_seq OWNER TO ats;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE active_storage_variant_records_id_seq OWNED BY active_storage_variant_records.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE admin_users OWNER TO ats;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_users_id_seq OWNER TO ats;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO ats;

--
-- Name: buildings; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE buildings (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    state integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE buildings OWNER TO ats;

--
-- Name: buildings_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE buildings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE buildings_id_seq OWNER TO ats;

--
-- Name: buildings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE buildings_id_seq OWNED BY buildings.id;


--
-- Name: buildings_services; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE buildings_services (
    service_id bigint NOT NULL,
    building_id bigint NOT NULL
);


ALTER TABLE buildings_services OWNER TO ats;

--
-- Name: events; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE events (
    id bigint NOT NULL,
    etype integer,
    title character varying,
    description text,
    value integer,
    edate date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE events OWNER TO ats;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO ats;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: import_logs; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE import_logs (
    id bigint NOT NULL,
    import_version_id bigint NOT NULL,
    object_type character varying,
    object_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE import_logs OWNER TO ats;

--
-- Name: import_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE import_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE import_logs_id_seq OWNER TO ats;

--
-- Name: import_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE import_logs_id_seq OWNED BY import_logs.id;


--
-- Name: import_versions; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE import_versions (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE import_versions OWNER TO ats;

--
-- Name: import_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE import_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE import_versions_id_seq OWNER TO ats;

--
-- Name: import_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE import_versions_id_seq OWNED BY import_versions.id;


--
-- Name: intangibles; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE intangibles (
    id bigint NOT NULL,
    detail text,
    noun character varying,
    name character varying,
    observations text,
    naming_details text,
    naming_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    thing_id bigint
);


ALTER TABLE intangibles OWNER TO ats;

--
-- Name: intangibles_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE intangibles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE intangibles_id_seq OWNER TO ats;

--
-- Name: intangibles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE intangibles_id_seq OWNED BY intangibles.id;


--
-- Name: intangibles_people; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE intangibles_people (
    person_id bigint NOT NULL,
    intangible_id bigint NOT NULL
);


ALTER TABLE intangibles_people OWNER TO ats;

--
-- Name: intangibles_services; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE intangibles_services (
    service_id bigint NOT NULL,
    intangible_id bigint NOT NULL
);


ALTER TABLE intangibles_services OWNER TO ats;

--
-- Name: people; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE people (
    id bigint NOT NULL,
    name character varying,
    bio text,
    sex integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE people OWNER TO ats;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_id_seq OWNER TO ats;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: people_places; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE people_places (
    place_id bigint NOT NULL,
    person_id bigint NOT NULL
);


ALTER TABLE people_places OWNER TO ats;

--
-- Name: places; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE places (
    id bigint NOT NULL,
    building_id bigint NOT NULL,
    type integer,
    detail character varying,
    name character varying,
    observations text,
    naming_details text,
    naming_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ptype integer,
    thing_id bigint
);


ALTER TABLE places OWNER TO ats;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE places_id_seq OWNER TO ats;

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO ats;

--
-- Name: service_data; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE service_data (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    stype integer,
    man integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    woman integer,
    year integer
);


ALTER TABLE service_data OWNER TO ats;

--
-- Name: service_data_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE service_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE service_data_id_seq OWNER TO ats;

--
-- Name: service_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE service_data_id_seq OWNED BY service_data.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE services (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE services OWNER TO ats;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO ats;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: things; Type: TABLE; Schema: public; Owner: ats
--

CREATE TABLE things (
    id bigint NOT NULL,
    name character varying,
    ttype integer,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE things OWNER TO ats;

--
-- Name: things_id_seq; Type: SEQUENCE; Schema: public; Owner: ats
--

CREATE SEQUENCE things_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE things_id_seq OWNER TO ats;

--
-- Name: things_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ats
--

ALTER SEQUENCE things_id_seq OWNED BY things.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('active_storage_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('active_storage_blobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('active_storage_variant_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY buildings ALTER COLUMN id SET DEFAULT nextval('buildings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY import_logs ALTER COLUMN id SET DEFAULT nextval('import_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY import_versions ALTER COLUMN id SET DEFAULT nextval('import_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY intangibles ALTER COLUMN id SET DEFAULT nextval('intangibles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY service_data ALTER COLUMN id SET DEFAULT nextval('service_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ats
--

ALTER TABLE ONLY things ALTER COLUMN id SET DEFAULT nextval('things_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('active_storage_attachments_id_seq', 1, false);


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('active_storage_blobs_id_seq', 1, false);


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('active_storage_variant_records_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
2	admin@example.com	$2a$11$Q/S8dV6UHXJUUM6lLdJAYuRUYprkCfSRh0eh6/UGNl/DHbWW0CVBC	\N	\N	\N	2020-11-15 08:55:37.806625	2020-11-15 08:55:37.806625
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('admin_users_id_seq', 2, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-07-20 05:28:08.447943	2021-07-20 05:28:08.447943
\.


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY buildings (id, name, address, state, created_at, updated_at) FROM stdin;
1	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 10	\N	2021-07-20 05:31:00.816837	2021-07-20 05:31:00.816837
2	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 11	\N	2021-07-20 05:53:58.638947	2021-07-20 05:53:58.638947
3	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 12	\N	2021-07-20 05:53:58.723493	2021-07-20 05:53:58.723493
4	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 13	\N	2021-07-20 05:53:58.776134	2021-07-20 05:53:58.776134
5	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 14	\N	2021-07-20 05:53:58.840468	2021-07-20 05:53:58.840468
6	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 15	\N	2021-07-20 05:53:58.88398	2021-07-20 05:53:58.88398
7	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 16	\N	2021-07-20 05:53:58.926015	2021-07-20 05:53:58.926015
8	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 17	\N	2021-07-20 05:53:59.023987	2021-07-20 05:53:59.023987
9	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 18	\N	2021-07-20 05:53:59.057861	2021-07-20 05:53:59.057861
10	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 19	\N	2021-07-20 05:53:59.089444	2021-07-20 05:53:59.089444
11	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 20	\N	2021-07-20 05:53:59.141097	2021-07-20 05:53:59.141097
12	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 21	\N	2021-07-20 05:53:59.198876	2021-07-20 05:53:59.198876
13	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 22	\N	2021-07-20 05:53:59.234069	2021-07-20 05:53:59.234069
14	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 23	\N	2021-07-20 05:53:59.303457	2021-07-20 05:53:59.303457
15	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 24	\N	2021-07-20 05:53:59.351695	2021-07-20 05:53:59.351695
16	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 25	\N	2021-07-20 05:53:59.393111	2021-07-20 05:53:59.393111
17	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 26	\N	2021-07-20 05:53:59.423934	2021-07-20 05:53:59.423934
18	CURE - Playa Hermosa, Maldonado	Calle 30, 20200 Playa Hermosa, Departamento de Maldonado - Parada 11, Ruta 27	\N	2021-07-20 05:53:59.462919	2021-07-20 05:53:59.462919
19	Edificio Central	José Martí 3328	\N	2021-07-20 05:53:59.500339	2021-07-20 05:53:59.500339
20	\N	\N	\N	2021-07-20 05:53:59.565731	2021-07-20 05:53:59.565731
21	Ex Liceo Francés	Avd. 18 de Julio 1772	\N	2021-07-20 05:53:59.578972	2021-07-20 05:53:59.578972
22	Facultad de Ciencias	Igua 4225	\N	2021-07-20 05:53:59.664121	2021-07-20 05:53:59.664121
23	Facultad de Ciencias	Igua 4225 - Anexo Norte	\N	2021-07-20 05:53:59.725646	2021-07-20 05:53:59.725646
24	Facultad de Ciencias	Iguá 4225	\N	2021-07-20 05:53:59.771797	2021-07-20 05:53:59.771797
25	Sede central	Gonzalo Ramírez 1926	\N	2021-07-20 05:53:59.814837	2021-07-20 05:53:59.814837
26	IESTA	Eduardo Acevedo 1139	\N	2021-07-20 05:53:59.997768	2021-07-20 05:53:59.997768
27	Sede FIC	San Salvador 1944	\N	2021-07-20 05:54:00.042476	2021-07-20 05:54:00.042476
28	Edificio principal	Julio Herrera y Reissig 565	\N	2021-07-20 05:54:00.139756	2021-07-20 05:54:00.139756
29	N/C	N/C	\N	2021-07-20 05:54:00.335674	2021-07-20 05:54:00.335674
30	Edificio Aulario	N/C	\N	2021-07-20 05:54:00.390977	2021-07-20 05:54:00.390977
31	Complejo El Faro	Julio Herrera y Reissig 633	\N	2021-07-20 05:54:00.738172	2021-07-20 05:54:00.738172
32	Edificio INCO	N/C	\N	2021-07-20 05:54:00.813909	2021-07-20 05:54:00.813909
33	ISEF Sede de Parque Batlle Prof. Alberto Langlade Montevideo 	Parque Batlle sin número.	\N	2021-07-20 05:54:00.847548	2021-07-20 05:54:00.847548
34	ISEF Sede de Malvín Norte Prof.Irene Preobrayensky Montevideo	Rambla Euskal Erria 4095	\N	2021-07-20 05:54:00.906417	2021-07-20 05:54:00.906417
35	Cede central Universidad Paysandú	Florida 1065	\N	2021-07-20 05:54:00.988864	2021-07-20 05:54:00.988864
36	Salón	Facultad de Medicina	\N	2021-07-20 05:54:01.039991	2021-07-20 05:54:01.039991
37	Anfiteatro	Departamento de fisiología	\N	2021-07-20 05:54:01.08955	2021-07-20 05:54:01.08955
38	Anfiteatro	Departamento de anatomía	\N	2021-07-20 05:54:01.124115	2021-07-20 05:54:01.124115
39	Sala	Facultad de Medicina	\N	2021-07-20 05:54:01.168708	2021-07-20 05:54:01.168708
40	Instituto	Departamento de anatomía	\N	2021-07-20 05:54:01.206769	2021-07-20 05:54:01.206769
41	Facultad de Psicología	Tristán Narvaja  1674	\N	2021-07-20 05:54:01.289305	2021-07-20 05:54:01.289305
42	Edificio Central – Rectorado	18 de Julio 1824	\N	2021-07-20 05:54:01.373037	2021-07-20 05:54:01.373037
43	Edificio Central - Instituto Confucio	Av. Dr. Manuel Albo 2663	\N	2021-07-20 05:54:01.424695	2021-07-20 05:54:01.424695
44	Centro Universitario de Rivera	Ituzaingo 667	\N	2021-07-20 05:54:01.452344	2021-07-20 05:54:01.452344
45	Centro Universitario de Rivera	Ruta 5 Guido Machado Brum, Km. 495	\N	2021-07-20 05:54:01.486853	2021-07-20 05:54:01.486853
46	Avd. 18 de Julio 1772	Comisión	\N	2021-07-26 14:37:18.874246	2021-07-26 14:37:18.874246
\.


--
-- Name: buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('buildings_id_seq', 46, true);


--
-- Data for Name: buildings_services; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY buildings_services (service_id, building_id) FROM stdin;
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
2	19
2	20
2	21
2	19
3	22
3	23
3	24
4	25
4	25
4	25
4	25
4	25
4	26
5	27
5	27
6	28
6	28
6	28
6	28
6	28
6	29
6	30
6	28
6	28
6	28
6	28
6	28
6	29
6	31
6	28
6	32
7	33
7	34
7	33
7	35
8	36
8	37
8	38
8	39
8	40
9	41
9	41
10	42
11	43
12	44
12	45
2	46
2	46
2	46
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY events (id, etype, title, description, value, edate, created_at, updated_at) FROM stdin;
71	1	\N	\N	220	1940-01-01	2021-08-05 06:25:23.032397	2021-08-05 06:25:23.032397
72	1	\N	\N	320	1945-01-01	2021-08-05 06:25:23.079783	2021-08-05 06:25:23.079783
73	1	\N	\N	1220	1950-01-01	2021-08-05 06:25:23.089605	2021-08-05 06:25:23.089605
74	1	\N	\N	2220	1955-01-01	2021-08-05 06:25:23.098128	2021-08-05 06:25:23.098128
75	1	\N	\N	3220	1960-01-01	2021-08-05 06:25:23.106349	2021-08-05 06:25:23.106349
76	1	\N	\N	5220	1965-01-01	2021-08-05 06:25:23.115078	2021-08-05 06:25:23.115078
77	1	\N	\N	6220	1970-01-01	2021-08-05 06:25:23.123244	2021-08-05 06:25:23.123244
78	1	\N	\N	7220	1975-01-01	2021-08-05 06:25:23.130903	2021-08-05 06:25:23.130903
79	1	\N	\N	6820	1980-01-01	2021-08-05 06:25:23.138687	2021-08-05 06:25:23.138687
80	1	\N	\N	5420	1985-01-01	2021-08-05 06:25:23.151048	2021-08-05 06:25:23.151048
81	1	\N	\N	9220	1990-01-01	2021-08-05 06:25:23.165452	2021-08-05 06:25:23.165452
82	1	\N	\N	10220	1995-01-01	2021-08-05 06:25:23.174861	2021-08-05 06:25:23.174861
83	1	\N	\N	15220	2000-01-01	2021-08-05 06:25:23.183425	2021-08-05 06:25:23.183425
84	1	\N	\N	18220	2005-01-01	2021-08-05 06:25:23.19137	2021-08-05 06:25:23.19137
85	1	\N	\N	20220	2010-01-01	2021-08-05 06:25:23.198984	2021-08-05 06:25:23.198984
86	1	\N	\N	30220	2015-01-01	2021-08-05 06:25:23.207317	2021-08-05 06:25:23.207317
87	1	\N	\N	35220	2020-01-01	2021-08-05 06:25:23.215284	2021-08-05 06:25:23.215284
88	0	\N	\N	22	1940-01-01	2021-08-05 06:25:23.233924	2021-08-05 06:25:23.233924
89	0	\N	\N	32	1945-01-01	2021-08-05 06:25:23.245744	2021-08-05 06:25:23.245744
90	0	\N	\N	122	1950-01-01	2021-08-05 06:25:23.254013	2021-08-05 06:25:23.254013
91	0	\N	\N	222	1955-01-01	2021-08-05 06:25:23.261653	2021-08-05 06:25:23.261653
92	0	\N	\N	322	1960-01-01	2021-08-05 06:25:23.270331	2021-08-05 06:25:23.270331
93	0	\N	\N	1522	1965-01-01	2021-08-05 06:25:23.278093	2021-08-05 06:25:23.278093
94	0	\N	\N	2622	1970-01-01	2021-08-05 06:25:23.285711	2021-08-05 06:25:23.285711
95	0	\N	\N	5722	1975-01-01	2021-08-05 06:25:23.293213	2021-08-05 06:25:23.293213
96	0	\N	\N	9682	1980-01-01	2021-08-05 06:25:23.301998	2021-08-05 06:25:23.301998
97	0	\N	\N	25542	1985-01-01	2021-08-05 06:25:23.319869	2021-08-05 06:25:23.319869
98	0	\N	\N	30922	1990-01-01	2021-08-05 06:25:23.342487	2021-08-05 06:25:23.342487
99	0	\N	\N	21022	1995-01-01	2021-08-05 06:25:23.356063	2021-08-05 06:25:23.356063
100	0	\N	\N	21522	2000-01-01	2021-08-05 06:25:23.366773	2021-08-05 06:25:23.366773
101	0	\N	\N	31822	2005-01-01	2021-08-05 06:25:23.376032	2021-08-05 06:25:23.376032
102	0	\N	\N	42022	2010-01-01	2021-08-05 06:25:23.396981	2021-08-05 06:25:23.396981
103	0	\N	\N	53022	2015-01-01	2021-08-05 06:25:23.406208	2021-08-05 06:25:23.406208
104	0	\N	\N	53522	2020-01-01	2021-08-05 06:25:23.41494	2021-08-05 06:25:23.41494
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('events_id_seq', 104, true);


--
-- Data for Name: import_logs; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY import_logs (id, import_version_id, object_type, object_id, created_at, updated_at) FROM stdin;
1	1	Service	1	2021-07-20 05:31:00.803938	2021-07-20 05:31:00.803938
2	1	Building	1	2021-07-20 05:31:00.820694	2021-07-20 05:31:00.820694
3	1	Thing	1	2021-07-20 05:50:07.70008	2021-07-20 05:50:07.70008
4	1	Place	1	2021-07-20 05:50:07.719666	2021-07-20 05:50:07.719666
5	1	Building	2	2021-07-20 05:53:58.64987	2021-07-20 05:53:58.64987
6	1	Person	1	2021-07-20 05:53:58.682925	2021-07-20 05:53:58.682925
7	1	Place	2	2021-07-20 05:53:58.700797	2021-07-20 05:53:58.700797
8	1	Building	3	2021-07-20 05:53:58.728798	2021-07-20 05:53:58.728798
9	1	Person	2	2021-07-20 05:53:58.75552	2021-07-20 05:53:58.75552
10	1	Place	3	2021-07-20 05:53:58.766689	2021-07-20 05:53:58.766689
11	1	Building	4	2021-07-20 05:53:58.7798	2021-07-20 05:53:58.7798
12	1	Thing	2	2021-07-20 05:53:58.802997	2021-07-20 05:53:58.802997
13	1	Place	4	2021-07-20 05:53:58.828456	2021-07-20 05:53:58.828456
14	1	Building	5	2021-07-20 05:53:58.846708	2021-07-20 05:53:58.846708
15	1	Person	3	2021-07-20 05:53:58.862666	2021-07-20 05:53:58.862666
16	1	Place	5	2021-07-20 05:53:58.874036	2021-07-20 05:53:58.874036
17	1	Building	6	2021-07-20 05:53:58.887628	2021-07-20 05:53:58.887628
18	1	Person	4	2021-07-20 05:53:58.904623	2021-07-20 05:53:58.904623
19	1	Place	6	2021-07-20 05:53:58.915504	2021-07-20 05:53:58.915504
20	1	Building	7	2021-07-20 05:53:58.931527	2021-07-20 05:53:58.931527
21	1	Person	5	2021-07-20 05:53:58.949791	2021-07-20 05:53:58.949791
22	1	Place	7	2021-07-20 05:53:58.99621	2021-07-20 05:53:58.99621
23	1	Building	8	2021-07-20 05:53:59.027847	2021-07-20 05:53:59.027847
24	1	Thing	3	2021-07-20 05:53:59.041534	2021-07-20 05:53:59.041534
25	1	Place	8	2021-07-20 05:53:59.051986	2021-07-20 05:53:59.051986
26	1	Building	9	2021-07-20 05:53:59.061552	2021-07-20 05:53:59.061552
27	1	Thing	4	2021-07-20 05:53:59.073598	2021-07-20 05:53:59.073598
28	1	Place	9	2021-07-20 05:53:59.084544	2021-07-20 05:53:59.084544
29	1	Building	10	2021-07-20 05:53:59.093573	2021-07-20 05:53:59.093573
30	1	Thing	5	2021-07-20 05:53:59.108114	2021-07-20 05:53:59.108114
31	1	Place	10	2021-07-20 05:53:59.122909	2021-07-20 05:53:59.122909
32	1	Building	11	2021-07-20 05:53:59.152478	2021-07-20 05:53:59.152478
33	1	Person	6	2021-07-20 05:53:59.17863	2021-07-20 05:53:59.17863
34	1	Place	11	2021-07-20 05:53:59.189914	2021-07-20 05:53:59.189914
35	1	Building	12	2021-07-20 05:53:59.202083	2021-07-20 05:53:59.202083
36	1	Person	7	2021-07-20 05:53:59.21465	2021-07-20 05:53:59.21465
37	1	Place	12	2021-07-20 05:53:59.223711	2021-07-20 05:53:59.223711
38	1	Building	13	2021-07-20 05:53:59.237612	2021-07-20 05:53:59.237612
39	1	Person	8	2021-07-20 05:53:59.260747	2021-07-20 05:53:59.260747
40	1	Place	13	2021-07-20 05:53:59.291422	2021-07-20 05:53:59.291422
41	1	Building	14	2021-07-20 05:53:59.307534	2021-07-20 05:53:59.307534
42	1	Thing	6	2021-07-20 05:53:59.321587	2021-07-20 05:53:59.321587
43	1	Place	14	2021-07-20 05:53:59.344893	2021-07-20 05:53:59.344893
44	1	Building	15	2021-07-20 05:53:59.355556	2021-07-20 05:53:59.355556
45	1	Person	9	2021-07-20 05:53:59.368407	2021-07-20 05:53:59.368407
46	1	Place	15	2021-07-20 05:53:59.377555	2021-07-20 05:53:59.377555
47	1	Building	16	2021-07-20 05:53:59.397737	2021-07-20 05:53:59.397737
48	1	Thing	7	2021-07-20 05:53:59.410214	2021-07-20 05:53:59.410214
49	1	Place	16	2021-07-20 05:53:59.419006	2021-07-20 05:53:59.419006
50	1	Building	17	2021-07-20 05:53:59.427281	2021-07-20 05:53:59.427281
51	1	Thing	8	2021-07-20 05:53:59.447349	2021-07-20 05:53:59.447349
52	1	Place	17	2021-07-20 05:53:59.458179	2021-07-20 05:53:59.458179
53	1	Building	18	2021-07-20 05:53:59.466178	2021-07-20 05:53:59.466178
54	1	Thing	9	2021-07-20 05:53:59.476817	2021-07-20 05:53:59.476817
55	1	Place	18	2021-07-20 05:53:59.488565	2021-07-20 05:53:59.488565
56	1	Service	2	2021-07-20 05:53:59.495861	2021-07-20 05:53:59.495861
57	1	Building	19	2021-07-20 05:53:59.504212	2021-07-20 05:53:59.504212
58	1	Person	10	2021-07-20 05:53:59.534008	2021-07-20 05:53:59.534008
59	1	Place	19	2021-07-20 05:53:59.547745	2021-07-20 05:53:59.547745
60	1	Building	20	2021-07-20 05:53:59.569392	2021-07-20 05:53:59.569392
61	1	Building	21	2021-07-20 05:53:59.582917	2021-07-20 05:53:59.582917
62	1	Thing	10	2021-07-20 05:53:59.595529	2021-07-20 05:53:59.595529
63	1	Place	20	2021-07-20 05:53:59.605324	2021-07-20 05:53:59.605324
64	1	Thing	11	2021-07-20 05:53:59.629828	2021-07-20 05:53:59.629828
65	1	Place	21	2021-07-20 05:53:59.642857	2021-07-20 05:53:59.642857
66	1	Service	3	2021-07-20 05:53:59.657974	2021-07-20 05:53:59.657974
67	1	Building	22	2021-07-20 05:53:59.668309	2021-07-20 05:53:59.668309
68	1	Person	11	2021-07-20 05:53:59.681846	2021-07-20 05:53:59.681846
69	1	Place	22	2021-07-20 05:53:59.70225	2021-07-20 05:53:59.70225
70	1	Building	23	2021-07-20 05:53:59.734497	2021-07-20 05:53:59.734497
71	1	Person	12	2021-07-20 05:53:59.751699	2021-07-20 05:53:59.751699
72	1	Place	23	2021-07-20 05:53:59.762546	2021-07-20 05:53:59.762546
73	1	Building	24	2021-07-20 05:53:59.775563	2021-07-20 05:53:59.775563
74	1	Person	13	2021-07-20 05:53:59.789097	2021-07-20 05:53:59.789097
75	1	Place	24	2021-07-20 05:53:59.798534	2021-07-20 05:53:59.798534
76	1	Service	4	2021-07-20 05:53:59.81	2021-07-20 05:53:59.81
77	1	Building	25	2021-07-20 05:53:59.818478	2021-07-20 05:53:59.818478
78	1	Person	14	2021-07-20 05:53:59.831096	2021-07-20 05:53:59.831096
79	1	Person	15	2021-07-20 05:53:59.849646	2021-07-20 05:53:59.849646
80	1	Place	25	2021-07-20 05:53:59.859131	2021-07-20 05:53:59.859131
81	1	Person	16	2021-07-20 05:53:59.881945	2021-07-20 05:53:59.881945
82	1	Place	26	2021-07-20 05:53:59.910359	2021-07-20 05:53:59.910359
83	1	Person	17	2021-07-20 05:53:59.94429	2021-07-20 05:53:59.94429
84	1	Person	18	2021-07-20 05:53:59.974208	2021-07-20 05:53:59.974208
85	1	Place	27	2021-07-20 05:53:59.98656	2021-07-20 05:53:59.98656
86	1	Building	26	2021-07-20 05:54:00.001579	2021-07-20 05:54:00.001579
87	1	Person	19	2021-07-20 05:54:00.015736	2021-07-20 05:54:00.015736
88	1	Place	28	2021-07-20 05:54:00.026484	2021-07-20 05:54:00.026484
89	1	Service	5	2021-07-20 05:54:00.038279	2021-07-20 05:54:00.038279
90	1	Building	27	2021-07-20 05:54:00.04698	2021-07-20 05:54:00.04698
91	1	Person	20	2021-07-20 05:54:00.069861	2021-07-20 05:54:00.069861
92	1	Place	29	2021-07-20 05:54:00.081543	2021-07-20 05:54:00.081543
93	1	Person	21	2021-07-20 05:54:00.112938	2021-07-20 05:54:00.112938
94	1	Place	30	2021-07-20 05:54:00.124293	2021-07-20 05:54:00.124293
95	1	Service	6	2021-07-20 05:54:00.135643	2021-07-20 05:54:00.135643
96	1	Building	28	2021-07-20 05:54:00.142944	2021-07-20 05:54:00.142944
97	1	Person	22	2021-07-20 05:54:00.155412	2021-07-20 05:54:00.155412
98	1	Person	23	2021-07-20 05:54:00.169445	2021-07-20 05:54:00.169445
99	1	Place	31	2021-07-20 05:54:00.180036	2021-07-20 05:54:00.180036
100	1	Person	24	2021-07-20 05:54:00.199372	2021-07-20 05:54:00.199372
101	1	Place	32	2021-07-20 05:54:00.210078	2021-07-20 05:54:00.210078
102	1	Person	25	2021-07-20 05:54:00.261698	2021-07-20 05:54:00.261698
103	1	Place	33	2021-07-20 05:54:00.274678	2021-07-20 05:54:00.274678
104	1	Person	26	2021-07-20 05:54:00.297116	2021-07-20 05:54:00.297116
105	1	Place	34	2021-07-20 05:54:00.309815	2021-07-20 05:54:00.309815
106	1	Building	29	2021-07-20 05:54:00.345024	2021-07-20 05:54:00.345024
107	1	Person	27	2021-07-20 05:54:00.364476	2021-07-20 05:54:00.364476
108	1	Place	35	2021-07-20 05:54:00.377845	2021-07-20 05:54:00.377845
109	1	Building	30	2021-07-20 05:54:00.394664	2021-07-20 05:54:00.394664
110	1	Person	28	2021-07-20 05:54:00.409913	2021-07-20 05:54:00.409913
111	1	Place	36	2021-07-20 05:54:00.427058	2021-07-20 05:54:00.427058
112	1	Person	29	2021-07-20 05:54:00.479017	2021-07-20 05:54:00.479017
113	1	Place	37	2021-07-20 05:54:00.49036	2021-07-20 05:54:00.49036
114	1	Person	30	2021-07-20 05:54:00.513417	2021-07-20 05:54:00.513417
115	1	Place	38	2021-07-20 05:54:00.527018	2021-07-20 05:54:00.527018
116	1	Person	31	2021-07-20 05:54:00.582143	2021-07-20 05:54:00.582143
117	1	Place	39	2021-07-20 05:54:00.611564	2021-07-20 05:54:00.611564
118	1	Person	32	2021-07-20 05:54:00.641768	2021-07-20 05:54:00.641768
119	1	Place	40	2021-07-20 05:54:00.663105	2021-07-20 05:54:00.663105
120	1	Person	33	2021-07-20 05:54:00.681735	2021-07-20 05:54:00.681735
121	1	Place	41	2021-07-20 05:54:00.691898	2021-07-20 05:54:00.691898
122	1	Person	34	2021-07-20 05:54:00.71164	2021-07-20 05:54:00.71164
123	1	Place	42	2021-07-20 05:54:00.729175	2021-07-20 05:54:00.729175
124	1	Building	31	2021-07-20 05:54:00.741607	2021-07-20 05:54:00.741607
125	1	Person	35	2021-07-20 05:54:00.755028	2021-07-20 05:54:00.755028
126	1	Place	43	2021-07-20 05:54:00.766342	2021-07-20 05:54:00.766342
127	1	Person	36	2021-07-20 05:54:00.791926	2021-07-20 05:54:00.791926
128	1	Place	44	2021-07-20 05:54:00.801733	2021-07-20 05:54:00.801733
129	1	Building	32	2021-07-20 05:54:00.817777	2021-07-20 05:54:00.817777
130	1	Person	37	2021-07-20 05:54:00.831799	2021-07-20 05:54:00.831799
131	1	Service	7	2021-07-20 05:54:00.842162	2021-07-20 05:54:00.842162
132	1	Building	33	2021-07-20 05:54:00.850959	2021-07-20 05:54:00.850959
133	1	Person	38	2021-07-20 05:54:00.865371	2021-07-20 05:54:00.865371
134	1	Place	45	2021-07-20 05:54:00.881778	2021-07-20 05:54:00.881778
135	1	Building	34	2021-07-20 05:54:00.910824	2021-07-20 05:54:00.910824
136	1	Person	39	2021-07-20 05:54:00.92534	2021-07-20 05:54:00.92534
137	1	Place	46	2021-07-20 05:54:00.936089	2021-07-20 05:54:00.936089
138	1	Person	40	2021-07-20 05:54:00.969114	2021-07-20 05:54:00.969114
139	1	Place	47	2021-07-20 05:54:00.97971	2021-07-20 05:54:00.97971
140	1	Building	35	2021-07-20 05:54:00.992303	2021-07-20 05:54:00.992303
141	1	Person	41	2021-07-20 05:54:01.00596	2021-07-20 05:54:01.00596
142	1	Service	8	2021-07-20 05:54:01.026826	2021-07-20 05:54:01.026826
143	1	Building	36	2021-07-20 05:54:01.05134	2021-07-20 05:54:01.05134
144	1	Person	42	2021-07-20 05:54:01.069657	2021-07-20 05:54:01.069657
145	1	Place	48	2021-07-20 05:54:01.080234	2021-07-20 05:54:01.080234
146	1	Building	37	2021-07-20 05:54:01.093041	2021-07-20 05:54:01.093041
147	1	Person	43	2021-07-20 05:54:01.105283	2021-07-20 05:54:01.105283
148	1	Place	49	2021-07-20 05:54:01.114448	2021-07-20 05:54:01.114448
149	1	Building	38	2021-07-20 05:54:01.127621	2021-07-20 05:54:01.127621
150	1	Person	44	2021-07-20 05:54:01.139956	2021-07-20 05:54:01.139956
151	1	Place	50	2021-07-20 05:54:01.150053	2021-07-20 05:54:01.150053
152	1	Building	39	2021-07-20 05:54:01.173425	2021-07-20 05:54:01.173425
153	1	Person	45	2021-07-20 05:54:01.188115	2021-07-20 05:54:01.188115
154	1	Place	51	2021-07-20 05:54:01.197694	2021-07-20 05:54:01.197694
155	1	Building	40	2021-07-20 05:54:01.210721	2021-07-20 05:54:01.210721
156	1	Person	46	2021-07-20 05:54:01.237238	2021-07-20 05:54:01.237238
157	1	Place	52	2021-07-20 05:54:01.271617	2021-07-20 05:54:01.271617
158	1	Service	9	2021-07-20 05:54:01.284655	2021-07-20 05:54:01.284655
159	1	Building	41	2021-07-20 05:54:01.293462	2021-07-20 05:54:01.293462
160	1	Person	47	2021-07-20 05:54:01.307511	2021-07-20 05:54:01.307511
161	1	Place	53	2021-07-20 05:54:01.318655	2021-07-20 05:54:01.318655
162	1	Person	48	2021-07-20 05:54:01.336681	2021-07-20 05:54:01.336681
163	1	Place	54	2021-07-20 05:54:01.34699	2021-07-20 05:54:01.34699
164	1	Service	10	2021-07-20 05:54:01.36562	2021-07-20 05:54:01.36562
165	1	Building	42	2021-07-20 05:54:01.377413	2021-07-20 05:54:01.377413
166	1	Person	49	2021-07-20 05:54:01.391504	2021-07-20 05:54:01.391504
167	1	Place	55	2021-07-20 05:54:01.407721	2021-07-20 05:54:01.407721
168	1	Service	11	2021-07-20 05:54:01.420208	2021-07-20 05:54:01.420208
169	1	Building	43	2021-07-20 05:54:01.42812	2021-07-20 05:54:01.42812
170	1	Person	50	2021-07-20 05:54:01.439812	2021-07-20 05:54:01.439812
171	1	Service	12	2021-07-20 05:54:01.448499	2021-07-20 05:54:01.448499
172	1	Building	44	2021-07-20 05:54:01.455684	2021-07-20 05:54:01.455684
173	1	Person	51	2021-07-20 05:54:01.467886	2021-07-20 05:54:01.467886
174	1	Place	56	2021-07-20 05:54:01.478042	2021-07-20 05:54:01.478042
175	1	Building	45	2021-07-20 05:54:01.490067	2021-07-20 05:54:01.490067
176	1	Person	52	2021-07-20 05:54:01.52665	2021-07-20 05:54:01.52665
177	3	Person	53	2021-07-20 06:07:12.186901	2021-07-20 06:07:12.186901
178	3	Person	54	2021-07-20 06:07:12.222313	2021-07-20 06:07:12.222313
179	3	Person	55	2021-07-20 06:07:12.259701	2021-07-20 06:07:12.259701
180	3	Person	56	2021-07-20 06:07:12.281309	2021-07-20 06:07:12.281309
181	3	Person	57	2021-07-20 06:07:12.307435	2021-07-20 06:07:12.307435
182	3	Person	58	2021-07-20 06:07:12.383113	2021-07-20 06:07:12.383113
183	3	Person	59	2021-07-20 06:07:12.406452	2021-07-20 06:07:12.406452
184	3	Person	60	2021-07-20 06:07:12.428187	2021-07-20 06:07:12.428187
185	3	Person	61	2021-07-20 06:07:12.484614	2021-07-20 06:07:12.484614
186	3	Person	62	2021-07-20 06:07:12.534242	2021-07-20 06:07:12.534242
187	3	Person	63	2021-07-20 06:07:12.583415	2021-07-20 06:07:12.583415
188	3	Person	64	2021-07-20 06:07:12.654226	2021-07-20 06:07:12.654226
189	3	Person	65	2021-07-20 06:07:12.691588	2021-07-20 06:07:12.691588
190	3	Person	66	2021-07-20 06:07:12.716567	2021-07-20 06:07:12.716567
191	3	Person	67	2021-07-20 06:07:12.732695	2021-07-20 06:07:12.732695
192	3	Person	68	2021-07-20 06:07:12.782098	2021-07-20 06:07:12.782098
193	3	Person	69	2021-07-20 06:07:12.815178	2021-07-20 06:07:12.815178
194	3	Person	70	2021-07-20 06:07:12.85206	2021-07-20 06:07:12.85206
195	3	Person	71	2021-07-20 06:07:12.929978	2021-07-20 06:07:12.929978
196	3	Person	72	2021-07-20 06:07:12.96199	2021-07-20 06:07:12.96199
197	3	Person	73	2021-07-20 06:07:12.982962	2021-07-20 06:07:12.982962
198	3	Person	74	2021-07-20 06:07:13.004458	2021-07-20 06:07:13.004458
199	3	Person	75	2021-07-20 06:07:13.019288	2021-07-20 06:07:13.019288
200	3	Person	76	2021-07-20 06:07:13.040067	2021-07-20 06:07:13.040067
201	3	Person	77	2021-07-20 06:07:13.060948	2021-07-20 06:07:13.060948
202	3	Person	78	2021-07-20 06:07:13.124786	2021-07-20 06:07:13.124786
203	3	Person	79	2021-07-20 06:07:13.147031	2021-07-20 06:07:13.147031
204	3	Person	80	2021-07-20 06:07:13.165756	2021-07-20 06:07:13.165756
205	3	Person	81	2021-07-20 06:07:13.184391	2021-07-20 06:07:13.184391
206	3	Person	82	2021-07-20 06:07:13.262005	2021-07-20 06:07:13.262005
207	3	Person	83	2021-07-20 06:07:13.327743	2021-07-20 06:07:13.327743
208	3	Person	84	2021-07-20 06:07:13.387157	2021-07-20 06:07:13.387157
209	3	Person	85	2021-07-20 06:07:13.431072	2021-07-20 06:07:13.431072
210	3	Person	86	2021-07-20 06:07:13.457035	2021-07-20 06:07:13.457035
211	3	Person	87	2021-07-20 06:07:13.478628	2021-07-20 06:07:13.478628
212	3	Person	88	2021-07-20 06:07:13.497774	2021-07-20 06:07:13.497774
213	3	Person	89	2021-07-20 06:07:13.539041	2021-07-20 06:07:13.539041
214	3	Person	90	2021-07-20 06:07:13.569383	2021-07-20 06:07:13.569383
215	3	Person	91	2021-07-20 06:07:13.601752	2021-07-20 06:07:13.601752
216	3	Person	92	2021-07-20 06:07:13.623605	2021-07-20 06:07:13.623605
217	3	Person	93	2021-07-20 06:07:13.647791	2021-07-20 06:07:13.647791
218	3	Person	94	2021-07-20 06:07:13.683646	2021-07-20 06:07:13.683646
219	3	Person	95	2021-07-20 06:07:13.707526	2021-07-20 06:07:13.707526
220	3	Person	96	2021-07-20 06:07:13.73758	2021-07-20 06:07:13.73758
221	3	Person	97	2021-07-20 06:07:13.759804	2021-07-20 06:07:13.759804
222	3	Person	98	2021-07-20 06:07:13.780925	2021-07-20 06:07:13.780925
223	3	Person	99	2021-07-20 06:07:13.818821	2021-07-20 06:07:13.818821
224	3	Person	100	2021-07-20 06:07:13.841075	2021-07-20 06:07:13.841075
225	3	Person	101	2021-07-20 06:07:13.866811	2021-07-20 06:07:13.866811
226	3	Person	102	2021-07-20 06:07:13.901124	2021-07-20 06:07:13.901124
227	3	Person	103	2021-07-20 06:07:13.917161	2021-07-20 06:07:13.917161
228	3	Person	104	2021-07-20 06:07:13.94199	2021-07-20 06:07:13.94199
229	5	Person	105	2021-07-23 03:01:33.686892	2021-07-23 03:01:33.686892
230	5	Intangible	1	2021-07-23 05:01:25.308692	2021-07-23 05:01:25.308692
231	5	Person	106	2021-07-23 05:01:25.396924	2021-07-23 05:01:25.396924
232	5	Intangible	2	2021-07-23 05:01:25.411063	2021-07-23 05:01:25.411063
233	5	Person	107	2021-07-23 05:01:25.434577	2021-07-23 05:01:25.434577
234	5	Intangible	3	2021-07-23 05:01:25.447499	2021-07-23 05:01:25.447499
235	5	Person	108	2021-07-23 05:01:25.495749	2021-07-23 05:01:25.495749
236	5	Intangible	4	2021-07-23 05:01:25.510583	2021-07-23 05:01:25.510583
237	5	Person	109	2021-07-23 05:01:25.540264	2021-07-23 05:01:25.540264
238	5	Intangible	5	2021-07-23 05:01:25.557639	2021-07-23 05:01:25.557639
239	5	Person	110	2021-07-23 05:01:25.587974	2021-07-23 05:01:25.587974
240	5	Intangible	6	2021-07-23 05:01:25.601777	2021-07-23 05:01:25.601777
241	5	Person	111	2021-07-23 05:01:25.63409	2021-07-23 05:01:25.63409
242	5	Intangible	7	2021-07-23 05:01:25.651002	2021-07-23 05:01:25.651002
243	5	Person	112	2021-07-23 05:01:25.688989	2021-07-23 05:01:25.688989
244	5	Intangible	8	2021-07-23 05:01:25.704581	2021-07-23 05:01:25.704581
245	5	Service	13	2021-07-23 05:01:25.740606	2021-07-23 05:01:25.740606
246	5	Person	113	2021-07-23 05:01:25.757241	2021-07-23 05:01:25.757241
247	5	Intangible	9	2021-07-23 05:08:31.714998	2021-07-23 05:08:31.714998
248	5	Person	114	2021-07-23 05:08:31.738394	2021-07-23 05:08:31.738394
249	5	Intangible	10	2021-07-23 05:08:31.75487	2021-07-23 05:08:31.75487
250	5	Thing	12	2021-07-23 05:08:31.78973	2021-07-23 05:08:31.78973
251	5	Intangible	11	2021-07-23 05:08:31.801902	2021-07-23 05:08:31.801902
252	5	Thing	13	2021-07-23 05:08:31.837432	2021-07-23 05:08:31.837432
253	5	Intangible	12	2021-07-23 05:08:31.856361	2021-07-23 05:08:31.856361
254	5	Service	14	2021-07-23 05:08:31.884214	2021-07-23 05:08:31.884214
255	5	Person	115	2021-07-23 05:08:31.896273	2021-07-23 05:08:31.896273
256	5	Intangible	13	2021-07-23 05:08:31.920301	2021-07-23 05:08:31.920301
257	5	Person	116	2021-07-23 05:08:31.940946	2021-07-23 05:08:31.940946
258	5	Intangible	14	2021-07-23 05:08:31.952478	2021-07-23 05:08:31.952478
259	6	Building	46	2021-07-26 14:37:18.886861	2021-07-26 14:37:18.886861
260	7	Event	3	2021-08-05 06:21:32.406702	2021-08-05 06:21:32.406702
261	7	Event	4	2021-08-05 06:21:32.417485	2021-08-05 06:21:32.417485
262	7	Event	5	2021-08-05 06:21:32.449996	2021-08-05 06:21:32.449996
263	7	Event	6	2021-08-05 06:21:32.459452	2021-08-05 06:21:32.459452
264	7	Event	7	2021-08-05 06:21:32.468008	2021-08-05 06:21:32.468008
265	7	Event	8	2021-08-05 06:21:32.477362	2021-08-05 06:21:32.477362
266	7	Event	9	2021-08-05 06:21:32.48512	2021-08-05 06:21:32.48512
267	7	Event	10	2021-08-05 06:21:32.492974	2021-08-05 06:21:32.492974
268	7	Event	11	2021-08-05 06:21:32.501885	2021-08-05 06:21:32.501885
269	7	Event	12	2021-08-05 06:21:32.520778	2021-08-05 06:21:32.520778
270	7	Event	13	2021-08-05 06:21:32.544123	2021-08-05 06:21:32.544123
271	7	Event	14	2021-08-05 06:21:32.557881	2021-08-05 06:21:32.557881
272	7	Event	15	2021-08-05 06:21:32.568607	2021-08-05 06:21:32.568607
273	7	Event	16	2021-08-05 06:21:32.578161	2021-08-05 06:21:32.578161
274	7	Event	17	2021-08-05 06:21:32.587066	2021-08-05 06:21:32.587066
275	7	Event	18	2021-08-05 06:21:32.596455	2021-08-05 06:21:32.596455
276	7	Event	19	2021-08-05 06:21:32.605284	2021-08-05 06:21:32.605284
277	7	Event	20	2021-08-05 06:21:32.613908	2021-08-05 06:21:32.613908
278	7	Event	21	2021-08-05 06:21:32.623399	2021-08-05 06:21:32.623399
279	7	Event	22	2021-08-05 06:21:32.632607	2021-08-05 06:21:32.632607
280	7	Event	23	2021-08-05 06:21:32.65812	2021-08-05 06:21:32.65812
281	7	Event	24	2021-08-05 06:21:32.668673	2021-08-05 06:21:32.668673
282	7	Event	25	2021-08-05 06:21:32.679078	2021-08-05 06:21:32.679078
283	7	Event	26	2021-08-05 06:21:32.688709	2021-08-05 06:21:32.688709
284	7	Event	27	2021-08-05 06:21:32.700612	2021-08-05 06:21:32.700612
285	7	Event	28	2021-08-05 06:21:32.709161	2021-08-05 06:21:32.709161
286	7	Event	29	2021-08-05 06:21:32.71826	2021-08-05 06:21:32.71826
287	7	Event	30	2021-08-05 06:21:32.725834	2021-08-05 06:21:32.725834
288	7	Event	31	2021-08-05 06:21:32.742389	2021-08-05 06:21:32.742389
289	7	Event	32	2021-08-05 06:21:32.75312	2021-08-05 06:21:32.75312
290	7	Event	33	2021-08-05 06:21:32.760949	2021-08-05 06:21:32.760949
291	7	Event	34	2021-08-05 06:21:32.768622	2021-08-05 06:21:32.768622
292	7	Event	35	2021-08-05 06:21:32.777025	2021-08-05 06:21:32.777025
293	7	Event	36	2021-08-05 06:21:32.798301	2021-08-05 06:21:32.798301
294	7	Event	37	2021-08-05 06:25:12.254884	2021-08-05 06:25:12.254884
295	7	Event	38	2021-08-05 06:25:12.265484	2021-08-05 06:25:12.265484
296	7	Event	39	2021-08-05 06:25:12.27276	2021-08-05 06:25:12.27276
297	7	Event	40	2021-08-05 06:25:12.280341	2021-08-05 06:25:12.280341
298	7	Event	41	2021-08-05 06:25:12.297625	2021-08-05 06:25:12.297625
299	7	Event	42	2021-08-05 06:25:12.317656	2021-08-05 06:25:12.317656
300	7	Event	43	2021-08-05 06:25:12.33958	2021-08-05 06:25:12.33958
301	7	Event	44	2021-08-05 06:25:12.35205	2021-08-05 06:25:12.35205
302	7	Event	45	2021-08-05 06:25:12.361955	2021-08-05 06:25:12.361955
303	7	Event	46	2021-08-05 06:25:12.370977	2021-08-05 06:25:12.370977
304	7	Event	47	2021-08-05 06:25:12.379878	2021-08-05 06:25:12.379878
305	7	Event	48	2021-08-05 06:25:12.38876	2021-08-05 06:25:12.38876
306	7	Event	49	2021-08-05 06:25:12.396584	2021-08-05 06:25:12.396584
307	7	Event	50	2021-08-05 06:25:12.404952	2021-08-05 06:25:12.404952
308	7	Event	51	2021-08-05 06:25:12.413477	2021-08-05 06:25:12.413477
309	7	Event	52	2021-08-05 06:25:12.421024	2021-08-05 06:25:12.421024
310	7	Event	53	2021-08-05 06:25:12.428183	2021-08-05 06:25:12.428183
311	7	Event	54	2021-08-05 06:25:12.437875	2021-08-05 06:25:12.437875
312	7	Event	55	2021-08-05 06:25:12.461821	2021-08-05 06:25:12.461821
313	7	Event	56	2021-08-05 06:25:12.470246	2021-08-05 06:25:12.470246
314	7	Event	57	2021-08-05 06:25:12.481617	2021-08-05 06:25:12.481617
315	7	Event	58	2021-08-05 06:25:12.494919	2021-08-05 06:25:12.494919
316	7	Event	59	2021-08-05 06:25:12.504225	2021-08-05 06:25:12.504225
317	7	Event	60	2021-08-05 06:25:12.512364	2021-08-05 06:25:12.512364
318	7	Event	61	2021-08-05 06:25:12.519755	2021-08-05 06:25:12.519755
319	7	Event	62	2021-08-05 06:25:12.527132	2021-08-05 06:25:12.527132
320	7	Event	63	2021-08-05 06:25:12.535136	2021-08-05 06:25:12.535136
321	7	Event	64	2021-08-05 06:25:12.545442	2021-08-05 06:25:12.545442
322	7	Event	65	2021-08-05 06:25:12.562718	2021-08-05 06:25:12.562718
323	7	Event	66	2021-08-05 06:25:12.572748	2021-08-05 06:25:12.572748
324	7	Event	67	2021-08-05 06:25:12.580099	2021-08-05 06:25:12.580099
325	7	Event	68	2021-08-05 06:25:12.587401	2021-08-05 06:25:12.587401
326	7	Event	69	2021-08-05 06:25:12.595778	2021-08-05 06:25:12.595778
327	7	Event	70	2021-08-05 06:25:12.603126	2021-08-05 06:25:12.603126
328	7	Event	71	2021-08-05 06:25:23.074099	2021-08-05 06:25:23.074099
329	7	Event	72	2021-08-05 06:25:23.084004	2021-08-05 06:25:23.084004
330	7	Event	73	2021-08-05 06:25:23.093629	2021-08-05 06:25:23.093629
331	7	Event	74	2021-08-05 06:25:23.10191	2021-08-05 06:25:23.10191
332	7	Event	75	2021-08-05 06:25:23.109869	2021-08-05 06:25:23.109869
333	7	Event	76	2021-08-05 06:25:23.119005	2021-08-05 06:25:23.119005
334	7	Event	77	2021-08-05 06:25:23.126527	2021-08-05 06:25:23.126527
335	7	Event	78	2021-08-05 06:25:23.134692	2021-08-05 06:25:23.134692
336	7	Event	79	2021-08-05 06:25:23.142081	2021-08-05 06:25:23.142081
337	7	Event	80	2021-08-05 06:25:23.158641	2021-08-05 06:25:23.158641
338	7	Event	81	2021-08-05 06:25:23.169747	2021-08-05 06:25:23.169747
339	7	Event	82	2021-08-05 06:25:23.179126	2021-08-05 06:25:23.179126
340	7	Event	83	2021-08-05 06:25:23.187194	2021-08-05 06:25:23.187194
341	7	Event	84	2021-08-05 06:25:23.194929	2021-08-05 06:25:23.194929
342	7	Event	85	2021-08-05 06:25:23.202302	2021-08-05 06:25:23.202302
343	7	Event	86	2021-08-05 06:25:23.211	2021-08-05 06:25:23.211
344	7	Event	87	2021-08-05 06:25:23.223064	2021-08-05 06:25:23.223064
345	7	Event	88	2021-08-05 06:25:23.240333	2021-08-05 06:25:23.240333
346	7	Event	89	2021-08-05 06:25:23.249547	2021-08-05 06:25:23.249547
347	7	Event	90	2021-08-05 06:25:23.257477	2021-08-05 06:25:23.257477
348	7	Event	91	2021-08-05 06:25:23.265324	2021-08-05 06:25:23.265324
349	7	Event	92	2021-08-05 06:25:23.27391	2021-08-05 06:25:23.27391
350	7	Event	93	2021-08-05 06:25:23.281465	2021-08-05 06:25:23.281465
351	7	Event	94	2021-08-05 06:25:23.288964	2021-08-05 06:25:23.288964
352	7	Event	95	2021-08-05 06:25:23.297356	2021-08-05 06:25:23.297356
353	7	Event	96	2021-08-05 06:25:23.307743	2021-08-05 06:25:23.307743
354	7	Event	97	2021-08-05 06:25:23.330069	2021-08-05 06:25:23.330069
355	7	Event	98	2021-08-05 06:25:23.349679	2021-08-05 06:25:23.349679
356	7	Event	99	2021-08-05 06:25:23.361349	2021-08-05 06:25:23.361349
357	7	Event	100	2021-08-05 06:25:23.371004	2021-08-05 06:25:23.371004
358	7	Event	101	2021-08-05 06:25:23.379853	2021-08-05 06:25:23.379853
359	7	Event	102	2021-08-05 06:25:23.401221	2021-08-05 06:25:23.401221
360	7	Event	103	2021-08-05 06:25:23.410084	2021-08-05 06:25:23.410084
361	7	Event	104	2021-08-05 06:25:23.419002	2021-08-05 06:25:23.419002
362	8	ServiceDatum	1	2021-08-14 08:53:36.219296	2021-08-14 08:53:36.219296
363	8	Service	15	2021-08-14 09:53:21.301226	2021-08-14 09:53:21.301226
364	8	ServiceDatum	2	2021-08-14 09:53:21.332743	2021-08-14 09:53:21.332743
365	8	Service	16	2021-08-14 09:53:21.343469	2021-08-14 09:53:21.343469
366	8	ServiceDatum	3	2021-08-14 09:53:21.356366	2021-08-14 09:53:21.356366
367	8	ServiceDatum	4	2021-08-14 09:53:21.38603	2021-08-14 09:53:21.38603
368	8	Service	17	2021-08-14 09:53:21.41448	2021-08-14 09:53:21.41448
369	8	ServiceDatum	5	2021-08-14 09:53:21.433383	2021-08-14 09:53:21.433383
370	8	Service	18	2021-08-14 09:53:21.44586	2021-08-14 09:53:21.44586
371	8	ServiceDatum	6	2021-08-14 09:53:21.459863	2021-08-14 09:53:21.459863
372	8	ServiceDatum	7	2021-08-14 09:53:21.471414	2021-08-14 09:53:21.471414
373	8	Service	19	2021-08-14 09:53:21.480085	2021-08-14 09:53:21.480085
374	8	ServiceDatum	8	2021-08-14 09:53:21.487938	2021-08-14 09:53:21.487938
375	8	Service	20	2021-08-14 09:53:21.498181	2021-08-14 09:53:21.498181
376	8	ServiceDatum	9	2021-08-14 09:53:21.506259	2021-08-14 09:53:21.506259
377	8	Service	21	2021-08-14 09:53:21.51605	2021-08-14 09:53:21.51605
378	8	ServiceDatum	10	2021-08-14 09:53:21.526774	2021-08-14 09:53:21.526774
379	8	Service	22	2021-08-14 09:53:21.540535	2021-08-14 09:53:21.540535
380	8	ServiceDatum	11	2021-08-14 09:53:21.560982	2021-08-14 09:53:21.560982
381	8	Service	23	2021-08-14 09:53:21.57296	2021-08-14 09:53:21.57296
382	8	ServiceDatum	12	2021-08-14 09:53:21.581139	2021-08-14 09:53:21.581139
383	8	Service	24	2021-08-14 09:53:21.591431	2021-08-14 09:53:21.591431
384	8	ServiceDatum	13	2021-08-14 09:53:21.60079	2021-08-14 09:53:21.60079
385	8	Service	25	2021-08-14 09:53:21.610534	2021-08-14 09:53:21.610534
386	8	ServiceDatum	14	2021-08-14 09:53:21.620719	2021-08-14 09:53:21.620719
387	8	Service	26	2021-08-14 09:53:21.633715	2021-08-14 09:53:21.633715
388	8	ServiceDatum	15	2021-08-14 09:53:21.663046	2021-08-14 09:53:21.663046
389	8	Service	27	2021-08-14 09:53:21.673618	2021-08-14 09:53:21.673618
390	8	ServiceDatum	16	2021-08-14 09:53:21.684153	2021-08-14 09:53:21.684153
391	8	Service	28	2021-08-14 09:53:21.705253	2021-08-14 09:53:21.705253
392	8	ServiceDatum	17	2021-08-14 09:53:21.715664	2021-08-14 09:53:21.715664
393	8	Service	29	2021-08-14 09:53:21.736864	2021-08-14 09:53:21.736864
394	8	ServiceDatum	18	2021-08-14 09:53:21.762501	2021-08-14 09:53:21.762501
395	8	Service	30	2021-08-14 09:53:21.780791	2021-08-14 09:53:21.780791
396	8	ServiceDatum	19	2021-08-14 09:53:21.79059	2021-08-14 09:53:21.79059
397	8	Service	31	2021-08-14 09:53:21.801532	2021-08-14 09:53:21.801532
398	8	ServiceDatum	20	2021-08-14 09:53:21.811711	2021-08-14 09:53:21.811711
399	8	Service	32	2021-08-14 09:53:21.821126	2021-08-14 09:53:21.821126
400	8	ServiceDatum	21	2021-08-14 09:53:21.831264	2021-08-14 09:53:21.831264
401	8	Service	33	2021-08-14 09:53:21.858239	2021-08-14 09:53:21.858239
402	8	ServiceDatum	22	2021-08-14 09:53:21.877246	2021-08-14 09:53:21.877246
403	8	Service	34	2021-08-14 09:53:21.887816	2021-08-14 09:53:21.887816
404	8	ServiceDatum	23	2021-08-14 09:53:21.896907	2021-08-14 09:53:21.896907
405	8	Service	35	2021-08-14 09:53:21.905862	2021-08-14 09:53:21.905862
406	8	ServiceDatum	24	2021-08-14 09:53:21.915784	2021-08-14 09:53:21.915784
407	8	Service	36	2021-08-14 09:53:21.939741	2021-08-14 09:53:21.939741
408	8	ServiceDatum	25	2021-08-14 09:53:21.951971	2021-08-14 09:53:21.951971
409	9	ServiceDatum	26	2021-08-14 09:57:29.566084	2021-08-14 09:57:29.566084
410	9	ServiceDatum	27	2021-08-14 09:57:29.576075	2021-08-14 09:57:29.576075
411	9	ServiceDatum	28	2021-08-14 09:57:29.58604	2021-08-14 09:57:29.58604
412	9	ServiceDatum	29	2021-08-14 09:57:29.595229	2021-08-14 09:57:29.595229
413	9	ServiceDatum	30	2021-08-14 09:57:29.604448	2021-08-14 09:57:29.604448
414	9	ServiceDatum	31	2021-08-14 09:57:29.615568	2021-08-14 09:57:29.615568
415	9	ServiceDatum	32	2021-08-14 09:57:29.642672	2021-08-14 09:57:29.642672
416	9	ServiceDatum	33	2021-08-14 09:57:29.656584	2021-08-14 09:57:29.656584
417	9	ServiceDatum	34	2021-08-14 09:57:29.665832	2021-08-14 09:57:29.665832
418	9	ServiceDatum	35	2021-08-14 09:57:29.675532	2021-08-14 09:57:29.675532
419	9	ServiceDatum	36	2021-08-14 09:57:29.685092	2021-08-14 09:57:29.685092
420	9	ServiceDatum	37	2021-08-14 09:57:29.694264	2021-08-14 09:57:29.694264
421	9	ServiceDatum	38	2021-08-14 09:57:29.703796	2021-08-14 09:57:29.703796
422	9	ServiceDatum	39	2021-08-14 09:57:29.725189	2021-08-14 09:57:29.725189
423	9	ServiceDatum	40	2021-08-14 10:00:17.317035	2021-08-14 10:00:17.317035
424	9	ServiceDatum	41	2021-08-14 10:00:17.327665	2021-08-14 10:00:17.327665
425	9	ServiceDatum	42	2021-08-14 10:00:17.338274	2021-08-14 10:00:17.338274
426	9	ServiceDatum	43	2021-08-14 10:00:17.348346	2021-08-14 10:00:17.348346
427	9	ServiceDatum	44	2021-08-14 10:00:17.357758	2021-08-14 10:00:17.357758
428	9	ServiceDatum	45	2021-08-14 10:00:17.368268	2021-08-14 10:00:17.368268
429	9	ServiceDatum	46	2021-08-14 10:00:17.377796	2021-08-14 10:00:17.377796
430	9	ServiceDatum	47	2021-08-14 10:00:17.397402	2021-08-14 10:00:17.397402
431	9	ServiceDatum	48	2021-08-14 10:00:17.408246	2021-08-14 10:00:17.408246
432	9	ServiceDatum	49	2021-08-14 10:00:17.416752	2021-08-14 10:00:17.416752
433	9	ServiceDatum	50	2021-08-14 10:00:17.426689	2021-08-14 10:00:17.426689
434	9	ServiceDatum	51	2021-08-14 10:00:17.437422	2021-08-14 10:00:17.437422
435	9	ServiceDatum	52	2021-08-14 10:00:17.447398	2021-08-14 10:00:17.447398
436	9	ServiceDatum	53	2021-08-14 10:00:17.460681	2021-08-14 10:00:17.460681
\.


--
-- Name: import_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('import_logs_id_seq', 436, true);


--
-- Data for Name: import_versions; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY import_versions (id, name, created_at, updated_at) FROM stdin;
1	all1	2021-07-20 05:31:00.776399	2021-07-20 05:31:00.776399
2	last64	2021-07-20 05:58:24.896338	2021-07-20 05:58:24.896338
3	all2	2021-07-20 06:07:12.050067	2021-07-20 06:07:12.050067
4	all3	2021-07-21 11:48:15.726636	2021-07-21 11:48:15.726636
5	intangibles1	2021-07-23 02:47:16.940691	2021-07-23 02:47:16.940691
6	20210726	2021-07-26 14:37:18.84995	2021-07-26 14:37:18.84995
7	events1	2021-08-05 06:18:41.682814	2021-08-05 06:18:41.682814
8	ingresos1	2021-08-14 07:42:39.199804	2021-08-14 07:42:39.199804
9	ingresos2	2021-08-14 09:57:29.48585	2021-08-14 09:57:29.48585
\.


--
-- Name: import_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('import_versions_id_seq', 9, true);


--
-- Data for Name: intangibles; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY intangibles (id, detail, noun, name, observations, naming_details, naming_date, created_at, updated_at, thing_id) FROM stdin;
1	\N	Comisión	Comisión Cogobernada de Selección de la Sala "Miguel A. Pareja"	\N	\N	\N	2021-07-23 05:01:25.292794	2021-07-23 05:01:25.292794	\N
2	Los Talleres Paralelos de Libre Orientación Estético-Pedagógica (TPLOEP) organizan la estructura académica del Segundo Período de Estudios del IENBA y orientan la opción estética de los estudiantes. En los TPLOEP se ponen a prueba los postulados más relevantes que el Instituto ha defendido en términos de la diversidad estética, vinculados a la posibilidad efectiva de las más amplias elecciones personales estudiantiles. Cada Taller Paralelo está a cargo de un/a Profesor/a Titular que, junto con su equipo docente, ofrece su orientación particular y diversa en el Segundo Período de Estudios.	Talleres Paralelos de Libre Orientación Estético-Pedagógica	Taller López	\N	\N	\N	2021-07-23 05:01:25.405765	2021-07-23 05:01:25.405765	\N
3	Los Talleres Paralelos de Libre Orientación Estético-Pedagógica (TPLOEP) organizan la estructura académica del Segundo Período de Estudios del IENBA y orientan la opción estética de los estudiantes. En los TPLOEP se ponen a prueba los postulados más relevantes que el Instituto ha defendido en términos de la diversidad estética, vinculados a la posibilidad efectiva de las más amplias elecciones personales estudiantiles. Cada Taller Paralelo está a cargo de un/a Profesor/a Titular que, junto con su equipo docente, ofrece su orientación particular y diversa en el Segundo Período de Estudios.	Talleres Paralelos de Libre Orientación Estético-Pedagógica	Taller Musso	\N	\N	\N	2021-07-23 05:01:25.441985	2021-07-23 05:01:25.441985	\N
4	Los Talleres Paralelos de Libre Orientación Estético-Pedagógica (TPLOEP) organizan la estructura académica del Segundo Período de Estudios del IENBA y orientan la opción estética de los estudiantes. En los TPLOEP se ponen a prueba los postulados más relevantes que el Instituto ha defendido en términos de la diversidad estética, vinculados a la posibilidad efectiva de las más amplias elecciones personales estudiantiles. Cada Taller Paralelo está a cargo de un/a Profesor/a Titular que, junto con su equipo docente, ofrece su orientación particular y diversa en el Segundo Período de Estudios.	Talleres Paralelos de Libre Orientación Estético-Pedagógica	Taller Seveso	\N	\N	\N	2021-07-23 05:01:25.504363	2021-07-23 05:01:25.504363	\N
5	Los Talleres Paralelos de Libre Orientación Estético-Pedagógica (TPLOEP) organizan la estructura académica del Segundo Período de Estudios del IENBA y orientan la opción estética de los estudiantes. En los TPLOEP se ponen a prueba los postulados más relevantes que el Instituto ha defendido en términos de la diversidad estética, vinculados a la posibilidad efectiva de las más amplias elecciones personales estudiantiles. Cada Taller Paralelo está a cargo de un/a Profesor/a Titular que, junto con su equipo docente, ofrece su orientación particular y diversa en el Segundo Período de Estudios.	Talleres Paralelos de Libre Orientación Estético-Pedagógica	Taller Bruzzone	\N	\N	\N	2021-07-23 05:01:25.550959	2021-07-23 05:01:25.550959	\N
6	Los Talleres Paralelos de Libre Orientación Estético-Pedagógica (TPLOEP) organizan la estructura académica del Segundo Período de Estudios del IENBA y orientan la opción estética de los estudiantes. En los TPLOEP se ponen a prueba los postulados más relevantes que el Instituto ha defendido en términos de la diversidad estética, vinculados a la posibilidad efectiva de las más amplias elecciones personales estudiantiles. Cada Taller Paralelo está a cargo de un/a Profesor/a Titular que, junto con su equipo docente, ofrece su orientación particular y diversa en el Segundo Período de Estudios.	Talleres Paralelos de Libre Orientación Estético-Pedagógica	Taller Laborde	\N	\N	\N	2021-07-23 05:01:25.59599	2021-07-23 05:01:25.59599	\N
7	Los Talleres Paralelos de Libre Orientación Estético-Pedagógica (TPLOEP) organizan la estructura académica del Segundo Período de Estudios del IENBA y orientan la opción estética de los estudiantes. En los TPLOEP se ponen a prueba los postulados más relevantes que el Instituto ha defendido en términos de la diversidad estética, vinculados a la posibilidad efectiva de las más amplias elecciones personales estudiantiles. Cada Taller Paralelo está a cargo de un/a Profesor/a Titular que, junto con su equipo docente, ofrece su orientación particular y diversa en el Segundo Período de Estudios.	Talleres Paralelos de Libre Orientación Estético-Pedagógica	Taller Alonso	\N	\N	\N	2021-07-23 05:01:25.643255	2021-07-23 05:01:25.643255	\N
8	Colección de Partituras	Colección en biblioteca	Colección Batlle	Fueron donadas por Luis Batlle Ibañez	\N	\N	2021-07-23 05:01:25.69768	2021-07-23 05:01:25.69768	\N
9	Programa de Becas para estudiantes mujeres que tengan cómo mínimo 390 créditos	Programa de Becas	Martha Peluffo Etchebarne de Jauge 	\N	Formal - Resolución Consejo Fundación Ricaldoni	\N	2021-07-23 05:08:31.702006	2021-07-23 05:08:31.702006	\N
10	El Consejo Directivo de la Universidad, podrá otorgar el título de Doctor Honoris Causa de la\nUniversidad. El título de Doctor Honoris Causa de la Universidad, será otorgado a quienes hayan\nprestado una contribución notable al progreso de la ciencia, la cultura o el bienestar general.	Premio (título honorífico)	Título de Doctor Honoris Causa de la Universidad	En el siguiente link se listan los títulos de Dr. Honoris Causa entregados desde 1936: https://udelar.edu.uy/portal/institucional/titulos-honoris-causa/	Ordenanza de títulos docentes honoríficos aprobada por el CDC	1968-03-04	2021-07-23 05:08:31.750678	2021-07-23 05:08:31.750678	\N
11	El concurso “PUENTE CHINO” tiene como propósito la difusión y promoción del idioma chino y su cultura. Este concurso brinda a los estudiantes una oportunidad de mejorar su nivel de chino mandarín, exhibir sus talentos y promover la amistad entre Uruguay y China. El Concurso se propone ofrecer a estudiantes de todo el mundo una oportunidad de demostrar su habilidad en mandarín y una plataforma para el aprendizaje e intercambio, con la aspiración de estimular su entusiasmo e interés por aprender el chino y aumentar su comprensión de la lengua y la cultura chinas.	Concurso	Puente Chino	En el siguiente link se encuentra la información sobre la edición 2020 https://udelar.edu.uy/confucio/puente-chino-2020/	Sede Central de los Instituto Confucio en la República Popular China	\N	2021-07-23 05:08:31.796441	2021-07-23 05:08:31.822645	12
12	Las becas están orientadas a estudiantes y profesores interesados en realizar estudios de doctorado, maestría y grado en diferentes universidades chinas. El programa además incluye la posibilidad de realizar pasantías de corta duración.	Becas	Becas del Instituto Confucio	En el siguiente link se listan las becas 2020 https://udelar.edu.uy/confucio/becas-2020/	Sede Central de los Instituto Confucio en la República Popular China	\N	2021-07-23 05:08:31.849257	2021-07-23 05:08:31.867582	13
13	Es un espacio de poesia, donde se musicalizan los poemas de los participantes. Los integrantes del taller solicitaron homenajear a al poeta y escritor Washington Benavides, cofundador del Taller junto con el músico y compositor Numa Moraes.	Taller de Creación de Canciones del Área de Cultura de Bienestar	Washigton Benavidez	Continúa vigente el nombramiento 	Aprobado por la Comisión Asesora del Servicio N° exp.006339-000330-18 	2018-08-30	2021-07-23 05:08:31.914877	2021-07-23 05:08:31.914877	\N
14	Campeonato de fútbol 8, jugado en el horario nocturno durante gran parte del año con varios equipos, principalmente de hogares de estudiantes y compañeros de facultad. Los delegados propusieron llamar al campeonato del año 2019, Julio Matto, en honor a quien los  arbitró desde que se creo el mencionado campeonato. 	Torneo de fútbol 8 nocturno, Organizado por el Área de Deportes de Bienestar	Campeonato Julio Matto	Fue nombrado por única vez para este campeonato	Propuesto/Sugerido por el Encargado del Área de Deportes de Bienestar	\N	2021-07-23 05:08:31.946818	2021-07-23 05:08:31.946818	\N
\.


--
-- Name: intangibles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('intangibles_id_seq', 14, true);


--
-- Data for Name: intangibles_people; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY intangibles_people (person_id, intangible_id) FROM stdin;
105	1
106	2
107	3
108	4
109	5
110	6
111	7
112	8
105	1
106	2
107	3
108	4
109	5
110	6
111	7
112	8
105	1
106	2
107	3
108	4
109	5
110	6
111	7
112	8
113	9
114	10
115	13
116	14
\.


--
-- Data for Name: intangibles_services; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY intangibles_services (service_id, intangible_id) FROM stdin;
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
13	9
10	10
11	11
11	12
14	13
14	14
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY people (id, name, bio, sex, created_at, updated_at) FROM stdin;
53	15 - 16 - 24 Oficinas de 1º o Oficina del nombre del Coordinador	-	0	2021-07-20 06:07:12.175904	2021-07-20 06:07:12.175904
54	28 - La carpinteria del Yuyo	El Yuyo fue un estudiante de Bellas Artes que realizó las obras de acondicionamiento del edificio de Playa Hermosa. Era una persona veterana (comenzó la carrera a los 50 años) que se jubiló hace 3 años. Una vez finalizadas las obras se encargó del mantenimiento del local. Su relación con el lugar fue tan estrecho que se hizo una casa en Playa Verde en la que actualmente sigue viviendo. También era conocido por su interés en la filosofía, ya que se le podía escuchar hablar de autores como Heideggel entre otros mientras realizaba arreglos en el edificio.	0	2021-07-20 06:07:12.218053	2021-07-20 06:07:12.218053
55	18 - Taller de Yuyo		0	2021-07-20 06:07:12.251799	2021-07-20 06:07:12.251799
56	34 - El nadador	Frank Perry https://en.wikipedia.org/wiki/Frank_Perry	0	2021-07-20 06:07:12.277748	2021-07-20 06:07:12.277748
57	35 - El Bella Vista	Alicia Cano https://www.diarioelpueblo.com.uy/titulares/alicia-cano-cineasta-productora-y-directora-saltena.html	1	2021-07-20 06:07:12.302519	2021-07-20 06:07:12.302519
58	21 - Baño del Papa	Cesar Charlone - https://es.wikipedia.org/wiki/C%C3%A9sar_Charlone_(cineasta)  y Luis Enrique Fernández - https://es.wikipedia.org/wiki/Luis_Enrique_Fern%C3%A1ndez_Marta	0	2021-07-20 06:07:12.378638	2021-07-20 06:07:12.378638
59	2 - Salón Gigante	Adrián Biniez - https://es.wikipedia.org/wiki/Adri%C3%A1n_Biniez / George Stevens	0	2021-07-20 06:07:12.401735	2021-07-20 06:07:12.401735
60	8 - 3 La isla	Gene Levitt - https://en.wikipedia.org/wiki/Gene_Levitt	0	2021-07-20 06:07:12.424565	2021-07-20 06:07:12.424565
61	13 - El Rincón de Darwin	Diego Fernández - https://culturaenlinea.uy/agente/1488/	0	2021-07-20 06:07:12.479573	2021-07-20 06:07:12.479573
62	  Miguel Ángel Pareja	Miguel Ángel Pareja - https://es.wikipedia.org/wiki/Miguel_%C3%81ngel_Pareja	0	2021-07-20 06:07:12.53	2021-07-20 06:07:12.53
63	Mario Wschebor	Mario Israel Wschebor Wonsever (Montevideo, 3 de diciembre de 1939 - ibídem, 16 de septiembre de 2011) fue un matemático uruguayo de reconocida trayectoria científica a nivel nacional e internacional. En el terreno de la matemática, realizó importantes contribuciones en el área de la probabilidad y la estadística. Fue autor de numerosas publicaciones científicas, entre las que se destaca el libro Level Sets And Extrema Of Random Processes And Fields (Wiley, Reino Unido, 2009), en colaboración con Jean-Marc Azaïs.\nFue un destacado dirigente universitario, decano de la Facultad de Ciencias de la Universidad de la República en el período 1990-1997, luego de participar activamente en el proceso de su creación. Una importante contribución de esta período es el Documento de los cuatro decanos, en el que plantea la necesidad de la creación de un sistema nacional de educación.\nWschebor trabajó en el Centro de Matemática desde 2006.Mario Israel Wschebor Wonsever (Montevideo, 3 de diciembre de 1939 - ibídem, 16 de septiembre de 2011) fue un matemático uruguayo de reconocida trayectoria científica a nivel nacional e internacional. En el terreno de la matemática, realizó importantes contribuciones en el área de la probabilidad y la estadística. Fue autor de numerosas publicaciones científicas, entre las que se destaca el libro Level Sets And Extrema Of Random Processes And Fields (Wiley, Reino Unido, 2009), en colaboración con Jean-Marc Azaïs.\nFue un destacado dirigente universitario, decano de la Facultad de Ciencias de la Universidad de la República en el período 1990-1997, luego de participar activamente en el proceso de su creación. Una importante contribución de esta período es el Documento de los cuatro decanos, en el que plantea la necesidad de la creación de un sistema nacional de educación.\nWschebor trabajó en el Centro de Matemática desde 2006.	0	2021-07-20 06:07:12.578004	2021-07-20 06:07:12.578004
64	 Eugenio Prodanov		0	2021-07-20 06:07:12.645551	2021-07-20 06:07:12.645551
65	Roberto Caldeyro-Barcia	Roberto Caldeyro Barcia (Montevideo, Uruguay, 26 de septiembre de 1921 - 2 de noviembre de 1996) fue un médico perinatólogo, docente e investigador uruguayo.\nDescendiente de españoles e italianos, investigador científico y maestro de maestros. Fue el impulsor y el Director del Centro Latinoamericano de Perinatología, siendo también impulsor y director del Programa de Desarrollo de las Ciencias Básicas (PEDECIBA). Fue pionero en el mundo junto con el dóctor Hermógenes Álvarez en el desarrollo de la medicina perinatal. La actividad de Caldeyro fue documentada en el libro "Roberto Caldeyro Barcia: el mandato de una vocación".\nUruguay ha jugado un rol determinante en el surgimiento de la perinatología, gracias a las contribuciones centrales de estos dos investigadores. Ellos fueron en 1947 quienes establecieron un sistema de trazado con el objetivo de monitorear la presión intrauterina durante el embarazo, labor que hizo posible analizar y definir la contractilidad uterina durante el embarazo y el nacimiento, midiendo la intensidad y la frecuencia de las contracciones y el tono uterino. Esta investigación condujo al establecimiento de las "Unidades Montevideo" para cuantificar la actividad uterina, que son utilizadas en todo el mundo. Al respecto de la labor del doctor Roberto Caldeyro Barcia y el centro de investigación por él dirigido, el doctor Néstor Sala de la Facultad de Medicina de la Universidad de Buenos Aires expresó "no existe ningún otro centro en el mundo que pueda impartir el tipo de enseñanza tan científica, básica y completa como lo hace este centro uruguayo. La excepcional calidad de los métodos empleados, así como la coordinación especial que existe entre la investigación original y sus aplicaciones a la clínica, son las razones que han motivado mi venida al uruguayo". Caldeyro Barcia y Hermógenes Álvarez, en 1955, también desarrollaron un método para medir el efecto de las contracciones uterinas sobre el ritmo cardíaco fetal, que se convirtió luego en la base del monitoreo fetal, usado comúnmente para monitorear la respuesta del feto a las contracciones durante el trabajo de parto y para prevenir daños neurológicos resultantes de carencia de oxígeno.Roberto Caldeyro Barcia (Montevideo, Uruguay, 26 de septiembre de 1921 - 2 de noviembre de 1996) fue un médico perinatólogo, docente e investigador uruguayo.\nDescendiente de españoles e italianos, investigador científico y maestro de maestros. Fue el impulsor y el Director del Centro Latinoamericano de Perinatología, siendo también impulsor y director del Programa de Desarrollo de las Ciencias Básicas (PEDECIBA). Fue pionero en el mundo junto con el dóctor Hermógenes Álvarez en el desarrollo de la medicina perinatal. La actividad de Caldeyro fue documentada en el libro "Roberto Caldeyro Barcia: el mandato de una vocación".\nUruguay ha jugado un rol determinante en el surgimiento de la perinatología, gracias a las contribuciones centrales de estos dos investigadores. Ellos fueron en 1947 quienes establecieron un sistema de trazado con el objetivo de monitorear la presión intrauterina durante el embarazo, labor que hizo posible analizar y definir la contractilidad uterina durante el embarazo y el nacimiento, midiendo la intensidad y la frecuencia de las contracciones y el tono uterino. Esta investigación condujo al establecimiento de las "Unidades Montevideo" para cuantificar la actividad uterina, que son utilizadas en todo el mundo. Al respecto de la labor del doctor Roberto Caldeyro Barcia y el centro de investigación por él dirigido, el doctor Néstor Sala de la Facultad de Medicina de la Universidad de Buenos Aires expresó "no existe ningún otro centro en el mundo que pueda impartir el tipo de enseñanza tan científica, básica y completa como lo hace este centro uruguayo. La excepcional calidad de los métodos empleados, así como la coordinación especial que existe entre la investigación original y sus aplicaciones a la clínica, son las razones que han motivado mi venida al uruguayo". Caldeyro Barcia y Hermógenes Álvarez, en 1955, también desarrollaron un método para medir el efecto de las contracciones uterinas sobre el ritmo cardíaco fetal, que se convirtió luego en la base del monitoreo fetal, usado comúnmente para monitorear la respuesta del feto a las contracciones durante el trabajo de parto y para prevenir daños neurológicos resultantes de carencia de oxígeno.	0	2021-07-20 06:07:12.685239	2021-07-20 06:07:12.685239
66	Prof. Carlos Real de Azua (Doc. Hon.Causa)	Profesor titular de la cátedra de Ciencia Política desde 5-8-1967 al 4-8-1974. Investigador asociado al Instituto de Economía desde 1969 al 1974. Título de Doctor Honoris Causa post- mortem de FCEA en 1991.	0	2021-07-20 06:07:12.712018	2021-07-20 06:07:12.712018
67	Prof. Daniel Buquet (Prof. Emérito)	http://fcea.edu.uy/informacion-general/breve-historia/academicos-destacados-2/614-daniel-buquet.html	0	2021-07-20 06:07:12.728798	2021-07-20 06:07:12.728798
68	Prof. Enrique Gagliardi Castro	Profesor Adjunto Interino de la Cátedra de Banca y Negocios con el Exterior desde el 01-06-1989 al 11-09-1991. Profesor Adjunto Efectivo de la Cátedra de Banca y Negocios con el Exterior desde el 12-09-1991 al 31-12-1994. Profesor Titular Interino de la Cátedra Economía y Gestión Bancaria (ex Banca y Negocios con el exterior) desde el 01-01-1995 al 30-08-2000. Profesor Titular Efectivo de la Cátedra de Economía y Gestión Bancaria desde el 31-8-2000 al 28-02-2014. Profesor Titular Interino de la Maestría en Economía desde el 01-05-2006 al 28-02-2014. Profesor Titular Efectivo del Departamento de Economía desde el 01-03-2014 al 03-08-2017.	0	2021-07-20 06:07:12.763242	2021-07-20 06:07:12.763242
69	Prof. Cr. Israel Wonsewer	http://historiasuniversitarias.edu.uy/biografia/wonsewer-leszcz-israel/	0	2021-07-20 06:07:12.8105	2021-07-20 06:07:12.8105
70	Prof.Cr. Juan Carlos Dean	http://fcea.edu.uy/informacion-general/breve-historia/academicos-destacados/427-juan-carlos-dean.html	0	2021-07-20 06:07:12.84366	2021-07-20 06:07:12.84366
71	 Jorge Blanco y Alicia Bellagamba	Jorge Blanco fue Profesor Agregado Interino de la Cátedra de Cálculo y Probabilidad desde el 01-09-1985 al 31-08-1986. Profesor Titular Efectivo de Matemática Financiera y Actuarial desde el 26-05-1988 al 25-05-1995. Asistente Interino del Instituto de Estadística desde el 15-11-1985 hasta el 30-04-1986. Profesor Adjunto Interino de la cátedra de estadística desde el 01-09-1986 hasta el 03-10-1988. Profesor Agregado Interino de la Cátedra de Estadística desde el 04-10-1988 hasta el 01-02-1990. Profesor Titular de la Cátedra de Estadística I desde el 26-05-1990 hasta e 12-10-2002. Profesor Titular Interino del Instituto de Estadística desde el 01-02-1990 al 30-04-1993. Profesor Titular Efectivo del Instituto de Estadística desde el 27-05-1993 hasta el 12-10-2002. Alicia Bellagamba fue Ayudante Interina de la Cátedra de Estadística desde el 01-05-1987 hasta ek 22-10-1990. Asistente Interina de la Cátedra de Estadística desde el 23-10-1990 hasta el 05-06-1991. Profesora Adjunta Efectiva de la Cátedra de Estadística I desde el 06-06-1991 hasta el 12-10-2002.Ayudante Interina de la Cátedra de Matemática Financiera y Actuarial desde el 01-08-1988 hasta el 30-04-1990. Asistente Interina de la Cátedra de Matemática Financiera y Actuarial desde el 01-05-1989 hasta el 31-07-1990. Profesora Adjunta interina de la Cátedra de Matemática Financiera y Actuarial desde el 01-08-1990 hasta el 30-04-1992. Jorge Blanco fue Profesor Agregado Interino de la Cátedra de Cálculo y Probabilidad desde el 01-09-1985 al 31-08-1986. Profesor Titular Efectivo de Matemática Financiera y Actuarial desde el 26-05-1988 al 25-05-1995. Asistente Interino del Instituto de Estadística desde el 15-11-1985 hasta el 30-04-1986. Profesor Adjunto Interino de la cátedra de estadística desde el 01-09-1986 hasta el 03-10-1988. Profesor Agregado Interino de la Cátedra de Estadística desde el 04-10-1988 hasta el 01-02-1990. Profesor Titular de la Cátedra de Estadística I desde el 26-05-1990 hasta e 12-10-2002. Profesor Titular Interino del Instituto de Estadística desde el 01-02-1990 al 30-04-1993. Profesor Titular Efectivo del Instituto de Estadística desde el 27-05-1993 hasta el 12-10-2002. Alicia Bellagamba fue Ayudante Interina de la Cátedra de Estadística desde el 01-05-1987 hasta ek 22-10-1990. Asistente Interina de la Cátedra de Estadística desde el 23-10-1990 hasta el 05-06-1991. Profesora Adjunta Efectiva de la Cátedra de Estadística I desde el 06-06-1991 hasta el 12-10-2002.Ayudante Interina de la Cátedra de Matemática Financiera y Actuarial desde el 01-08-1988 hasta el 30-04-1990. Asistente Interina de la Cátedra de Matemática Financiera y Actuarial desde el 01-05-1989 hasta el 31-07-1990. Profesora Adjunta interina de la Cátedra de Matemática Financiera y Actuarial desde el 01-08-1990 hasta el 30-04-1992. 	2	2021-07-20 06:07:12.918538	2021-07-20 06:07:12.918538
72	Julio Castro	https://g.co/kgs/hsuiNe	0	2021-07-20 06:07:12.956307	2021-07-20 06:07:12.956307
73	Portal Rabú	https://antviajera.online/portal-rabu-monumento-historico-nacional-de-uruguay-antviajeracomunicandolavida/	0	2021-07-20 06:07:12.979406	2021-07-20 06:07:12.979406
74	Rafael Laguardia	Matemático Uruguayo que fundó el Instituto de Matemáticas	0	2021-07-20 06:07:13.000326	2021-07-20 06:07:13.000326
75	Agustín Cisa	Referente docente de Ing. Eléctrica de 50 anos de trayectoria	0	2021-07-20 06:07:13.015159	2021-07-20 06:07:13.015159
76	Enrique De Martini	Decano 	0	2021-07-20 06:07:13.036097	2021-07-20 06:07:13.036097
77	Félix De Medina	Ingeniero	0	2021-07-20 06:07:13.056967	2021-07-20 06:07:13.056967
78	Eduardo García de Zúñiga	Decano -  referente de la Ing. Civil	0	2021-07-20 06:07:13.11888	2021-07-20 06:07:13.11888
79	Nelson Landoni	Ingeniero	0	2021-07-20 06:07:13.143366	2021-07-20 06:07:13.143366
80	José Luis Massera	Matemático 	0	2021-07-20 06:07:13.162712	2021-07-20 06:07:13.162712
81	Carlos Maggiolo	Ingeniero	0	2021-07-20 06:07:13.181198	2021-07-20 06:07:13.181198
82	Oscar  Maggiolo	Ingeniero - Rector UdelaR	0	2021-07-20 06:07:13.24927	2021-07-20 06:07:13.24927
83	Ricardo Pérez Iribarren	Docente	0	2021-07-20 06:07:13.315198	2021-07-20 06:07:13.315198
84	Juan Raymundo		0	2021-07-20 06:07:13.379107	2021-07-20 06:07:13.379107
85	Julio Ricaldoni	Docente que hizo aporte fundamenta a la ciencia de la ingeniería	0	2021-07-20 06:07:13.422703	2021-07-20 06:07:13.422703
86	Primo Roda	Ingeniero Especializado en transporte	0	2021-07-20 06:07:13.453216	2021-07-20 06:07:13.453216
87	Henry Tejera	Deportista - Director Técnico	0	2021-07-20 06:07:13.474652	2021-07-20 06:07:13.474652
88	Nelson Ventura	Funcionario Técnico Electricista de amplia y valiosa trayectoria en el Instituto de Ingeniería Eléctrica	0	2021-07-20 06:07:13.494226	2021-07-20 06:07:13.494226
89	Juan José Cabezas	Ingeniero - Docente que valiosos aportes a la Ing. en Computación	0	2021-07-20 06:07:13.532715	2021-07-20 06:07:13.532715
90	Profesor Alberto Langlade	Fuente: Dogliotti, Paola (2018a) “Educación/enseñanza del cuerpo en la formación del profesor de educación física en el Uruguay (1948-1970)” Tesis de Doctorado. Doctorado en Ciencias de la Educación. Facultad de Humanidades y Ciencias de la Educación. Universidad Nacional de la Plata. 380p. Disponible en: http://sedici.unlp.edu.ar/handle/10915/73914 o en: http://www.memoria.fahce.unlp.edu.ar/tesis/te.1667/te.1667.pdf Acceso: 5 abril 2020Alberto Langlade (1919 – 1980) fue profesor de Educación Física egresado del Curso para la Preparación de Profesores de Educación Física de la CNEF de Uruguay, luego llamado ISEF. Es de destacar que desde su formación de grado tuvo una trayectoria singular ya que el tercer año de su carrera, en 1945, lo cursó a través de una beca en el Instituto de Educación Física y Técnica de la Universidad de Santiago de Chile, año que obtiene el título al regresar de su beca, rindiendo examen de todas las asignaturas. En 1946 ingresa como ayudante de Gimnasia Práctica y Teoría de la Gimnasia a cargo del profesor Pedro de Hegedüs, quien se retira a fines de 1947 y desde 1948 a 1966 asume la titularidad. Ocupó a partir de 1948 el cargo de Secretario del Curso de Profesores de Educación Física y desde 1949 hasta 1966 que se jubila319, el cargo de Jefe de Estudios de ISEF. En 1949 concurre a la Segunda Lingiada de Gimnasia en Estocolmo donde cursa 4 meses de estudio en la GCI320. En 1952 inicia una vista sistemática a los centros especializados de Educación Física en Europa (Finlandia, Suecia, Dinamarca, Alemania, Holanda, Bélgica, Francia, Suiza, Inglaterra, Portugal e Italia)321. A través de su mediación varios profesores recién recibidos obtienen becas para estudiar en la GCI de Estocolmo y en la Escuela de Educación Física de Colonia, Alemania. Fue un profesor destacado a nivel nacional e internacional fundamentalmente por su obra en el campo de la gimnasia, si bien a nivel nacional ha tenido una destacada trayectoria profesional en el ámbito de la preparación física de selecciones de básquetbol y fútbol y en la dirección técnica de cuadros reconocidos en estos deportes. Entre 1952 y 1967 fue profesor de Gimnasia Especial en la Carrera de Fisioterapia de la Facultad de Medicina. En 1963 fue designado Profesor Extraordinario de la Facultad de Filosofía y Educación de la Universidad de Chile. Ha dictado cursos de posgrado y conferencias sobre las temáticas de la gimnasia y el entrenamiento deportivo a nivel internacional. El ISEF lleva su nombre a partir de la ley 16.086 del 18 de octubre de 1989322 (Uruguay, 1989). 319 Trabajó en el ISEF hasta el 31 de mayo de 1966 (López Ramírez, 1966b). 320 Instituto Central de Gimnasia, sigla en sueco, creado por Pedro Enrique Ling en 1813. Es de destacar que como producto de este viaje, escribió 4 libros con sus memorias, se encontraron 3, el último escrito con su esposa Nelly Rey de Langlade: Libro I Fiesta Internacional de Gimnasia; Libro III Cursos Internacionales de gimnasia. Campamento Internacional de Gimnasia; Libro IV Suecia Post Lingiada (Langlade, s/d; Langlade; Nelly Rey de Langlade, s/d). Se calcula que como la Lingiada sucedió en octubre los libros fueron confeccionados a su regreso en el año 1950. 321 No olvidar, como ya se consignó a inicios del capítulo uno, que fue destacada su actuación y exposición en el Primer Congreso Latino de Educación Física en Burdeos, según lo relata Julio J. Rodríguez, a la que ambos concurrieron. En ese entonces Langlade ya poseía un reconocimiento internacional en el tema de teoría de la gimnasia (CNEF, 1952b y c: 12 y 20). 322 Disponible en: http://www.parlamento.gub.uy/leyes/AccesoTextoLey.asp?Ley=16086&Anchor= 217 Entre sus principales obras editadas se destacan: Teoría General de la Gimnasia323, Buenos Aires, Stadium, 1970 (en coautoría con su esposa Nelly Rey de Langlade324); Gimnasia Especial Correctiva, Buenos Aires: Stadium, 1966; Actividades físicas programadas en la rehabilitación de algunas cardiopatías, Buenos Aires: Stadium, 1976 (en coatoría con Nelly Rey de Langlade); Fútbol. Entrenamiento Para La Alta Competencia, Buenos Aires: Stadium, 1976. Por otra parte, son de destacar las siguientes dos obras monográficas: Gimnasia Moderna, trabajo presentado para optar por el título de Profesor Extraordinario en Teoría de la Gimnasia en la Universidad de Chile, Montevideo, abril 1960; Teoría de la Gimnasia. Tesis de graduación editada por la CNEF, con presentación de Julio J. Rodríguez en noviembre 1947 y prólogo de Pedro De Hegedüs. Ha publicado múltiples artículos en revistas nacionales y extranjeras y una gran cantidad de manuales de estudio para los estudiantes de ISEF en el área de la gimnasia325	0	2021-07-20 06:07:13.555977	2021-07-20 06:07:13.555977
91	Profesora Irene Preobrayensky	Fuente: Ana Torrón y Andrés Torrón, hija (y docente de ISEF) e hijo de la Profesora Irene Preobrayensky a quienes les agradecemos el trabajo. Elaboraron la biografía a los efectos de incluirla en el proyecto Nomenclator Universitario. Setiembre de 2020.   \nIrene Preobrayensky (Montevideo, 1934-2015)\n\nNació en Montevideo en el año 1934 de padres de nacionalidad rusa. Vivió su infancia en el barrio Colón junto a su hermana Marina. Se casó en 1964 con José Torrón, con quien tuvo dos hijos Andrés y Ana Torrón.\n\nCursó el profesorado en educación física en el Instituto Superior de Educación Física (ISEF), donde ingresó en 1950 con 16 años. Egresó en 1952 y en 1954 presenta su tesis, obteniendo su título de profesora. \nEntre 1961 y 1963 cursó la licenciatura en Fisioterapia en la Escuela de Tecnología Médica de la Universidad de la República. \nA partir del año 1960 y hasta 1991 se desempeñó como profesora adjunta, grado 3, y entre 1992 y 1995 como profesora agregada, grado 4. \nFue la  primera  coordinadora  de  la  Carrera de Fisioterapia de la Escuela Universitaria de Tecnología Médica, cargo que ejerció entre 1985 y 1993. Fue miembro fundador de la Asociación de Fisioterapeutas del Uruguay.\n\nTuvo una larga trayectoria dentro de la Comisión Nacional de Educación Física, obteniendo el primer puesto como Inspectora en 1984, como Subdirectora de Departamento en 1986 y como Directora de Departamento en 1994.\nEntre los años 1988 y 1995 se desempeñó como Jefa de Estudios de ISEF. Entre los años 2003 y 2012 ocupó el cargo de Encargada del Área Biológica de la Licenciatura de Educación Física de Montevideo y en 2010 también ocupó el cargo de Encargada de la Licenciatura de ISEF.\n\nDesempeñó cargos de cogobierno en ambos servicios universitarios y en especial fue delegada por el orden docente a la Comisión de Reestructura de ISEF entre 2006 y 2010. \n\nSu tarea fue muy importante en varios momentos claves del ISEF. Colaboró en la reorganización y las transformaciones del Instituto luego de la dictadura como Jefa de Estudio y en la descentralización del ISEF, especialmente en la región noroeste. \nTuvo un rol protagónico en la transformación de ISEF en una institución universitaria.\n\nEn 2006 publicó el libro “Actividad Física: Nuevas Perspectivas” (Dunken, Argentina) junto al Dr. Yamandú Gillman.\n\nPese a jubilarse nunca abandonó su actividad académica. En sus últimos años se dedicó a viajar por el mundo, a escribir narrativa y poesía (editó el libro de cuentos y poesía “Vivencias” en 2014) y a ser parte fundamental en la vida de sus nietos Lucía, Felipe, Paulina y Luca. \nFuente: Ana Torrón y Andrés Torrón, hija (y docente de ISEF) e hijo de la Profesora Irene Preobrayensky a quienes les agradecemos el trabajo. Elaboraron la biografía a los efectos de incluirla en el proyecto Nomenclator Universitario. Setiembre de 2020.   \nIrene Preobrayensky (Montevideo, 1934-2015)\n\nNació en Montevideo en el año 1934 de padres de nacionalidad rusa. Vivió su infancia en el barrio Colón junto a su hermana Marina. Se casó en 1964 con José Torrón, con quien tuvo dos hijos Andrés y Ana Torrón.\n\nCursó el profesorado en educación física en el Instituto Superior de Educación Física (ISEF), donde ingresó en 1950 con 16 años. Egresó en 1952 y en 1954 presenta su tesis, obteniendo su título de profesora. \nEntre 1961 y 1963 cursó la licenciatura en Fisioterapia en la Escuela de Tecnología Médica de la Universidad de la República. \nA partir del año 1960 y hasta 1991 se desempeñó como profesora adjunta, grado 3, y entre 1992 y 1995 como profesora agregada, grado 4. \nFue la  primera  coordinadora  de  la  Carrera de Fisioterapia de la Escuela Universitaria de Tecnología Médica, cargo que ejerció entre 1985 y 1993. Fue miembro fundador de la Asociación de Fisioterapeutas del Uruguay.\n\nTuvo una larga trayectoria dentro de la Comisión Nacional de Educación Física, obteniendo el primer puesto como Inspectora en 1984, como Subdirectora de Departamento en 1986 y como Directora de Departamento en 1994.\nEntre los años 1988 y 1995 se desempeñó como Jefa de Estudios de ISEF. Entre los años 2003 y 2012 ocupó el cargo de Encargada del Área Biológica de la Licenciatura de Educación Física de Montevideo y en 2010 también ocupó el cargo de Encargada de la Licenciatura de ISEF.\n\nDesempeñó cargos de cogobierno en ambos servicios universitarios y en especial fue delegada por el orden docente a la Comisión de Reestructura de ISEF entre 2006 y 2010. \n\nSu tarea fue muy importante en varios momentos claves del ISEF. Colaboró en la reorganización y las transformaciones del Instituto luego de la dictadura como Jefa de Estudio y en la descentralización del ISEF, especialmente en la región noroeste. \nTuvo un rol protagónico en la transformación de ISEF en una institución universitaria.\n\nEn 2006 publicó el libro “Actividad Física: Nuevas Perspectivas” (Dunken, Argentina) junto al Dr. Yamandú Gillman.\n\nPese a jubilarse nunca abandonó su actividad académica. En sus últimos años se dedicó a viajar por el mundo, a escribir narrativa y poesía (editó el libro de cuentos y poesía “Vivencias” en 2014) y a ser parte fundamental en la vida de sus nietos Lucía, Felipe, Paulina y Luca. \n	1	2021-07-20 06:07:13.597248	2021-07-20 06:07:13.597248
92	Profesora Marta Büsch 	Fuente: Torrón, Ana (2015) " Gimnasia y Deporte en el Instituto Superior de Educación Física (1939 – 1973), su configuración y su enseñanza"  Tesis presentada con el objetivo de obtener el título de Magister en Enseñanza\nUniversitaria en el marco del Programa de Especialización y Maestría en Enseñanza\nUniversitaria del Área Social y de la Comisión Sectorial de Enseñanza de la\nUniversidad de la República.                                       "Marta Büsch ingresó como estudiante al ISEF en 1950, realizando luego de su egreso, numerosos viajes de estudio. En el instituto fue alumna de Nelly Rey de Langlade y su continuadora al frente de la cátedra de Gimnasia Rítmica. Hay acuerdos en su formación en Alemania en la escuela de Medau, desde donde trajo numerosas innovaciones referidas a las técnicas específicas de la gimnasia moderna: “Ella se fue a Alemania en 1958-59, aproximadamente. Hasta ese momento hacíamos gimnasia neo sueca. Fue a la escuela de Medau y hubo que aprender el resorte, todo era con resorte, con aros, con clavas.” (E9). Otros datos afirman que previamente estudió en Suecia y luego es conocida su formación en Estados Unidos, donde obtuvo un título de maestría. En los años 80 fue la Directora General del ISEF y desde el año 2011 el gimnasio principal de la institución lleva su nombre." (pág. 149)Fuente: Torrón, Ana (2015) " Gimnasia y Deporte en el Instituto Superior de Educación Física (1939 – 1973), su configuración y su enseñanza"  Tesis presentada con el objetivo de obtener el título de Magister en Enseñanza\nUniversitaria en el marco del Programa de Especialización y Maestría en Enseñanza\nUniversitaria del Área Social y de la Comisión Sectorial de Enseñanza de la\nUniversidad de la República.                                       "Marta Büsch ingresó como estudiante al ISEF en 1950, realizando luego de su egreso, numerosos viajes de estudio. En el instituto fue alumna de Nelly Rey de Langlade y su continuadora al frente de la cátedra de Gimnasia Rítmica. Hay acuerdos en su formación en Alemania en la escuela de Medau, desde donde trajo numerosas innovaciones referidas a las técnicas específicas de la gimnasia moderna: “Ella se fue a Alemania en 1958-59, aproximadamente. Hasta ese momento hacíamos gimnasia neo sueca. Fue a la escuela de Medau y hubo que aprender el resorte, todo era con resorte, con aros, con clavas.” (E9). Otros datos afirman que previamente estudió en Suecia y luego es conocida su formación en Estados Unidos, donde obtuvo un título de maestría. En los años 80 fue la Directora General del ISEF y desde el año 2011 el gimnasio principal de la institución lleva su nombre." (pág. 149)	1	2021-07-20 06:07:13.619451	2021-07-20 06:07:13.619451
93	Maestro Hector Ferrari		0	2021-07-20 06:07:13.64024	2021-07-20 06:07:13.64024
94	Tertulia		0	2021-07-20 06:07:13.679422	2021-07-20 06:07:13.679422
95	Maggiolo		0	2021-07-20 06:07:13.703002	2021-07-20 06:07:13.703002
96	Farabeuf		0	2021-07-20 06:07:13.730536	2021-07-20 06:07:13.730536
97	Dra. Paulina Luisi		1	2021-07-20 06:07:13.756471	2021-07-20 06:07:13.756471
98	Prof.Ernesto Quintela		0	2021-07-20 06:07:13.777085	2021-07-20 06:07:13.777085
99	Juan Carlos Carrasco	Juan Carlos Carrasco (1923 - 2010) fue Psicólogo, Profesor Emérito de la Facultad de Psicología y Doctor Honoris Causa de la Universidad de la República. Juan Carlos Carrasco fue pionero de la Psicología en el Uruguay y de la Extensión Universitaria. Fue director del IPUR (Instituto de Psicología de la Universidad de la República) y participó en la creación de la Facultad de Psicología. 	0	2021-07-20 06:07:13.814456	2021-07-20 06:07:13.814456
100	José Luis Rebellato	José Luis Rebellato (1946 - 1999), Doctor en Filosofía por la Universidad Pontificia Salesiana de Roma. Fue docente de la Universidad de la República, de la Escuela Universitaria de Psicología desde 1985, también del IPUR, de la Escuela Universitaria de Servicio Social y del Programa APEX-CERRO. 	0	2021-07-20 06:07:13.836248	2021-07-20 06:07:13.836248
101	 Oscar J. Maggiolo	http://historiasuniversitarias.edu.uy/biografia/maggiolo-oscar-julio/	0	2021-07-20 06:07:13.860384	2021-07-20 06:07:13.860384
102	 Lago	JUAN MARÍA LAGO\n\nNació en 1867 en el Avestruz, departamento de Treinta y Tres, lugar de donde es oriundo también Prudencio Vázquez y Vega.\nSiendo estudiante participó en la Revolución del Quebracho, en defensa de la autonomía universitaria en contra del dictador Máximo Santos.\nSe doctoró de abogado en el año 1899.\nEn 1901 fue designado presidente de la Juventud Colorada y del Club Libertad en el gran movimiento por la unificación del partido.\nFue uno de los políticos más independientes del Partido Colorado. \nAmigo inseparable de José Enrique Rodó, militaron juntos contra el batllismo, el vierismo y demás fracciones personalistas de dicho partido.\nComo constituyente en 1916 propuso la forma de gobierno parlamentario y la creación de un nuevo poder del Estado: el Poder Electoral.\nEntre otras iniciativas suyas figuran el ferrocarril Maldonado-Río Branco y la expropiación de las tierras marginales, de acuerdo con las teorías de don Andrés Lamas, para la creación de granjas-hogares.\nEn 1929 pugnó por la creación de un reformatorio y por otros cambios en el Derecho Penal y Penitenciario.\nFue miembro del directorio de la UTE, del cual fue destituido por el golpe de Estado del 31 de marzo de 1933.\nFalleció el 1º de enero de 1936.                                                                                                                                         Referencia: Julio Lago / Juan María Lago, abogado del 900: contribución al estudio de su vida y de su época. Montevideo, 1967.	0	2021-07-20 06:07:13.895349	2021-07-20 06:07:13.895349
103	 Melita Hernández	Melita Hernández (7 de noviembre de 1933-Montevideo, 9 de octubre de 2018), fue una enfermera comunitaria y docente uruguaya.	1	2021-07-20 06:07:13.913335	2021-07-20 06:07:13.913335
104	 Abel Ayala	Nacido en la ciudad de Rivera el 15 de noviembre de 1943. Desaparecido el 17 de julio de 1971. Funcionario en Servicio Policial de Asistencia Médica (Sanidad Policial) como encargado de relaciones y asesor con el grado de Agente de Segunda. (desde el 04/0	0	2021-07-20 06:07:13.934163	2021-07-20 06:07:13.934163
105	Comisión Cogobernada de Selección de la Sala "Miguel A. Pareja"	Miguel Ángel Pareja - https://es.wikipedia.org/wiki/Miguel_%C3%81ngel_Pareja	0	2021-07-23 03:01:33.668501	2021-07-23 03:01:33.668501
106	López	Ana Laura López de la Torre - https://www.coleccioncisneros.org/es/authors/ana-laura-l%C3%B3pez-de-la-torre	1	2021-07-23 05:01:25.382758	2021-07-23 05:01:25.382758
107	Musso	Carlos Musso - http://www.arteuy.com.uy/Musso/carlosbio.htm	0	2021-07-23 05:01:25.428303	2021-07-23 05:01:25.428303
108	Seveso	Carlos Seveso - http://www.portondesanpedro.com/autor-curriculum.php?id=470	0	2021-07-23 05:01:25.489402	2021-07-23 05:01:25.489402
109	Bruzzone	Gabriel Bruzzone - http://www.portondesanpedro.com/autor-curriculum.php?id=529	0	2021-07-23 05:01:25.534602	2021-07-23 05:01:25.534602
110	Laborde	Héctor Laborde	0	2021-07-23 05:01:25.581715	2021-07-23 05:01:25.581715
111	Alonso	Javier Alonso	0	2021-07-23 05:01:25.627888	2021-07-23 05:01:25.627888
112	Batlle	Luis Batlle Ibañez - https://es.wikipedia.org/wiki/Luis_Batlle_Ib%C3%A1%C3%B1ez	0	2021-07-23 05:01:25.682023	2021-07-23 05:01:25.682023
113	Martha Peluffo Etchebarne de Jauge 	 primera mujer de la Facultad de Ingeniera en obtener una Medalla de Oro	1	2021-07-23 05:01:25.750325	2021-07-23 05:01:25.750325
114	Título de Doctor Honoris Causa de la Universidad		0	2021-07-23 05:08:31.73273	2021-07-23 05:08:31.73273
115	Washigton Benavidez	Washington "Bocha" Benavides, (1930 - 2017) Nacido en Tacuarembó (Uruguay), fue un poeta, docente y músico uruguayo, varios de sus de sus trabajos fueron musicalizados por importantes cantantes como Zitarroza, Darnauchans, Numa Moraes, y otros. Fue docente en la Facultad de Humanidades, y el responsable y creador del Taller de Creación de Canciones junto a Numa Moraes y Mario Paz 	0	2021-07-23 05:08:31.891566	2021-07-23 05:08:31.891566
116	Julio Matto	Julio Matto, nacido en 1951 en Uruguay, es un reconocido arbitro Internacional de fútbol, se retiro a los 45 años y tubo una carrera muy reconocida en la competencia Nacional e Internacional, arbitrando partidos muy importantes como finales de torneos Internacionales o los clasicos entre los equipos mas importantes de nuestro pais.	0	2021-07-23 05:08:31.936552	2021-07-23 05:08:31.936552
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('people_id_seq', 116, true);


--
-- Data for Name: people_places; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY people_places (place_id, person_id) FROM stdin;
2	1
3	2
5	3
6	4
7	5
11	6
12	7
13	8
15	9
19	10
22	11
23	12
24	13
25	15
26	16
27	18
28	19
29	20
30	21
31	23
32	24
33	25
34	26
35	27
36	28
37	29
38	30
39	31
40	32
41	33
42	34
43	35
44	36
45	38
46	39
47	40
48	42
49	43
50	44
51	45
52	46
53	47
54	48
55	49
56	51
2	53
3	54
5	55
6	56
7	57
11	58
12	59
13	60
15	61
19	62
22	63
23	64
24	65
25	67
26	68
27	70
28	71
29	72
30	73
31	75
32	76
33	77
34	78
35	79
36	80
37	81
38	82
39	83
40	84
41	85
42	86
43	87
44	88
45	90
46	91
47	92
48	94
49	95
50	96
51	97
52	98
53	99
54	100
55	101
56	103
2	53
3	54
5	55
6	56
7	57
11	58
12	59
13	60
15	61
19	62
22	63
23	64
24	65
25	67
26	68
27	70
28	71
29	72
30	73
31	75
32	76
33	77
34	78
35	79
36	80
37	81
38	82
39	83
40	84
41	85
42	86
43	87
44	88
45	90
46	91
47	92
48	94
49	95
50	96
51	97
52	98
53	99
54	100
55	101
56	103
2	53
3	54
5	55
6	56
7	57
11	58
12	59
13	60
15	61
19	62
22	63
23	64
24	65
25	67
26	68
27	70
28	71
29	72
30	73
31	75
32	76
33	77
34	78
35	79
36	80
37	81
38	82
39	83
40	84
41	85
42	86
43	87
44	88
45	90
46	91
47	92
48	94
49	95
50	96
51	97
52	98
53	99
54	100
55	101
56	103
2	53
3	54
5	55
6	56
7	57
11	58
12	59
13	60
15	61
19	62
22	63
23	64
24	65
25	67
26	68
27	70
28	71
29	72
30	73
31	75
32	76
33	77
34	78
35	79
36	80
37	81
38	82
39	83
40	84
41	85
42	86
43	87
44	88
45	90
46	91
47	92
48	94
49	95
50	96
51	97
52	98
53	99
54	100
55	101
56	103
2	53
3	54
5	55
6	56
7	57
11	58
12	59
13	60
15	61
19	62
22	63
23	64
24	65
25	67
26	68
27	70
28	71
29	72
30	73
31	75
32	76
33	77
34	78
35	79
36	80
37	81
38	82
39	83
40	84
41	85
42	86
43	87
44	88
45	90
46	91
47	92
48	94
49	95
50	96
51	97
52	98
53	99
54	100
55	101
56	103
2	53
3	54
5	55
6	56
7	57
11	58
12	59
13	60
15	61
19	62
22	63
23	64
24	65
25	67
26	68
27	70
28	71
29	72
30	73
31	75
32	76
33	77
34	78
35	79
36	80
37	81
38	82
39	83
40	84
41	85
42	86
43	87
44	88
45	90
46	91
47	92
48	94
49	95
50	96
51	97
52	98
53	99
54	100
55	101
56	103
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY places (id, building_id, type, detail, name, observations, naming_details, naming_date, created_at, updated_at, ptype, thing_id) FROM stdin;
2	2	\N	Oficinas	15 - 16 - 24 Oficinas de 1º o Oficina del nombre del Coordinador	\N	Informal	\N	2021-07-20 05:53:58.696166	2021-07-20 05:53:58.696166	10	\N
3	3	\N	Taller	28 - La carpinteria del Yuyo	\N	Informal	\N	2021-07-20 05:53:58.763552	2021-07-20 05:53:58.763552	10	\N
5	5	\N	Taller	18 - Taller de Yuyo	\N	Informal	\N	2021-07-20 05:53:58.870763	2021-07-20 05:53:58.870763	10	\N
6	6	\N	\N	34 - El nadador	\N	Informal	\N	2021-07-20 05:53:58.912353	2021-07-20 05:53:58.912353	4	\N
7	7	\N	\N	35 - El Bella Vista	\N	Informal	\N	2021-07-20 05:53:58.986711	2021-07-20 05:53:58.986711	4	\N
11	11	\N	\N	21 - Baño del Papa	\N	Informal	\N	2021-07-20 05:53:59.186656	2021-07-20 05:53:59.186656	4	\N
12	12	\N	\N	2 - Salón Gigante	\N	Informal	\N	2021-07-20 05:53:59.220927	2021-07-20 05:53:59.220927	4	\N
13	13	\N	\N	8 - 3 La isla	\N	Informal	\N	2021-07-20 05:53:59.285124	2021-07-20 05:53:59.285124	4	\N
15	15	\N	\N	13 - El Rincón de Darwin	\N	Informal	\N	2021-07-20 05:53:59.374838	2021-07-20 05:53:59.374838	4	\N
19	19	\N	Sala de Exposición	Sala de Exposiciones Miguel Ángel Pareja	\N	\N	\N	2021-07-20 05:53:59.54231	2021-07-20 05:53:59.54231	10	\N
22	22	\N	Sede universitaria de la Facultad de Ciencias en Malvín Norte	Mario Wschebor	\N	Exp. 241160-000286-11 - Atento a lo propuesto por el Consejo de la Facultad de Ciencias por resolución Nº 3 de 19/9/11 y a que se han cumplido los extremos previstos en la Ordenanza sobre Homenajes a Personas de 25/5/51, adherir calurosamente al homenaje que la referida Facultad realizará al Prof. Dr. Mario Wschebor a través de la nominación del Edificio Sede con su nombre, antecedentes que lucen en el distribuido Nº 717/11. (15 en 15)Exp. 241160-000286-11 - Atento a lo propuesto por el Consejo de la Facultad de Ciencias por resolución Nº 3 de 19/9/11 y a que se han cumplido los extremos previstos en la Ordenanza sobre Homenajes a Personas de 25/5/51, adherir calurosamente al homenaje que la referida Facultad realizará al Prof. Dr. Mario Wschebor a través de la nominación del Edificio Sede con su nombre, antecedentes que lucen en el distribuido Nº 717/11. (15 en 15)	2011-09-19	2021-07-20 05:53:59.699031	2021-07-20 05:53:59.699031	0	\N
23	23	\N	Pisos 1 y 2 Anexo Norte- Instituto de Química Biológica	 Eugenio Prodanov	\N	Consejo FCIEN - Resolucion N° 80 Respaldar con beneplácito la propuesta del Instituto de Química Biológica de colocar una placa recordatoria en homenaje al Profesor Emérito Dr. Eugenio Prodanov con motivo de cumplirse un año de su desaparición física que se descubriría en la realización del acto conmemorativo a su memoria que está organizando la S. U. de Biociencias y el PEDECIBA.Consejo FCIEN - Resolucion N° 80 Respaldar con beneplácito la propuesta del Instituto de Química Biológica de colocar una placa recordatoria en homenaje al Profesor Emérito Dr. Eugenio Prodanov con motivo de cumplirse un año de su desaparición física que se descubriría en la realización del acto conmemorativo a su memoria que está organizando la S. U. de Biociencias y el PEDECIBA.	2001-09-03	2021-07-20 05:53:59.759262	2021-07-20 05:53:59.759262	10	\N
24	24	\N	Salón de Actos de la Facultad de Ciencias	Roberto Caldeyro-Barcia	\N	Consejo (Exp. Nº 01054) (1) Tomar conocimiento del encuentro de carácter científico organizado por el PEDECIBA en homenaje a su Director fundador Dr. Honoris Causa Roberto Caldeyro Barcia y en commemoracion delos 10 años de funcionamiento de dicho Programa, a realizarse los dias 10, 11 y 12 de noviembre próximos. (2) De acuerdo a la propuesta del Sr. Decano, determinar qeu el Salon de Actos del nuevo edificio de la Facultad de Ciencias lleve el nombre de Roberto Caldeyro Barcia, Director - Fundador del PEDECIBA colocando en el mismo una placa recordatoria.\n\n                \nConsejo (Exp. Nº 01054) (1) Tomar conocimiento del encuentro de carácter científico organizado por el PEDECIBA en homenaje a su Director fundador Dr. Honoris Causa Roberto Caldeyro Barcia y en commemoracion delos 10 años de funcionamiento de dicho Programa, a realizarse los dias 10, 11 y 12 de noviembre próximos. (2) De acuerdo a la propuesta del Sr. Decano, determinar qeu el Salon de Actos del nuevo edificio de la Facultad de Ciencias lleve el nombre de Roberto Caldeyro Barcia, Director - Fundador del PEDECIBA colocando en el mismo una placa recordatoria.\n\n                \n	1997-09-15	2021-07-20 05:53:59.795436	2021-07-20 05:53:59.795436	2	\N
25	25	\N	Salón 6	Prof. Daniel Buquet (Prof. Emérito)	\N	Acta de sesión de fecha 13/04/2015	2015-04-13	2021-07-20 05:53:59.855929	2021-07-20 05:53:59.855929	4	\N
26	25	\N	Salón 7	Prof. Enrique Gagliardi Castro	\N	Resolución N° 42 del Consejo Sesión de fecha 18/03/2019	2019-03-18	2021-07-20 05:53:59.901745	2021-07-20 05:53:59.901745	4	\N
27	25	\N	Sala del Consejo	Prof.Cr. Juan Carlos Dean	\N	Resolución N° 56 del Consejo Sesión de fecha 12/08/2004	2004-08-12	2021-07-20 05:53:59.981964	2021-07-20 05:53:59.981964	10	\N
28	26	\N	\N	Sala Jorge Blanco y Alicia Bellagamba	\N	Acta de sesión de fecha 06/10/2005	2005-10-06	2021-07-20 05:54:00.023437	2021-07-20 05:54:00.023437	3	\N
29	27	\N	Sala de redacción (aula con computadoras)	Julio Castro	\N	\N	\N	2021-07-20 05:54:00.077952	2021-07-20 05:54:00.077952	10	\N
30	27	\N	Entrada antigua del edificio (Asilo de Huérfanos y Expósitos que fue proyectado por el arquitecto Victor Rabú)	Portal Rabú	\N	\N	\N	2021-07-20 05:54:00.12088	2021-07-20 05:54:00.12088	6	\N
31	28	\N	\N	Agustín Cisa	\N	Formal	2021-11-01	2021-07-20 05:54:00.176851	2021-07-20 05:54:00.176851	10	\N
32	28	\N	\N	Enrique De Martini	\N	Formal	\N	2021-07-20 05:54:00.207099	2021-07-20 05:54:00.207099	2	\N
33	28	\N	\N	Félix De Medina	\N	Formal	\N	2021-07-20 05:54:00.271158	2021-07-20 05:54:00.271158	9	\N
34	28	\N	\N	Eduardo García de Zúñiga	\N	Formal	\N	2021-07-20 05:54:00.306278	2021-07-20 05:54:00.306278	9	\N
35	29	\N	\N	Nelson Landoni	\N	Formal	\N	2021-07-20 05:54:00.373559	2021-07-20 05:54:00.373559	10	\N
36	30	\N	\N	José Luis Massera	\N	Formal	\N	2021-07-20 05:54:00.419393	2021-07-20 05:54:00.419393	10	\N
37	28	\N	\N	Carlos Maggiolo	\N	Formal	\N	2021-07-20 05:54:00.486748	2021-07-20 05:54:00.486748	10	\N
38	28	\N	\N	Oscar  Maggiolo	\N	Formal	\N	2021-07-20 05:54:00.522451	2021-07-20 05:54:00.522451	10	\N
39	28	\N	\N	Ricardo Pérez Iribarren	\N	Formal	\N	2021-07-20 05:54:00.603041	2021-07-20 05:54:00.603041	4	\N
40	28	\N	\N	Juan Raymundo	\N	Formal	\N	2021-07-20 05:54:00.659646	2021-07-20 05:54:00.659646	9	\N
41	28	\N	\N	Julio Ricaldoni	\N	Formal	\N	2021-07-20 05:54:00.688633	2021-07-20 05:54:00.688633	10	\N
42	29	\N	\N	Primo Roda	\N	Formal	\N	2021-07-20 05:54:00.725324	2021-07-20 05:54:00.725324	10	\N
4	4	\N	\N	25 - 29 Salón de Primero	\N	Informal	\N	2021-07-20 05:53:58.820853	2021-07-21 11:52:39.969517	4	2
8	8	\N	Almacen	30 - El bunquer	\N	Informal	\N	2021-07-20 05:53:59.048553	2021-07-21 11:52:40.037529	10	3
9	9	\N	\N	33 - Salón Nuevo	\N	Informal	\N	2021-07-20 05:53:59.081287	2021-07-21 11:52:40.053843	\N	4
10	10	\N	Almacen	20 - El primer bunker	\N	Informal	\N	2021-07-20 05:53:59.115609	2021-07-21 11:52:40.070893	10	5
14	14	\N	Terraza	14 - La Terraza	\N	Informal	\N	2021-07-20 05:53:59.328732	2021-07-21 11:52:40.139452	10	6
16	16	\N	\N	11 - La Cantina	\N	Informal	\N	2021-07-20 05:53:59.416007	2021-07-21 11:52:40.177353	4	7
17	17	\N	\N	6- La salita docente	\N	Informal	\N	2021-07-20 05:53:59.454794	2021-07-21 11:52:40.197654	3	8
18	18	\N	\N	37 - El altillo	\N	Informal	\N	2021-07-20 05:53:59.484161	2021-07-21 11:52:40.223496	4	9
21	19	\N	Salón de clase	Bombonera	\N	\N	\N	2021-07-20 05:53:59.637499	2021-07-21 11:52:40.285845	10	11
43	31	\N	\N	Henry Tejera	\N	Formal	\N	2021-07-20 05:54:00.761567	2021-07-20 05:54:00.761567	10	\N
44	28	\N	\N	Nelson Ventura	\N	Formal	2021-11-01	2021-07-20 05:54:00.798845	2021-07-20 05:54:00.798845	10	\N
45	33	\N	Sede de Parque Batlle	Profesor Alberto Langlade	\N	Ley N° 16.086 	2021-10-01	2021-07-20 05:54:00.871418	2021-07-20 05:54:00.871418	0	\N
46	34	\N	Sede de Malvín Norte	Profesora Irene Preobrayensky	\N	FECHA 16 DE MAYO DE 2017, (Exp. 008100-001071-15) - Atento a lo propuesto por la Comisión Directiva del Instituto Superior de Educación Física en sesión de 28 de abril pasado (Res. N° 33) y a que se han cumplido los extremos previstos en la Ordenanza de Homenajes a Personas de 25/5/51, adherir al homenaje que el ISEF realizará a la ex docente de ése y de la Facultad de Medicina, fallecida el 19 de julio de 2015, Profesora Irene Preobrayensky Smolovik, a través de la colocación de una Placa recordatoria en la nueva Sede del Instituto ubicada en la zona de Malvín Norte, antecedentes que lucen en el distribuido N° 354.17. (17 en 17)  http://www.expe.edu.uy/expe/resoluci.nsf/005902af28c9e37f83257c5b00775129/edf06bfe6cd7e30603258114005b00ba?OpenDocument Repartido\nComisión Directiva Instituto Superior de Educación Física\nSesión Ordinaria del 28/04/2017\nHora 07:30\nRESOLUCIONES ADOPTADAS POR LA\nCOMISIÓN DIRECTIVA INSTITUTO SUPERIOR DE EDUCACIÓN FÍSICA\nEN SESION ORDINARIA DE 28 DE ABRIL DE 2017\nASISTEN A LA SESION LOS CONSEJEROS:\nDIRECTORA: Mag. Paola Dogliotti, ORDEN DOCENTE: Prof. Claudia Fernández, Lic. Gonzalo Pérez, ORDEN ESTUDIANTIL: Martina Pastorino, Martín Olivera, AFFUR - ISEF: María José Nieto, Actúa en Secretaría: Jefe de Sección de Secretaría de Comisión Directiva: Felicia Hernández, Director de Dpto.: Francisco Saldombide.        (Exp. Nº 008100-001071-15) - VISTO: la propuesta de homenaje efectuada en obrados respecto de la Profesora Irene PREOBRAYENSKY SMOLOVIK.\nRESULTANDO: I) Que oportunamente se propuso por esta Dirección homenajear a la precitada Docente en ocasión de la inauguración de la nueva Sede ubicada en Malvín Norte.\nII) Que según consta en obrados (fs. 6 y 7) Dirección General Jurídica efectuó determinadas observaciones respecto del presente trámite.\nIII) Que en tal sentido, las mismas consistieron en requerir una relación circunstanciada de méritos debidamente ampliada, debiéndose agregar los respaldos documentales pertinentes.\nCONSIDERANDO: I) Que conforme emerge de fojas 8 se procedió a la agregación de la relación circunstanciada requerida, ampliatoria de la obrante de fojas 1 a 5.\nII) Que asimismo, se agregaron los respaldos documentales correspondientes, los cuales dan cuenta de la dilatada trayectoria académica de la Prof. Irene Preobrayensky.\nATENTO: a lo dispuesto en la Ordenanza sobre homenajes a personas, de fecha 25/05/1951\nla Comisión Directiva del Instituto Superior de Educación Física resuelve: proponer al Consejo Directivo Central, la colocación de una placa en la Sede ISEF Malvín Norte, en homenaje a la Profesora Irene PREOBRAYENSKY SMOLOVIK.\nPase al Consejo Directivo Central. (5 en 5)FECHA 16 DE MAYO DE 2017, (Exp. 008100-001071-15) - Atento a lo propuesto por la Comisión Directiva del Instituto Superior de Educación Física en sesión de 28 de abril pasado (Res. N° 33) y a que se han cumplido los extremos previstos en la Ordenanza de Homenajes a Personas de 25/5/51, adherir al homenaje que el ISEF realizará a la ex docente de ése y de la Facultad de Medicina, fallecida el 19 de julio de 2015, Profesora Irene Preobrayensky Smolovik, a través de la colocación de una Placa recordatoria en la nueva Sede del Instituto ubicada en la zona de Malvín Norte, antecedentes que lucen en el distribuido N° 354.17. (17 en 17)  http://www.expe.edu.uy/expe/resoluci.nsf/005902af28c9e37f83257c5b00775129/edf06bfe6cd7e30603258114005b00ba?OpenDocument Repartido\nComisión Directiva Instituto Superior de Educación Física\nSesión Ordinaria del 28/04/2017\nHora 07:30\nRESOLUCIONES ADOPTADAS POR LA\nCOMISIÓN DIRECTIVA INSTITUTO SUPERIOR DE EDUCACIÓN FÍSICA\nEN SESION ORDINARIA DE 28 DE ABRIL DE 2017\nASISTEN A LA SESION LOS CONSEJEROS:\nDIRECTORA: Mag. Paola Dogliotti, ORDEN DOCENTE: Prof. Claudia Fernández, Lic. Gonzalo Pérez, ORDEN ESTUDIANTIL: Martina Pastorino, Martín Olivera, AFFUR - ISEF: María José Nieto, Actúa en Secretaría: Jefe de Sección de Secretaría de Comisión Directiva: Felicia Hernández, Director de Dpto.: Francisco Saldombide.        (Exp. Nº 008100-001071-15) - VISTO: la propuesta de homenaje efectuada en obrados respecto de la Profesora Irene PREOBRAYENSKY SMOLOVIK.\nRESULTANDO: I) Que oportunamente se propuso por esta Dirección homenajear a la precitada Docente en ocasión de la inauguración de la nueva Sede ubicada en Malvín Norte.\nII) Que según consta en obrados (fs. 6 y 7) Dirección General Jurídica efectuó determinadas observaciones respecto del presente trámite.\nIII) Que en tal sentido, las mismas consistieron en requerir una relación circunstanciada de méritos debidamente ampliada, debiéndose agregar los respaldos documentales pertinentes.\nCONSIDERANDO: I) Que conforme emerge de fojas 8 se procedió a la agregación de la relación circunstanciada requerida, ampliatoria de la obrante de fojas 1 a 5.\nII) Que asimismo, se agregaron los respaldos documentales correspondientes, los cuales dan cuenta de la dilatada trayectoria académica de la Prof. Irene Preobrayensky.\nATENTO: a lo dispuesto en la Ordenanza sobre homenajes a personas, de fecha 25/05/1951\nla Comisión Directiva del Instituto Superior de Educación Física resuelve: proponer al Consejo Directivo Central, la colocación de una placa en la Sede ISEF Malvín Norte, en homenaje a la Profesora Irene PREOBRAYENSKY SMOLOVIK.\nPase al Consejo Directivo Central. (5 en 5)	2021-03-01	2021-07-20 05:54:00.932006	2021-07-20 05:54:00.932006	0	\N
47	33	\N	Gimnasio central del edificio 	Profesora Marta Büsch 	\N	COMISIÓN DIRECTIVA DE ISEF\nACTA DE RESOLUCIÓN Nº 30\nSESIÓN ORDINARIA 23/12/11\nHORA 8:15\n\n\nSiendo las 8:15 horas asisten a la Sesión: Lic. Ma. Cecilia Ruegger, Prof. Daniel Leite, Prof. Claudia Fernández, Prof. Ma. Rosa Corral,  Prof. Raumar Rodríguez, Br. Diego Brea,  Br. Nicolás Da Silveira\nJefe de Sección de Secretaría de Comisión Directiva: María Julia Buzaki\n\n1.- Informes de Dirección\n\n1.1.- Acto conmemorativo en el marco de los festejos por los 100 de la de la promulgación de la ley de creación de la Comisión Nacional de Educación Física (CNEF): Tuvo lugar el lunes 19 de diciembre de 2011 a las 19.00 hs en el ISEF en Montevideo coincidiendo con la entrega de títulos y reconocimientos institucionales.\nEl acto se inauguró con palabras de autoridades de la UdelaR (Luis Calegari, Pro Rector de Enseñanza), de la DINADE (Ernesto Irurueta, Director), del ISEF (Daniel Leite, integrante de la Comisión Directiva) y Cecilia Ruegger (Directora de ISEF). Acompañaron el evento el Pro Rector de Gestión Dr. Ricardo Roca, autoridades y docentes vinculados con la historia y el presente de la Institución.\nLuego se hizo la entrega de un presente Institucional (Pin con el logo del ISEF) y una tarjeta a cada uno de los estudiantes de Tecnicatura y Licenciatura que se recibieron en 2011.\nA continuación se hicieron reconocimientos entregándoles una plaqueta a personas que han tenido una trayectoria importante dentro del ISEF a nivel docente y de funcionarios así como a personalidades que han sido referentes en los diversos procesos Institucionales de las últimas décadas. Se asignó el nombre de Marta Busch al Gimnasio de ISEF con su correspondiente placa  como había resuelto Comisión Directiva.\nEl Director de la DINADE en nombre del Ministro de Turismo y Deporte hizo entrega de una medalla conmemorativa de los festejos del centenario y una colección de libros para la biblioteca del ISEF.\nEn la misma oportunidad se inauguró una exposición en la que se conjugan imágenes fotográficas (seleccionadas y cedidas gentilmente por la DINADE) así como productos de investigación en formato poster. La misma pretendió abordar el transcurrir de la CNEF y su relación con el ISEF en diversos aspectos\nCOMISIÓN DIRECTIVA DE ISEF\nACTA DE RESOLUCIÓN Nº 30\nSESIÓN ORDINARIA 23/12/11\nHORA 8:15\n\n\nSiendo las 8:15 horas asisten a la Sesión: Lic. Ma. Cecilia Ruegger, Prof. Daniel Leite, Prof. Claudia Fernández, Prof. Ma. Rosa Corral,  Prof. Raumar Rodríguez, Br. Diego Brea,  Br. Nicolás Da Silveira\nJefe de Sección de Secretaría de Comisión Directiva: María Julia Buzaki\n\n1.- Informes de Dirección\n\n1.1.- Acto conmemorativo en el marco de los festejos por los 100 de la de la promulgación de la ley de creación de la Comisión Nacional de Educación Física (CNEF): Tuvo lugar el lunes 19 de diciembre de 2011 a las 19.00 hs en el ISEF en Montevideo coincidiendo con la entrega de títulos y reconocimientos institucionales.\nEl acto se inauguró con palabras de autoridades de la UdelaR (Luis Calegari, Pro Rector de Enseñanza), de la DINADE (Ernesto Irurueta, Director), del ISEF (Daniel Leite, integrante de la Comisión Directiva) y Cecilia Ruegger (Directora de ISEF). Acompañaron el evento el Pro Rector de Gestión Dr. Ricardo Roca, autoridades y docentes vinculados con la historia y el presente de la Institución.\nLuego se hizo la entrega de un presente Institucional (Pin con el logo del ISEF) y una tarjeta a cada uno de los estudiantes de Tecnicatura y Licenciatura que se recibieron en 2011.\nA continuación se hicieron reconocimientos entregándoles una plaqueta a personas que han tenido una trayectoria importante dentro del ISEF a nivel docente y de funcionarios así como a personalidades que han sido referentes en los diversos procesos Institucionales de las últimas décadas. Se asignó el nombre de Marta Busch al Gimnasio de ISEF con su correspondiente placa  como había resuelto Comisión Directiva.\nEl Director de la DINADE en nombre del Ministro de Turismo y Deporte hizo entrega de una medalla conmemorativa de los festejos del centenario y una colección de libros para la biblioteca del ISEF.\nEn la misma oportunidad se inauguró una exposición en la que se conjugan imágenes fotográficas (seleccionadas y cedidas gentilmente por la DINADE) así como productos de investigación en formato poster. La misma pretendió abordar el transcurrir de la CNEF y su relación con el ISEF en diversos aspectos\n	2021-07-19	2021-07-20 05:54:00.976448	2021-07-20 05:54:00.976448	10	\N
48	36	\N	Sede central	Tertulia	\N	\N	\N	2021-07-20 05:54:01.077012	2021-07-20 05:54:01.077012	2	\N
49	37	\N	Sede central	Maggiolo	\N	\N	\N	2021-07-20 05:54:01.111721	2021-07-20 05:54:01.111721	4	\N
50	38	\N	Sede central	Farabeuf	\N	\N	\N	2021-07-20 05:54:01.146403	2021-07-20 05:54:01.146403	4	\N
51	39	\N	Hall	Dra. Paulina Luisi	\N	\N	\N	2021-07-20 05:54:01.194522	2021-07-20 05:54:01.194522	3	\N
52	40	\N	Sede central	Prof.Ernesto Quintela	\N	\N	\N	2021-07-20 05:54:01.268112	2021-07-20 05:54:01.268112	0	\N
53	41	\N	Aula Magna	Juan Carlos Carrasco	\N	\N	\N	2021-07-20 05:54:01.315331	2021-07-20 05:54:01.315331	1	\N
54	41	\N	Departamento de Documentación y Biblioteca	José Luis Rebellato	\N	\N	\N	2021-07-20 05:54:01.343883	2021-07-20 05:54:01.343883	9	\N
55	42	\N	Sala de CDC	Sala Oscar J. Maggiolo	\N	Resolución del CDC	1986-04-14	2021-07-20 05:54:01.403962	2021-07-20 05:54:01.403962	2	\N
56	44	\N	\N	Sala Melita Hernández	\N	Formal 	2021-10-01	2021-07-20 05:54:01.474523	2021-07-20 05:54:01.474523	2	\N
1	1	\N	\N	La Escuela de Cine de Playa Hermosa	\N	Informal	\N	2021-07-20 05:50:07.71652	2021-07-21 11:52:39.906954	0	1
20	21	\N	Sala de Exposición	Sala de Exposición de Facultad de Artes	\N	\N	\N	2021-07-20 05:53:59.602257	2021-07-21 11:52:40.261954	10	10
\.


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('places_id_seq', 56, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY schema_migrations (version) FROM stdin;
20201111191550
20201111192011
20201111193423
20201112044350
20201112045735
20201112050355
20201112055723
20201112062009
20201113175453
20201115113207
20201115113211
20210626024103
20210626024106
20210719222907
20210719224948
20210719225105
20210720014848
20210720015425
20210721112811
20210805053144
20210814063357
\.


--
-- Data for Name: service_data; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY service_data (id, service_id, stype, man, created_at, updated_at, woman, year) FROM stdin;
1	3	0	300	2021-08-14 08:53:36.193248	2021-08-14 08:53:36.193248	10	\N
2	15	0	221	2021-08-14 09:53:21.328468	2021-08-14 09:53:21.328468	10	\N
3	16	0	344	2021-08-14 09:53:21.348636	2021-08-14 09:53:21.348636	10	\N
4	13	0	1	2021-08-14 09:53:21.379017	2021-08-14 09:53:21.379017	10	\N
5	17	0	157	2021-08-14 09:53:21.427357	2021-08-14 09:53:21.427357	10	\N
6	18	0	180	2021-08-14 09:53:21.454802	2021-08-14 09:53:21.454802	10	\N
7	4	0	1	2021-08-14 09:53:21.467501	2021-08-14 09:53:21.467501	10	\N
8	19	0	352	2021-08-14 09:53:21.484438	2021-08-14 09:53:21.484438	10	\N
9	20	0	896	2021-08-14 09:53:21.502809	2021-08-14 09:53:21.502809	10	\N
10	21	0	473	2021-08-14 09:53:21.523165	2021-08-14 09:53:21.523165	10	\N
11	22	0	242	2021-08-14 09:53:21.553653	2021-08-14 09:53:21.553653	10	\N
12	23	0	31	2021-08-14 09:53:21.577666	2021-08-14 09:53:21.577666	10	\N
13	24	0	573	2021-08-14 09:53:21.596838	2021-08-14 09:53:21.596838	10	\N
14	25	0	273	2021-08-14 09:53:21.615673	2021-08-14 09:53:21.615673	10	\N
15	26	0	668	2021-08-14 09:53:21.655309	2021-08-14 09:53:21.655309	10	\N
16	27	0	79	2021-08-14 09:53:21.679324	2021-08-14 09:53:21.679324	10	\N
17	28	0	508	2021-08-14 09:53:21.711282	2021-08-14 09:53:21.711282	10	\N
18	29	0	183	2021-08-14 09:53:21.752853	2021-08-14 09:53:21.752853	10	\N
19	30	0	69	2021-08-14 09:53:21.786262	2021-08-14 09:53:21.786262	10	\N
20	31	0	614	2021-08-14 09:53:21.807772	2021-08-14 09:53:21.807772	10	\N
21	32	0	901	2021-08-14 09:53:21.825663	2021-08-14 09:53:21.825663	10	\N
22	33	0	141	2021-08-14 09:53:21.871199	2021-08-14 09:53:21.871199	10	\N
23	34	0	70	2021-08-14 09:53:21.892582	2021-08-14 09:53:21.892582	10	\N
24	35	0	123	2021-08-14 09:53:21.910334	2021-08-14 09:53:21.910334	10	\N
25	36	0	2	2021-08-14 09:53:21.946888	2021-08-14 09:53:21.946888	10	\N
26	15	0	27	2021-08-14 09:57:29.554712	2021-08-14 09:57:29.554712	10	\N
27	18	0	28	2021-08-14 09:57:29.572603	2021-08-14 09:57:29.572603	10	\N
28	16	0	26	2021-08-14 09:57:29.581967	2021-08-14 09:57:29.581967	10	\N
29	3	0	107	2021-08-14 09:57:29.591672	2021-08-14 09:57:29.591672	10	\N
30	13	0	84	2021-08-14 09:57:29.600919	2021-08-14 09:57:29.600919	10	\N
31	17	0	11	2021-08-14 09:57:29.610939	2021-08-14 09:57:29.610939	10	\N
32	4	0	115	2021-08-14 09:57:29.632891	2021-08-14 09:57:29.632891	10	\N
33	19	0	100	2021-08-14 09:57:29.652369	2021-08-14 09:57:29.652369	10	\N
34	20	0	4	2021-08-14 09:57:29.662312	2021-08-14 09:57:29.662312	10	\N
35	21	0	51	2021-08-14 09:57:29.671255	2021-08-14 09:57:29.671255	10	\N
36	25	0	11	2021-08-14 09:57:29.681661	2021-08-14 09:57:29.681661	10	\N
37	26	0	161	2021-08-14 09:57:29.690548	2021-08-14 09:57:29.690548	10	\N
38	30	0	3	2021-08-14 09:57:29.699823	2021-08-14 09:57:29.699823	10	\N
39	31	0	1	2021-08-14 09:57:29.719734	2021-08-14 09:57:29.719734	10	\N
40	15	3	27	2021-08-14 10:00:17.277045	2021-08-14 10:00:17.277045	10	\N
41	18	3	28	2021-08-14 10:00:17.323705	2021-08-14 10:00:17.323705	10	\N
42	16	3	26	2021-08-14 10:00:17.33464	2021-08-14 10:00:17.33464	10	\N
43	3	3	107	2021-08-14 10:00:17.344524	2021-08-14 10:00:17.344524	10	\N
44	13	3	84	2021-08-14 10:00:17.353974	2021-08-14 10:00:17.353974	10	\N
45	17	3	11	2021-08-14 10:00:17.364475	2021-08-14 10:00:17.364475	10	\N
46	4	3	115	2021-08-14 10:00:17.373694	2021-08-14 10:00:17.373694	10	\N
47	19	3	100	2021-08-14 10:00:17.390755	2021-08-14 10:00:17.390755	10	\N
48	20	3	4	2021-08-14 10:00:17.404467	2021-08-14 10:00:17.404467	10	\N
49	21	3	51	2021-08-14 10:00:17.413631	2021-08-14 10:00:17.413631	10	\N
50	25	3	11	2021-08-14 10:00:17.423036	2021-08-14 10:00:17.423036	10	\N
51	26	3	161	2021-08-14 10:00:17.432131	2021-08-14 10:00:17.432131	10	\N
52	30	3	3	2021-08-14 10:00:17.442878	2021-08-14 10:00:17.442878	10	\N
53	31	3	1	2021-08-14 10:00:17.455783	2021-08-14 10:00:17.455783	10	\N
\.


--
-- Name: service_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('service_data_id_seq', 53, true);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY services (id, name, created_at, updated_at) FROM stdin;
1	Facultad de Bellas Artes - Playa Hermosa, Maldonado	2021-07-20 05:31:00.789253	2021-07-20 05:31:00.789253
2	Facultad de Bellas Artes	2021-07-20 05:53:59.492248	2021-07-20 05:53:59.492248
3	Facultad de Ciencias	2021-07-20 05:53:59.651982	2021-07-20 05:53:59.651982
4	Facultad de Ciencias Económicas y de Administración	2021-07-20 05:53:59.80679	2021-07-20 05:53:59.80679
5	Facultad de información y Comunicación	2021-07-20 05:54:00.034707	2021-07-20 05:54:00.034707
6	Facultad de ingeniería	2021-07-20 05:54:00.131888	2021-07-20 05:54:00.131888
7	INSTITUTO SUPERIOR DE EDUCACIÓN FÍSICA UDELAR	2021-07-20 05:54:00.837077	2021-07-20 05:54:00.837077
8	Edificio central Facultad de Medicina	2021-07-20 05:54:01.019239	2021-07-20 05:54:01.019239
9	Facultad de Psicología 	2021-07-20 05:54:01.280845	2021-07-20 05:54:01.280845
10	RECTORADO	2021-07-20 05:54:01.359003	2021-07-20 05:54:01.359003
11	INSTITUTO CONFUCIO	2021-07-20 05:54:01.416754	2021-07-20 05:54:01.416754
12	CENUR Noreste	2021-07-20 05:54:01.445167	2021-07-20 05:54:01.445167
13	Facultad de Ingeniería	2021-07-23 05:01:25.732957	2021-07-23 05:01:25.732957
14	Servicio Central de Bienestar Universitario	2021-07-23 05:08:31.876546	2021-07-23 05:08:31.876546
15	Agronomía	2021-08-14 09:53:21.2838	2021-08-14 09:53:21.2838
16	Arquitectura, Diseño y Urbanismo	2021-08-14 09:53:21.339091	2021-08-14 09:53:21.339091
17	Química	2021-08-14 09:53:21.402881	2021-08-14 09:53:21.402881
18	Veterinaria	2021-08-14 09:53:21.440627	2021-08-14 09:53:21.440627
19	Ciencias Sociales	2021-08-14 09:53:21.476609	2021-08-14 09:53:21.476609
20	Derecho	2021-08-14 09:53:21.493307	2021-08-14 09:53:21.493307
21	Humanidades y Ciencias de la Educación	2021-08-14 09:53:21.511331	2021-08-14 09:53:21.511331
22	Instituto Escuela Nacional de Bellas Artes	2021-08-14 09:53:21.533144	2021-08-14 09:53:21.533144
23	Escuela Universitaria de Música	2021-08-14 09:53:21.569204	2021-08-14 09:53:21.569204
24	Información y Comunicación	2021-08-14 09:53:21.5866	2021-08-14 09:53:21.5866
25	Enfermería	2021-08-14 09:53:21.606624	2021-08-14 09:53:21.606624
26	Medicina	2021-08-14 09:53:21.62596	2021-08-14 09:53:21.62596
27	Escuela de Parteras	2021-08-14 09:53:21.66988	2021-08-14 09:53:21.66988
28	Escuela Universitaria de Tecnología Médica	2021-08-14 09:53:21.690293	2021-08-14 09:53:21.690293
29	Escuela de Nutrición	2021-08-14 09:53:21.725832	2021-08-14 09:53:21.725832
30	Odontología	2021-08-14 09:53:21.775151	2021-08-14 09:53:21.775151
31	Psicología	2021-08-14 09:53:21.796978	2021-08-14 09:53:21.796978
32	Instituto Superior de Educación Física	2021-08-14 09:53:21.817611	2021-08-14 09:53:21.817611
33	Ciclo Inicial Optativo - Social	2021-08-14 09:53:21.848274	2021-08-14 09:53:21.848274
34	Ciclo Inicial Optativo - Ciencia y Tecnología	2021-08-14 09:53:21.884137	2021-08-14 09:53:21.884137
35	Ciclo Inicial Optativo - Salud	2021-08-14 09:53:21.902441	2021-08-14 09:53:21.902441
36	Ciclo en Biología - Bioquímica	2021-08-14 09:53:21.93212	2021-08-14 09:53:21.93212
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('services_id_seq', 36, true);


--
-- Data for Name: things; Type: TABLE DATA; Schema: public; Owner: ats
--

COPY things (id, name, ttype, description, created_at, updated_at) FROM stdin;
1	La Escuela de Cine de Playa Hermosa	0	Es el nombre que le dan lxs vecinxs	2021-07-20 05:50:07.689767	2021-07-20 05:50:07.689767
2	25 - 29 Salón de Primero	0	-	2021-07-20 05:53:58.793555	2021-07-20 05:53:58.793555
3	30 - El bunquer	0	Es el lugar donde se guardan los equipos de sonido, equipamiento...	2021-07-20 05:53:59.037943	2021-07-20 05:53:59.037943
4	33 - Salón Nuevo	0	En nombre se puso por ser el último salón que construyó	2021-07-20 05:53:59.070145	2021-07-20 05:53:59.070145
5	20 - El primer bunker	0	En este espacio se guardó en un primer momento los equipos de sonido y audiovisuales. Con la construcción del nuevo Bunker, este ha quedado como depósito	2021-07-20 05:53:59.1032	2021-07-20 05:53:59.1032
6	14 - La Terraza	0	-	2021-07-20 05:53:59.317506	2021-07-20 05:53:59.317506
7	11 - La Cantina	0	Es un espacio donde les estudinates dejan comida preparada por elles para vender y las personas compran de forma autogestionada. 	2021-07-20 05:53:59.407065	2021-07-20 05:53:59.407065
8	6- La salita docente	0	Esta sala es para el uso de les docentes de todos los cursos menos de 1º.	2021-07-20 05:53:59.442536	2021-07-20 05:53:59.442536
9	37 - El altillo	0	Su denominación de debe a su ubicación en el edificio, ya que está en la parte más alta. Se utiliza como salón para la trayectoria que incluyen videojuegos	2021-07-20 05:53:59.473806	2021-07-20 05:53:59.473806
10	  de Facultad de Artes	0		2021-07-20 05:53:59.591331	2021-07-20 05:53:59.591331
11	Bombonera	0	El nombre se debe a que el salón es vertical, pareciendo la estructura de un campo de fútbol. Fue el primer salón construido después de la dictadura. Se realizó en chapa y fueron los propios docentes los que lo levantaron.	2021-07-20 05:53:59.615071	2021-07-20 05:53:59.615071
12	Puente Chino	0		2021-07-23 05:08:31.785199	2021-07-23 05:08:31.785199
13	Becas del Instituto Confucio	0		2021-07-23 05:08:31.832274	2021-07-23 05:08:31.832274
\.


--
-- Name: things_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ats
--

SELECT pg_catalog.setval('things_id_seq', 13, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: import_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY import_logs
    ADD CONSTRAINT import_logs_pkey PRIMARY KEY (id);


--
-- Name: import_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY import_versions
    ADD CONSTRAINT import_versions_pkey PRIMARY KEY (id);


--
-- Name: intangibles_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY intangibles
    ADD CONSTRAINT intangibles_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: service_data_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY service_data
    ADD CONSTRAINT service_data_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: things_pkey; Type: CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY things
    ADD CONSTRAINT things_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: ats
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: ats
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: ats
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: ats
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: ats
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_buildings_services_on_service_id_and_building_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_buildings_services_on_service_id_and_building_id ON buildings_services USING btree (service_id, building_id);


--
-- Name: index_import_logs_on_import_version_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_import_logs_on_import_version_id ON import_logs USING btree (import_version_id);


--
-- Name: index_intangibles_on_thing_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_intangibles_on_thing_id ON intangibles USING btree (thing_id);


--
-- Name: index_intangibles_people_on_intangible_id_and_person_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_intangibles_people_on_intangible_id_and_person_id ON intangibles_people USING btree (intangible_id, person_id);


--
-- Name: index_intangibles_services_on_service_id_and_intangible_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_intangibles_services_on_service_id_and_intangible_id ON intangibles_services USING btree (service_id, intangible_id);


--
-- Name: index_people_places_on_place_id_and_person_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_people_places_on_place_id_and_person_id ON people_places USING btree (place_id, person_id);


--
-- Name: index_places_on_building_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_places_on_building_id ON places USING btree (building_id);


--
-- Name: index_places_on_thing_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_places_on_thing_id ON places USING btree (thing_id);


--
-- Name: index_service_data_on_service_id; Type: INDEX; Schema: public; Owner: ats
--

CREATE INDEX index_service_data_on_service_id ON service_data USING btree (service_id);


--
-- Name: fk_rails_6712438d5c; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY places
    ADD CONSTRAINT fk_rails_6712438d5c FOREIGN KEY (thing_id) REFERENCES things(id);


--
-- Name: fk_rails_8879706959; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY import_logs
    ADD CONSTRAINT fk_rails_8879706959 FOREIGN KEY (import_version_id) REFERENCES import_versions(id);


--
-- Name: fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES active_storage_blobs(id);


--
-- Name: fk_rails_aadefabdbf; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY places
    ADD CONSTRAINT fk_rails_aadefabdbf FOREIGN KEY (building_id) REFERENCES buildings(id);


--
-- Name: fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES active_storage_blobs(id);


--
-- Name: fk_rails_cd9f65f32d; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY service_data
    ADD CONSTRAINT fk_rails_cd9f65f32d FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fk_rails_f8ccb53ad4; Type: FK CONSTRAINT; Schema: public; Owner: ats
--

ALTER TABLE ONLY intangibles
    ADD CONSTRAINT fk_rails_f8ccb53ad4 FOREIGN KEY (thing_id) REFERENCES things(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
