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
    name character varying(30) NOT NULL,
    age_millions_of_year integer,
    distance_from_earth numeric(10,2),
    galaxy_type character varying(30)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    radius_in_km integer,
    orbital_period_days numeric(10,2)
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
    name character varying(30) NOT NULL,
    description text,
    star_id integer,
    planet_type character varying(30),
    has_life boolean,
    radius_in_km integer
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(6),
    mass_solar_masses numeric(10,2),
    is_spherical boolean
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via lactea', 13600, 0.00, 'Espiral');
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 10000, 2500000.00, 'Espiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000000.00, 'Espiral');
INSERT INTO public.galaxy VALUES (4, 'Gran Nube de Magallanes', 13000, 163000.00, 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Galaxia del Sombrero', 13200, 29300000.00, 'Elíptica');
INSERT INTO public.galaxy VALUES (6, 'Galaxia Remolino', 400, 23000000.00, 'Espiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 1737, 27.30);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, 11, 0.30);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, 1.26);
INSERT INTO public.moon VALUES (4, 'Ío', 3, 1821, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 3, 2634, 7.15);
INSERT INTO public.moon VALUES (7, 'Calisto', 3, 2410, 16.70);
INSERT INTO public.moon VALUES (8, 'Alpheratz Moon I', 4, 1200, 5.20);
INSERT INTO public.moon VALUES (9, 'M33-Moon', 5, 800, 12.40);
INSERT INTO public.moon VALUES (10, 'R136-Moon', 7, 1500, 8.10);
INSERT INTO public.moon VALUES (11, 'Sombra Luna', 9, 950, 4.60);
INSERT INTO public.moon VALUES (12, 'Whirl-Moon', 11, 1100, 6.00);
INSERT INTO public.moon VALUES (13, 'Titán', 3, 2575, 15.90);
INSERT INTO public.moon VALUES (14, 'Encélado', 3, 252, 1.37);
INSERT INTO public.moon VALUES (15, 'Mimas', 3, 198, 0.94);
INSERT INTO public.moon VALUES (16, 'Titania', 16, 788, 8.70);
INSERT INTO public.moon VALUES (17, 'Oberón', 16, 761, 13.50);
INSERT INTO public.moon VALUES (18, 'Tritón', 17, 1353, 5.88);
INSERT INTO public.moon VALUES (19, 'Proteo', 17, 210, 1.12);
INSERT INTO public.moon VALUES (20, 'Nereida', 17, 170, 360.10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 'Planeta hogar de la humanidad con abundante agua líquida.', 1, 'Rocoso', true, 6371);
INSERT INTO public.planet VALUES (2, 'Marte', 'El planeta rojo, frío y desértico.', 1, 'Rocoso', false, 3389);
INSERT INTO public.planet VALUES (3, 'Júpiter', 'El planeta más grande del sistema solar, un gigante gaseoso.', 1, 'Gaseoso', false, 69911);
INSERT INTO public.planet VALUES (4, 'Alpheratz b', 'Exoplaneta gigante gaseoso orbitando Alpheratz.', 2, 'Gaseoso', false, 52000);
INSERT INTO public.planet VALUES (5, 'M33-b', 'Mundo rocoso en la galaxia Triangulum.', 3, 'Rocoso', false, 4500);
INSERT INTO public.planet VALUES (6, 'M33-c', 'Gigante gaseoso masivo en Triangulum.', 3, 'Gaseoso', false, 61000);
INSERT INTO public.planet VALUES (7, 'R136-1', 'Planeta rocoso cercano a una estrella masiva.', 4, 'Rocoso', false, 8900);
INSERT INTO public.planet VALUES (8, 'R136-2', 'Gigante gaseoso con fuertes vientos estelares.', 4, 'Gaseoso', false, 78000);
INSERT INTO public.planet VALUES (9, 'Sombrero Prime', 'Planeta rocoso en la galaxia del Sombrero.', 5, 'Rocoso', false, 5900);
INSERT INTO public.planet VALUES (10, 'Sombrero Secundus', 'Gigante helado en las afueras de Sombrero.', 5, 'Gigante helado', false, 25000);
INSERT INTO public.planet VALUES (11, 'Whirlpool I', 'Mundo rocoso de la galaxia Remolino.', 6, 'Rocoso', false, 7100);
INSERT INTO public.planet VALUES (12, 'Whirlpool II', 'Gigante gaseoso en la galaxia Remolino.', 6, 'Gaseoso', false, 43000);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 'Exoplaneta en la zona habitable de su estrella.', 1, 'Rocoso', false, 14000);
INSERT INTO public.planet VALUES (14, 'Gliese 581g', 'Mundo extrasolar candidato a albergar condiciones aptas.', 1, 'Rocoso', false, 9500);
INSERT INTO public.planet VALUES (15, 'Saturno', 'Gigante gaseoso famoso por sus impresionantes anillos.', 1, 'Gaseoso', false, 58232);
INSERT INTO public.planet VALUES (16, 'Urano', 'Gigante helado que rota completamente de lado.', 1, 'Gigante helado', false, 25362);
INSERT INTO public.planet VALUES (17, 'Neptuno', 'Planeta azul profundo con vientos extremadamente violentos.', 1, 'Gigante helado', false, 24622);
INSERT INTO public.planet VALUES (18, 'Venus', 'Planeta rocoso con un efecto invernadero desbocado.', 1, 'Rocoso', false, 6051);
INSERT INTO public.planet VALUES (19, 'Mercurio', 'El planeta más cercano al Sol, cubierto de cráteres.', 1, 'Rocoso', false, 2439);
INSERT INTO public.planet VALUES (20, 'Alpheratz c', 'Segundo planeta detectado en el sistema Alpheratz.', 2, 'Gigante gaseoso', false, 48000);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Mision 1', 2);
INSERT INTO public.space_mission VALUES (2, 'Mision 2', 2);
INSERT INTO public.space_mission VALUES (3, 'Mision 3', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G', 1.00, true);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 'B', 3.60, true);
INSERT INTO public.star VALUES (3, 'M33-R1', 3, 'O', 25.00, true);
INSERT INTO public.star VALUES (4, 'R136a1', 4, 'WN', 315.00, true);
INSERT INTO public.star VALUES (5, 'Sombrero Core Star', 5, 'K', 1.50, true);
INSERT INTO public.star VALUES (6, 'Whirlpool Bright', 6, 'A', 2.10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- Name: space_mission space_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

