--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-03-16 16:24:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 197 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 197
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 16562)
-- Name: cruge_authassignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_authassignment (
    userid integer NOT NULL,
    bizrule text,
    data text,
    itemname character varying(64) NOT NULL
);


ALTER TABLE cruge_authassignment OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16554)
-- Name: cruge_authitem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_authitem (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    bizrule text,
    data text
);


ALTER TABLE cruge_authitem OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16580)
-- Name: cruge_authitemchild; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_authitemchild (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE cruge_authitemchild OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16518)
-- Name: cruge_field; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_field (
    idfield integer NOT NULL,
    fieldname character varying(20) NOT NULL,
    longname character varying(50),
    "position" integer DEFAULT 0,
    required integer DEFAULT 0,
    fieldtype integer DEFAULT 0,
    fieldsize integer DEFAULT 20,
    maxlength integer DEFAULT 45,
    showinreports integer DEFAULT 0,
    useregexp character varying(512),
    useregexpmsg character varying(512),
    predetvalue character varying(4096)
);


ALTER TABLE cruge_field OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16516)
-- Name: cruge_field_idfield_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_field_idfield_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cruge_field_idfield_seq OWNER TO postgres;

--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 190
-- Name: cruge_field_idfield_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_field_idfield_seq OWNED BY cruge_field.idfield;


--
-- TOC entry 193 (class 1259 OID 16535)
-- Name: cruge_fieldvalue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_fieldvalue (
    idfieldvalue integer NOT NULL,
    iduser integer NOT NULL,
    idfield integer NOT NULL,
    value character varying(4096)
);


ALTER TABLE cruge_fieldvalue OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16533)
-- Name: cruge_fieldvalue_idfieldvalue_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_fieldvalue_idfieldvalue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cruge_fieldvalue_idfieldvalue_seq OWNER TO postgres;

--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 192
-- Name: cruge_fieldvalue_idfieldvalue_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_fieldvalue_idfieldvalue_seq OWNED BY cruge_fieldvalue.idfieldvalue;


--
-- TOC entry 187 (class 1259 OID 16497)
-- Name: cruge_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_session (
    idsession integer NOT NULL,
    iduser integer NOT NULL,
    created bigint,
    expire bigint,
    status integer DEFAULT 0,
    ipaddress character varying(45),
    usagecount integer DEFAULT 0,
    lastusage bigint,
    logoutdate bigint,
    ipaddressout character varying(45)
);


ALTER TABLE cruge_session OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16495)
-- Name: cruge_session_idsession_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_session_idsession_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cruge_session_idsession_seq OWNER TO postgres;

--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 186
-- Name: cruge_session_idsession_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_session_idsession_seq OWNED BY cruge_session.idsession;


--
-- TOC entry 185 (class 1259 OID 16475)
-- Name: cruge_system; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_system (
    idsystem integer NOT NULL,
    name character varying(45),
    largename character varying(45),
    sessionmaxdurationmins integer DEFAULT 30,
    sessionmaxsameipconnections integer DEFAULT 10,
    sessionreusesessions integer DEFAULT 1,
    sessionmaxsessionsperday integer DEFAULT (-1),
    sessionmaxsessionsperuser integer DEFAULT (-1),
    systemnonewsessions integer DEFAULT 0,
    systemdown integer DEFAULT 0,
    registerusingcaptcha integer DEFAULT 0,
    registerusingterms integer DEFAULT 0,
    terms character varying(4096),
    registerusingactivation integer DEFAULT 1,
    defaultroleforregistration character varying(64),
    registerusingtermslabel character varying(100),
    registrationonlogin integer DEFAULT 1
);


ALTER TABLE cruge_system OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16473)
-- Name: cruge_system_idsystem_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_system_idsystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cruge_system_idsystem_seq OWNER TO postgres;

--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 184
-- Name: cruge_system_idsystem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_system_idsystem_seq OWNED BY cruge_system.idsystem;


--
-- TOC entry 189 (class 1259 OID 16507)
-- Name: cruge_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_user (
    iduser integer NOT NULL,
    regdate bigint,
    actdate bigint,
    logondate bigint,
    username character varying(64),
    email character varying(45),
    password character varying(64),
    authkey character varying(100),
    state integer DEFAULT 0,
    totalsessioncounter integer DEFAULT 0,
    currentsessioncounter integer DEFAULT 0
);


ALTER TABLE cruge_user OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16505)
-- Name: cruge_user_iduser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_user_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cruge_user_iduser_seq OWNER TO postgres;

--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 188
-- Name: cruge_user_iduser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_user_iduser_seq OWNED BY cruge_user.iduser;


--
-- TOC entry 172 (class 1259 OID 16394)
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


ALTER TABLE detalles_errores OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16400)
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalles_errores_id_det_err_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalles_errores_id_det_err_seq OWNER TO postgres;

--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 173
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalles_errores_id_det_err_seq OWNED BY detalles_errores.id_det_err;


--
-- TOC entry 174 (class 1259 OID 16402)
-- Name: errores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE errores (
    id_err integer NOT NULL,
    des_err character varying(300) NOT NULL,
    fec_reg timestamp with time zone DEFAULT now() NOT NULL,
    id_len_pro integer NOT NULL
);


ALTER TABLE errores OWNER TO postgres;

--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE errores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE errores IS 'Errores';


--
-- TOC entry 175 (class 1259 OID 16406)
-- Name: errores_id_err_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE errores_id_err_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE errores_id_err_seq OWNER TO postgres;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 175
-- Name: errores_id_err_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE errores_id_err_seq OWNED BY errores.id_err;


--
-- TOC entry 176 (class 1259 OID 16408)
-- Name: lenguajes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lenguajes (
    id_len integer NOT NULL,
    nom_len character varying(50) NOT NULL
);


ALTER TABLE lenguajes OWNER TO postgres;

--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE lenguajes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lenguajes IS 'Lenguajes de progamacion';


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN lenguajes.id_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes.id_len IS 'Id del lenguaje';


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN lenguajes.nom_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes.nom_len IS 'Nombre del lenguaje';


--
-- TOC entry 177 (class 1259 OID 16411)
-- Name: lenguajes_id_len_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lenguajes_id_len_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lenguajes_id_len_seq OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 177
-- Name: lenguajes_id_len_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lenguajes_id_len_seq OWNED BY lenguajes.id_len;


--
-- TOC entry 178 (class 1259 OID 16413)
-- Name: lenguajes_proyectos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lenguajes_proyectos (
    id_pro integer NOT NULL,
    id_len integer NOT NULL,
    id_len_pro integer NOT NULL
);


ALTER TABLE lenguajes_proyectos OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE lenguajes_proyectos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lenguajes_proyectos IS 'Lenguajes por proyectos';


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN lenguajes_proyectos.id_pro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes_proyectos.id_pro IS 'Identificador del proyecto';


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN lenguajes_proyectos.id_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes_proyectos.id_len IS 'Identificador del lenguaje';


--
-- TOC entry 179 (class 1259 OID 16416)
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lenguajes_proyectos_id_len_pro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lenguajes_proyectos_id_len_pro_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 179
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lenguajes_proyectos_id_len_pro_seq OWNED BY lenguajes_proyectos.id_len_pro;


--
-- TOC entry 180 (class 1259 OID 16418)
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyectos (
    id_pro integer NOT NULL,
    nom_pro character varying(50) NOT NULL
);


ALTER TABLE proyectos OWNER TO postgres;

--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE proyectos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE proyectos IS 'Proyectos donde se ven los errores.';


--
-- TOC entry 181 (class 1259 OID 16421)
-- Name: proyectos_id_pro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyectos_id_pro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proyectos_id_pro_seq OWNER TO postgres;

--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 181
-- Name: proyectos_id_pro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyectos_id_pro_seq OWNED BY proyectos.id_pro;


--
-- TOC entry 182 (class 1259 OID 16423)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id_usu integer NOT NULL,
    login_usu character varying(50) NOT NULL,
    nom_usu character varying(50) NOT NULL,
    ape_usu character varying(50) DEFAULT 'n/a'::character varying NOT NULL,
    fec_reg timestamp with time zone DEFAULT now() NOT NULL,
    pas_usu character varying(150) NOT NULL,
    session character varying(150),
    iduser integer
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuarios IS 'Usuarios del sistema';


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.id_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.id_usu IS 'Identificador del usuario';


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.login_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.login_usu IS 'Login del usuario';


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.nom_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.nom_usu IS 'Nombre del usuario';


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.ape_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.ape_usu IS 'Apellido del usuario';


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.fec_reg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.fec_reg IS 'Fecha de registro del usuario';


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.pas_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.pas_usu IS 'Contraseña del usuario.';


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN usuarios.session; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.session IS 'Variable de session para validar el usuario logeado.';


--
-- TOC entry 183 (class 1259 OID 16428)
-- Name: usuarios_id_usu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_usu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_id_usu_seq OWNER TO postgres;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 183
-- Name: usuarios_id_usu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_usu_seq OWNED BY usuarios.id_usu;


--
-- TOC entry 1987 (class 2604 OID 16521)
-- Name: idfield; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_field ALTER COLUMN idfield SET DEFAULT nextval('cruge_field_idfield_seq'::regclass);


--
-- TOC entry 1994 (class 2604 OID 16538)
-- Name: idfieldvalue; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_fieldvalue ALTER COLUMN idfieldvalue SET DEFAULT nextval('cruge_fieldvalue_idfieldvalue_seq'::regclass);


--
-- TOC entry 1980 (class 2604 OID 16500)
-- Name: idsession; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_session ALTER COLUMN idsession SET DEFAULT nextval('cruge_session_idsession_seq'::regclass);


--
-- TOC entry 1968 (class 2604 OID 16478)
-- Name: idsystem; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_system ALTER COLUMN idsystem SET DEFAULT nextval('cruge_system_idsystem_seq'::regclass);


--
-- TOC entry 1983 (class 2604 OID 16510)
-- Name: iduser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_user ALTER COLUMN iduser SET DEFAULT nextval('cruge_user_iduser_seq'::regclass);


--
-- TOC entry 1959 (class 2604 OID 16430)
-- Name: id_det_err; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores ALTER COLUMN id_det_err SET DEFAULT nextval('detalles_errores_id_det_err_seq'::regclass);


--
-- TOC entry 1961 (class 2604 OID 16431)
-- Name: id_err; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errores ALTER COLUMN id_err SET DEFAULT nextval('errores_id_err_seq'::regclass);


--
-- TOC entry 1962 (class 2604 OID 16432)
-- Name: id_len; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes ALTER COLUMN id_len SET DEFAULT nextval('lenguajes_id_len_seq'::regclass);


--
-- TOC entry 1963 (class 2604 OID 16433)
-- Name: id_len_pro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos ALTER COLUMN id_len_pro SET DEFAULT nextval('lenguajes_proyectos_id_len_pro_seq'::regclass);


--
-- TOC entry 1964 (class 2604 OID 16434)
-- Name: id_pro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyectos ALTER COLUMN id_pro SET DEFAULT nextval('proyectos_id_pro_seq'::regclass);


--
-- TOC entry 1967 (class 2604 OID 16435)
-- Name: id_usu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usu SET DEFAULT nextval('usuarios_id_usu_seq'::regclass);


--
-- TOC entry 2166 (class 0 OID 16562)
-- Dependencies: 195
-- Data for Name: cruge_authassignment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2165 (class 0 OID 16554)
-- Dependencies: 194
-- Data for Name: cruge_authitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_index', 0, '', NULL, 'N;');


--
-- TOC entry 2167 (class 0 OID 16580)
-- Dependencies: 196
-- Data for Name: cruge_authitemchild; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2162 (class 0 OID 16518)
-- Dependencies: 191
-- Data for Name: cruge_field; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 190
-- Name: cruge_field_idfield_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_field_idfield_seq', 1, false);


--
-- TOC entry 2164 (class 0 OID 16535)
-- Dependencies: 193
-- Data for Name: cruge_fieldvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 192
-- Name: cruge_fieldvalue_idfieldvalue_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_fieldvalue_idfieldvalue_seq', 1, false);


--
-- TOC entry 2158 (class 0 OID 16497)
-- Dependencies: 187
-- Data for Name: cruge_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (1, 1, 1426538653, 1426540453, 1, '::1', 1, 1426538653, NULL, NULL);


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 186
-- Name: cruge_session_idsession_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_session_idsession_seq', 1, true);


--
-- TOC entry 2156 (class 0 OID 16475)
-- Dependencies: 185
-- Data for Name: cruge_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_system (idsystem, name, largename, sessionmaxdurationmins, sessionmaxsameipconnections, sessionreusesessions, sessionmaxsessionsperday, sessionmaxsessionsperuser, systemnonewsessions, systemdown, registerusingcaptcha, registerusingterms, terms, registerusingactivation, defaultroleforregistration, registerusingtermslabel, registrationonlogin) VALUES (1, 'default', NULL, 30, 10, 1, -1, -1, 0, 0, 0, 0, '', 0, '', '', 1);


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 184
-- Name: cruge_system_idsystem_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_system_idsystem_seq', 1, false);


--
-- TOC entry 2160 (class 0 OID 16507)
-- Dependencies: 189
-- Data for Name: cruge_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_user (iduser, regdate, actdate, logondate, username, email, password, authkey, state, totalsessioncounter, currentsessioncounter) VALUES (2, NULL, NULL, NULL, 'invitado', 'invitado', 'nopassword', NULL, 1, 0, 0);
INSERT INTO cruge_user (iduser, regdate, actdate, logondate, username, email, password, authkey, state, totalsessioncounter, currentsessioncounter) VALUES (1, NULL, NULL, 1426538653, 'admin', 'admin@tucorreo.com', 'admin', NULL, 1, 0, 0);


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 188
-- Name: cruge_user_iduser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_user_iduser_seq', 2, true);


--
-- TOC entry 2143 (class 0 OID 16394)
-- Dependencies: 172
-- Data for Name: detalles_errores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 173
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalles_errores_id_det_err_seq', 1, false);


--
-- TOC entry 2145 (class 0 OID 16402)
-- Dependencies: 174
-- Data for Name: errores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO errores (id_err, des_err, fec_reg, id_len_pro) VALUES (5, 'Ora-3005 not data found', '2013-04-01 01:07:56.625-04:30', 1);
INSERT INTO errores (id_err, des_err, fec_reg, id_len_pro) VALUES (6, 'no sirve a nada', '2015-03-16 16:17:32.174-04:30', 2);


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 175
-- Name: errores_id_err_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('errores_id_err_seq', 6, true);


--
-- TOC entry 2147 (class 0 OID 16408)
-- Dependencies: 176
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
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 177
-- Name: lenguajes_id_len_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lenguajes_id_len_seq', 7, true);


--
-- TOC entry 2149 (class 0 OID 16413)
-- Dependencies: 178
-- Data for Name: lenguajes_proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (2, 1, 1);
INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (4, 2, 2);


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 179
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lenguajes_proyectos_id_len_pro_seq', 2, true);


--
-- TOC entry 2151 (class 0 OID 16418)
-- Dependencies: 180
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proyectos (id_pro, nom_pro) VALUES (1, 'SISCOA');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (2, 'ESTUDIANTE');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (3, 'JURIDICO');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (4, 'brigstone');


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 181
-- Name: proyectos_id_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyectos_id_pro_seq', 4, true);


--
-- TOC entry 2153 (class 0 OID 16423)
-- Dependencies: 182
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuarios (id_usu, login_usu, nom_usu, ape_usu, fec_reg, pas_usu, session, iduser) VALUES (1, 'lmarin', 'Luis', 'Marin', '2013-03-24 21:40:42.353-04:30', 'da5723b88cb95d5e413010d262d87f37', '-0+**@101EncriPtando707-0+**@5154df748ef2c3.57410770', 1);


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 183
-- Name: usuarios_id_usu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_usu_seq', 1, true);


--
-- TOC entry 2020 (class 2606 OID 16569)
-- Name: cruge_authassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_authassignment
    ADD CONSTRAINT cruge_authassignment_pkey PRIMARY KEY (userid, itemname);


--
-- TOC entry 2018 (class 2606 OID 16561)
-- Name: cruge_authitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_authitem
    ADD CONSTRAINT cruge_authitem_pkey PRIMARY KEY (name);


--
-- TOC entry 2022 (class 2606 OID 16584)
-- Name: cruge_authitemchild_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_authitemchild
    ADD CONSTRAINT cruge_authitemchild_pkey PRIMARY KEY (parent, child);


--
-- TOC entry 2014 (class 2606 OID 16532)
-- Name: cruge_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_field
    ADD CONSTRAINT cruge_field_pkey PRIMARY KEY (idfield);


--
-- TOC entry 2016 (class 2606 OID 16543)
-- Name: cruge_fieldvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_fieldvalue
    ADD CONSTRAINT cruge_fieldvalue_pkey PRIMARY KEY (idfieldvalue);


--
-- TOC entry 2010 (class 2606 OID 16504)
-- Name: cruge_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_session
    ADD CONSTRAINT cruge_session_pkey PRIMARY KEY (idsession);


--
-- TOC entry 2008 (class 2606 OID 16494)
-- Name: cruge_system_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_system
    ADD CONSTRAINT cruge_system_pkey PRIMARY KEY (idsystem);


--
-- TOC entry 2012 (class 2606 OID 16515)
-- Name: cruge_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_user
    ADD CONSTRAINT cruge_user_pkey PRIMARY KEY (iduser);


--
-- TOC entry 1996 (class 2606 OID 16437)
-- Name: detalles_errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_pkey PRIMARY KEY (id_det_err);


--
-- TOC entry 1998 (class 2606 OID 16439)
-- Name: errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY errores
    ADD CONSTRAINT errores_pkey PRIMARY KEY (id_err);


--
-- TOC entry 2000 (class 2606 OID 16441)
-- Name: lenguajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes
    ADD CONSTRAINT lenguajes_pkey PRIMARY KEY (id_len);


--
-- TOC entry 2002 (class 2606 OID 16443)
-- Name: lenguajes_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_pkey PRIMARY KEY (id_len_pro);


--
-- TOC entry 2004 (class 2606 OID 16445)
-- Name: proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id_pro);


--
-- TOC entry 2006 (class 2606 OID 16447)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usu);


--
-- TOC entry 2032 (class 2606 OID 16585)
-- Name: crugeauthitemchild_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authitemchild
    ADD CONSTRAINT crugeauthitemchild_ibfk_1 FOREIGN KEY (parent) REFERENCES cruge_authitem(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2033 (class 2606 OID 16590)
-- Name: crugeauthitemchild_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authitemchild
    ADD CONSTRAINT crugeauthitemchild_ibfk_2 FOREIGN KEY (child) REFERENCES cruge_authitem(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2023 (class 2606 OID 16448)
-- Name: detalles_errores_id_err_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_id_err_fkey FOREIGN KEY (id_err) REFERENCES errores(id_err) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2024 (class 2606 OID 16453)
-- Name: detalles_errores_id_usu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_id_usu_fkey FOREIGN KEY (id_usu) REFERENCES usuarios(id_usu) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2025 (class 2606 OID 16458)
-- Name: errores_id_len_pro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errores
    ADD CONSTRAINT errores_id_len_pro_fkey FOREIGN KEY (id_len_pro) REFERENCES lenguajes_proyectos(id_len_pro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2030 (class 2606 OID 16570)
-- Name: fk_cruge_authassignment_cruge_authitem1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authassignment
    ADD CONSTRAINT fk_cruge_authassignment_cruge_authitem1 FOREIGN KEY (itemname) REFERENCES cruge_authitem(name);


--
-- TOC entry 2031 (class 2606 OID 16575)
-- Name: fk_cruge_authassignment_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authassignment
    ADD CONSTRAINT fk_cruge_authassignment_user FOREIGN KEY (userid) REFERENCES cruge_user(iduser) ON DELETE CASCADE;


--
-- TOC entry 2029 (class 2606 OID 16549)
-- Name: fk_cruge_fieldvalue_cruge_field1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_fieldvalue
    ADD CONSTRAINT fk_cruge_fieldvalue_cruge_field1 FOREIGN KEY (idfield) REFERENCES cruge_field(idfield) ON DELETE CASCADE;


--
-- TOC entry 2028 (class 2606 OID 16544)
-- Name: fk_cruge_fieldvalue_cruge_user1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_fieldvalue
    ADD CONSTRAINT fk_cruge_fieldvalue_cruge_user1 FOREIGN KEY (iduser) REFERENCES cruge_user(iduser) ON DELETE CASCADE;


--
-- TOC entry 2026 (class 2606 OID 16463)
-- Name: lenguajes_proyectos_id_len_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_len_fkey FOREIGN KEY (id_len) REFERENCES lenguajes(id_len) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2027 (class 2606 OID 16468)
-- Name: lenguajes_proyectos_id_pro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_pro_fkey FOREIGN KEY (id_pro) REFERENCES proyectos(id_pro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-03-16 16:24:03

--
-- PostgreSQL database dump complete
--

