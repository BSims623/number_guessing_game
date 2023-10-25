--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES ('kmgreenw', 2, 6);
INSERT INTO public.usernames VALUES ('user_1698126488755', 2, 522);
INSERT INTO public.usernames VALUES ('user_1698128125554', 2, 93);
INSERT INTO public.usernames VALUES ('user_1698126488756', 5, 248);
INSERT INTO public.usernames VALUES ('user_1698128125555', 5, 13);
INSERT INTO public.usernames VALUES ('user_1698127593517', 2, 462);
INSERT INTO public.usernames VALUES ('user_1698127593518', 5, 45);
INSERT INTO public.usernames VALUES ('user_1698128161143', 2, 742);
INSERT INTO public.usernames VALUES ('user_1698127618014', 2, 322);
INSERT INTO public.usernames VALUES ('user_1698128161144', 5, 197);
INSERT INTO public.usernames VALUES ('user_1698127618015', 5, 133);
INSERT INTO public.usernames VALUES ('user_1698127764196', 2, 216);
INSERT INTO public.usernames VALUES ('user_1698128170012', 2, 564);
INSERT INTO public.usernames VALUES ('user_1698127764197', 5, 11);
INSERT INTO public.usernames VALUES ('brian623', 6, 5);
INSERT INTO public.usernames VALUES ('user_1698128170013', 5, 35);
INSERT INTO public.usernames VALUES ('user_1698128030706', 2, 384);
INSERT INTO public.usernames VALUES ('user_1698128030707', 5, 227);
INSERT INTO public.usernames VALUES ('user_1698128171419', 2, 323);
INSERT INTO public.usernames VALUES ('user_1698128049772', 2, 352);
INSERT INTO public.usernames VALUES ('user_1698128171420', 5, 42);
INSERT INTO public.usernames VALUES ('user_1698128049773', 5, 369);
INSERT INTO public.usernames VALUES ('user_1698128101301', 2, 303);
INSERT INTO public.usernames VALUES ('user_1698128101302', 5, 58);


--
-- Name: usernames usernames_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

