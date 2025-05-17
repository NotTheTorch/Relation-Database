--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    distance_light_years numeric,
    num_stars bigint NOT NULL,
    discovered_by text NOT NULL
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
    is_spherical boolean,
    description character varying(50),
    distance_from_earth bigint,
    age_in_million_of_years numeric(7,1),
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
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_million_of_years numeric(7,1),
    is_spherical boolean,
    description character varying(50),
    distance_from_earth bigint,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_gas_based boolean,
    avg_density numeric(5,1),
    discovery_year integer,
    common_planet_count integer
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_of_years numeric(7,1),
    has_life boolean,
    distance_from_earth bigint,
    description character varying(50),
    is_spherical boolean,
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100000000000, 'Ancient observers');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 1000000000000, 'Abd al-Rahman al-Sufi');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 53000000, 2000000000000, 'Charles Messier');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 163000, 30000000, 'Ferdinand Magellan');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 29000000, 800000000, 'Pierre Méchain');
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 61000000, 100000000000, 'John Herschel');
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 2730000, 40000000, 'Giovanni Battista Hodierna');
INSERT INTO public.galaxy VALUES (8, 'IC 1101', 1047000000, 100000000000000, 'William Herschel');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 'Earth’s only natural satellite', 384400, 4527.0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'Larger Martian moon', 9376, 4500.0, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'Smaller Martian moon', 23460, 4500.0, 2);
INSERT INTO public.moon VALUES (4, 'Europa', true, 'Icy moon of Jupiter', 628730000, 4500.0, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 'Largest moon in solar system', 628730000, 4500.0, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 'Heavily cratered Jovian moon', 628730000, 4500.0, 5);
INSERT INTO public.moon VALUES (11, 'Io', true, 'Volcanically active moon of Jupiter', 628730000, 4500.0, 5);
INSERT INTO public.moon VALUES (7, 'Titan', true, 'Thick atmosphere, Saturn’s moon', 1400000000, 4500.0, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, 'Icy geysers, Saturn’s moon', 1470000000, 4500.0, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', true, 'Icy Saturnian moon', 1520000000, 4500.0, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', true, 'Two-tone Saturn moon', 3561000000, 4500.0, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', true, 'Looks like Death Star', 1860000000, 4500.0, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', false, 'Irregular Saturn moon', 1481000000, 4500.0, 6);
INSERT INTO public.moon VALUES (19, 'Dione', true, 'Icy Saturn moon with cliffs', 1490000000, 4500.0, 6);
INSERT INTO public.moon VALUES (9, 'Triton', true, 'Neptune’s retrograde moon', 4350000000, 4500.0, 8);
INSERT INTO public.moon VALUES (10, 'Charon', true, 'Largest moon of Pluto', 19571000, 4500.0, 9);
INSERT INTO public.moon VALUES (16, 'Ariel', true, 'Uranus moon with canyons', 2910000000, 4500.0, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', true, 'Outer Uranian moon', 2900000000, 4500.0, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', true, 'Dark Uranian moon', 2890000000, 4500.0, 7);
INSERT INTO public.moon VALUES (20, 'Nereid', false, 'Eccentric moon of Neptune', 4350000000, 4500.0, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 4540.0, true, 'Home to known life', 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 4600.0, true, 'Red planet with polar ice', 225000000, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 4600.0, true, 'Hot and volcanic', 41000000, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', false, 4600.0, true, 'Closest to the Sun', 91700000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 4600.0, true, 'Largest gas giant', 588000000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 4600.0, true, 'Famous for its rings', 1200000000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 4600.0, true, 'Icy giant with tilt', 2600000000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4600.0, true, 'Blue windy giant', 4300000000, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 4600.0, true, 'Dwarf planet', 5900000000, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', false, 6000.0, true, 'Exoplanet in habitable zone', 600000000000, 9);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', false, 7000.0, true, 'Potentially habitable exoplanet', 200000000000, 2);
INSERT INTO public.planet VALUES (12, 'Proxima b', false, 5000.0, true, 'Closest exoplanet', 40100000000, 2);
INSERT INTO public.planet VALUES (13, 'Tatooine', false, 4000.0, true, 'Fictional desert planet', 500000000, 3);
INSERT INTO public.planet VALUES (14, 'Pandora', true, 4500.0, true, 'Lush moon from Avatar', 450000000, 4);
INSERT INTO public.planet VALUES (15, 'Krypton', false, 4500.0, true, 'Fictional destroyed world', 1000000000, 7);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', false, 5.5, NULL, NULL);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', true, 1.3, NULL, NULL);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', true, 1.6, NULL, NULL);
INSERT INTO public.planet_types VALUES (4, 'Dwarf Planet', false, 2.0, NULL, NULL);
INSERT INTO public.planet_types VALUES (5, 'Super-Earth', false, 5.0, NULL, NULL);
INSERT INTO public.planet_types VALUES (6, 'Lava Planet', false, 3.5, NULL, NULL);
INSERT INTO public.planet_types VALUES (7, 'Ocean Planet', false, 1.9, NULL, NULL);
INSERT INTO public.planet_types VALUES (8, 'Chthonian Planet', false, 7.0, NULL, NULL);
INSERT INTO public.planet_types VALUES (9, 'Helium Planet', true, 0.7, NULL, NULL);
INSERT INTO public.planet_types VALUES (10, 'Carbon Planet', false, 3.0, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.0, true, 0, 'Star of the solar system', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4800.0, false, 40100000000, 'Closest star to Earth', true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 242.0, false, 81700000000, 'Brightest star in night sky', true, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 5000.0, false, 41000000000, 'Part of binary system', true, 1);
INSERT INTO public.star VALUES (7, 'Vega', 455.0, false, 25000000000, 'Bright star in Lyra', true, 1);
INSERT INTO public.star VALUES (8, 'Polaris', 70000.0, false, 433000000000, 'North Star', true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10000.0, false, 642000000000, 'Red supergiant in Orion', true, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 8000.0, false, 860000000000, 'Blue supergiant star', true, 2);
INSERT INTO public.star VALUES (9, 'Kepler-186', 4000.0, false, 492000000000, 'Red dwarf with exoplanet', true, 3);
INSERT INTO public.star VALUES (10, 'R136a1', 1000.0, false, 1570000000000, 'One of the most massive stars', true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planet_types unique_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT unique_type_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

