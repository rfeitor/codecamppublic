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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    quantity numeric(10,5),
    is_rare boolean
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.element_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(18,8),
    type character varying(20),
    distance_from_earth numeric(10,5),
    has_stars boolean,
    number_of_stars integer,
    number_of_planets integer
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
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric(8,5),
    type character varying(20),
    has_life boolean,
    distance_from_earth numeric(10,5),
    distance_from_planet numeric(10,5)
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
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric(8,5),
    type character varying(20),
    distance_from_earth numeric(10,5),
    has_life boolean
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
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric(8,5),
    type character varying(20),
    distance_from_earth numeric(10,5)
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'Hydrogen', NULL, 1, NULL, NULL, 0.73460, false);
INSERT INTO public.element VALUES (2, 'Helium', NULL, 1, NULL, NULL, 0.24850, false);
INSERT INTO public.element VALUES (3, 'Oxygen', NULL, 1, NULL, NULL, 0.00770, false);
INSERT INTO public.element VALUES (4, 'Carbon', NULL, 1, NULL, NULL, 0.00290, false);
INSERT INTO public.element VALUES (5, 'Iron', NULL, 1, NULL, NULL, 0.00160, false);
INSERT INTO public.element VALUES (6, 'Neon', NULL, 1, NULL, NULL, 0.00120, false);
INSERT INTO public.element VALUES (7, 'Nitrogen', NULL, 1, NULL, NULL, 0.00090, false);
INSERT INTO public.element VALUES (8, 'Silicon', NULL, 1, NULL, NULL, 0.00070, true);
INSERT INTO public.element VALUES (9, 'Magnesium', NULL, 1, NULL, NULL, 0.00050, true);
INSERT INTO public.element VALUES (10, 'Sulphur', NULL, 1, NULL, NULL, 0.00040, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda Galaxy also called Andromeda Nebula (vatalog NGC224 and M31), great spiral galaxy in the constellation Andromeda, the nearest large galaxy.', false, 1123.00000000, 'SA(s)b', 1111.12300, true, 1000000, 4555999);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Milky Way Galaxy, large spiral system consisting of several hundred billion stars, one of which is the Sun.', false, 0.00000000, 'Sb(rs)bc', 1111.12300, true, 1000, 4555);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Cygnus A, most powerful cosmic source of radio waves known, lying in the northern constellation Cygnus.', false, 0.00000000, 'E', 1111.12300, true, 1000, 4555);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf Galaxy', 'Canis Major Dwarf Galaxy, member of the Local Group of galaxies (the group thatincludes the Milky Way Galaxy) named after the constellation Canis Major, in which it appears to lie.', false, 0.00000000, 'Irr', 1111.12300, true, 1000, 4555);
INSERT INTO public.galaxy VALUES (5, 'Virgo A', 'M87, in full Messier 87, also called Virgo A or NGC4486, giant elliptical galaxy in the constellation Virgo whose nucleus contains a black hole, the first ever to be directly imaged', false, 0.00000000, 'NLRG Sy', 1111.12300, true, 1000, 4555);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1 and 2', 'Maffei 1 and 2, two galaxies relatively close to the Milky WayGalaxy but unobserved until the late 1960s, when the Italian astronomer Paolo Maffei detected them by their infrared radiation.', false, 0.00000000, 'E3', 1111.12300, true, 1000, 4555);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 7, 'Earth Moon', NULL, 'Terrestrial', false, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 8, 'Phobos', NULL, 'Terrestrial', false, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 8, 'Deimos', NULL, 'Terrestrial', false, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Despina', 12, 'Despina', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Galatea', 12, 'Galatea', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Halimede', 12, 'Halimede', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Hippocamp', 12, 'Hippocamp', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Laomedela', 12, 'Laomedela', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Larissa', 12, 'Larissa', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Naiad', 12, 'Naiad', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Nereid', 12, 'Nereid', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Neso', 12, 'Neso', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Proteus', 12, 'Proteus', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Psamathe', 12, 'Psamathe', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Sao', 12, 'Sao', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Thalassa', 12, 'Thalassa', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Triton', 12, 'Triton', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Io', 9, 'Io', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Europa', 9, 'Europa', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Ganymede', 9, 'Ganymede', NULL, 'Gas Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Callisto', 9, 'Callisto', NULL, 'Gas Moon', false, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Rigil Kentaurus', 2, 'Related to Alpha Centauri', 420.00000, 'Candidate', 4.34410, false);
INSERT INTO public.planet VALUES (2, 'Toliman', 2, 'Related to Alpha Centauri', 430.00000, 'Candidate', 4.34410, true);
INSERT INTO public.planet VALUES (3, 'Luhman 16 B', 5, 'Related to Luhman 16', 430.00000, 'Brown Dwarfs', 6.50290, false);
INSERT INTO public.planet VALUES (4, 'B', 8, 'Related to Sirius', 440.00000, 'Brown Dwarfs', 8.70940, false);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 'The smallest planet in our solar system and closest to Sun - is only slighhtly larger than Earths Moon.', 100.00000, 'Terrestrial', 2.91910, false);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 'Similar in structure and size to Earth, Venus thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system.', 50.00000, 'Terrestrial', 6.01850, false);
INSERT INTO public.planet VALUES (7, 'Earth', 1, 'Our home planet - is the only place we know of so far thats inhabited by living things. Its also the only planet in our solar system with liquid water on the surface.', 0.00000, 'Terrestrial', 0.00000, true);
INSERT INTO public.planet VALUES (8, 'Mars', 1, 'Is a dusty, cold, desert world with a very thin atmosphere. There is a strong evidence Mars was - billions of years ago - wetter and warmer, with a thicker atmosphere.', 50.00000, 'Terrestrial', 13.84570, false);
INSERT INTO public.planet VALUES (9, 'Jupiter', 1, 'Is more than twice as massive than the other planets of our solar system combined. The giant planets Great Red Spot is a centuries-old storm bigger than Earth.', 400.00000, 'Gas Giant', 41.22740, false);
INSERT INTO public.planet VALUES (10, 'Saturn', 1, 'Adorned with a dazzling, complex system of icy rings, Saturn is unique in our solar system.', 200.00000, 'Gas Giant', 81.44430, false);
INSERT INTO public.planet VALUES (11, 'Uranus', 1, 'Seventh planet from the Sun - rotates at a nearly 90-degree angle from the planet of its orbit.', 150.00000, 'Ice Giant', 163.38080, false);
INSERT INTO public.planet VALUES (12, 'Neptune', 1, 'The eighth and most distant major planet orbiting our Sun - is dark, cold and whipped by supersonic winds.', 100.00000, 'Ice Giant', 248.74280, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 'Solar System', 460.00000, 'Star', 0.00010);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'Alpha Centauri', 424.50000, 'Star', 4.24650);
INSERT INTO public.star VALUES (4, 'Barnards Star', 2, 'Barnards Star', 460.00000, 'Star', 5.96290);
INSERT INTO public.star VALUES (5, 'Luhman 16 A', 2, 'Luhman 16', 424.50000, 'Star', 6.50290);
INSERT INTO public.star VALUES (8, 'Sirius', 2, 'Alpha Canis Majoris', 410.00000, 'Star', 8.70940);
INSERT INTO public.star VALUES (9, 'Procyon', 2, 'Alpha Canis Minoris', 460.00000, 'Star', 11.40200);


--
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.element_element_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (element_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: element uq_element_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT uq_element_name UNIQUE (name);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: element element_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: element element_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: element element_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: element element_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

