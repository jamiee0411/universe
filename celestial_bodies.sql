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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    description text NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40),
    word_count integer
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_id_seq OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    galaxy_type character varying(40),
    number_of_stars_per_million numeric,
    age_in_millions_of_years numeric,
    distance_from_earth_in_millions_of_ly numeric NOT NULL
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
    name character varying(20),
    color character varying(20),
    is_spherical boolean,
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
    name character varying(40),
    is_spherical boolean,
    has_life boolean,
    number_of_moons integer NOT NULL,
    star_id integer
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
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40),
    distance_from_earth_in_millions_of_ly numeric NOT NULL,
    star_type character varying(40)
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'A face-on unbarred spiral galaxy with a very prominent ring structure located in the constellation Centaurus. The galaxy is a member of the Centaurus Cluster.', 2, 'Backward_description', 25);
INSERT INTO public.description VALUES (2, 'NCG 224 or M31. Is a great spiral galaxy in the constellation Andromeda, the nearest large galaxy.', 1, 'Andromeda_description', 17);
INSERT INTO public.description VALUES (3, 'NGC 4565. Also known as the Needle Galaxy. This is an edge-on spiral galaxy in the constellation Coma Berneices.', 3, 'Caldwell 38_description', 19);
INSERT INTO public.description VALUES (4, 'A non-typical galaxy named after Arthur Hoag, who discovered it in 1950 and identified it as either a planetary nebula or a peculiar galaxy.', 4, 'Hoag''s Object_description', 24);
INSERT INTO public.description VALUES (5, 'NCG 3031 or Bode''s galaxy. This is a grand design spiral galaxy in the constellation Ursa Major.', 5, 'Messier 81_description', 17);
INSERT INTO public.description VALUES (6, 'NGC 5128 or Caldwell 77. This is a Hubble type galaxy in the constellation Centaurus. It was discovered by Scottish astronomer James Dunlop in 1826.', 6, 'Centaurus A_description', 25);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Backward', 'Unbarred Spiral', NULL, NULL, 200);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Barred Spiral', 1000, 10000, 2.72);
INSERT INTO public.galaxy VALUES (3, 'Caldwell 38', 'Edge-on Spiral', 1000, 13240, 38.49);
INSERT INTO public.galaxy VALUES (4, 'Hoag''s Object', 'Ring', 8000, 12.75, 612.8);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Grand design Spiral', 250000, 13310, 11.47);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Hubble', NULL, 13270, 13050);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Hestia', 'Blue', true, 1);
INSERT INTO public.moon VALUES (2, 'Atlas', 'Red', true, 2);
INSERT INTO public.moon VALUES (3, 'Adrastea', 'Yellow', true, 3);
INSERT INTO public.moon VALUES (4, 'Himalia', 'Green', true, 4);
INSERT INTO public.moon VALUES (5, 'Maia', 'Pink', true, 5);
INSERT INTO public.moon VALUES (6, 'Hera', 'Purple', true, 6);
INSERT INTO public.moon VALUES (7, 'Hercules', 'Silver', false, 7);
INSERT INTO public.moon VALUES (8, 'Danae', 'Gold', false, 8);
INSERT INTO public.moon VALUES (9, 'Elara', 'Orange', false, 9);
INSERT INTO public.moon VALUES (10, 'Poseidon', 'Violet', false, 10);
INSERT INTO public.moon VALUES (11, 'Persephone', 'Gray', true, 11);
INSERT INTO public.moon VALUES (12, 'Helen', 'Blue', true, 12);
INSERT INTO public.moon VALUES (13, 'Pasiphae', 'Red', true, 13);
INSERT INTO public.moon VALUES (14, 'Alcemene', 'Yellow', true, 14);
INSERT INTO public.moon VALUES (15, 'Hades', 'Green', true, 15);
INSERT INTO public.moon VALUES (16, 'Cerberus', 'Pink', false, 16);
INSERT INTO public.moon VALUES (17, 'Ida', 'Purple', false, 17);
INSERT INTO public.moon VALUES (18, 'Sinope', 'Silver', false, 18);
INSERT INTO public.moon VALUES (19, 'Leto', 'Gold', false, 19);
INSERT INTO public.moon VALUES (20, 'Demeter', 'Orange', false, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Blue Planet', true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Vogsphere', true, true, 1, 3);
INSERT INTO public.planet VALUES (3, 'Terra Prime', false, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Ego', false, true, 1, 4);
INSERT INTO public.planet VALUES (5, 'Krypton', true, false, 4, 1);
INSERT INTO public.planet VALUES (6, 'Worlorn', true, true, 1, 6);
INSERT INTO public.planet VALUES (7, 'Cybertron', false, true, 1, 6);
INSERT INTO public.planet VALUES (8, 'Caprica', true, true, 2, 6);
INSERT INTO public.planet VALUES (9, 'Gallifrey', true, false, 2, 1);
INSERT INTO public.planet VALUES (10, 'Marz', true, true, 12, 4);
INSERT INTO public.planet VALUES (11, 'Amazonia', false, true, 1, 7);
INSERT INTO public.planet VALUES (12, 'Bogad', true, true, 9, 2);
INSERT INTO public.planet VALUES (13, 'Chapek', false, true, 2, 7);
INSERT INTO public.planet VALUES (14, 'Arrakis', true, true, 4, 2);
INSERT INTO public.planet VALUES (15, 'Coruscant', false, false, 6, 3);
INSERT INTO public.planet VALUES (16, 'Tatooine', true, true, 2, 3);
INSERT INTO public.planet VALUES (17, 'Hoth', true, true, 8, 4);
INSERT INTO public.planet VALUES (18, 'Naboo', true, true, 1, 3);
INSERT INTO public.planet VALUES (19, 'Xandar', false, false, 7, 2);
INSERT INTO public.planet VALUES (20, 'Skaro', true, false, 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, '51 Andromedae', 0.01771, 'K-type Giant');
INSERT INTO public.star VALUES (6, 3, 'Alpha Centauri', 0.000004367, 'Spectral G2');
INSERT INTO public.star VALUES (6, 4, 'Beta Centauri', 0.0003914, 'B-type');
INSERT INTO public.star VALUES (4, 6, 'HIP 7896', 0.0006725, 'Subgiant');
INSERT INTO public.star VALUES (1, 7, 'Delta Andromedae', 0.00010132, 'Triple');
INSERT INTO public.star VALUES (1, 1, 'Mirach', 0.000199, 'Red Giant');


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: description description_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_id_key UNIQUE (description_id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: description description_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
