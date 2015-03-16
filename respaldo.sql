--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.2.4
-- Started on 2013-05-02 00:14:18

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 193 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 193
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 24596)
-- Name: cruge_authassignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_authassignment (
    userid integer NOT NULL,
    bizrule text,
    data text,
    itemname character varying(64) NOT NULL
);


ALTER TABLE public.cruge_authassignment OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 24602)
-- Name: cruge_authitem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_authitem (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    bizrule text,
    data text
);


ALTER TABLE public.cruge_authitem OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 24608)
-- Name: cruge_authitemchild; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_authitemchild (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE public.cruge_authitemchild OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 24611)
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


ALTER TABLE public.cruge_field OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 24623)
-- Name: cruge_field_idfield_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_field_idfield_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cruge_field_idfield_seq OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 172
-- Name: cruge_field_idfield_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_field_idfield_seq OWNED BY cruge_field.idfield;


--
-- TOC entry 173 (class 1259 OID 24625)
-- Name: cruge_fieldvalue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cruge_fieldvalue (
    idfieldvalue integer NOT NULL,
    iduser integer NOT NULL,
    idfield integer NOT NULL,
    value character varying(4096)
);


ALTER TABLE public.cruge_fieldvalue OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24631)
-- Name: cruge_fieldvalue_idfieldvalue_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_fieldvalue_idfieldvalue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cruge_fieldvalue_idfieldvalue_seq OWNER TO postgres;

--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 174
-- Name: cruge_fieldvalue_idfieldvalue_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_fieldvalue_idfieldvalue_seq OWNED BY cruge_fieldvalue.idfieldvalue;


--
-- TOC entry 175 (class 1259 OID 24633)
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


ALTER TABLE public.cruge_session OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24638)
-- Name: cruge_session_idsession_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_session_idsession_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cruge_session_idsession_seq OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 176
-- Name: cruge_session_idsession_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_session_idsession_seq OWNED BY cruge_session.idsession;


--
-- TOC entry 177 (class 1259 OID 24640)
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


ALTER TABLE public.cruge_system OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 24657)
-- Name: cruge_system_idsystem_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_system_idsystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cruge_system_idsystem_seq OWNER TO postgres;

--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 178
-- Name: cruge_system_idsystem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_system_idsystem_seq OWNED BY cruge_system.idsystem;


--
-- TOC entry 179 (class 1259 OID 24659)
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


ALTER TABLE public.cruge_user OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 24665)
-- Name: cruge_user_iduser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cruge_user_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cruge_user_iduser_seq OWNER TO postgres;

--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 180
-- Name: cruge_user_iduser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cruge_user_iduser_seq OWNED BY cruge_user.iduser;


--
-- TOC entry 181 (class 1259 OID 24667)
-- Name: detalles_errores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalles_errores (
    id_det_err integer NOT NULL,
    num_inc integer,
    det_err text NOT NULL,
    fec_reg timestamp without time zone NOT NULL,
    id_err integer NOT NULL,
    id_usu integer NOT NULL,
    tit_err character varying(50) NOT NULL
);


ALTER TABLE public.detalles_errores OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24673)
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
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 182
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalles_errores_id_det_err_seq OWNED BY detalles_errores.id_det_err;


--
-- TOC entry 183 (class 1259 OID 24675)
-- Name: errores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE errores (
    id_err integer NOT NULL,
    des_err character varying(300) NOT NULL,
    fec_reg timestamp without time zone DEFAULT now() NOT NULL,
    id_len_pro integer NOT NULL
);


ALTER TABLE public.errores OWNER TO postgres;

--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE errores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE errores IS 'Errores';


--
-- TOC entry 184 (class 1259 OID 24679)
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
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 184
-- Name: errores_id_err_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE errores_id_err_seq OWNED BY errores.id_err;


--
-- TOC entry 185 (class 1259 OID 24681)
-- Name: lenguajes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lenguajes (
    id_len integer NOT NULL,
    nom_len character varying(50) NOT NULL
);


ALTER TABLE public.lenguajes OWNER TO postgres;

--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE lenguajes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lenguajes IS 'Lenguajes de progamacion';


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN lenguajes.id_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes.id_len IS 'Id del lenguaje';


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN lenguajes.nom_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes.nom_len IS 'Nombre del lenguaje';


--
-- TOC entry 186 (class 1259 OID 24684)
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
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 186
-- Name: lenguajes_id_len_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lenguajes_id_len_seq OWNED BY lenguajes.id_len;


--
-- TOC entry 187 (class 1259 OID 24686)
-- Name: lenguajes_proyectos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lenguajes_proyectos (
    id_pro integer NOT NULL,
    id_len integer NOT NULL,
    id_len_pro integer NOT NULL
);


ALTER TABLE public.lenguajes_proyectos OWNER TO postgres;

--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE lenguajes_proyectos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lenguajes_proyectos IS 'Lenguajes por proyectos';


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN lenguajes_proyectos.id_pro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes_proyectos.id_pro IS 'Identificador del proyecto';


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN lenguajes_proyectos.id_len; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lenguajes_proyectos.id_len IS 'Identificador del lenguaje';


--
-- TOC entry 188 (class 1259 OID 24689)
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
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 188
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lenguajes_proyectos_id_len_pro_seq OWNED BY lenguajes_proyectos.id_len_pro;


--
-- TOC entry 189 (class 1259 OID 24691)
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyectos (
    id_pro integer NOT NULL,
    nom_pro character varying(50) NOT NULL
);


ALTER TABLE public.proyectos OWNER TO postgres;

--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE proyectos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE proyectos IS 'Proyectos donde se ven los errores.';


--
-- TOC entry 190 (class 1259 OID 24694)
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
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 190
-- Name: proyectos_id_pro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyectos_id_pro_seq OWNED BY proyectos.id_pro;


--
-- TOC entry 191 (class 1259 OID 24696)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id_usu integer NOT NULL,
    nom_usu character varying(50) NOT NULL,
    ape_usu character varying(50) DEFAULT 'n/a'::character varying NOT NULL,
    fec_reg timestamp without time zone DEFAULT now() NOT NULL,
    iduser integer NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE usuarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuarios IS 'Usuarios del sistema';


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN usuarios.id_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.id_usu IS 'Identificador del usuario';


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN usuarios.nom_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.nom_usu IS 'Nombre del usuario';


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN usuarios.ape_usu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.ape_usu IS 'Apellido del usuario';


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN usuarios.fec_reg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuarios.fec_reg IS 'Fecha de registro del usuario';


--
-- TOC entry 192 (class 1259 OID 24701)
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
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 192
-- Name: usuarios_id_usu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_usu_seq OWNED BY usuarios.id_usu;


--
-- TOC entry 2000 (class 2604 OID 24703)
-- Name: idfield; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_field ALTER COLUMN idfield SET DEFAULT nextval('cruge_field_idfield_seq'::regclass);


--
-- TOC entry 2001 (class 2604 OID 24704)
-- Name: idfieldvalue; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_fieldvalue ALTER COLUMN idfieldvalue SET DEFAULT nextval('cruge_fieldvalue_idfieldvalue_seq'::regclass);


--
-- TOC entry 2004 (class 2604 OID 24705)
-- Name: idsession; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_session ALTER COLUMN idsession SET DEFAULT nextval('cruge_session_idsession_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 24706)
-- Name: idsystem; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_system ALTER COLUMN idsystem SET DEFAULT nextval('cruge_system_idsystem_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 24707)
-- Name: iduser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_user ALTER COLUMN iduser SET DEFAULT nextval('cruge_user_iduser_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 24708)
-- Name: id_det_err; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores ALTER COLUMN id_det_err SET DEFAULT nextval('detalles_errores_id_det_err_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 24709)
-- Name: id_err; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errores ALTER COLUMN id_err SET DEFAULT nextval('errores_id_err_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 24710)
-- Name: id_len; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes ALTER COLUMN id_len SET DEFAULT nextval('lenguajes_id_len_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 24711)
-- Name: id_len_pro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos ALTER COLUMN id_len_pro SET DEFAULT nextval('lenguajes_proyectos_id_len_pro_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 24712)
-- Name: id_pro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyectos ALTER COLUMN id_pro SET DEFAULT nextval('proyectos_id_pro_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 24713)
-- Name: id_usu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usu SET DEFAULT nextval('usuarios_id_usu_seq'::regclass);


--
-- TOC entry 2074 (class 0 OID 24596)
-- Dependencies: 168
-- Data for Name: cruge_authassignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_authassignment (userid, bizrule, data, itemname) VALUES (3, NULL, 'N;', 'todo');


--
-- TOC entry 2075 (class 0 OID 24602)
-- Dependencies: 169
-- Data for Name: cruge_authitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_rbaclistops', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_detalleserrores', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_detalleserrores_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_detalleserrores_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_detalleserrores_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_detalleserrores_delete', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_detalleserrores_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_detalleserrores_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_errores', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_delete', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_errores_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_lenguajes', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_delete', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajes_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_lenguajesproyectos', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesproyectos_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesproyectos_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesproyectos_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesproyectos_delete', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesproyectos_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesproyectos_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_proyectos', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_delete', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_proyectos_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_site', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_site_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_site_error', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_site_contact', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_site_login', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_site_logout', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('controller_usuarios', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_usuarios_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_usuarios_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_usuarios_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_usuarios_delete', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_usuarios_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_usuarios_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_usermanagementadmin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_usermanagementupdate', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('edit-advanced-profile-features', 0, 'C:\\wamp\\www\\bugger\\bugs\\protected\\modules\\cruge\\views\\ui\\usermanagementupdate.php linea 114', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_rbaclistroles', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_rbacauthitemcreate', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('todo', 2, '', '', 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_rbacauthitemchilditems', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_rbacajaxsetchilditem', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_rbacajaxassignment', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_admin', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_create', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_view', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_index', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_lenguajesProyectos_update', 0, '', NULL, 'N;');
INSERT INTO cruge_authitem (name, type, description, bizrule, data) VALUES ('action_ui_usermanagementcreate', 0, '', NULL, 'N;');


--
-- TOC entry 2076 (class 0 OID 24608)
-- Dependencies: 170
-- Data for Name: cruge_authitemchild; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_authitemchild (parent, child) VALUES ('todo', 'controller_site');
INSERT INTO cruge_authitemchild (parent, child) VALUES ('todo', 'action_errores_admin');


--
-- TOC entry 2077 (class 0 OID 24611)
-- Dependencies: 171
-- Data for Name: cruge_field; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 172
-- Name: cruge_field_idfield_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_field_idfield_seq', 1, false);


--
-- TOC entry 2079 (class 0 OID 24625)
-- Dependencies: 173
-- Data for Name: cruge_fieldvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 174
-- Name: cruge_fieldvalue_idfieldvalue_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_fieldvalue_idfieldvalue_seq', 1, false);


--
-- TOC entry 2081 (class 0 OID 24633)
-- Dependencies: 175
-- Data for Name: cruge_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (12, 1, 1366519716, 1366521516, 0, '127.0.0.1', 1, 1366519716, 1366519752, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (47, 1, 1367198668, 1367200468, 0, '127.0.0.1', 1, 1367198668, 1367199344, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (31, 1, 1366943396, 1366945196, 0, '127.0.0.1', 1, 1366943396, 1366944119, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (16, 1, 1366522716, 1366524516, 0, '127.0.0.1', 1, 1366522716, 1366522750, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (4, 1, 1366497107, 1366498907, 0, '127.0.0.1', 1, 1366497107, 1366497150, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (1, 1, 1366494368, 1366496168, 0, '127.0.0.1', 1, 1366494368, 1366495795, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (21, 1, 1366523239, 1366525039, 0, '127.0.0.1', 1, 1366523239, 1366523257, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (13, 1, 1366519793, 1366521593, 0, '127.0.0.1', 1, 1366519793, 1366519802, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (26, 1, 1366523419, 1366525219, 0, '127.0.0.1', 1, 1366523419, 1366523505, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (5, 1, 1366497223, 1366499023, 0, '127.0.0.1', 1, 1366497223, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (17, 1, 1366522968, 1366524768, 0, '127.0.0.1', 1, 1366522968, 1366523011, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (41, 1, 1367193266, 1367195066, 0, '127.0.0.1', 1, 1367193266, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (14, 1, 1366520832, 1366522632, 0, '127.0.0.1', 1, 1366520832, 1366520957, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (6, 1, 1366499469, 1366501269, 0, '127.0.0.1', 1, 1366499469, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (52, 3, 1367200240, 1367202040, 0, '127.0.0.1', 1, 1367200240, 1367200262, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (22, 1, 1366523262, 1366525062, 0, '127.0.0.1', 1, 1366523262, 1366523277, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (32, 1, 1366944125, 1366945925, 0, '127.0.0.1', 1, 1366944125, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (33, 1, 1366946086, 1366947886, 1, '127.0.0.1', 1, 1366946086, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (7, 1, 1366503845, 1366505645, 0, '127.0.0.1', 1, 1366503845, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (27, 1, 1366523510, 1366525310, 0, '127.0.0.1', 1, 1366523510, 1366524150, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (28, 1, 1366524155, 1366525955, 1, '127.0.0.1', 1, 1366524155, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (23, 1, 1366523283, 1366525083, 0, '127.0.0.1', 1, 1366523283, 1366523312, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (8, 1, 1366507000, 1366508800, 0, '127.0.0.1', 1, 1366507000, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (2, 1, 1366495811, 1366497611, 0, '127.0.0.1', 1, 1366495811, 1366495895, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (15, 1, 1366520968, 1366522768, 0, '127.0.0.1', 1, 1366520968, 1366521760, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (50, 3, 1367199616, 1367201416, 0, '127.0.0.1', 1, 1367199616, 1367199834, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (45, 1, 1367198520, 1367200320, 0, '127.0.0.1', 1, 1367198520, 1367198622, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (18, 1, 1366523019, 1366524819, 0, '127.0.0.1', 1, 1366523019, 1366523067, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (3, 1, 1366496767, 1366498567, 0, '127.0.0.1', 1, 1366496767, 1366497102, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (9, 1, 1366514505, 1366516305, 0, '127.0.0.1', 1, 1366514505, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (11, 1, 1366518899, 1366520699, 0, '127.0.0.1', 1, 1366518899, 1366519126, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (42, 1, 1367195134, 1367196934, 0, '127.0.0.1', 1, 1367195134, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (34, 1, 1367176802, 1367178602, 0, '127.0.0.1', 1, 1367176802, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (24, 1, 1366523318, 1366525118, 0, '127.0.0.1', 1, 1366523318, 1366523379, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (19, 1, 1366523123, 1366524923, 0, '127.0.0.1', 1, 1366523123, 1366523195, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (38, 1, 1367185358, 1367187158, 0, '127.0.0.1', 1, 1367185358, 1367185713, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (10, 1, 1366517098, 1366518898, 0, '127.0.0.1', 1, 1366517098, 1366518886, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (29, 1, 1366941214, 1366943014, 0, '127.0.0.1', 1, 1366941214, 1366941228, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (48, 3, 1367199348, 1367201148, 0, '127.0.0.1', 1, 1367199348, 1367199549, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (20, 1, 1366523199, 1366524999, 0, '127.0.0.1', 1, 1366523199, 1366523234, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (35, 1, 1367179446, 1367181246, 0, '127.0.0.1', 1, 1367179446, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (55, 3, 1367200773, 1367202573, 0, '127.0.0.1', 2, 1367200815, 1367200913, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (25, 1, 1366523384, 1366525184, 0, '127.0.0.1', 1, 1366523384, 1366523408, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (39, 1, 1367185744, 1367187544, 0, '127.0.0.1', 1, 1367185744, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (30, 1, 1366941506, 1366943306, 0, '127.0.0.1', 2, 1366942489, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (54, 1, 1367200420, 1367202220, 0, '127.0.0.1', 1, 1367200420, 1367200740, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (43, 1, 1367197003, 1367198803, 0, '127.0.0.1', 1, 1367197003, 1367198449, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (36, 1, 1367181497, 1367183297, 0, '127.0.0.1', 1, 1367181497, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (46, 3, 1367198628, 1367200428, 0, '127.0.0.1', 1, 1367198628, 1367198659, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (40, 1, 1367188911, 1367190711, 0, '127.0.0.1', 1, 1367188911, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (57, 3, 1367200920, 1367202720, 0, '127.0.0.1', 1, 1367200920, 1367201151, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (37, 1, 1367183445, 1367185245, 0, '127.0.0.1', 1, 1367183445, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (51, 3, 1367199837, 1367201637, 0, '127.0.0.1', 1, 1367199837, 1367200236, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (49, 1, 1367199556, 1367201356, 0, '127.0.0.1', 1, 1367199556, 1367199613, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (44, 3, 1367198455, 1367200255, 0, '127.0.0.1', 1, 1367198455, 1367198511, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (53, 3, 1367200279, 1367202079, 0, '127.0.0.1', 1, 1367200279, 1367200399, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (61, 3, 1367201687, 1367203487, 0, '127.0.0.1', 1, 1367201687, 1367203057, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (58, 3, 1367201158, 1367202958, 0, '127.0.0.1', 1, 1367201158, 1367201370, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (63, 3, 1367203062, 1367204862, 0, '127.0.0.1', 1, 1367203062, 1367203325, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (59, 3, 1367201377, 1367203177, 0, '127.0.0.1', 1, 1367201377, 1367201435, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (56, 1, 1367200877, 1367202677, 0, '127.0.0.1', 1, 1367200877, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (60, 3, 1367201573, 1367203373, 0, '127.0.0.1', 1, 1367201573, 1367201673, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (68, 2, 1367204163, 1367205963, 1, '127.0.0.1', 1, 1367204163, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (64, 3, 1367203330, 1367205130, 0, '127.0.0.1', 1, 1367203330, 1367203373, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (65, 3, 1367203378, 1367205178, 0, '127.0.0.1', 1, 1367203378, 1367203394, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (67, 3, 1367204103, 1367205903, 0, '127.0.0.1', 1, 1367204103, 1367204113, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (66, 3, 1367203398, 1367205198, 0, '127.0.0.1', 1, 1367203398, 1367204098, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (69, 3, 1367204393, 1367206193, 1, '127.0.0.1', 1, 1367204393, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (62, 1, 1367202924, 1367204724, 0, '127.0.0.1', 1, 1367202924, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (70, 1, 1367204734, 1367206534, 0, '127.0.0.1', 1, 1367204734, 1367205360, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (71, 1, 1367206662, 1367208462, 0, '127.0.0.1', 1, 1367206662, 1367206668, '127.0.0.1');
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (72, 1, 1367443310, 1367445110, 0, '127.0.0.1', 1, 1367443310, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (73, 1, 1367445133, 1367446933, 0, '127.0.0.1', 1, 1367445133, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (74, 1, 1367447676, 1367449476, 0, '127.0.0.1', 1, 1367447676, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (76, 1, 1367451421, 1367453221, 1, '127.0.0.1', 1, 1367451421, NULL, NULL);
INSERT INTO cruge_session (idsession, iduser, created, expire, status, ipaddress, usagecount, lastusage, logoutdate, ipaddressout) VALUES (75, 1, 1367449553, 1367451353, 0, '127.0.0.1', 1, 1367449553, NULL, NULL);


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 176
-- Name: cruge_session_idsession_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_session_idsession_seq', 76, true);


--
-- TOC entry 2083 (class 0 OID 24640)
-- Dependencies: 177
-- Data for Name: cruge_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_system (idsystem, name, largename, sessionmaxdurationmins, sessionmaxsameipconnections, sessionreusesessions, sessionmaxsessionsperday, sessionmaxsessionsperuser, systemnonewsessions, systemdown, registerusingcaptcha, registerusingterms, terms, registerusingactivation, defaultroleforregistration, registerusingtermslabel, registrationonlogin) VALUES (1, 'default', NULL, 30, 10, 1, -1, -1, 0, 0, 0, 0, '', 0, '', '', 1);


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 178
-- Name: cruge_system_idsystem_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_system_idsystem_seq', 1, false);


--
-- TOC entry 2085 (class 0 OID 24659)
-- Dependencies: 179
-- Data for Name: cruge_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cruge_user (iduser, regdate, actdate, logondate, username, email, password, authkey, state, totalsessioncounter, currentsessioncounter) VALUES (2, NULL, NULL, 1367204163, 'invitado', 'prueba@prueba.com', '8e3c4835e8adbe7d489c529b81a1aa16', NULL, 0, 0, 0);
INSERT INTO cruge_user (iduser, regdate, actdate, logondate, username, email, password, authkey, state, totalsessioncounter, currentsessioncounter) VALUES (3, NULL, NULL, 1367204393, 'programador', 'programador@cadivi.gob.ve', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 0, 0);
INSERT INTO cruge_user (iduser, regdate, actdate, logondate, username, email, password, authkey, state, totalsessioncounter, currentsessioncounter) VALUES (1, NULL, NULL, 1367451421, 'admin', 'lmarin@cadivi.gob.ve', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 0, 0);


--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 180
-- Name: cruge_user_iduser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cruge_user_iduser_seq', 3, true);


--
-- TOC entry 2087 (class 0 OID 24667)
-- Dependencies: 181
-- Data for Name: detalles_errores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detalles_errores (id_det_err, num_inc, det_err, fec_reg, id_err, id_usu, tit_err) VALUES (3, 1000, 'prueba2222 f<br>otra voz<br>', '2013-04-11 20:05:16.723', 5, 1, 'error');
INSERT INTO detalles_errores (id_det_err, num_inc, det_err, fec_reg, id_err, id_usu, tit_err) VALUES (4, 101010, 'otro error<br>', '2013-04-28 16:52:22.738', 5, 1, 'Nuevamente en el mismo lugar');


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 182
-- Name: detalles_errores_id_det_err_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalles_errores_id_det_err_seq', 4, true);


--
-- TOC entry 2089 (class 0 OID 24675)
-- Dependencies: 183
-- Data for Name: errores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO errores (id_err, des_err, fec_reg, id_len_pro) VALUES (5, 'Ora-3005 not data found', '2013-04-07 10:53:41.672', 2);


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 184
-- Name: errores_id_err_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('errores_id_err_seq', 5, true);


--
-- TOC entry 2091 (class 0 OID 24681)
-- Dependencies: 185
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
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 186
-- Name: lenguajes_id_len_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lenguajes_id_len_seq', 7, true);


--
-- TOC entry 2093 (class 0 OID 24686)
-- Dependencies: 187
-- Data for Name: lenguajes_proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (2, 1, 1);
INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (1, 2, 2);
INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (1, 1, 5);
INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (3, 2, 8);
INSERT INTO lenguajes_proyectos (id_pro, id_len, id_len_pro) VALUES (2, 2, 7);


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 188
-- Name: lenguajes_proyectos_id_len_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lenguajes_proyectos_id_len_pro_seq', 8, true);


--
-- TOC entry 2095 (class 0 OID 24691)
-- Dependencies: 189
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proyectos (id_pro, nom_pro) VALUES (1, 'SISCOA');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (2, 'ESTUDIANTE');
INSERT INTO proyectos (id_pro, nom_pro) VALUES (3, 'JURIDICO');


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 190
-- Name: proyectos_id_pro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyectos_id_pro_seq', 3, true);


--
-- TOC entry 2097 (class 0 OID 24696)
-- Dependencies: 191
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuarios (id_usu, nom_usu, ape_usu, fec_reg, iduser) VALUES (1, 'Luis', 'Marin', '2013-04-07 19:22:16.625', 1);
INSERT INTO usuarios (id_usu, nom_usu, ape_usu, fec_reg, iduser) VALUES (2, 'Usuario de Prueba', 'Usuario de Prueba', '2013-04-28 20:49:31.182', 3);


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 192
-- Name: usuarios_id_usu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_usu_seq', 3, true);


--
-- TOC entry 2031 (class 2606 OID 24715)
-- Name: cruge_authassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_authassignment
    ADD CONSTRAINT cruge_authassignment_pkey PRIMARY KEY (userid, itemname);


--
-- TOC entry 2033 (class 2606 OID 24717)
-- Name: cruge_authitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_authitem
    ADD CONSTRAINT cruge_authitem_pkey PRIMARY KEY (name);


--
-- TOC entry 2035 (class 2606 OID 24719)
-- Name: cruge_authitemchild_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_authitemchild
    ADD CONSTRAINT cruge_authitemchild_pkey PRIMARY KEY (parent, child);


--
-- TOC entry 2037 (class 2606 OID 24721)
-- Name: cruge_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_field
    ADD CONSTRAINT cruge_field_pkey PRIMARY KEY (idfield);


--
-- TOC entry 2039 (class 2606 OID 24723)
-- Name: cruge_fieldvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_fieldvalue
    ADD CONSTRAINT cruge_fieldvalue_pkey PRIMARY KEY (idfieldvalue);


--
-- TOC entry 2041 (class 2606 OID 24725)
-- Name: cruge_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_session
    ADD CONSTRAINT cruge_session_pkey PRIMARY KEY (idsession);


--
-- TOC entry 2043 (class 2606 OID 24727)
-- Name: cruge_system_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_system
    ADD CONSTRAINT cruge_system_pkey PRIMARY KEY (idsystem);


--
-- TOC entry 2045 (class 2606 OID 24729)
-- Name: cruge_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cruge_user
    ADD CONSTRAINT cruge_user_pkey PRIMARY KEY (iduser);


--
-- TOC entry 2047 (class 2606 OID 24731)
-- Name: detalles_errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_pkey PRIMARY KEY (id_det_err);


--
-- TOC entry 2049 (class 2606 OID 24733)
-- Name: errores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY errores
    ADD CONSTRAINT errores_pkey PRIMARY KEY (id_err);


--
-- TOC entry 2051 (class 2606 OID 24735)
-- Name: lenguajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes
    ADD CONSTRAINT lenguajes_pkey PRIMARY KEY (id_len);


--
-- TOC entry 2053 (class 2606 OID 24816)
-- Name: lenguajes_proyectos_id_pro_id_len_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_pro_id_len_key UNIQUE (id_pro, id_len);


--
-- TOC entry 2055 (class 2606 OID 24737)
-- Name: lenguajes_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_pkey PRIMARY KEY (id_len_pro);


--
-- TOC entry 2057 (class 2606 OID 24739)
-- Name: proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id_pro);


--
-- TOC entry 2059 (class 2606 OID 24741)
-- Name: usuarios_iduser_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_iduser_key UNIQUE (iduser);


--
-- TOC entry 2061 (class 2606 OID 24743)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usu);


--
-- TOC entry 2064 (class 2606 OID 24744)
-- Name: crugeauthitemchild_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authitemchild
    ADD CONSTRAINT crugeauthitemchild_ibfk_1 FOREIGN KEY (parent) REFERENCES cruge_authitem(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2065 (class 2606 OID 24749)
-- Name: crugeauthitemchild_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authitemchild
    ADD CONSTRAINT crugeauthitemchild_ibfk_2 FOREIGN KEY (child) REFERENCES cruge_authitem(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2068 (class 2606 OID 24754)
-- Name: detalles_errores_id_err_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_id_err_fkey FOREIGN KEY (id_err) REFERENCES errores(id_err) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2069 (class 2606 OID 24759)
-- Name: detalles_errores_id_usu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_errores
    ADD CONSTRAINT detalles_errores_id_usu_fkey FOREIGN KEY (id_usu) REFERENCES usuarios(id_usu) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2070 (class 2606 OID 24764)
-- Name: errores_id_len_pro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY errores
    ADD CONSTRAINT errores_id_len_pro_fkey FOREIGN KEY (id_len_pro) REFERENCES lenguajes_proyectos(id_len_pro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2062 (class 2606 OID 24769)
-- Name: fk_cruge_authassignment_cruge_authitem1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authassignment
    ADD CONSTRAINT fk_cruge_authassignment_cruge_authitem1 FOREIGN KEY (itemname) REFERENCES cruge_authitem(name);


--
-- TOC entry 2063 (class 2606 OID 24774)
-- Name: fk_cruge_authassignment_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_authassignment
    ADD CONSTRAINT fk_cruge_authassignment_user FOREIGN KEY (userid) REFERENCES cruge_user(iduser) ON DELETE CASCADE;


--
-- TOC entry 2066 (class 2606 OID 24779)
-- Name: fk_cruge_fieldvalue_cruge_field1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_fieldvalue
    ADD CONSTRAINT fk_cruge_fieldvalue_cruge_field1 FOREIGN KEY (idfield) REFERENCES cruge_field(idfield) ON DELETE CASCADE;


--
-- TOC entry 2067 (class 2606 OID 24784)
-- Name: fk_cruge_fieldvalue_cruge_user1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cruge_fieldvalue
    ADD CONSTRAINT fk_cruge_fieldvalue_cruge_user1 FOREIGN KEY (iduser) REFERENCES cruge_user(iduser) ON DELETE CASCADE;


--
-- TOC entry 2071 (class 2606 OID 24805)
-- Name: lenguajes_proyectos_id_len_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_len_fkey FOREIGN KEY (id_len) REFERENCES lenguajes(id_len) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2072 (class 2606 OID 24810)
-- Name: lenguajes_proyectos_id_pro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lenguajes_proyectos
    ADD CONSTRAINT lenguajes_proyectos_id_pro_fkey FOREIGN KEY (id_pro) REFERENCES proyectos(id_pro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2073 (class 2606 OID 24799)
-- Name: usuarios_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_iduser_fkey FOREIGN KEY (iduser) REFERENCES cruge_user(iduser) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-05-02 00:14:27

--
-- PostgreSQL database dump complete
--

