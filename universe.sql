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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_in_lightyears numeric(12,2) NOT NULL,
    is_spherical text
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
    name character varying(50) NOT NULL,
    description character varying(50),
    planet_id integer NOT NULL,
    is_spherical text
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_in_lightyears numeric(12,2),
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
    name character varying(50) NOT NULL,
    is_spherical boolean,
    galaxy_id integer NOT NULL,
    description text
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
-- Name: subsatel; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.subsatel (
    subsatel_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(50),
    moon_id integer NOT NULL,
    is_spherical text
);


ALTER TABLE public.subsatel OWNER TO freecodecamp;

--
-- Name: subsatel_subsatel_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.subsatel_subsatel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subsatel_subsatel_id_seq OWNER TO freecodecamp;

--
-- Name: subsatel_subsatel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.subsatel_subsatel_id_seq OWNED BY public.subsatel.subsatel_id;


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
-- Name: subsatel subsatel_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatel ALTER COLUMN subsatel_id SET DEFAULT nextval('public.subsatel_subsatel_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0.00, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 10000, 2500000.00, NULL);
INSERT INTO public.galaxy VALUES (3, 'Traingulum Galaxy (M33)', 10000, 2900000.00, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy (M51)', 10000, 31000000.00, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy (M101)', 10000, 21000000.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy (M104)', 10000, 31000000.00, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Moon', 'Earth''s only natural satellite; heavily cratered', 7, NULL);
INSERT INTO public.moon VALUES (12, 'Phobos', 'Larger of Mars''s two moons; heavily cratered', 9, NULL);
INSERT INTO public.moon VALUES (13, 'Deimos', 'Smaller of Mars''s two moons; potato-shaped', 8, NULL);
INSERT INTO public.moon VALUES (14, 'Hypothetical Moon A', 'Assumed small rocky moon of Proxima Ce', 10, NULL);
INSERT INTO public.moon VALUES (15, 'Hypothetical Moon B', 'Assumed icy moon of Kepler-452b', 11, NULL);
INSERT INTO public.moon VALUES (16, 'Hypothetical Moon C', 'Assumed icy moon of Kepler-494a', 12, NULL);
INSERT INTO public.moon VALUES (17, 'Moon', 'Earth''s only natural satellite, heavily cratered', 11, NULL);
INSERT INTO public.moon VALUES (18, 'Phobos', 'Larger irregular moon of Mars, heavily cratered', 13, NULL);
INSERT INTO public.moon VALUES (19, 'Deimos', 'Smaller smooth moon of Mars, potato-shaped', 13, NULL);
INSERT INTO public.moon VALUES (20, 'Io', 'Most volcanically active body in Solar System', 14, NULL);
INSERT INTO public.moon VALUES (21, 'Europa', 'Icy moon with subsurface ocean, smooth surface', 14, NULL);
INSERT INTO public.moon VALUES (22, 'Ganymede', 'Largest moon in Solar System, has magnetic field', 14, NULL);
INSERT INTO public.moon VALUES (23, 'Callisto', 'Heavily cratered icy moon, very old surface', 14, NULL);
INSERT INTO public.moon VALUES (24, 'Titan', 'Thick atmosphere, lakes of liquid methane', 12, NULL);
INSERT INTO public.moon VALUES (25, 'Enceladus', 'Icy moon with active water plumes', 11, NULL);
INSERT INTO public.moon VALUES (26, 'Triton', 'Retrograde orbit, nitrogen geysers, captured', 16, NULL);
INSERT INTO public.moon VALUES (27, 'Hypothetical A', 'Assumed small moon of Gliese 12 b (unconfirmed)', 15, NULL);
INSERT INTO public.moon VALUES (28, 'Hypothetical B', 'Assumed rocky moon of Kepler-186 f (unconfirmed)', 15, NULL);
INSERT INTO public.moon VALUES (29, 'Hypothetical C', 'Assumed icy moon of TRAPPIST-1 d (unconfirmed)', 16, NULL);
INSERT INTO public.moon VALUES (30, 'Hypothetical D', 'Assumed small moon of LHS 1140 b (unconfirmed)', 15, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'Earth', 'Terrestrial planet with liquid water oceans and diverse biosphere', true, 4600, 0.00, 1);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 'Rocky exoplanet in habitable zone of red dwarf', false, 4850, 4.24, 2);
INSERT INTO public.planet VALUES (9, 'Mars', 'Terrestrial planet with thin atmosphere and evidence of past water', false, 4600, 0.00, 3);
INSERT INTO public.planet VALUES (10, 'Venus', 'Terrestrial planet with thick CO₂ atmosphere and extreme surface heat', false, 4600, 0.00, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'Super-Earth in habitable zone of Sun-like star', false, 6000, 1800.00, 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Rocky planet in habitable zone of ultra-cool dwarf', false, 7600, 40.66, 6);
INSERT INTO public.planet VALUES (13, 'Jupiter', 'Gas giant with big atmosphere', false, 4600, 0.00, 1);
INSERT INTO public.planet VALUES (14, 'Gliese 12b', 'Earth sized temperate exploplanet', false, 7000, 40.00, 3);
INSERT INTO public.planet VALUES (15, 'Kepler-186f', 'Rocky super earth in habitable zone', false, 4000, 490.00, 4);
INSERT INTO public.planet VALUES (16, 'Barnards', 'SubEarth mass rocky planet', false, 1000, 6.00, 2);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1 d', 'Rocky terrestrial planet', false, 7600, 40.66, 5);
INSERT INTO public.planet VALUES (18, 'LHS 1140', 'Dense super-Earth', false, 5000, 49.00, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, 2, NULL);
INSERT INTO public.star VALUES (3, 'Sirius A', true, 3, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', true, 4, NULL);
INSERT INTO public.star VALUES (5, 'Betelgeuse', true, 5, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', true, 6, NULL);


--
-- Data for Name: subsatel; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.subsatel VALUES (1, 'Sub-Titan Alpha', 'Titan''s large Hill sphere', 14, NULL);
INSERT INTO public.subsatel VALUES (2, 'Callisto Companion', 'Another sphere', 15, NULL);
INSERT INTO public.subsatel VALUES (3, 'Iapetus Echo', 'Another sphere but spherical, dont take it serious', 16, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 34, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: subsatel_subsatel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.subsatel_subsatel_id_seq', 3, true);


--
-- Name: galaxy galaxy_is_spherical_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_is_spherical_key UNIQUE (is_spherical);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_is_spherical_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_is_spherical_key UNIQUE (is_spherical);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: subsatel subsatel_is_spherical_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatel
    ADD CONSTRAINT subsatel_is_spherical_key UNIQUE (is_spherical);


--
-- Name: subsatel subsatel_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatel
    ADD CONSTRAINT subsatel_pkey PRIMARY KEY (subsatel_id);


--
-- Name: planet unique_subsatel_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_subsatel_name UNIQUE (name);


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
-- Name: subsatel subsatel_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.subsatel
    ADD CONSTRAINT subsatel_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- PostgreSQL database dump complete
--

