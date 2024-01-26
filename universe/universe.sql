--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: demo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.demo (
    name character varying(30) NOT NULL,
    demo_id integer NOT NULL,
    example integer
);


ALTER TABLE public.demo OWNER TO freecodecamp;

--
-- Name: demo_demo_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.demo_demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demo_demo_id_seq OWNER TO freecodecamp;

--
-- Name: demo_demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.demo_demo_id_seq OWNED BY public.demo.demo_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    age_in_millons_of_years numeric(8,2),
    distance_from_earth numeric(8,2),
    is_spherical boolean DEFAULT false NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    age_in_millons_years numeric(4,1),
    distance_from_earth numeric(4,1),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    age_in_millons_of_yeears numeric(8,2),
    distance_from_earth numeric(8,2),
    moons_count integer,
    has_life boolean DEFAULT false NOT NULL,
    star_id integer,
    width integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    age_in_millons_years numeric(8,2),
    distance_from_earth numeric(8,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: demo demo_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.demo ALTER COLUMN demo_id SET DEFAULT nextval('public.demo_demo_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: demo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.demo VALUES ('A', 1, NULL);
INSERT INTO public.demo VALUES ('B', 2, NULL);
INSERT INTO public.demo VALUES ('C', 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Es nuestra galaxia, donde se encuentra el Sistema Solar', 'Via Láctea', 13600.00, 0.02, true);
INSERT INTO public.galaxy VALUES (2, 'Es la galaxia espiral más cercana a la Via Láctea y la más grande del grupo local', 'Andrómeda', 14000.00, 2.50, true);
INSERT INTO public.galaxy VALUES (3, 'Otra galaxia del grupo local, es más pequeña que la Via Láctea y Andrómeda', 'Triángulo', 13000.00, 3.00, true);
INSERT INTO public.galaxy VALUES (4, 'Es una galaxia elíptica con un gran bulbo central y un prominente anillo de polvo que le da su nombre', 'Sombrero', 12000.00, 28.00, false);
INSERT INTO public.galaxy VALUES (5, 'Es una galaxia elíptica con una banda de polvo que la atraviesa', 'Centaurus A', 10000.00, 12.00, false);
INSERT INTO public.galaxy VALUES (6, 'Es una galaxia espiral con una mancha oscura en su centro que parece un ojo', 'Ojo Negro', 11000.00, 24.00, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Description 1', 'Name 1', 45.0, 150.0, 1);
INSERT INTO public.moon VALUES (2, 'Description 2', 'Name 2', 45.0, 150.0, 1);
INSERT INTO public.moon VALUES (3, 'Description 3', 'Name 3', 45.0, 150.0, 2);
INSERT INTO public.moon VALUES (4, 'Description 4', 'Name 4', 45.0, 150.0, 2);
INSERT INTO public.moon VALUES (5, 'Description 5', 'Name 5', 45.0, 150.0, 3);
INSERT INTO public.moon VALUES (6, 'Description 6', 'Name 6', 45.0, 150.0, 3);
INSERT INTO public.moon VALUES (7, 'Description 7', 'Name 7', 45.0, 150.0, 4);
INSERT INTO public.moon VALUES (8, 'Description 8', 'Name 8', 45.0, 150.0, 4);
INSERT INTO public.moon VALUES (9, 'Description 9', 'Name 9', 45.0, 150.0, 5);
INSERT INTO public.moon VALUES (10, 'Description 10', 'Name 10', 45.0, 150.0, 5);
INSERT INTO public.moon VALUES (11, 'Description 11', 'Name 11', 45.0, 150.0, 6);
INSERT INTO public.moon VALUES (12, 'Description 12', 'Name 12', 45.0, 150.0, 6);
INSERT INTO public.moon VALUES (13, 'Description 13', 'Name 13', 45.0, 150.0, 7);
INSERT INTO public.moon VALUES (14, 'Description 14', 'Name 14', 45.0, 150.0, 7);
INSERT INTO public.moon VALUES (15, 'Description 15', 'Name 15', 45.0, 150.0, 8);
INSERT INTO public.moon VALUES (16, 'Description 16', 'Name 16', 45.0, 150.0, 8);
INSERT INTO public.moon VALUES (17, 'Description 17', 'Name 17', 45.0, 150.0, 9);
INSERT INTO public.moon VALUES (18, 'Description 18', 'Name 18', 45.0, 150.0, 9);
INSERT INTO public.moon VALUES (19, 'Description 19', 'Name 19', 45.0, 150.0, 10);
INSERT INTO public.moon VALUES (20, 'Description 20', 'Name 20', 45.0, 150.0, 10);
INSERT INTO public.moon VALUES (21, 'Description 21', 'Name 21', 45.0, 150.0, 11);
INSERT INTO public.moon VALUES (22, 'Description 22', 'Name 22', 45.0, 150.0, 11);
INSERT INTO public.moon VALUES (23, 'Description 23', 'Name 23', 45.0, 150.0, 12);
INSERT INTO public.moon VALUES (24, 'Description 24', 'Name 24', 45.0, 150.0, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Description 1', 'Name 1', 49000.00, 150.00, 2, false, 1, 4567);
INSERT INTO public.planet VALUES (2, 'Description 2', 'Name 2', 49000.00, 150.00, 2, false, 1, 4567);
INSERT INTO public.planet VALUES (3, 'Description 3', 'Name 3', 49000.00, 150.00, 2, false, 2, 4567);
INSERT INTO public.planet VALUES (4, 'Description 4', 'Name 4', 49000.00, 150.00, 2, false, 2, 4567);
INSERT INTO public.planet VALUES (5, 'Description 5', 'Name 5', 49000.00, 150.00, 2, false, 3, 4567);
INSERT INTO public.planet VALUES (6, 'Description 6', 'Name 6', 49000.00, 150.00, 2, false, 3, 4567);
INSERT INTO public.planet VALUES (7, 'Description 7', 'Name 7', 49000.00, 150.00, 2, false, 4, 4567);
INSERT INTO public.planet VALUES (8, 'Description 8', 'Name 8', 49000.00, 150.00, 2, false, 4, 4567);
INSERT INTO public.planet VALUES (9, 'Description 9', 'Name 9', 49000.00, 150.00, 2, false, 5, 4567);
INSERT INTO public.planet VALUES (10, 'Description 10', 'Name 10', 49000.00, 150.00, 2, false, 5, 4567);
INSERT INTO public.planet VALUES (11, 'Description 11', 'Name 11', 49000.00, 150.00, 2, false, 6, 4567);
INSERT INTO public.planet VALUES (12, 'Description 12', 'Name 12', 49000.00, 150.00, 2, false, 6, 4567);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Es la estrella que ilumina y da calor a nuestro planeta', 'Sol', 4600.00, 150.00, 1);
INSERT INTO public.star VALUES (2, 'Es la estrella  más brillante del sistema estelar triple Alfa Centauri', 'Rigel Kentaurus A', 6000.00, 4300.00, 2);
INSERT INTO public.star VALUES (3, 'Es una estrella ligeramente máss grande y caliente que el Sol', 'UGCA 86', 4000.00, 2900.00, 3);
INSERT INTO public.star VALUES (4, 'Es una estrella un poco más pequeña y fría que el Sol', 'HD 121370', 9000.00, 2850.00, 4);
INSERT INTO public.star VALUES (5, 'Es una estrella un poco más grande y caliente que el Sol', 'HD 130948 A', 5000.00, 5870.00, 5);
INSERT INTO public.star VALUES (6, 'Es una estrella mucho más grande y caliente que el Sol', 'HD 100546', 10000.00, 3350.00, 6);


--
-- Name: demo_demo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.demo_demo_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: demo demo_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_name_key UNIQUE (name);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (demo_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

