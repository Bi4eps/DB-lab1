--
-- PostgreSQL database dump
--

\restrict XqpccpctRmNYd92E3xqWoxOAWoPh61nwcODB9RrlzIeBenX8ZfAHeuG9GXL4fqA

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-01-05 19:22:31

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
-- TOC entry 218 (class 1259 OID 33734)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    bio text,
    style character varying(50)
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33733)
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artists_artist_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_artist_id_seq OWNED BY public.artists.artist_id;


--
-- TOC entry 222 (class 1259 OID 33752)
-- Name: artworks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artworks (
    artwork_id integer NOT NULL,
    title character varying(150) NOT NULL,
    price numeric(10,2) NOT NULL,
    creation_date date,
    artist_id integer NOT NULL,
    CONSTRAINT artworks_price_check CHECK ((price > (0)::numeric))
);


ALTER TABLE public.artworks OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33751)
-- Name: artworks_artwork_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artworks_artwork_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artworks_artwork_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 221
-- Name: artworks_artwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artworks_artwork_id_seq OWNED BY public.artworks.artwork_id;


--
-- TOC entry 223 (class 1259 OID 33764)
-- Name: exhibition_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exhibition_items (
    artwork_id integer NOT NULL,
    exhibition_id integer NOT NULL,
    booth_number integer NOT NULL
);


ALTER TABLE public.exhibition_items OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33743)
-- Name: exhibitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exhibitions (
    exhibition_id integer NOT NULL,
    name character varying(150) NOT NULL,
    location character varying(100) NOT NULL,
    start_date date NOT NULL
);


ALTER TABLE public.exhibitions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33742)
-- Name: exhibitions_exhibition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exhibitions_exhibition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exhibitions_exhibition_id_seq OWNER TO postgres;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 219
-- Name: exhibitions_exhibition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exhibitions_exhibition_id_seq OWNED BY public.exhibitions.exhibition_id;


--
-- TOC entry 4756 (class 2604 OID 33737)
-- Name: artists artist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN artist_id SET DEFAULT nextval('public.artists_artist_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 33755)
-- Name: artworks artwork_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artworks ALTER COLUMN artwork_id SET DEFAULT nextval('public.artworks_artwork_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 33746)
-- Name: exhibitions exhibition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exhibitions ALTER COLUMN exhibition_id SET DEFAULT nextval('public.exhibitions_exhibition_id_seq'::regclass);


--
-- TOC entry 4919 (class 0 OID 33734)
-- Dependencies: 218
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (artist_id, full_name, bio, style) FROM stdin;
1	Вінсент ван Гог	Нідерландський художник-постімпресіоніст.	Постімпресіонізм
2	Клод Моне	Французький живописець, один із засновників імпресіонізму.	Імпресіонізм
3	Сальвадор Далі	Іспанський художник, один із найвідоміших сюрреалістів.	Сюрреалізм
4	Марія Примаченко	Українська народна художниця, представниця "наївного мистецтва".	Наївне мистецтво
\.


--
-- TOC entry 4923 (class 0 OID 33752)
-- Dependencies: 222
-- Data for Name: artworks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artworks (artwork_id, title, price, creation_date, artist_id) FROM stdin;
1	Зоряна ніч	150000.00	1889-06-01	1
2	Соняшники	120000.00	1888-08-01	1
3	Враження, схід сонця	200000.00	1872-11-13	2
4	Сталість пам'яті	350000.00	1931-01-01	3
5	Звір гуляє	50000.00	1970-05-20	4
\.


--
-- TOC entry 4924 (class 0 OID 33764)
-- Dependencies: 223
-- Data for Name: exhibition_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exhibition_items (artwork_id, exhibition_id, booth_number) FROM stdin;
1	2	101
2	2	102
3	2	105
4	3	12
5	1	5
\.


--
-- TOC entry 4921 (class 0 OID 33743)
-- Dependencies: 220
-- Data for Name: exhibitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exhibitions (exhibition_id, name, location, start_date) FROM stdin;
1	Сучасний Арт Простір	Київ, Мистецький Арсенал	2025-10-01
2	Світ Імпресіонізму	Париж, Музей Орсе	2025-11-15
3	Магія Сюрреалізму	Барселона, Центр мистецтв	2025-12-05
\.


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_artist_id_seq', 4, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 221
-- Name: artworks_artwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artworks_artwork_id_seq', 5, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 219
-- Name: exhibitions_exhibition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exhibitions_exhibition_id_seq', 3, true);


--
-- TOC entry 4761 (class 2606 OID 33741)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 4767 (class 2606 OID 33758)
-- Name: artworks artworks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artworks
    ADD CONSTRAINT artworks_pkey PRIMARY KEY (artwork_id);


--
-- TOC entry 4769 (class 2606 OID 33768)
-- Name: exhibition_items exhibition_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exhibition_items
    ADD CONSTRAINT exhibition_items_pkey PRIMARY KEY (artwork_id, exhibition_id);


--
-- TOC entry 4763 (class 2606 OID 33750)
-- Name: exhibitions exhibitions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exhibitions
    ADD CONSTRAINT exhibitions_name_key UNIQUE (name);


--
-- TOC entry 4765 (class 2606 OID 33748)
-- Name: exhibitions exhibitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exhibitions
    ADD CONSTRAINT exhibitions_pkey PRIMARY KEY (exhibition_id);


--
-- TOC entry 4770 (class 2606 OID 33759)
-- Name: artworks fk_artist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artworks
    ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id) ON DELETE CASCADE;


--
-- TOC entry 4771 (class 2606 OID 33769)
-- Name: exhibition_items fk_artwork; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exhibition_items
    ADD CONSTRAINT fk_artwork FOREIGN KEY (artwork_id) REFERENCES public.artworks(artwork_id) ON DELETE CASCADE;


--
-- TOC entry 4772 (class 2606 OID 33774)
-- Name: exhibition_items fk_exhibition; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exhibition_items
    ADD CONSTRAINT fk_exhibition FOREIGN KEY (exhibition_id) REFERENCES public.exhibitions(exhibition_id) ON DELETE CASCADE;


-- Completed on 2026-01-05 19:22:31

--
-- PostgreSQL database dump complete
--

\unrestrict XqpccpctRmNYd92E3xqWoxOAWoPh61nwcODB9RrlzIeBenX8ZfAHeuG9GXL4fqA

