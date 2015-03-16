--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.3
-- Dumped by pg_dump version 9.0.3
-- Started on 2013-04-01 01:21:08

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1840 (class 1262 OID 33327)
-- Dependencies: 1839
-- Name: bugs; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE bugs IS 'Bugs reportados en los sistemas';


--
-- TOC entry 324 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1527 (class 1259 OID 33435)
-- Dependencies: 5
-- Name: detalles_errores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalles_errores (
    id_det_err integer NOT NULL,
    num_inc integer,
    det_err text NOT NULL,
    fec_reg timestamp with time zone NOT NULL,
    id_err integer NOT NULL,
    id_usu integer NOT NULL
);


ALTER TABLE public.detalles_errores OWNER TO postgres;

--
-- TOC entry 1526 (class 1259 OID 33433)
-- Dependencies: 1527 5
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalles_errores_id_det_err_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalles_errores_id_det_err_seq OWNER TO postgres;

--
-- TOC entry 1843 (class 0 OID 0)
-- Dependencies: 1526
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalles_errores_id_det_err_seq OWNED BY detalles_errores.id_det_err;


--
-- TOC entry 1844 (class 0 OID 0)
-- Dependencies: 1526
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalles_errores_id_det_err_seq', 1, false);


--
-- TOC entry 1524 (class 1259 OID 33394)
-- Dependencies: 1812 5
-- Name: errores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE errores (
    id_err integer NOT NULL,
    des_err character varying(300) NOT NULL,
    fec_reg timestamp with time zone DEFAULT now() NOT NULL,
    id_len_pro integer NOT NULL
);


ALTER TABLE public.errores OWNER TO postgres;

--
-- TOC entry 1845 (class 0 OID 0)
-- Dependencies: 1524
-- Name: TABLE errores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE errores IS 'Errores';


--
-- TOC entry 1523 (class 1259 OID 33392)
-- Dependencies: 5 1524
-- Name: errores_id_err_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE errores_id_err_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.errores_id_err_seq OWNER TO postgres;

--
-- TOC entry 1846 (class 0 OID 0)
-- Dependencies: 1523
-- Name: errores_id_err_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE errores_id_err_seq OWNED BY errores.id_err;


--
-- TOC entry 1847 (class 0 OID 0)
-- Dependencies: 1523
-- Name: errores_id_err_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('errores_id_err_seq', 5, true);


--
-- TOC entry 1519 (class 1259 OID 33373)
-- Dependencies: 5
-- Name: lenguajes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lenguajes (
    id_len integer NOT NULL,
    nom_len character varying(50) NOT NULL
);


ALTER TABLE public.lenguajes OWNER TO postgres;

--
-- TOC entry 1848 (class 0 OID 0)
-- Dependencies: 1519
-- Name: TABLE lenguajes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lenguajes IS 'Lenguajes de progamacion';


--
-- TOC entry 1849 (class 0 OID 0)
-- Dependencies: 1519
-- Name: COLUMN lenguajes.id_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes.id_len IS 'Id del lenguaje';


--
-- TOC entry 1850 (class 0 OID 0)
-- Dependencies: 1519
-- Name: COLUMN lenguajes.nom_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes.nom_len IS 'Nombre del lenguaje';


--
-- TOC entry 1518 (class 1259 OID 33371)
-- Dependencies: 5 1519
-- Name: lenguajes_id_len_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lenguajes_id_len_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lenguajes_id_len_seq OWNER TO postgres;

--
-- TOC entry 1851 (class 0 OID 0)
-- Dependencies: 1518
-- Name: lenguajes_id_len_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lenguajes_id_len_seq OWNED BY lenguajes.id_len;


--
-- TOC entry 1852 (class 0 OID 0)
-- Dependencies: 1518
-- Name: lenguajes_id_len_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lenguajes_id_len_seq', 7, true);


--
-- TOC entry 1522 (class 1259 OID 33387)
-- Dependencies: 5
-- Name: lenguajes_proyectos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lenguajes_proyectos (
    id_pro integer NOT NULL,
    id_len integer NOT NULL,
    id_len_pro integer NOT NULL
);


ALTER TABLE public.lenguajes_proyectos OWNER TO postgres;

--
-- TOC entry 1853 (class 0 OID 0)
-- Dependencies: 1522
-- Name: TABLE lenguajes_proyectos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lenguajes_proyectos IS 'Lenguajes por proyectos';


--
-- TOC entry 1854 (class 0 OID 0)
-- Dependencies: 1522
-- Name: COLUMN lenguajes_proyectos.id_pro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes_proyectos.id_pro IS 'Identificador del proyecto';


--
-- TOC entry 1855 (class 0 OID 0)
-- Dependencies: 1522
-- Name: COLUMN lenguajes_proyectos.id_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes_proyectos.id_len IS 'Identificador del lenguaje';


--
-- TOC entry 1525 (class 1259 OID 33400)
-- Dependencies: 5 1522
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lenguajes_proyectos_id_len_pro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lenguajes_proyectos_id_len_pro_seq OWNER TO postgres;

--
-- TOC entry 1856 (class 0 OID 0)
-- Dependencies: 1525
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lenguajes_proyectos_id_len_pro_seq OWNED BY lenguajes_proyectos.id_len_pro;


--
-- TOC entry 1857 (class 0 OID 0)
-- Dependencies: 1525
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lenguajes_proyectos_id_len_pro_seq', 1, true);


--
-- TOC entry 1521 (class 1259 OID 33381)
-- Dependencies: 5
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyectos (
    id_pro integer NOT NULL,
    nom_pro character varying(50) NOT NULL
);


ALTER TABLE public.proyectos OWNER TO postgres;

--
-- TOC entry 1858 (class 0 OID 0)
-- Dependencies: 1521
-- Name: TABLE proyectos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE proyectos IS 'Proyectos donde se ven los errores.';


--
-- TOC entry 1520 (class 1259 OID 33379)
-- Dependencies: 1521 5
-- Name: proyectos_id_pro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyectos_id_pro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyectos_id_pro_seq OWNER TO postgres;

--
-- TOC entry 1859 (class 0 OID 0)
-- Dependencies: 1520
-- Name: proyectos_id_pro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyectos_id_pro_seq OWNED BY proyectos.id_pro;


--
-- TOC entry 1860 (class 0 OID 0)
-- Dependencies: 1520
-- Name: proyectos_id_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyectos_id_pro_seq', 3, true);


--
-- TOC entry 1517 (class 1259 OID 33360)
-- Dependencies: 1806 1807 5
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id_usu integer NOT NULL,
    login_usu character varying(50) NOT NULL,
    nom_usu character varying(50) NOT NULL,
    ape_usu character varying(50) DEFAULT 'n/a'::character varying NOT NULL,
    fec_reg timestamp with time zone DEFAULT now() NOT NULL,
    pas_usu character varying(150) NOT NULL,
    session character varying(150)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 1861 (class 0 OID 0)
-- Dependencies: 1517
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuarios IS 'Usuarios del sistema';


--
-- TOC entry 1862 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.id_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.id_usu IS 'Identificador del usuario';


--
-- TOC entry 1863 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.login_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.login_usu IS 'Login del usuario';


--
-- TOC entry 1864 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.nom_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.nom_usu IS 'Nombre del usuario';


--
-- TOC entry 1865 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.ape_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.ape_usu IS 'Apellido del usuario';


--
-- TOC entry 1866 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.fec_reg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.fec_reg IS 'Fecha de registro del usuario';


--
-- TOC entry 1867 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.pas_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.pas_usu IS 'Contraseña del usuario.';


--
-- TOC entry 1868 (class 0 OID 0)
-- Dependencies: 1517
-- Name: COLUMN usuarios.session; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.session IS 'Variable de session para validar el usuario logeado.';


--
-- TOC entry 1516 (class 1259 OID 33358)
-- Dependencies: 1517 5
-- Name: usuarios_id_usu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_usu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usu_seq OWNER TO postgres;

--
-- TOC entry 1869 (class 0 OID 0)
-- Dependencies: 1516
-- Name: usuarios_id_usu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_usu_seq OWNED BY usuarios.id_usu;


--
-- TOC entry 1870 (class 0 OID 0)
-- Dependencies: 1516
-- Name: usuarios_id_usu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_usu_seq', 1, true);


--
-- TOC entry 1813 (class 2604 OID 33438)
-- Dependencies: 1527 1526 1527
-- Name: id_det_err; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE detalles_errores ALTER COLUMN id_det_err SET DEFAULT nextval('detalles_errores_id_det_err_seq'::regclass);


--
-- TOC entry 1811 (class 2604 OID 33397)
-- Dependencies: 1523 1524 1524
-- Name: id_err; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE errores ALTER COLUMN id_err SET DEFAULT nextval('errores_id_err_seq'::regclass);


--
-- TOC entry 1808 (class 2604 OID 33376)
-- Dependencies: 1519 1518 1519
-- Name: id_len; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lenguajes ALTER COLUMN id_len SET DEFAULT nextval('lenguajes_id_len_seq'::regclass);


--
-- TOC entry 1810 (class 2604 OID 33402)
-- Dependencies: 1525 1522
-- Name: id_len_pro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lenguajes_proyectos ALTER COLUMN id_len_pro SET DEFAULT nextval('lenguajes_proyectos_id_len_pro_seq'::regclass);


--
-- TOC entry 1809 (class 2604 OID 33384)
-- Dependencies: 1520 1521 1521
-- Name: id_pro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE proyectos ALTER COLUMN id_pro SET DEFAULT nextval('proyectos_id_pro_seq'::regclass);


--
-- TOC entry 1805 (class 2604 OID 33363)
-- Dependencies: 1516 1517 1517
-- Name: id_usu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE usuarios ALTER COLUMN id_usu SET DEFAULT nextval('usuarios_id_usu_seq'::regclass);


--
-- TOC entry 1836 (class 0 OID 33435)
-- Dependencies: 1527
-- Data for Name: detalles_errores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1835 (class 0 OID 33394)
-- Dependencies: 1524
-- Data for Name: errores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO errores (id_err, des_err, fec_reg, id_len_pro) VALUES (5, 'Ora-3005 not data found', '2013-04-01 01:07:56.625-04:30', 1);


--
-- TOC entry 1832 (class 0 OID 33373)
-- Dependencies: 1519
-- Data for Name: lenguajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lenguajes (id_len, nom_len) VALUES (1, 'Java');
INSERT INTO lenguajes (id_len, nom_len) VALUES (2, 'PHP');
INSERT INTO lenguajes (id_len, nom_len) VALUES (3, 'PGSQL');
INSERT INTO lenguajes (id_len, nom_len) VALUES (4, 'PLSQL');
INSERT INTO lenguajes (id_len, nom_len) VALUES (5, 'Javascript');
INSERT INTO lenguajes (id_len, nom_len) VALUES (6, 'jQuery');
INSERT INTO lenguajes (id_len, nom_len) VALUES (7, 'ActionScript3.0');


--
-- TOC entry 1834 (class 0 OID 33387)
-- Dependencies: 1522
-- Data for Name: lenguajes_proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (2, 1, 1);


--
-- TOC entry 1833 (class 0 OID 33381)
-- Dependencies: 1521
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proyectos (id_pro, nom_pro) VALUES (1, 'SISCOA');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (2, 'ESTUDIANTE');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (3, 'JURIDICO');


--
-- TOC entry 1831 (class 0 OID 33360)
-- Dependencies: 1517
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuarios (id_usu, login_usu, nom_usu, ape_usu, fec_reg, pas_usu, session) VALUES (1, 'lmarin', 'Luis', 'Marin', '2013-03-24 21:40:42.353-04:30', 'da5723b88cb95d5e413010d262d87f37', '-0+**@101EncriPtando707-0+**@5154df748ef2c3.57410770');


--
-- TOC entry 1825 (class 2606 OID 33443)
-- Dependencies: 1527 1527
-- Name: detalles_errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_pkey PRIMARY KEY (id_det_err);


--
-- TOC entry 1823 (class 2606 OID 33399)
-- Dependencies: 1524 1524
-- Name: errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY errores
    ADD CONSTRAINT errores_pkey PRIMARY KEY (id_err);


--
-- TOC entry 1817 (class 2606 OID 33378)
-- Dependencies: 1519 1519
-- Name: lenguajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes
    ADD CONSTRAINT lenguajes_pkey PRIMARY KEY (id_len);


--
-- TOC entry 1821 (class 2606 OID 33407)
-- Dependencies: 1522 1522
-- Name: lenguajes_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_pkey PRIMARY KEY (id_len_pro);


--
-- TOC entry 1819 (class 2606 OID 33386)
-- Dependencies: 1521 1521
-- Name: proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id_pro);


--
-- TOC entry 1815 (class 2606 OID 33370)
-- Dependencies: 1517 1517
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usu);


--
-- TOC entry 1829 (class 2606 OID 33444)
-- Dependencies: 1527 1822 1524
-- Name: detalles_errores_id_err_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_id_err_fkey FOREIGN KEY (id_err) REFERENCES errores(id_err) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1830 (class 2606 OID 33449)
-- Dependencies: 1517 1527 1814
-- Name: detalles_errores_id_usu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_id_usu_fkey FOREIGN KEY (id_usu) REFERENCES usuarios(id_usu) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1828 (class 2606 OID 33428)
-- Dependencies: 1820 1522 1524
-- Name: errores_id_len_pro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errores
    ADD CONSTRAINT errores_id_len_pro_fkey FOREIGN KEY (id_len_pro) REFERENCES lenguajes_proyectos(id_len_pro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1826 (class 2606 OID 33418)
-- Dependencies: 1522 1816 1519
-- Name: lenguajes_proyectos_id_len_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_len_fkey FOREIGN KEY (id_len) REFERENCES lenguajes(id_len) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1827 (class 2606 OID 33423)
-- Dependencies: 1521 1818 1522
-- Name: lenguajes_proyectos_id_pro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_pro_fkey FOREIGN KEY (id_pro) REFERENCES proyectos(id_pro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1842 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-04-01 01:21:08

--
-- PostgreSQL database dump complete
--

