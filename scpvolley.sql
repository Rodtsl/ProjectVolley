--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2018-03-26 15:44:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 201 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 201
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 172 (class 1259 OID 16394)
-- Name: sq_id_adherent; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_adherent
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_adherent OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16396)
-- Name: adherents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adherents (
    id_adherent integer DEFAULT nextval('sq_id_adherent'::regclass) NOT NULL,
    id_categorie integer,
    id_poste integer,
    login character varying(20) NOT NULL,
    mdp character varying(1024) NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    no_licence character varying(20),
    date_naissance date NOT NULL,
    genre character(1) NOT NULL,
    surclassement integer DEFAULT 0 NOT NULL,
    habilitation integer NOT NULL,
    arbitre boolean NOT NULL,
    entraineur boolean NOT NULL,
    CONSTRAINT ck_genre CHECK ((genre = ANY (ARRAY['M'::bpchar, 'F'::bpchar]))),
    CONSTRAINT ck_habilitation CHECK (((habilitation >= 1) AND (habilitation <= 3))),
    CONSTRAINT ck_surclassement CHECK (((surclassement >= 0) AND (surclassement <= 3)))
);


ALTER TABLE adherents OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16407)
-- Name: arbitre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE arbitre (
    id_adherent integer NOT NULL,
    id_match integer NOT NULL
);


ALTER TABLE arbitre OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16410)
-- Name: sq_id_archive; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_archive
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_archive OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16412)
-- Name: archives; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE archives (
    id_archive integer DEFAULT nextval('sq_id_archive'::regclass) NOT NULL,
    titre character varying(50),
    type character varying(1),
    lien_photo character varying(50),
    contenu text,
    lien_document character varying(50),
    id_createur integer NOT NULL,
    date_creation date NOT NULL,
    id_validateur integer,
    date_validation date,
    CONSTRAINT ck_type CHECK (((type)::text = ANY (ARRAY[('A'::character varying)::text, ('F'::character varying)::text])))
);


ALTER TABLE archives OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16420)
-- Name: sq_id_article; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_article
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_article OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16422)
-- Name: catalogue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE catalogue (
    id_article integer DEFAULT nextval('sq_id_article'::regclass) NOT NULL,
    designation character varying(50),
    des_comp character varying(50),
    taille character varying(6),
    coloris character varying(20),
    prix integer,
    lien_photo character varying(50)
);


ALTER TABLE catalogue OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16426)
-- Name: sq_id_categorie; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_categorie
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_categorie OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16428)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id_categorie integer DEFAULT nextval('sq_id_categorie'::regclass) NOT NULL,
    categorie character varying(20) NOT NULL,
    description character varying(50),
    annee_deb integer,
    annee_fin integer,
    tarif real
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16432)
-- Name: sq_id_contact; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_contact
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_contact OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16434)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacts (
    id_contact integer DEFAULT nextval('sq_id_contact'::regclass) NOT NULL,
    id_adherent integer,
    nom character varying(50),
    prenom character varying(50),
    adresse character varying(200),
    code_postal character varying(50),
    ville character varying(50),
    complement character varying(200),
    remarque character varying(200),
    ordre integer
);


ALTER TABLE contacts OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16441)
-- Name: courriels; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE courriels (
    id_contact integer NOT NULL,
    courriel character varying(256) NOT NULL,
    ordre integer,
    CONSTRAINT ck_courriel CHECK (((courriel)::text ~ '^(([a-zA-Z0-9_+-]+\.)+[a-zA-Z0-9_+-]+|[a-zA-Z0-9]+)?[a-zA-Z0-9_+-]@([a-zA-Z0-9_+-]+\.)+[a-zA-Z0-9_+-]{2,6}$'::text))
);


ALTER TABLE courriels OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16445)
-- Name: sq_id_creneau; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_creneau
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_creneau OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16447)
-- Name: creneaux; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE creneaux (
    id_creneau integer DEFAULT nextval('sq_id_creneau'::regclass) NOT NULL,
    id_salle integer NOT NULL,
    debut timestamp without time zone NOT NULL,
    fin timestamp without time zone NOT NULL
);


ALTER TABLE creneaux OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16451)
-- Name: sq_id_document; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_document
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_document OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16453)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documents (
    id_document integer DEFAULT nextval('sq_id_document'::regclass) NOT NULL,
    titre character varying(50),
    type character varying(1),
    lien_photo character varying(50),
    contenu text,
    lien_document character varying(50),
    id_createur integer NOT NULL,
    date_creation date NOT NULL,
    id_validateur integer,
    date_validation date,
    id_equipe integer,
    CONSTRAINT ck_type CHECK (((type)::text = ANY (ARRAY[('A'::character varying)::text, ('F'::character varying)::text])))
);


ALTER TABLE documents OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16461)
-- Name: entraine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entraine (
    id_entraineur integer NOT NULL,
    id_equipe integer NOT NULL,
    ordre integer
);


ALTER TABLE entraine OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16464)
-- Name: sq_id_entrainement; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_entrainement
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_entrainement OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16466)
-- Name: entrainements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrainements (
    id_entrainement integer DEFAULT nextval('sq_id_entrainement'::regclass) NOT NULL,
    id_equipe integer,
    id_entraineur integer,
    id_creneau integer NOT NULL
);


ALTER TABLE entrainements OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16470)
-- Name: sq_id_equipe; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_equipe
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_equipe OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16472)
-- Name: equipes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipes (
    id_equipe integer DEFAULT nextval('sq_id_equipe'::regclass) NOT NULL,
    id_categorie integer NOT NULL,
    nom character varying(50),
    points integer,
    victoires integer,
    defaites integer,
    nulls integer,
    photo character varying(30),
    club boolean DEFAULT true
);


ALTER TABLE equipes OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16477)
-- Name: joue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE joue (
    id_adherent integer NOT NULL,
    id_equipe integer NOT NULL
);


ALTER TABLE joue OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16480)
-- Name: sq_id_match; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_match
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_match OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16482)
-- Name: matchs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matchs (
    id_match integer DEFAULT nextval('sq_id_match'::regclass) NOT NULL,
    id_equipe_a integer NOT NULL,
    id_creneau integer NOT NULL,
    score_a integer,
    score_b integer,
    duree time without time zone,
    nom_equipe_b character varying
);


ALTER TABLE matchs OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16489)
-- Name: sq_id_poste; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_poste
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_poste OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16491)
-- Name: postes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE postes (
    id_poste integer DEFAULT nextval('sq_id_poste'::regclass) NOT NULL,
    designation character varying(50) NOT NULL,
    description character varying(200)
);


ALTER TABLE postes OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16495)
-- Name: sq_id_salle; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_id_salle
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_id_salle OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16497)
-- Name: salles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salles (
    id_salle integer DEFAULT nextval('sq_id_salle'::regclass) NOT NULL,
    nom character varying(50),
    adresse character varying(200),
    code_postal character varying(50),
    ville character varying(50),
    complement character varying(200)
);


ALTER TABLE salles OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16504)
-- Name: telephones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telephones (
    id_contact integer NOT NULL,
    telephone character(10) NOT NULL,
    type character varying(50),
    remarque character varying(200),
    ordre integer,
    CONSTRAINT ck_telephone CHECK ((telephone ~ '^0[0-9]{9}$'::text)),
    CONSTRAINT ck_type CHECK (((type)::text = ANY (ARRAY[('fixe'::character varying)::text, ('portable'::character varying)::text, ('travail'::character varying)::text, ('autre'::character varying)::text])))
);


ALTER TABLE telephones OWNER TO postgres;

--
-- TOC entry 2164 (class 0 OID 16396)
-- Dependencies: 173
-- Data for Name: adherents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adherents (id_adherent, id_categorie, id_poste, login, mdp, nom, prenom, no_licence, date_naissance, genre, surclassement, habilitation, arbitre, entraineur) FROM stdin;
1	1	\N	azlouni.sirine	123	AZLOUNI	Sirine	4568792	2008-11-25	F	1	3	f	f
2	1	\N	delmotte.camille	123	DELMOTTE	Camille	456443	2009-05-21	F	1	3	f	f
3	1	\N	guers.louna	123	GUERS	Louna	3467924	2007-04-12	F	0	3	f	f
4	1	\N	journade.mathieu	123	JOURNADE	Mathieu	2467923	2008-08-10	M	0	3	f	f
5	1	\N	legal.camille	123	LEGAL	Camille	0288924	2009-01-05	F	0	3	f	f
6	2	\N	lemetayer.gaetane	123	LEMETAYER	Gaetane	8534456	2007-02-18	F	0	3	f	f
7	2	\N	vigier.maxens	123	VIGIER	Maxens	0259335	2010-03-13	M	0	3	f	f
8	2	\N	virgili.margaux	123	VIRGILI	Margaux	1464931	2008-11-27	F	0	3	f	f
0	3	\N	test	test	admin	grand chef	0000	2005-10-10	M	1	1	f	f
\.


--
-- TOC entry 2165 (class 0 OID 16407)
-- Dependencies: 174
-- Data for Name: arbitre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY arbitre (id_adherent, id_match) FROM stdin;
\.


--
-- TOC entry 2167 (class 0 OID 16412)
-- Dependencies: 176
-- Data for Name: archives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY archives (id_archive, titre, type, lien_photo, contenu, lien_document, id_createur, date_creation, id_validateur, date_validation) FROM stdin;
1	R1 f&eacute;minines championnes !	A		Nos R1 filles sont championnes r&eacute;gionales	\N	0	2016-05-30	0	2016-05-31
2	R1 masculin champions !	A		Nos R1 gar&ccedil;ons sont champions r&eacute;gion	\N	0	2016-05-31	0	2016-05-31
3	Victoire des M11	A	./img/articles/m11.jpg	Superbe victoire des M11 au TQO ;-)	\N	0	2016-05-31	0	2016-05-31
4	M11F test	A	./img/articles/amourJuB.jpg	test blabla trop cool	\N	1	2016-06-09	0	2016-06-09
\.


--
-- TOC entry 2169 (class 0 OID 16422)
-- Dependencies: 178
-- Data for Name: catalogue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY catalogue (id_article, designation, des_comp, taille, coloris, prix, lien_photo) FROM stdin;
1	Ballon MOLTEN	\N	\N	\N	20	./img/boutique/ballon.png
2	Genouillères ASICS	\N	S	Bleu foncé	10	./img/boutique/genouilleres.jpg
3	Genouillères ASICS	\N	M	Bleu foncé	10	./img/boutique/genouilleres.jpg
4	Genouillères ASICS	\N	L	Bleu foncé	10	./img/boutique/genouilleres.jpg
5	Genouillères coque	\N	M	Noir	24	./img/boutique/genouilleres_coque.png
6	Genouillères coque	\N	L	Noir	24	./img/boutique/genouilleres_coque.png
7	Genouillères coque	\N	XL	Noir	24	./img/boutique/genouilleres_coque.png
8	Short Garçon ASICS ZONA	\N	XS	Noir	18	./img/boutique/short_garcon.png
9	Short Garçon ASICS ZONA	\N	S	Noir	18	./img/boutique/short_garcon.png
10	Short Garçon ASICS ZONA	\N	M	Noir	18	./img/boutique/short_garcon.png
11	Short Garçon ASICS ZONA	\N	L	Noir	18	./img/boutique/short_garcon.png
12	Short Garçon ASICS ZONA	\N	XL	Noir	18	./img/boutique/short_garcon.png
13	Short Garçon ASICS ZONA	\N	XXL	Noir	18	./img/boutique/short_garcon.png
14	Short cuissard Fille ASICS	\N	XS	Noir	18	./img/boutique/short_filles.png
15	Short cuissard Fille ASICS	\N	S	Noir	18	./img/boutique/short_filles.png
16	Short cuissard Fille ASICS	\N	M	Noir	18	./img/boutique/short_filles.png
17	Short cuissard Fille ASICS	\N	L	Noir	18	./img/boutique/short_filles.png
18	Short cuissard Fille ASICS	\N	XL	Noir	18	./img/boutique/short_filles.png
19	Short cuissard Fille ASICS	\N	XXL	Noir	18	./img/boutique/short_filles.png
20	Tee-shirt Classic	Flocage club + prénom	4A	Noir	10	./img/boutique/tee_shirt.jpg
21	Tee-shirt Classic	Flocage club + prénom	8A	Noir	10	./img/boutique/tee_shirt.jpg
22	Tee-shirt Classic	Flocage club + prénom	10A	Noir	10	./img/boutique/tee_shirt.jpg
23	Tee-shirt Classic	Flocage club + prénom	12A	Noir	10	./img/boutique/tee_shirt.jpg
24	Tee-shirt Classic	Flocage club + prénom	S	Noir	10	./img/boutique/tee_shirt.jpg
25	Tee-shirt Classic	Flocage club + prénom	M	Noir	10	./img/boutique/tee_shirt.jpg
26	Tee-shirt Classic	Flocage club + prénom	L	Noir	10	./img/boutique/tee_shirt.jpg
27	Tee-shirt Classic	Flocage club + prénom	XL	Noir	10	./img/boutique/tee_shirt.jpg
28	Tee-shirt Classic	Flocage club + prénom	XXL	Noir	10	./img/boutique/tee_shirt.jpg
29	Tee-shirt Classic	Flocage club + prénom	XXXL	Noir	10	./img/boutique/tee_shirt.jpg
30	SAC 60x30x38 cm	70 L floqué club	\N	Rouge et Noir	20	./img/boutique/sac.png
\.


--
-- TOC entry 2171 (class 0 OID 16428)
-- Dependencies: 180
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id_categorie, categorie, description, annee_deb, annee_fin, tarif) FROM stdin;
1	M7	Baby	\N	2009	80
2	M9	Pupilles	2007	2008	100
3	M11	Poussins	2005	2006	100
4	M13	Benjamins	2003	2004	100
5	M15	Minimes	2001	2002	115
6	M17	Cadets	1999	2000	115
7	M20	Juniors et Espoirs	1996	1998	125
8	Seniors	\N	1995	\N	135
9	FSGT	\N	1995	\N	105
\.


--
-- TOC entry 2173 (class 0 OID 16434)
-- Dependencies: 182
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts (id_contact, id_adherent, nom, prenom, adresse, code_postal, ville, complement, remarque, ordre) FROM stdin;
1	1	AZLOUNI	Sirine	adresse	31000	toulouse	\N	\N	0
\.


--
-- TOC entry 2174 (class 0 OID 16441)
-- Dependencies: 183
-- Data for Name: courriels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY courriels (id_contact, courriel, ordre) FROM stdin;
1	azlouni.sirine@hotmail.fr	\N
1	azlouni.sirine@gmail.com	\N
\.


--
-- TOC entry 2176 (class 0 OID 16447)
-- Dependencies: 185
-- Data for Name: creneaux; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY creneaux (id_creneau, id_salle, debut, fin) FROM stdin;
1	1	2016-05-02 10:30:00	2016-05-02 12:00:00
2	2	2016-05-09 10:30:00	2016-05-09 12:00:00
3	2	2016-05-16 10:30:00	2016-05-16 12:00:00
6	1	2016-05-28 10:00:00	2016-05-28 12:00:00
7	1	2016-05-28 10:00:00	2016-05-28 12:00:00
8	1	2016-06-04 10:00:00	2016-06-04 12:00:00
10	3	2016-06-18 10:00:00	2016-06-18 12:00:00
11	3	2016-06-18 10:00:00	2016-06-18 12:00:00
12	1	2016-11-12 10:00:00	2016-11-12 12:05:00
\.


--
-- TOC entry 2178 (class 0 OID 16453)
-- Dependencies: 187
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents (id_document, titre, type, lien_photo, contenu, lien_document, id_createur, date_creation, id_validateur, date_validation, id_equipe) FROM stdin;
1	Test article	A	./img/articles/m11.jpg	blabla bla	\N	0	2016-05-30	0	2016-05-30	3
2	M13F article	A	./img/articles/m13f.jpg	Super match des MF ce Week-end !	\N	0	2016-05-31	0	2016-05-31	4
7	Victoire des M11 2	A	./img/articles/amours2016.JPG	test	\N	0	2016-06-09	0	2016-06-09	23
\.


--
-- TOC entry 2179 (class 0 OID 16461)
-- Dependencies: 188
-- Data for Name: entraine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entraine (id_entraineur, id_equipe, ordre) FROM stdin;
1	1	1
\.


--
-- TOC entry 2181 (class 0 OID 16466)
-- Dependencies: 190
-- Data for Name: entrainements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entrainements (id_entrainement, id_equipe, id_entraineur, id_creneau) FROM stdin;
\.


--
-- TOC entry 2183 (class 0 OID 16472)
-- Dependencies: 192
-- Data for Name: equipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipes (id_equipe, id_categorie, nom, points, victoires, defaites, nulls, photo, club) FROM stdin;
1	1	M7 (Ecole de volley)	0	0	0	0	./img/equipes/ecole_volley.jpg	t
2	2	M9 (Ecole de volley)	0	0	0	0	./img/equipes/ecole_volley.jpg	t
3	3	M11 (Poussins / Poussines)	0	0	0	0	./img/equipes/m11.jpg	t
4	4	M13 M (Benjamins)	0	0	0	0	\N	t
5	4	M13 F (Benjamines)	0	0	0	0	./img/equipes/m13f.jpg	t
6	5	M15 M (Minimes M)	0	0	0	0	\N	t
7	5	M15 F (Minimes F)	0	0	0	0	./img/equipes/m15f.jpg	t
8	7	M20 F (Juniors F)	0	0	0	0	\N	t
22	3	M11F2 (Poussines)	\N	\N	\N	\N	./img/equipes/amours.jpg	t
23	3	M11 2 (Poussins)	\N	\N	\N	\N	./img/equipes/amours.jpg	t
\.


--
-- TOC entry 2184 (class 0 OID 16477)
-- Dependencies: 193
-- Data for Name: joue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY joue (id_adherent, id_equipe) FROM stdin;
4	3
\.


--
-- TOC entry 2186 (class 0 OID 16482)
-- Dependencies: 195
-- Data for Name: matchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY matchs (id_match, id_equipe_a, id_creneau, score_a, score_b, duree, nom_equipe_b) FROM stdin;
1	4	1	1	2	\N	Portet
2	5	2	0	0	\N	L'Union
3	6	3	1	0	\N	Fonsorbes
4	3	7	\N	\N	\N	TOAC
5	5	8	\N	\N	\N	L'Union
7	3	10	\N	\N	\N	TOAC
8	23	11	\N	\N	\N	L'Union
9	23	12	\N	\N	\N	TOAC
\.


--
-- TOC entry 2188 (class 0 OID 16491)
-- Dependencies: 197
-- Data for Name: postes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postes (id_poste, designation, description) FROM stdin;
1	Président(e)	Le chef
2	Secrétaire	Ben un poste de secrétaire quoi ...
3	Comptable	Le chef
4	Entraineur referent	Le referent des entraineurs
\.


--
-- TOC entry 2190 (class 0 OID 16497)
-- Dependencies: 199
-- Data for Name: salles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salles (id_salle, nom, adresse, code_postal, ville, complement) FROM stdin;
1	gymnase Rivière	4 rue d’Estujats	31830	Plaisance du Touch	\N
2	Gymnase Monestié	rue des fauvettes	31830	Plaisance du Touch	\N
3	Exterieur				
\.


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 172
-- Name: sq_id_adherent; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_adherent', 8, true);


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 175
-- Name: sq_id_archive; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_archive', 4, true);


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 177
-- Name: sq_id_article; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_article', 30, true);


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 179
-- Name: sq_id_categorie; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_categorie', 9, true);


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 181
-- Name: sq_id_contact; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_contact', 1, true);


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 184
-- Name: sq_id_creneau; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_creneau', 12, true);


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_id_document; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_document', 7, true);


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 189
-- Name: sq_id_entrainement; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_entrainement', 1, true);


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 191
-- Name: sq_id_equipe; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_equipe', 23, true);


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 194
-- Name: sq_id_match; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_match', 9, true);


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 196
-- Name: sq_id_poste; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_poste', 4, true);


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 198
-- Name: sq_id_salle; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_id_salle', 4, true);


--
-- TOC entry 2191 (class 0 OID 16504)
-- Dependencies: 200
-- Data for Name: telephones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY telephones (id_contact, telephone, type, remarque, ordre) FROM stdin;
1	0204050607	\N	\N	\N
\.


--
-- TOC entry 1996 (class 2606 OID 16510)
-- Name: adherents_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adherents
    ADD CONSTRAINT adherents_login_key UNIQUE (login);


--
-- TOC entry 1998 (class 2606 OID 16512)
-- Name: adherents_no_licence_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adherents
    ADD CONSTRAINT adherents_no_licence_key UNIQUE (no_licence);


--
-- TOC entry 2000 (class 2606 OID 16514)
-- Name: adherents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adherents
    ADD CONSTRAINT adherents_pkey PRIMARY KEY (id_adherent);


--
-- TOC entry 2004 (class 2606 OID 16516)
-- Name: archives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archives
    ADD CONSTRAINT archives_pkey PRIMARY KEY (id_archive);


--
-- TOC entry 2006 (class 2606 OID 16518)
-- Name: catalogue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY catalogue
    ADD CONSTRAINT catalogue_pkey PRIMARY KEY (id_article);


--
-- TOC entry 2008 (class 2606 OID 16520)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id_categorie);


--
-- TOC entry 2010 (class 2606 OID 16522)
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id_contact);


--
-- TOC entry 2012 (class 2606 OID 16524)
-- Name: creneaux_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY creneaux
    ADD CONSTRAINT creneaux_pkey PRIMARY KEY (id_creneau);


--
-- TOC entry 2014 (class 2606 OID 16526)
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id_document);


--
-- TOC entry 2020 (class 2606 OID 16528)
-- Name: entrainements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrainements
    ADD CONSTRAINT entrainements_pkey PRIMARY KEY (id_entrainement);


--
-- TOC entry 2022 (class 2606 OID 16530)
-- Name: equipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipes
    ADD CONSTRAINT equipes_pkey PRIMARY KEY (id_equipe);


--
-- TOC entry 2026 (class 2606 OID 16532)
-- Name: matchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matchs
    ADD CONSTRAINT matchs_pkey PRIMARY KEY (id_match);


--
-- TOC entry 2002 (class 2606 OID 16534)
-- Name: pk_arbitre; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY arbitre
    ADD CONSTRAINT pk_arbitre PRIMARY KEY (id_adherent, id_match);


--
-- TOC entry 2016 (class 2606 OID 16536)
-- Name: pk_entraine; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entraine
    ADD CONSTRAINT pk_entraine PRIMARY KEY (id_entraineur, id_equipe);


--
-- TOC entry 2024 (class 2606 OID 16538)
-- Name: pk_joue; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY joue
    ADD CONSTRAINT pk_joue PRIMARY KEY (id_adherent, id_equipe);


--
-- TOC entry 2028 (class 2606 OID 16540)
-- Name: postes_designation_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postes
    ADD CONSTRAINT postes_designation_key UNIQUE (designation);


--
-- TOC entry 2030 (class 2606 OID 16542)
-- Name: postes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postes
    ADD CONSTRAINT postes_pkey PRIMARY KEY (id_poste);


--
-- TOC entry 2032 (class 2606 OID 16544)
-- Name: salles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salles
    ADD CONSTRAINT salles_pkey PRIMARY KEY (id_salle);


--
-- TOC entry 2018 (class 2606 OID 16546)
-- Name: un_entraineur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entraine
    ADD CONSTRAINT un_entraineur UNIQUE (id_entraineur, id_equipe, ordre);


--
-- TOC entry 2033 (class 2606 OID 16547)
-- Name: adherents_id_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adherents
    ADD CONSTRAINT adherents_id_categorie_fkey FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie);


--
-- TOC entry 2034 (class 2606 OID 16552)
-- Name: adherents_id_poste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adherents
    ADD CONSTRAINT adherents_id_poste_fkey FOREIGN KEY (id_poste) REFERENCES postes(id_poste);


--
-- TOC entry 2035 (class 2606 OID 16557)
-- Name: arbitre_id_adherent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY arbitre
    ADD CONSTRAINT arbitre_id_adherent_fkey FOREIGN KEY (id_adherent) REFERENCES adherents(id_adherent);


--
-- TOC entry 2036 (class 2606 OID 16562)
-- Name: arbitre_id_match_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY arbitre
    ADD CONSTRAINT arbitre_id_match_fkey FOREIGN KEY (id_match) REFERENCES matchs(id_match);


--
-- TOC entry 2037 (class 2606 OID 16567)
-- Name: archives_id_createur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archives
    ADD CONSTRAINT archives_id_createur_fkey FOREIGN KEY (id_createur) REFERENCES adherents(id_adherent);


--
-- TOC entry 2038 (class 2606 OID 16572)
-- Name: archives_id_validateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archives
    ADD CONSTRAINT archives_id_validateur_fkey FOREIGN KEY (id_validateur) REFERENCES adherents(id_adherent);


--
-- TOC entry 2039 (class 2606 OID 16577)
-- Name: contacts_id_adherent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_id_adherent_fkey FOREIGN KEY (id_adherent) REFERENCES adherents(id_adherent);


--
-- TOC entry 2040 (class 2606 OID 16582)
-- Name: courriels_id_contact_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courriels
    ADD CONSTRAINT courriels_id_contact_fkey FOREIGN KEY (id_contact) REFERENCES contacts(id_contact);


--
-- TOC entry 2041 (class 2606 OID 16587)
-- Name: creneaux_id_salle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creneaux
    ADD CONSTRAINT creneaux_id_salle_fkey FOREIGN KEY (id_salle) REFERENCES salles(id_salle);


--
-- TOC entry 2043 (class 2606 OID 16592)
-- Name: documents_id_createur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_id_createur_fkey FOREIGN KEY (id_createur) REFERENCES adherents(id_adherent);


--
-- TOC entry 2042 (class 2606 OID 16597)
-- Name: documents_id_validateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_id_validateur_fkey FOREIGN KEY (id_validateur) REFERENCES adherents(id_adherent);


--
-- TOC entry 2044 (class 2606 OID 16602)
-- Name: entraine_id_entraineur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entraine
    ADD CONSTRAINT entraine_id_entraineur_fkey FOREIGN KEY (id_entraineur) REFERENCES adherents(id_adherent);


--
-- TOC entry 2045 (class 2606 OID 16607)
-- Name: entraine_id_equipe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entraine
    ADD CONSTRAINT entraine_id_equipe_fkey FOREIGN KEY (id_equipe) REFERENCES equipes(id_equipe);


--
-- TOC entry 2046 (class 2606 OID 16612)
-- Name: entrainements_id_creneau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrainements
    ADD CONSTRAINT entrainements_id_creneau_fkey FOREIGN KEY (id_creneau) REFERENCES creneaux(id_creneau);


--
-- TOC entry 2047 (class 2606 OID 16617)
-- Name: entrainements_id_entraineur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrainements
    ADD CONSTRAINT entrainements_id_entraineur_fkey FOREIGN KEY (id_entraineur) REFERENCES adherents(id_adherent);


--
-- TOC entry 2048 (class 2606 OID 16622)
-- Name: entrainements_id_equipe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrainements
    ADD CONSTRAINT entrainements_id_equipe_fkey FOREIGN KEY (id_equipe) REFERENCES equipes(id_equipe);


--
-- TOC entry 2049 (class 2606 OID 16627)
-- Name: equipes_id_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipes
    ADD CONSTRAINT equipes_id_categorie_fkey FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie);


--
-- TOC entry 2050 (class 2606 OID 16632)
-- Name: joue_id_adherent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY joue
    ADD CONSTRAINT joue_id_adherent_fkey FOREIGN KEY (id_adherent) REFERENCES adherents(id_adherent);


--
-- TOC entry 2051 (class 2606 OID 16637)
-- Name: joue_id_equipe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY joue
    ADD CONSTRAINT joue_id_equipe_fkey FOREIGN KEY (id_equipe) REFERENCES equipes(id_equipe);


--
-- TOC entry 2052 (class 2606 OID 16642)
-- Name: matchs_id_creneau_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matchs
    ADD CONSTRAINT matchs_id_creneau_fkey FOREIGN KEY (id_creneau) REFERENCES creneaux(id_creneau);


--
-- TOC entry 2053 (class 2606 OID 16647)
-- Name: telephones_id_contact_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telephones
    ADD CONSTRAINT telephones_id_contact_fkey FOREIGN KEY (id_contact) REFERENCES contacts(id_contact);


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-03-26 15:44:10

--
-- PostgreSQL database dump complete
--

