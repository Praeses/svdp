--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    addressable_id integer,
    addressable_type character varying(255),
    line_1 character varying(255),
    line_2 character varying(255),
    line_3 character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: case_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE case_files (
    id integer NOT NULL,
    name character varying(255),
    date timestamp without time zone,
    number integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    family_id integer,
    comment text
);


--
-- Name: case_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE case_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: case_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE case_files_id_seq OWNED BY case_files.id;


--
-- Name: families; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE families (
    id integer NOT NULL,
    name text,
    primary_address_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: families_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE families_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE families_id_seq OWNED BY families.id;


--
-- Name: needs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE needs (
    id integer NOT NULL,
    description character varying(255),
    account character varying(255),
    action character varying(255),
    date_of_action character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    case_file_id integer,
    need_tag_id integer,
    action_tag_id integer
);


--
-- Name: needs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE needs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: needs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE needs_id_seq OWNED BY needs.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone character varying(255),
    family_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ssn character varying(4)
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: searches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE searches (
    id integer NOT NULL,
    term character varying(255),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    count integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE searches_id_seq OWNED BY searches.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT ''::character varying NOT NULL,
    last_name character varying(255) DEFAULT ''::character varying NOT NULL,
    username character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE visits (
    id integer NOT NULL,
    date_of_visit date,
    note text,
    person_id integer,
    user_id integer,
    needs text,
    income text,
    skills text,
    action text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    case_file_id integer
);


--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE visits_id_seq OWNED BY visits.id;


--
-- Name: wish_lists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wish_lists (
    id integer NOT NULL,
    name character varying(255),
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: wish_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wish_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wish_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wish_lists_id_seq OWNED BY wish_lists.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY case_files ALTER COLUMN id SET DEFAULT nextval('case_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY families ALTER COLUMN id SET DEFAULT nextval('families_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY needs ALTER COLUMN id SET DEFAULT nextval('needs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY searches ALTER COLUMN id SET DEFAULT nextval('searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY visits ALTER COLUMN id SET DEFAULT nextval('visits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wish_lists ALTER COLUMN id SET DEFAULT nextval('wish_lists_id_seq'::regclass);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: case_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY case_files
    ADD CONSTRAINT case_files_pkey PRIMARY KEY (id);


--
-- Name: families_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY families
    ADD CONSTRAINT families_pkey PRIMARY KEY (id);


--
-- Name: needs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY needs
    ADD CONSTRAINT needs_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: wish_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wish_lists
    ADD CONSTRAINT wish_lists_pkey PRIMARY KEY (id);


--
-- Name: addresses_to_tsvector_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX addresses_to_tsvector_idx ON addresses USING gin (to_tsvector('english'::regconfig, (line_1)::text));


--
-- Name: addresses_to_tsvector_idx1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX addresses_to_tsvector_idx1 ON addresses USING gin (to_tsvector('english'::regconfig, (line_2)::text));


--
-- Name: addresses_to_tsvector_idx2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX addresses_to_tsvector_idx2 ON addresses USING gin (to_tsvector('english'::regconfig, (line_3)::text));


--
-- Name: addresses_to_tsvector_idx3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX addresses_to_tsvector_idx3 ON addresses USING gin (to_tsvector('english'::regconfig, (city)::text));


--
-- Name: addresses_to_tsvector_idx4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX addresses_to_tsvector_idx4 ON addresses USING gin (to_tsvector('english'::regconfig, (state)::text));


--
-- Name: addresses_to_tsvector_idx5; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX addresses_to_tsvector_idx5 ON addresses USING gin (to_tsvector('english'::regconfig, (zip)::text));


--
-- Name: case_files_to_tsvector_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX case_files_to_tsvector_idx ON case_files USING gin (to_tsvector('english'::regconfig, (name)::text));


--
-- Name: case_files_to_tsvector_idx1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX case_files_to_tsvector_idx1 ON case_files USING gin (to_tsvector('english'::regconfig, (number)::text));


--
-- Name: case_files_to_tsvector_idx2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX case_files_to_tsvector_idx2 ON case_files USING gin (to_tsvector('english'::regconfig, comment));


--
-- Name: families_to_tsvector_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX families_to_tsvector_idx ON families USING gin (to_tsvector('english'::regconfig, name));


--
-- Name: index_case_files_on_family_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_case_files_on_family_id ON case_files USING btree (family_id);


--
-- Name: index_needs_on_case_file_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_needs_on_case_file_id ON needs USING btree (case_file_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_visits_on_case_file_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_visits_on_case_file_id ON visits USING btree (case_file_id);


--
-- Name: index_visits_on_person_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_visits_on_person_id ON visits USING btree (person_id);


--
-- Name: index_visits_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_visits_on_user_id ON visits USING btree (user_id);


--
-- Name: needs_to_tsvector_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX needs_to_tsvector_idx ON needs USING gin (to_tsvector('english'::regconfig, (description)::text));


--
-- Name: needs_to_tsvector_idx1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX needs_to_tsvector_idx1 ON needs USING gin (to_tsvector('english'::regconfig, (account)::text));


--
-- Name: needs_to_tsvector_idx2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX needs_to_tsvector_idx2 ON needs USING gin (to_tsvector('english'::regconfig, (action)::text));


--
-- Name: people_to_tsvector_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX people_to_tsvector_idx ON people USING gin (to_tsvector('english'::regconfig, (first_name)::text));


--
-- Name: people_to_tsvector_idx1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX people_to_tsvector_idx1 ON people USING gin (to_tsvector('english'::regconfig, (last_name)::text));


--
-- Name: people_to_tsvector_idx2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX people_to_tsvector_idx2 ON people USING gin (to_tsvector('english'::regconfig, (phone)::text));


--
-- Name: people_to_tsvector_idx3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX people_to_tsvector_idx3 ON people USING gin (to_tsvector('english'::regconfig, (ssn)::text));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130111172527');

INSERT INTO schema_migrations (version) VALUES ('20130111173155');

INSERT INTO schema_migrations (version) VALUES ('20130111194525');

INSERT INTO schema_migrations (version) VALUES ('20130622215727');

INSERT INTO schema_migrations (version) VALUES ('20130622215923');

INSERT INTO schema_migrations (version) VALUES ('20130703205939');

INSERT INTO schema_migrations (version) VALUES ('20130703210016');

INSERT INTO schema_migrations (version) VALUES ('20130703210038');

INSERT INTO schema_migrations (version) VALUES ('20130711153028');

INSERT INTO schema_migrations (version) VALUES ('20130711172116');

INSERT INTO schema_migrations (version) VALUES ('20130711201756');

INSERT INTO schema_migrations (version) VALUES ('20130711213030');

INSERT INTO schema_migrations (version) VALUES ('20130712131544');

INSERT INTO schema_migrations (version) VALUES ('20130712143533');

INSERT INTO schema_migrations (version) VALUES ('20130712145511');

INSERT INTO schema_migrations (version) VALUES ('20130712151445');

INSERT INTO schema_migrations (version) VALUES ('20130712154259');

INSERT INTO schema_migrations (version) VALUES ('20130716154557');
