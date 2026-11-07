--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    composition text NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    tail_length numeric(15,2) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    number_of_stars integer NOT NULL,
    size numeric(15,2) NOT NULL,
    mass numeric(20,2) NOT NULL,
    active boolean NOT NULL
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
    name character varying(40) NOT NULL,
    type character varying(30) NOT NULL,
    composition text NOT NULL,
    geological_activity text NOT NULL,
    size numeric(15,2) NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    type character varying(30) NOT NULL,
    atmosphere text NOT NULL,
    size numeric(15,2) NOT NULL,
    mass numeric(20,2) NOT NULL,
    habitable boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    spectral_type character varying(20) NOT NULL,
    temperatura integer NOT NULL,
    luminosidade numeric(15,2) NOT NULL,
    mass numeric(20,2) NOT NULL,
    has_planets boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Ice dust and rock', 75.32, 24.00, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Ice dust and rock', 2533.00, 50.00, true);
INSERT INTO public.comet VALUES (3, 'Encke', 'Ice and silicates', 3.30, 12.00, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 400000000, 105700.00, 1500000000000.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000000, 220000.00, 1230000000000.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000000, 60000.00, 50000000000.00, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 30000000, 14000.00, 10000000000.00, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 3000000, 7000.00, 7000000000.00, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Elliptical', 800000000, 49000.00, 800000000000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Rocky', 'Silicate', 'Inactive', 3474.00, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Rocky', 'Carbonaceous', 'Inactive', 22.00, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rocky', 'Carbonaceous', 'Inactive', 12.00, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic', 'Silicate', 'Extreme volcanism', 3643.00, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy', 'Ice and rock', 'Tectonic', 3122.00, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Icy', 'Ice and rock', 'Moderate', 5268.00, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Icy', 'Ice and rock', 'Low', 4821.00, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Icy', 'Ice and hydrocarbons', 'Moderate', 5150.00, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy', 'Water ice', 'Cryovolcanic', 504.00, true, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Rocky', 'Ice and rock', 'Inactive', 396.00, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Icy', 'Water ice', 'Low', 1528.00, true, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Icy', 'Water ice', 'Low', 1123.00, true, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Icy', 'Ice', 'Inactive', 1062.00, true, 6);
INSERT INTO public.moon VALUES (14, 'Moon PB1', 'Rocky', 'Basalt', 'Inactive', 2000.00, false, 7);
INSERT INTO public.moon VALUES (15, 'Moon PB2', 'Rocky', 'Basalt', 'Inactive', 1000.00, false, 7);
INSERT INTO public.moon VALUES (16, 'Moon PC1', 'Icy', 'Ice', 'Low', 1500.00, true, 8);
INSERT INTO public.moon VALUES (17, 'Moon AI1', 'Rocky', 'Silicate', 'Inactive', 2400.00, false, 9);
INSERT INTO public.moon VALUES (18, 'Moon AI2', 'Rocky', 'Silicate', 'Inactive', 1700.00, false, 9);
INSERT INTO public.moon VALUES (19, 'Moon TP1', 'Icy', 'Ice and rock', 'Moderate', 2800.00, true, 11);
INSERT INTO public.moon VALUES (20, 'Moon TS1', 'Icy', 'Methane ice', 'Low', 2300.00, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 'Very thin', 4879.00, 0.33, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 'CO2 rich', 12104.00, 4.87, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 'Nitrogen Oxygen', 12742.00, 5.97, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 'Thin CO2', 6779.00, 0.64, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 'Hydrogen Helium', 139820.00, 1898.00, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 'Hydrogen Helium', 116460.00, 568.00, false, 1);
INSERT INTO public.planet VALUES (7, 'Proxima b', 'Terrestrial', 'Unknown', 11400.00, 1.30, true, 2);
INSERT INTO public.planet VALUES (8, 'Proxima c', 'Super Earth', 'Unknown', 15000.00, 7.00, false, 2);
INSERT INTO public.planet VALUES (9, 'Andromeda I', 'Gas Giant', 'Hydrogen', 70000.00, 800.00, false, 4);
INSERT INTO public.planet VALUES (10, 'Andromeda II', 'Terrestrial', 'Nitrogen', 12000.00, 4.00, true, 4);
INSERT INTO public.planet VALUES (11, 'Triangulum Prime', 'Terrestrial', 'Nitrogen Oxygen', 13000.00, 5.50, true, 5);
INSERT INTO public.planet VALUES (12, 'Triangulum Secundus', 'Ice Giant', 'Methane', 50000.00, 120.00, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 5778, 1.00, 1.00, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M5.5V', 3042, 0.00, 0.12, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1V', 9940, 25.40, 2.10, false, 1);
INSERT INTO public.star VALUES (4, 'Andromeda Star A', 'F5V', 6500, 4.30, 1.40, true, 2);
INSERT INTO public.star VALUES (5, 'Triangulum Star B', 'K2V', 5000, 0.80, 0.90, true, 3);
INSERT INTO public.star VALUES (6, 'Sombrero Star C', 'G0V', 6000, 1.20, 1.10, false, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

