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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1749366524699', 5, 18);
INSERT INTO public.users VALUES ('user_1749364892419', 2, 148);
INSERT INTO public.users VALUES ('Torch', 5, 4);
INSERT INTO public.users VALUES ('Beta', 1, 6);
INSERT INTO public.users VALUES ('user_1749365591880', 2, 304);
INSERT INTO public.users VALUES ('user_1749364142883', 2, 295);
INSERT INTO public.users VALUES ('user_1749364892420', 5, 663);
INSERT INTO public.users VALUES ('user_1749365591881', 5, 93);
INSERT INTO public.users VALUES ('user_1749365895404', 2, 500);
INSERT INTO public.users VALUES ('user_1749364142884', 5, 244);
INSERT INTO public.users VALUES ('user_1749365125026', 2, 247);
INSERT INTO public.users VALUES ('user_1749364400669', 2, 595);
INSERT INTO public.users VALUES ('user_1749366087514', 2, 158);
INSERT INTO public.users VALUES ('user_1749365664451', 2, 799);
INSERT INTO public.users VALUES ('user_1749365125027', 5, 254);
INSERT INTO public.users VALUES ('user_1749364400670', 5, 213);
INSERT INTO public.users VALUES ('user_1749365895405', 5, 2);
INSERT INTO public.users VALUES ('user_1749364514519', 2, 373);
INSERT INTO public.users VALUES ('user_1749365664452', 5, 317);
INSERT INTO public.users VALUES ('user_1749365191305', 2, 582);
INSERT INTO public.users VALUES ('user_1749364514520', 5, 309);
INSERT INTO public.users VALUES ('user_1749366087515', 5, 170);
INSERT INTO public.users VALUES ('user_1749365191306', 5, 3);
INSERT INTO public.users VALUES ('user_1749364753386', 2, 351);
INSERT INTO public.users VALUES ('user_1749365728136', 2, 235);
INSERT INTO public.users VALUES ('user_1749365909057', 2, 718);
INSERT INTO public.users VALUES ('user_1749364753387', 5, 202);
INSERT INTO public.users VALUES ('user_1749365239817', 2, 329);
INSERT INTO public.users VALUES ('user_1749365728137', 5, 108);
INSERT INTO public.users VALUES ('user_1749365239818', 5, 209);
INSERT INTO public.users VALUES ('user_1749365909058', 5, 69);
INSERT INTO public.users VALUES ('user_1749365741121', 2, 225);
INSERT INTO public.users VALUES ('user_1749365499816', 2, 105);
INSERT INTO public.users VALUES ('user_1749366347456', 2, 357);
INSERT INTO public.users VALUES ('user_1749365499817', 5, 184);
INSERT INTO public.users VALUES ('user_1749365741122', 5, 37);
INSERT INTO public.users VALUES ('user_1749366347457', 5, 40);
INSERT INTO public.users VALUES ('user_1749365983644', 2, 180);
INSERT INTO public.users VALUES ('user_1749365762204', 2, 122);
INSERT INTO public.users VALUES ('user_1749365762205', 5, 38);
INSERT INTO public.users VALUES ('user_1749365983645', 5, 96);
INSERT INTO public.users VALUES ('user_1749365781089', 2, 177);
INSERT INTO public.users VALUES ('user_1749365781090', 5, 254);
INSERT INTO public.users VALUES ('user_1749366402594', 2, 357);
INSERT INTO public.users VALUES ('user_1749366035448', 2, 231);
INSERT INTO public.users VALUES ('user_1749366402595', 5, 190);
INSERT INTO public.users VALUES ('user_1749366035449', 5, 329);
INSERT INTO public.users VALUES ('user_1749366056241', 2, 436);
INSERT INTO public.users VALUES ('user_1749366519772', 2, 620);
INSERT INTO public.users VALUES ('user_1749366056242', 5, 221);
INSERT INTO public.users VALUES ('user_1749366519773', 5, 33);
INSERT INTO public.users VALUES ('user_1749366522386', 2, 252);
INSERT INTO public.users VALUES ('user_1749366522387', 5, 121);
INSERT INTO public.users VALUES ('user_1749366524698', 2, 32);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

