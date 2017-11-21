--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE activities (
    id integer NOT NULL,
    user_id integer,
    action character varying,
    actionable_id integer,
    actionable_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE activities OWNER TO abre;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_id_seq OWNER TO abre;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: administrators; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE administrators (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE administrators OWNER TO abre;

--
-- Name: administrators_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE administrators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrators_id_seq OWNER TO abre;

--
-- Name: administrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE administrators_id_seq OWNED BY administrators.id;


--
-- Name: ahoy_events; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE ahoy_events (
    id uuid NOT NULL,
    visit_id uuid,
    user_id integer,
    name character varying,
    properties jsonb,
    "time" timestamp without time zone,
    ip character varying
);


ALTER TABLE ahoy_events OWNER TO abre;

--
-- Name: annotations; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE annotations (
    id integer NOT NULL,
    quote character varying,
    ranges text,
    text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    legislation_id integer
);


ALTER TABLE annotations OWNER TO abre;

--
-- Name: annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE annotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE annotations_id_seq OWNER TO abre;

--
-- Name: annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE annotations_id_seq OWNED BY annotations.id;


--
-- Name: banners; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE banners (
    id integer NOT NULL,
    title character varying(80),
    description character varying,
    target_url character varying,
    style character varying,
    image character varying,
    post_started_at date,
    post_ended_at date,
    hidden_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE banners OWNER TO abre;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banners_id_seq OWNER TO abre;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE banners_id_seq OWNED BY banners.id;


--
-- Name: budget_ballot_lines; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budget_ballot_lines (
    id integer NOT NULL,
    ballot_id integer,
    investment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    budget_id integer,
    group_id integer,
    heading_id integer
);


ALTER TABLE budget_ballot_lines OWNER TO abre;

--
-- Name: budget_ballot_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budget_ballot_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_ballot_lines_id_seq OWNER TO abre;

--
-- Name: budget_ballot_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budget_ballot_lines_id_seq OWNED BY budget_ballot_lines.id;


--
-- Name: budget_ballots; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budget_ballots (
    id integer NOT NULL,
    user_id integer,
    budget_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE budget_ballots OWNER TO abre;

--
-- Name: budget_ballots_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budget_ballots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_ballots_id_seq OWNER TO abre;

--
-- Name: budget_ballots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budget_ballots_id_seq OWNED BY budget_ballots.id;


--
-- Name: budget_groups; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budget_groups (
    id integer NOT NULL,
    budget_id integer,
    name character varying(50)
);


ALTER TABLE budget_groups OWNER TO abre;

--
-- Name: budget_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budget_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_groups_id_seq OWNER TO abre;

--
-- Name: budget_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budget_groups_id_seq OWNED BY budget_groups.id;


--
-- Name: budget_headings; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budget_headings (
    id integer NOT NULL,
    group_id integer,
    name character varying(50),
    price bigint
);


ALTER TABLE budget_headings OWNER TO abre;

--
-- Name: budget_headings_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budget_headings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_headings_id_seq OWNER TO abre;

--
-- Name: budget_headings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budget_headings_id_seq OWNED BY budget_headings.id;


--
-- Name: budget_investments; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budget_investments (
    id integer NOT NULL,
    author_id integer,
    administrator_id integer,
    title character varying,
    description text,
    external_url character varying,
    price bigint,
    feasibility character varying(15) DEFAULT 'undecided'::character varying,
    price_explanation text,
    unfeasibility_explanation text,
    internal_comments text,
    valuation_finished boolean DEFAULT false,
    valuator_assignments_count integer DEFAULT 0,
    price_first_year bigint,
    duration character varying,
    hidden_at timestamp without time zone,
    cached_votes_up integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    confidence_score integer DEFAULT 0 NOT NULL,
    physical_votes integer DEFAULT 0,
    tsv tsvector,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    heading_id integer,
    responsible_name character varying,
    budget_id integer,
    group_id integer,
    selected boolean DEFAULT false,
    location character varying,
    organization_name character varying,
    unfeasible_email_sent_at timestamp without time zone,
    ballot_lines_count integer DEFAULT 0
);


ALTER TABLE budget_investments OWNER TO abre;

--
-- Name: budget_investments_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budget_investments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_investments_id_seq OWNER TO abre;

--
-- Name: budget_investments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budget_investments_id_seq OWNED BY budget_investments.id;


--
-- Name: budget_valuator_assignments; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budget_valuator_assignments (
    id integer NOT NULL,
    valuator_id integer,
    investment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE budget_valuator_assignments OWNER TO abre;

--
-- Name: budget_valuator_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budget_valuator_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budget_valuator_assignments_id_seq OWNER TO abre;

--
-- Name: budget_valuator_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budget_valuator_assignments_id_seq OWNED BY budget_valuator_assignments.id;


--
-- Name: budgets; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE budgets (
    id integer NOT NULL,
    name character varying(80),
    currency_symbol character varying(10),
    phase character varying(40) DEFAULT 'accepting'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description_accepting text,
    description_reviewing text,
    description_selecting text,
    description_valuating text,
    description_balloting text,
    description_reviewing_ballots text,
    description_finished text
);


ALTER TABLE budgets OWNER TO abre;

--
-- Name: budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE budgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE budgets_id_seq OWNER TO abre;

--
-- Name: budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE budgets_id_seq OWNED BY budgets.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    name character varying,
    track_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE campaigns OWNER TO abre;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaigns_id_seq OWNER TO abre;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE comments (
    id integer NOT NULL,
    commentable_id integer,
    commentable_type character varying,
    body text,
    subject character varying,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    hidden_at timestamp without time zone,
    flags_count integer DEFAULT 0,
    ignored_flag_at timestamp without time zone,
    moderator_id integer,
    administrator_id integer,
    cached_votes_total integer DEFAULT 0,
    cached_votes_up integer DEFAULT 0,
    cached_votes_down integer DEFAULT 0,
    confirmed_hide_at timestamp without time zone,
    ancestry character varying,
    confidence_score integer DEFAULT 0 NOT NULL
);


ALTER TABLE comments OWNER TO abre;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO abre;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: debates; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE debates (
    id integer NOT NULL,
    title character varying(80),
    description text,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    visit_id character varying,
    hidden_at timestamp without time zone,
    flags_count integer DEFAULT 0,
    ignored_flag_at timestamp without time zone,
    cached_votes_total integer DEFAULT 0,
    cached_votes_up integer DEFAULT 0,
    cached_votes_down integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    confirmed_hide_at timestamp without time zone,
    cached_anonymous_votes_total integer DEFAULT 0,
    cached_votes_score integer DEFAULT 0,
    hot_score bigint DEFAULT 0,
    confidence_score integer DEFAULT 0,
    geozone_id integer,
    tsv tsvector,
    featured_at timestamp without time zone
);


ALTER TABLE debates OWNER TO abre;

--
-- Name: debates_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE debates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE debates_id_seq OWNER TO abre;

--
-- Name: debates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE debates_id_seq OWNED BY debates.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE delayed_jobs OWNER TO abre;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delayed_jobs_id_seq OWNER TO abre;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: design_events; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE design_events (
    id integer NOT NULL,
    name character varying,
    starts_at timestamp without time zone,
    place character varying,
    pax integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer,
    description text,
    summary text,
    document_file_name character varying,
    document_content_type character varying,
    document_file_size integer,
    document_updated_at timestamp without time zone
);


ALTER TABLE design_events OWNER TO abre;

--
-- Name: design_events_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE design_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE design_events_id_seq OWNER TO abre;

--
-- Name: design_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE design_events_id_seq OWNED BY design_events.id;


--
-- Name: direct_messages; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE direct_messages (
    id integer NOT NULL,
    sender_id integer,
    receiver_id integer,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE direct_messages OWNER TO abre;

--
-- Name: direct_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE direct_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE direct_messages_id_seq OWNER TO abre;

--
-- Name: direct_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE direct_messages_id_seq OWNED BY direct_messages.id;


--
-- Name: failed_census_calls; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE failed_census_calls (
    id integer NOT NULL,
    user_id integer,
    document_number character varying,
    document_type character varying,
    date_of_birth date,
    postal_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    district_code character varying,
    poll_officer_id integer,
    year_of_birth integer
);


ALTER TABLE failed_census_calls OWNER TO abre;

--
-- Name: failed_census_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE failed_census_calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE failed_census_calls_id_seq OWNER TO abre;

--
-- Name: failed_census_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE failed_census_calls_id_seq OWNED BY failed_census_calls.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE flags (
    id integer NOT NULL,
    user_id integer,
    flaggable_type character varying,
    flaggable_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE flags OWNER TO abre;

--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flags_id_seq OWNER TO abre;

--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE flags_id_seq OWNED BY flags.id;


--
-- Name: geozones; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE geozones (
    id integer NOT NULL,
    name character varying,
    html_map_coordinates character varying,
    external_code character varying,
    population integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    census_code character varying
);


ALTER TABLE geozones OWNER TO abre;

--
-- Name: geozones_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE geozones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geozones_id_seq OWNER TO abre;

--
-- Name: geozones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE geozones_id_seq OWNED BY geozones.id;


--
-- Name: geozones_polls; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE geozones_polls (
    id integer NOT NULL,
    geozone_id integer,
    poll_id integer
);


ALTER TABLE geozones_polls OWNER TO abre;

--
-- Name: geozones_polls_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE geozones_polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geozones_polls_id_seq OWNER TO abre;

--
-- Name: geozones_polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE geozones_polls_id_seq OWNED BY geozones_polls.id;


--
-- Name: geozones_problems; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE geozones_problems (
    problem_id integer NOT NULL,
    geozone_id integer NOT NULL
);


ALTER TABLE geozones_problems OWNER TO abre;

--
-- Name: geozones_projects; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE geozones_projects (
    project_id integer NOT NULL,
    geozone_id integer NOT NULL
);


ALTER TABLE geozones_projects OWNER TO abre;

--
-- Name: geozones_proposals; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE geozones_proposals (
    proposal_id integer NOT NULL,
    geozone_id integer NOT NULL
);


ALTER TABLE geozones_proposals OWNER TO abre;

--
-- Name: identities; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE identities (
    id integer NOT NULL,
    user_id integer,
    provider character varying,
    uid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE identities OWNER TO abre;

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE identities_id_seq OWNER TO abre;

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE identities_id_seq OWNED BY identities.id;


--
-- Name: legislations; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE legislations (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE legislations OWNER TO abre;

--
-- Name: legislations_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE legislations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE legislations_id_seq OWNER TO abre;

--
-- Name: legislations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE legislations_id_seq OWNED BY legislations.id;


--
-- Name: locks; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE locks (
    id integer NOT NULL,
    user_id integer,
    tries integer DEFAULT 0,
    locked_until timestamp without time zone DEFAULT '2000-01-01 01:01:01'::timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE locks OWNER TO abre;

--
-- Name: locks_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locks_id_seq OWNER TO abre;

--
-- Name: locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE locks_id_seq OWNED BY locks.id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE managers (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE managers OWNER TO abre;

--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE managers_id_seq OWNER TO abre;

--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE managers_id_seq OWNED BY managers.id;


--
-- Name: moderators; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE moderators (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE moderators OWNER TO abre;

--
-- Name: moderators_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE moderators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moderators_id_seq OWNER TO abre;

--
-- Name: moderators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE moderators_id_seq OWNED BY moderators.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE notifications (
    id integer NOT NULL,
    user_id integer,
    notifiable_id integer,
    notifiable_type character varying,
    counter integer DEFAULT 1,
    emailed_at timestamp without time zone
);


ALTER TABLE notifications OWNER TO abre;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_id_seq OWNER TO abre;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE organizations (
    id integer NOT NULL,
    user_id integer,
    name character varying(60),
    verified_at timestamp without time zone,
    rejected_at timestamp without time zone,
    responsible_name character varying(60)
);


ALTER TABLE organizations OWNER TO abre;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organizations_id_seq OWNER TO abre;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE pictures (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    design_event_id integer,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    report_id integer
);


ALTER TABLE pictures OWNER TO abre;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pictures_id_seq OWNER TO abre;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: poll_answers; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_answers (
    id integer NOT NULL,
    question_id integer,
    author_id integer,
    answer character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE poll_answers OWNER TO abre;

--
-- Name: poll_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_answers_id_seq OWNER TO abre;

--
-- Name: poll_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_answers_id_seq OWNED BY poll_answers.id;


--
-- Name: poll_booth_assignments; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_booth_assignments (
    id integer NOT NULL,
    booth_id integer,
    poll_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE poll_booth_assignments OWNER TO abre;

--
-- Name: poll_booth_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_booth_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_booth_assignments_id_seq OWNER TO abre;

--
-- Name: poll_booth_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_booth_assignments_id_seq OWNED BY poll_booth_assignments.id;


--
-- Name: poll_booths; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_booths (
    id integer NOT NULL,
    name character varying,
    location character varying
);


ALTER TABLE poll_booths OWNER TO abre;

--
-- Name: poll_booths_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_booths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_booths_id_seq OWNER TO abre;

--
-- Name: poll_booths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_booths_id_seq OWNED BY poll_booths.id;


--
-- Name: poll_final_recounts; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_final_recounts (
    id integer NOT NULL,
    booth_assignment_id integer,
    officer_assignment_id integer,
    count integer,
    count_log text DEFAULT ''::text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    officer_assignment_id_log text DEFAULT ''::text,
    date date NOT NULL
);


ALTER TABLE poll_final_recounts OWNER TO abre;

--
-- Name: poll_final_recounts_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_final_recounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_final_recounts_id_seq OWNER TO abre;

--
-- Name: poll_final_recounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_final_recounts_id_seq OWNED BY poll_final_recounts.id;


--
-- Name: poll_null_results; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_null_results (
    id integer NOT NULL,
    author_id integer,
    amount integer,
    origin character varying,
    date date,
    booth_assignment_id integer,
    officer_assignment_id integer,
    amount_log text DEFAULT ''::text,
    officer_assignment_id_log text DEFAULT ''::text,
    author_id_log text DEFAULT ''::text
);


ALTER TABLE poll_null_results OWNER TO abre;

--
-- Name: poll_null_results_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_null_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_null_results_id_seq OWNER TO abre;

--
-- Name: poll_null_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_null_results_id_seq OWNED BY poll_null_results.id;


--
-- Name: poll_officer_assignments; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_officer_assignments (
    id integer NOT NULL,
    booth_assignment_id integer,
    officer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date date NOT NULL,
    final boolean DEFAULT false,
    user_data_log character varying DEFAULT ''::character varying
);


ALTER TABLE poll_officer_assignments OWNER TO abre;

--
-- Name: poll_officer_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_officer_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_officer_assignments_id_seq OWNER TO abre;

--
-- Name: poll_officer_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_officer_assignments_id_seq OWNED BY poll_officer_assignments.id;


--
-- Name: poll_officers; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_officers (
    id integer NOT NULL,
    user_id integer,
    failed_census_calls_count integer DEFAULT 0
);


ALTER TABLE poll_officers OWNER TO abre;

--
-- Name: poll_officers_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_officers_id_seq OWNER TO abre;

--
-- Name: poll_officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_officers_id_seq OWNED BY poll_officers.id;


--
-- Name: poll_partial_results; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_partial_results (
    id integer NOT NULL,
    question_id integer,
    author_id integer,
    answer character varying,
    amount integer,
    origin character varying,
    date date,
    booth_assignment_id integer,
    officer_assignment_id integer,
    amount_log text DEFAULT ''::text,
    officer_assignment_id_log text DEFAULT ''::text,
    author_id_log text DEFAULT ''::text
);


ALTER TABLE poll_partial_results OWNER TO abre;

--
-- Name: poll_partial_results_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_partial_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_partial_results_id_seq OWNER TO abre;

--
-- Name: poll_partial_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_partial_results_id_seq OWNED BY poll_partial_results.id;


--
-- Name: poll_questions; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_questions (
    id integer NOT NULL,
    proposal_id integer,
    poll_id integer,
    author_id integer,
    author_visible_name character varying,
    title character varying,
    valid_answers character varying,
    description text,
    comments_count integer,
    hidden_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tsv tsvector
);


ALTER TABLE poll_questions OWNER TO abre;

--
-- Name: poll_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_questions_id_seq OWNER TO abre;

--
-- Name: poll_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_questions_id_seq OWNED BY poll_questions.id;


--
-- Name: poll_recounts; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_recounts (
    id integer NOT NULL,
    booth_assignment_id integer,
    officer_assignment_id integer,
    count integer,
    count_log text DEFAULT ''::text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date date NOT NULL,
    officer_assignment_id_log text DEFAULT ''::text
);


ALTER TABLE poll_recounts OWNER TO abre;

--
-- Name: poll_recounts_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_recounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_recounts_id_seq OWNER TO abre;

--
-- Name: poll_recounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_recounts_id_seq OWNED BY poll_recounts.id;


--
-- Name: poll_voters; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_voters (
    id integer NOT NULL,
    document_number character varying,
    document_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    poll_id integer NOT NULL,
    booth_assignment_id integer,
    age integer,
    gender character varying,
    geozone_id integer,
    answer_id integer,
    officer_assignment_id integer,
    user_id integer
);


ALTER TABLE poll_voters OWNER TO abre;

--
-- Name: poll_voters_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_voters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_voters_id_seq OWNER TO abre;

--
-- Name: poll_voters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_voters_id_seq OWNED BY poll_voters.id;


--
-- Name: poll_white_results; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE poll_white_results (
    id integer NOT NULL,
    author_id integer,
    amount integer,
    origin character varying,
    date date,
    booth_assignment_id integer,
    officer_assignment_id integer,
    amount_log text DEFAULT ''::text,
    officer_assignment_id_log text DEFAULT ''::text,
    author_id_log text DEFAULT ''::text
);


ALTER TABLE poll_white_results OWNER TO abre;

--
-- Name: poll_white_results_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE poll_white_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poll_white_results_id_seq OWNER TO abre;

--
-- Name: poll_white_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE poll_white_results_id_seq OWNED BY poll_white_results.id;


--
-- Name: polls; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE polls (
    id integer NOT NULL,
    name character varying,
    description text,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    published boolean DEFAULT false,
    geozone_restricted boolean DEFAULT false,
    for_challenge boolean
);


ALTER TABLE polls OWNER TO abre;

--
-- Name: polls_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polls_id_seq OWNER TO abre;

--
-- Name: polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE polls_id_seq OWNED BY polls.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE problems (
    id integer NOT NULL,
    title character varying,
    description text,
    cause text,
    problem_title text,
    consequence text,
    budget character varying,
    restriction text,
    summary text,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    geozone_restricted boolean,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    call_to_action character varying,
    restriction_summary character varying
);


ALTER TABLE problems OWNER TO abre;

--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE problems_id_seq OWNER TO abre;

--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE problems_id_seq OWNED BY problems.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE projects (
    id integer NOT NULL,
    neighbour_id integer,
    responsible_id integer,
    name character varying,
    description text,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    geozone_restricted boolean,
    proposal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    responsible_official_name character varying,
    responsible_official_mail character varying,
    implementation_starts_at date,
    implementation_ends_at date,
    responsible_neighbour_name character varying,
    responsible_neighbour_mail character varying,
    responsible_neighbour_phone character varying
);


ALTER TABLE projects OWNER TO abre;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO abre;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: proposal_notifications; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE proposal_notifications (
    id integer NOT NULL,
    title character varying,
    body text,
    author_id integer,
    proposal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE proposal_notifications OWNER TO abre;

--
-- Name: proposal_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE proposal_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposal_notifications_id_seq OWNER TO abre;

--
-- Name: proposal_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE proposal_notifications_id_seq OWNED BY proposal_notifications.id;


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE proposals (
    id integer NOT NULL,
    title character varying(80),
    description text,
    deadline character varying,
    question character varying,
    what character varying,
    why character varying,
    external_url character varying,
    author_id integer,
    hidden_at timestamp without time zone,
    prioritize text,
    flags_count integer DEFAULT 0,
    ignored_flag_at timestamp without time zone,
    cached_votes_up integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    confirmed_hide_at timestamp without time zone,
    for_challenge boolean DEFAULT false,
    hot_score bigint DEFAULT 0,
    confidence_score integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    responsible_name character varying(60),
    summary text,
    video_url character varying,
    tsv tsvector,
    retired_at timestamp without time zone,
    retired_reason character varying,
    retired_explanation text,
    problem_id integer,
    project_id integer
);


ALTER TABLE proposals OWNER TO abre;

--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proposals_id_seq OWNER TO abre;

--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE proposals_id_seq OWNED BY proposals.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE reports (
    id integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer
);


ALTER TABLE reports OWNER TO abre;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_id_seq OWNER TO abre;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO abre;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE settings (
    id integer NOT NULL,
    key character varying,
    value character varying
);


ALTER TABLE settings OWNER TO abre;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE settings_id_seq OWNER TO abre;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: signature_sheets; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE signature_sheets (
    id integer NOT NULL,
    signable_id integer,
    signable_type character varying,
    document_numbers text,
    processed boolean DEFAULT false,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE signature_sheets OWNER TO abre;

--
-- Name: signature_sheets_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE signature_sheets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE signature_sheets_id_seq OWNER TO abre;

--
-- Name: signature_sheets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE signature_sheets_id_seq OWNED BY signature_sheets.id;


--
-- Name: signatures; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE signatures (
    id integer NOT NULL,
    signature_sheet_id integer,
    user_id integer,
    document_number character varying,
    verified boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE signatures OWNER TO abre;

--
-- Name: signatures_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE signatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE signatures_id_seq OWNER TO abre;

--
-- Name: signatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE signatures_id_seq OWNED BY signatures.id;


--
-- Name: site_customization_content_blocks; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE site_customization_content_blocks (
    id integer NOT NULL,
    name character varying,
    locale character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE site_customization_content_blocks OWNER TO abre;

--
-- Name: site_customization_content_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE site_customization_content_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_customization_content_blocks_id_seq OWNER TO abre;

--
-- Name: site_customization_content_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE site_customization_content_blocks_id_seq OWNED BY site_customization_content_blocks.id;


--
-- Name: site_customization_images; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE site_customization_images (
    id integer NOT NULL,
    name character varying NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE site_customization_images OWNER TO abre;

--
-- Name: site_customization_images_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE site_customization_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_customization_images_id_seq OWNER TO abre;

--
-- Name: site_customization_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE site_customization_images_id_seq OWNED BY site_customization_images.id;


--
-- Name: site_customization_pages; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE site_customization_pages (
    id integer NOT NULL,
    slug character varying NOT NULL,
    title character varying NOT NULL,
    subtitle character varying,
    content text,
    more_info_flag boolean,
    print_content_flag boolean,
    status character varying DEFAULT 'draft'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE site_customization_pages OWNER TO abre;

--
-- Name: site_customization_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE site_customization_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_customization_pages_id_seq OWNER TO abre;

--
-- Name: site_customization_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE site_customization_pages_id_seq OWNED BY site_customization_pages.id;


--
-- Name: spending_proposals; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE spending_proposals (
    id integer NOT NULL,
    title character varying,
    description text,
    author_id integer,
    external_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    geozone_id integer,
    price bigint,
    feasible boolean,
    association_name character varying,
    price_explanation text,
    feasible_explanation text,
    internal_comments text,
    valuation_finished boolean DEFAULT false,
    explanations_log text,
    administrator_id integer,
    valuation_assignments_count integer DEFAULT 0,
    price_first_year bigint,
    time_scope character varying,
    unfeasible_email_sent_at timestamp without time zone,
    cached_votes_up integer DEFAULT 0,
    tsv tsvector,
    responsible_name character varying(60),
    physical_votes integer DEFAULT 0
);


ALTER TABLE spending_proposals OWNER TO abre;

--
-- Name: spending_proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE spending_proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spending_proposals_id_seq OWNER TO abre;

--
-- Name: spending_proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE spending_proposals_id_seq OWNED BY spending_proposals.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying,
    tagger_id integer,
    tagger_type character varying,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE taggings OWNER TO abre;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggings_id_seq OWNER TO abre;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(40),
    taggings_count integer DEFAULT 0,
    featured boolean DEFAULT false,
    debates_count integer DEFAULT 0,
    proposals_count integer DEFAULT 0,
    spending_proposals_count integer DEFAULT 0,
    kind character varying,
    "budget/investments_count" integer DEFAULT 0
);


ALTER TABLE tags OWNER TO abre;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO abre;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tolk_locales; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE tolk_locales (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tolk_locales OWNER TO abre;

--
-- Name: tolk_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE tolk_locales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tolk_locales_id_seq OWNER TO abre;

--
-- Name: tolk_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE tolk_locales_id_seq OWNED BY tolk_locales.id;


--
-- Name: tolk_phrases; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE tolk_phrases (
    id integer NOT NULL,
    key text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tolk_phrases OWNER TO abre;

--
-- Name: tolk_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE tolk_phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tolk_phrases_id_seq OWNER TO abre;

--
-- Name: tolk_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE tolk_phrases_id_seq OWNED BY tolk_phrases.id;


--
-- Name: tolk_translations; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE tolk_translations (
    id integer NOT NULL,
    phrase_id integer,
    locale_id integer,
    text text,
    previous_text text,
    primary_updated boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE tolk_translations OWNER TO abre;

--
-- Name: tolk_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE tolk_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tolk_translations_id_seq OWNER TO abre;

--
-- Name: tolk_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE tolk_translations_id_seq OWNED BY tolk_translations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    email_on_comment boolean DEFAULT false,
    email_on_comment_reply boolean DEFAULT false,
    phone_number character varying(30),
    official_position character varying,
    official_level integer DEFAULT 0,
    hidden_at timestamp without time zone,
    sms_confirmation_code character varying,
    username character varying(60),
    document_number character varying,
    document_type character varying,
    residence_verified_at timestamp without time zone,
    email_verification_token character varying,
    verified_at timestamp without time zone,
    unconfirmed_phone character varying,
    confirmed_phone character varying,
    letter_requested_at timestamp without time zone,
    confirmed_hide_at timestamp without time zone,
    letter_verification_code character varying,
    failed_census_calls_count integer DEFAULT 0,
    level_two_verified_at timestamp without time zone,
    erase_reason character varying,
    erased_at timestamp without time zone,
    public_activity boolean DEFAULT true,
    newsletter boolean DEFAULT true,
    notifications_count integer DEFAULT 0,
    registering_with_oauth boolean DEFAULT false,
    locale character varying,
    oauth_email character varying,
    geozone_id integer,
    redeemable_code character varying,
    gender character varying(10),
    date_of_birth timestamp without time zone,
    email_on_proposal_notification boolean DEFAULT true,
    email_digest boolean DEFAULT true,
    email_on_direct_message boolean DEFAULT true,
    official_position_badge boolean DEFAULT false,
    password_changed_at timestamp without time zone DEFAULT '2017-07-11 16:40:44.018143'::timestamp without time zone NOT NULL,
    created_from_signature boolean DEFAULT false,
    failed_email_digests_count integer DEFAULT 0,
    former_users_data_log text DEFAULT ''::text,
    address character varying,
    rut_verified boolean
);


ALTER TABLE users OWNER TO abre;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO abre;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: valuation_assignments; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE valuation_assignments (
    id integer NOT NULL,
    valuator_id integer,
    spending_proposal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE valuation_assignments OWNER TO abre;

--
-- Name: valuation_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE valuation_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE valuation_assignments_id_seq OWNER TO abre;

--
-- Name: valuation_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE valuation_assignments_id_seq OWNED BY valuation_assignments.id;


--
-- Name: valuators; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE valuators (
    id integer NOT NULL,
    user_id integer,
    description character varying,
    spending_proposals_count integer DEFAULT 0,
    budget_investments_count integer DEFAULT 0
);


ALTER TABLE valuators OWNER TO abre;

--
-- Name: valuators_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE valuators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE valuators_id_seq OWNER TO abre;

--
-- Name: valuators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE valuators_id_seq OWNED BY valuators.id;


--
-- Name: verified_users; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE verified_users (
    id integer NOT NULL,
    document_number character varying,
    document_type character varying,
    phone character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE verified_users OWNER TO abre;

--
-- Name: verified_users_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE verified_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE verified_users_id_seq OWNER TO abre;

--
-- Name: verified_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE verified_users_id_seq OWNED BY verified_users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE visits (
    id uuid NOT NULL,
    visitor_id uuid,
    ip character varying,
    user_agent text,
    referrer text,
    landing_page text,
    user_id integer,
    referring_domain character varying,
    search_keyword character varying,
    browser character varying,
    os character varying,
    device_type character varying,
    screen_height integer,
    screen_width integer,
    country character varying,
    region character varying,
    city character varying,
    postal_code character varying,
    latitude numeric,
    longitude numeric,
    utm_source character varying,
    utm_medium character varying,
    utm_term character varying,
    utm_content character varying,
    utm_campaign character varying,
    started_at timestamp without time zone
);


ALTER TABLE visits OWNER TO abre;

--
-- Name: votes; Type: TABLE; Schema: public; Owner: abre
--

CREATE TABLE votes (
    id integer NOT NULL,
    votable_id integer,
    votable_type character varying,
    voter_id integer,
    voter_type character varying,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    signature_id integer
);


ALTER TABLE votes OWNER TO abre;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: abre
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO abre;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: abre
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY administrators ALTER COLUMN id SET DEFAULT nextval('administrators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY annotations ALTER COLUMN id SET DEFAULT nextval('annotations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY banners ALTER COLUMN id SET DEFAULT nextval('banners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_ballot_lines ALTER COLUMN id SET DEFAULT nextval('budget_ballot_lines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_ballots ALTER COLUMN id SET DEFAULT nextval('budget_ballots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_groups ALTER COLUMN id SET DEFAULT nextval('budget_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_headings ALTER COLUMN id SET DEFAULT nextval('budget_headings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_investments ALTER COLUMN id SET DEFAULT nextval('budget_investments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_valuator_assignments ALTER COLUMN id SET DEFAULT nextval('budget_valuator_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budgets ALTER COLUMN id SET DEFAULT nextval('budgets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY debates ALTER COLUMN id SET DEFAULT nextval('debates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY design_events ALTER COLUMN id SET DEFAULT nextval('design_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY direct_messages ALTER COLUMN id SET DEFAULT nextval('direct_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY failed_census_calls ALTER COLUMN id SET DEFAULT nextval('failed_census_calls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY flags ALTER COLUMN id SET DEFAULT nextval('flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY geozones ALTER COLUMN id SET DEFAULT nextval('geozones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY geozones_polls ALTER COLUMN id SET DEFAULT nextval('geozones_polls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY identities ALTER COLUMN id SET DEFAULT nextval('identities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY legislations ALTER COLUMN id SET DEFAULT nextval('legislations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY locks ALTER COLUMN id SET DEFAULT nextval('locks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY managers ALTER COLUMN id SET DEFAULT nextval('managers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY moderators ALTER COLUMN id SET DEFAULT nextval('moderators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_answers ALTER COLUMN id SET DEFAULT nextval('poll_answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_booth_assignments ALTER COLUMN id SET DEFAULT nextval('poll_booth_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_booths ALTER COLUMN id SET DEFAULT nextval('poll_booths_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_final_recounts ALTER COLUMN id SET DEFAULT nextval('poll_final_recounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_null_results ALTER COLUMN id SET DEFAULT nextval('poll_null_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_officer_assignments ALTER COLUMN id SET DEFAULT nextval('poll_officer_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_officers ALTER COLUMN id SET DEFAULT nextval('poll_officers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_partial_results ALTER COLUMN id SET DEFAULT nextval('poll_partial_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_questions ALTER COLUMN id SET DEFAULT nextval('poll_questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_recounts ALTER COLUMN id SET DEFAULT nextval('poll_recounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_voters ALTER COLUMN id SET DEFAULT nextval('poll_voters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_white_results ALTER COLUMN id SET DEFAULT nextval('poll_white_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY polls ALTER COLUMN id SET DEFAULT nextval('polls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY problems ALTER COLUMN id SET DEFAULT nextval('problems_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY proposal_notifications ALTER COLUMN id SET DEFAULT nextval('proposal_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY proposals ALTER COLUMN id SET DEFAULT nextval('proposals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY signature_sheets ALTER COLUMN id SET DEFAULT nextval('signature_sheets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY signatures ALTER COLUMN id SET DEFAULT nextval('signatures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY site_customization_content_blocks ALTER COLUMN id SET DEFAULT nextval('site_customization_content_blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY site_customization_images ALTER COLUMN id SET DEFAULT nextval('site_customization_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY site_customization_pages ALTER COLUMN id SET DEFAULT nextval('site_customization_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY spending_proposals ALTER COLUMN id SET DEFAULT nextval('spending_proposals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tolk_locales ALTER COLUMN id SET DEFAULT nextval('tolk_locales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tolk_phrases ALTER COLUMN id SET DEFAULT nextval('tolk_phrases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tolk_translations ALTER COLUMN id SET DEFAULT nextval('tolk_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY valuation_assignments ALTER COLUMN id SET DEFAULT nextval('valuation_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY valuators ALTER COLUMN id SET DEFAULT nextval('valuators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY verified_users ALTER COLUMN id SET DEFAULT nextval('verified_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: abre
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY activities (id, user_id, action, actionable_id, actionable_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('activities_id_seq', 1, false);


--
-- Data for Name: administrators; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY administrators (id, user_id) FROM stdin;
1	1
2	43
\.


--
-- Name: administrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('administrators_id_seq', 2, true);


--
-- Data for Name: ahoy_events; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY ahoy_events (id, visit_id, user_id, name, properties, "time", ip) FROM stdin;
d2479ea6-aa6c-445b-840a-6e7d10ddde2c	ad4c9cae-b13e-4190-94f1-3663ce47454f	52	proposal_created	{"proposal_id": 1}	2017-07-14 15:30:17.695793	190.20.86.168
21be3d77-cdbe-4121-af9d-28782ae24d01	c6b240c0-2269-42ed-9bae-7c261b6ebe51	53	proposal_created	{"proposal_id": 2}	2017-07-14 15:31:58.121884	190.20.86.168
b18f9af9-5406-4c99-b2a3-59815d9ea1a1	43aa22ae-1c1c-45b3-8c67-c601f712af5e	55	proposal_created	{"proposal_id": 3}	2017-07-14 17:24:29.142341	190.20.86.168
72f98b63-f29b-4596-adda-c9d022f1a6f3	1d466060-85c6-4006-ad69-5f86da920af4	56	proposal_created	{"proposal_id": 4}	2017-07-14 18:41:15.195026	190.82.22.76
35d17b4e-67a6-48d5-a1e0-5c981720df06	7c31ac54-2907-4390-bc1f-10ad5a8709af	65	proposal_created	{"proposal_id": 5}	2017-07-19 00:55:38.063337	186.37.202.178
85233c90-f1db-41b8-9baa-dbb5a647d05e	32e118af-7521-42b3-bcd8-fc75d3573d13	70	proposal_created	{"proposal_id": 6}	2017-07-19 20:39:49.032997	186.9.135.210
974ccdb8-db4a-4041-9a4c-42a45c9e282f	2aaac855-48bf-4e0c-98ec-6645a554e9da	8	proposal_created	{"proposal_id": 7}	2017-07-19 20:57:48.456023	191.126.34.10
1e8ea840-3a76-4296-a938-52edeb80d765	43b6cbf4-ea5d-41e0-948f-3af79da0dff2	71	proposal_created	{"proposal_id": 8}	2017-07-19 21:06:21.62036	191.126.34.10
16dc966c-1b95-47de-8c1c-b6a951bfb2d3	32e118af-7521-42b3-bcd8-fc75d3573d13	8	proposal_created	{"proposal_id": 9}	2017-07-19 21:09:25.194549	201.219.233.90
b96d7209-15a3-428c-8687-7c11f9350d6e	43b6cbf4-ea5d-41e0-948f-3af79da0dff2	75	proposal_created	{"proposal_id": 10}	2017-07-19 21:19:05.841832	191.126.34.10
0e8aefcb-4d20-458f-a17e-44ab36a9877f	43b6cbf4-ea5d-41e0-948f-3af79da0dff2	77	proposal_created	{"proposal_id": 11}	2017-07-19 21:30:27.841227	191.126.34.10
c06415a4-2924-4600-8813-585d1906fc60	1e1ddc0b-4a00-4b75-bfd1-8bb89cbe0d1b	8	proposal_created	{"proposal_id": 12}	2017-07-19 21:32:02.930547	201.219.233.90
0a292f92-acbd-4963-b306-58b2edd3558a	43b6cbf4-ea5d-41e0-948f-3af79da0dff2	79	proposal_created	{"proposal_id": 13}	2017-07-19 21:40:27.593891	191.126.34.10
e13a31d4-e797-4e76-9e40-38aa62d7840f	1e1ddc0b-4a00-4b75-bfd1-8bb89cbe0d1b	82	proposal_created	{"proposal_id": 14}	2017-07-19 21:56:46.995625	201.219.233.90
d2d90a5d-44b3-48c8-a2b7-0ee15d5c2a60	2aaac855-48bf-4e0c-98ec-6645a554e9da	8	proposal_created	{"proposal_id": 15}	2017-07-19 22:01:20.147053	191.126.34.10
175b5d23-65d4-478d-8a5f-bebf49ce3ab5	2aaac855-48bf-4e0c-98ec-6645a554e9da	8	proposal_created	{"proposal_id": 16}	2017-07-19 22:06:55.454469	191.126.34.10
5a97ecbd-098e-48e7-94b3-2f543aaddd82	2aaac855-48bf-4e0c-98ec-6645a554e9da	84	proposal_created	{"proposal_id": 17}	2017-07-19 22:12:04.681556	191.126.34.10
c0a75651-f1e5-4ef8-9a5c-fd674640be14	2aaac855-48bf-4e0c-98ec-6645a554e9da	8	proposal_created	{"proposal_id": 18}	2017-07-19 22:16:48.397588	191.126.34.10
efd4d9b0-b78b-4ad3-861e-86bf6ebe59bd	2aaac855-48bf-4e0c-98ec-6645a554e9da	8	proposal_created	{"proposal_id": 19}	2017-07-19 22:26:19.767596	191.126.34.10
ac5a7e6d-f3c3-4bdf-841e-d7d3efb01de2	d94a7c54-17f6-4143-8fea-63617038f890	87	proposal_created	{"proposal_id": 20}	2017-07-20 04:28:00.555162	201.215.53.241
e49dfa0e-db53-48d6-9c60-f444f253cdbe	7cdc629c-0765-4d38-8bc7-aff2a4f870e4	94	proposal_created	{"proposal_id": 21}	2017-07-21 01:07:25.802958	190.44.112.22
ab63a4bb-d296-4181-bdf1-b8c019b51881	864644f0-21fa-481e-b6f2-e0435275bbf5	80	proposal_created	{"proposal_id": 22}	2017-07-21 17:56:39.17786	181.160.198.255
64e65e3e-4ae5-431e-a182-a587577d897c	36f330c1-3337-455d-9e84-fda07932032f	101	proposal_created	{"proposal_id": 23}	2017-07-22 19:49:50.612306	191.126.177.32
52e0a04e-5a89-4e70-b290-f22c479e1454	36f6a8bf-937c-4157-89b4-22773b6d0235	102	proposal_created	{"proposal_id": 24}	2017-07-22 20:05:09.539744	190.107.226.32
ba81eb1b-b70a-465c-a62b-918d5d4e2e27	36f330c1-3337-455d-9e84-fda07932032f	103	proposal_created	{"proposal_id": 25}	2017-07-22 20:23:25.959502	191.126.177.32
eda92c36-5239-42b7-9d5a-d62e1acb3e31	2c0dddfe-b13c-4ca9-bca5-143b11ead9a2	8	proposal_created	{"proposal_id": 26}	2017-07-22 20:24:03.470402	191.125.4.185
d0e28419-2bde-43ea-9baf-b768a17d03fe	36f6a8bf-937c-4157-89b4-22773b6d0235	104	proposal_created	{"proposal_id": 27}	2017-07-22 20:24:46.823658	190.107.226.32
d89c7fd9-1284-4836-91e2-c34425faefc9	9bbdcf01-cf3f-4f05-8868-6beb446bb455	106	proposal_created	{"proposal_id": 28}	2017-07-22 20:54:15.064582	191.125.30.150
19c8ee02-74b4-4246-9aba-03b8d064d1cd	6a90b9f9-9e6c-47eb-bd34-2ee35e1abc16	69	proposal_created	{"proposal_id": 29}	2017-07-22 20:57:58.404245	191.125.4.185
0553976b-dcf7-4007-9410-2cf8f6b813cf	9c8ad6a9-719e-4a8c-beae-800d8b91dadd	108	proposal_created	{"proposal_id": 30}	2017-07-22 21:05:04.994363	191.126.133.73
6894184b-4000-4094-a97e-87a353bbfa1e	9bbdcf01-cf3f-4f05-8868-6beb446bb455	107	proposal_created	{"proposal_id": 31}	2017-07-22 21:08:53.857092	191.125.30.150
fbe71120-83e1-4156-b6e6-0b761ed66eb8	9c8ad6a9-719e-4a8c-beae-800d8b91dadd	8	proposal_created	{"proposal_id": 32}	2017-07-22 21:22:05.241384	191.125.54.6
46ca9308-a0c8-4fb2-acad-d02a21c0b86a	9c8ad6a9-719e-4a8c-beae-800d8b91dadd	8	proposal_created	{"proposal_id": 33}	2017-07-22 21:25:18.50553	191.125.54.6
808fcd5b-c71f-42fb-b34c-9960bdfaefbd	6a90b9f9-9e6c-47eb-bd34-2ee35e1abc16	110	proposal_created	{"proposal_id": 34}	2017-07-22 21:58:17.496075	191.125.4.185
957148aa-f74a-478c-a5cf-6cdba48c35d6	8c08c92d-70f3-48a9-a2de-20f5a783cf6a	116	proposal_created	{"proposal_id": 35}	2017-07-23 16:49:56.955806	181.160.8.69
ec824446-43c2-49d8-8e70-417e78161589	85aa116c-2897-4a87-b632-230c227aa0c3	119	proposal_created	{"proposal_id": 36}	2017-07-23 20:24:04.406864	190.100.9.192
973bcc70-9459-4c9c-be09-145ec0fd2720	31e63f92-7930-4009-9d0e-bd75ff3b54e0	8	proposal_created	{"proposal_id": 37}	2017-07-24 21:05:33.231298	191.126.170.185
969f8a40-eeb5-429e-a9f0-b1b176c54dfc	31e63f92-7930-4009-9d0e-bd75ff3b54e0	123	proposal_created	{"proposal_id": 38}	2017-07-24 21:20:20.950506	191.126.170.185
e6d6ffd3-0e53-4418-98fa-6e1bf54b9a60	31e63f92-7930-4009-9d0e-bd75ff3b54e0	8	proposal_created	{"proposal_id": 39}	2017-07-24 21:33:37.869498	191.126.45.63
e2a4e76b-b24b-4b44-ba62-8d50cb9903a0	75b35ea6-c614-4b84-97a2-d1a1d4d09f33	8	proposal_created	{"proposal_id": 40}	2017-07-24 21:46:44.122695	191.125.177.131
780d92a0-04bf-486e-9bcd-f7ccab7a3e35	75b35ea6-c614-4b84-97a2-d1a1d4d09f33	8	proposal_created	{"proposal_id": 41}	2017-07-24 21:58:00.528101	191.125.177.131
84f8790c-5c8e-433d-9783-31d9839c9c85	77524573-1663-4dcb-98fa-c8d2390261c7	124	proposal_created	{"proposal_id": 42}	2017-07-24 22:00:37.963468	191.126.48.192
3bf8a778-0194-49dd-816e-d090d6cc6587	31e63f92-7930-4009-9d0e-bd75ff3b54e0	8	proposal_created	{"proposal_id": 43}	2017-07-24 22:09:43.353857	191.126.48.192
86fb4c2c-0848-4c0d-9558-bdbbd4323768	927eab80-b72e-4d4b-a2ad-6f8a78740d89	127	proposal_created	{"proposal_id": 44}	2017-07-24 22:18:48.531292	191.125.177.131
4f1c8d3b-6b24-45c4-8c0f-aad671e3857b	84df95dc-2484-4f53-86a1-f15ac16b67eb	8	proposal_created	{"proposal_id": 45}	2017-07-24 22:48:00.985633	191.125.177.131
2418dd1a-9149-47c5-8f6a-a427d0390b9c	11a0a7c8-d965-45df-aeb2-d5dc1918bb41	142	proposal_created	{"proposal_id": 46}	2017-07-26 21:48:02.240786	191.126.53.30
078f8cfc-ab75-4e1d-af43-6603673302a5	e5a38c11-7ca7-4b70-b826-b093341fef10	139	proposal_created	{"proposal_id": 47}	2017-07-26 22:11:26.905392	190.160.120.207
f7f7ec3f-08e4-4fc4-aff7-a75e81fc85ea	34e29d31-baa0-4420-91dc-87ffcb66b6c6	197	proposal_created	{"proposal_id": 48}	2017-07-29 21:03:54.925227	181.160.126.5
\.


--
-- Data for Name: annotations; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY annotations (id, quote, ranges, text, created_at, updated_at, user_id, legislation_id) FROM stdin;
\.


--
-- Name: annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('annotations_id_seq', 1, false);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY banners (id, title, description, target_url, style, image, post_started_at, post_ended_at, hidden_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('banners_id_seq', 1, false);


--
-- Data for Name: budget_ballot_lines; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budget_ballot_lines (id, ballot_id, investment_id, created_at, updated_at, budget_id, group_id, heading_id) FROM stdin;
\.


--
-- Name: budget_ballot_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budget_ballot_lines_id_seq', 1, false);


--
-- Data for Name: budget_ballots; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budget_ballots (id, user_id, budget_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: budget_ballots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budget_ballots_id_seq', 1, false);


--
-- Data for Name: budget_groups; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budget_groups (id, budget_id, name) FROM stdin;
\.


--
-- Name: budget_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budget_groups_id_seq', 1, false);


--
-- Data for Name: budget_headings; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budget_headings (id, group_id, name, price) FROM stdin;
\.


--
-- Name: budget_headings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budget_headings_id_seq', 1, false);


--
-- Data for Name: budget_investments; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budget_investments (id, author_id, administrator_id, title, description, external_url, price, feasibility, price_explanation, unfeasibility_explanation, internal_comments, valuation_finished, valuator_assignments_count, price_first_year, duration, hidden_at, cached_votes_up, comments_count, confidence_score, physical_votes, tsv, created_at, updated_at, heading_id, responsible_name, budget_id, group_id, selected, location, organization_name, unfeasible_email_sent_at, ballot_lines_count) FROM stdin;
\.


--
-- Name: budget_investments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budget_investments_id_seq', 1, false);


--
-- Data for Name: budget_valuator_assignments; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budget_valuator_assignments (id, valuator_id, investment_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: budget_valuator_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budget_valuator_assignments_id_seq', 1, false);


--
-- Data for Name: budgets; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY budgets (id, name, currency_symbol, phase, created_at, updated_at, description_accepting, description_reviewing, description_selecting, description_valuating, description_balloting, description_reviewing_ballots, description_finished) FROM stdin;
\.


--
-- Name: budgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('budgets_id_seq', 1, false);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY campaigns (id, name, track_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('campaigns_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY comments (id, commentable_id, commentable_type, body, subject, user_id, created_at, updated_at, hidden_at, flags_count, ignored_flag_at, moderator_id, administrator_id, cached_votes_total, cached_votes_up, cached_votes_down, confirmed_hide_at, ancestry, confidence_score) FROM stdin;
1	1	Proposal	Estas loco!	\N	53	2017-07-14 15:55:18.191307	2017-07-14 15:55:53.751679	\N	0	\N	\N	\N	1	1	0	\N	\N	100
2	3	Proposal	Eselente popuesta, ermano!!!!!!!!!!\r\nno acuantaremos mas.	\N	52	2017-07-14 17:34:02.666477	2017-07-14 17:34:02.666477	\N	0	\N	\N	\N	0	0	0	\N	\N	1
3	5	Proposal	Estimado Vecino,\r\nMuchas gracias por ingresar su propuesta; le comentamos que para esta oportunidad, los recursos y el enfoque del proyecto serán exclusivamente para el Parque San Luis, por lo cuál sería muy bueno que pudiese editar su propuesta, incluyendo ideas y mejoras para este espacio común de vecinos y vecinas. Ante cualquier duda, puede ingresar a la descripción del Desafío.\r\nSaludos cordiales	\N	1	2017-07-19 17:31:06.614822	2017-07-19 19:22:40.062141	\N	0	\N	\N	1	1	1	0	\N	\N	100
4	13	Proposal	Quiero que esta propuesta se realize por que me gusta y es muy buena \r\n	\N	79	2017-07-19 22:08:49.988974	2017-07-19 22:08:49.988974	\N	0	\N	\N	\N	0	0	0	\N	\N	1
5	20	Proposal	¡Excelente propuesta!	\N	52	2017-07-20 19:18:13.244398	2017-07-20 19:18:13.244398	\N	0	\N	\N	\N	0	0	0	\N	\N	1
6	22	Proposal	Esperó que gané nos ayudara. TODOS.	\N	80	2017-07-21 17:57:47.048533	2017-07-21 19:50:00.485386	\N	0	\N	\N	\N	1	1	0	\N	\N	100
7	27	Proposal	Me parece bien la propuesta de más áreas verdes y apoyo a la vecina Margarita Elgueta pero los asientos me parece que hay suficientes.	\N	8	2017-07-22 21:11:20.529013	2017-07-22 21:11:20.529013	\N	0	\N	\N	\N	0	0	0	\N	\N	1
8	34	Proposal	Que se haga un jardín de rozas 	\N	8	2017-07-22 22:53:21.651079	2017-07-22 22:53:21.651079	\N	0	\N	\N	\N	0	0	0	\N	\N	1
9	36	Proposal	Es una propuesta que abarca todo lo que deseamos para nuestro parque	\N	119	2017-07-23 20:26:35.25542	2017-07-23 20:26:35.25542	\N	0	\N	\N	\N	0	0	0	\N	\N	1
10	35	Proposal	Apoyo esta propuesta, le agregaría un huerto (más de uno) para que se intercambien experiencias entre los vecinos del resultado de la siembra.	\N	146	2017-07-26 22:15:36.261961	2017-07-26 22:15:36.261961	\N	0	\N	\N	\N	0	0	0	\N	\N	1
11	20	Proposal	El cierre del parque es importante para la seguridad de todos. Como complemento me interesaría pavimentar el paso peatonal, agregar luminarias, asientos y juegos infantiles  instalados sobre superficie de protección e higiene. 	\N	147	2017-07-26 22:16:11.880886	2017-07-26 22:16:11.880886	\N	0	\N	\N	\N	0	0	0	\N	\N	1
12	16	Proposal	Necesitamos mas asientos o escaños para los vecinos y vecinas, poner bolones o palafitos para que no entren autos a estacionarse.	\N	148	2017-07-26 22:22:58.039599	2017-07-26 22:22:58.039599	\N	0	\N	\N	\N	0	0	0	\N	\N	1
13	15	Proposal	Incluir máquinas de ejercicio par adultos mayores	\N	8	2017-07-29 18:13:42.098453	2017-07-29 18:13:42.098453	\N	0	\N	\N	\N	0	0	0	\N	\N	1
14	36	Proposal	Deseamos que la gruta la saquen, y que se coloquen y arreglen las solerillas.	\N	175	2017-07-29 19:05:32.643027	2017-07-29 19:05:32.643027	\N	0	\N	\N	\N	0	0	0	\N	\N	1
15	23	Proposal	reobicacion de las iluminarias para usar mejor la iluminaria	\N	202	2017-07-29 21:30:57.243694	2017-07-29 21:30:57.243694	\N	0	\N	\N	\N	0	0	0	\N	\N	1
16	15	Proposal	me gusta el proyecto, pero  incluiría la instalación de pilotes por el costado cordillerano del parque, pues constantemente se estacionan autos los días martes secando el pasto del lugar; además el parque necesita mas área verde ( instalación de más pasto)  	\N	203	2017-07-29 21:47:24.225104	2017-07-29 21:47:24.225104	\N	0	\N	\N	\N	0	0	0	\N	\N	1
17	10	Proposal	Pongamos carteles que pidan a los vecinos que limpien al sacar a pasear a sus perros.	\N	33	2017-07-29 22:22:22.940287	2017-07-29 22:22:22.940287	\N	0	\N	\N	\N	0	0	0	\N	\N	1
18	20	Proposal	Lo importante es la mantención y el higiene del parque. Que no hayan cacas de perro.	\N	32	2017-07-29 22:31:10.595154	2017-07-29 22:31:10.595154	\N	0	\N	\N	\N	0	0	0	\N	\N	1
19	20	Proposal	Mi interes principal es por el tema de reciclaje.	\N	34	2017-07-29 22:34:31.799882	2017-07-29 22:34:31.799882	\N	0	\N	\N	\N	0	0	0	\N	\N	1
20	10	Proposal	También es necesario aumentar la vigilancia. Sara Durán	\N	26	2017-07-29 22:56:36.837786	2017-07-29 22:56:36.837786	\N	0	\N	\N	\N	0	0	0	\N	\N	1
21	15	Proposal	rfff\r\n	\N	220	2017-07-30 00:36:10.276497	2017-07-30 00:36:10.276497	\N	0	\N	\N	\N	0	0	0	\N	\N	1
22	22	Proposal	Fomee!!!	\N	79	2017-08-08 20:45:36.042957	2017-08-08 20:45:36.042957	\N	0	\N	\N	\N	0	0	0	\N	\N	1
23	20	Proposal	Eres un fome apoyame plis 	\N	79	2017-08-08 20:47:52.127823	2017-08-08 20:48:04.102731	\N	0	\N	\N	\N	1	1	0	\N	\N	100
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('comments_id_seq', 23, true);


--
-- Data for Name: debates; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY debates (id, title, description, author_id, created_at, updated_at, visit_id, hidden_at, flags_count, ignored_flag_at, cached_votes_total, cached_votes_up, cached_votes_down, comments_count, confirmed_hide_at, cached_anonymous_votes_total, cached_votes_score, hot_score, confidence_score, geozone_id, tsv, featured_at) FROM stdin;
\.


--
-- Name: debates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('debates_id_seq', 1, false);


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
25	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :reset_password_instructions\n- User\n- '66'\n- d3iKyt1xT_DM-wWNzVSq\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb__2732851093087435010_79800840'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:12:in `reset_password_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-19 12:48:27.62434	\N	2017-07-19 12:49:07.092172	\N	mailer	2017-07-19 12:46:48.710467	2017-07-19 12:49:07.09711
20	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '63'\n- 65Uagw9AQXx6qejxjAoM\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb__3417968427733882354_58438460'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-17 21:17:27.352508	\N	2017-07-17 21:18:07.202186	\N	mailer	2017-07-17 21:15:36.641426	2017-07-17 21:18:07.203351
23	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '63'\n- 65Uagw9AQXx6qejxjAoM\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb__1428668043437740077_58191480'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-18 05:43:27.876521	\N	2017-07-18 05:44:07.531004	\N	mailer	2017-07-18 05:42:03.61703	2017-07-18 05:44:07.536263
21	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '64'\n- _bAdZzvxnvxZHCxSX4xg\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb___3868701839473114791_70623380'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-17 21:18:27.929719	\N	2017-07-17 21:19:06.532332	\N	mailer	2017-07-17 21:16:36.911645	2017-07-17 21:19:06.536308
22	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '64'\n- _bAdZzvxnvxZHCxSX4xg\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb__1574611935933234350_75369920'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-17 21:22:26.950872	\N	2017-07-17 21:23:06.051129	\N	mailer	2017-07-17 21:20:17.994153	2017-07-17 21:23:06.055765
24	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '66'\n- tZwR_UVMVt59skLe2QGU\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb___792084385212383034_85272700'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-19 04:54:27.522452	\N	2017-07-19 04:55:06.860528	\N	mailer	2017-07-19 04:53:01.110023	2017-07-19 04:55:06.865969
26	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '67'\n- jwbEJS9XDqxyb45ZmES8\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb__3410820098297945174_47294020'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-19 14:43:27.963051	\N	2017-07-19 14:44:06.655109	\N	mailer	2017-07-19 14:41:38.569827	2017-07-19 14:44:06.660958
27	0	3	--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/object:Devise::Async::Backend::DelayedJob {}\nmethod_name: :perform\nargs:\n- :confirmation_instructions\n- User\n- '67'\n- jwbEJS9XDqxyb45ZmES8\n- {}\n	wrong number of arguments (given 2, expected 1)\n/home/abre/abre/app/helpers/application_helper.rb:51:in `image_path_for'\n/home/abre/abre/app/views/layouts/mailer.html.erb:17:in `_app_views_layouts_mailer_html_erb__1106872930797978633_79801660'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:145:in `block in render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:333:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/template.rb:143:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:66:in `render_with_layout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:52:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/template_renderer.rb:14:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:46:in `render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/renderer/renderer.rb:27:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:100:in `_render_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:83:in `render_to_body'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/rendering.rb:25:in `render'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:904:in `block in collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:918:in `each_template'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:900:in `collect_responses'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:829:in `mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/lib/devise/mailers/helpers.rb:16:in `devise_mail'\n/home/abre/abre/app/mailers/devise_mailer.rb:10:in `block in devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/abre/app/mailers/devise_mailer.rb:9:in `devise_mail'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-3.5.10/app/mailers/devise/mailer.rb:7:in `confirmation_instructions'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:198:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:20:in `block in process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:88:in `__run_callbacks__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:778:in `_run_process_action_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/callbacks.rb:81:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/callbacks.rb:19:in `process_action'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionpack-4.2.8/lib/abstract_controller/base.rb:137:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionview-4.2.8/lib/action_view/rendering.rb:30:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:596:in `block in process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `block in instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications/instrumenter.rb:20:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/activesupport-4.2.8/lib/active_support/notifications.rb:164:in `instrument'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:593:in `process'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/base.rb:584:in `initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `new'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:25:in `__getobj__'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:34:in `message'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/actionmailer-4.2.8/lib/action_mailer/message_delivery.rb:85:in `deliver_now'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:21:in `block in perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/i18n-0.8.1/lib/i18n.rb:257:in `with_locale'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/devise-async-0.10.2/lib/devise/async/backend/base.rb:17:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/performable_method.rb:26:in `perform'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:84:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rollbar-2.14.1/lib/rollbar/plugins/delayed_job/plugin.rb:35:in `block in invoke_job_callback'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/backend/base.rb:81:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:129:in `block in invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/controller_instrumentation.rb:362:in `perform_action_with_newrelic_trace'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/newrelic_rpm-4.1.0.333/lib/new_relic/agent/instrumentation/delayed_job_instrumentation.rb:128:in `invoke_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block (2 levels) in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:91:in `block in timeout'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/timeout.rb:101:in `timeout'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:230:in `block in run'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:229:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `block in reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:306:in `reserve_and_run_one_job'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:213:in `block in work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `times'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:212:in `work_off'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:175:in `block (4 levels) in start'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/benchmark.rb:308:in `realtime'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:174:in `block (3 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:173:in `block (2 levels) in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `loop'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:172:in `block in start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:61:in `block in initialize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:79:in `block in add'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:66:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/lifecycle.rb:40:in `run_callbacks'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/worker.rb:171:in `start'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/delayed_job-4.1.2/lib/delayed/tasks.rb:14:in `block (2 levels) in <top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `block in execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:250:in `execute'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:194:in `block in invoke_with_call_chain'\n/home/abre/.rvm/rubies/ruby-2.3.2/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:187:in `invoke_with_call_chain'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/task.rb:180:in `invoke'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:152:in `invoke_task'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block (2 levels) in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `each'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:108:in `block in top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:117:in `run_with_threads'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:102:in `top_level'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:80:in `block in run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:178:in `standard_exception_handling'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/lib/rake/application.rb:77:in `run'\n/home/abre/.rvm/gems/ruby-2.3.2/gems/rake-12.0.0/exe/rake:27:in `<top (required)>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `load'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/rake:22:in `<main>'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `eval'\n/home/abre/.rvm/gems/ruby-2.3.2/bin/ruby_executable_hooks:15:in `<main>'	2017-07-19 15:14:28.046438	\N	2017-07-19 15:15:06.242051	\N	mailer	2017-07-19 15:12:08.373455	2017-07-19 15:15:06.24613
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 138, true);


--
-- Data for Name: design_events; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY design_events (id, name, starts_at, place, pax, created_at, updated_at, project_id, description, summary, document_file_name, document_content_type, document_file_size, document_updated_at) FROM stdin;
1	Taller de diseño 1 - Integración y apropiación	2017-08-19 14:00:00	Parque San Luis	25	2017-08-10 15:04:45.1142	2017-09-12 20:06:06.178207	1	En este taller definiremos los lineamientos generales del diseño del proyecto, basándonos en las tres propuestas con más apoyos para mejorar el Parque San Luis. Estableceremos las ideas prioritarias y expectativas en torno a la iniciativa y desarrollaremos el prototipo del diseño.		\N	\N	\N	\N
2	Taller de diseño 2 - Construcción del plan de trabajo	2017-09-02 14:00:00	Parque San Luis	14	2017-08-10 15:04:45.121023	2017-09-12 20:06:06.18814	1	La municipalidad presentará una propuesta final que recoja las ideas de los prototipos del Taller 1. Tanto el municipio como la comunidad se harán cargo de las tareas necesarias para llevar a cabo el proyecto y definiremos un equipo encargado de supervisar el desarrollo del trabajo.		\N	\N	\N	\N
\.


--
-- Name: design_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('design_events_id_seq', 4, true);


--
-- Data for Name: direct_messages; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY direct_messages (id, sender_id, receiver_id, title, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: direct_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('direct_messages_id_seq', 1, false);


--
-- Data for Name: failed_census_calls; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY failed_census_calls (id, user_id, document_number, document_type, date_of_birth, postal_code, created_at, updated_at, district_code, poll_officer_id, year_of_birth) FROM stdin;
\.


--
-- Name: failed_census_calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('failed_census_calls_id_seq', 1, false);


--
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY flags (id, user_id, flaggable_type, flaggable_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('flags_id_seq', 1, false);


--
-- Data for Name: geozones; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY geozones (id, name, html_map_coordinates, external_code, population, created_at, updated_at, census_code) FROM stdin;
1	Unidad Vecinal 1	\N	1	3000	2017-07-11 16:40:54.824947	2017-07-11 16:40:54.824947	1
2	Unidad Vecinal 2	\N	2	3000	2017-07-11 16:40:54.82899	2017-07-11 16:40:54.82899	2
3	Unidad Vecinal 3	\N	3	3000	2017-07-11 16:40:54.831428	2017-07-11 16:40:54.831428	3
4	Unidad Vecinal 4	\N	4	3000	2017-07-11 16:40:54.833708	2017-07-11 16:40:54.833708	4
5	Unidad Vecinal 5	\N	5	3000	2017-07-11 16:40:54.835847	2017-07-11 16:40:54.835847	5
6	Unidad Vecinal 6	\N	6	3000	2017-07-11 16:40:54.838167	2017-07-11 16:40:54.838167	6
7	Unidad Vecinal 7	\N	7	3000	2017-07-11 16:40:54.840394	2017-07-11 16:40:54.840394	7
8	Unidad Vecinal 8	\N	8	3000	2017-07-11 16:40:54.842471	2017-07-11 16:40:54.842471	8
9	Unidad Vecinal 9	\N	9	3000	2017-07-11 16:40:54.844795	2017-07-11 16:40:54.844795	9
10	Unidad Vecinal 10	\N	10	3000	2017-07-11 16:40:54.847273	2017-07-11 16:40:54.847273	10
11	Unidad Vecinal 11	\N	11	3000	2017-07-11 16:40:54.849525	2017-07-11 16:40:54.849525	11
12	Unidad Vecinal 12	\N	12	3000	2017-07-11 16:40:54.851723	2017-07-11 16:40:54.851723	12
13	Unidad Vecinal 13	\N	13	3000	2017-07-11 16:40:54.854119	2017-07-11 16:40:54.854119	13
14	Unidad Vecinal 14	\N	14	3000	2017-07-11 16:40:54.856435	2017-07-11 16:40:54.856435	14
15	Unidad Vecinal 15	\N	15	3000	2017-07-11 16:40:54.858607	2017-07-11 16:40:54.858607	15
16	Unidad Vecinal 16	\N	16	3000	2017-07-11 16:40:54.860701	2017-07-11 16:40:54.860701	16
17	Unidad Vecinal 17	\N	17	3000	2017-07-11 16:40:54.862968	2017-07-11 16:40:54.862968	17
18	Unidad Vecinal 18	\N	18	3000	2017-07-11 16:40:54.86528	2017-07-11 16:40:54.86528	18
19	Unidad Vecinal 19	\N	19	3000	2017-07-11 16:40:54.86763	2017-07-11 16:40:54.86763	19
20	Unidad Vecinal 20	\N	20	3000	2017-07-11 16:40:54.86988	2017-07-11 16:40:54.86988	20
21	Unidad Vecinal 21	\N	21	3000	2017-07-11 16:40:54.872142	2017-07-11 16:40:54.872142	21
22	Unidad Vecinal 22	\N	22	3000	2017-07-11 16:40:54.874437	2017-07-11 16:40:54.874437	22
23	Unidad Vecinal 23	\N	23	3000	2017-07-11 16:40:54.876718	2017-07-11 16:40:54.876718	23
24	Unidad Vecinal 24	\N	24	3000	2017-07-11 16:40:54.879138	2017-07-11 16:40:54.879138	24
25	Unidad Vecinal 25	\N	25	3000	2017-07-11 16:40:54.881453	2017-07-11 16:40:54.881453	25
26	Unidad Vecinal 26	\N	26	3000	2017-07-11 16:40:54.883791	2017-07-11 16:40:54.883791	26
27	Unidad Vecinal 27	\N	27	3000	2017-07-11 16:40:54.885993	2017-07-11 16:40:54.885993	27
28	Unidad Vecinal 28	\N	28	3000	2017-07-11 16:40:54.88821	2017-07-11 16:40:54.88821	28
29	Unidad Vecinal 29	\N	29	3000	2017-07-11 16:40:54.890486	2017-07-11 16:40:54.890486	29
30	Unidad Vecinal 30	\N	30	3000	2017-07-11 16:40:54.892661	2017-07-11 16:40:54.892661	30
31	Unidad Vecinal 31	\N	31	3000	2017-07-11 16:40:54.894838	2017-07-11 16:40:54.894838	31
32	La Faena	\N	32	15000	2017-07-11 16:40:54.897116	2017-07-11 16:40:54.897116	32
33	Lo Hermida	\N	33	45000	2017-07-11 16:40:54.89963	2017-07-11 16:40:54.89963	33
34	San Luis	\N	34	44000	2017-07-11 16:40:54.902031	2017-07-11 16:40:54.902031	34
35	Peñalolen Alto	\N	35	57000	2017-07-11 16:40:54.904233	2017-07-11 16:40:54.904233	35
36	Peñalolen Nuevo	\N	36	70000	2017-07-11 16:40:54.9065	2017-07-11 16:40:54.9065	36
\.


--
-- Name: geozones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('geozones_id_seq', 36, true);


--
-- Data for Name: geozones_polls; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY geozones_polls (id, geozone_id, poll_id) FROM stdin;
\.


--
-- Name: geozones_polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('geozones_polls_id_seq', 1, false);


--
-- Data for Name: geozones_problems; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY geozones_problems (problem_id, geozone_id) FROM stdin;
3	23
\.


--
-- Data for Name: geozones_projects; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY geozones_projects (project_id, geozone_id) FROM stdin;
1	23
\.


--
-- Data for Name: geozones_proposals; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY geozones_proposals (proposal_id, geozone_id) FROM stdin;
5	23
6	23
7	23
8	23
9	23
10	23
11	23
12	23
13	23
14	23
15	23
16	23
17	23
18	23
19	23
20	23
21	23
22	23
23	23
24	23
25	23
26	23
27	23
28	23
29	23
30	23
31	23
32	23
33	23
34	23
35	23
36	23
37	23
38	23
39	23
40	23
41	23
42	23
43	23
44	23
45	23
46	23
47	23
48	23
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY identities (id, user_id, provider, uid, created_at, updated_at) FROM stdin;
1	43	facebook	10211101275460481	2017-07-11 16:42:19.17688	2017-07-11 16:42:19.27288
62	169	facebook	10213675760513549	2017-07-29 18:37:13.849966	2017-07-29 18:37:13.934614
2	52	facebook	1173461602758696	2017-07-13 23:42:15.081604	2017-07-13 23:42:15.187238
3	54	facebook	10213683972352670	2017-07-14 16:27:53.335036	2017-07-14 16:27:53.421764
63	170	facebook	1272587406197340	2017-07-29 18:39:34.488131	2017-07-29 18:39:34.572082
4	56	facebook	10155343539881142	2017-07-14 18:28:35.205855	2017-07-14 18:28:35.306745
5	57	facebook	315625725530534	2017-07-17 19:08:13.698967	2017-07-17 19:08:13.785619
64	171	facebook	1599953216745283	2017-07-29 18:41:24.245683	2017-07-29 18:41:24.332292
6	59	facebook	1369757253139059	2017-07-17 20:24:41.146904	2017-07-17 20:24:41.249011
7	60	facebook	10213110004445440	2017-07-17 20:27:39.334155	2017-07-17 20:27:39.416875
65	172	facebook	776123502554043	2017-07-29 18:46:23.612421	2017-07-29 18:46:23.697796
8	63	facebook	10212762663637531	2017-07-18 05:40:39.930269	2017-07-18 05:40:39.948297
9	65	facebook	10156012469729749	2017-07-19 00:35:52.290361	2017-07-19 00:35:52.402337
66	178	facebook	828226027354185	2017-07-29 18:58:56.054868	2017-07-29 18:58:56.142184
10	69	facebook	10213911105591789	2017-07-19 16:30:17.891344	2017-07-19 16:30:17.980654
11	70	facebook	10209867668109159	2017-07-19 20:37:23.448117	2017-07-19 20:37:23.550296
67	186	facebook	10211524978692358	2017-07-29 20:06:54.491658	2017-07-29 20:06:54.579452
12	74	facebook	1382451551831246	2017-07-19 21:01:25.633326	2017-07-19 21:01:25.716783
13	75	facebook	10214756169357285	2017-07-19 21:11:13.800548	2017-07-19 21:11:13.883491
68	196	facebook	10212270365208579	2017-07-29 20:38:02.57799	2017-07-29 20:38:02.662576
14	81	facebook	1460379490708197	2017-07-19 21:41:30.167739	2017-07-19 21:41:30.252163
15	84	facebook	10212946222312175	2017-07-19 22:09:05.004102	2017-07-19 22:09:05.099361
69	197	facebook	10155550542487556	2017-07-29 20:51:26.327716	2017-07-29 20:51:26.414567
16	73	facebook	10213152881757501	2017-07-19 22:20:22.735013	2017-07-19 22:20:22.748085
17	85	facebook	10156020071522080	2017-07-20 01:03:32.325243	2017-07-20 01:03:32.430041
70	204	facebook	10214007355047774	2017-07-29 21:42:15.529671	2017-07-29 21:42:15.614571
18	87	facebook	1826290360720631	2017-07-20 03:34:43.298183	2017-07-20 03:34:43.383574
19	88	facebook	1898970463677180	2017-07-20 04:32:19.418527	2017-07-20 04:32:19.502427
71	209	facebook	10213566950386767	2017-07-29 22:07:50.240604	2017-07-29 22:07:50.324976
20	90	facebook	1891108934496999	2017-07-20 15:49:26.19059	2017-07-20 15:49:26.289546
21	91	facebook	10214151013829039	2017-07-20 15:51:09.954791	2017-07-20 15:51:10.047314
72	216	facebook	1714163328877970	2017-07-29 22:50:40.758726	2017-07-29 22:50:40.852271
22	92	facebook	228005764388936	2017-07-20 15:51:11.01765	2017-07-20 15:51:11.126274
23	93	facebook	10213747665828895	2017-07-20 23:30:44.277488	2017-07-20 23:30:44.365446
73	218	facebook	1915053222067528	2017-07-29 22:59:59.675102	2017-07-29 22:59:59.760453
24	94	facebook	443589229341875	2017-07-21 00:55:13.730605	2017-07-21 00:55:13.816684
25	95	facebook	335126860243540	2017-07-21 01:19:37.415663	2017-07-21 01:19:37.51653
74	220	facebook	10213410344557622	2017-07-30 00:23:21.539333	2017-07-30 00:23:21.626039
26	96	facebook	1626660430741919	2017-07-21 02:03:36.296507	2017-07-21 02:03:36.382798
27	98	facebook	10155527743487943	2017-07-21 18:55:46.036428	2017-07-21 18:55:46.12464
75	221	facebook	10212692365479319	2017-07-31 00:17:59.985587	2017-07-31 00:18:00.076476
28	99	facebook	10155619131099106	2017-07-21 19:12:32.541765	2017-07-21 19:12:32.628418
29	100	facebook	1936888833192369	2017-07-21 19:55:03.662502	2017-07-21 19:55:03.751112
76	222	facebook	1339982412785785	2017-07-31 00:21:59.32963	2017-07-31 00:21:59.414665
30	106	facebook	1447146848711089	2017-07-22 20:48:22.620266	2017-07-22 20:48:22.706674
31	108	facebook	1584133884970738	2017-07-22 21:02:26.038797	2017-07-22 21:02:26.124953
32	110	facebook	10214082655247324	2017-07-22 21:48:57.676726	2017-07-22 21:48:57.762433
33	116	facebook	10213878893707918	2017-07-23 15:57:43.275979	2017-07-23 15:57:43.36171
34	119	facebook	10154538179776331	2017-07-23 19:59:06.428799	2017-07-23 19:59:06.514444
35	120	facebook	10213236411442339	2017-07-24 00:18:08.685588	2017-07-24 00:18:08.772317
36	121	facebook	10155683027523470	2017-07-24 17:08:39.94063	2017-07-24 17:08:40.034373
37	123	facebook	10155383528658726	2017-07-24 21:15:21.420395	2017-07-24 21:15:21.50716
38	124	facebook	10213005136783713	2017-07-24 21:40:05.338581	2017-07-24 21:40:05.427359
39	125	facebook	10208490845301798	2017-07-24 21:49:33.838808	2017-07-24 21:49:33.922743
40	126	facebook	1411251678959375	2017-07-24 21:52:45.853207	2017-07-24 21:52:45.948448
41	127	facebook	1278767585583875	2017-07-24 22:11:39.09	2017-07-24 22:11:39.181608
42	129	facebook	10214222440456944	2017-07-25 19:13:22.263513	2017-07-25 19:13:22.276333
43	130	facebook	10213001823818192	2017-07-25 19:17:00.910564	2017-07-25 19:17:01.001708
44	131	facebook	10203317899225420	2017-07-26 16:02:13.972116	2017-07-26 16:02:14.058959
45	132	facebook	163497094195589	2017-07-26 16:05:08.926778	2017-07-26 16:05:09.015885
46	133	facebook	10213654303569108	2017-07-26 16:08:06.527569	2017-07-26 16:08:07.219522
47	134	facebook	10213665566334842	2017-07-26 16:10:21.66823	2017-07-26 16:10:21.760003
48	135	facebook	10213686561701704	2017-07-26 16:41:15.614555	2017-07-26 16:41:15.729006
49	137	facebook	10213907670905199	2017-07-26 21:04:38.03065	2017-07-26 21:04:38.115646
50	143	facebook	1439021476185049	2017-07-26 21:42:40.063764	2017-07-26 21:42:40.152213
51	147	facebook	10214212507085287	2017-07-26 22:11:05.709768	2017-07-26 22:11:05.805253
52	150	facebook	1646798178673461	2017-07-26 22:36:45.469372	2017-07-26 22:36:45.564239
53	152	facebook	10213370950418245	2017-07-26 22:53:03.169423	2017-07-26 22:53:03.256921
54	153	facebook	10211793249778330	2017-07-26 22:57:23.191194	2017-07-26 22:57:23.285979
55	160	facebook	2013350792222294	2017-07-29 15:24:47.57936	2017-07-29 15:24:47.666984
56	161	facebook	10213423983934556	2017-07-29 17:59:41.331047	2017-07-29 17:59:41.415983
57	138	facebook	10210709920047673	2017-07-29 18:11:28.304769	2017-07-29 18:11:28.317254
58	164	facebook	501502013532505	2017-07-29 18:23:51.714557	2017-07-29 18:23:51.800632
59	165	facebook	1760724760608589	2017-07-29 18:26:45.426575	2017-07-29 18:26:45.511223
60	166	facebook	1729487490412689	2017-07-29 18:28:45.986625	2017-07-29 18:28:46.073866
61	167	facebook	1622198741165013	2017-07-29 18:31:44.452912	2017-07-29 18:31:44.540429
\.


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('identities_id_seq', 76, true);


--
-- Data for Name: legislations; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY legislations (id, title, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: legislations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('legislations_id_seq', 1, false);


--
-- Data for Name: locks; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY locks (id, user_id, tries, locked_until, created_at, updated_at) FROM stdin;
1	42	0	2000-01-01 01:01:01	2017-07-11 20:45:45.548154	2017-07-11 20:45:45.548154
2	47	0	2000-01-01 01:01:01	2017-07-11 22:29:06.846058	2017-07-11 22:29:06.846058
3	52	0	2000-01-01 01:01:01	2017-07-14 15:23:41.444227	2017-07-14 15:23:41.444227
4	53	0	2000-01-01 01:01:01	2017-07-14 15:59:24.134744	2017-07-14 15:59:24.134744
5	55	0	2000-01-01 01:01:01	2017-07-14 16:33:53.284817	2017-07-14 16:33:53.284817
6	8	0	2000-01-01 01:01:01	2017-07-17 19:07:54.166524	2017-07-17 19:07:54.166524
7	58	0	2000-01-01 01:01:01	2017-07-17 19:17:56.685508	2017-07-17 19:17:56.685508
8	60	0	2000-01-01 01:01:01	2017-07-17 20:40:40.54767	2017-07-17 20:40:40.54767
9	125	0	2000-01-01 01:01:01	2017-07-24 21:50:07.399461	2017-07-24 21:50:07.399461
10	133	0	2000-01-01 01:01:01	2017-07-26 16:11:22.17714	2017-07-26 16:11:22.17714
\.


--
-- Name: locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('locks_id_seq', 10, true);


--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY managers (id, user_id) FROM stdin;
1	3
\.


--
-- Name: managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('managers_id_seq', 1, true);


--
-- Data for Name: moderators; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY moderators (id, user_id) FROM stdin;
1	2
\.


--
-- Name: moderators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('moderators_id_seq', 1, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY notifications (id, user_id, notifiable_id, notifiable_type, counter, emailed_at) FROM stdin;
3	65	5	Proposal	1	\N
5	104	27	Proposal	1	\N
6	110	34	Proposal	1	\N
7	116	35	Proposal	1	\N
9	119	36	Proposal	1	\N
10	101	23	Proposal	1	\N
12	75	10	Proposal	2	\N
13	80	22	Proposal	1	\N
4	87	20	Proposal	5	\N
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('notifications_id_seq', 13, true);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY organizations (id, user_id, name, verified_at, rejected_at, responsible_name) FROM stdin;
1	9	Vázquez, Olivo y Mejía Asociados	\N	2017-07-11 16:40:55.790414	Lorenzo Vásquez de Jesús
2	10	Luevano Tejeda S.A.	\N	2017-07-11 16:40:55.884665	Sr. Lourdes Santillán Leiva
3	11	Rodríquez, Deleón y Gonzales Asociados	2017-07-11 16:40:55.973831	\N	Francisco Jaimes Morales
4	12	Moya, Matías y Pulido Asociados	2017-07-11 16:40:56.063911	\N	Catalina Macías Romero
5	13	Olivas, Esquibel y Escamilla Asociados	\N	2017-07-11 16:40:56.158451	Antonio Parra Alcaraz
6	14	Fonseca Hermanos	2017-07-11 16:40:56.248082	\N	Sta. Nicolás Valdez Urrutia
7	15	Gastélum y Castillo	2017-07-11 16:40:56.336424	\N	Rodrigo Benavídez Téllez
8	16	Tejada, Limón y Mendoza Asociados	2017-07-11 16:40:56.42433	\N	María Teresa Toro Lerma
9	17	Mercado Gonzales S.A.	\N	2017-07-11 16:40:56.51175	María Eugenia Villareal Alicea
10	18	Cintrón S.L.	\N	2017-07-11 16:40:56.599779	Rafael Noriega Orosco
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('organizations_id_seq', 10, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY pictures (id, created_at, updated_at, design_event_id, image_file_name, image_content_type, image_file_size, image_updated_at, report_id) FROM stdin;
5	2017-09-22 16:42:00.158758	2017-09-22 16:42:00.158758	1	IMG_20170819_184303.jpg	image/jpeg	499341	2017-09-22 16:41:54.051062	\N
6	2017-09-22 16:42:00.168608	2017-09-22 16:42:00.168608	1	IMG_20170819_184324.jpg	image/jpeg	425207	2017-09-22 16:41:55.304714	\N
7	2017-09-22 16:42:00.210535	2017-09-22 16:42:00.210535	1	IMG_20170819_184341.jpg	image/jpeg	446496	2017-09-22 16:41:56.462675	\N
8	2017-09-22 16:42:00.219543	2017-09-22 16:42:00.219543	1	IMG_20170819_184436.jpg	image/jpeg	404442	2017-09-22 16:41:57.607743	\N
2	2017-09-12 20:06:06.181035	2017-09-22 16:42:00.228132	1	IMG_20170819_184412.jpg	image/jpeg	437439	2017-09-22 16:41:58.864745	\N
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('pictures_id_seq', 8, true);


--
-- Data for Name: poll_answers; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_answers (id, question_id, author_id, answer, created_at, updated_at) FROM stdin;
\.


--
-- Name: poll_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_answers_id_seq', 1, false);


--
-- Data for Name: poll_booth_assignments; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_booth_assignments (id, booth_id, poll_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: poll_booth_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_booth_assignments_id_seq', 1, false);


--
-- Data for Name: poll_booths; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_booths (id, name, location) FROM stdin;
\.


--
-- Name: poll_booths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_booths_id_seq', 1, false);


--
-- Data for Name: poll_final_recounts; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_final_recounts (id, booth_assignment_id, officer_assignment_id, count, count_log, created_at, updated_at, officer_assignment_id_log, date) FROM stdin;
\.


--
-- Name: poll_final_recounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_final_recounts_id_seq', 1, false);


--
-- Data for Name: poll_null_results; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_null_results (id, author_id, amount, origin, date, booth_assignment_id, officer_assignment_id, amount_log, officer_assignment_id_log, author_id_log) FROM stdin;
\.


--
-- Name: poll_null_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_null_results_id_seq', 1, false);


--
-- Data for Name: poll_officer_assignments; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_officer_assignments (id, booth_assignment_id, officer_id, created_at, updated_at, date, final, user_data_log) FROM stdin;
\.


--
-- Name: poll_officer_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_officer_assignments_id_seq', 1, false);


--
-- Data for Name: poll_officers; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_officers (id, user_id, failed_census_calls_count) FROM stdin;
1	5	0
\.


--
-- Name: poll_officers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_officers_id_seq', 1, true);


--
-- Data for Name: poll_partial_results; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_partial_results (id, question_id, author_id, answer, amount, origin, date, booth_assignment_id, officer_assignment_id, amount_log, officer_assignment_id_log, author_id_log) FROM stdin;
\.


--
-- Name: poll_partial_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_partial_results_id_seq', 1, false);


--
-- Data for Name: poll_questions; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_questions (id, proposal_id, poll_id, author_id, author_visible_name, title, valid_answers, description, comments_count, hidden_at, created_at, updated_at, tsv) FROM stdin;
\.


--
-- Name: poll_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_questions_id_seq', 1, false);


--
-- Data for Name: poll_recounts; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_recounts (id, booth_assignment_id, officer_assignment_id, count, count_log, created_at, updated_at, date, officer_assignment_id_log) FROM stdin;
\.


--
-- Name: poll_recounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_recounts_id_seq', 1, false);


--
-- Data for Name: poll_voters; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_voters (id, document_number, document_type, created_at, updated_at, poll_id, booth_assignment_id, age, gender, geozone_id, answer_id, officer_assignment_id, user_id) FROM stdin;
\.


--
-- Name: poll_voters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_voters_id_seq', 1, false);


--
-- Data for Name: poll_white_results; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY poll_white_results (id, author_id, amount, origin, date, booth_assignment_id, officer_assignment_id, amount_log, officer_assignment_id_log, author_id_log) FROM stdin;
\.


--
-- Name: poll_white_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('poll_white_results_id_seq', 1, false);


--
-- Data for Name: polls; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY polls (id, name, description, starts_at, ends_at, published, geozone_restricted, for_challenge) FROM stdin;
\.


--
-- Name: polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('polls_id_seq', 1, false);


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY problems (id, title, description, cause, problem_title, consequence, budget, restriction, summary, starts_at, ends_at, geozone_restricted, active, created_at, updated_at, user_id, call_to_action, restriction_summary) FROM stdin;
3	SOÑEMOS EL PARQUE SAN LUIS	Rediseñar el Parque San Luis. Hacerlo más amable, más seguro y más hermoso.\r\n¿Qué te parece?\r\n¿Te atreves?\r\nSe trata de que las y los Vecinos de la Unidad Vecinal 23 junto a la Municipalidad de Peñalolén y la Fundación Ciudadano Inteligente postulemos juntos por $60.000.000 ante la SUBDERE con el mejor proyecto. Así podremos postular un Programa (PMU) por ese monto.\r\nTus ideas las debes dejar plasmadas en la plataforma de Internet que estará disponible a contar del 17 de julio hasta el 30 de julio.\r\nAhí podrás ingresar propuestas, las que iremos tomando y convirtiendo en un proyecto de arquitectura del paisaje. Luego nos reuniremos a desarrollar un taller de diseño, que junto a los aspectos técnicos, permitirán presentar una excelente postulación.	Porque si los espacios públicos no responden a la necesidades planteadas desde la mirada de los usuarios, no son utilizados correctamente para la vida colectiva, la cercanía y convivencia de barrio tan necesaria para el trabajo en comunidad de los habitantes de Peñalolén.	Los espacios y áreas verdes de la Municipalidad, son centrales. Esto es  generación de comunidad, lugar de encuentro, identidad. Hoy la comunidad de la Unidad Vecinal 23 nos ha planteado la necesidad de que todo esto que mencionamos efectivamente sea más potente en el Parque San Luis, lo que coincide con el Programa de Gestión del municipio.		$60.000.000 (incluyen el IVA y la utilidad de la empresa constructora que se adjudique la licitación).	Esta iniciativa, expresada desde la comunidad y ordenada desde el Municipio y la Fundación Ciudadano Inteligente tiene algunas restricciones iniciales que debemos contemplar; más, independiente de esto, los invitamos a resolver lo que si podemos hoy. Así demostramos que esta comunidad construye colaborativamente.\r\n\r\nPrimero: Tenemos un tope de $60.000.000 (que incluyen el IVA y la utilidad de la empresa constructora que se adjudique la licitación); no es todo el dinero que quisiéramos, pero bien planificado y con mucha información podremos diseñar un proyecto INTELIGENTE. Por ello es MUY IMPORTANTE QUE PARTICIPES. Tenemos buenos profesionales y mucha experiencia, pero los verdaderos expertos en conocer que necesitamos, son ustedes, vecinos.\r\n\r\nSegundo: En esta oportunidad no podremos rediseñar o incluir iluminación. Sabemos que es uno de los aspectos más importantes, en esa línea, los iremos gestionando por otras vías.\r\n\r\nTercero: Los tipos de Juegos Infantiles tienen ya una definición previa, por lo que en otra etapa los complementaremos.\r\n\r\nCuarto: En esta oportunidad no existirá intervención en la Multicancha, ya que eso nos restaría  mucho dinero del proyecto total. En proyecto distinto, generaremos este mejoramiento.\r\n\r\nQuinto: Si bien no es una restricción el uso de pavimentos, debemos entender que la excesiva instalación de pavimentos (cemento, adoquines, adocretos, asfaltos u otro) irá restando financiamiento al proyecto de paisajismo y otros aspectos del espacio. No obstante las zonas de juego, zonas de estar, encuentro, etc. si deben ser aseguradas con superficies duras para su mayor seguridad. Por todo ello, la imaginación, el privilegio por la vegetación la mirada de "San Luis sobre su espacio”, es fundamental.	El nuevo Parque San Luis lo re-diseñaremos en conjunto. A través de esta plataforma recogeremos propuestas ciudadanas para abordar este proyecto y mejorar entre todos este importante espacio comunitario. ¡Lo que decidamos será realizado por la Municipalidad!	2017-07-16 22:00:00	2017-07-29 22:00:00	t	t	2017-07-17 12:57:55.560648	2017-07-17 20:41:18.272827	1	¡Ingresa tu idea para el proyecto de renovación del Parque San Luis, construyamos un espacio de comunidad para nuestras familias!	\N
\.


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('problems_id_seq', 3, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY projects (id, neighbour_id, responsible_id, name, description, starts_at, ends_at, geozone_restricted, proposal_id, created_at, updated_at, responsible_official_name, responsible_official_mail, implementation_starts_at, implementation_ends_at, responsible_neighbour_name, responsible_neighbour_mail, responsible_neighbour_phone) FROM stdin;
1	\N	\N	Mejoramiento Parque San Luis		\N	\N	t	\N	2017-08-10 15:04:45.103514	2017-08-18 19:05:26.336456			\N	\N			
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('projects_id_seq', 1, true);


--
-- Data for Name: proposal_notifications; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY proposal_notifications (id, title, body, author_id, proposal_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: proposal_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('proposal_notifications_id_seq', 1, false);


--
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY proposals (id, title, description, deadline, question, what, why, external_url, author_id, hidden_at, prioritize, flags_count, ignored_flag_at, cached_votes_up, comments_count, confirmed_hide_at, for_challenge, hot_score, confidence_score, created_at, updated_at, responsible_name, summary, video_url, tsv, retired_at, retired_reason, retired_explanation, problem_id, project_id) FROM stdin;
35	Parque Autosustentable de San Luis	Mi propuesta nace de sumar un pequeño pulmón verde a Peñalolén, comuna que se caracteriza por tener varios sectores verdes, potenciar los recursos renovables y educar sobre la autosustentabilidad y cuidado del medio ambiente pero en sectores más precordilleranos, falta un lugar así en sectores como San Luis. \r\nEl proyecto consiste en la creación de un punto limpio para educar e incentivar la cultura del reciclaje. Además añadir un sector de compostaje, no importa si es grande o pequeño ya que el fin de esto es enseñar a los niños desde pequeños el proceso de la basura, el reciclaje y sus alternativas; mostrar que la basura orgánica no tiene porque ir a parar a un vertedero si no que se puede reutilizar en el mismo parque y en los mismos árboles que verán crecer. También creo importante incorporar mayor cantidad de árboles y mas aún especies nativas de la zona con su respectiva identificación y caracteristicas (nombre común, nombre cientifico, años de crecimiento, altura promedio alcanzada en etapa adulta, etc) creando un paseo de cultura árborea de nuestro sector. Cabe mencionar también la repavimentación del parque, inclsuión de bancas duras, y mejoras al sector de cesped para permitir talleres al aire libre como yoga, acondicionamiento fisico, actividades para la tercera edad, etc. Para terminar renovar y mejorar el cerco perimetral metálico para brindar mejor seguridad al parque.\r\nComo se puede ver el fin al que apunta mi propuesta es mas bien al cultural y al cuidado, no se trata de grandes inversiones de recursos si no mas bien una apuesta a la forma de pensar y crecer.\r\n\r\nEsas son las principales carácteristicas de la propuesta teniendo en cuenta los alcances del proyecto (cancha, luminarias, etc).\r\n\r\nGracias.	\N	\N	\N			116	\N	\N	0	\N	10	1	\N	t	7707099533	1000	2017-07-23 16:49:56.910858	2017-07-29 23:06:39.865648	Walter Reyes Cid	Aumentar número de árboles e incluir especies nativas, añadir un punto limpio y un sector de compostaje. Mejorar pavimentos, cierre perimetral y áreas verdes para permitir talleres al aire libre.		'acondicion':250 'activ':252 'adem':112 'adult':214 'air':44C,246 'alcanc':325 'alcanz':211 'altern':147 'altur':209 'ambient':12B,79 'anad':24C,113 'anos':206 'apuest':305 'apunt':281 'arbol':19C,176,187 'arbore':221 'are':38C 'asi':88 'aument':16C 'aun':190 'autosustent':2A,74 'banc':234 'basur':142,151 'bien':286,303 'brind':268 'cab':225 'canch':328 'cantid':185 'caracterist':201,317 'caracteriz':60 'cerc':264 'cesp':241 'cid':8B 'cientif':205 'cierr':35C 'compostaj':32C,117 'comun':57,203 'cons':96 'cre':181,216 'creacion':99 'crec':179,312 'crecimient':208 'cuent':323 'cuid':76,291 'cultur':10B,109,220 'cultural':288 'dur':235 'edad':256 'educ':71,105 'ensen':132 'especi':22C,191 'etap':213 'etc':215,257,330 'falt':85 'fin':128,278 'fisic':251 'form':308 'geozon':15B 'graci':331 'grand':122,296 'identificacion':199 'import':119,182 'incentiv':107 'inclsuion':232 'inclu':21C 'incorpor':183 'inversion':297 'ir':156 'libr':45C,247 'limpi':27C,103 'lug':87 'luis':5A,93 'luminari':329 'mas':83,189,285,302 'mayor':184 'medi':11B,78 'mejor':33C,237,262,269 'mencion':226 'metal':266 'mism':170,175 'mostr':148 'nac':48 'nativ':23C,192 'nin':135 'nombr':202,204 'numer':17C 'organ':152 'par':158 'parqu':1A,171,231,272 'participacion':9B 'pase':218 'paviment':34C 'penalol':56 'pens':310 'pequen':52,124,137 'perimetral':36C,265 'permit':41C,243 'potenci':66 'precordilleran':84 'principal':316 'proces':139 'promedi':210 'propuest':47,283,320 'proyect':95,327 'pued':166,275 'pulmon':53 'punt':26C,102 'reciclaj':111,144 'recurs':68,299 'renov':69,260 'repavimentacion':229 'respect':198 'reutiliz':167 'rey':7B 'san':4A,92 'sector':30C,64,82,90,115,224,239 'segur':270 'si':120,162,300 'sostenibil':13B 'sum':50 'taller':42C,244 'tambi':180,227 'ten':62 'tercer':255 'termin':259 'transparent':14B 'trat':294 'vari':63 'ver':178,276 'verd':39C,54,65 'verteder':161 'walt':6B 'yog':249 'zon':195	\N	\N	\N	3	\N
14	Juegos modernos	el problema es que los juegos no se ocupan por que estan en mal estado y son poco llamativos.\r\n se necesitan  resfalines mas altos , toboganes  de diferentes formas , actividades al aire libre , remodelar la cancha.\r\n	\N	\N	\N	es un espacio de poco uso , y ayudaría a que la gente saliera mas .		82	\N	\N	0	\N	0	0	\N	t	7659144325	1	2017-07-19 21:56:46.967976	2017-07-19 21:56:46.967976	paloma y ayalen 	juegos viejos y pocos llamativos , se necesitan juegos mas modernos y coloridos .		'activ':47 'air':49 'altos':42 'canch':53 'color':18C 'deport':4B 'diferent':45 'estan':30 'form':46 'geozon':6B 'jueg':1A,7C,14C,24 'libr':50 'llamat':11C,37 'mal':32 'mas':15C,41 'mod':2A,16C 'necesit':13C,39 'ocup':27 'paloma1234':3B 'participacion':5B 'poc':10C 'problem':20 'remodel':51 'resfalin':40 'tobogan':43 'viej':8C	\N	\N	\N	3	\N
48	Sector en ayuda de vecinos y medio ambiente 	El punto limpio dentro del parque estaría dividido en dos sectores, uno de reciclaje con contenedores separadores donde esos residuos sean gestionados por la municipalidad o incluso para personas que venden plástico o vidrio para que también puedan sacar algún provecho monetario del tema. El otro sector constaría de composteras donde dejar nuestro residuo orgánico y con el abono como resultado generar huertos urbanos ya sea en el mismo parque o en áreas verdes cercanos al sector , esto formaría un ciclo más sustentable y donde los vecinos verían el fruto de sus propios residuos obteniendo un beneficio aparte de estar ayudando al medio ambiente.	\N	\N	\N	Creo que es trabajo de todos poder mejorar el lugar donde vivimos y así también ayudar al medio ambiente , esta propuesta seria parte de un pedazo de algo que se podría implementar donde propuestas que ayuden a mejorar la delicuencia con temas de iluminación , área verde y rejas para este lugar serían un complemento.		197	\N	\N	0	\N	0	0	\N	t	7758777184	1	2017-07-29 21:03:54.87011	2017-07-29 21:03:54.87011	Silvana Ortega Gatica 	Crear un espacio tipo punto limpio de reciclaje y compostaje , donde el abono generado se utilice en huertos urbanos en beneficio de lo vecinos con lo que se produzca.		'abon':31C,106 'algun':87 'ambient':8A,13B,151 'apart':145 'are':120 'ayud':3A,148 'benefici':39C,144 'cercan':122 'cicl':128 'compostaj':28C 'composter':97 'constari':95 'contenedor':63 'cre':19C 'dej':99 'dentr':51 'derech':15B 'divid':55 'dos':57 'equid':17B 'espaci':21C 'estari':54 'formari':126 'frut':137 'gatic':11B 'gener':32C,109 'geozon':18B 'gestion':69 'huert':36C,110 'inclus':74 'limpi':24C,50 'mas':129 'medi':7A,12B,150 'mism':116 'monetari':89 'municipal':72 'obten':142 'organ':102 'orteg':10B 'parqu':53,117 'person':76 'plastic':79 'produzc':47C 'propi':140 'provech':88 'pued':85 'punt':23C,49 'reciclaj':26C,61 'residu':67,101,141 'result':108 'sac':86 'sector':1A,58,94,124 'separ':64 'silvan':9B 'social':16B 'sostenibil':14B 'sustent':130 'tambi':84 'tem':91 'tip':22C 'urban':37C,111 'utilic':34C 'vecin':5A,42C,134 'vend':78 'verd':121 'veri':135 'vidri':81	\N	\N	\N	3	\N
17	Pavimentación del Parque	Los ingresos al parque y el centro que sea pavimentado. Que tenga pasto el resto	\N	\N	\N	Los niños van a tener mas facilidades para ingresar, y será un sector mas limpio		84	\N	\N	0	\N	3	0	\N	t	7664021750	300	2017-07-19 22:12:04.642801	2017-07-29 21:12:45.436082	Victoria Vela 	Hacer un promedio entre la pavimentación el pasto		'ambient':12B 'centr':28 'emergent':10B 'geozon':13B 'hac':14C 'ingres':23 'leon':6B 'medi':11B 'movil':7B 'parqu':3A,25 'past':21C,34 'paviment':31 'pavimentacion':1A,19C 'promedi':16C 'rest':36 'segur':8B 'vel':5B 'victori':4B	\N	\N	\N	3	\N
18	Mejoramiento del Parque 	Se necesitan mas asientos para los adultos mayores, y juegos infantiles. Se piden cierres en el parque para el ingreso	\N	\N	\N	queremos mejorar la seguridad del parque y el acceso para las familias		8	\N	\N	0	\N	2	0	\N	t	7662293675	200	2017-07-19 22:16:48.36194	2017-07-29 21:13:03.150749	Hector Romero Arias	Mejores luminarias con asientos y juegos		'adult':25 'ambient':11B 'asient':16C,22 'cierr':32 'deport':6B 'emergent':9B 'geozon':12B 'infantil':29 'ingres':38 'jueg':18C,28 'luminari':14C 'mas':21 'mayor':26 'medi':10B 'mejor':1A,13C 'necesit':20 'parqu':3A,35 'penalol':5B 'pid':31 'segur':7B 'vecin':4B	\N	\N	\N	3	\N
19	Un parque más hermoso	Un parque con más iluminación y más pasto.	\N	\N	\N			8	\N	\N	0	\N	0	0	\N	t	7659349507	1	2017-07-19 22:26:19.739703	2017-07-19 22:26:19.739703	Guillermina Olave Fuentes	Más iluminación\r\nMás pasto\r\nMás basureros		'ambient':9B 'basurer':16C 'geozon':10B 'hermos':4A 'iluminacion':12C,21 'mas':3A,11C,13C,15C,20,23 'medi':8B 'parqu':2A,18 'past':14C,24 'penalol':6B 'salud':7B 'vecin':5B	\N	\N	\N	3	\N
13	Parque "recreación"	Nosotros queremos que se incluyan mas juegos para la diversión de los niños,incluir una pileta de agua para beber y también que se pueda remodelar la cancha.queremos que en la cancha puedan haber actividades de ejercicio y juegos para niños y adultos,podría ser que llenen él parque con mas arena para que no ocurran accidentes	\N	\N	\N	Entran personas descuidadas,hay mucha basura en él suelo.		79	\N	\N	0	\N	1	1	\N	t	7659822779	100	2017-07-19 21:40:27.547576	2017-08-08 20:43:35.227276	Cami y agu apoyenos 🙏	Nosotros queremos que tu él que esta leyendo esto nos apoye por que tu y toda peñalolen acepte la propuesta		'accident':91 'acept':32C 'activ':69 'adult':77 'agu':52 'agustin':5B 'ambient':7B 'apoy':25C 'aren':86 'beb':54 'camil':3B 'canch':66 'cancha.queremos':62 'deport':13B 'diversion':44 'ejercici':71 'emergent':10B 'geozon':14B 'hab':68 'inclu':39,48 'jueg':41,73 'leyend':22C 'llen':81 'mas':40,85 'medi':6B 'movil':12B 'nin':47,75 'ocurr':90 'parqu':1A,83 'participacion':11B 'penalol':31C 'pilet':50 'podri':78 'propuest':34C 'pued':59,67 'quer':16C,36 'recreacion':2A 'remodel':60 'segur':8B 'ser':79 'tambi':56 'tod':30C	\N	\N	\N	3	\N
43	lo mejor para mis niños 	incorporar mas pasto y bien cuidado, asientos mas confortables, un sector cerrado para juegos de niños para que no se escapen, un kiosko con cosas ricas para los niños 	\N	\N	\N	esta un poco descuidado y falta seguridad 		8	\N	\N	0	\N	0	0	\N	t	7709234181	1	2017-07-24 22:09:43.320048	2017-07-24 22:09:43.320048	Jaime Riutor	mas áreas verdes y áreas de juegos cerradas 		'ambient':9B 'are':16C,19C 'asient':29 'bien':27 'cerr':22C,34 'confort':31 'cos':47 'cuid':28 'deport':13B 'emergent':12B 'escap':43 'geozon':14B 'incorpor':23 'jueg':21C,36 'kiosk':45 'mas':15C,24,30 'medi':8B 'mejor':2A 'nin':5A,38,51 'past':25 'penalol':7B 'ric':48 'sector':33 'segur':10B 'vecin':6B 'verd':17C	\N	\N	\N	3	\N
44	VEREDAS Y JUEGOS EN EL NUEVO PARQUE	MAS JUEGOS PARA EJERCICIOS PARA LOS  ADULTOS MAYORES, VEREDAS INTERNAS PARA TRANSITAR DENTRO DEL PARQUE, EVITANDO LA TIERRA QUE SE PRODUCE, PARA QUE PUEDAN INGRESAR DE FORMA MÁS FÁCIL,  MAS JARDINES Y ARBOLES NUEVOS.	\N	\N	\N	QUEREMOS UN MEJORAMIENTO DEL SECTOR, Y TENER  UN BARRIO PRESENTABLE		127	\N	\N	0	\N	0	0	\N	t	7709297278	1	2017-07-24 22:18:48.483864	2017-07-24 22:18:48.483864	Luis Duarte Cerda	JUEGOS PARA TODAS LAS EDADES Y VEREDAS INTERNAS		'adult':30 'alici':8B 'ambient':12B 'arbol':56 'dentr':36 'edad':20C 'ejercici':27 'evit':39 'facil':52 'form':50 'geozon':15B 'ingres':48 'intern':23C,33 'jardin':54 'jeri':9B 'jueg':3A,16C,25 'mas':24,51,53 'mayor':31 'medi':11B 'movil':10B 'nuev':6A,57 'parqu':7A,38 'participacion':13B 'produc':44 'pued':47 'salud':14B 'tierr':41 'tod':18C 'transit':35 'vered':1A,22C,32	\N	\N	\N	3	\N
45	Mas Iluminación 	Mas iluminación en la plaza san luis y juegos para los niños.	\N	\N	\N	El parque da miedo en la noche por que no hay iluminación 		8	\N	\N	0	\N	1	0	\N	t	7709500110	100	2017-07-24 22:48:00.949162	2017-07-26 20:41:37.218639	janet farias medina	es necesaria mas luz para dar mayor seguridad a todos,ademas juegos para que los niños se muevan y se diviertan.		'adem':21C 'dar':16C 'deport':9B 'diviert':31C 'emergent':7B 'geozon':10B 'iluminacion':2A,33 'jueg':22C,40 'luis':38 'luz':14C 'mas':1A,13C,32 'mayor':17C 'muev':28C 'necesari':12C 'nin':26C,43 'participacion':8B 'penalol':4B 'plaz':36 'san':37 'segur':5B,18C 'vecin':3B	\N	\N	\N	3	\N
32	La alegría que nunca llego	Poder hacer una zona techada en el parque san luis con la existencia de un kiosko que pueda vernder comida saludable a los niños y niñas de la zona	\N	\N	\N	Para poder jugar con los niños cuando haya lluvia	Jose Gonzalez Delgado	8	\N	\N	0	\N	0	0	\N	t	7688903383	1	2017-07-22 21:22:05.226485	2017-07-22 21:22:05.226485	José Gonzalez Delgado	Techar el parque san luis y poner comida saludable		'alegri':2A 'com':16C,37 'existent':30 'geozon':8B 'hac':19 'kiosk':33 'lleg':5A 'luis':13C,27 'nin':41,43 'nunc':4A 'parqu':11C,25 'penalol':7B 'pod':18 'pon':15C 'pued':35 'salud':17C,38 'san':12C,26 'tech':9C,22 'vecin':6B 'vernd':36 'zon':21,46	\N	\N	\N	3	\N
33	Espacio y clases de gimanasia del adulto mayor	Que los adultos mayores puedan contar con un espacio para hacer deporte y gimnnacia aerobica en un espacio techado 	\N	\N	\N	Los adultos Mayores gonzarán de mejor calidad de vida		8	\N	\N	0	\N	1	0	\N	t	7688925751	100	2017-07-22 21:25:18.491938	2017-07-22 21:25:21.731046	Juana Medrana	Que los adultos mayores cuenten con espacio para hacer deporte		'adult':7A,14C,24 'aerob':36 'clas':3A 'cont':27 'cuent':16C 'deport':21C,33 'espaci':1A,18C,30,39 'geozon':11B 'gimanasi':5A 'gimnnaci':35 'hac':20C,32 'mayor':8A,15C,25 'penalol':10B 'pued':26 'tech':40 'vecin':9B	\N	\N	\N	3	\N
20	Conserva tu Parque San Luis	En mi caso, suelo concurrir al parque muy seguido, por lo que, me es facil identificar mejoras que se podrian realizar a este.\r\nEn primer lugar, cuando hablo de cerrar la plaza, me refiero a establecer una entrada principal para peatones y vehiculos, esto quiere decir que debemos cambiar la reja o mejorarla. Esto brindaria mas seguridad al parque y a las personas que lo visitan con sus hijos o mascotas. (☆No intervenir el pasto para hacer una entrada)\r\nEn segundo lugar, aumentar la cantidad de arboles es algo fundamental, ya que existen muchos sitios donde es posible poner mas plantas, arboles o arbustos. Esto a largo plazo traera beneficios como una buena sombra, un aumento en la biodiversidad, ademas del aporte de oxigeno que entregan las plantas al ambiente, mejorando asi el entorno del parque. Esto ayudaria a la conservacion y mantenimiento de la flora y fauna que se observa en el parque. Los arboles son vida.\r\nEn tercer lugar, implementar un bebedero de agua, ayudaria mucho a la comunidad a sacear la sed en epocas de verano, tanto para los deportistas, las familias, amigos, niños o abuelos que visitan el parque e incluso para los animales. Uno seria suficiente. El agua es un Derecho, no un  privilegio.\r\nEn cuarto lugar, debemos promover el cuidado y limpieza del parque aumentando el numero de basureros o puntos de reciclaje. De esta forma haremos al parque mas limpio y amigable con el medio ambiente.\r\nA modo de conclusion, estas propuestas no buscan crear un parque pavimentado 2.0, ni con demasiadas bancas o parafernalea, si no que estan mas enfocadas en la conservacion y el mantenimiento de la vida de la flora, y tambien cabe la fauna. (Aves mas que nada), obviamente tambien enfocadas en las personas, para que puedan seguir yendo y disfrutando de este hermoso parque.\r\nFinalmente, es importante que las personas tomen conciencia sobre lo que significan estos lugares un una ciudad que esta cada vez mas sobreploblada con pavimiento, con edificion, centro comerciales, etc. Es por eso que, de manera urgente, cuidemos de estos sitios que son un indicio del pasado de estas tierras de san luis. \r\n	\N	\N	\N	Mi propuesta aborda muy bien el desafio planteado por la Municipalidad, en definitiva, el objetivo es mejorar las condiciones del parque para que todos puedan aprovechar y disfrutar de un lugar verde y agradable. Con estas propuestas nos aseguramos de cumplir con las personas y tambien de conservar y mejorar dia a dia el parque, en conjunto, con conciencia, para que nuestros futuros hijos, puedan disfrutar de un lindo parque. Cabe mencionar que las propuestas estan orientadas en torno a las limitaciones dadas previamente.		87	\N	\N	0	\N	48	5	\N	t	7678763130	4800	2017-07-20 04:28:00.498758	2017-08-10 15:04:45.128651	Felipe Jiménez Guzmán 	Mis propuestas principalmente son, cerrar el parque, aumentar la cantidad de arboles, implementar un bebedero de agua, aumentar los basureros o puntos de reciclaje.		'2.0':295 'abuel':228 'adem':159 'agu':32C,205,242 'ambient':10B,169,282 'amig':225,278 'animal':237 'aport':161 'arbol':27C,126,141,195 'arbust':143 'asi':171 'asoci':14B 'aument':23C,33C,122,155,260 'aves':325 'ayudari':177,206 'banc':299 'basurer':35C,264 'bebeder':30C,203 'benefici':149 'biodivers':158 'brindari':94 'buen':152 'busc':290 'cab':322 'cad':365 'cambi':88 'cantid':25C,124 'cas':42 'centr':373 'cerr':20C,69 'ciud':362 'comercial':374 'comun':210 'concienci':353 'conclusion':286 'concurr':44 'conserv':1A 'conservacion':180,310 'cre':291 'cuart':250 'cuid':255,383 'cultur':8B 'deb':87,252 'dec':85 'demasi':298 'deport':13B,222 'derech':245 'disfrut':341 'edificion':372 'enfoc':307,331 'entorn':173 'entrad':77,118 'entreg':165 'epoc':216 'establec':75 'estan':305 'etc':375 'exist':132 'facil':54 'famili':224 'faun':187,324 'felip':6B 'final':346 'flor':185,319 'form':271 'fundamental':129 'geozon':15B 'habl':67 'hac':116 'har':272 'hermos':344 'hij':108 'identific':55 'implement':28C,201 'import':348 'inclus':234 'indici':390 'interven':112 'jimenez':7B 'larg':146 'limpi':276 'limpiez':257 'lug':65,121,200,251 'lugar':359 'luis':5A,398 'maner':381 'manten':182,313 'mas':95,139,275,306,326,367 'mascot':110 'medi':9B,281 'mejor':56,92,170 'mod':284 'nin':226 'numer':262 'observ':190 'obvi':329 'oxigen':163 'parafernale':301 'parqu':3A,22C,46,98,175,193,232,259,274,293,345 'participacion':11B 'pas':392 'past':114 'paviment':294 'pavimient':370 'peaton':80 'person':102,334,351 'plant':140,167 'plaz':71,147 'podri':59 'pon':138 'posibl':137 'prim':64 'principal':18C,78 'privilegi':248 'promov':253 'propuest':17C,288 'pued':337 'punt':37C,266 'quier':84 'realiz':60 'reciclaj':39C,268 'refier':73 'rej':90 'sac':212 'san':4A,397 'sed':214 'segu':48,338 'segund':120 'segur':96 'seri':239 'si':302 'signific':357 'siti':134,386 'sobreplobl':368 'sombr':153 'suel':43 'suficient':240 'tambi':321,330 'terc':199 'tierr':395 'tom':352 'traer':148 'transparent':12B 'urgent':382 'vehicul':82 'veran':218 'vez':366 'vid':197,316 'visit':105,230 'yend':339	\N	\N	\N	3	1
27	Más Áreas Verdes	Que el parque sea más verde, con más pasto, áreas verdes, árboles y asientos.	\N	\N	\N	un parque más verde sería más limpio y más bonito. Atractivo para los vecinos.		104	\N	\N	0	\N	6	1	\N	t	7696429334	600	2017-07-22 20:24:46.79983	2017-07-29 21:11:54.163032	Margarita Elgueta Quinteros	Mejorar las áreas y cubrir de pasto el parque, agregando asientos y espacios de descanso.		'agreg':19C 'ambient':8B 'arbol':36 'are':2A,12C,34 'asient':20C,38 'cubr':14C 'descans':24C 'eguet':5B 'espaci':22C 'geozon':9B 'margarit':4B 'mas':1A,29,32 'medi':7B 'mejor':10C 'parqu':18C,27 'past':16C,33 'quinter':6B 'verd':3A,30,35	\N	\N	\N	3	\N
23	Mejor iluminación en el sector de la cancha	Esto es necesario porque se llena de basura, personas bebiendo alcohol, fumando, etc.	\N	\N	\N			101	\N	\N	0	\N	12	1	\N	t	7699126379	1200	2017-07-22 19:49:50.423749	2017-07-29 22:27:30.652169	Carlos Pradenas Seguel	Mejorar la iluminación del parque, principalmente sumar iluminación por el pasaje abedul (entre palmera y teja) y agregar un jardín en ese espacio para que los vecinos valoren este.		'abedul':23C 'agreg':29C 'alcohol':50 'basur':47 'beb':49 'canch':8A 'carlospraden':9B 'espaci':34C 'etc':52 'fum':51 'geozon':11B 'iluminacion':2A,10B,14C,19C 'jardin':31C 'llen':45 'mejor':1A,12C 'necesari':42 'palmer':25C 'parqu':16C 'pasaj':22C 'person':48 'principal':17C 'sector':5A 'sum':18C 'tej':27C 'valor':39C 'vecin':38C	\N	\N	\N	3	\N
36	Renovación de césped, caminos peatonales y juegos infantiles	Renovar el máximo de área del parque actual con césped de buena calidad y resistente al tráfico y al clima.\r\nColocar riego automático y una llave central con cierre seguro.\r\nReparar juegos que estén en mal estado y colocar mas juegos. Áreas de juego deben dividirse en dos dependiendo de la edad del niño que viene a jugar. Mantener área de ejercicios.\r\nSembrar mas árboles etiquetando cada uno de ellos para que se sepa además del nombre, sus locaciones,cualidades etc\r\nRemarcar sendas peatonales , con orilleros, suelo con pastelones (La lluvia arrastra el maicillo)\r\nTodas las lineas eléctricas deberán estar soterradas.\r\nColocar barras que impidan el acceso de vehículos al parque.	\N	\N	\N	Creo que en mi propuesta he abarcado el desafío impuesto considerando el máximo de factores de hermoseamiento del parque en forma autosustentable, ecológica y pedagógica.		119	\N	\N	0	\N	8	2	\N	t	7707743296	800	2017-07-23 20:24:04.345731	2017-07-29 21:10:45.089411	Rigoberto Carrasco Borquez	Renovación de césped,caminos peatonales y juegos  infantiles		'acces':136 'actual':37 'adem':104 'ambient':20B 'arbol':94 'are':34,71,89 'arrastr':121 'automat':52 'b':11B 'barr':132 'buen':41 'cad':96 'calid':42 'camin':4A,25C 'carrasc':10B 'central':56 'cesp':3A,24C,39 'cierr':58 'clim':49 'coloc':50,68,131 'cualidad':109 'cultur':18B 'deb':74 'deber':128 'depend':78 'divid':75 'dos':77 'edad':81 'ejercici':91 'electr':127 'emergent':17B 'esten':63 'etc':110 'etiquet':95 'geozon':21B 'impid':134 'infantil':8A,29C 'jueg':7A,28C,61,70,73 'jug':87 'lin':126 'llav':55 'lluvi':120 'locacion':108 'maicill':123 'mal':65 'manten':88 'mas':69,93 'maxim':32 'medi':13B,19B 'movil':12B 'nin':83 'nombr':106 'oriller':115 'parqu':36,140 'pastelon':118 'peatonal':5A,26C,113 'remarc':111 'renov':30 'renovacion':1A,22C 'repar':60 'resistent':44 'rieg':51 'rigobert':9B 'salud':14B 'segur':15B,59 'sembr':92 'send':112 'sep':103 'soterr':130 'suel':116 'tod':124 'trafic':46 'vehicul':138 'vien':85	\N	\N	\N	3	\N
22	Un parque más lindo y familiar para todos.	 Personas con movilidad reducida para que puedan disfrutar nuestro querido parque, con mejor iluminaria sustentables (en la noches es peligroso da algo de miedo y se presta para diferentes cosas lo dejo a la imaginacion), asientos, juegos para los niños (hay muy poco),pavimentación en los caminó con señales de tránsito, basureros, Seguridad. \r\nNo sacar los árboles ya que hay chicos que los utilizan para aser ejercicios (acrobacias) y nos progen de la lluvia y el calor, y el pasto tampoco!! No arruinar nuestras áreas verde (si es posible poner más árboles y plantitas con nombre).	\N	\N	\N			80	\N	\N	0	\N	3	2	\N	t	7682791540	300	2017-07-21 17:56:39.125105	2017-08-08 20:45:36.060909	Yubika alfaro.	Un parque acogedor para todos con movilidad reducida para que puedan disfrutar.		'acogedor':18C 'acrobaci':95 'alfar':8B 'ambient':13B 'arbol':84,119 'are':112 'arruin':110 'aser':93 'asient':63 'basurer':79 'calor':104 'camin':74 'chic':88 'cos':57 'da':48 'dej':59 'diferent':56 'disfrut':27C,35 'ejercici':94 'famili':6A 'geozon':15B 'iluminari':41 'imaginacion':62 'jueg':64 'lind':4A 'lluvi':101 'mas':3A,118 'medi':12B 'mejor':40 'mied':51 'movil':9B,22C,30 'nin':67 'noch':45 'nombr':123 'parqu':2A,17C,38 'participacion':11B 'past':107 'pavimentacion':71 'peligr':47 'person':28 'plantit':121 'pon':117 'posibl':116 'prest':54 'prog':98 'pued':26C,34 'quer':37 'reduc':23C,31 'sac':82 'salud':10B 'segur':80 'senal':76 'si':114 'sostenibil':14B 'sustent':42 'tampoc':108 'transit':78 'utiliz':91 'verd':113 'yubik':7B	\N	\N	\N	3	\N
30	Enrejado de la plaza	Una valla de un metro por perimetro de la plaza, no es necesario que se cierre con llaves.	\N	\N	\N	Muchos autos se suben a la plaza y se estacionan allí.		108	\N	\N	0	\N	4	0	\N	t	7694805897	400	2017-07-22 21:05:04.96916	2017-07-29 21:12:18.269597	Osvaldo Carvajal Jones	Enrejar todo el perimetro de la plaza San Luis		'carvajal':7B 'cierr':37 'emergent':11B 'enrej':1A,13C 'geozon':12B 'hector':6B 'jon':8B 'llav':39 'luis':21C 'metr':26 'necesari':34 'osvald':5B 'perimetr':16C,28 'plaz':4A,19C,31 'san':20C 'segur':9B 'vall':23	\N	\N	\N	3	\N
28	Remodelacion de la Plaza	Las áreas verdes que se dispondrían serían de flora nativa de la región metropolitana.\r\nLos juegos infantiles de madera los propongo ad-oc a la metodología de aprendizaje montessori que busca seres humanos más conectados con la naturaleza y en paz.\r\nAgregaría también más bancas disponible a los usuarios.\r\nsección de huerto ciudadano y reciclaje	\N	\N	\N			106	\N	\N	0	\N	3	0	\N	t	7693481285	300	2017-07-22 20:54:15.023777	2017-07-29 21:12:22.979346	Constanza Pacheco	Propongo sumar más áreas verdes al total ya existente.\r\nTambién dispondría de una basta cantidad de juegos infantiles de madera.		'ad':58 'ad-oc':57 'agregari':78 'ambient':11B 'aprendizaj':64 'are':19C,37 'banc':81 'bast':29C 'busc':67 'cantid':30C 'ciudadan':89 'conect':71 'constanz':8B 'cultur':9B 'derech':13B 'dispon':82 'dispondri':26C,41 'existent':24C 'flor':44 'geozon':15B 'huert':88 'human':69 'infantil':33C,52 'jueg':32C,51 'mader':35C,54 'mas':18C,70,80 'medi':10B 'merced':5B 'metodologi':62 'metropolitan':49 'montessori':65 'nativ':45 'naturalez':74 'oc':59 'paz':77 'plaz':4A 'propong':16C,56 'reciclaj':91 'region':48 'remodelacion':1A 'seccion':86 'ser':68 'seri':42 'social':14B 'sostenibil':12B 'sum':17C 'tambi':25C,79 'total':22C 'usuari':85 'verd':20C,38	\N	\N	\N	3	\N
29	Mejoramiento Areas Verdes y Zonas de Deporte	Agregar mas arboles de rápido crecimiento, Asientos de descanso, y agregar una zona de deporte que pueda ser utilizada durante toda época del año, siendo de esta manera una especie de pergola sobre las maquinas de ejercicio. Al haber maquinas se necesitaran zonas de Tomas de Aguas para el deportista.\r\n*Incluir zonas Limpias ( Basureros )\r\n*Bancas.\r\n*Mejorar Areas Verdes Sector de la Multicancha.\r\n*Mantención de Arboles.\r\n*Juegos infantiles\r\n*Punto de Reciclaje.\r\n\r\nLamentablemente en este proyecto no se considera la iluminación pero favor tomar importancia a esta medida.	\N	\N	\N	Mi desafio es eliminar la droga que hoy se vive día a día.		69	\N	\N	0	\N	3	0	\N	t	7693507136	300	2017-07-22 20:57:58.381209	2017-07-29 21:12:49.321389	Nelson Araya Aguilera	Reparación y mantenimiento de Areas Verdes.		'agreg':19,29 'agu':65 'aguiler':10B 'ano':42 'aray':9B 'arbol':21,83 'are':2A,17C,75 'asient':25 'banc':73 'basurer':72 'consider':95 'crecimient':24 'deport':7A,11B,33,68 'descans':27 'ejercici':55 'epoc':40 'especi':48 'favor':99 'geozon':12B 'hab':57 'iluminacion':97 'import':101 'inclu':69 'infantil':85 'jueg':84 'lament':89 'limpi':71 'maner':46 'manten':15C 'mantencion':81 'maquin':53,58 'mas':20 'med':104 'mejor':1A,74 'multicanch':80 'necesit':60 'nelson':8B 'pergol':50 'proyect':92 'pued':35 'punt':86 'rap':23 'reciclaj':88 'reparacion':13C 'sector':77 'ser':36 'siend':43 'tod':39 'tom':63,100 'utiliz':37 'verd':3A,18C,76 'zon':5A,31,61,70	\N	\N	\N	3	\N
12	Punto de reciclaje	En un costado de la cancha, ocupando el rincón que deja, poner un sector de reciclaje con tachos grandes para que todo el vecindario recicle.	\N	\N	\N			8	\N	\N	0	\N	1	0	\N	t	7658972557	100	2017-07-19 21:32:02.890753	2017-07-20 15:24:02.831065	Sofía Montenegro	Un rincón en el parque con tachos para reciclar vidrio, cartón, tetrapack y latas. Así facilitamos el reciclaje en la comunidad.		'ambient':9B 'asi':26C 'canch':38 'carton':22C 'comun':32C 'cost':35 'cultur':7B 'dej':43 'facilit':27C 'geozon':11B 'grand':51 'lat':25C 'medi':8B 'ocup':39 'parqu':16C 'participacion':10B 'penalol':5B 'pon':44 'punt':1A 'recicl':20C,57 'reciclaj':3A,29C,48 'rincon':13C,41 'sector':46 'sostenibil':6B 'tach':18C,50 'tetrapack':23C 'vecin':4B 'vecindari':56 'vidri':21C	\N	\N	\N	3	\N
15	Parque Cultural de Día	Incluir mesas de cemento para fomentar los deportes de ajedrez, en el centro un Odeon para organizar eventos artísticos ( como el de la plaza Ñuñoa). Con espacios culturales de participación, para jugar ajedrez y damas, con pedestales de cemento para escribir, leer. Que sea un parque de día y una plaza de noche. Incluir iluminación y cámaras de seguridad	\N	\N	\N	Durante el día que sea un parque cultural de participación, para que los niños jueguen, fomentando el cuidado y mantención responsable de los perros y en la noche espacio de plaza. Incluir publicidad sobre el cuidado de animales		8	\N	\N	0	\N	20	3	\N	t	7672314609	2000	2017-07-19 22:01:20.095285	2017-08-10 15:04:45.177896	Jimmy Hochfaerber	Espacio de recreación de día, con espacios culturales ( mesas para ajedrez, damas y zona de lectura)		'ajedrez':24C,39,62 'ambient':10B 'artist':48 'cam':86 'cement':33,68 'centr':42 'cultur':7B 'cultural':2A,21C,57 'dam':25C,64 'deport':8B,37 'dia':4A,18C,77 'escrib':70 'espaci':14C,20C,56 'event':47 'foment':35 'geozon':13B 'iluminacion':84 'inclu':30,83 'jug':61 'lectur':29C 'leer':71 'medi':9B 'mes':22C,31 'noch':82 'nuno':54 'odeon':44 'organiz':46 'parqu':1A,75 'participacion':12B,59 'pedestal':66 'penalol':6B 'plaz':53,80 'recreacion':16C 'segur':88 'sostenibil':11B 'vecin':5B 'zon':27C	\N	\N	\N	3	1
9	skate park	un bowl con baranda cajon y cuarter 	\N	\N	\N			8	\N	\N	0	\N	1	0	\N	t	7658815413	100	2017-07-19 21:09:25.164381	2017-07-20 15:24:32.862811	ronny guajardo 	poner un bowl para la entretencion de los skaters y biker		'barand':22 'bik':18C 'bowl':10C,20 'cajon':23 'cuart':25 'deport':6B 'entretencion':13C 'geozon':7B 'park':2A 'participacion':5B 'penalol':4B 'pon':8C 'skat':1A 'skaters':16C 'vecin':3B	\N	\N	\N	3	\N
8	mejoramiento del parque	mejoramiento del area verde ( pasto y arboles), más juegos para los niños, y maquinas de ejercicios para la tercera edad y cerrar el parque para la seguridad de los niños	\N	\N	\N	para que los niños tengan un espacio de juego seguro y entretenido		71	\N	\N	0	\N	3	0	\N	t	7663565378	300	2017-07-19 21:06:21.588421	2017-07-29 21:12:33.383128	Margarita Ursua Opazo	cerrar en parque 		'ambient':9B 'arbol':20 'are':16 'camil':4B 'cerr':11C,35 'deport':6B 'edad':33 'ejercici':29 'geozon':10B 'jueg':22 'maquin':27 'mas':21 'medi':8B 'mejor':1A,14 'nin':25,43 'olivar':5B 'parqu':3A,13C,37 'participacion':7B 'past':18 'segur':40 'tercer':32 'verd':17	\N	\N	\N	3	\N
6	Cerrar el Parque	Cerrar el Parque con rejas, que tenga porto electrico, para que sea mas privado, y el acceso sea para los vecinos	\N	\N	\N			70	\N	\N	0	\N	1	0	\N	t	7658609837	100	2017-07-19 20:39:48.993918	2017-07-19 20:40:23.227485	ketty pinto aravena	Cerrar el Parque con rejas, que tenga porto electrico, para que sea mas privado, y el acceso sea para los vecinos		'acces':28 'araven':7B 'cerr':1A,12 'electr':20 'emergent':10B 'geozon':11B 'ketty':4B 'mas':24 'parqu':3A,14 'pint':6B 'port':19 'priv':25 'rej':16 'segur':8B 'shirley':5B 'vecin':32	\N	\N	\N	3	\N
7	Mejorando el parque	Queremos 8 bancas en distintas zonas del parque, y poner pilotes en las entradas principales para que no puedan ingresar los autos adentro	\N	\N	\N	Queremos que lleguen muchos niños a jugar, y que tengan lugares de descanso		8	\N	\N	0	\N	0	0	\N	t	7658734770	1	2017-07-19 20:57:48.416821	2017-07-19 20:57:48.416821	Juan Balboa Mora	Hermosear el Parque San Luis para toda la comunidad		'8':20 'adentr':41 'aut':40 'banc':21 'comun':18C 'deport':8B 'distint':23 'entrad':32 'geozon':9B 'hermos':10C 'ingres':38 'luis':14C 'mejor':1A 'movil':6B 'parqu':3A,12C,26 'participacion':7B 'penalol':5B 'pilot':29 'pon':28 'principal':33 'pued':37 'quer':19 'san':13C 'tod':16C 'vecin':4B 'zon':24	\N	\N	\N	3	\N
11	parque de diversiones	circuito de autos, mas basureros, juegos para niños de todas las edades, bebederos, iluminacion led	\N	\N	\N	es un lugar amplio que puede ser mejor aprovechado por los vecinos del sector		77	\N	\N	0	\N	0	0	\N	t	7658961551	1	2017-07-19 21:30:27.804397	2017-07-19 21:30:27.804397	lucas chavez quinchavil	remodelacion del parque		'ambient':7B 'aut':15 'basurer':17 'bebeder':25 'circuit':13 'deport':5B 'diversion':3A 'edad':24 'geozon':9B 'iluminacion':26 'jueg':18 'led':27 'luc':4B 'mas':16 'medi':6B 'movil':8B 'nin':20 'parqu':1A,12C 'remodelacion':10C 'tod':22	\N	\N	\N	3	\N
16	Más orden en la plaza	Se deben incluir distintos tipos de máquinas de ejercicios para todas las edades, incluyendo mas áreas verdes y árboles variados. Que haya un compromiso con la limpieza y el orden del parque. Agregar más basureros	\N	\N	\N	Manutención del espacio limpio, generar una cultura de limpieza y enseñanza sobre el reciclado.\r\n		8	\N	\N	0	\N	9	1	\N	t	7668852625	900	2017-07-19 22:06:55.40781	2017-07-29 21:10:44.78436	Inés Mora Sanchez	Más maquinas de ejercicios, con entretención para los adultos		'adult':21C 'agreg':54 'ambient':11B 'arbol':40 'are':37 'basurer':56 'compromis':45 'deb':23 'deport':8B 'distint':25 'edad':34 'ejercici':16C,30 'entretencion':18C 'geozon':12B 'inclu':24,35 'limpiez':48 'maquin':14C,28 'mas':1A,13C,36,55 'medi':10B 'orden':2A,51 'parqu':53 'participacion':9B 'penalol':7B 'plaz':5A 'tip':26 'tod':32 'vari':41 'vecin':6B 'verd':38	\N	\N	\N	3	\N
34	Pileta para los niños, más árboles, plantas y flores y nuevos asientos, basurero	Plantar nuevos árboles porque los actuales están hace más de 50 años y con la nieve se cayeron. También agregar más plantas para que se vea bonito y pérgolas con flores.\r\nLlenar los espacios desocupados con más máquinas de ejercicio, basureros, asientos porque no cabemos todos sentados cuando venimos al parque. \r\nPoner una pileta para que los niños puedan jugar en el verano y no pongan piscinas.	\N	\N	\N			110	\N	\N	0	\N	1	1	\N	t	7689946612	100	2017-07-22 21:58:17.465693	2017-07-22 22:53:21.663011	Rosa María Maturana Díaz	Vamos a poner una pileta para el verano, más espacio para sentarse, árboles, flores y plantas y nuevas máquinas de ejercicio. 		'50':54 'actual':49 'agreg':63 'anos':55 'arbol':6A,35C,46 'asient':12A,85 'basurer':13A,84 'bonit':70 'cab':88 'cayeron':61 'deport':21B 'desocup':78 'diaz':17B 'ejercici':43C,83 'emergent':20B 'espaci':32C,77 'estan':50 'flor':9A,36C,74 'geozon':22B 'hac':51 'jug':103 'llen':75 'maquin':41C,81 'mari':15B 'mas':5A,31C,52,64,80 'maturan':16B 'niev':59 'nin':4A,101 'nuev':11A,40C,45 'parqu':94 'pergol':72 'pilet':1A,27C,97 'piscin':110 'plant':7A,38C,44,65 'pon':25C,95 'pong':109 'pued':102 'ros':14B 'segur':18B 'sent':34C,90 'tambi':62 'vam':23C 'vea':69 'ven':92 'veran':30C,106	\N	\N	\N	3	\N
5	Seguridad en el parque	Se debiera apoyar, ya que es la seguridad, que es lo que menos hay, peleas, drogas, parejas teniendo sexo, asaltos el parque no lo disfruta los de la Villa.	\N	\N	\N	Es necesario que la municipalidad, evalúe y tome en consideración la seguridad, ustedes pueden colocar más asientos, juegos y máquinas, pero con los delincuentes, difícil que podamos disfrutar.		65	\N	\N	0	\N	5	1	\N	t	7657546366	500	2017-07-19 00:55:37.91394	2017-07-29 21:12:00.212662	Edgar Araya Aguilera	Hacer en la villa el parque: mejor iluminación, letrero de velocidad Pje. La palmera, lomo de toro y mantener cerrado el portón del Pje., Hacer puerta peatones ahí mismo, cámaras de vigilancia.		'ahi':44C 'ambient':15B 'apoy':51 'ar':6B 'asalt':68 'cam':46C 'cerr':36C 'cultur':13B 'deb':50 'deport':9B 'disfrut':73 'drog':64 'edgar':5B 'emergent':12B 'geozon':16B 'guil':7B 'hac':17C,41C 'iluminacion':24C 'letrer':25C 'lom':31C 'manten':35C 'medi':14B 'mejor':23C 'men':61 'mism':45C 'palmer':30C 'parej':65 'parqu':4A,22C,70 'peaton':43C 'pel':63 'pje':28C,40C 'porton':38C 'puert':42C 'salud':8B 'segur':1A,10B,56 'sex':67 'tor':33C 'veloc':27C 'vigil':48C 'vill':20C,77	\N	\N	\N	3	\N
26	Rejas Parque San Luis	las rejas tienen que ser de fierro, enterradas de la menos 2 metros, que sea firme. y de un metro de alto.	\N	\N	\N	El problema es que llegan muchos vehiculos que ocupan el espacio del parque.		8	\N	\N	0	\N	4	0	\N	t	7694520999	400	2017-07-22 20:24:03.446856	2017-07-29 21:12:09.642547	Isabel Escorbar y Antonio Farías	Nos gustaria que el parque san Luis fuera Enrejado completamente o al menos los accesos.		'2':37 'acces':25C 'alto':47 'complet':20C 'emergent':9B 'enrej':19C 'enterr':33 'fierr':32 'firm':41 'geozon':10B 'gustari':12C 'luis':4A,17C 'men':23C,36 'metr':38,45 'parqu':2A,15C 'penalol':6B 'rej':1A,27 'san':3A,16C 'segur':7B 'ser':30 'vecin':5B	\N	\N	\N	3	\N
40	Mas Bancas para mi parque de san luis	Queremos mas arboles (aromos), mas bancas por que  hay solo tres, juegos para los niños y un camino de pastelones hacia la feria que se instalan los días martes. Evitar que los autos ingresen a la plaza poniendo un cerco o bolones en la orilla del parque.	\N	\N	\N	sacaron los aromos que antes estaban y no los repusieron. los autos ingresan a la plaza y es peligroso para los niños que juegan en la plaza, ingreso mas cómodos para las personas.		8	\N	\N	0	\N	0	0	\N	t	7709074547	1	2017-07-24 21:46:44.08364	2017-07-24 21:46:44.08364	LUIS COBLE	Queremos mas arboles (aromos) y mas bancas por que solo hay tres en la plaza, juegos para los niños 		'ambient':12B 'arbol':20C,39 'arom':21C,40 'aut':69 'banc':2A,24C,42 'bolon':78 'camin':54 'cerc':76 'dias':64 'emergent':16B 'evit':66 'feri':59 'geozon':17B 'haci':57 'ingres':70 'instal':62 'jueg':33C,48 'luis':8A 'mart':65 'mas':1A,19C,23C,38,41 'medi':11B 'movil':13B 'nin':36C,51 'orill':81 'parqu':5A,83 'pastelon':56 'penalol':10B 'plaz':32C,73 'pon':74 'quer':18C,37 'san':7A 'segur':14B 'sol':27C,46 'tres':29C,47 'vecin':9B	\N	\N	\N	3	\N
38	Mejoras del parque con suelo apto 	la propuesta cuenta con la instalación de juegos reciclados tales como neumáticos y que tenga un sector con arena especial, cerrado por la seguridad de los menores, basureros. 	\N	\N	\N	mejorar lo que ya esta y complementar el parque 		123	\N	\N	0	\N	0	0	\N	t	7708891305	1	2017-07-24 21:20:20.876237	2017-07-24 21:20:20.876237	Andrea Vera Urzua 	evitar caidas para menores y terdera edad		'ambient':12B 'andre':7B 'apto':6A 'aren':43 'basurer':52 'caid':19C 'cerr':45 'cuent':27 'deport':10B 'edad':24C 'emergent':15B 'especial':44 'evit':18C 'geozon':17B 'instalacion':30 'jueg':32 'medi':11B 'mejor':1A 'menor':21C,51 'neumat':36 'parqu':3A 'participacion':16B 'propuest':26 'recicl':33 'sector':41 'segur':13B,48 'suel':5A 'tal':34 'terder':23C 'urzu':9B 'ver':8B	\N	\N	\N	3	\N
39	seguridad para todos los vecinos en parque  	mejora de iluminaria y mejores juegos físicos, barras para ejercicios, pasa manos, bicicletas deportivas. Se necesitan mas asientos para personal que cuida a los niños. 	\N	\N	\N	soy usuario del parque y puedo notar las deficiencias que tiene para los juegos de los niños. 		8	\N	\N	0	\N	0	0	\N	t	7708983543	1	2017-07-24 21:33:37.814136	2017-07-24 21:33:37.814136	Carlos Gallardo Delgado 	mejores juegos para hacer ejercicios y espacios de descanso 		'ambient':12B 'asient':45 'barr':35 'biciclet':40 'cuid':49 'deport':10B,41 'descans':27C 'ejercici':23C,37 'emergent':15B 'espaci':25C 'fisic':34 'geozon':18B 'hac':22C 'iluminari':30 'jueg':20C,33 'man':39 'mas':44 'medi':11B 'mejor':19C,28,32 'necesit':43 'nin':52 'parqu':7A 'participacion':16B 'pas':38 'penalol':9B 'personal':47 'salud':17B 'segur':1A,13B 'vecin':5A,8B	\N	\N	\N	3	\N
41	Mejora en ubicación de maquinas de ejercicios	Es necesario agregar más máquinas de ejercicios, en un lugar de más iluminación en el parque, proponiendo distintas variedades para la utilización de niños de todas las edades. Se necesita una mayor iluminación,  no es necesario cerrarlo, debe ser público.	\N	\N	\N	La oscuridad no permite hacer ejercicio, se necesitan las máquinas en espacios iluminados para que la gente asista, así no se utiliza para otras cosas.		8	\N	\N	0	\N	0	0	\N	t	7709152834	1	2017-07-24 21:58:00.486249	2017-07-24 21:58:00.486249	María Margarita Bustos Palacios	Poner las máquinas de ejercicios en espacios iluminados, y mantener el parque abierto a la comunidad		'abiert':28C 'agreg':34 'cerr':68 'comun':31C 'deb':69 'deport':10B 'distint':49 'edad':59 'ejercici':7A,20C,38 'emergent':13B 'espaci':22C 'geozon':15B 'ilumin':23C 'iluminacion':44,64 'lug':41 'manten':25C 'maquin':5A,18C,36 'mas':35,43 'mayor':63 'mejor':1A 'necesari':33,67 'necesit':61 'nin':55 'parqu':27C,47 'participacion':14B 'penalol':9B 'pon':16C 'propon':48 'public':71 'segur':11B 'ser':70 'tod':57 'ubicacion':3A 'utilizacion':53 'variedad':50 'vecin':8B	\N	\N	\N	3	\N
37	parque recreativo 	parque agradable, con juegos para niños, con fuentes de agua, muchos arboles y flores, que sea cerrado 	\N	\N	\N	esta muy desatendido el parque 		8	\N	\N	0	\N	2	0	\N	t	7711798862	200	2017-07-24 21:05:33.178173	2017-07-29 21:12:53.677923	rosa nelly salgado vergara	parque verde para entretención infantil 		'agrad':18 'agu':26 'ambient':10B 'arbol':28 'cerr':33 'deport':5B 'emergent':8B 'entretencion':15C 'flor':30 'fuent':24 'geozon':11B 'infantil':16C 'jueg':20 'medi':9B 'nin':22 'parqu':1A,12C,17 'penalol':4B 'recreat':2A 'segur':6B 'vecin':3B 'verd':13C	\N	\N	\N	3	\N
47	"Cultuparque"	Que si es chico el espacio,?......para nada ,bien ubicado y de porte  apropiado ,podemos implementar un hermoso e inclusivo "Minianfiteatro" ,donde se pueda incluir a la misma comunidad a participar de espacios dedicados a las distintas edades y a los distintos intereses que tiene nuestra comunidad ,y con esto me refiero a la participación de un prodigioso "contador de Cuentos ",hasta un cautivador cantante de tangos para la tercera edad , o simplemente un lugar donde se puedan expresar La Artes que seguramente tiene escondida nuestro barrio ,y albergar a quien lo necesite, un lugar de encuentro para fomentar La Cultura .\r\n\r\n-Lo de los árboles y áreas verdes es casi inevitable .Ea así como debe ser ,si bien llenar de árboles de gran altura que den sombra en verano,también se vuelve obscuro, condición  que por mucha iluminaría que tenga ,podría tornarse peligroso . Me gustaría que fuesen más arbustos ,lindos y bien ubicados ,bien podados, dando aspecto mágicos al lugar ,unos más altos ,otros pequeños Que logre un aspecto mágico  al Parque ,quizá con un pequeño puente colgante de madera ,se vería muy hermoso ,. \r\nMáquinas de ejercicios por el contorno (no excesivamente tantas) y un buen y atractivo juego para los niños más pequeños . Bancas ,muchas ,para los ancianos ,y así poder contemplar de lo diverso y armonioso que puede llegar a ser nuestro   bello "Cultuparque". \r\n	\N	\N	\N	Este "Cultuparque ",reúne todas las condiciones que debe tener un Parque ,pues es inclusivo ,nadie queda fuera . 		139	\N	\N	0	\N	4	0	\N	t	7735266766	400	2017-07-26 22:11:26.877797	2017-07-29 21:12:13.882968	Carolina Arriagada 	Cultuparque será un lugar donde podamos sintetizar :\r\n-un lindo y verde lugar donde sentarse \r\n-Un pequeño Anfiteatro,lugar donde entregar cultura ,baile ,cuenta cuentos ,cantautores.....		'alberg':118 'altos':192 'altur':153 'ancian':238 'anfiteatr':21C 'apropi':43 'arbol':134,150 'arbust':178 'are':136 'armoni':247 'artes':110 'asi':142,240 'aspect':186,198 'atract':227 'bail':26C 'banc':234 'barri':116 'bell':254 'bien':38,147,181,183 'buen':225 'cantant':94 'cantautor':29C 'casi':139 'cautiv':93 'chic':33 'colgant':207 'comun':58,76 'condicion':163 'contador':88 'contempl':242 'contorn':219 'cuent':27C,28C,90 'cultuparqu':1A,5C,255 'cultur':3B,25C,130 'dand':185 'deb':144 'dedic':63 'den':155 'distint':66,71 'divers':245 'ea':141 'edad':67,100 'ejercici':216 'encuentr':126 'entreg':24C 'escond':114 'espaci':35,62 'exces':221 'expres':108 'foment':128 'geozon':4B 'gran':152 'gustari':174 'hermos':47,213 'iluminari':167 'implement':45 'inclu':54 'inclus':49 'inevit':140 'interes':72 'jueg':228 'karol6035':2B 'lind':13C,179 'lleg':250 'llen':148 'logr':196 'lug':8C,16C,22C,104,124,189 'mader':209 'magic':187,199 'maquin':214 'mas':177,191,232 'minianfiteatr':50 'mism':57 'much':166,235 'necesit':122 'nin':231 'obscur':162 'parqu':201 'particip':60 'participacion':84 'peligr':172 'pequen':20C,194,205,233 'pod':10C,44,184,241 'podri':170 'port':42 'prodigi':87 'pued':53,107,249 'puent':206 'quiz':202 'refier':81 'segur':112 'sent':18C 'ser':6C,145,252 'si':31,146 'simplement':102 'sintetiz':11C 'sombr':156 'tambi':159 'tang':96 'tant':222 'tercer':99 'torn':171 'ubic':39,182 'veran':158 'verd':15C,137 'veri':211 'vuelv':161	\N	\N	\N	3	\N
24	fomentar vida saludable tanto en adultos como niños	lo ideal seria que se pudieran colocar juegos para niños de diferentes edades  y maquinas de ejercicios  de diferentes tipos, para que asi se puedan complementar  tanto niños como adultos y lograr que la familia en su totalidad pueda disfrutar y compartir .	\N	\N	\N	es para fomentar la union familiar y la vida saludable		102	\N	\N	0	\N	3	0	\N	t	7693140367	300	2017-07-22 20:05:09.490581	2017-07-29 21:12:27.464011	tahia salmeron vasquez	implementar en el parque maquinas de ejercicios  para fomentar la vida saludable y renovar juegos ya que los que se encuentran no funcionan algunos y otros estan en mal estado ,mejorar la iluminacion.		'adult':6A,78 'ambient':14B 'asi':71 'coloc':55 'compart':90 'complement':74 'deport':12B 'diferent':60,67 'disfrut':88 'edad':61 'ejercici':22C,65 'encuentr':36C 'estan':42C 'famili':83 'foment':1A,24C 'funcion':38C 'geozon':15B 'ideal':50 'iluminacion':48C 'implement':16C 'jueg':30C,56 'logr':80 'mal':44C 'maquin':20C,63 'medi':13B 'mejor':46C 'nin':8A,58,76 'parqu':19C 'pud':54 'pued':73,87 'renov':29C 'salmeron':10B 'salud':3A,11B,27C 'seri':51 'tahi':9B 'tip':68 'total':86 'vid':2A,26C	\N	\N	\N	3	\N
21	Por un parque más seguro	Sería ideal una zona del parque con juegos para bebés y niños con juego modernos y de habilidades. Poner rejas alrededor de todo el parque para evitar que los automóviles se suban, poner lomo de toro en las calles cercanas al parque. Poner mas máquinas de ejercicios para que los adultos mayores y jóvenes tengan donde recrear las tardes. Poner mas iluminarias y arbolitos.	\N	\N	\N	Por un parque más familiar y acogedor para nuestras familias.		94	\N	\N	0	\N	3	0	\N	t	7675239475	300	2017-07-21 01:07:25.783273	2017-07-29 21:12:40.968664	Fresía romero	Lo principal  es cerrar el parque.		'adult':66 'alrededor':36 'arbolit':79 'automovil':45 'beb':25 'call':54 'cercan':55 'cerr':13C 'cornej':8B 'ejercici':62 'evit':42 'geozon':9B 'habil':33 'ideal':17 'iluminari':77 'joven':69 'juan':7B 'jueg':23,29 'lom':49 'maquin':60 'mari':6B 'mas':4A,59,76 'mayor':67 'mod':30 'nin':27 'parqu':3A,15C,21,40,57 'pon':34,48,58,75 'principal':11C 'recr':72 'rej':35 'segur':5A 'seri':16 'sub':47 'tard':74 'tor':51 'zon':19	\N	\N	\N	3	\N
42	niños felices y seguros 	cerrar un perímetro donde estén los juegos de los niños para no ser orinados por perros, modernizar los juegos, cambiar piso para la seguridad de los niños, instalar bebederos, asientos mas cómodos para las personas que vigilas a los niños. \r\nagregar mas áreas verdes o mantener los arboles 	\N	\N	\N	tener un parque para que los niños salgan a jugar ya que no hay mas parques es San Luis 		124	\N	\N	0	\N	4	0	\N	t	7715191651	400	2017-07-24 22:00:37.880432	2017-07-29 21:12:06.079864	Carmen Sanchez 	mas seguridad para los niños y áreas verdes 		'acost':7B 'agreg':64 'ambient':14B 'arbol':71 'are':22C,66 'asient':53 'bebeder':52 'cambi':43 'carm':5B 'cerr':24 'comod':55 'deport':9B 'emergent':12B 'esten':28 'felic':2A 'geozon':15B 'instal':51 'jueg':30,42 'manten':69 'mas':16C,54,65 'medi':13B 'moderniz':40 'nin':1A,20C,33,50,63 'orin':37 'perimetr':26 'perr':39 'person':58 'pis':44 'salud':8B 'sanchez':6B 'segur':4A,10B,17C,47 'ser':36 'verd':23C,67 'vigil':60	\N	\N	\N	3	\N
31	Enrejado	Ésta propuesta nace de la poca seguridad para los vecinos, además del uso inapropiado del espacio público, donde cualquier persona puede subir al parque y estacionar en un lugar que, por disposicion no es apto para éste uso.\r\nAdemás de que ayudaría a los mismos niños que disfrutan de éste a no correr peligro al cruzar la calle a buscar alguna pelota o las mismas mascotas de los vecinos.\r\n	\N	\N	\N	Éste proyecto ayudaria a vecinos, personas de tercera edad y las mismas mascotas del barrio.\r\nComo reflexión, que los mismos vecinos caminen por la vereda por su propia seguridad y las de cualquier conductor que pase por el parque. \r\n		107	\N	\N	0	\N	2	0	\N	t	7691822085	200	2017-07-22 21:08:53.819265	2017-07-29 21:12:58.708166	Francisco Martin Villagra, Berta Villagra Salvo	Cerrado del parque por tramos.		'adem':25,53 'algun':75 'apto':49 'ayudari':56 'busc':74 'call':72 'cerr':10C 'corr':67 'cruz':70 'cualqui':33 'cultur':8B 'disfrut':62 'disposicion':46 'emergent':7B 'enrej':1A 'espaci':30 'estacion':40 'francisc':2B 'geozon':9B 'inapropi':28 'lug':43 'martin':3B 'mascot':80 'mism':59,79 'movil':4B 'nac':17 'nin':60 'parqu':12C,38 'peligr':68 'pelot':76 'person':34 'poc':20 'propuest':16 'public':31 'pued':35 'segur':5B,21 'sub':36 'tram':14C 'uso':27,52 'vecin':24,83	\N	\N	\N	3	\N
46	Parque " Recrea"	Parque de educación vial y juegos para niños, que recorra todo el parque, pileta de agua ornamental,   sistema de riego automático para el parque que se active durante las tardes y noches, de esta forma se aleja el foco de delincuencia en estos horarios , al impedirles el acceso al césped.\r\nornamentar con palmeras en islotes de césped y flores.\r\ninstalación de maquinas de ejercicios, para fomentar el deporte entre la comunidad, de esta forma mientras los niños juegan en el parque sus padres pueden ejercitar.\r\ncerrar el parque para la entrada de vehìculos con la instalación de bolones o pilotes 	\N	\N	\N	El proyecto esta orientado a solucionar el problema de la delincuencia y que la comunidad efectivamente ocupe este espacio público que por derecho les pertenece		142	\N	\N	0	\N	6	0	\N	t	7736865098	600	2017-07-26 21:48:02.17508	2017-07-29 21:11:49.47221	Jessica Pavez	Juegos infantiles, deporte y áreas verdes  		'acces':67 'activ':46 'agu':35 'alej':56 'ambient':12B 'are':18C 'automat':40 'bolon':117 'cerr':105 'cesp':69,76 'comun':90 'cultur':10B 'delincuent':60 'deport':5B,16C,87 'educacion':22 'ejercici':83 'ejercit':104 'emergent':9B 'entrad':110 'flor':78 'foc':58 'foment':85 'form':54,93 'geozon':13B 'horari':63 'imped':65 'infantil':15C 'instalacion':79,115 'islot':74 'jessic':3B 'jueg':14C,25,97 'maquin':81 'medi':11B 'mientr':94 'nin':27,96 'noch':51 'ornament':70 'ornamental':36 'padr':102 'palmer':72 'parqu':1A,20,32,43,100,107 'participacion':6B 'pavez':4B 'pilet':33 'pilot':119 'pued':103 'recorr':29 'recre':2A 'rieg':39 'segur':7B 'sistem':37 'tard':49 'vehicul':112 'verd':19C 'vial':23	\N	\N	\N	3	\N
10	Parque entretenido para niños	cerrar con rejas al rededor del parque para los niños puedan dsifrutar sin temor a que pueda ocurrir un accidente con los vehiculos\r\nintegrar mas juegos para diferentes tipos de deportes (pistas de patinaje, ramplas para skate, y una mejor cancha de futbol)\r\njuegos para niños con resfalines con castillos o casa muñecas para niños mas pequeños\r\ny por ultimo conservar las areas verdes para tener dias familiares junto con todas las entretenciones.	\N	\N	\N	el parque que uno sueña como padre puede ser posible gracias a la propuesta e iniciativa del municipio ya que aborda la integridad de todas las familias.		75	\N	\N	0	\N	16	2	\N	t	7671031055	1600	2017-07-19 21:19:05.805712	2017-07-31 00:22:03.743459	Alexander Gallardo Araya	Un parque entretenido para que nuestros niños se diviertan 		'accident':42 'alexand':5B 'ambient':12B 'are':85 'canch':63 'cas':74 'castill':72 'cerr':23 'conserv':83 'deport':7B,53 'dias':89 'diferent':50 'diviert':22C 'dsifrut':34 'emergent':10B 'entreten':2A,16C 'entretencion':95 'familiar':90 'futbol':65 'gallard':6B 'geozon':13B 'integr':46 'jueg':48,66 'junt':91 'mas':47,78 'medi':11B 'mejor':62 'munec':75 'nin':4A,20C,32,68,77 'ocurr':40 'parqu':1A,15C,29 'patinaj':56 'pequen':79 'pist':54 'pued':33,39 'rampl':57 'rededor':27 'rej':25 'resfalin':70 'segur':8B 'skat':59 'temor':36 'ten':88 'tip':51 'tod':93 'ultim':82 'vehicul':45 'verd':86	\N	\N	\N	3	\N
25	Reforestar el parque y otras mejoras	La idea es plantar arbolitos de distintas especies, de crecimiento rápido como eucaliptus o pinos para no tener que esperar años para tener más árboles. También sería bueno mejorar los jardines que ya existen para que haya un espacio más grande solo de jardines y que haya más plantas. \r\nTambién sería bueno diversificar las máquinas de ejercicio, que haya máquinas especiales para los viejitos.\r\nPoner más juegos infantiles.\r\nHacerle mantención a la reja porque eso nos costó a todos los vecinos del barrio y hay que mantenerla en buen estado.	\N	\N	\N			103	\N	\N	0	\N	24	0	\N	t	7702298168	2400	2017-07-22 20:23:25.922279	2017-08-10 15:04:45.15784	Tito Vidal	Se propone mejorar lo que tiene que ver con áreas verdes y también las máquinas de ejercicio y los juegos.		'ambient':10B 'anos':55 'arbol':59 'arbolit':39 'are':24C 'barri':117 'buen':62,86,123 'cost':111 'crecimient':44 'deport':8B 'distint':41 'diversific':87 'ejercici':31C,91 'emergent':13B 'espaci':73 'especi':42 'especial':95 'esper':54 'eucaliptus':47 'exist':68 'geozon':14B 'grand':75 'hac':103 'ide':36 'infantil':102 'jardin':65,78 'jueg':34C,101 'manten':121 'mantencion':104 'maquin':29C,89,94 'mas':58,74,82,100 'medi':9B 'mejor':6A,17C,63 'parqu':3A 'pin':49 'plant':38,83 'pon':99 'propon':16C 'rap':45 'reforest':1A 'rej':107 'segur':11B 'seri':61,85 'sol':76 'tambi':27C,60,84 'ten':52,57 'titovidal':7B 'vecin':115 'ver':22C 'verd':25C 'viejit':98	\N	\N	\N	3	1
\.


--
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('proposals_id_seq', 48, true);


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY reports (id, description, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('reports_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY schema_migrations (version) FROM stdin;
20150715190041
20150716154501
20150716174358
20150717164054
20150717180105
20150718075238
20150718075337
20150718091702
20150731110702
20150804144230
20150804144231
20150806111435
20150806135245
20150806140048
20150806163142
20150807140235
20150807140346
20150808100936
20150808102442
20150808141306
20150810201448
20150811145628
20150811161459
20150813142213
20150813161654
20150814074250
20150815154430
20150817150457
20150819135933
20150819193457
20150819203410
20150820103351
20150820103800
20150820104552
20150821130019
20150821180131
20150821180155
20150822095305
20150822100557
20150822132547
20150823111403
20150823114519
20150823121109
20150824110104
20150824111844
20150824113326
20150824144524
20150825124821
20150825124827
20150825165517
20150825175647
20150825201922
20150826112411
20150826112500
20150826182010
20150827080624
20150827080641
20150827080701
20150827081657
20150827083232
20150828085718
20150830212600
20150902114558
20150902120006
20150902191315
20150903142924
20150903155146
20150903171309
20150903200440
20150907064631
20150908102936
20150909131133
20150909135032
20150909142534
20150909153455
20150909211203
20150910092713
20150910133047
20150910152734
20150911171301
20150911171302
20150912145218
20150914113251
20150914114019
20150914173834
20150914181921
20150914182652
20150914184018
20150914191003
20150917102718
20150921095553
20150924112929
20150926113052
20150926115929
20150928115005
20150930082311
20151002144206
20151013145126
20151013145757
20151015135154
20151016110703
20151019133719
20151020112354
20151020135111
20151021113348
20151028145921
20151028213830
20151028221647
20151030182217
20151103175139
20151103194329
20151111202657
20151117222604
20151117225104
20151118160928
20151215113827
20151215115319
20151215165824
20151218114205
20160104203329
20160104203438
20160105121132
20160105170113
20160107114749
20160107132059
20160108114750
20160108133501
20160114110933
20160119132601
20160119164320
20160122124847
20160122153329
20160125100637
20160126090634
20160204134022
20160207205252
20160216121051
20160217101004
20160218164923
20160218172620
20160219111057
20160219172824
20160220181602
20160222145100
20160224101038
20160224123110
20160225171916
20160305113707
20160307150804
20160308103548
20160308184050
20160315084335
20160315092854
20160328152843
20160329115418
20160329160106
20160406163649
20160411161531
20160413122359
20160415150524
20160418144013
20160418172919
20160420105023
20160421090733
20160422094733
20160426211658
20160510161858
20160518141543
20160518142529
20160518151245
20160519144152
20160520100347
20160520111735
20160520114820
20160520151954
20160523095730
20160523143320
20160523144313
20160523150146
20160523164449
20160524143107
20160524144005
20160531102008
20160601103338
20160606102427
20160608174104
20160609110023
20160609142017
20160609152026
20160610094658
20160613150659
20160614091639
20160614160949
20160617172616
20160803154011
20160901104320
20160905092539
20160914110004
20160914110039
20160914172016
20160914172535
20160926090107
20160928113143
20161020112156
20161028104156
20161028143204
20161102133838
20161107124207
20161107174423
20161122101702
20161129011737
20161130122604
20161130123347
20161206130836
20161206131125
20161206132126
20161207181001
20161214212918
20161214233817
20161221131403
20161221151239
20161221172447
20161227140109
20161229110336
20161229153505
20161230172816
20161230174744
20170102080432
20170102114446
20170102170125
20170103170147
20170103191711
20170105215410
20170106130838
20170114154421
20170120153244
20170120161058
20170120164547
20170125104542
20170125112017
20170125114952
20170127173553
20170128214244
20170130101121
20170130103550
20170130133736
20170130163030
20170130171322
20170201113206
20170202151151
20170203163304
20170203163317
20170208110146
20170208111639
20170208112814
20170208114548
20170208160130
20170212123435
20170316174351
20170322145702
20170324101716
20170427145845
20170428111355
20170510201301
20170510201937
20170510203122
20170510203817
20170510203818
20170525142508
20170531153315
20170531153458
20170705144222
20170714153157
20170714153325
20170717214347
20170724201300
20170807155044
20170808201052
20170808201228
20170808201251
20170808212854
20170816185343
20170816190905
20170817134541
20170817142031
20170817160549
20170817160753
20170817160858
20170817161002
20170817161829
20170817162013
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY settings (id, key, value) FROM stdin;
1	official_level_1_name	Empleados públicos
2	official_level_2_name	Organización Municipal
3	official_level_3_name	Directores generales
4	official_level_4_name	Concejales
5	official_level_5_name	Alcaldesa
6	max_ratio_anon_votes_on_debates	50
7	max_votes_for_debate_edit	1000
8	max_votes_for_proposal_edit	1000
9	proposal_code_prefix	PROP
10	votes_for_proposal_success	100
11	months_to_archive_proposals	12
12	comments_body_max_length	1000
13	twitter_handle	@ciudadanoi
14	twitter_hashtag	#ciudadanoi
15	facebook_handle	ciudadanointeligente
16	youtube_handle	
17	telegram_handle	
18	blog_url	
20	org_name	Abre
21	place_name	Municipio
24	feature.spending_proposals	\N
25	feature.spending_proposal_features.voting_allowed	\N
31	per_page_code_head	
32	per_page_code_body	
37	verification_offices_url	http://oficinas-atencion-ciudadano.url/
38	min_age_to_participate	16
22	feature.debates	\N
23	feature.polls	t
27	feature.twitter_login	\N
28	feature.facebook_login	t
29	feature.google_login	\N
39	feature.public_stats	t
26	feature.budgets	\N
30	feature.signature_sheets	\N
42	home.main-subtitle-link	http://abre.penalolen.cl/more-information
41	home.main-subtitle	Quiero saber más sobre Abre
40	home.main-title	Construyamos soluciones para nuestra comuna
50	municipality_name	Peñalolen
33	mailer_from_name	Abre Peñalolen
19	url	www.abre.penalolen.cl
34	mailer_from_address	abre@abre.penalolen.cl
36	meta_keywords	Abre Peñalolen, Abre Penalolen, Abre, Penalolen, Gobierno abierto, Participación ciudadana
35	meta_description	Abre Peñalolen es una propuesta de Fundaciónn Ciudadano Inteligente que busca acercar el trabajo de los municipios a la realidad de sus vecinos y poner la colaboración en el centro de la gestión local.
45	home.info-go_to	Más información sobre los talleres
44	home.info-title	¡SÚMATE A LOS TALLERES DE DISEÑO!
43	home.info-epigraph	SEGUNDA ETAPA DEL DESAFÍO
47	home.info-date	Sábados 19/08 y 02/09
48	home.info-go2_to	Revisar todas las propuestas
49	home.info-go2_to_link	https://abre.penalolen.cl/proposals
46	home.info-go_to_link	https://abre.penalolen.cl/projects
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('settings_id_seq', 50, true);


--
-- Data for Name: signature_sheets; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY signature_sheets (id, signable_id, signable_type, document_numbers, processed, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: signature_sheets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('signature_sheets_id_seq', 1, false);


--
-- Data for Name: signatures; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY signatures (id, signature_sheet_id, user_id, document_number, verified, created_at, updated_at) FROM stdin;
\.


--
-- Name: signatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('signatures_id_seq', 1, false);


--
-- Data for Name: site_customization_content_blocks; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY site_customization_content_blocks (id, name, locale, body, created_at, updated_at) FROM stdin;
\.


--
-- Name: site_customization_content_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('site_customization_content_blocks_id_seq', 1, false);


--
-- Data for Name: site_customization_images; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY site_customization_images (id, name, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at) FROM stdin;
1	icon_home	\N	\N	\N	\N	2017-08-21 13:19:15.978004	2017-08-21 13:19:15.978004
2	logo_header	\N	\N	\N	\N	2017-08-21 13:19:15.985464	2017-08-21 13:19:15.985464
3	social-media-icon	\N	\N	\N	\N	2017-08-21 13:19:15.990837	2017-08-21 13:19:15.990837
4	apple-touch-icon-200	\N	\N	\N	\N	2017-08-21 13:19:15.99589	2017-08-21 13:19:15.99589
\.


--
-- Name: site_customization_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('site_customization_images_id_seq', 4, true);


--
-- Data for Name: site_customization_pages; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY site_customization_pages (id, slug, title, subtitle, content, more_info_flag, print_content_flag, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: site_customization_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('site_customization_pages_id_seq', 1, false);


--
-- Data for Name: spending_proposals; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY spending_proposals (id, title, description, author_id, external_url, created_at, updated_at, geozone_id, price, feasible, association_name, price_explanation, feasible_explanation, internal_comments, valuation_finished, explanations_log, administrator_id, valuation_assignments_count, price_first_year, time_scope, unfeasible_email_sent_at, cached_votes_up, tsv, responsible_name, physical_votes) FROM stdin;
\.


--
-- Name: spending_proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('spending_proposals_id_seq', 1, false);


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY taggings (id, tag_id, taggable_id, taggable_type, tagger_id, tagger_type, context, created_at) FROM stdin;
1	2	1	Proposal	\N	\N	tags	2017-07-14 15:30:17.665709
2	1	2	Proposal	\N	\N	tags	2017-07-14 15:31:58.056402
3	9	2	Proposal	\N	\N	tags	2017-07-14 15:31:58.06636
4	16	3	Proposal	\N	\N	tags	2017-07-14 17:24:29.129871
5	2	4	Proposal	\N	\N	tags	2017-07-14 18:41:15.162218
6	9	4	Proposal	\N	\N	tags	2017-07-14 18:41:15.170728
7	14	5	Proposal	\N	\N	tags	2017-07-19 00:55:38.022938
8	15	5	Proposal	\N	\N	tags	2017-07-19 00:55:38.031661
9	3	5	Proposal	\N	\N	tags	2017-07-19 00:55:38.038554
10	2	5	Proposal	\N	\N	tags	2017-07-19 00:55:38.045072
11	12	5	Proposal	\N	\N	tags	2017-07-19 00:55:38.051468
12	14	6	Proposal	\N	\N	tags	2017-07-19 20:39:49.016574
13	10	7	Proposal	\N	\N	tags	2017-07-19 20:57:48.430152
14	9	7	Proposal	\N	\N	tags	2017-07-19 20:57:48.438063
15	3	7	Proposal	\N	\N	tags	2017-07-19 20:57:48.444958
16	3	8	Proposal	\N	\N	tags	2017-07-19 21:06:21.598565
17	9	8	Proposal	\N	\N	tags	2017-07-19 21:06:21.60513
18	15	8	Proposal	\N	\N	tags	2017-07-19 21:06:21.610929
19	3	9	Proposal	\N	\N	tags	2017-07-19 21:09:25.176784
20	9	9	Proposal	\N	\N	tags	2017-07-19 21:09:25.183852
21	3	10	Proposal	\N	\N	tags	2017-07-19 21:19:05.816937
22	14	10	Proposal	\N	\N	tags	2017-07-19 21:19:05.824002
23	15	10	Proposal	\N	\N	tags	2017-07-19 21:19:05.830561
24	3	11	Proposal	\N	\N	tags	2017-07-19 21:30:27.816091
25	15	11	Proposal	\N	\N	tags	2017-07-19 21:30:27.823161
26	10	11	Proposal	\N	\N	tags	2017-07-19 21:30:27.829839
27	9	12	Proposal	\N	\N	tags	2017-07-19 21:32:02.901246
28	8	12	Proposal	\N	\N	tags	2017-07-19 21:32:02.907813
29	15	12	Proposal	\N	\N	tags	2017-07-19 21:32:02.914011
30	2	12	Proposal	\N	\N	tags	2017-07-19 21:32:02.920369
31	3	13	Proposal	\N	\N	tags	2017-07-19 21:40:27.559134
32	15	13	Proposal	\N	\N	tags	2017-07-19 21:40:27.566441
33	14	13	Proposal	\N	\N	tags	2017-07-19 21:40:27.573346
34	9	13	Proposal	\N	\N	tags	2017-07-19 21:40:27.580851
35	3	14	Proposal	\N	\N	tags	2017-07-19 21:56:46.97814
36	9	14	Proposal	\N	\N	tags	2017-07-19 21:56:46.984863
37	2	15	Proposal	\N	\N	tags	2017-07-19 22:01:20.107311
38	3	15	Proposal	\N	\N	tags	2017-07-19 22:01:20.11453
39	15	15	Proposal	\N	\N	tags	2017-07-19 22:01:20.121686
40	8	15	Proposal	\N	\N	tags	2017-07-19 22:01:20.1289
41	9	15	Proposal	\N	\N	tags	2017-07-19 22:01:20.13566
42	15	16	Proposal	\N	\N	tags	2017-07-19 22:06:55.424749
43	3	16	Proposal	\N	\N	tags	2017-07-19 22:06:55.433891
44	9	16	Proposal	\N	\N	tags	2017-07-19 22:06:55.442154
45	10	17	Proposal	\N	\N	tags	2017-07-19 22:12:04.654826
46	14	17	Proposal	\N	\N	tags	2017-07-19 22:12:04.662823
47	15	17	Proposal	\N	\N	tags	2017-07-19 22:12:04.669723
48	14	18	Proposal	\N	\N	tags	2017-07-19 22:16:48.373222
49	15	18	Proposal	\N	\N	tags	2017-07-19 22:16:48.380192
50	3	18	Proposal	\N	\N	tags	2017-07-19 22:16:48.387024
51	12	19	Proposal	\N	\N	tags	2017-07-19 22:26:19.750133
52	15	19	Proposal	\N	\N	tags	2017-07-19 22:26:19.756734
53	2	20	Proposal	\N	\N	tags	2017-07-20 04:28:00.510109
54	15	20	Proposal	\N	\N	tags	2017-07-20 04:28:00.517429
55	9	20	Proposal	\N	\N	tags	2017-07-20 04:28:00.524021
56	13	20	Proposal	\N	\N	tags	2017-07-20 04:28:00.530929
57	3	20	Proposal	\N	\N	tags	2017-07-20 04:28:00.537308
58	1	20	Proposal	\N	\N	tags	2017-07-20 04:28:00.543708
59	10	22	Proposal	\N	\N	tags	2017-07-21 17:56:39.137098
60	12	22	Proposal	\N	\N	tags	2017-07-21 17:56:39.145639
61	9	22	Proposal	\N	\N	tags	2017-07-21 17:56:39.152601
62	15	22	Proposal	\N	\N	tags	2017-07-21 17:56:39.159461
63	8	22	Proposal	\N	\N	tags	2017-07-21 17:56:39.166622
64	17	23	Proposal	\N	\N	tags	2017-07-22 19:49:50.593606
65	3	24	Proposal	\N	\N	tags	2017-07-22 20:05:09.507255
66	12	24	Proposal	\N	\N	tags	2017-07-22 20:05:09.517735
67	15	24	Proposal	\N	\N	tags	2017-07-22 20:05:09.526254
68	3	25	Proposal	\N	\N	tags	2017-07-22 20:23:25.933257
69	15	25	Proposal	\N	\N	tags	2017-07-22 20:23:25.940421
70	14	25	Proposal	\N	\N	tags	2017-07-22 20:23:25.947453
71	14	26	Proposal	\N	\N	tags	2017-07-22 20:24:03.458283
72	15	27	Proposal	\N	\N	tags	2017-07-22 20:24:46.81208
73	4	28	Proposal	\N	\N	tags	2017-07-22 20:54:15.034784
74	2	28	Proposal	\N	\N	tags	2017-07-22 20:54:15.041441
75	15	28	Proposal	\N	\N	tags	2017-07-22 20:54:15.047638
76	8	28	Proposal	\N	\N	tags	2017-07-22 20:54:15.053772
77	3	29	Proposal	\N	\N	tags	2017-07-22 20:57:58.392282
78	14	30	Proposal	\N	\N	tags	2017-07-22 21:05:04.981804
79	10	31	Proposal	\N	\N	tags	2017-07-22 21:08:53.831342
80	2	31	Proposal	\N	\N	tags	2017-07-22 21:08:53.838511
81	14	31	Proposal	\N	\N	tags	2017-07-22 21:08:53.84533
82	14	34	Proposal	\N	\N	tags	2017-07-22 21:58:17.476922
83	3	34	Proposal	\N	\N	tags	2017-07-22 21:58:17.484428
84	13	35	Proposal	\N	\N	tags	2017-07-23 16:49:56.921206
85	15	35	Proposal	\N	\N	tags	2017-07-23 16:49:56.927248
86	8	35	Proposal	\N	\N	tags	2017-07-23 16:49:56.933212
87	9	35	Proposal	\N	\N	tags	2017-07-23 16:49:56.93928
88	2	35	Proposal	\N	\N	tags	2017-07-23 16:49:56.945264
89	2	36	Proposal	\N	\N	tags	2017-07-23 20:24:04.359237
90	15	36	Proposal	\N	\N	tags	2017-07-23 20:24:04.368094
91	14	36	Proposal	\N	\N	tags	2017-07-23 20:24:04.374961
92	12	36	Proposal	\N	\N	tags	2017-07-23 20:24:04.382002
93	10	36	Proposal	\N	\N	tags	2017-07-23 20:24:04.388829
94	11	36	Proposal	\N	\N	tags	2017-07-23 20:24:04.395533
95	3	37	Proposal	\N	\N	tags	2017-07-24 21:05:33.194425
96	15	37	Proposal	\N	\N	tags	2017-07-24 21:05:33.207493
97	14	37	Proposal	\N	\N	tags	2017-07-24 21:05:33.217602
98	3	38	Proposal	\N	\N	tags	2017-07-24 21:20:20.914616
99	15	38	Proposal	\N	\N	tags	2017-07-24 21:20:20.922802
100	14	38	Proposal	\N	\N	tags	2017-07-24 21:20:20.930327
101	9	38	Proposal	\N	\N	tags	2017-07-24 21:20:20.938121
102	3	39	Proposal	\N	\N	tags	2017-07-24 21:33:37.827253
103	15	39	Proposal	\N	\N	tags	2017-07-24 21:33:37.835291
104	14	39	Proposal	\N	\N	tags	2017-07-24 21:33:37.842774
105	9	39	Proposal	\N	\N	tags	2017-07-24 21:33:37.850218
106	12	39	Proposal	\N	\N	tags	2017-07-24 21:33:37.858195
107	15	40	Proposal	\N	\N	tags	2017-07-24 21:46:44.095578
108	10	40	Proposal	\N	\N	tags	2017-07-24 21:46:44.103281
109	14	40	Proposal	\N	\N	tags	2017-07-24 21:46:44.110789
110	3	41	Proposal	\N	\N	tags	2017-07-24 21:58:00.499774
111	14	41	Proposal	\N	\N	tags	2017-07-24 21:58:00.507351
112	9	41	Proposal	\N	\N	tags	2017-07-24 21:58:00.515639
113	15	42	Proposal	\N	\N	tags	2017-07-24 22:00:37.921842
114	3	42	Proposal	\N	\N	tags	2017-07-24 22:00:37.931854
115	12	42	Proposal	\N	\N	tags	2017-07-24 22:00:37.941224
116	14	42	Proposal	\N	\N	tags	2017-07-24 22:00:37.949602
117	15	43	Proposal	\N	\N	tags	2017-07-24 22:09:43.330826
118	14	43	Proposal	\N	\N	tags	2017-07-24 22:09:43.337469
119	3	43	Proposal	\N	\N	tags	2017-07-24 22:09:43.343466
120	10	44	Proposal	\N	\N	tags	2017-07-24 22:18:48.496649
121	15	44	Proposal	\N	\N	tags	2017-07-24 22:18:48.504281
122	9	44	Proposal	\N	\N	tags	2017-07-24 22:18:48.511582
123	12	44	Proposal	\N	\N	tags	2017-07-24 22:18:48.518984
124	14	45	Proposal	\N	\N	tags	2017-07-24 22:48:00.960248
125	9	45	Proposal	\N	\N	tags	2017-07-24 22:48:00.967449
126	3	45	Proposal	\N	\N	tags	2017-07-24 22:48:00.974283
127	3	46	Proposal	\N	\N	tags	2017-07-26 21:48:02.189916
128	9	46	Proposal	\N	\N	tags	2017-07-26 21:48:02.20026
129	14	46	Proposal	\N	\N	tags	2017-07-26 21:48:02.208054
130	15	46	Proposal	\N	\N	tags	2017-07-26 21:48:02.21668
131	2	46	Proposal	\N	\N	tags	2017-07-26 21:48:02.226158
132	2	47	Proposal	\N	\N	tags	2017-07-26 22:11:26.890586
133	15	48	Proposal	\N	\N	tags	2017-07-29 21:03:54.886778
134	8	48	Proposal	\N	\N	tags	2017-07-29 21:03:54.897254
135	4	48	Proposal	\N	\N	tags	2017-07-29 21:03:54.90496
136	7	48	Proposal	\N	\N	tags	2017-07-29 21:03:54.912479
137	10	13	Proposal	\N	\N	tags	2017-08-08 20:43:35.243562
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('taggings_id_seq', 137, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY tags (id, name, taggings_count, featured, debates_count, proposals_count, spending_proposals_count, kind, "budget/investments_count") FROM stdin;
5	Economía	0	t	0	0	0	category	0
6	Empleo	0	t	0	0	0	category	0
11	Medios	1	t	0	1	0	category	0
17	Iluminación	1	f	0	1	0	\N	0
12	Salud	8	t	0	8	0	category	0
16	Salud FE	1	f	0	1	0	\N	0
3	Deportes	24	t	0	24	0	category	0
9	Participación	19	t	0	19	0	category	0
14	Seguridad y Emergencias	21	t	0	21	0	category	0
2	Cultura	12	t	0	12	0	category	0
15	Medio Ambiente	28	t	0	28	0	category	0
8	Sostenibilidad	6	t	0	6	0	category	0
4	Derechos Sociales	2	t	0	2	0	category	0
7	Equidad	1	t	0	1	0	category	0
10	Movilidad	9	t	0	9	0	category	0
1	Asociaciones	2	t	0	2	0	category	0
13	Transparencia	2	t	0	2	0	category	0
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('tags_id_seq', 17, true);


--
-- Data for Name: tolk_locales; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY tolk_locales (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: tolk_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('tolk_locales_id_seq', 1, false);


--
-- Data for Name: tolk_phrases; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY tolk_phrases (id, key, created_at, updated_at) FROM stdin;
\.


--
-- Name: tolk_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('tolk_phrases_id_seq', 1, false);


--
-- Data for Name: tolk_translations; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY tolk_translations (id, phrase_id, locale_id, text, previous_text, primary_updated, created_at, updated_at) FROM stdin;
\.


--
-- Name: tolk_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('tolk_translations_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, email_on_comment, email_on_comment_reply, phone_number, official_position, official_level, hidden_at, sms_confirmation_code, username, document_number, document_type, residence_verified_at, email_verification_token, verified_at, unconfirmed_phone, confirmed_phone, letter_requested_at, confirmed_hide_at, letter_verification_code, failed_census_calls_count, level_two_verified_at, erase_reason, erased_at, public_activity, newsletter, notifications_count, registering_with_oauth, locale, oauth_email, geozone_id, redeemable_code, gender, date_of_birth, email_on_proposal_notification, email_digest, email_on_direct_message, official_position_badge, password_changed_at, created_from_signature, failed_email_digests_count, former_users_data_log, address, rut_verified) FROM stdin;
14	org6@abre.penalolen.cl	$2a$10$/hGz/k7/3AkPX0TLvm5tY.edkF42UkmrGyKih0ijZGB31GKP.CMfC	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.237136	2017-07-11 16:40:56.250834	\N	2017-07-11 16:40:56.163784	\N	\N	f	f	\N	\N	0	\N	\N	Fonseca Hermanos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.23688	f	0		\N	\N
2	mod@abre.penalolen.cl	$2a$10$QVHmHg99pGs0us5H3a9f4OKxUNkItywl5eN2mi1AdS0lv9odPN/Y.	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.142828	2017-07-11 16:40:55.158474	\N	2017-07-11 16:40:55.069836	\N	\N	f	f	\N	\N	0	\N	\N	mod	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.142564	f	0		\N	\N
3	manager@abre.penalolen.cl	$2a$10$RNxKxhxU9y7Y3AyvZIAchelx40BplThHavzjStXgtGr1i25GPXfmC	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.235402	2017-07-11 16:40:55.250767	\N	2017-07-11 16:40:55.161861	\N	\N	f	f	\N	\N	0	\N	\N	manager	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.23507	f	0		\N	\N
4	valuator@abre.penalolen.cl	$2a$10$1y6AKDFuQrL/1MZ0fVky.u1Ac56hBhGaKtg/cBBmRjvydhhcjS696	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.32795	2017-07-11 16:40:55.349716	\N	2017-07-11 16:40:55.254234	\N	\N	f	f	\N	\N	0	\N	\N	valuator	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.327646	f	0		\N	\N
5	poll_officer@abre.penalolen.cl	$2a$10$58WjrVlFVL6MvFgsA/UdOuu55MG7JIErDg6IbiMUJ.8aAoogFelwq	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.427261	2017-07-11 16:40:55.427261	\N	2017-07-11 16:40:55.353226	\N	\N	f	f	\N	\N	0	\N	\N	Paul O. Fisher	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.426972	f	0		\N	\N
6	leveltwo@abre.penalolen.cl	$2a$10$nx5HOR92V4okFdkMmiM48e8VkPBy3UpuvjOlJVDl8yhEIa9xduH4O	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.53096	2017-07-11 16:40:55.537754	\N	2017-07-11 16:40:55.458003	\N	\N	f	f	\N	\N	0	\N	\N	level 2	2222222222	1	2017-07-11 16:40:55.534015	\N	\N	\N	938153923	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.530671	f	0		\N	\N
7	verified@abre.penalolen.cl	$2a$10$l9AgV8PFLFf.tofMMU26Aef/n77M3n5BqbcmPLfRAsQE0Znyb/.V6	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.612971	2017-07-11 16:40:55.61945	\N	2017-07-11 16:40:55.540616	\N	\N	f	f	\N	\N	0	\N	\N	verified	3333333333	1	2017-07-11 16:40:55.615963	\N	2017-07-11 16:40:55.616154	\N	937386825	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.612736	f	0		\N	\N
9	org1@abre.penalolen.cl	$2a$10$yUJOJpoKRYKzA.WhWO5pZ.VOV38uwAs2pTqPWgItvVcS4.e7dpgQm	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.771621	2017-07-11 16:40:55.793364	\N	2017-07-11 16:40:55.698726	\N	\N	f	f	\N	\N	0	\N	\N	Vázquez, Olivo y Mejía Asociados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.771369	f	0		\N	\N
20	official2@abre.penalolen.cl	$2a$10$GSBavSSaYAirjPve6hvvOeWOe5im905UlmZy09YOYT9ArUuU9ofMO	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.758837	2017-07-11 16:40:56.76404	\N	2017-07-11 16:40:56.685894	\N	\N	f	f	\N	Official position 2	2	\N	\N	Sta. Andrea Noriega Girón	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.758514	f	0		\N	\N
10	org2@abre.penalolen.cl	$2a$10$XTdm8gm.KWvSVPMkCck2vurLO5ukMqRPLpZugKbmQE6B4B5AufmoO	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.873905	2017-07-11 16:40:55.887282	\N	2017-07-11 16:40:55.800694	\N	\N	f	f	\N	\N	0	\N	\N	Luevano Tejeda S.A.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.873654	f	0		\N	\N
15	org7@abre.penalolen.cl	$2a$10$uql.cCrSFczom0oY0DdbX.KprlHXYWFIEfLaMss77hZkjWpBsbI8i	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.325598	2017-07-11 16:40:56.339495	\N	2017-07-11 16:40:56.252784	\N	\N	f	f	\N	\N	0	\N	\N	Gastélum y Castillo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.325344	f	0		\N	\N
11	org3@abre.penalolen.cl	$2a$10$7RDS6O0MrL.z8WbWHaKJ7Ou5Yq90F9hqw6jGpyxahfVKNrV8UzRpy	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:55.962742	2017-07-11 16:40:55.976919	\N	2017-07-11 16:40:55.889184	\N	\N	f	f	\N	\N	0	\N	\N	Rodríquez, Deleón y Gonzales Asociados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.962493	f	0		\N	\N
12	org4@abre.penalolen.cl	$2a$10$vd6MTSOQ7ttfBN./G9QfFelMTnfchqgWm52xozODSKIYe6O07wrMq	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.052391	2017-07-11 16:40:56.067059	\N	2017-07-11 16:40:55.97922	\N	\N	f	f	\N	\N	0	\N	\N	Moya, Matías y Pulido Asociados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.052086	f	0		\N	\N
13	org5@abre.penalolen.cl	$2a$10$3B5fAsCgTNFhqjsUHYl.AeQz8VAaVgzfns4JKNwTD34gIgeJ/5RTe	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.145282	2017-07-11 16:40:56.161669	\N	2017-07-11 16:40:56.069336	\N	\N	f	f	\N	\N	0	\N	\N	Olivas, Esquibel y Escamilla Asociados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.145038	f	0		\N	\N
21	official3@abre.penalolen.cl	$2a$10$jt9BWq0wv1fy4EVaYBqvKOjYvXkDSQxIvWI6kWhaGBAJckGdGH7Y.	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.839973	2017-07-11 16:40:56.844939	\N	2017-07-11 16:40:56.766869	\N	\N	f	f	\N	Official position 3	3	\N	\N	Virginia Tapia Carrera	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.839639	f	0		\N	\N
16	org8@abre.penalolen.cl	$2a$10$o5jEusrP5thmqU0iUqGza./zasjwjLKgbwonTWrJyxa1Bm1il0gde	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.414172	2017-07-11 16:40:56.427061	\N	2017-07-11 16:40:56.341516	\N	\N	f	f	\N	\N	0	\N	\N	Tejada, Limón y Mendoza Asociados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.413933	f	0		\N	\N
17	org9@abre.penalolen.cl	$2a$10$BoBJeGuY3JjA8O.FF5S8AO7mbzgAJ13tthHnIXT89vdpxpK7GVjyy	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.501281	2017-07-11 16:40:56.514502	\N	2017-07-11 16:40:56.428862	\N	\N	f	f	\N	\N	0	\N	\N	Mercado Gonzales S.A.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.501045	f	0		\N	\N
8	unverified@abre.penalolen.cl	$2a$10$DUF/ezFX0Drgrvqt3OXQBOD0Ryg8XnROVdBIpNL0NdYu7Xbcn24EW	\N	\N	\N	33	2017-10-26 18:16:49.372944	2017-07-29 18:36:57.168959	190.164.160.209	191.126.54.134	2017-07-11 16:40:55.695291	2017-10-26 18:16:49.3747	\N	2017-07-11 16:40:55.621985	\N	\N	f	f	\N	\N	0	\N	\N	Vecino Peñalolen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:55.695041	f	0		\N	\N
18	org10@abre.penalolen.cl	$2a$10$Lkf.7OwkGukzIVTC3C8qe.b2/en1UOZVtRxGonYamRXXX6QczohLC	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.589104	2017-07-11 16:40:56.602482	\N	2017-07-11 16:40:56.516429	\N	\N	f	f	\N	\N	0	\N	\N	Cintrón S.L.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.588837	f	0		\N	\N
19	official1@abre.penalolen.cl	$2a$10$G/VvPJbOd8WEtYW/GO8UFOjYmBToVPRtCHXYcAarG7zFTXV79InbG	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:56.678031	2017-07-11 16:40:56.68304	\N	2017-07-11 16:40:56.604694	\N	\N	f	f	\N	Official position 1	1	\N	\N	Rocio Fuentes Frías	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.677796	f	0		\N	\N
24	user3@abre.penalolen.cl	$2a$10$11gdVIDGZBOpqLRxRh7ZKeIRqxTKRjT5E1UYCL47w90plukvaTp/6	\N	\N	\N	1	2017-07-29 23:03:45.344383	2017-07-29 23:03:45.344383	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.085245	2017-07-29 23:03:45.345915	\N	2017-07-11 16:40:57.01259	\N	\N	f	f	\N	\N	0	\N	\N	Lucia Casanova Barrios	3936684858	1	2017-07-11 16:40:57.088175	\N	\N	\N	924840627	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.085004	f	0		\N	\N
22	user1@abre.penalolen.cl	$2a$10$78/hmOTb6BIWx3JefdGMCu320sCYT9uSxMNntLK34kCo6Niu/JS7y	\N	\N	\N	1	2017-07-29 23:05:07.062465	2017-07-29 23:05:07.062465	191.126.160.121	191.126.160.121	2017-07-11 16:40:56.920457	2017-07-29 23:05:07.063854	\N	2017-07-11 16:40:56.847462	\N	\N	f	f	\N	\N	0	\N	\N	Salvador Rolón Fonseca	1901215549	1	2017-07-11 16:40:56.923494	\N	\N	\N	992037686	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:56.920192	f	0		\N	\N
25	user4@abre.penalolen.cl	$2a$10$nMGZlQToYcmD/kiT.0dVz.598Sc7v.v7VuSlAJQXzNj309aI4Vxky	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:57.166767	2017-07-11 16:40:57.17293	\N	2017-07-11 16:40:57.09415	\N	\N	f	f	\N	\N	0	\N	\N	Ramón Báez Benavídez	9367670815	1	2017-07-11 16:40:57.169764	\N	\N	\N	953 101 851	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.166493	f	0		\N	\N
26	user5@abre.penalolen.cl	$2a$10$yQKjhTgjd3n8GULstCXRmuBVowLO/4n5xROi5882H5Dx5uGPY9ubC	\N	\N	\N	2	2017-07-29 22:54:21.487622	2017-07-29 21:44:02.064164	191.126.138.119	191.126.160.121	2017-07-11 16:40:57.248788	2017-07-29 22:54:21.4893	\N	2017-07-11 16:40:57.175927	\N	\N	f	f	\N	\N	0	\N	\N	Sta. Gregorio Espinosa Yáñez	6842196382	1	2017-07-11 16:40:57.251754	\N	\N	\N	919903501	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.248526	f	0		\N	\N
27	user6@abre.penalolen.cl	$2a$10$lfBy.cuov0TQ.5OlfKA1cO913crRwmUQ1LNL67m/MPI6wKjOnudeq	\N	\N	\N	1	2017-07-29 22:51:32.368231	2017-07-29 22:51:32.368231	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.330182	2017-07-29 22:51:32.370115	\N	2017-07-11 16:40:57.257763	\N	\N	f	f	\N	\N	0	\N	\N	Soledad Carrasquillo Ledesma	9727845362	1	2017-07-11 16:40:57.333286	\N	\N	\N	923.018.508	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.329947	f	0		\N	\N
23	user2@abre.penalolen.cl	$2a$10$l1NB1DhU.5bWg2e5t6bJUe03EqrU612zjgQft3E7argKi6E4WgQGC	\N	\N	\N	1	2017-07-29 22:54:59.617261	2017-07-29 22:54:59.617261	191.126.160.121	191.126.160.121	2017-07-11 16:40:57.002913	2017-07-29 22:54:59.618633	\N	2017-07-11 16:40:56.930233	\N	\N	f	f	\N	\N	0	\N	\N	Sta. Alicia Abrego Cabán	6343446261	1	2017-07-11 16:40:57.006038	\N	\N	\N	935-894-729	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.002671	f	0		\N	\N
29	user8@abre.penalolen.cl	$2a$10$JwiRMAdQsKgHJoG0mVeHuedSldF8oydJHk56yLOjdas4qmkeQV/mm	\N	\N	\N	1	2017-07-29 22:36:49.622982	2017-07-29 22:36:49.622982	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.493547	2017-07-29 22:36:49.624431	\N	2017-07-11 16:40:57.421476	\N	\N	f	f	\N	\N	0	\N	\N	Enrique Angulo Menéndez	3766558016	1	2017-07-11 16:40:57.496684	\N	\N	\N	924-586-174	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.49322	f	0		\N	\N
31	user10@abre.penalolen.cl	$2a$10$Bp40dUTRE/zAba2zOzGrgu/j4/3D1fxnuJ9FR8XnF5YHKmQaRuWkq	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:57.662501	2017-07-11 16:40:57.670267	\N	2017-07-11 16:40:57.586927	\N	\N	f	f	\N	\N	0	\N	\N	Natalia Araña Calderón	1600475159	1	2017-07-11 16:40:57.666161	\N	\N	\N	947.890.686	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.66217	f	0		\N	\N
30	user9@abre.penalolen.cl	$2a$10$bVDqJBGQGQx.zpAs4qJCk.HT6s9eyMQfoEozD5fPPpYiTkd4MaSya	\N	\N	\N	1	2017-07-29 22:35:30.192907	2017-07-29 22:35:30.192907	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.575438	2017-07-29 22:35:30.194191	\N	2017-07-11 16:40:57.503026	\N	\N	f	f	\N	\N	0	\N	\N	Sta. Roberto Treviño Quiroz	8215920357	1	2017-07-11 16:40:57.578612	\N	\N	\N	965092532	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.575124	f	0		\N	\N
34	user13@abre.penalolen.cl	$2a$10$.HaQ10K28wFVmK2JIwDmkeRRzE71e2LskkSJ7iI/27hXd5s7EgpBS	\N	\N	\N	2	2017-07-29 22:31:41.30011	2017-07-29 22:25:27.020456	191.126.165.109	191.126.165.109	2017-07-11 16:40:57.912983	2017-07-29 22:31:41.301398	\N	2017-07-11 16:40:57.8397	\N	\N	f	f	\N	\N	0	\N	\N	Marco Antonio Magaña Dávila	5321755342	1	2017-07-11 16:40:57.915965	\N	\N	\N	972-385-449	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.91273	f	0		\N	\N
43	daquiroz@uc.cl	$2a$10$yu.LiUvpYz35uvv5DnBSpuO6v08f5XF31qF50s0Ta9DLYdCimV0.a	\N	\N	\N	6	2017-09-28 13:21:29.698157	2017-09-11 19:54:52.226819	190.20.82.149	190.20.21.76	2017-07-11 16:42:19.264346	2017-09-28 13:21:29.699712	\N	2017-07-11 16:42:19.188153	\N	\N	f	f	\N	\N	0	\N	\N	Daniela Quiroz Olguín	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	daquiroz@uc.cl	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:42:19.264014	f	0		\N	\N
32	user11@abre.penalolen.cl	$2a$10$0nru.l4UeJY2ilr9sJsTcuEFBNlJzOK2UawTrrvQX4G0owo0rZsgu	\N	\N	\N	1	2017-07-29 22:27:50.626666	2017-07-29 22:27:50.626666	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.746433	2017-07-29 22:27:50.628419	\N	2017-07-11 16:40:57.673149	\N	\N	f	f	\N	\N	0	\N	\N	Sra. Mariana Valenzuela Cuellar	8692430738	1	2017-07-11 16:40:57.750438	\N	\N	\N	990.577.017	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.746114	f	0		\N	\N
35	user14@abre.penalolen.cl	$2a$10$Rgz5tAQDebvcLm3gNpiUs.SInIv9ALZOKY7mVc/JB/DeANIkrppN.	\N	\N	\N	1	2017-07-29 22:03:20.968054	2017-07-29 22:03:20.968054	191.126.165.109	191.126.165.109	2017-07-11 16:40:57.99629	2017-07-29 22:03:20.969539	\N	2017-07-11 16:40:57.922575	\N	\N	f	f	\N	\N	0	\N	\N	Sofia Gollum Farías	4630961094	1	2017-07-11 16:40:57.9996	\N	\N	\N	925-921-610	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.995969	f	0		\N	\N
37	user16@abre.penalolen.cl	$2a$10$c0Vy3.toAtPqJ4xQYmTAvOP2QZ5D3e7tvFELsIS/73aR4M4pIjkcK	\N	\N	\N	2	2017-07-29 21:45:00.371515	2017-07-29 21:24:41.484882	191.126.138.119	191.126.132.215	2017-07-11 16:40:58.163767	2017-07-29 21:45:00.372903	\N	2017-07-11 16:40:58.090101	\N	\N	f	f	\N	\N	0	\N	\N	Eloisa Delatorre Barrera	9627045998	1	2017-07-11 16:40:58.167106	\N	\N	\N	940.066.753	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:58.163471	f	0		\N	\N
36	user15@abre.penalolen.cl	$2a$10$HHkGgWKGf7uYm0yRuPv0H.u4Nyk1wIkCwkYtJsmuBCkAN1ZwCEMg2	\N	\N	\N	1	2017-07-29 21:48:52.52197	2017-07-29 21:48:52.52197	191.126.138.119	191.126.138.119	2017-07-11 16:40:58.080851	2017-07-29 21:48:52.523284	\N	2017-07-11 16:40:58.006544	\N	\N	f	f	\N	\N	0	\N	\N	Alfredo Treviño Partida	3777584227	1	2017-07-11 16:40:58.083702	\N	\N	\N	941959512	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:58.080499	f	0		\N	\N
39	user18@abre.penalolen.cl	$2a$10$m9jKH1mhpnReuCk8TFzWBeQ.98SlHeAIYfmSY8wvdPuevrol8z9YK	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 16:40:58.329853	2017-07-11 16:40:58.336443	\N	2017-07-11 16:40:58.256988	\N	\N	f	f	\N	\N	0	\N	\N	María Cristina Verdugo Ceballos	7008678670	1	2017-07-11 16:40:58.332974	\N	\N	\N	926.353.835	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:58.329569	f	0		\N	\N
40	user19@abre.penalolen.cl	$2a$10$JEihmp6zq9889uFZhlD5.OgrKfODNROlY9VvW9.TKZhSsp4OCZWH2	\N	\N	\N	2	2017-07-29 20:53:58.437602	2017-07-29 20:45:34.147384	191.126.11.42	191.126.50.159	2017-07-11 16:40:58.412072	2017-07-29 20:53:58.438974	\N	2017-07-11 16:40:58.33908	\N	\N	f	f	\N	\N	0	\N	\N	Rosalia Montero Briones	5005316486	1	2017-07-11 16:40:58.415183	\N	\N	\N	933.379.249	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:58.411818	f	0		\N	\N
41	user20@abre.penalolen.cl	$2a$10$qStKGNDjDllA15XVbL.HIeq0qS6Qx5omz3st34zkrk89Pkg.YDVgW	\N	\N	\N	2	2017-07-29 20:17:20.556186	2017-07-29 19:39:06.426385	191.126.50.159	191.126.130.215	2017-07-11 16:40:58.495423	2017-07-29 20:17:20.557484	\N	2017-07-11 16:40:58.422074	\N	\N	f	f	\N	\N	0	\N	\N	Antonio Laureano Carbajal	5307085234	1	2017-07-11 16:40:58.498734	\N	\N	\N	985 589 709	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:58.495109	f	0		\N	\N
46	jordi.bar.i@gmail.com	$2a$10$C6ppJKcMWeCqReTwPVTAq.58Kh1WdY8a9dRAKg0L9wDHia7DaGwUa	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 21:30:05.532744	2017-07-11 21:30:05.532744	hA7kaF8keU5jPot2hEox	\N	2017-07-11 21:30:05.534785	\N	f	f	\N	\N	0	\N	\N	jjj	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 21:30:05.532405	f	0		\N	\N
42	jordi.bari@gmail.com	$2a$10$lPiCcArv1Xwk8Mv3bRE2xOhkYkPt7KDUFaEWPg0pDUycltY0dqnku	\N	\N	\N	1	2017-07-11 20:45:42.759418	2017-07-11 20:45:42.759418	190.20.114.129	190.20.114.129	2017-07-11 16:41:39.912336	2017-07-11 20:45:58.107999	ZMgsdPPTtRuDDEKpv6Gc	2017-07-11 20:45:21.425891	2017-07-11 16:41:40.09745	\N	f	f	\N	\N	0	\N	\N	jordi	1014017K	1	2017-07-11 20:45:58.100426	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	1	\N	1	1918-12-19 00:00:00	t	t	t	f	2017-07-11 16:41:39.911704	f	0		\N	\N
44	jbari@ciudadanointeligente.org	$2a$10$pwYlu/ZRZA3mMOp2iAJrPO7FdgHfWzOeCJPLc.5EAdYUrj.0On/s.	\N	\N	\N	0	\N	\N	\N	\N	2017-07-11 20:47:49.179251	2017-07-11 21:26:18.935141	S5wCrosS_Scz2EAnecKu	\N	2017-07-11 20:47:49.181404	\N	f	f	\N	\N	0	2017-07-11 21:26:18.935104	\N	hhhh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 20:47:49.178962	f	0		\N	\N
47	j.ordi.bari@gmail.com	$2a$10$BDEsUcHJ2EM2/pjeMaXJdOpzSSjfhNEc5xvghUzMhWWeXVzqt6/km	\N	\N	\N	1	2017-07-11 22:29:03.92803	2017-07-11 22:29:03.92803	190.20.114.129	190.20.114.129	2017-07-11 22:24:56.501955	2017-07-11 22:30:12.100747	jx1RWPgXo1wu5VmdMFfk	2017-07-11 22:26:18.756058	2017-07-11 22:24:56.504023	\N	f	f	\N	\N	0	\N	\N	fred	11442137	1	2017-07-11 22:30:12.085491	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	1	\N	1	1917-12-19 00:00:00	t	t	t	f	2017-07-11 22:24:56.501664	f	0		\N	\N
48	jordi.b.ari@gmail.com	$2a$10$JJnnL4zNzOxuICUlm.8DtOBfCqSxQuogOgMJdtJ6ljPSdR0CfWHaK	\N	\N	\N	0	\N	\N	\N	\N	2017-07-12 14:49:29.503158	2017-07-12 14:51:09.863248	wjsjLSMiCK9V3aJz4Lky	2017-07-12 14:51:09.862176	2017-07-12 14:49:29.689086	\N	f	f	\N	\N	0	\N	\N	jordi.b.ari@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-12 14:49:29.502698	f	0		\N	\N
49	j.bari@ciudadanointeligente.org	$2a$10$/YcaSgPLanbdEi6IOPyq/ezD/ua7gQOZBgbHlQvWdTVTOdcv0.662	\N	\N	\N	0	\N	\N	\N	\N	2017-07-13 16:34:48.525464	2017-07-13 16:34:48.525464	PsnR8TEpCkDxqmdXQfqd	\N	2017-07-13 16:34:48.705304	\N	f	f	\N	\N	0	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-13 16:34:48.525145	f	0		\N	\N
50	j.b.ari@ciudadanointeligente.org	$2a$10$3IyZqjKo7IZNWLq7irEnKuBqndfTE6P8tklScRDk2KbwbWM54ZblW	\N	\N	\N	0	\N	\N	\N	\N	2017-07-13 16:41:11.155386	2017-07-13 16:41:11.155386	AJ24W9YocwkoPLfJnNpP	\N	2017-07-13 16:41:11.158108	\N	f	f	\N	\N	0	\N	\N	w	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-13 16:41:11.155076	f	0		\N	\N
51	j.o.rdi.bari@gmail.com	$2a$10$Nc.3KVI1ucHMWhgRfSCYku/UceEGzg9nUb3NXx91M5HFkqtCCdETG	\N	\N	\N	0	\N	\N	\N	\N	2017-07-13 17:17:19.85813	2017-07-13 17:19:24.121289	_LXmDPQz3yon1rwqeY5j	2017-07-13 17:19:24.120249	2017-07-13 17:17:19.860164	\N	f	f	\N	\N	0	\N	\N	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-13 17:17:19.857833	f	0		\N	\N
1	admin@abre.penalolen.cl	$2a$10$cOOKcgthU/RQXZLxbGS6je5p8Smvq/Bt5N2FNYeoEwdfoh0uR8/Gq	\N	\N	\N	67	2017-11-15 14:24:55.098096	2017-11-06 14:46:06.144816	190.20.77.33	190.164.160.209	2017-07-11 16:40:55.038995	2017-11-15 14:24:55.100259	\N	2017-07-11 16:40:54.908203	\N	\N	f	f	\N	\N	0	\N	\N	admin	1111111111	1	2017-07-11 16:40:55.062847	\N	2017-07-11 16:40:55.063225	\N	968.191.592	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-10-04 14:29:00.945783	f	0		\N	\N
54	\N	$2a$10$lPexVdO5PUV3/uiUUCGxnOt/uLYF/iT3tgSokds5RrZRjNqInjDuK	\N	\N	\N	8	2017-07-24 22:04:30.437631	2017-07-22 20:45:26.464322	190.20.12.50	191.125.30.150	2017-07-14 16:27:53.414949	2017-07-24 22:04:30.438898	BosUHky5sKufAZJXhsBt	\N	2017-07-14 16:29:28.289068	btorres@ciudadanointeligente.org	f	f	\N	\N	0	\N	\N	Bastián Torres Salgado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	t	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-14 16:27:53.414614	f	0		\N	\N
56	margamaira@gmail.com	$2a$10$495U0Tgd4heEsynZg.IYSuxc0/lpN/I8puezPFPcjpgKj0wTjX1W6	\N	\N	\N	5	2017-07-24 21:03:02.52899	2017-07-22 20:27:36.460708	190.20.12.50	191.125.4.185	2017-07-14 18:28:35.298126	2017-07-24 21:03:02.530451	\N	2017-07-14 18:28:35.212246	\N	\N	f	f	\N	\N	0	\N	\N	Margarita Maira Serrano	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	margamaira@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-14 18:28:35.297856	f	0		\N	\N
53	daquiroz.o@gmail.com	$2a$10$AlXqBp9Ty5BQI5A/0RqOmu1DrLFGaZOubIXCy3O3a6vgBNU3qehOS	\N	\N	\N	6	2017-07-25 20:23:14.145851	2017-07-21 16:16:49.966075	190.20.165.246	190.44.151.140	2017-07-14 15:15:00.383545	2017-07-25 20:23:14.147237	LE3yuW7mvARVDiAxQuJv	2017-07-14 15:15:37.303247	2017-07-14 15:15:00.565925	\N	f	f	\N	\N	0	\N	\N	daniquiroz	10284929	1	2017-07-14 16:00:28.674411	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	1	\N	1	1991-04-23 00:00:00	t	t	t	f	2017-07-14 15:15:00.383167	f	0		\N	\N
55	btorres@ciudadanointeligente.org	$2a$10$U7fYdme.LeTCKo3nmpVbm.Bwll3cSvyqZ7TUmLr59EHTlbM5rbbYi	\N	\N	\N	1	2017-07-14 16:33:37.78405	2017-07-14 16:33:37.78405	190.20.86.168	190.20.86.168	2017-07-14 16:30:22.909819	2017-07-14 19:42:09.975079	gnbyQzLGgeXA_yrwVUGb	2017-07-14 16:32:05.59095	2017-07-14 16:30:22.912362	\N	t	t	\N	\N	0	\N	\N	btorres@ciudadanointeligente.org	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-14 16:30:22.90947	f	0		\N	\N
38	user17@abre.penalolen.cl	$2a$10$ACSO3NNfJEmannDkXiaFqulnf87Xi/ygMCeIMFE.bmXxYKU/p3VmK	\N	\N	\N	1	2017-07-29 21:22:26.873917	2017-07-29 21:22:26.873917	191.126.132.215	191.126.132.215	2017-07-11 16:40:58.247303	2017-07-29 21:22:37.207658	h3oWsvUvzoF_HNDJxsu6	\N	2017-07-29 21:22:37.206753	\N	f	f	\N	\N	0	\N	\N	Julio Salas Matos	7404388542	1	2017-07-11 16:40:58.250499	\N	\N	\N	958-970-601	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:58.247033	f	0		\N	\N
57	\N	$2a$10$bEEHR53ugUPeNG6iH3smu.gJdtS7wQ1zwHJqTLU9R.g327GzshI.y	\N	\N	\N	1	2017-07-17 19:08:13.794548	2017-07-17 19:08:13.794548	190.20.72.155	190.20.72.155	2017-07-17 19:08:13.777987	2017-07-17 19:08:13.795887	\N	\N	\N	\N	f	f	\N	\N	0	\N	\N	Marcos Durruti	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	t	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-17 19:08:13.777718	f	0		\N	\N
58	j.ordi.b.ari@gmail.com	$2a$10$RDiEcWNzGLYMXV.W043EeeKAqyeo2ozj2aFBsDJ2BLedGOqM6/Gwa	\N	\N	\N	2	2017-07-17 19:24:15.728446	2017-07-17 19:17:48.870499	190.20.72.155	190.20.72.155	2017-07-17 19:16:12.640246	2017-07-17 19:25:20.488967	yFtqgQy7ZiAWNRsExCPa	2017-07-17 19:17:36.975409	2017-07-17 19:16:12.821206	\N	f	f	\N	\N	0	\N	\N	jjjx	111	1	2017-07-17 19:25:20.48086	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	1	\N	1	1916-01-17 00:00:00	t	t	t	f	2017-07-17 19:16:12.639816	f	0		\N	f
59	nicofernandezrod@gmail.com	$2a$10$MKIxdbjFNCrGEEqceWBT6ObKX1SgkDyyO2DKOvKtpD48Z2NYNBroS	\N	\N	\N	1	2017-07-17 20:24:41.258653	2017-07-17 20:24:41.258653	190.20.72.155	190.20.72.155	2017-07-17 20:24:41.242322	2017-07-17 20:24:41.259734	\N	2017-07-17 20:24:41.152795	\N	\N	f	f	\N	\N	0	\N	\N	Nicolas Fernández Rodríguez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	nicofernandezrod@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-17 20:24:41.241993	f	0		\N	\N
72	juanbalboa_45@gmail.com	$2a$10$WDokR2TQ32eG0DNGZxzFsus17b6fptpIGmmNMupBW0FYSiz4R2Zfq	\N	\N	\N	0	\N	\N	\N	\N	2017-07-19 20:52:01.880637	2017-07-19 20:52:01.880637	whyZHHWy9yuE6HXyd5Qs	\N	2017-07-19 20:52:01.88293	\N	f	f	\N	\N	0	\N	\N	Juan Balboa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 20:52:01.880345	f	0		\N	\N
60	cyanez@ciudadanointeligente.org	$2a$10$8a8Q66Ju89DJk6ZST7fVEu7CLcIWdXBBXgPmdTGAoXiUfkD1nP6me	\N	\N	\N	2	2017-07-17 20:40:17.69154	2017-07-17 20:27:39.425651	190.20.72.155	190.20.72.155	2017-07-17 20:27:39.411139	2017-07-17 20:40:17.692685	xzEdBbzs6zULUcjsNTyY	2017-07-17 20:32:41.536428	2017-07-17 20:31:12.549427	\N	f	f	\N	\N	0	\N	\N	Constanza Yáñez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-17 20:40:17.681828	f	0		\N	\N
61	constanza.yanez@mail.udp.cl	$2a$10$s6MEUkYPDVrcd6eoQo9xTu8t2hV2h.3gSS9/lEoruYOjh9l3GD/Jq	\N	\N	\N	2	2017-07-17 20:58:24.811421	2017-07-17 20:53:52.906545	190.20.72.155	190.20.72.155	2017-07-17 20:47:03.080476	2017-07-17 20:58:24.812856	HQzGEEJhMyjmEvFttGHn	2017-07-17 20:53:32.324693	2017-07-17 20:47:03.082577	\N	f	f	\N	\N	0	\N	\N	CyanezZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-17 20:47:03.080197	f	0		\N	\N
62	dquiroz@ciudadanointeligente.org	$2a$10$wDf7zdxiuSIPenNO8ztz8OjB.2Yef/J5ATfr6RmvVLAOJO/XP/LlW	\N	\N	\N	0	\N	\N	\N	\N	2017-07-17 21:10:57.293577	2017-07-17 21:10:57.293577	nXiArVVsXR8EHCZxs3vR	\N	2017-07-17 21:10:57.47406	\N	f	f	\N	\N	0	\N	\N	danielaquiroz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-17 21:10:57.293236	f	0		\N	\N
63	jafariasm@gmail.com	$2a$10$WLl3Ys1ZIlda9z6ylV/UAeXIXuqhEK1KsweTxxT3dORAr4oXNYbui	\N	\N	\N	0	\N	\N	\N	\N	2017-07-17 21:15:36.428026	2017-07-17 21:15:36.428026	65Uagw9AQXx6qejxjAoM	\N	2017-07-17 21:15:36.620215	\N	f	f	\N	\N	0	\N	\N	Kathy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-17 21:15:36.42745	f	0		\N	\N
64	dquiroz@andeshandbook.org	$2a$10$b4EcvLi6JibFwRIa9HMffu7BSyBjRdJFljyUw12J5eYbn2mTjRjnq	\N	\N	\N	0	\N	\N	\N	\N	2017-07-17 21:16:36.90457	2017-07-17 21:16:36.90457	_bAdZzvxnvxZHCxSX4xg	\N	2017-07-17 21:16:36.906463	\N	f	f	\N	\N	0	\N	\N	dquirozAHB	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-17 21:16:36.904282	f	0		\N	\N
68	d.aquiroz.o@gmail.com	$2a$10$DKgNpKiho.FgejEvrz2kwu2piNCGhPk9V0JSDhR4aSZfvJ4MA9Dhu	\N	\N	\N	0	\N	\N	\N	\N	2017-07-19 15:26:58.070079	2017-07-19 15:26:58.070079	kyMGzyyUzFqfR65dQZDb	\N	2017-07-19 15:26:58.262864	\N	f	f	\N	\N	0	\N	\N	daquiroz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 15:26:58.069759	f	0		\N	\N
75	alexander214@msn.com	$2a$10$grDBU3g47IsXwdykkKGQ3OWofAkQN9f/pwRACX9.Mtun9r3O5dHbW	\N	\N	\N	3	2017-07-19 21:24:21.710356	2017-07-19 21:23:52.82831	191.126.34.10	191.126.34.10	2017-07-19 21:11:13.877818	2017-07-19 21:24:21.711671	\N	2017-07-19 21:11:13.805017	\N	\N	f	f	\N	\N	0	\N	\N	Alexander Gallardo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	alexander214@msn.com	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:11:13.877565	f	0		\N	\N
74	\N	$2a$10$RNOvOuK0KQrCKGWFDosKheve9Hnpl7Bsw5155YMBcQAG0ETcaTO/u	\N	\N	\N	1	2017-07-19 21:01:25.724579	2017-07-19 21:01:25.724579	201.219.233.90	201.219.233.90	2017-07-19 21:01:25.710853	2017-07-19 21:01:51.177284	7ETvygRJvM9pd1fRwNEE	\N	2017-07-19 21:01:51.180119	ronnycnc2017@gmail.com	f	f	\N	\N	0	\N	\N	Ronny Wiliams	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:01:25.710565	f	0		\N	\N
66	al.venegas.diaz@gmail.com	$2a$10$6yosgx7FOFfM5He6buHaw.t7TmHNaGyOS9hYfKPyDMheE03NojPwC	a3584225f9852bae5a19736b01ae4870c1e6d18faae2b872efbf346c40778129	2017-07-19 12:46:48.703094	\N	1	2017-07-19 16:33:35.207609	2017-07-19 16:33:35.207609	190.98.205.98	190.98.205.98	2017-07-19 04:53:00.905002	2017-07-19 16:33:35.209111	tZwR_UVMVt59skLe2QGU	2017-07-19 16:33:24.051338	2017-07-19 04:53:01.087295	\N	f	f	\N	\N	0	\N	\N	Albertina	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 04:53:00.904615	f	0		\N	\N
69	narayacas@gmail.com	$2a$10$snM0S7zIlivYAjS.S6KwnuaJQPo3xmzTS42lFkqDKgaFvolyWzFkq	\N	\N	\N	4	2017-07-29 18:17:35.566829	2017-07-22 21:47:24.612218	191.126.54.134	191.125.4.185	2017-07-19 16:30:17.973935	2017-07-29 18:17:35.567931	\N	2017-07-19 16:30:17.898316	\N	\N	f	f	\N	\N	0	\N	\N	Nelson Araya Aguilera	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	narayacas@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-19 16:30:17.973556	f	0		\N	\N
67	dani@claybowls.cl	$2a$10$rWN2Uznh28zviDZOzK8hX.a7rDCgfOoaYZ5qSzbRSpXRnWiOOyLoS	\N	\N	\N	5	2017-07-20 21:40:29.40193	2017-07-19 16:29:49.188058	190.20.200.23	190.20.115.7	2017-07-19 14:41:38.559925	2017-07-20 21:40:29.403157	jwbEJS9XDqxyb45ZmES8	2017-07-19 16:19:55.21167	2017-07-19 14:41:38.562435	\N	f	f	\N	\N	0	\N	\N	daniAQO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 16:29:34.626034	f	0		\N	\N
70	fourseasonspg@gmail.com	$2a$10$g8aphavyj01axhxa1cNcTOs6A9DZxt66RifkMRa.GaEgDZDOxPZ/u	\N	\N	\N	1	2017-07-19 20:37:23.560486	2017-07-19 20:37:23.560486	186.9.135.210	186.9.135.210	2017-07-19 20:37:23.54165	2017-07-19 20:37:23.56169	\N	2017-07-19 20:37:23.454564	\N	\N	f	f	\N	\N	0	\N	\N	Ketty Shirley Pinto Aravena	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	fourseasonspg@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-19 20:37:23.541336	f	0		\N	\N
76	valentinalberto@outlook.es	$2a$10$yWsO7h/tKESjsthSSVh/QOIf9lEjkscECf.2KSuuBKlayv.YK/enu	\N	\N	\N	0	\N	\N	\N	\N	2017-07-19 21:12:10.27842	2017-07-20 02:38:57.031759	tyfNwxzz8CBzK5XLgDzJ	2017-07-20 02:38:57.030649	2017-07-19 21:12:10.28084	\N	f	f	\N	\N	0	\N	\N	valentin ramirez mendoza	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:12:10.278157	f	0		\N	\N
71	sofia.fuenteso@gmail.com	$2a$10$hX9Rh3p6aw/MH86nm/UK3u8giStPrfhCyhiuqKmhhQaieBBpLiVqW	\N	\N	\N	1	2017-07-19 20:44:24.895931	2017-07-19 20:44:24.895931	191.126.34.10	191.126.34.10	2017-07-19 20:42:17.062879	2017-07-19 20:44:24.897216	3smDwGug7jQxR6EEXGef	2017-07-19 20:44:01.86408	2017-07-19 20:42:17.25121	\N	f	f	\N	\N	0	\N	\N	Camila Olivares	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 20:42:17.062571	f	0		\N	\N
77	lnchavez@uc.cl	$2a$10$ZbxsipD0QwKZ6WBnrifZBOmf2kH3S/C88qD7yR3hRr9Ox0oAKwFUq	\N	\N	\N	1	2017-07-19 21:26:49.300372	2017-07-19 21:26:49.300372	191.126.34.10	191.126.34.10	2017-07-19 21:25:14.635613	2017-07-19 21:26:49.301808	TwsL6-QL7TAPGL2GhHMi	2017-07-19 21:26:26.66773	2017-07-19 21:25:14.637995	\N	f	f	\N	\N	0	\N	\N	lucas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:25:14.635289	f	0		\N	\N
79	llanoscamila045@gmail.com	$2a$10$SZF04Vb0b9QPrkSNznKEf.4bD45CZi/cg6xfFbwysqDesTzYvYPPu	\N	\N	\N	4	2017-08-08 20:35:47.234141	2017-07-20 18:01:22.041067	181.160.95.73	181.160.100.82	2017-07-19 21:34:02.487858	2017-08-08 20:35:47.235902	kDeAFS1Cyq8Eyb52GLLw	2017-07-19 21:35:15.370041	2017-07-19 21:34:02.490237	\N	f	f	\N	\N	0	\N	\N	camila y agustin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:34:02.487556	f	0		\N	\N
65	landerkraggen@hotmail.com	$2a$10$mG9cSGxeCTDwtQkdQ0UTzuixc5dinOoG9cH9AaowNDAu0eAFiE8Rq	\N	\N	\N	2	2017-07-29 18:15:32.664669	2017-07-19 00:35:52.412512	191.126.54.134	186.37.202.178	2017-07-19 00:35:52.394057	2017-07-29 18:15:32.665847	\N	2017-07-19 00:35:52.296741	\N	\N	f	f	\N	\N	0	\N	\N	Edgar Ar Guiler	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	landerkraggen@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-19 00:35:52.393746	f	0		\N	\N
78	magdalena214@gmail.com	$2a$10$Os/SCZH7tHnBMUtpm2DMjOXfYNSsdVsmNtxDXX1.S9OdioJ6WIQAm	\N	\N	\N	1	2017-07-19 21:41:21.757563	2017-07-19 21:41:21.757563	190.160.208.145	190.160.208.145	2017-07-19 21:31:56.436375	2017-07-19 21:41:21.758939	s16SP-QqE3U9TCusYhPH	2017-07-19 21:40:51.179849	2017-07-19 21:31:56.438305	\N	f	f	\N	\N	0	\N	\N	Magdalena Marinao	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:31:56.436083	f	0		\N	\N
82	palomasoto66@gmail.com	$2a$10$0zoz2LM9RcDFMhLNbpnkX.Cm09VecgQNNJN8mGIhluoAdAJTDSiim	\N	\N	\N	1	2017-07-19 21:45:03.308402	2017-07-19 21:45:03.308402	201.219.233.90	201.219.233.90	2017-07-19 21:43:09.21151	2017-07-19 21:45:03.310136	bNFL3rHcjfxsEDUoXx5R	2017-07-19 21:44:41.644898	2017-07-19 21:43:09.213598	\N	f	f	\N	\N	0	\N	\N	paloma1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:43:09.211179	f	0		\N	\N
83	c.alfonso.toro@gmail.com	$2a$10$v5rx7cyJzUOAW5S6UAtOc.PQzhFoxIPw9tyGvG5ogiuFfrbZxj/zW	\N	\N	2017-07-19 22:04:55.848219	1	2017-07-19 22:04:55.853434	2017-07-19 22:04:55.853434	181.160.196.197	181.160.196.197	2017-07-19 22:02:43.480998	2017-07-19 22:04:55.854564	q3-xQ8ZjvNyqC5_gqyTy	2017-07-19 22:03:59.35878	2017-07-19 22:02:43.483258	\N	f	f	\N	\N	0	\N	\N	claudio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 22:02:43.480709	f	0		\N	\N
80	yubika.alfaro@gmail.com	$2a$10$8wO2dIP0zbDpubFuDqSbx.VG6jG0ZrJBw7Wzei.cNlpc3uUtAYFC.	\N	\N	2017-07-21 17:19:23.295429	8	2017-07-28 06:12:02.042325	2017-07-26 05:45:21.527683	181.160.78.211	179.9.72.105	2017-07-19 21:39:50.867695	2017-07-28 06:12:02.043893	SgxVV7WUABHPL72yKRkk	2017-07-21 17:18:34.277407	2017-07-19 21:39:50.869731	\N	f	f	\N	\N	0	\N	\N	yubika alfaro	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:39:50.867389	f	0		\N	\N
73	maggita77@gmail.com	$2a$10$ZQnZvUwsEx9liL4bOfySLuwe3yGCjorp7H4SMoxZ9Pr/q5u3vgL1W	\N	\N	\N	2	2017-07-26 01:31:06.868469	2017-07-19 22:20:22.757667	181.160.37.228	181.160.47.20	2017-07-19 21:00:44.94986	2017-07-26 01:31:06.86995	D5UPD6eQxyp4ER6aVxZy	2017-07-19 21:02:35.130584	2017-07-19 21:00:44.952365	\N	f	f	\N	\N	0	\N	\N	Margarita 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:00:44.949577	f	0		\N	\N
81	\N	$2a$10$JWqRtU5mFcSYc9iCgu6z3O0pF2yO9F4oGemoPrN0XLuZJyddLr3bu	\N	\N	\N	7	2017-07-29 20:04:18.702737	2017-07-29 18:54:37.709755	191.126.132.215	191.125.181.205	2017-07-19 21:41:30.24591	2017-07-29 20:04:18.704204	nrsCocZghqbry1U7hFmi	\N	2017-07-21 15:42:15.617939	ayalen_antonia@hotmail.cl	f	f	\N	\N	0	\N	\N	Ayalen Manriquez Vasquez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	t	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-19 21:41:30.245607	f	0		\N	\N
85	flomoure@gmail.com	$2a$10$qzWS4aVbYgzhVwxFYxTCKOpM9gHNcXL7adGR18guZqgWixR5BEoAe	\N	\N	\N	1	2017-07-20 01:03:32.439116	2017-07-20 01:03:32.439116	186.9.128.8	186.9.128.8	2017-07-20 01:03:32.42363	2017-07-20 01:03:32.440202	\N	2017-07-20 01:03:32.347854	\N	\N	f	f	\N	\N	0	\N	\N	Florencia Moure	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	flomoure@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-20 01:03:32.423381	f	0		\N	\N
86	ayalen.antonia@gmail.com	$2a$10$MhkMAC59dIIIbMPultlnM.DhCtMH7tFhAePFy.pDHYi9BbXpRhjgK	\N	\N	\N	0	\N	\N	\N	\N	2017-07-20 01:22:08.008147	2017-07-20 01:22:08.008147	UFP4Mjx7NL64qxBDC4x7	\N	2017-07-20 01:22:08.010153	\N	f	f	\N	\N	0	\N	\N	ayalen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-20 01:22:08.007828	f	0		\N	\N
52	manuelbarrosr@gmail.com	$2a$10$6yqwyvPECNjHxLbHC.o47eMMzDWBAMp6/HOGng5d3AUfwtuCQKNBm	\N	\N	\N	11	2017-07-20 19:17:57.812558	2017-07-19 22:05:12.883729	200.83.137.32	186.9.128.149	2017-07-13 23:42:15.181047	2017-07-20 19:17:57.813605	\N	2017-07-13 23:42:15.088278	\N	\N	t	t	\N	\N	0	\N	\N	Manuel Barros Riveros	28987080	1	2017-07-14 16:17:50.497712	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	manuelbarrosr@gmail.com	1	\N	1	1960-08-09 00:00:00	t	t	t	f	2017-07-13 23:42:15.180743	f	0		\N	\N
88	sodom_88@hotmail.com	$2a$10$mgivzTASTk395djRjMDDqOU9h6w2nVRuNxh0CYaXqztw1ejQDJFHC	\N	\N	\N	1	2017-07-20 04:32:19.511259	2017-07-20 04:32:19.511259	190.160.184.61	190.160.184.61	2017-07-20 04:32:19.496629	2017-07-20 04:32:19.512495	\N	2017-07-20 04:32:19.422944	\N	\N	f	f	\N	\N	0	\N	\N	Anny SG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	sodom_88@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-20 04:32:19.496314	f	0		\N	\N
87	piponcito1@hotmail.com	$2a$10$AnIMJ5kuyQLVUraa9K6YeuJwdLOtcPm4dQu.ViyaJ9E0BHcKvS7SG	\N	\N	\N	3	2017-07-20 14:17:54.777928	2017-07-20 06:49:22.61834	201.215.53.241	201.215.53.241	2017-07-20 03:34:43.377743	2017-07-20 14:17:54.779034	\N	2017-07-20 03:34:43.302987	\N	\N	f	f	\N	\N	0	\N	\N	Felipe Jimenez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	piponcito1@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-20 03:34:43.377514	f	0		\N	\N
90	cj87687@gmail.com	$2a$10$KVqZswv7eV1kWY03cg1Gkuc/tSQzCZY8IpHgfy6ohMvxKK75euC2a	\N	\N	\N	1	2017-07-20 15:49:26.300584	2017-07-20 15:49:26.300584	201.215.53.241	201.215.53.241	2017-07-20 15:49:26.282205	2017-07-20 15:49:26.301831	\N	2017-07-20 15:49:26.19697	\N	\N	f	f	\N	\N	0	\N	\N	Camilo Jimenez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	cj87687@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-20 15:49:26.281879	f	0		\N	\N
98	ca.margozzini@gmail.com	$2a$10$CPs9QaCNON5QdRU1PIlHje2twwkmSS8.s29xt6X0iI9Ub9vjng4he	\N	\N	\N	1	2017-07-21 18:55:46.134223	2017-07-21 18:55:46.134223	190.20.200.23	190.20.200.23	2017-07-21 18:55:46.118279	2017-07-21 18:55:46.135673	\N	2017-07-21 18:55:46.041593	\N	\N	f	f	\N	\N	0	\N	\N	Catalina Margozzini	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	ca.margozzini@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-21 18:55:46.118003	f	0		\N	\N
89	josemanuelj02@yahoo.com	$2a$10$KBEWUX28X.Z9177xJSCXQOQfSyBdKuqmW/3Sp6bohsBZ7CFZ/MEAm	\N	\N	\N	1	2017-07-20 20:38:01.008392	2017-07-20 20:38:01.008392	190.20.36.95	190.20.36.95	2017-07-20 14:21:58.21277	2017-07-20 20:38:01.009538	yQ7J9zxLK2xbytGf78ns	2017-07-20 20:37:32.478536	2017-07-20 14:21:58.395499	\N	f	f	\N	\N	0	\N	\N	José Manuel Jiménez M	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-20 14:21:58.21239	f	0		\N	\N
93	rjimenez@live.cl	$2a$10$2fiGmAd0mlFPjuMhG/l8re2tXsuN/Vp0mMBA94Nhaw6VH8VmQMGiq	\N	\N	\N	1	2017-07-20 23:30:44.375914	2017-07-20 23:30:44.375914	201.220.243.244	201.220.243.244	2017-07-20 23:30:44.358835	2017-07-20 23:30:44.377189	\N	2017-07-20 23:30:44.283133	\N	\N	f	f	\N	\N	0	\N	\N	Rodrigo Jimenez Morales	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	rjimenez@live.cl	\N	\N	\N	\N	t	t	t	f	2017-07-20 23:30:44.358575	f	0		\N	\N
94	cote.sanhueza.cor94@gmail.com	$2a$10$Zq0RGwR7ulJW2nGvBN/tqO1ym1RLWTwhPr0DzRUvUusBpfH71y0UW	\N	\N	\N	1	2017-07-21 00:55:13.825734	2017-07-21 00:55:13.825734	190.44.112.22	190.44.112.22	2017-07-21 00:55:13.810511	2017-07-21 00:55:13.82695	\N	2017-07-21 00:55:13.735142	\N	\N	f	f	\N	\N	0	\N	\N	Maria Juana Cornejo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	cote.sanhueza.cor94@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-21 00:55:13.810166	f	0		\N	\N
92	\N	$2a$10$23Cxa8yfy58e21OugGqU7u3CNTN6QYGH9x3O047Ar5SI4HibykE1O	\N	\N	\N	2	2017-07-20 15:52:51.881856	2017-07-20 15:51:11.134576	201.215.53.241	201.215.53.241	2017-07-20 15:51:11.11902	2017-07-20 15:53:04.159835	tguTmS1qbwL--iVLrTw5	\N	2017-07-20 15:53:04.162254	vicentejimenez034@gmail.com	f	f	\N	\N	0	\N	\N	Vicente Jimenez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-20 15:51:11.1187	f	0		\N	\N
95	joselromero021@gmail.com	$2a$10$1ncPE4i57i4Yf9XSfFUHFeoNN17ODm1INPsjhMoqPrQ4jd8y4hTTq	\N	\N	\N	1	2017-07-21 01:19:37.529533	2017-07-21 01:19:37.529533	190.44.112.22	190.44.112.22	2017-07-21 01:19:37.508474	2017-07-21 01:19:37.530755	\N	2017-07-21 01:19:37.422337	\N	\N	f	f	\N	\N	0	\N	\N	Romero Marin Jose Luis	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	joselromero021@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-21 01:19:37.508206	f	0		\N	\N
96	aaron.jimenez.q@gmail.com	$2a$10$2QlJdLWXhkqRGgGRsoNuD.yKrCLHaV06srucAPuf4iVHoC4M9C00O	\N	\N	\N	1	2017-07-21 02:03:36.392684	2017-07-21 02:03:36.392684	190.45.79.183	190.45.79.183	2017-07-21 02:03:36.376168	2017-07-21 02:03:36.393929	\N	2017-07-21 02:03:36.301379	\N	\N	f	f	\N	\N	0	\N	\N	Aaron Jiménez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	aaron.jimenez.q@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-21 02:03:36.375859	f	0		\N	\N
97	rijocove@yahoo.es	$2a$10$8V7oj/sigg5VksK.hzQ9VeRi/bLP/AyDK4VqI.yo.X7o51uDl1tPq	\N	\N	\N	1	2017-07-21 16:31:19.731717	2017-07-21 16:31:19.731717	200.111.22.3	200.111.22.3	2017-07-21 16:29:51.242432	2017-07-21 16:31:19.733118	_rzLHY7xhhM9qqYBi8Um	2017-07-21 16:30:50.715066	2017-07-21 16:29:51.24508	\N	f	f	\N	\N	0	\N	\N	RICARDO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-21 16:29:51.242077	f	0		\N	\N
84	victoria-vela7@hotmail.com	$2a$10$i4SkakxMxIqCGYGcpg/qc.ZXCoG.LJBUiUUB6V9Fv0M2vEjJJx5Mq	\N	\N	\N	9	2017-07-29 20:20:27.389227	2017-07-29 20:19:42.457738	191.126.58.175	191.126.58.175	2017-07-19 22:09:05.092717	2017-07-29 20:20:27.390614	\N	2017-07-19 22:09:05.013351	\N	\N	f	f	\N	\N	0	\N	\N	Victoria Vela Leon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	victoria-vela7@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-19 22:09:05.092461	f	0		\N	\N
103	luisvidal.s@hotmail.com	$2a$10$p6BkuuzeTeRMWU/S/kYcQuX/xRSkYeNrKstr5oyIiwhuUoscuUEHi	\N	\N	\N	8	2017-08-19 01:21:11.620635	2017-08-13 01:43:42.0498	179.9.121.2	181.160.231.78	2017-07-22 20:09:17.473552	2017-08-19 01:21:11.622528	DydNo2VGCxayYzbXVdh9	2017-07-22 20:11:35.022264	2017-07-22 20:09:17.475824	\N	f	f	\N	\N	0	\N	\N	TitoVidal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 20:09:17.473236	f	0		\N	\N
100	\N	$2a$10$r.5mdfP97Yqv5BJQ4Tjb6u.j4HIZoyesIUXyi67zM.ftjWs.wog4a	\N	\N	\N	2	2017-07-21 19:56:48.163894	2017-07-21 19:55:03.761125	181.160.198.255	181.160.198.255	2017-07-21 19:55:03.744187	2017-07-21 19:58:10.006317	s4HNHWKuQ3-_M4ftccYW	\N	2017-07-21 19:58:10.009333	polita302006@gmail.com	f	f	\N	\N	0	\N	\N	Yubi-k Isabella Vargas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-21 19:55:03.743897	f	0		\N	\N
91	hguzman@crsoriente.cl	$2a$10$55rERJfqfrqW1d4l0lDQrODb11qHoKjU1Gsp0a.kZh5uYrKFaykye	\N	\N	\N	2	2017-07-20 15:51:54.93882	2017-07-20 15:51:10.057579	201.215.53.241	201.215.53.241	2017-07-20 15:51:10.040134	2017-07-24 17:58:07.450606	qrMJXx4D1xeKAMjcEXYv	2017-07-24 17:58:07.445086	2017-07-20 15:53:57.903087	\N	f	f	\N	\N	0	\N	\N	Hortensia Guzman Osses	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-20 15:51:10.039804	f	0		\N	\N
102	tahia_03@hotmail.com	$2a$10$1J1Y9qzI.k9qkj980jDA.egH/GFN41JTdbLhITZlJKf/E7r2kNCHK	\N	\N	\N	1	2017-07-22 19:53:13.246651	2017-07-22 19:53:13.246651	190.107.226.32	190.107.226.32	2017-07-22 19:50:27.335763	2017-07-22 19:53:13.248248	1PJi2csgesjofssDFaNo	2017-07-22 19:52:17.378422	2017-07-22 19:50:27.338006	\N	f	f	\N	\N	0	\N	\N	tahia salmeron	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 19:50:27.335432	f	0		\N	\N
99	sofi.fo@hotmail.com	$2a$10$tjXF8XHAW904PPNQy3vMIuBvpiGkDrV2F2E8u1mzBSddbOHEVETwm	\N	\N	\N	3	2017-07-29 18:44:59.903355	2017-07-25 14:02:15.891819	191.126.54.134	190.98.205.98	2017-07-21 19:12:32.622442	2017-07-29 18:44:59.904858	\N	2017-07-21 19:12:32.546564	\N	\N	f	f	\N	\N	0	\N	\N	Sofia Fuentes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	sofi.fo@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-21 19:12:32.622177	f	0		\N	\N
105	byron.flop@hotmail.com	$2a$10$HlZh/2bfOi4GoK0gp0WtIeG0Cn8jarJU3CvAt7pTGDRSLo57sgRuS	\N	\N	\N	1	2017-07-22 20:41:38.214241	2017-07-22 20:41:38.214241	201.241.186.205	201.241.186.205	2017-07-22 20:39:27.962667	2017-07-22 20:41:38.215658	GneVBXyizey74xznA-kT	2017-07-22 20:41:17.85071	2017-07-22 20:39:27.965357	\N	f	f	\N	\N	0	\N	\N	Nobistador	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 20:39:27.962277	f	0		\N	\N
106	connieh.5@hotmail.com	$2a$10$MkO8lH.vzz/VP.xkWBLCte87hCdTkhNG3lDyrueBk60MD66eLxyZ6	\N	\N	\N	1	2017-07-22 20:48:22.715627	2017-07-22 20:48:22.715627	191.125.30.150	191.125.30.150	2017-07-22 20:48:22.700696	2017-07-22 20:48:22.716653	\N	2017-07-22 20:48:22.625748	\N	\N	f	f	\N	\N	0	\N	\N	Mercedes de las Constanzas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	connieh.5@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-22 20:48:22.700404	f	0		\N	\N
107	fr.martin@alumnos.duoc.cl	$2a$10$0dX9Vb8xuWhNs65SWFj9JunwtQsVCUbIlRXMJ1yaazIu2Em5yoTNG	\N	\N	\N	1	2017-07-22 21:01:18.130483	2017-07-22 21:01:18.130483	191.125.30.150	191.125.30.150	2017-07-22 20:57:30.788844	2017-07-22 21:01:18.131775	H68thjM49j3GxU7iZBcC	2017-07-22 21:00:30.135896	2017-07-22 20:57:30.791152	\N	f	f	\N	\N	0	\N	\N	Francisco Martin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 20:57:30.788517	f	0		\N	\N
104	margaret.elgueta@gmail.com	$2a$10$d9falHP.9o.lOSGZhE8dsexxj4VM3jhXPd9pcRVnPQSc.O2R66FQe	\N	\N	\N	1	2017-07-22 20:19:28.40066	2017-07-22 20:19:28.40066	190.107.226.32	190.107.226.32	2017-07-22 20:14:43.070904	2017-07-22 20:19:28.402062	DasREz2Nu9t2y-xRDnj9	2017-07-22 20:18:01.605439	2017-07-22 20:14:43.073191	\N	f	f	\N	\N	0	\N	\N	margarita Egueta Quinteros	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 20:14:43.070603	f	0		\N	\N
108	lalo_tito33@hotmail.com	$2a$10$8Jgg5sqOjIUkf3UqN9zoXuXrNZlab1SuyHyVMGBFGLWYabr8.Ze.6	\N	\N	\N	1	2017-07-22 21:02:26.13404	2017-07-22 21:02:26.13404	191.126.133.73	191.126.133.73	2017-07-22 21:02:26.11903	2017-07-22 21:02:26.135647	\N	2017-07-22 21:02:26.043637	\N	\N	f	f	\N	\N	0	\N	\N	Osvaldo Hector Carvajal Jones	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	lalo_tito33@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-22 21:02:26.118745	f	0		\N	\N
109	nelygatica@hotmail.com	$2a$10$HQMeemHnHeIaVgxSdfshkeUCEzyKaSpUVaiPW9vIyaS5cLP9bTJQO	\N	\N	\N	2	2017-07-22 22:05:37.351856	2017-07-22 21:34:47.656289	181.160.186.11	191.125.4.185	2017-07-22 21:24:23.045263	2017-07-22 22:05:37.353426	ZiE6MFHq3NUjBrVcjqqR	2017-07-22 21:31:22.552329	2017-07-22 21:24:23.047396	\N	f	f	\N	\N	0	\N	\N	Nelygatica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 21:34:47.646334	f	0		\N	\N
111	thu-makita.cool.18@gmail.com	$2a$10$2TBG9j7L2PGAFBZ78mYlyeLuNnrE9pYmT3ddK2xf361IP.Rhfd6ky	\N	\N	\N	0	\N	\N	\N	\N	2017-07-22 22:08:38.758747	2017-07-22 22:08:38.758747	K6_xSgPZ9LgVHtk6fVvv	\N	2017-07-22 22:08:38.760752	\N	f	f	\N	\N	0	\N	\N	abigail 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 22:08:38.758415	f	0		\N	\N
117	xunxito_lucho@hotmail.com	$2a$10$obL/OyECMWYrch6My18AQ.RJrPblphjhD0f0M1UvVAjZ5DOODNska	\N	\N	\N	1	2017-07-23 19:18:08.174112	2017-07-23 19:18:08.174112	200.104.149.132	200.104.149.132	2017-07-23 18:28:19.128706	2017-07-23 19:18:08.175306	YL-vhpThSueEx1rArDJD	2017-07-23 19:17:41.673383	2017-07-23 18:28:19.313114	\N	f	f	\N	\N	0	\N	\N	Luis Pardo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-23 18:28:19.128412	f	0		\N	\N
112	josalru@hotmail.com	$2a$10$tD0A3/ZaDwQJoQfRvY0KjuOv6Y7QSWXh0bKVbSWUsj.SMbh0a4/Oi	\N	\N	\N	1	2017-07-22 22:26:49.060652	2017-07-22 22:26:49.060652	191.125.4.185	191.125.4.185	2017-07-22 22:24:31.65306	2017-07-22 22:26:49.062076	wkAbGZ3C8o2jyBGcmLmT	2017-07-22 22:26:19.096318	2017-07-22 22:24:31.655341	\N	f	f	\N	\N	0	\N	\N	Jorge Salgado Ruiz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 22:24:31.652732	f	0		\N	\N
113	hanreye@gmail.com	$2a$10$tta/NzrG3VBmTI8nBVUIC.MxBohKHKdOYYEYVyJYwH2iwlfDrVc86	\N	\N	\N	1	2017-07-22 22:38:32.854905	2017-07-22 22:38:32.854905	191.126.17.246	191.126.17.246	2017-07-22 22:36:20.619835	2017-07-22 22:38:32.856235	dbxn5XWwmrfJszZDbGbj	2017-07-22 22:38:19.773158	2017-07-22 22:36:20.622327	\N	f	f	\N	\N	0	\N	\N	Hreyes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 22:36:20.619288	f	0		\N	\N
110	rosamaria0101@hotmail.com	$2a$10$Suht4QpjG601HlZLMB0CauUoMErqH.W47YOY4EqH0zNtVWu4rx28O	\N	\N	\N	1	2017-07-22 21:48:57.770482	2017-07-22 21:48:57.770482	191.125.4.185	191.125.4.185	2017-07-22 21:48:57.756437	2017-07-22 21:48:57.771687	\N	2017-07-22 21:48:57.681872	\N	\N	f	f	\N	\N	0	\N	\N	Rosa Maria Maturana Diaz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	rosamaria0101@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-22 21:48:57.756159	f	0		\N	\N
101	carlospradenasseguel@gmail.com	$2a$10$TFgWfS.44yci7.Qlx6ARs.KCOLp7sp.AYRxUWEC6RnZ5bVYvbMt4W	\N	\N	\N	2	2017-07-23 17:42:09.698337	2017-07-22 19:46:03.332105	181.160.118.219	191.126.177.32	2017-07-22 19:42:59.134723	2017-07-23 17:42:09.699391	c3siRJYWc9p3niBuDBjW	2017-07-22 19:45:39.360499	2017-07-22 19:42:59.318897	\N	f	f	\N	\N	0	\N	\N	carlospradenas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-23 17:42:09.687645	f	0		\N	\N
115	enrique_gonzalez.p@live.com	$2a$10$asERjACfWhkYykWN/kasy.FiccREj2SE3LkZ800Q1Nag21loezl1y	\N	\N	\N	1	2017-07-22 22:56:53.830482	2017-07-22 22:56:53.830482	191.125.4.185	191.125.4.185	2017-07-22 22:52:12.739864	2017-07-22 22:56:53.831969	KWxo_sgQnYsxyL5Tpebp	2017-07-22 22:55:24.446262	2017-07-22 22:52:12.742136	\N	f	f	\N	\N	0	\N	\N	enriquegonzalez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-22 22:52:12.739518	f	0		\N	\N
119	rcb1577@yahoo.es	$2a$10$JoMed0c9KCJYCFiMBSi7J.Rr4r61y23MWhOcea.cJXRDmyfV19PFi	\N	\N	\N	2	2017-08-22 19:50:45.759126	2017-07-23 19:59:06.523089	190.100.9.192	190.100.9.192	2017-07-23 19:59:06.508673	2017-08-22 19:50:45.760593	\N	2017-07-23 19:59:06.434864	\N	\N	f	f	\N	\N	0	\N	\N	Rigoberto Carrasco B.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	rcb1577@yahoo.es	\N	\N	\N	\N	t	t	t	f	2017-07-23 19:59:06.508404	f	0		\N	\N
123	mavulep@gmail.com	$2a$10$b..cSa2RHb/RJ58RYb5teOKJyCC8bY9mTX.Uer2D0eLRiUd8RDrS.	\N	\N	\N	4	2017-07-24 21:41:17.427784	2017-07-24 21:37:14.611985	191.126.45.63	191.126.45.63	2017-07-24 21:15:21.500798	2017-07-24 21:41:17.42938	\N	2017-07-24 21:15:21.425811	\N	\N	f	f	\N	\N	0	\N	\N	Andrea Vera Urzua	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	mavulep@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-24 21:15:21.50052	f	0		\N	\N
120	\N	$2a$10$PcwKyB6a26LkzJ5DA00EI.4v7sNkBY9O8dS8dOM8mhgIfPzR8cZce	\N	\N	\N	1	2017-07-24 00:18:08.781902	2017-07-24 00:18:08.781902	186.9.128.165	186.9.128.165	2017-07-24 00:18:08.764519	2017-07-24 00:19:59.379361	Wcz2SJ8bMgyYG43Cs9Kx	\N	2017-07-24 00:19:59.382071	ingridpao1971@gmail.com	f	f	\N	\N	0	\N	\N	Ingrid Paola Jimenez Morales	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-24 00:18:08.764251	f	0		\N	\N
116	w.reyescid@gmail.com	$2a$10$sxAU9glrLnzwlTyP.FFDWeRCW12CiMVP1OJYJlhvQvEl5Y38JmkGy	\N	\N	\N	1	2017-07-23 15:57:43.3707	2017-07-23 15:57:43.3707	181.160.8.69	181.160.8.69	2017-07-23 15:57:43.35534	2017-07-23 15:57:43.371861	\N	2017-07-23 15:57:43.281337	\N	\N	f	f	\N	\N	0	\N	\N	Walter Reyes Cid	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	1	f	es	w.reyescid@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-23 15:57:43.354971	f	0		\N	\N
114	oscar.llanos@inchcape.cl	$2a$10$zwPuUIBQ42/is.bpXQDey.AyF3s3zMN1ftmazZnjK1jI81zgyNi46	\N	\N	\N	1	2017-07-24 12:15:04.277066	2017-07-24 12:15:04.277066	201.238.232.29	201.238.232.29	2017-07-22 22:37:49.342216	2017-07-24 12:15:04.278507	mtDKLws8LiA2g1_kz2Zm	2017-07-24 12:11:05.064396	2017-07-22 22:37:49.344203	\N	f	f	\N	\N	0	\N	\N	oscar llanos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-24 12:15:04.264372	f	0		\N	\N
118	sally.pf.04@gmail.com	$2a$10$O8.Eg4G2qvmeF9mI0KRIJOZblQE6oytPVMyYD6GWzivE9igb4p17.	\N	\N	\N	0	\N	\N	\N	\N	2017-07-23 18:33:21.28104	2017-07-24 16:16:04.799865	7gEyPUnRnmcNPxmN59eC	2017-07-24 16:16:04.798863	2017-07-23 18:33:21.283259	\N	f	f	\N	\N	0	\N	\N	Salome Pardo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-23 18:33:21.280734	f	0		\N	\N
121	leyrexu@hotmail.com	$2a$10$L0/AVtmSmxLUZzcNfJNIFes15011aO5nu3AP1Jg8FhSJs/Q35YpZ.	\N	\N	\N	1	2017-07-24 17:08:40.045984	2017-07-24 17:08:40.045984	191.114.101.52	191.114.101.52	2017-07-24 17:08:40.026201	2017-07-24 17:08:40.047185	\N	2017-07-24 17:08:39.947894	\N	\N	f	f	\N	\N	0	\N	\N	Leyre Txu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	leyrexu@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-24 17:08:40.025912	f	0		\N	\N
122	jpavez4@gmail.com	$2a$10$MwsLhmIROj7yI0NHQwTMwudq.TsvwxJHqp0Sr3KUNgQKXhKtSaAji	\N	\N	2017-07-24 18:10:41.039598	1	2017-07-24 18:10:41.045146	2017-07-24 18:10:41.045146	200.83.189.146	200.83.189.146	2017-07-24 18:09:45.950523	2017-07-24 18:10:41.046303	FfaETwccHBn_D6_xY8aB	2017-07-24 18:10:31.620511	2017-07-24 18:09:46.130629	\N	f	f	\N	\N	0	\N	\N	JavieraP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-24 18:09:45.950219	f	0		\N	\N
125	davidzsanhueza@gmail.com	$2a$10$LOOYPBowo1H5Ok2cTVTZn.oP48KMy7kSIEdEc/NP.ZSx5jZJeFISW	\N	\N	\N	3	2017-10-26 21:12:19.709094	2017-10-26 19:18:55.214219	190.164.160.209	190.164.160.209	2017-07-24 21:49:33.917283	2017-10-26 21:12:19.710707	\N	2017-07-24 21:49:33.843281	\N	\N	f	f	\N	\N	0	\N	\N	David Zavala	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	davidzsanhueza@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-24 21:49:33.91705	f	0		\N	\N
127	aliciayluis@hotmail.cl	$2a$10$IvERra4DFapTXEkI8ouxNe/X/m4x5G9PYYULjCwo/BofQ0lY6hXs.	\N	\N	\N	1	2017-07-24 22:11:39.193075	2017-07-24 22:11:39.193075	191.125.177.131	191.125.177.131	2017-07-24 22:11:39.170958	2017-07-24 22:11:39.19446	\N	2017-07-24 22:11:39.095233	\N	\N	f	f	\N	\N	0	\N	\N	Alicia Jeria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	aliciayluis@hotmail.cl	\N	\N	\N	\N	t	t	t	f	2017-07-24 22:11:39.170652	f	0		\N	\N
126	\N	$2a$10$VTJAtu1uOO8dZhBINc6FqeIkwVOAbsdcP4RTOf8ULh9g0BrLTDVyC	\N	\N	\N	1	2017-07-24 21:52:45.963371	2017-07-24 21:52:45.963371	191.125.177.131	191.125.177.131	2017-07-24 21:52:45.937381	2017-07-24 21:52:45.965412	\N	\N	\N	\N	f	f	\N	\N	0	\N	\N	Margarita Bustos P	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	t	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-24 21:52:45.937049	f	0		\N	\N
128	sinenfoquephotography@gmail.com	$2a$10$pqt3PR4yNCkhQb70Niypgu/3cJcTUEqazKcKdKpMPz1MRH9TElI9O	\N	\N	\N	1	2017-07-24 23:20:53.695374	2017-07-24 23:20:53.695374	181.73.57.14	181.73.57.14	2017-07-24 23:20:01.058063	2017-07-24 23:20:53.697056	eUsExnT_d1xhxg_oMP1s	2017-07-24 23:20:46.303277	2017-07-24 23:20:01.060462	\N	f	f	\N	\N	0	\N	\N	poesianocturna	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-24 23:20:01.057761	f	0		\N	\N
129	elisadelourdes@hotmail.com	$2a$10$bj38sfSD0ydc11xIPqld9uabsqexY2NpZSw.9ZBpE3WjCHWckgPnu	\N	\N	\N	1	2017-07-25 19:13:22.285115	2017-07-25 19:13:22.285115	190.47.131.119	190.47.131.119	2017-07-25 19:10:50.161416	2017-07-25 19:13:22.286212	xCy63mrcHMyDzVCn5pxh	2017-07-25 19:12:46.292862	2017-07-25 19:10:50.165496	\N	f	f	\N	\N	0	\N	\N	Elisa velasquez norambuena	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-25 19:10:50.16096	f	0		\N	\N
130	elisangela.arancibia@gmail.com	$2a$10$CsJtucEJlWN6.M7ryMnwDe5BRI.U7qSVrW/ciAyJ8CsmBQMOWjEP.	\N	\N	\N	1	2017-07-25 19:17:01.013821	2017-07-25 19:17:01.013821	190.47.131.119	190.47.131.119	2017-07-25 19:17:00.993349	2017-07-25 19:17:01.015304	\N	2017-07-25 19:17:00.917207	\N	\N	f	f	\N	\N	0	\N	\N	Elisangela Arancibia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	elisangela.arancibia@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-25 19:17:00.993019	f	0		\N	\N
131	paulina_piolin_10@hotmail.com	$2a$10$m.LdoIlzCptdyoZcIiDIzeU5Q/QXVxE9LHxgKCJoIj9dhpUBLwIeK	\N	\N	\N	1	2017-07-26 16:02:14.069743	2017-07-26 16:02:14.069743	190.98.205.98	190.98.205.98	2017-07-26 16:02:14.051475	2017-07-26 16:02:14.071117	\N	2017-07-26 16:02:13.977087	\N	\N	f	f	\N	\N	0	\N	\N	Paulina Rodríguez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	paulina_piolin_10@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 16:02:14.051194	f	0		\N	\N
124	carmenelbita@hotmail.com	$2a$10$SswOlpj6E8Ja1AQHmf7mtegqWj76W66BDKBXIL4ua0R/LVrU4QO6S	\N	\N	\N	3	2017-07-26 20:58:48.427703	2017-07-24 21:43:14.150696	191.126.161.191	191.126.45.63	2017-07-24 21:40:05.420999	2017-07-26 20:58:48.429701	\N	2017-07-24 21:40:05.343605	\N	\N	f	f	\N	\N	0	\N	\N	Carmen Sánchez Acosta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	carmenelbita@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-24 21:40:05.420738	f	0		\N	\N
132	mpmarcaspremium@gmail.com	$2a$10$UjcpOnuWmPspuCQYDAO94ukjN0lyocpfp6I67VST8lHLioAX2xys2	\N	\N	\N	1	2017-07-26 16:05:09.028176	2017-07-26 16:05:09.028176	190.98.205.98	190.98.205.98	2017-07-26 16:05:09.008313	2017-07-26 16:05:09.029746	\N	2017-07-26 16:05:08.93237	\N	\N	f	f	\N	\N	0	\N	\N	MP MarcasPremium	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	mpmarcaspremium@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 16:05:09.008013	f	0		\N	\N
134	mireya.valdes.aguilera@gmail.com	$2a$10$YqS8YAx5a2DXonl9rwRd/.GqbF.QwFqDBNlzV84GMIKlXK7Yrkh/i	\N	\N	\N	1	2017-07-26 16:10:21.77063	2017-07-26 16:10:21.77063	190.98.205.98	190.98.205.98	2017-07-26 16:10:21.752932	2017-07-26 16:10:21.771802	\N	2017-07-26 16:10:21.675734	\N	\N	f	f	\N	\N	0	\N	\N	Mireya Valdés Aguilera	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	mireya.valdes.aguilera@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 16:10:21.752658	f	0		\N	\N
133	mbonnassiolle@hotmail.com	$2a$10$wQ7wMcVKHTKG/QhmJ/oxROqHU55Q3WCzgJuYTlRPn4Rl3smJ4OEmO	\N	\N	\N	1	2017-07-26 16:08:07.236547	2017-07-26 16:08:07.236547	190.98.205.98	190.98.205.98	2017-07-26 16:08:07.210087	2017-07-26 16:11:19.502587	\N	2017-07-26 16:08:07.129494	\N	\N	f	f	\N	\N	0	\N	\N	Mathias Bonnassiolle Morel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	f	0	f	es	mbonnassiolle@hotmail.com	\N	\N	\N	\N	t	f	f	f	2017-07-26 16:08:07.209777	f	0		\N	\N
135	ivan.salazar@mayor.cl	$2a$10$vSrUqdyxrTlMSHrdX48IWOaJ.IQgeFgN6iUVxybD4s4vO8rAS52KC	\N	\N	\N	1	2017-07-26 16:41:15.740638	2017-07-26 16:41:15.740638	190.160.247.47	190.160.247.47	2017-07-26 16:41:15.720151	2017-07-26 16:41:15.742086	\N	2017-07-26 16:41:15.625774	\N	\N	f	f	\N	\N	0	\N	\N	Iván Salazar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	ivan.salazar@mayor.cl	\N	\N	\N	\N	t	t	t	f	2017-07-26 16:41:15.719807	f	0		\N	\N
136	jenniffer.c.d@gmail.com	$2a$10$Nlea8ImuTNK2LDhBEkHt3OEYe.oxJy86Ht0cetPjpVGnZCEd.N9zi	\N	\N	\N	1	2017-07-26 21:03:57.574575	2017-07-26 21:03:57.574575	191.116.109.222	191.116.109.222	2017-07-26 21:02:56.536852	2017-07-26 21:03:57.576036	9UVpWpcb1dUTzoc-swxu	2017-07-26 21:03:34.165834	2017-07-26 21:02:56.792403	\N	f	f	\N	\N	0	\N	\N	Marcia Olivares	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:02:56.536222	f	0		\N	\N
137	mcjo.oyarzun@gmail.com	$2a$10$ARevby45ZLg8MlwpcELl0OdwbQV7mq1ZaBWG8bHgHewlXGawMSdE.	\N	\N	\N	1	2017-07-26 21:04:38.124812	2017-07-26 21:04:38.124812	191.125.133.117	191.125.133.117	2017-07-26 21:04:38.109595	2017-07-26 21:04:38.126114	\N	2017-07-26 21:04:38.035672	\N	\N	f	f	\N	\N	0	\N	\N	Cecilia Jimenez Oyarzun	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	mcjo.oyarzun@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:04:38.10932	f	0		\N	\N
138	psalvatierra.g@gmail.com	$2a$10$ZhakFbLrB/dWuRBQnN1yJO4zW7qaf8xAO2ujWNW2z7LLdbwohuorq	\N	\N	\N	0	\N	\N	\N	\N	2017-07-26 21:08:52.05349	2017-07-26 21:08:52.05349	UfyREJDnsxq6uBthMMWT	\N	2017-07-26 21:08:52.05757	\N	f	f	\N	\N	0	\N	\N	patricio 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:08:52.053135	f	0		\N	\N
140	s.brown@live.cl	$2a$10$WCrbUm/xHi8QJgNdC/qXJOspOadG0kIUX8U1ZY/iChn9K4tCSif0y	\N	\N	\N	0	\N	\N	\N	\N	2017-07-26 21:19:30.665222	2017-07-26 21:19:30.665222	kieay2Jvi55zjJb113gY	\N	2017-07-26 21:19:30.668327	\N	f	f	\N	\N	0	\N	\N	Ivon Perez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:19:30.664875	f	0		\N	\N
144	carmenjungjohann@gmail.com	$2a$10$NG2Dc/z6gAuA.tjDD66zxuZGPVmtE5qfRHAjODDVZfETc44xPwmCq	\N	\N	\N	2	2017-07-26 21:56:07.403019	2017-07-26 21:55:53.559256	191.125.133.117	186.9.135.99	2017-07-26 21:52:58.385845	2017-07-26 21:56:07.404346	5fysc5DRhtS1cYMkGhfm	2017-07-26 21:54:56.643162	2017-07-26 21:52:58.388285	\N	f	f	\N	\N	0	\N	\N	carmen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:52:58.385413	f	0		\N	\N
148	usuariopenalolen51@gmail.com	$2a$10$H7/wtKicEoIyoYjJj0CyH.uMFLbyp8YvDU5Vv4NQOGMc1J6V0AOrm	\N	\N	\N	1	2017-07-26 22:19:48.134158	2017-07-26 22:19:48.134158	191.125.133.117	191.125.133.117	2017-07-26 22:18:53.841345	2017-07-26 22:19:48.136031	8a6pQfr4Jz7xwsLS3xxz	2017-07-26 22:19:31.808713	2017-07-26 22:18:53.844401	\N	f	f	\N	\N	0	\N	\N	Nelson Berrios	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:18:53.840884	f	0		\N	\N
139	karol6035@hotmail.com	$2a$10$puoIPmcq6bjLyRtuGMvgp.dfef1H1glpfuNOsnnaykngZcC8JPyt6	\N	\N	2017-07-26 21:20:07.80368	5	2017-07-27 00:34:05.864089	2017-07-26 23:24:00.85272	190.160.120.207	190.160.120.207	2017-07-26 21:18:09.976516	2017-07-27 00:34:05.86575	sAjhr2z1rLBoz6-vDLje	2017-07-26 21:19:36.433544	2017-07-26 21:18:09.979915	\N	f	f	\N	\N	0	\N	\N	karol6035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:18:09.976067	f	0		\N	\N
141	usuariopenalolen22@gmail.com	$2a$10$cUsnrGeRL5UvlUsc3utWBuAybZWKfuXFM5mfsy.eQ/kt0Ns6u2SJK	\N	\N	\N	1	2017-07-26 22:00:14.007135	2017-07-26 22:00:14.007135	191.126.53.30	191.126.53.30	2017-07-26 21:27:00.574263	2017-07-26 22:00:14.008981	wy4Vqzfuz3CZ3E_Dx6sy	2017-07-26 21:59:39.904874	2017-07-26 21:27:00.578417	\N	f	f	\N	\N	0	\N	\N	vecino	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:27:00.573784	f	0		\N	\N
142	pavez_jessi@hotmail.com	$2a$10$Oc2FNISxRJuRxX/8t/5CAuhe7hEnz9GNBUxSg38o4Un9GNbVadgXW	\N	\N	\N	1	2017-07-26 21:36:23.413254	2017-07-26 21:36:23.413254	191.126.53.30	191.126.53.30	2017-07-26 21:33:45.216532	2017-07-26 21:36:23.414703	sismLdxD76hjzywbfeWs	2017-07-26 21:35:55.226	2017-07-26 21:33:45.219481	\N	f	f	\N	\N	0	\N	\N	Jessica Pavez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:33:45.21618	f	0		\N	\N
143	teregalsan@yahoo.cl	$2a$10$kKtM6ALFpZyKcLFw51hs9.MZKSjy1NC3bwBKh2sFBaYaizTbQnvxy	\N	\N	\N	1	2017-07-26 21:42:40.164933	2017-07-26 21:42:40.164933	191.125.133.117	191.125.133.117	2017-07-26 21:42:40.144623	2017-07-26 21:42:40.166458	\N	2017-07-26 21:42:40.069128	\N	\N	f	f	\N	\N	0	\N	\N	Teresa Galvez Santander	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	teregalsan@yahoo.cl	\N	\N	\N	\N	t	t	t	f	2017-07-26 21:42:40.144347	f	0		\N	\N
153	bernardo.solis.a@hotmail.com	$2a$10$J4tMYxpsbaT.OsNxTxszXePLK57ojl0zhvlt5uiiyBsSV/MtwfvUy	\N	\N	\N	1	2017-07-26 22:57:23.300904	2017-07-26 22:57:23.300904	191.125.133.117	191.125.133.117	2017-07-26 22:57:23.277392	2017-07-26 22:57:23.302968	\N	2017-07-26 22:57:23.200185	\N	\N	f	f	\N	\N	0	\N	\N	Bernardo Solis	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	bernardo.solis.a@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:57:23.277007	f	0		\N	\N
145	usuariopenalolen50@gmail.com	$2a$10$3wPbyjps5TA2hyW9XPsytuXyQQcIK0F31v5rEHOk/J8F/Z5PjR6rW	\N	\N	\N	1	2017-07-26 22:04:00.754284	2017-07-26 22:04:00.754284	191.125.133.117	191.125.133.117	2017-07-26 22:02:22.957909	2017-07-26 22:04:00.755991	GCrzMCWUwfUMqVnHrueh	2017-07-26 22:03:33.713669	2017-07-26 22:02:22.961204	\N	f	f	\N	\N	0	\N	\N	maria venegas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:02:22.957424	f	0		\N	\N
146	nellyaraya7@gmail.com	$2a$10$FWbe6FGowrjaGYoaC85MD.yZTyAAV8Eo4sopxIpEiB1HBzkCEXhPS	\N	\N	\N	1	2017-07-26 22:08:12.490193	2017-07-26 22:08:12.490193	191.125.133.117	191.125.133.117	2017-07-26 22:06:30.470324	2017-07-26 22:08:12.491697	qsx_h6-s9sRPG2aoeVYW	2017-07-26 22:07:51.882746	2017-07-26 22:06:30.472549	\N	f	f	\N	\N	0	\N	\N	Nelly Araya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:06:30.470014	f	0		\N	\N
147	vsepulveda31@hotmail.com	$2a$10$dHbxh6mAOAcsknXnrcPVXu3Uz.GaG6p4uX4BVPWfqOHcvcKmSuG12	\N	\N	\N	1	2017-07-26 22:11:05.817655	2017-07-26 22:11:05.817655	191.126.53.30	191.126.53.30	2017-07-26 22:11:05.795132	2017-07-26 22:11:05.819313	\N	2017-07-26 22:11:05.718451	\N	\N	f	f	\N	\N	0	\N	\N	Verónica Sepúlveda Salas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	vsepulveda31@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:11:05.794771	f	0		\N	\N
151	usuariopenalolen52@gmail.com	$2a$10$AWWAKR/EzkOea8l46o6Wqemt4RTKNfAHrIIxd7.L2RkTesTwvxEuW	\N	\N	\N	1	2017-07-26 22:43:42.899332	2017-07-26 22:43:42.899332	191.125.133.117	191.125.133.117	2017-07-26 22:42:29.664894	2017-07-26 22:43:42.900762	cVHNANNn9yhnWQGW1wKT	2017-07-26 22:43:25.043675	2017-07-26 22:42:29.666969	\N	f	f	\N	\N	0	\N	\N	Rebeca Acevedo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:42:29.664593	f	0		\N	\N
152	amoralesgatica@gmail.com	$2a$10$pYybeud79Qp1fV03Kb53V.pyFuCfZOiTVDk4NG16IwoiqdF2zLWE6	\N	\N	\N	1	2017-07-26 22:53:03.271614	2017-07-26 22:53:03.271614	191.125.133.117	191.125.133.117	2017-07-26 22:53:03.249548	2017-07-26 22:53:03.273248	\N	2017-07-26 22:53:03.174888	\N	\N	f	f	\N	\N	0	\N	\N	Alejandra Morales Gatica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	amoralesgatica@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:53:03.249228	f	0		\N	\N
150	cristopher.cid@gmail.com	$2a$10$Nx/1VbCqrxLWw0YrRd5F7urW6tYhByqF1qAr1K6.B1YZHT0aHSk86	\N	\N	\N	3	2017-07-26 22:49:09.318341	2017-07-26 22:48:38.454658	191.125.133.117	191.125.133.117	2017-07-26 22:36:45.553286	2017-07-26 22:49:09.320245	\N	2017-07-26 22:36:45.476128	\N	\N	f	f	\N	\N	0	\N	\N	Cristopher Cid Maldonado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	cristopher.cid@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:36:45.552995	f	0		\N	\N
154	felipemunozgutierrez@gmail.com	$2a$10$UY0erA0zpXFcAw/U7j6LfO1nso32rXd6OcH.vpaMoU0hbbj4fP3qm	\N	\N	2017-07-26 23:00:01.873772	1	2017-07-26 23:00:01.882442	2017-07-26 23:00:01.882442	200.89.69.32	200.89.69.32	2017-07-26 22:59:00.226626	2017-07-26 23:00:01.883986	xPj3r7zk6Eq3rvSNwDvu	2017-07-26 22:59:34.505044	2017-07-26 22:59:00.228928	\N	f	f	\N	\N	0	\N	\N	Felipe Muñoz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:59:00.226277	f	0		\N	\N
155	agustin.orozco@sansano.usm.cl	$2a$10$bK0u5p3C4AdNY/pMnUYz9.uajAP4UvLVsO.53.MCTkT7.XFyOZ89C	\N	\N	\N	0	\N	\N	\N	\N	2017-07-27 03:01:53.921234	2017-07-27 03:01:53.921234	2yx7Aa6Y9t84urofBzQC	\N	2017-07-27 03:01:53.923691	\N	f	f	\N	\N	0	\N	\N	Agusrufus	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-27 03:01:53.920912	f	0		\N	\N
156	javiera101@hotmail.com	$2a$10$XioWBdf3.i.AUeqpkVUp6Oeb/C9OUji1j5Hor8BfXcIR7tU1AKtIa	\N	\N	\N	0	\N	\N	\N	\N	2017-07-27 17:05:33.398324	2017-07-27 17:05:33.398324	FXqhwp_Z7ujhTynZZwzU	\N	2017-07-27 17:05:33.400669	\N	f	f	\N	\N	0	\N	\N	Sandra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-27 17:05:33.39796	f	0		\N	\N
149	jtaller54@gmail.com	$2a$10$FxE4aPoEzk6t0lAft2gbH.O3HgewklpeFDgveZVj3Xb5Bpw4Sgtfm	\N	\N	\N	2	2017-07-27 17:05:57.89808	2017-07-26 22:27:18.433068	190.161.14.138	191.125.133.117	2017-07-26 22:25:38.12546	2017-07-27 17:05:57.899395	9uoAXJGytPj-udgpyk7X	2017-07-26 22:26:40.065708	2017-07-26 22:25:38.127582	\N	f	f	\N	\N	0	\N	\N	Jaqueline Campos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-26 22:25:38.125158	f	0		\N	\N
157	sandracarcamo345@gmail.com	$2a$10$FFswuAHOr6HlXwjfJk66H.hpIfj83igJ7h5X7NmemrWyschdB46PC	\N	\N	\N	1	2017-07-27 17:25:11.900834	2017-07-27 17:25:11.900834	200.83.189.146	200.83.189.146	2017-07-27 17:24:05.817472	2017-07-27 17:25:11.903033	xi_o1Umqy3eTcfQrchLa	2017-07-27 17:25:06.384136	2017-07-27 17:24:05.819803	\N	f	f	\N	\N	0	\N	\N	Sandra cárcamo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-27 17:24:05.817135	f	0		\N	\N
172	nagano.diego@gmail.com	$2a$10$NXYBrIO9x.TrLRbCOOs/1eth6tQy7c58nZm.7Z7vdzG6pCXRHtWsW	\N	\N	\N	1	2017-07-29 18:46:23.706368	2017-07-29 18:46:23.706368	191.125.156.14	191.125.156.14	2017-07-29 18:46:23.691616	2017-07-29 18:46:23.707641	\N	2017-07-29 18:46:23.617132	\N	\N	f	f	\N	\N	0	\N	\N	Diego Nagano	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	nagano.diego@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:46:23.691263	f	0		\N	\N
159	fdagonzalez@gmail.com	$2a$10$Bu6o6mLpk/NFjNqEzSbTZe/5.q8AhG6rTy08AaTARXVqLPZbq0eAy	\N	\N	\N	1	2017-07-29 12:52:04.860842	2017-07-29 12:52:04.860842	191.116.33.173	191.116.33.173	2017-07-29 12:48:10.839183	2017-07-29 12:52:04.862183	6CbKS1nmVyek5KzCbsjk	2017-07-29 12:50:21.711401	2017-07-29 12:48:10.841598	\N	f	f	\N	\N	0	\N	\N	Feer	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 12:48:10.838819	f	0		\N	\N
158	rcb1577@hotmail.com	$2a$10$aKJV4A8G5vBfO34OujSA6ulHokJZUMtm17xt9gcIzdRfeWC/o0bBO	\N	\N	2017-07-29 01:17:20.620061	2	2017-08-03 23:32:02.670784	2017-07-29 01:17:20.626085	190.100.9.192	190.100.9.192	2017-07-29 01:15:27.088458	2017-08-03 23:32:02.672401	4-Zeumd7naE9mhi7wc3F	2017-07-29 01:16:49.028223	2017-07-29 01:15:27.26881	\N	f	f	\N	\N	0	\N	\N	América del carmen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 01:15:27.08817	f	0		\N	\N
161	nina_3009_1@hotmail.com	$2a$10$fzDZcyffYQxmC79BOABwauKkfJsFf8hTpDgnctap5M4sGSXee7Stu	\N	\N	\N	1	2017-07-29 17:59:41.425194	2017-07-29 17:59:41.425194	191.125.156.14	191.125.156.14	2017-07-29 17:59:41.410039	2017-07-29 17:59:41.426359	\N	2017-07-29 17:59:41.335779	\N	\N	f	f	\N	\N	0	\N	\N	Karina Jorquera	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	nina_3009_1@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 17:59:41.409794	f	0		\N	\N
162	erciliasandoval2008@live.vl	$2a$10$0N8yawusbAOw10W5GJrlQu.uXNNo16016dITZDX96WLNos0m14mTu	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 18:04:36.910839	2017-07-29 18:04:36.910839	VpSzHUnuqc2Tjn45j39P	\N	2017-07-29 18:04:36.913113	\N	f	f	\N	\N	0	\N	\N	Ercilia Sandoval	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:04:36.910512	f	0		\N	\N
168	alimacperez88@gmail.com	$2a$10$g9Ycw3/dLEQktO41gEOy9.9vAc6H/7VgfR3H/gJm7n/Gn4wZ9zNu6	\N	\N	\N	1	2017-07-29 18:36:11.508798	2017-07-29 18:36:11.508798	191.126.52.246	191.126.52.246	2017-07-29 18:32:51.258249	2017-07-29 18:36:11.510127	RxLDBEyMmGKoLdCQxJZe	2017-07-29 18:35:38.137483	2017-07-29 18:32:51.260722	\N	f	f	\N	\N	0	\N	\N	alimac016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:32:51.257955	f	0		\N	\N
163	pafesani@gmail.com	$2a$10$i5UrAYKtkHX/CWYEy6mi1.BCCZH5HxLTZZcz8tHUsys2Y/4r5hFfi	\N	\N	\N	1	2017-07-29 18:24:56.196753	2017-07-29 18:24:56.196753	191.126.54.134	191.126.54.134	2017-07-29 18:17:56.075562	2017-07-29 18:24:56.198179	ZDAR7q5s2jybrzNDvd6Y	2017-07-29 18:24:38.690879	2017-07-29 18:17:56.078797	\N	f	f	\N	\N	0	\N	\N	patriciosan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:17:56.07524	f	0		\N	\N
165	janettreinoso@live.com	$2a$10$WBfcu9sV7UKM.APqiKlpQOceAp2Jft3Dqv.Q012Njsn88nw2APrty	\N	\N	\N	1	2017-07-29 18:26:45.520256	2017-07-29 18:26:45.520256	191.125.156.14	191.125.156.14	2017-07-29 18:26:45.505337	2017-07-29 18:26:45.521498	\N	2017-07-29 18:26:45.431555	\N	\N	f	f	\N	\N	0	\N	\N	Janett Reinoso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	janettreinoso@live.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:26:45.505089	f	0		\N	\N
166	nayarettrachell@hotmail.com	$2a$10$DWNzzrrhHTJ5h/ANpb9x3OCykWYcWS7D0qS7bgtAhKf4X3F.drYEe	\N	\N	\N	1	2017-07-29 18:28:46.082576	2017-07-29 18:28:46.082576	191.126.54.134	191.126.54.134	2017-07-29 18:28:46.067507	2017-07-29 18:28:46.084004	\N	2017-07-29 18:28:45.992481	\N	\N	f	f	\N	\N	0	\N	\N	Alanis Anahis	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	nayarettrachell@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:28:46.067251	f	0		\N	\N
164	patricios.business@gmail.com	$2a$10$58WyyN1XDbBEQ1O8xd2Sc..3FotP3DfhGfv2FvJSXIENq228wOsqu	\N	\N	\N	2	2017-07-29 18:29:11.582684	2017-07-29 18:23:51.809986	191.125.156.14	191.125.156.14	2017-07-29 18:23:51.794163	2017-07-29 18:29:11.583926	\N	2017-07-29 18:23:51.719805	\N	\N	f	f	\N	\N	0	\N	\N	Bending Alvaro	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	patricios.business@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:23:51.79391	f	0		\N	\N
169	cataa.pqb@gmail.com	$2a$10$Ir7YXLjMaLVqBmEfdvYI8uyoYBUM3v9fxl8E.Cs3yCpdO0AJ/5F1O	\N	\N	\N	1	2017-07-29 18:37:13.94317	2017-07-29 18:37:13.94317	191.125.156.14	191.125.156.14	2017-07-29 18:37:13.928631	2017-07-29 18:37:13.944545	\N	2017-07-29 18:37:13.854833	\N	\N	f	f	\N	\N	0	\N	\N	Catalina Paz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	cataa.pqb@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:37:13.928252	f	0		\N	\N
174	jacarvajarvicencio@gmail.com	$2a$10$Dfo/kVapC/LUtM3PmHcyC.HQ4vLT84iAs.IagvQg9bEAnZhVU0Caa	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 18:49:07.794367	2017-07-29 18:49:07.794367	ENv6XYzJSJyo7NyuBbsV	\N	2017-07-29 18:49:07.7966	\N	f	f	\N	\N	0	\N	\N	jose antonio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:49:07.794089	f	0		\N	\N
167	\N	$2a$10$cTZKym3f5x/H.D8l6KbMuetkr1FZlW3BLvch8m1YTVj0.vFbfsz3i	\N	\N	\N	4	2017-07-29 18:38:11.069044	2017-07-29 18:35:12.501599	191.126.54.134	191.126.54.134	2017-07-29 18:31:44.531006	2017-07-29 18:38:11.071332	fUvC7cPjMWcskPs8ycft	\N	2017-07-29 18:35:57.464655	jeannette_oyarce@hotmail.cl	f	f	\N	\N	0	\N	\N	Jeannette Oyarce Cid	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	t	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:31:44.530642	f	0		\N	\N
170	socute.-@hotmail.com	$2a$10$NHqhWjisvxHPh/gBc0TdeOMqwRwhlLdeUUqsu3aOhS1FKA96DoEau	\N	\N	\N	1	2017-07-29 18:39:34.580563	2017-07-29 18:39:34.580563	191.126.54.134	191.126.54.134	2017-07-29 18:39:34.566174	2017-07-29 18:39:34.581773	\N	2017-07-29 18:39:34.492924	\N	\N	f	f	\N	\N	0	\N	\N	Dani A. Barraza	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	socute.-@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:39:34.565942	f	0		\N	\N
171	matisch_crack@hotmail.cl	$2a$10$4GFWnJ3Ztg1Ypo5iluFYKuSyA08BzwyN.cBtJ1ajNiWCp22grRRN.	\N	\N	\N	1	2017-07-29 18:41:24.341575	2017-07-29 18:41:24.341575	191.125.156.14	191.125.156.14	2017-07-29 18:41:24.32551	2017-07-29 18:41:24.343084	\N	2017-07-29 18:41:24.250811	\N	\N	f	f	\N	\N	0	\N	\N	Matias Daniel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	matisch_crack@hotmail.cl	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:41:24.325237	f	0		\N	\N
176	penalolen001@gmail.com	$2a$10$MdQUoF2clrkPtZKxA5k2H.xw8cektUYHcqOso6/JmsVJ3AgOA0OZu	\N	\N	\N	1	2017-07-29 18:58:31.695018	2017-07-29 18:58:31.695018	191.125.156.14	191.125.156.14	2017-07-29 18:56:56.749133	2017-07-29 18:58:31.69623	3d-tMjKHwzvQrRErAWsz	2017-07-29 18:58:09.656476	2017-07-29 18:56:56.752226	\N	f	f	\N	\N	0	\N	\N	penalolen001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:56:56.748845	f	0		\N	\N
175	usuariopenalolen53@gmail.com	$2a$10$clAywfBdzAXqppMY1k03iewDhKEHdBZcKzksxMGBT9VvRF0veM8SG	\N	\N	\N	2	2017-07-29 18:59:43.712034	2017-07-29 18:55:09.828616	191.126.54.134	191.126.54.134	2017-07-29 18:54:01.146939	2017-07-29 18:59:43.713498	iE5zyRFmpxqwdxQ8WyyT	2017-07-29 18:54:26.328194	2017-07-29 18:54:01.14912	\N	f	f	\N	\N	0	\N	\N	Ramona Arratia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:54:01.146616	f	0		\N	\N
177	fabiola.cancino.palma@gmail.com	$2a$10$R3zfbcS5fn3Qzh62UDerF.dUnn.Mwzl.xrL9Jdn3oor4JxXq2SbVe	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 18:58:12.406102	2017-07-29 18:58:12.406102	y78kdTmg3mFjRxQ5CYxe	\N	2017-07-29 18:58:12.408162	\N	f	f	\N	\N	0	\N	\N	Fabiola Cancino	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:58:12.405776	f	0		\N	\N
178	jacarvajalvicencio@gmail.com	$2a$10$KWEf950Y7op4qdDa0WqmFur7dhadxoxErms4puRmEGRsLGIC2Dkle	\N	\N	\N	1	2017-07-29 18:58:56.153564	2017-07-29 18:58:56.153564	191.125.181.205	191.125.181.205	2017-07-29 18:58:56.135569	2017-07-29 18:58:56.155161	\N	2017-07-29 18:58:56.059358	\N	\N	f	f	\N	\N	0	\N	\N	Jose Antonio Carvajal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	jacarvajalvicencio@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:58:56.135284	f	0		\N	\N
173	lelito.sdv@gmail.com	$2a$10$J44YzPJC96l9hvNWXD9bC.opOuoT1yqFwOiohIWSg938I70Ug/aOG	\N	\N	\N	1	2017-07-29 18:59:47.211342	2017-07-29 18:59:47.211342	186.9.134.112	186.9.134.112	2017-07-29 18:48:32.235584	2017-07-29 18:59:47.212674	PFXChD4xgMzbqKUofhwT	2017-07-29 18:58:56.169154	2017-07-29 18:48:32.238121	\N	f	f	\N	\N	0	\N	\N	consu007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 18:48:32.235237	f	0		\N	\N
179	myriamdonosorocco@gmail.com	$2a$10$/T7bcwv4N3zAdAXPhJnSquoI.QbY/MGm1InBcuzARVhJUtxGjzyi6	\N	\N	\N	1	2017-07-29 19:17:38.696758	2017-07-29 19:17:38.696758	191.126.136.32	191.126.136.32	2017-07-29 19:08:04.297925	2017-07-29 19:17:38.698227	2dfnxwSUgx7AYkRRDzNt	2017-07-29 19:17:02.95829	2017-07-29 19:08:04.300282	\N	f	f	\N	\N	0	\N	\N	Myriam Donoso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 19:08:04.297609	f	0		\N	\N
180	nathalia.silva.donoso@gmail.com	$2a$10$v3nzSQULzYqvDeZ95CRcf.UXgYDd/IfHMVENVUEN5XcEH5Xr/RXL2	\N	\N	\N	1	2017-07-29 19:16:11.386745	2017-07-29 19:16:11.386745	191.126.52.246	191.126.52.246	2017-07-29 19:14:53.824704	2017-07-29 19:17:07.935326	dDsGUQxi_2rLYJ8-UMsc	2017-07-29 19:15:36.87152	2017-07-29 19:14:53.826723	\N	f	f	\N	\N	0	\N	\N	Nathalia Silva	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 19:14:53.824418	f	0		\N	\N
181	ivanpulgarm@gmail.com	$2a$10$6.5Uwj0Z0YjxgVE/tk4jx.NkNwbI.Zd5OzkSJtHEwNNS7joiHWKmO	\N	\N	\N	1	2017-07-29 19:19:14.67324	2017-07-29 19:19:14.67324	191.126.52.246	191.126.52.246	2017-07-29 19:17:57.293336	2017-07-29 19:19:14.674546	cJYysSVyJBnq8RKy9zJC	2017-07-29 19:18:55.318652	2017-07-29 19:17:57.295597	\N	f	f	\N	\N	0	\N	\N	Ivan Pulgar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 19:17:57.292904	f	0		\N	\N
160	may.nogue.s@gmail.com	$2a$10$nWH0rggTHBQPYiiPij0ZluXjNuJSQkTC7ap88Jd4vr9J1Q9WQE8Qe	\N	\N	\N	2	2017-07-30 17:47:26.747213	2017-07-29 15:24:47.680211	201.215.190.75	201.215.190.75	2017-07-29 15:24:47.66016	2017-07-30 17:47:26.748677	\N	2017-07-29 15:24:47.585729	\N	\N	f	f	\N	\N	0	\N	\N	May Nogué Sánchez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	may.nogue.s@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 15:24:47.659913	f	0		\N	\N
182	olgamartinezv@gmail.com	$2a$10$kHvmv9hGwwLaZbkEOyZ3OOkD9ok1KnC8K7BQagOaXqYDYuJ/goUjG	\N	\N	\N	1	2017-07-29 19:24:04.697736	2017-07-29 19:24:04.697736	191.126.136.32	191.126.136.32	2017-07-29 19:22:54.353281	2017-07-29 19:24:04.699068	PLVUB6qq526ExtToiext	2017-07-29 19:23:25.56387	2017-07-29 19:22:54.355423	\N	f	f	\N	\N	0	\N	\N	Olga Martínez Véliz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 19:22:54.352944	f	0		\N	\N
194	ambrou@gmail.com	$2a$10$EaHRAAPek9dJQyVxrFW.x.TeljtJ.A.Gh9gTGog2PhfD.sDqZ/SkG	\N	\N	\N	1	2017-07-29 20:33:14.520227	2017-07-29 20:33:14.520227	191.126.58.175	191.126.58.175	2017-07-29 20:31:43.311097	2017-07-29 20:33:14.521556	1B6pMGZExiMfrtKB_79S	2017-07-29 20:33:09.905895	2017-07-29 20:31:43.313185	\N	f	f	\N	\N	0	\N	\N	ana María Brunetto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:31:43.310767	f	0		\N	\N
183	ivanpulgarl@gmail.com	$2a$10$X2CmVdJUXfOA9yhFGsSk9OiXSnl/8fVmHdHeCuvsX8EF.UtGJ5SjG	\N	\N	\N	1	2017-07-29 19:24:55.037144	2017-07-29 19:24:55.037144	191.126.52.246	191.126.52.246	2017-07-29 19:23:22.730616	2017-07-29 19:24:55.038536	ZBFwHxVhv-rccVy8xUoA	2017-07-29 19:24:29.201499	2017-07-29 19:23:22.732807	\N	f	f	\N	\N	0	\N	\N	Ivan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 19:23:22.730317	f	0		\N	\N
184	psalvatierra@penalolen.cl	$2a$10$PVxaDojxUu3oOrCor/Rw3usyG9EeLMLP0TdlcSLwJQIh5xmzp1hMe	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 19:24:55.890789	2017-07-29 19:26:19.895159	AqBzs6522oPsVurhPGmP	2017-07-29 19:26:19.894056	2017-07-29 19:24:56.072653	\N	f	f	\N	\N	0	\N	\N	patriciosal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 19:24:55.890426	f	0		\N	\N
185	mychb7@hotmail.com	$2a$10$bCtO9K1s815iTbJ3mBfaeu1.d26Z1FIsgnOzc8dnEr8kmXH8XLvy.	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 20:05:16.024244	2017-07-29 20:05:16.024244	gXgXQaR2DtEpXNTJsygy	\N	2017-07-29 20:05:16.027216	\N	f	f	\N	\N	0	\N	\N	Myriam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:05:16.023485	f	0		\N	\N
187	myiriamchb7@hotmail.com	$2a$10$Cd/y3RrbrEecl9QDGH1EjeNe6vKPfwb92mR57NEti4xCR/4H7VXu2	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 20:07:04.120595	2017-07-29 20:07:04.120595	uVFP9vnfxmEZUQraPys-	\N	2017-07-29 20:07:04.122699	\N	f	f	\N	\N	0	\N	\N	myiriam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:07:04.120152	f	0		\N	\N
188	ivanhj13@gmail.com	$2a$10$d.uNk7LSKCYeufgmkwNx6e/U4MYhkKIv3nHpEjhTaM1Drlt63nm3a	\N	\N	\N	1	2017-07-29 20:10:58.327453	2017-07-29 20:10:58.327453	191.126.132.215	191.126.132.215	2017-07-29 20:09:31.32723	2017-07-29 20:10:58.329151	DJV5jBh3z7-EseGMurEq	2017-07-29 20:10:33.95769	2017-07-29 20:09:31.330456	\N	f	f	\N	\N	0	\N	\N	ivan henriquez jalil	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:09:31.326862	f	0		\N	\N
189	myriamchb7@hotmail.com	$2a$10$PWXRFId/hhLFqcYQ..ithe5sMdFf1MdVqVBwjmkqDEPR1P3izQ/DG	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 20:15:17.244433	2017-07-29 20:15:17.244433	58MxNripVP3VgLWNVJaM	\N	2017-07-29 20:15:17.246533	\N	f	f	\N	\N	0	\N	\N	myriam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:15:17.244137	f	0		\N	\N
191	aenriquezr2009@gmail.com	$2a$10$gD85KsvFGHnY8LTNJcvIme4srFWvGwRXlaKx/gUS2qAi3JViFbgTu	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 20:19:42.621223	2017-07-29 20:19:42.621223	WwTSadFnVTRteibtiXbZ	\N	2017-07-29 20:19:42.623273	\N	f	f	\N	\N	0	\N	\N	Andres Enriquez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:19:42.620927	f	0		\N	\N
200	alejandraespinoza123@outlook.es	$2a$10$7KIHkK0uhBLPwhhq6FzntuMM9im.i5ZDjqegTXlErHES.xBNBiuzG	\N	\N	\N	2	2017-07-29 21:11:49.588064	2017-07-29 21:04:10.129088	191.125.42.58	191.125.42.58	2017-07-29 21:02:29.215508	2017-07-29 21:11:49.589504	etMoKpQswAM5StR624kN	2017-07-29 21:03:37.057805	2017-07-29 21:02:29.218078	\N	f	f	\N	\N	0	\N	\N	alejandra espinoza	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:02:29.215156	f	0		\N	\N
190	josenilo@dercocenter.cl	$2a$10$Ruj2l5ajqDprYn/Z31xSnuReT3szc8Ng.vW86e1iEcPUOzfKOGP8W	\N	\N	\N	1	2017-07-29 20:20:59.809711	2017-07-29 20:20:59.809711	191.126.132.215	191.126.132.215	2017-07-29 20:18:23.535196	2017-07-29 20:22:58.856165	TkjArFfnJQT9gWuf96v-	2017-07-29 20:19:41.951209	2017-07-29 20:18:23.537739	\N	f	f	\N	\N	0	\N	\N	Jose Nilo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:18:23.534907	f	0		\N	\N
199	penalolen003@gmail.com	$2a$10$P4r7fWNWgid2K91qVZuiVubGICQJLhSj9.c6NyVn6tHU2XOKGB/sy	\N	\N	\N	1	2017-07-29 21:01:49.574141	2017-07-29 21:01:49.574141	191.126.58.175	191.126.58.175	2017-07-29 20:59:12.416868	2017-07-29 21:01:49.575537	q-aWKJnPVyvfB4bvdPtv	2017-07-29 21:01:02.125983	2017-07-29 20:59:12.42057	\N	f	f	\N	\N	0	\N	\N	penalolen003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:59:12.415862	f	0		\N	\N
195	omardosantos@live.com	$2a$10$LvW3lcBX84f3hj6cJGkK7uEfIOPXy.vIvMowig1z/TgSqWkBFN.LK	\N	\N	\N	1	2017-07-29 20:38:45.350088	2017-07-29 20:38:45.350088	191.125.42.58	191.125.42.58	2017-07-29 20:36:31.910217	2017-07-29 20:38:45.351434	98RFzE63J1WXf6ejoNyH	2017-07-29 20:38:15.552162	2017-07-29 20:36:31.912315	\N	f	f	\N	\N	0	\N	\N	omar Do Santos	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:36:31.909922	f	0		\N	\N
193	ahenriquezr2009@gmail.com	$2a$10$iYuf1yrK/c8pdJbgc5JSduBqpB/17Kk/KDCnR7.D4ks0U4LveSH.W	\N	\N	\N	1	2017-07-29 20:23:56.822912	2017-07-29 20:23:56.822912	191.125.42.58	191.125.42.58	2017-07-29 20:22:27.383763	2017-07-29 20:23:56.824299	MrE-HEA1Szwc-5S1S23K	2017-07-29 20:23:39.369737	2017-07-29 20:22:27.385658	\N	f	f	\N	\N	0	\N	\N	Andres Henriquez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:22:27.383506	f	0		\N	\N
192	isiperalino@gmail.com	$2a$10$Ly8ss9bleIT5hqEqNapSn./MGdgpvBz2HzK8gizPIhuLcVdsIn.v2	\N	\N	\N	1	2017-07-29 20:24:21.138118	2017-07-29 20:24:21.138118	191.126.58.175	191.126.58.175	2017-07-29 20:22:11.940476	2017-07-29 20:24:21.139427	C3-msrydwHQs3gGqtRPw	2017-07-29 20:23:30.435471	2017-07-29 20:22:11.942622	\N	f	f	\N	\N	0	\N	\N	isidora	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:22:11.940213	f	0		\N	\N
196	anipince@gmail.com	$2a$10$F3yRvF10D9KnmKHc9pfmue8LzqgGPUrWVBBmG18GRgxx.Akpz.PmC	\N	\N	\N	2	2017-07-29 20:43:20.46001	2017-07-29 20:38:02.671827	191.126.58.175	191.126.58.175	2017-07-29 20:38:02.656645	2017-07-29 20:43:20.461224	\N	2017-07-29 20:38:02.582801	\N	\N	f	f	\N	\N	0	\N	\N	Ana MAria Navarrete	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	anipince@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:38:02.656385	f	0		\N	\N
197	chivitasil@hotmail.com	$2a$10$ICJb7P3OqKtWG.V8dpXCCO8sOWgyBGzlNaKG4FqryPnteJrH23z.G	\N	\N	\N	1	2017-07-29 20:51:26.425019	2017-07-29 20:51:26.425019	181.160.126.5	181.160.126.5	2017-07-29 20:51:26.407226	2017-07-29 20:51:26.426279	\N	2017-07-29 20:51:26.33293	\N	\N	f	f	\N	\N	0	\N	\N	Silvana Ortega Gatica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	chivitasil@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:51:26.406971	f	0		\N	\N
198	penalolen002@gmail.com	$2a$10$4yJBbYUsglKHFYO4GIDzXORKwxpe4nTYjb.489dmpzIc409FFojsy	\N	\N	\N	1	2017-07-29 20:52:57.824427	2017-07-29 20:52:57.824427	191.126.58.175	191.126.58.175	2017-07-29 20:51:47.68355	2017-07-29 20:52:57.82569	HxdiD2bip51ykUFdKvcF	2017-07-29 20:52:22.570547	2017-07-29 20:51:47.685637	\N	f	f	\N	\N	0	\N	\N	penalolen002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:51:47.683227	f	0		\N	\N
186	\N	$2a$10$ZQ4U8lN5g1DFeSwlzvH3xOvP8S8jccmHQ1dW83S6ZckZlhhz/LViq	\N	\N	\N	2	2017-07-29 21:20:45.64603	2017-07-29 20:06:54.590275	191.126.132.215	191.126.132.215	2017-07-29 20:06:54.571915	2017-07-29 21:20:45.647488	\N	\N	\N	\N	f	f	\N	\N	0	\N	\N	Ivan Antonio Henriquez Jalil	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	t	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 20:06:54.571597	f	0		\N	\N
201	esteban.torres.b@hotmail.com	$2a$10$dAZwExj225OYCaq40jpvVOBaFMj33TAwRILCerUgdpeUAzzpT94kK	\N	\N	\N	1	2017-07-29 21:07:22.198142	2017-07-29 21:07:22.198142	191.126.58.175	191.126.58.175	2017-07-29 21:05:09.726533	2017-07-29 21:07:22.199631	nnBmSRZVDxbtwcA_6NxT	2017-07-29 21:06:53.64362	2017-07-29 21:05:09.729901	\N	f	f	\N	\N	0	\N	\N	esteban torres	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:05:09.726215	f	0		\N	\N
203	myriam.delvalle.r@gmail.com	$2a$10$UJwfqV0gbuxVu4Fq27JV2OXdU8264ZNleihOChAbT9bDfaaSMrsOS	\N	\N	\N	1	2017-07-29 21:40:03.381051	2017-07-29 21:40:03.381051	191.126.12.235	191.126.12.235	2017-07-29 21:38:59.572917	2017-07-29 21:40:03.382608	iyYBWMhMbinTxxNEzoJJ	2017-07-29 21:39:34.651099	2017-07-29 21:38:59.575405	\N	f	f	\N	\N	0	\N	\N	Myriam Del Valle	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:38:59.572585	f	0		\N	\N
202	araya.edgar@gmail.com	$2a$10$UhlOgcEx8XkBc7HtsEXCrOwT8bzT1M8Kqfi8dgJqdMxNDfK29mKti	\N	\N	\N	1	2017-07-29 21:22:56.762986	2017-07-29 21:22:56.762986	191.126.50.159	191.126.50.159	2017-07-29 21:18:51.899275	2017-07-29 21:22:56.765006	TPNJRchRE8aoU_TcdFVm	2017-07-29 21:22:14.997102	2017-07-29 21:18:51.901668	\N	f	f	\N	\N	0	\N	\N	Edgar Araya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:18:51.898974	f	0		\N	\N
205	chespi.ldea@gmail.com	$2a$10$5pFTzvsOK6W.k9wu/W3PwuuQ83jgcKKAd1KBp0MWuigXjmay0kKNe	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 21:49:56.264168	2017-07-29 21:49:56.264168	uW2tytLCT-p7qzgdw3fe	\N	2017-07-29 21:49:56.266139	\N	f	f	\N	\N	0	\N	\N	sebastián Carrasco	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:49:56.263869	f	0		\N	\N
206	cecilia.olate.quintana@gmail.com	$2a$10$sp8P1SvPdfINe5Iheudsy.gRFt5vRWR2ZNr8gZkml22cCiEUCw8om	\N	\N	\N	1	2017-07-29 21:53:03.55182	2017-07-29 21:53:03.55182	179.9.99.124	179.9.99.124	2017-07-29 21:51:16.554701	2017-07-29 21:53:03.553378	sF7s2ET6bVXUszwXLeX7	2017-07-29 21:52:29.018437	2017-07-29 21:51:16.557212	\N	f	f	\N	\N	0	\N	\N	cecilia olate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:51:16.554357	f	0		\N	\N
207	sebarubiog@gmail.com	$2a$10$lJb1r9GWi1II6oG3oDbrXujEn.O.6pERo5Ec/y35Hygd4dW1ds80G	\N	\N	\N	1	2017-07-29 22:00:21.039325	2017-07-29 22:00:21.039325	191.126.138.119	191.126.138.119	2017-07-29 21:58:20.352315	2017-07-29 22:00:21.040747	T-eTXTMysYXBWs29xd4t	2017-07-29 21:59:49.49524	2017-07-29 21:58:20.354566	\N	f	f	\N	\N	0	\N	\N	Sebastián Rubio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:58:20.351977	f	0		\N	\N
208	cristiano_819@hotmail.com	$2a$10$FS4Z1uufO3rwPFuF9A/uAO5toGfz.cLCq0iWpgOAf9RXOKXe6e4EK	\N	\N	\N	1	2017-07-29 22:06:14.66767	2017-07-29 22:06:14.66767	191.126.160.121	191.126.160.121	2017-07-29 22:00:47.354232	2017-07-29 22:06:14.668937	5KLufwoeZzedcszGs6HY	2017-07-29 22:03:59.584649	2017-07-29 22:00:47.356733	\N	f	f	\N	\N	0	\N	\N	Cristian Maldonado Correa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:00:47.353886	f	0		\N	\N
221	antonio433@msn.com	$2a$10$ZDIThQHlNofbzg.n05YFTu2n8tjSqhZlF0YxZ4YRyWD4QZnlZ9lg.	\N	\N	\N	2	2017-07-31 00:19:01.314327	2017-07-31 00:18:00.085743	190.160.244.166	190.160.244.166	2017-07-31 00:18:00.069692	2017-07-31 00:19:01.315678	\N	2017-07-31 00:17:59.991477	\N	\N	f	f	\N	\N	0	\N	\N	Carlos Gallardo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	antonio433@msn.com	\N	\N	\N	\N	t	t	t	f	2017-07-31 00:18:00.069403	f	0		\N	\N
33	user12@abre.penalolen.cl	$2a$10$N0eikjuTJ3y0dzapa.o/A.bfotdHe4nop25L5CUrTYJ6qEoSt5hby	\N	\N	\N	1	2017-07-29 22:18:47.527973	2017-07-29 22:18:47.527973	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.82996	2017-07-29 22:18:47.529334	\N	2017-07-11 16:40:57.756796	\N	\N	f	f	\N	\N	0	\N	\N	Eloisa Delvalle Rosales	1987123679	1	2017-07-11 16:40:57.83311	\N	\N	\N	916359083	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.829681	f	0		\N	\N
215	elviragonzalez.1983@gmail.com	$2a$10$sM04T4Vvc4umT025C2uhOuAxJwpjMrZEcgmRYh0cqYZlDvSK1gkMO	\N	\N	\N	1	2017-07-29 22:50:40.689389	2017-07-29 22:50:40.689389	191.126.160.121	191.126.160.121	2017-07-29 22:49:59.519652	2017-07-29 22:50:40.690885	VpuPz5vzzqeVr-zNiYg9	2017-07-29 22:50:28.6789	2017-07-29 22:49:59.521834	\N	f	f	\N	\N	0	\N	\N	Elvira Gonzalez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:49:59.519364	f	0		\N	\N
210	dorellana4@gmail.com	$2a$10$F0Sk6lBMJTBNIcnkow7Ufu94RgzAI6zqs9xfLOzFEo5EntBdZ6PMu	\N	\N	\N	1	2017-07-29 22:33:56.033443	2017-07-29 22:33:56.033443	191.126.160.121	191.126.160.121	2017-07-29 22:32:42.939462	2017-07-29 22:33:56.034836	SFrWucNK8cosGoTvDssp	2017-07-29 22:33:29.010632	2017-07-29 22:32:42.941527	\N	f	f	\N	\N	0	\N	\N	DIego Orellana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:32:42.939136	f	0		\N	\N
211	miguelponceparra@hotmail.com	$2a$10$4un6U9G8j39jIB.rxh7v/ujvlQxvA/VHZu5wEWmIFq9B6NQ78DChC	\N	\N	\N	1	2017-07-29 22:40:03.132153	2017-07-29 22:40:03.132153	191.126.165.109	191.126.165.109	2017-07-29 22:38:07.151396	2017-07-29 22:40:03.133633	JkBbnBgzxMqWtC-N41yP	2017-07-29 22:39:42.256649	2017-07-29 22:38:07.153504	\N	f	f	\N	\N	0	\N	\N	Miguel 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:38:07.151061	f	0		\N	\N
214	monicaraillanca24@gmail.com	$2a$10$FupjNcI.OSllYW8tNsBYyeuQCQxlijE89Vy27UdRLuLM1csFKl.p2	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 22:45:15.089366	2017-07-29 22:45:15.089366	PwecXGko9jxf1TdgUVJ3	\N	2017-07-29 22:45:15.091773	\N	f	f	\N	\N	0	\N	\N	Mónica Raillanca	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:45:15.089075	f	0		\N	\N
212	elviragonzalez1983@gmail.com	$2a$10$pQXRhxRtL273EIQs83W24ONaCRGyjaSNqFuOdzwHITwqpVaPkVy1y	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 22:44:38.626135	2017-07-29 22:45:42.272596	RxkuvtnFijs1zsg7BzCq	2017-07-29 22:45:42.271603	2017-07-29 22:44:38.628576	\N	f	f	\N	\N	0	\N	\N	Elvira González	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:44:38.625617	f	0		\N	\N
216	dayannab.parra@hotmail.com	$2a$10$LA9Ud/HtL/R7XEQkgB4GnOS8/RFp.S4Ho2FpUSQb3bD6dyHgDvKIq	\N	\N	\N	1	2017-07-29 22:50:40.861257	2017-07-29 22:50:40.861257	191.126.165.109	191.126.165.109	2017-07-29 22:50:40.844272	2017-07-29 22:50:40.862558	\N	2017-07-29 22:50:40.765997	\N	\N	f	f	\N	\N	0	\N	\N	Dayanna Bahamonde	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	dayannab.parra@hotmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:50:40.843927	f	0		\N	\N
213	derechosyrespeto@gmail.com	$2a$10$OlzeRIvlWJtTfiFY9LBUPe/Eq0aoUHQivxK3v4AaOIFqlMfn7cCC6	\N	\N	\N	1	2017-07-29 22:46:13.464729	2017-07-29 22:46:13.464729	191.126.165.109	191.126.165.109	2017-07-29 22:45:01.592308	2017-07-29 22:46:13.466621	as4rFfvHGXk2ksS-hAGD	2017-07-29 22:45:51.659047	2017-07-29 22:45:01.595371	\N	f	f	\N	\N	0	\N	\N	julio	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:45:01.59182	f	0		\N	\N
28	user7@abre.penalolen.cl	$2a$10$00X22GjRmn.nIOH7A5DD8.PJUuKXzUexRSq7B4DvOrDTW/fjjNzmu	\N	\N	\N	1	2017-07-29 22:46:14.121735	2017-07-29 22:46:14.121735	191.126.138.119	191.126.138.119	2017-07-11 16:40:57.412136	2017-07-29 22:46:14.124642	\N	2017-07-11 16:40:57.339748	\N	\N	f	f	\N	\N	0	\N	\N	Rosa Jimínez Rendón	9732759476	1	2017-07-11 16:40:57.41548	\N	\N	\N	981.795.866	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-11 16:40:57.411899	f	0		\N	\N
204	juanjoseroalorca@gmail.com	$2a$10$TdrorJRTeoMhvxpPf4o7juB.Q6OSvUr0RmctlDoClT7fQxtCcuiqW	\N	\N	\N	2	2017-07-29 22:47:35.756069	2017-07-29 21:42:15.621998	191.126.138.119	191.126.138.119	2017-07-29 21:42:15.60877	2017-07-29 22:47:35.757285	\N	2017-07-29 21:42:15.534396	\N	\N	f	f	\N	\N	0	\N	\N	Don Gruñon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	juanjoseroalorca@gmail.com	\N	\N	\N	\N	t	t	t	f	2017-07-29 21:42:15.608507	f	0		\N	\N
209	pendola.tamara@gmail.com	$2a$10$mktA4ja02Aj6Qkn7JQ.R3.naBmBjiBxEDDtCmR482DYWkHBY4/NIi	\N	\N	\N	3	2017-07-29 22:48:51.800926	2017-07-29 22:13:55.594164	191.126.165.109	191.126.165.109	2017-07-29 22:07:50.318484	2017-07-29 22:48:51.802201	_6J_s9s_VmyNDMzdo3kw	2017-07-29 22:10:07.654824	2017-07-29 22:08:36.197412	\N	f	f	\N	\N	0	\N	\N	Tamara Péndola Acharán	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:13:55.582823	f	0		\N	\N
217	alejanmoy@hotmail.com	$2a$10$0K/LAKYyawLmMZbARALN/.MmJW1fXa.SiSDAEHR0zO745VNnv8oNO	\N	\N	\N	1	2017-07-29 22:59:43.411877	2017-07-29 22:59:43.411877	191.126.165.109	191.126.165.109	2017-07-29 22:57:14.851017	2017-07-29 22:59:43.41336	Hxe8i7WjxJB5cEGBY9EE	2017-07-29 22:58:50.369097	2017-07-29 22:57:14.852988	\N	f	f	\N	\N	0	\N	\N	Alejandro Moya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:57:14.85073	f	0		\N	\N
218	\N	$2a$10$PYfDBrq/YGYeXME5./6Zcu2R/vcFFgYHuui3gSqy96KE1yycT5mg2	\N	\N	\N	1	2017-07-29 22:59:59.768101	2017-07-29 22:59:59.768101	191.126.138.119	191.126.138.119	2017-07-29 22:59:59.754359	2017-07-29 23:01:16.264904	-9MPnAxNsyMoWDb4jGZf	\N	2017-07-29 23:01:16.267582	camilcramirez9@hotmail.com	f	f	\N	\N	0	\N	\N	Camila Ramirez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 22:59:59.754039	f	0		\N	\N
220	quitral200@yahoo.es	$2a$10$SBIxAajGs6HCIgLkqr2OHeYbfx7F894tFr8lw2bA5QuFzXmbET3Jq	\N	\N	\N	1	2017-07-30 00:23:21.636292	2017-07-30 00:23:21.636292	181.160.215.69	181.160.215.69	2017-07-30 00:23:21.61905	2017-07-30 00:23:21.637611	\N	2017-07-30 00:23:21.544885	\N	\N	f	f	\N	\N	0	\N	\N	Edwin Quitral Estay	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	quitral200@yahoo.es	\N	\N	\N	\N	t	t	t	f	2017-07-30 00:23:21.618726	f	0		\N	\N
222	arayabermal@yahoo.es	$2a$10$fpunKmKr8YH25jPVe6o/uu8FzF1jwT.hoAgg74dPMo/yp1RiQxMqy	\N	\N	\N	2	2017-07-31 00:22:17.905881	2017-07-31 00:21:59.422666	190.160.244.166	190.160.244.166	2017-07-31 00:21:59.408596	2017-07-31 00:22:17.907208	\N	2017-07-31 00:21:59.334638	\N	\N	f	f	\N	\N	0	\N	\N	Maria Eugenia Araya Bermal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	arayabermal@yahoo.es	\N	\N	\N	\N	t	t	t	f	2017-07-31 00:21:59.408245	f	0		\N	\N
219	danisifigueroa@gmail.com	$2a$10$a9dwHVncxfYkY3xuC8ZHVeMxiauKI5fPNO61lkYFJCFvx0ZjWDeai	\N	\N	\N	0	\N	\N	\N	\N	2017-07-29 23:02:48.477829	2017-08-04 10:52:28.808761	esWD-_YF6nV-5Pm6PvvQ	2017-08-04 10:52:28.807513	2017-07-29 23:02:48.480221	\N	f	f	\N	\N	0	\N	\N	Marisol Rojas Gutierrez	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	t	t	0	f	es	\N	\N	\N	\N	\N	t	t	t	f	2017-07-29 23:02:48.477373	f	0		\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('users_id_seq', 222, true);


--
-- Data for Name: valuation_assignments; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY valuation_assignments (id, valuator_id, spending_proposal_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: valuation_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('valuation_assignments_id_seq', 1, false);


--
-- Data for Name: valuators; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY valuators (id, user_id, description, spending_proposals_count, budget_investments_count) FROM stdin;
1	4	\N	0	0
\.


--
-- Name: valuators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('valuators_id_seq', 1, true);


--
-- Data for Name: verified_users; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY verified_users (id, document_number, document_type, phone, email, created_at, updated_at) FROM stdin;
\.


--
-- Name: verified_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('verified_users_id_seq', 1, false);


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY visits (id, visitor_id, ip, user_agent, referrer, landing_page, user_id, referring_domain, search_keyword, browser, os, device_type, screen_height, screen_width, country, region, city, postal_code, latitude, longitude, utm_source, utm_medium, utm_term, utm_content, utm_campaign, started_at) FROM stdin;
026a88fe-2f84-40f8-92f7-ee49630f7200	51ca6678-19a3-4ed3-be71-2f89bef6d8cd	190.20.114.129	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-11 19:07:01.405628
8646b5d5-492b-428f-9a1d-ba9ec06b5b19	fbc158ea-4912-4de1-b6b6-25bd9b2c62fc	146.155.117.56	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	1024	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 22:15:23.883257
76b04665-be55-444b-ae73-acff282b8887	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.114.129	Mozilla/5.0 (X11; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0	\N	https://abre.penalolen.cl/users/sign_in	42	\N	\N	Firefox	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-11 20:45:23.416441
e1c05057-374a-4f4e-9e32-8a3333d93529	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.114.129	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	http://localhost:3000/	https://abre.penalolen.cl/more-information	43	localhost	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-11 23:12:22.752989
33819d97-6594-44a1-83d3-8fcf452c71a7	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.221.243	Mozilla/5.0 (X11; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0	https://abre.penalolen.cl/verified_user	https://abre.penalolen.cl/users/sign_in	\N	abre.penalolen.cl	\N	Firefox	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-12 14:48:28.713294
15f80fcc-67c7-416d-92d0-2684ceecb3e7	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.221.243	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-12 16:53:28.062129
6a007c73-0d1b-4b63-b288-aabf4653cc8a	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.221.243	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-12 22:04:21.369608
47aaced3-ec69-4e23-b1ea-f2da5f7114f6	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.165.246	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 22:25:36.062798
36b6ff5a-c692-49e6-8c94-34e3f177f3fa	1b5cfe7b-d51c-4df4-a1c9-20c895724671	181.160.62.246	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 22:34:33.547521
7c328e91-48cb-4af1-a13b-1afabfb58060	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.141.119	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-13 14:23:07.169787
c02a509b-ab80-442e-8972-41ad78a9bdde	50b1e6fb-435b-4198-9d58-c19e267543df	190.20.141.119	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-13 14:27:16.923906
06b6aa27-8b4f-49aa-9788-a32d98423cbc	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.141.119	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	43	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-13 14:22:45.795056
f940c140-5487-44f2-9f9e-4d4a2d581849	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.141.119	Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	https://abre.penalolen.cl/users/sign_up	https://abre.penalolen.cl/users/sign_up/success	\N	abre.penalolen.cl	\N	Firefox	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-13 16:34:05.932956
f88b695a-9164-4fb7-8a5a-6adc9a01bf56	9ba942cb-e556-400d-8f1f-2e1c62f8f503	200.83.137.32	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/conditions	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-13 23:30:24.223243
8cfbbb21-272a-4ac9-9bab-5c310d05c304	9dd301cb-48a7-4445-93b9-597da6f39532	181.160.37.228	Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257	https://mail.google.com/mail/mu/mp/124/?source=nap&hr=1&hl=es	https://abre.penalolen.cl/users/sign_in	73	mail.google.com	\N	Mobile Safari	iOS	Mobile	480	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 01:30:51.432202
791669d9-cc68-4367-a2d5-a41274b73e35	afcf0a0e-3853-4dd4-b5b4-c2e3d85faefb	186.9.134.75	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	43	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 00:05:42.8149
5c5d3dfb-036a-4e8a-83a4-a51c8df48763	2abb277e-5f07-4267-922d-908d421e87dd	200.104.159.30	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 02:51:56.862284
01a4a43e-d1f6-49d7-b3ec-e1747b84f503	ff54610d-3649-4ef7-add6-e0b043a45a18	179.9.72.105	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 05:45:25.954473
248d4db6-7b0a-4740-b584-71327490440b	5738d5c4-77e6-4511-a028-42a5a8b6816f	200.83.137.32	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 03:53:08.871983
5abf8807-0bdc-48b2-85b1-282ba87d5476	449b5d02-702a-4c78-882c-bd1609fb301d	190.98.205.98	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4	https://www.google.com/	https://abre.penalolen.cl/	\N	www.google.com	\N	Safari	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 12:43:04.544732
195d55dc-a0c2-43ea-958b-9919a998d3a2	53e92951-084c-43b3-919b-5a25fc1fbd0a	186.9.135.104	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	https://m.facebook.com/login.php?skip_api_login=1&api_key=1944563595832705&signed_next=1&next=https%3A%2F%2Fm.facebook.com%2Fv2.8%2Fdialog%2Foauth%3Fredirect_uri%3Dhttps%253A%252F%252Fabre.penalolen.cl%252Fusers%252Fauth%252Ffacebook%252Fcallback%26state%3Daba112727ef55251a384335583915f6d4d2dfe72432f8496%26scope%3Demail%26response_type%3Dcode%26client_id%3D1944563595832705%26ret%3Dlogin%26logger_id%3D842ad3cc-dca9-3bb6-618b-7a7f0b5e24ac&cancel_url=https%3A%2F%2Fabre.penalolen.cl%2Fusers%2Fauth%2Ffacebook%2Fcallback%3Ferror%3Daccess_denied%26error_code%3D200%26error_description%3DPermissions%2Berror%26error_reason%3Duser_denied%26state%3Daba112727ef55251a384335583915f6d4d2dfe72432f8496%23_%3D_&display=touch&locale=es_ES&logger_id=842ad3cc-dca9-3bb6-618b-7a7f0b5e24ac&_rdr	https://abre.penalolen.cl/problems/1	43	m.facebook.com	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 11:28:01.994065
acef3950-dc9a-475a-9a55-234cbe28c319	f5474900-dce9-46e3-b7cb-ae2e51deaed1	190.107.226.49	Mozilla/5.0 (Linux; Android 6.0; CAM-L23 Build/HUAWEICAM-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 14:27:09.548878
56231c1c-2782-4a7c-b06a-8b0257ab420c	2946876d-72b7-474c-a2ea-f9a23e1a401b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome	Windows 7	Desktop	1024	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 14:00:59.686497
a695a335-3a14-4588-a383-a8e4bf86dead	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.165.246	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 14:23:40.188032
9bec45f6-08ef-4e05-990f-20f1fc1064ee	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 15:08:56.571735
eee84b8c-bd32-46a2-9794-2f59af66346f	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 15:52:21.260068
e61e058b-d828-4c6a-b1bf-e09a6d73df01	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.86.168	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	53	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 15:15:40.243083
c6b240c0-2269-42ed-9bae-7c261b6ebe51	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.86.168	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	53	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 15:09:02.377974
ad4c9cae-b13e-4190-94f1-3663ce47454f	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.86.168	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 15:18:53.816797
9e8ddebd-c3f8-484a-b1d7-aa7de9a532e2	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.86.168	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 15:19:37.329066
61b934de-e86a-4564-ba31-ffb9dd22a4de	9cac2cfa-10e6-4b07-bc22-c3e1f3c36610	190.20.86.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 15:20:53.42782
eed40d46-7286-427e-b78e-d5c1aeabec1c	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 15:58:36.596689
265bc1a0-4e79-4d4f-9be7-1e459d738ed0	f640438f-9037-41b0-b3eb-caf14df4915b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	131	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 16:01:50.330875
43aa22ae-1c1c-45b3-8c67-c601f712af5e	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.86.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	54	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 16:22:25.331135
37945386-527c-4110-8317-314d37437d9c	a819b728-967b-4263-819c-4745df2080b0	190.20.86.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 17:40:56.846297
562f2644-1295-40ca-a70d-ac2cb5246989	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.168.31	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 16:02:44.858166
1d466060-85c6-4006-ad69-5f86da920af4	81711bbf-e522-4996-b704-53b90119216e	190.82.22.76	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	56	\N	\N	Chrome	Mac OS X	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 18:14:06.849484
eb4251f8-5ae3-4e71-8abb-a7ccdd5f71f4	c96593a4-1ddb-4836-b0c1-3af4997f6c77	190.20.86.168	Mozilla/5.0 (Android 6.0.1; Mobile; rv:54.0) Gecko/54.0 Firefox/54.0	\N	https://abre.penalolen.cl/proposals/4-a-relajarse-un-poco-vecinos	\N	\N	\N	Firefox Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-14 19:42:01.408065
b4d1aa3e-b240-4367-b9c7-3a3a17bf7382	5738d5c4-77e6-4511-a028-42a5a8b6816f	200.83.137.32	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-15 18:14:53.915471
88977349-c62d-45b0-a375-ec9aba6c287d	2abb277e-5f07-4267-922d-908d421e87dd	186.9.129.27	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-15 20:29:59.027868
9c7c762c-c47b-4332-b5c1-58d09b5e432c	36110402-83c7-49dc-b297-8994112e3481	186.9.128.62	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-16 02:49:33.718352
0fad85d8-1b70-49a8-b195-830c89251ff4	703b901b-2cb9-4a5b-9671-6b52abd5848d	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	132	\N	\N	Chrome	Windows 7	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 16:04:33.277275
ac6d64d3-4b9f-422d-abb0-bdcdc0a0e2cf	6c199216-f369-412c-8b42-8fee9ed6e60f	186.9.128.62	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	1	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-16 02:51:01.917115
ff5749f4-0ad6-4c26-9d59-6edfb8271c4a	0d27ceaa-83e6-4299-9474-4cafb570c542	186.9.128.62	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-16 02:59:45.874113
e94cb658-3ca9-4159-8533-8174ae4cab1d	8b2efa3d-2330-4c5b-ab2c-0087c21ef039	186.9.131.62	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/more-information	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-16 13:12:39.50678
b8fd9a62-1327-4aac-a678-2040dbdec672	0952c33a-cb2b-419c-bace-f55edeba0b47	190.162.101.196	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-16 20:47:34.407401
8a6673fa-3180-4468-8572-25e4f3440bce	8348f879-31de-491d-9eed-9d1edc7f230d	186.9.131.238	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 09:37:57.526308
249dd923-8f49-4a63-bd56-27ed663b7343	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 12:40:41.951826
cd898e53-bad7-4b93-b765-b46aedd0b294	5f8f7b27-ce11-4a82-84d4-6a04149024c9	201.219.233.19	Mozilla/5.0 (Linux; Android 4.4.2; Lenovo A806 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 13:00:58.553486
bcacd207-90f5-4b86-bcf1-ae96abfaca46	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.192.230	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 13:53:55.249735
5f8b4215-4b81-4d8b-a7dc-b61d350405e4	e2eb8369-a600-4fca-887b-9154940ff57f	190.161.14.138	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M Build/MMB29T) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	149	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 17:04:48.333316
30ddb8ca-6e4b-4591-a42a-bd85f5004e7d	e83e81d3-bf1d-4432-a899-fce5a51c0bf0	190.20.82.175	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://abre.penalolen.cl/users/sign_in	https://abre.penalolen.cl/proposals	1	abre.penalolen.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 17:57:49.223093
57a73185-86b9-4c23-8fc4-5b99933980ff	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.192.230	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 14:26:53.353192
99e6804e-843c-4217-a75b-c3387c66edd0	c776ba7e-47df-46a9-baba-b45b975d0e4c	190.20.51.223	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 14:47:42.741639
19f57799-1a9d-4237-af30-1ef02686084e	d5b7cc1f-8506-40a4-bfa1-49661e803901	190.20.51.223	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 14:51:21.745923
948012ed-f0cb-45df-b776-de335cdb12ee	9cac2cfa-10e6-4b07-bc22-c3e1f3c36610	190.20.51.223	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 14:52:28.856249
c3ceee21-aae2-4c22-9046-4528b86bdf70	eb21808a-0cff-4d52-9cf2-0690e7d198d9	190.20.51.223	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 14:53:23.723634
e6672b18-d91d-4e6f-9a27-60c38726aac4	f640438f-9037-41b0-b3eb-caf14df4915b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 14:56:19.470246
8337ba4f-5dd7-4ae9-88cc-6eee2c4b1f70	9ed4dd03-4704-4d10-bd27-0aa6512a606c	191.119.65.186	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/problems/3	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 17:08:33.788766
8ed16af7-b235-4bd2-b1c2-65a3cca0ac88	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 16:48:16.542552
d5c3390f-f638-4893-8d49-8dfb6c151017	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 19:05:06.753316
24229a87-ab2f-4b19-816d-1b62a614d0b3	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.72.155	Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	8	\N	\N	Firefox	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 19:07:27.589419
ff9a8ca5-8fb0-4a67-9b4a-b0a6b0e44de4	ca8ca826-6244-4cb9-baed-53357b93b885	191.125.55.115	Mozilla/5.0 (Linux; Android 6.0.1; SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.91 Mobile Safari/537.36	android-app://org.telegram.messenger	https://abre.penalolen.cl/	\N	org.telegram.messenger	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 19:07:55.340082
0b768355-2112-4c18-8dc2-7066d675872a	ad6976aa-d30d-4b5d-8926-a682f12cac3b	190.20.72.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:22:16.368417
daf8a404-8281-49aa-b6c1-109a387cebc2	73535222-549e-4bf9-ba2a-a30ee1110205	190.20.72.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:23:03.755227
75f27361-9210-4c4f-af29-b124551a1357	3b135ca2-7206-4276-927b-7a78f1d95f2d	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/603.2.5 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.5	\N	https://abre.penalolen.cl/	\N	\N	\N	Safari	Mac OS X	Desktop	720	1152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:24:02.013475
a24e4695-b44e-4f63-8a11-6528ccebfa09	18ed254d-39f8-4960-9262-30ecf6739d8f	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:24:03.695191
ffc3d520-8829-48f4-8861-9d6125dbd331	dac12b87-8638-4df9-829e-020e92ef0423	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	59	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:23:45.833575
5a585b9c-e6e7-4dd3-8881-66efc3385ef2	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.72.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:25:23.242855
dbf80c8a-cc9f-4d9e-9ef8-f9e87e27402c	80cfa630-5d17-487a-89ac-b4124b8c8819	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36 OPR/46.0.2597.39	\N	https://abre.penalolen.cl/	\N	\N	\N	Opera	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:25:40.615557
b86c15ff-ffde-4f54-81f0-0f3ca098251b	b584650d-af07-4e9b-a3f7-52e3dae8f609	190.20.72.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:25:43.118973
1acd77a2-0cec-49e6-a087-33182f33bcca	a6a860ff-3ead-4642-b896-f253841b0d0a	190.20.72.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	60	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 16:45:24.434134
ff9fa7ab-e5e5-4c1e-b3c8-69ffb0c0639e	cd7198a0-baf2-4c9e-afc6-221beebabce5	190.20.72.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	61	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 20:53:34.004857
8791d598-175d-482b-8161-b24b407cd477	a2498336-1724-4127-8f62-8487b1a6f257	190.161.127.158	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 21:10:00.818715
e32c1480-120e-4e13-ae56-e265a0913c29	9ed4dd03-4704-4d10-bd27-0aa6512a606c	191.116.122.28	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 21:25:09.818731
235a9765-3beb-4202-aa68-5647f6ffc1af	09163913-c14a-444c-8cd3-2b8bf22d9f2d	191.125.142.92	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-17 23:50:46.083697
0ed3a386-a666-4701-a61b-8641021b2cdd	7fbae525-6518-4f1f-8bfa-7e68fb059fa4	181.160.245.113	Mozilla/5.0 (Linux; Android 6.0.1; SM-J510MN Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 00:32:05.118124
1b45c719-1004-4e71-b604-1fa58494aaac	2abb277e-5f07-4267-922d-908d421e87dd	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 03:39:51.978127
3eb6a3a0-f8f9-4bef-9a77-6f1d258bb924	a2498336-1724-4127-8f62-8487b1a6f257	190.161.127.158	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	https://abre.penalolen.cl/users	https://abre.penalolen.cl/users/sign_up/success	\N	abre.penalolen.cl	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 05:35:35.947379
62d22b84-2992-4610-b200-c450e3f87131	f640438f-9037-41b0-b3eb-caf14df4915b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 12:45:10.498539
4b6ad063-9e0e-4c4d-b32e-e545abc20588	f6c79845-e816-477d-aee5-fbcc30bb280b	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:09:17.938568
39e47552-707f-49aa-91ef-35d8765239df	376da2b4-376e-468d-b0e6-13ed531ec9f6	186.9.130.136	Mozilla/5.0 (Linux; Android 6.0.1; CPH1701 Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/125.0.0.22.70;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:12:35.017657
0c3d8c3e-3a11-47c6-8ead-4c16ed5c79c8	0986478a-925f-48e1-9b4f-59637945adb7	191.126.54.105	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	736	414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:15:53.453379
72f82f22-1933-4a92-8521-3fbca2db9286	57f29677-e663-4bfa-825c-ccbf0b0dddcc	191.125.26.165	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:17:33.341385
991bc18f-4754-42df-8476-f7f64f5e10fc	c03f9dcb-a4fb-4f45-8800-9a6b5417ff97	191.116.126.61	Mozilla/5.0 (Linux; Android 6.0; SMART_PLUS Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:23:23.575529
15258beb-544d-4d50-8d96-ccbb5357b7fd	9d0125ac-7c58-48fa-a7f1-537adeca8b45	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:40:40.231961
8e01bc92-1558-44cd-bd16-19a8b64bbbf3	7cf1f6c5-838e-40fd-9c17-2fb7a535afcb	191.126.54.105	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	736	414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:46:06.341276
ba281910-f206-48ef-9b27-72340edbd35e	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:48:13.501259
6e669da6-7ea8-47b7-9909-f74d6eda7589	f27ae70d-58ac-43d6-a57e-fe151db24410	152.174.49.237	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:54:34.453909
422abb2d-c43a-458d-9309-5c4a7f4793f2	4a5fc6da-f6a5-427b-845d-fdaacebc35d2	190.20.72.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36	\N	https://abre.penalolen.cl/problems/3	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 14:04:20.243747
8d6e4352-2678-4a5a-814e-71e26caa5765	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.72.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/problems/3	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 14:06:28.002772
12c66925-e6af-4318-a05f-4eab0824b644	f9bd5b89-c7bf-4b81-8803-8695b8b75bdd	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 14:16:06.133561
16bd45c8-cfd3-4248-aab9-5a51dc9f86be	d989af4c-acf0-41eb-9d3b-4a7ccb4e6e51	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	820	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 15:33:46.54935
9116c8b3-cb47-4fb2-95c8-28777bc9f4f3	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.72.155	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 16:39:27.691447
7945a13f-e8b2-4180-9382-d1fffe559a81	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.72.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 16:47:47.465764
0e6e9410-21cb-4af9-84cf-0daa7b21fe4d	3267898e-7adb-4a10-85f6-9aafdf3eabe8	190.20.72.155	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 16:55:32.036795
f04020c5-960a-49bd-a711-6da0174c719f	45077f51-ab6c-4de5-85b1-f7df748f8888	190.20.72.155	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 16:55:36.107376
0f8d8b55-a420-4729-a645-f3d608b41788	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.72.155	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 13:54:22.699992
4ccb3840-b842-49e9-bbf6-ef6118072c23	15e7853d-d0f3-4724-8b15-84a2bb27b8f9	190.20.58.68	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 20:44:04.938877
03e52e0d-7277-4750-aec3-3dde923df88c	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.58.68	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 22:35:25.70462
de4c6aeb-8335-459a-9d76-09413d553f8c	7fbae525-6518-4f1f-8bfa-7e68fb059fa4	181.160.188.254	Mozilla/5.0 (Linux; Android 6.0.1; SM-J510MN Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 23:39:15.784647
b6db3a05-b683-49d1-9a73-1bdaa151b9a1	8f7d6f50-95e7-45e5-89ec-85987a44605b	181.160.106.110	Mozilla/5.0 (Linux; Android 4.2.2; GT-I9082L Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-18 23:46:39.281953
f54d182d-2b7a-4131-bebb-dad7a3a8db17	64956f43-8da4-4af6-9271-528dd64978b6	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	133	\N	\N	Chrome	Windows 7	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 16:07:01.358496
55abff9d-fb7e-435c-888f-82edc62d793e	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	191.125.32.73	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 00:28:25.210112
7c31ac54-2907-4390-bc1f-10ad5a8709af	0c7135c4-04a0-4380-a0fe-2a3f415f4900	186.37.202.178	Mozilla/5.0 (Linux; Android 4.4.4; Y635-L02 Build/HuaweiY635-L02) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	65	\N	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 00:28:15.115877
fac7022d-a62c-4931-9712-a5f7216ec6b9	83cd8847-9a42-4e25-b92e-c0be48673475	181.161.186.75	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 04:51:44.097646
2951e726-32c4-4653-9016-1e49231b013a	51ef51d2-f225-4fd7-8464-e072d4373f32	186.9.129.172	Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-21 14:49:11.278923
82a85ae3-9fd6-47f6-8220-b01a08c52ff6	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.58.68	Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/residence/new	58	\N	\N	Firefox	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 14:16:43.199794
4600970b-6ff4-4632-b858-3cc5d4bc0a18	f9bd5b89-c7bf-4b81-8803-8695b8b75bdd	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	66	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 12:43:05.160992
14aa096a-9d54-4725-8f82-9c781941beba	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.112.104	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-21 16:34:16.82273
a8c6c702-6a1a-49f4-baae-bd63c8378209	5738d5c4-77e6-4511-a028-42a5a8b6816f	200.83.137.32	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 14:50:39.496486
8efb9946-d8b1-4611-89c5-2df63c8d7ef5	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.58.68	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 14:53:28.693841
ee3b0e36-2740-4bd7-b62c-5802b5a9065a	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.58.68	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 14:30:59.229088
294f6b09-8009-415f-97c4-699339599d4f	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.115.7	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 15:26:23.573889
2e3b7c56-437c-4672-99a2-5d3b49c0424c	958a294a-cabf-486c-9d33-2b2d217ae9d9	190.98.205.98	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	134	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 16:09:29.142296
0f1cd583-71b4-491f-bc2b-5763f6edbd8c	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	181.160.155.229	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	69	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 16:25:47.104161
cd710c4b-44bf-49bf-a552-ef1ede492327	da0f6a4b-f9ab-46f3-b873-c882855ec0ac	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 16:55:57.030517
95c32248-d7d0-4073-9c43-e3d12c83c182	a2b7ac18-9996-4872-81f3-f328adf1b498	190.47.80.163	Mozilla/5.0 (Linux; Android 6.0.1; SM-G610M Build/MMB29K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/133.0.0.19.83;]	http://m.facebook.com/	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 16:59:45.898787
a27e5162-d767-4fed-a05a-67159ebd6752	130b6ca7-f5ae-4dff-ada3-75a5902d4d7d	181.73.8.169	Mozilla/5.0 (Linux; Android 6.0.1; SM-G532M Build/MMB29T; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/132.0.0.20.85;]	http://m.facebook.com/	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 17:13:52.820645
cb8ca1c1-6da8-4007-a36d-f26ad07ced22	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	1	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 16:50:35.576776
f47fe345-9c09-452b-babd-ee47af98b110	35936fd6-fbb5-43c6-a3c3-d17d94973ca7	201.214.15.179	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/133.0.0.19.83;]	http://m.facebook.com/	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 18:00:04.738037
48b1c901-339b-42cf-8975-f9c5609f1f88	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.115.7	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 16:38:17.531767
46dfa7f5-7756-46e7-9608-be04962fdde5	8f7d6f50-95e7-45e5-89ec-85987a44605b	181.160.155.229	Mozilla/5.0 (Linux; Android 4.2.2; GT-I9082L Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 19:45:38.397591
32e118af-7521-42b3-bcd8-fc75d3573d13	f6c79845-e816-477d-aee5-fbcc30bb280b	186.9.135.210	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 20:21:21.813546
b0866939-ad53-4679-9af2-5a0a85e04ce5	9406684a-2e53-4687-b6a1-035d8dab53d5	186.9.135.210	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 20:36:23.649549
43b6cbf4-ea5d-41e0-948f-3af79da0dff2	adc717f1-5337-45b7-a427-ede1f4d49725	191.126.34.10	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://mail.google.com/mail/u/0/	https://abre.penalolen.cl/users/sign_in	71	mail.google.com	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 20:44:06.130956
2aaac855-48bf-4e0c-98ec-6645a554e9da	943738a8-ff9f-4cb2-a860-00c2c01b1232	191.126.34.10	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 20:34:19.672281
c36414de-b108-4928-b550-520f0343f93b	ff54610d-3649-4ef7-add6-e0b043a45a18	181.160.61.73	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 21:26:12.351722
1e1ddc0b-4a00-4b75-bfd1-8bb89cbe0d1b	e86f83c9-a757-40cb-89d0-f21ea1f19f21	201.219.233.90	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 21:25:47.116317
b9a8a32c-79c6-4902-a7b3-99a131051677	7b37ff4f-75c3-42a6-8242-ae9558b11608	190.160.208.145	Mozilla/5.0 (Linux; Android 6.0.1; D6503 Build/23.5.A.1.291) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 21:28:59.377365
16372fe7-c8e0-454a-b230-751421e8ec19	1e08a618-4469-4c7c-b07e-97c98c25fbd7	173.252.114.118	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	http://m.facebook.com	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	\N	m.facebook.com	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 21:34:02.50985
0441a907-d879-49e2-bd5b-95423d3ea2d3	2cea1d06-6d30-47a5-9a75-f11f49f5d4ee	181.160.238.71	Mozilla/5.0 (Linux; Android 6.0; HUAWEI VNS-L23 Build/HUAWEIVNS-L23; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/132.0.0.20.85;]	http://m.facebook.com/	https://abre.penalolen.cl/proposals/5-seguridad-en-el-parque	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 21:40:22.171607
0dbd1f66-1006-43cf-ad4e-7e84f78e0cc2	c949cbef-e44b-415d-92a0-602b74d4b0c7	190.160.208.145	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	78	\N	\N	Chrome	Windows 7	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 21:40:53.285674
49785ade-50cc-4f80-81aa-16f3a306b282	89dc2f94-fb83-4dbe-a8fe-7f3cee532e96	181.160.100.82	Mozilla/5.0 (Linux; Android 4.4.4; HUAWEI G7-L03 Build/HuaweiG7-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	79	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 22:03:53.051134
17b203ae-4c9e-4fc4-9fab-304b191f2d15	5738d5c4-77e6-4511-a028-42a5a8b6816f	186.9.128.149	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 22:04:06.763415
951aa303-890f-4af6-9f6d-e91ae645a72e	07ecac8b-9b72-43e6-8397-72ad08fafa97	181.160.196.197	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	83	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 22:04:02.74894
842e5574-fc87-4fbe-98b8-81a4e573cad5	cb0a159c-1487-4166-b83b-f84b074c8644	190.160.247.47	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	135	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 16:39:48.245269
3aabb2ca-cbc4-43c8-bd4c-e3d5592d1202	9dd301cb-48a7-4445-93b9-597da6f39532	181.160.47.20	Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257	https://mail.google.com/mail/mu/mp/124/?source=nap&hr=1&hl=es	https://abre.penalolen.cl/users/sign_in	73	mail.google.com	\N	Mobile Safari	iOS	Mobile	480	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 22:18:56.676449
9ca39b73-1e48-4bb3-9de6-beca74094587	8a58a90e-b9ba-4a8e-baff-6b8deaa18ecc	186.9.133.146	Mozilla/5.0 (Linux; Android 5.1.1; SAMSUNG SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.3 Chrome/38.0.2125.102 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 23:45:44.008644
8a39fd5c-0352-467f-82be-936a214deae3	ddab99ab-aa99-497b-87fd-fa00a858ceb1	191.126.169.186	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	736	414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-19 23:47:41.812575
5d6a41de-9772-42b6-9f1d-e0bf9b994421	0ff25ca9-82b0-4828-9a8e-e584477632f4	191.126.169.186	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Mobile Safari	iOS	Mobile	736	414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 00:02:41.613875
de1fc216-40a0-4b8e-8376-dc89476cb669	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.115.7	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 00:48:11.923746
01b1eb02-605a-4925-9bd4-51cefa4785f4	0ff22259-00f3-48de-bf4d-1b06884ae14e	201.215.53.241	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_up	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 20:01:15.019845
97f8fded-483d-4c5b-b44c-d3c5cb40d547	376da2b4-376e-468d-b0e6-13ed531ec9f6	186.9.128.8	Mozilla/5.0 (Linux; Android 6.0.1; CPH1701 Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/125.0.0.22.70;]	http://m.facebook.com/	https://abre.penalolen.cl/	85	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 01:02:08.852665
c97522b1-330d-4bb3-831a-8a33f85e18c9	a4b513ce-ef1a-45a6-af1c-f47c4e7c0b21	181.160.1.145	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	81	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 01:20:29.838848
39516688-f376-436d-a930-708ea9328b8a	2abb277e-5f07-4267-922d-908d421e87dd	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 01:43:56.94376
57e12469-e246-4072-80b1-98f19ab48ce7	455fe644-c0ca-4a0c-abd1-137b9747d5c2	181.73.56.182	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 02:38:59.433397
d94a7c54-17f6-4143-8fea-63617038f890	9c8247c6-2b34-4419-a5b1-f7c426fd0105	190.160.184.61	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	87	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 01:59:44.037175
e68536f7-d0f1-41b9-aca4-9004177c6536	5fb23bbf-8043-429c-ba2e-95c805d5ecf5	190.45.79.183	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 03:40:00.970348
11a0a7c8-d965-45df-aeb2-d5dc1918bb41	e86f83c9-a757-40cb-89d0-f21ea1f19f21	191.126.53.30	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 20:25:33.441446
0a22426b-4511-44ad-b956-9bd43daf07ea	20e67d26-62cf-471f-967b-3f85084541f9	190.160.184.61	Mozilla/5.0 (Linux; Android 6.0; LG-K350 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	88	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:30:42.592357
fbf5a742-3c87-43a5-9f81-92be218495db	340e8f81-cd6e-4233-9fb1-8788f6c83cc7	181.161.196.44	Mozilla/5.0 (Linux; Android 4.4.2; CHC-U03 Build/HuaweiCHC-U03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:36:39.118578
1d8a02aa-4e67-4519-bea8-b9d815fc9aac	b4c33469-7151-4995-9a14-3592e8a9eed9	186.36.40.237	Mozilla/5.0 (Linux; Android 6.0; Lenovo A2016b30 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:36:51.680006
ba2c8bd3-ed8d-4f90-adeb-3bfbb6457d59	6de14630-5a1e-4292-b9e0-44c73e1b407d	191.125.186.219	Mozilla/5.0 (Linux; Android 6.0; Lenovo A2016b30 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:40:35.762571
22379324-bdf1-457f-aefd-a3a04f918a31	4282e065-c586-4e43-b38b-ca1fd538691e	201.215.53.241	Mozilla/5.0 (Linux; Android 6.0; MotoG3 Build/MPIS24.65-33.1-2-10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:42:35.554879
0608efd5-d5cb-43c6-ac33-363bfa47ad3f	bdc9cc7e-f48d-42cd-891e-052b1189194f	201.215.53.241	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:44:21.633457
af125c57-8fe9-4e96-a3f9-1c77f50b583b	943738a8-ff9f-4cb2-a860-00c2c01b1232	191.126.161.191	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	84	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 20:23:02.509085
26557abd-a0f8-403c-93cd-58569f1be0b4	9296af28-c2eb-4da3-859e-2d9f2a09cca4	191.126.161.191	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	124	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 20:56:11.112557
b4ed925d-e3b0-48bf-ba30-92c1d20acc27	31acc639-cf7e-4edb-aa5c-9d46e2ba1b87	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	137	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:01:47.480136
4e21c5f3-8b1e-43f4-b417-fab3de11ad4a	b4ffbfb5-809a-4a9e-86c9-01fb9c1ee30e	186.9.134.66	Mozilla/5.0 (Linux; Android 5.0.2; LG-H520 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 04:46:58.776408
74558c08-12cc-46ab-8bee-1d1637aac27a	7389d218-c513-461b-bae4-ce6483d2737f	201.220.243.242	Mozilla/5.0 (Linux; Android 4.4.2; HTC One Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-parque-hojas-secas	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 06:35:20.953788
cfc47267-b9ab-48a6-8fbc-85d1c407826e	4f0a7796-4b62-4c6d-8da7-0e399b26c99f	186.9.132.26	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 13:31:27.013228
0250578c-1678-40a0-b80b-647dfd4a3cc9	6de14630-5a1e-4292-b9e0-44c73e1b407d	191.126.37.169	Mozilla/5.0 (Linux; Android 6.0; Lenovo A2016b30 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 14:15:41.550544
cca43047-68d6-46c7-8476-8d93eecc3e3f	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.115.7	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	67	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 14:16:32.581677
38a3d2be-443f-4fa5-8ed2-675ea158bad8	9c8247c6-2b34-4419-a5b1-f7c426fd0105	201.215.53.241	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	87	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 14:17:42.50708
f1d84e06-1822-47b6-9b3e-321e2987f6d2	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.115.7	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 14:39:01.631631
e944cca5-fa85-4c6c-a553-d35115e7a7a9	fd185aa4-a76a-49b0-897d-5babf859a4da	190.161.20.134	Mozilla/5.0 (Linux; Android 6.0.1; Moto G Play Build/MPI24.241-2.47) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 14:48:39.363602
dce5ac5e-1257-4cd1-82ce-c9c910329141	0991b339-351e-4e74-9e3b-35d13995e188	201.215.53.241	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	90	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 15:48:57.816271
dcbd8ef5-89d9-4fe3-ab0f-64261a5c0648	0ff22259-00f3-48de-bf4d-1b06884ae14e	201.215.53.241	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	91	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 15:50:23.101943
d61f6761-9a2a-400d-8e7e-3e5df47b62c3	bdc9cc7e-f48d-42cd-891e-052b1189194f	201.215.53.241	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	92	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 15:43:31.314651
dbebd4e1-f2c1-422f-a7d5-a51feed4d149	6ad0fbdc-e1f6-4066-ac4b-fc0b44db614c	200.120.67.245	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	600	800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 15:54:00.984948
853431bb-9dc9-45e4-9a23-d0844d40fa7b	89dc2f94-fb83-4dbe-a8fe-7f3cee532e96	181.160.100.82	Mozilla/5.0 (Linux; Android 4.4.4; HUAWEI G7-L03 Build/HuaweiG7-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	79	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 17:43:28.974804
6b8c861c-974f-4e6f-871b-40e122f4037d	a4b513ce-ef1a-45a6-af1c-f47c4e7c0b21	179.9.116.225	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 18:38:31.293747
690ae834-9d80-44df-a884-a41e07168034	9ba942cb-e556-400d-8f1f-2e1c62f8f503	200.83.137.32	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	52	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 19:14:33.593739
e0c77f03-8d9e-4eb7-b5e8-b6b32b6f7964	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.200.23	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 19:32:16.124017
35b344d2-50ad-433a-83b1-ff358434df96	fd185aa4-a76a-49b0-897d-5babf859a4da	190.161.20.134	Mozilla/5.0 (Linux; Android 6.0.1; Moto G Play Build/MPI24.241-2.47) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_up	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 20:04:21.921562
64de9b53-b154-4a6d-9cb7-9eb0b715f14b	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.200.23	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	67	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 20:07:09.198436
e7b23008-1d62-418b-8d22-91c5c98f9193	23c8f67e-ae70-45fb-a280-5b669627dc3c	190.20.36.95	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	89	\N	\N	Chrome	Windows 10	Desktop	768	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 20:37:34.391921
7635d1e7-1d41-4d77-928e-1278911fb4c0	463c77f7-1b6c-4812-b50a-f70fbbc23b74	181.75.11.59	Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows XP	Desktop	600	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 23:25:47.708781
c99295c2-7cf7-4918-9aa1-51f486e18cfa	7389d218-c513-461b-bae4-ce6483d2737f	201.220.243.244	Mozilla/5.0 (Linux; Android 4.4.2; HTC One Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	93	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-20 23:27:15.372644
7cdc629c-0765-4d38-8bc7-aff2a4f870e4	486f3e97-dbfa-4699-af08-fa2335f840fe	190.44.112.22	Mozilla/5.0 (Linux; Android 5.1.1; SM-J320M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/	94	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 00:53:23.185693
1ac731ae-ecf1-438a-a299-1a14e7cc2e7f	528d0980-301a-4780-84c9-59ef407aee92	190.44.112.22	Mozilla/5.0 (Linux; Android 5.1.1; SM-G531H Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	95	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 01:16:18.861492
d2bf2346-dfa3-4c2c-b5b8-2d66e59a4d62	5fb23bbf-8043-429c-ba2e-95c805d5ecf5	190.45.79.183	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	96	\N	\N	Chrome	Windows 10	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 02:01:34.715753
604cab35-699f-4a69-b51a-86494ec40ea1	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	99	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 12:48:20.103304
c8e43024-b370-44a3-81db-f2d908a0d246	7389d218-c513-461b-bae4-ce6483d2737f	201.215.53.241	Mozilla/5.0 (Linux; Android 4.4.2; HTC One Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_up	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 14:06:09.213454
c1cec526-fce3-4288-b559-2f999d5d625c	ab6e9639-e85a-4bac-9f60-38e228a47156	191.116.109.222	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/users/sign_in	136	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:03:38.7018
2aca246d-3b4d-4007-bb28-93277b5aee46	5f8f7b27-ce11-4a82-84d4-6a04149024c9	190.98.205.120	Mozilla/5.0 (Linux; Android 4.4.2; Lenovo A806 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 14:28:34.295043
297aad4c-781f-4f3b-9c1e-e98d0af3c324	39ac9e47-dccd-45ed-9ccb-3f4371b9bab5	200.73.232.125	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 15:06:35.326779
9288c2e9-c429-4a65-83ab-71a00de74372	fc1a9db7-56d8-49ee-b9ca-070e68a2359e	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:06:13.90646
358206ba-a099-4b4e-be33-b48f26bc0118	a4b513ce-ef1a-45a6-af1c-f47c4e7c0b21	179.9.116.225	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	81	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 15:40:06.21906
922d0516-d0c4-490f-8b85-78a505b543cc	2abb277e-5f07-4267-922d-908d421e87dd	190.44.151.140	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	53	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 14:41:25.496062
ebb7e6a9-21e4-494f-8f68-89fce05880e5	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.200.23	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 16:30:16.51365
dc0f4522-d2e1-4f76-8d67-6cecd32642f6	39e4c48a-f54c-48d2-8475-f078ebf10bbd	200.111.22.3	Mozilla/5.0 (Windows NT 6.3; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0	https://www.google.com/	https://abre.penalolen.cl/	97	www.google.com	\N	Firefox	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 16:28:17.30154
8d65a59e-2142-47a0-93a4-88d54aec0d6f	f31b2d9a-fbc6-477a-a94d-47fc5a4241c3	181.160.198.255	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/133.0.0.19.83;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 17:13:16.95341
7839f731-1f6b-47df-8d5e-19fe6170ee59	6d859974-e0d4-4337-8f3d-825dd9f41e3f	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:09:58.653895
864644f0-21fa-481e-b6f2-e0435275bbf5	ff54610d-3649-4ef7-add6-e0b043a45a18	181.160.198.255	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 17:18:38.534924
7d2a7307-5c7d-433e-ac30-ed8f86e195e8	a0c5b77a-13ae-4da0-8ba6-964d25e24ed4	190.162.151.109	Mozilla/5.0 (Linux; Android 4.4.4; E2104 Build/24.0.A.5.14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:17:15.801452
a6be3058-be7c-4f43-a3fd-9c14c50f9aa2	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.200.23	Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	1	\N	\N	Firefox	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 18:54:59.699053
4436abd1-b55a-4db0-9a25-e42b3f4f5e20	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.200.23	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 14:13:00.452815
36a65998-412d-4170-bd12-0bb2a9647f27	2cfb0680-47ad-4318-8e79-e18d2338e8ab	190.44.151.140	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 18:58:53.554911
21eab015-3d41-477f-917e-7306429c3bc1	d3db75da-096e-4a51-ae8d-621759a6eaef	190.44.151.140	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 19:02:51.263094
91684c7f-910b-44b7-a846-a357b0047ad4	6a1f097c-c62a-4910-9f09-980d92e7e140	181.160.198.255	Mozilla/5.0 (Linux; U; Android 4.4.4; es-mx; Azumi A55T Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 19:51:55.937779
e5a38c11-7ca7-4b70-b826-b093341fef10	09194347-634e-46d8-bed6-83727eff4f83	190.160.120.207	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/	139	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:05:25.972279
dbe0543f-9071-4a0e-8ca3-90c4346da83e	73204b11-c911-40e6-bb9e-45e422bff91a	181.160.198.255	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	100	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 19:54:06.648444
63caa1d1-7181-4bf7-9654-713c259315bd	6de14630-5a1e-4292-b9e0-44c73e1b407d	191.126.24.41	Mozilla/5.0 (Linux; Android 6.0; Lenovo A2016b30 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://abre.penalolen.cl/users	https://abre.penalolen.cl/users/sign_up/success	\N	abre.penalolen.cl	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-21 23:16:57.858756
24d3857e-9a8c-413b-bcfa-4a96981a3ebc	486f3e97-dbfa-4699-af08-fa2335f840fe	190.44.112.22	Mozilla/5.0 (Linux; Android 5.1.1; SM-J320M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 00:59:05.960867
f1cdf9fc-b965-4bc1-b458-e5b757094608	6a1f097c-c62a-4910-9f09-980d92e7e140	190.208.225.231	Mozilla/5.0 (Linux; U; Android 4.4.4; es-mx; Azumi A55T Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 04:34:00.35118
28d556bc-f356-4333-ab7a-b784982e362d	ff54610d-3649-4ef7-add6-e0b043a45a18	181.160.198.255	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 06:21:27.199187
e66186b7-b19f-456c-9fc5-70082aa813c0	2cb5400b-3a22-4a3e-952d-5093de156f33	186.9.129.76	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 15:16:16.699827
076e395c-878d-44c7-9590-9f3ee1b34f1c	a3148091-5b90-482c-b003-5271cfedceee	201.238.253.75	Mozilla/5.0 (Windows NT 6.3; WOW64; rv:55.0) Gecko/20100101 Firefox/55.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 8.1	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-06 16:42:34.53381
3451d634-7a06-4a21-b893-3221a7418c62	9e717052-8951-4a50-bdce-98a4e7eb28b5	190.196.162.154	Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko	\N	https://abre.penalolen.cl/	\N	\N	\N	IE	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-06 18:06:45.791317
d0250792-3525-4fb7-8239-51828a100516	5f8f7b27-ce11-4a82-84d4-6a04149024c9	201.219.233.97	Mozilla/5.0 (Linux; Android 4.4.2; Lenovo A806 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 16:45:47.02584
35100675-09bf-4e73-8417-9b1466f51949	06372843-e0ae-4a0a-8e8a-b666d9524f0e	186.9.134.40	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 18:45:31.379577
4b68e9e1-671a-4202-bcd1-e07ab49e39bb	08876f36-4b5a-41bf-84f8-175ca77cdc23	186.9.131.61	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 18:54:18.634958
36f330c1-3337-455d-9e84-fda07932032f	943738a8-ff9f-4cb2-a860-00c2c01b1232	191.126.177.32	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 19:36:33.756284
9f30a870-6621-4dac-911f-ca77573c3e5a	abb26a5d-8f39-4ae0-b243-793265898b03	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:21:18.871654
36f6a8bf-937c-4157-89b4-22773b6d0235	0952c33a-cb2b-419c-bace-f55edeba0b47	190.107.226.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	54	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 19:48:01.426547
e75da2b7-e86f-4d5f-996c-95f43e503d3d	b00a5322-e0e2-4bfe-831c-c7338fefe586	191.125.39.131	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G610M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 19:52:25.039474
4674115e-26da-48f1-a2b1-14cc724d8631	864bde17-9e0b-4eec-95e8-df18ea59f0ac	179.9.126.191	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:04:13.06221
2c0dddfe-b13c-4ca9-bca5-143b11ead9a2	768818b0-10ac-4e81-a6ab-539a9b024dcb	191.125.4.185	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Mac OS X	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 19:46:10.109816
ee3ef2a2-17e5-4c4f-8414-4522a59efe64	81711bbf-e522-4996-b704-53b90119216e	191.125.4.185	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	56	\N	\N	Chrome	Mac OS X	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:26:44.809132
6a90b9f9-9e6c-47eb-bd34-2ee35e1abc16	460e4f79-03db-414d-bb85-ee574a53e43d	191.125.4.185	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	69	\N	\N	Chrome	Mac OS X	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:28:11.631485
a806f216-0bd5-4662-b38e-afc92a20baf3	da5bb332-163d-4519-9e77-ae6df8cb0fd9	190.164.143.155	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:35:18.473958
a94b9869-dd29-4e88-9d5d-e6d5df0e89fd	95a8f598-5258-4e83-9e37-870521667f30	201.241.186.205	Mozilla/5.0 (Linux; Android 5.1.1; SM-G920I Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	105	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:16:15.725348
3bd86818-f72c-4d2f-bc86-8bdbd4d535e6	37f1aba8-37b6-4709-ac06-720e9207fc9e	186.37.202.161	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:44:42.592116
774e591e-c2f8-4498-84cb-0e1b169f575b	b5a3c331-0aaf-4acc-aa76-88b734a96395	190.164.143.155	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:46:40.236868
9bbdcf01-cf3f-4f05-8868-6beb446bb455	28a25c84-90e9-4d79-b629-e6710c40094d	191.125.30.150	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	106	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:46:53.879751
f1859a74-43b2-47cb-8751-4d1650c5dbb0	b9f926c7-cfc8-413d-aa29-b5e53c9a6025	191.126.133.73	Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko	\N	https://abre.penalolen.cl/users/sign_up	\N	\N	\N	IE	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:57:26.583939
9c8ad6a9-719e-4a8c-beae-800d8b91dadd	15ad2340-5bcd-483f-a7b9-dcc203a3d6b8	191.126.57.26	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	108	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 20:52:34.839208
10f2545a-4567-48b1-9bb0-c308b2340722	b5300882-3f49-4e37-9df3-3a9c11d83ef7	186.9.132.232	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	https://www.google.cl/	https://abre.penalolen.cl/proposals	\N	www.google.cl	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 21:19:05.277214
2c56a70d-7bfe-4693-9162-1f418c6ce65c	e86f83c9-a757-40cb-89d0-f21ea1f19f21	190.107.226.32	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	82	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 21:36:50.281773
acd9aa51-27f6-48bd-bfaf-97783b6ad76a	34cecdcd-4083-47eb-9cc3-3d016c94edd8	181.160.38.54	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	103	outlook.live.com	\N	Chrome	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 22:02:09.801972
1922590a-e5cb-4aa4-8ab8-485d03b53501	1b5cfe7b-d51c-4df4-a1c9-20c895724671	181.160.186.11	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	109	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 22:04:49.961872
9ec6bd62-e5dc-4044-a592-f66e9bc05e0a	00679568-ba1d-463e-9613-47e635740594	191.119.127.6	Mozilla/5.0 (Linux; Android 6.0; 5045G Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 22:27:46.807109
5ee74c10-6d3d-4298-a652-b9a47d9a21ad	5738d5c4-77e6-4511-a028-42a5a8b6816f	186.9.134.93	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 22:36:53.979706
b9c89bd1-a598-414e-8b79-15fcfedbf1a9	510c7fb3-8206-4c6c-91b2-0d4c9a701249	181.160.143.212	Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G930F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-22 22:49:49.984306
d13345ec-488c-4489-983f-f1c0b8dc7627	95a8f598-5258-4e83-9e37-870521667f30	201.241.186.205	Mozilla/5.0 (Linux; Android 5.1.1; SM-G920I Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://abre.penalolen.cl/users	https://abre.penalolen.cl/users/sign_up/success	\N	abre.penalolen.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 04:30:45.408217
8c08c92d-70f3-48a9-a2de-20f5a783cf6a	05b85423-14d0-4105-9686-2bc7a64a0f1d	181.160.8.69	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	116	www.google.cl	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 15:32:00.394718
c1a51ce1-9657-409e-b16d-d7e8ad08d1be	95a8f598-5258-4e83-9e37-870521667f30	201.241.186.205	Mozilla/5.0 (Linux; Android 5.1.1; SM-G920I Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://abre.penalolen.cl/users	https://abre.penalolen.cl/users/sign_up/success	\N	abre.penalolen.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 16:12:06.07684
0036671a-e0e4-417a-a97b-912115e8a289	2f727b1d-0171-42d0-8de4-ff7263c60482	181.160.118.219	Mozilla/5.0 (Linux; Android 6.0.1; SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 17:31:52.842725
9e974722-a348-49b5-a371-80c570586d2e	431df6ff-fa70-46e7-a81c-3ea2ff34ba0c	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:24:40.948394
a150f500-d3ca-4908-86c8-425e5f58f409	864bde17-9e0b-4eec-95e8-df18ea59f0ac	181.160.118.219	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	101	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 17:36:39.460711
0f90d7b2-7789-4c40-ba36-420ebe4604e9	e7bd49e1-60c0-40de-a62f-67739594717f	200.104.149.132	Mozilla/5.0 (Linux; Android 7.0; SM-G930F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 18:18:18.493326
09876a8a-85b2-45ff-9497-eec0c270dab9	8f764f27-fab6-4096-b678-cdedf3b90148	200.104.149.132	Mozilla/5.0 (Linux; Android 6.0; Lenovo A7010a48 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	117	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 18:16:27.635209
5daff9e5-839a-412c-a603-b793abdb559d	5b85759e-531f-4b4e-817a-afd1ff4bb235	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	143	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:41:17.567445
85aa116c-2897-4a87-b632-230c227aa0c3	1921dbe6-f78f-4c7f-afac-69ca9d1a1675	190.100.9.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	119	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 19:55:49.504035
0f6d3a32-d1b5-4429-b103-b538201dddf4	14a306b0-98d4-4f34-857a-b225225a298d	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:45:20.441311
d84e66f9-5998-4422-bf6f-d572f45f1f2d	34cecdcd-4083-47eb-9cc3-3d016c94edd8	181.160.70.125	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	103	outlook.live.com	\N	Chrome	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 23:10:16.813332
d8512933-bb9a-4545-8234-48ac4b5018ae	696c3b42-de63-4f41-ab77-94a58b248066	181.160.8.69	Mozilla/5.0 (Linux; Android 5.1.1; SM-J111M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-23 23:40:59.017193
521ed7c3-ca31-44f1-b416-9bfbc19fc516	6cbbc37b-b589-47c8-8abb-1dc52e56f633	186.9.128.165	Mozilla/5.0 (Linux; U; Android 4.4.4; es-us; GT-I9060M Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	120	\N	\N	Android	Android	Mobile	800	480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 00:17:07.653175
769244d8-85b7-4763-b564-b26faf7bf221	9c8247c6-2b34-4419-a5b1-f7c426fd0105	201.215.53.241	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 00:20:22.013912
6e92f9d0-5239-4dd4-95b2-b4519af6a0df	546e39ca-422b-41db-b92f-60efc3a36ab4	201.238.232.29	Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko	\N	https://abre.penalolen.cl/users/sign_in	114	\N	\N	IE	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 12:11:28.003676
066b8bef-5240-4bdf-8c31-6fff306f439e	ecf5ab9a-74b5-4932-988d-32ee07c0d601	186.9.135.99	Mozilla/5.0 (Linux; Android 4.3; OWN S5030 Build/JLS36C) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.91 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	144	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:55:01.643127
6ddbb2b9-a9ff-44a1-80d0-9ff2a490be28	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.246.191	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 15:58:45.859176
28dddfed-7704-46aa-93de-b842efad6159	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.246.191	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 14:57:13.8027
e37bae14-6664-408a-a3bd-8fae0861d48b	8d07bfaf-dde4-445e-b0e3-ca81acb7a071	186.10.20.154	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 16:16:07.432936
aa127f43-1323-4e1c-b8ae-1e1863d13966	9597a4b8-4068-4f15-b117-cbe0fcc3f403	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	144	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:51:36.612013
07879620-7828-4b41-82a7-9cc6a889e00b	815bfeb4-4150-46f9-be72-fb38b7ac8fb3	191.114.101.52	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/comments/4	121	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 16:25:42.726987
55d5817d-7e3b-4f18-ac3a-04ae1ff79d65	a982e278-b650-4122-9d22-ba6da2c6f22c	190.107.226.251	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 17:17:43.149701
6c9f7847-da02-413a-9690-aa218c6429c6	b3cc7af7-5457-4c38-bc0f-8f70ca7fb6a1	201.214.188.131	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 17:35:38.447456
fc3fb2fd-7427-43a4-b4ba-fc3a8e6c600a	02768427-1e81-4588-a4ba-31402e95031e	191.126.53.30	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	141	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:17:53.500102
4e6ecb1f-8e5f-48f5-a9ec-ccbe4d399126	1b3602c1-fc00-4106-a25f-928f16bbe161	191.116.129.45	Mozilla/5.0 (Linux; Android 6.0; LG-K350 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:08:01.645658
e0ac9a68-89b0-4a8e-a0da-2f7402c51546	34a69dbc-b921-43d1-931f-14a9add956c9	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	146	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 21:59:44.964408
834c7fe9-7a5a-422f-8abe-4b038162c9d8	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.208.185	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 16:30:38.624519
63ede9a2-937f-4e4b-ba37-8208d8bbda07	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.197.229	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 17:41:34.213084
73d02cf1-9f2e-40a1-858b-e394848ffee9	0ff22259-00f3-48de-bf4d-1b06884ae14e	201.215.53.241	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 17:58:12.908112
ebd9af66-16ea-407a-aad8-8762ac3e84c7	e057a9a3-9d17-4883-8957-7fcded40e7ad	200.89.66.213	Mozilla/5.0 (Linux; Android 5.0.2; D2533 Build/19.3.A.0.472) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/47-cultuparque	\N	\N	\N	Chrome Mobile	Android	Mobile	854	480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:23:28.077016
be178ca6-6b06-4889-ab56-d89cf900c4be	486f3e97-dbfa-4699-af08-fa2335f840fe	190.44.112.22	Mozilla/5.0 (Linux; Android 5.1.1; SM-J320M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 18:03:55.836962
2625ee83-bdbd-420c-b795-edb0c0f74e7c	b2670a8d-5a3c-490f-b077-ccb11d6f95f9	200.83.189.146	Mozilla/5.0 (Linux; Android 5.0.1; ALE-L21 Build/HuaweiALE-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	122	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 18:02:39.539231
1470dd16-35fd-4952-9912-07865724a806	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 18:38:26.417448
63dc3cf1-6c58-40c7-aea2-4d1b819ae835	7830ca46-697b-43cb-a988-72b632b9d15c	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://mail.google.com/mail/u/1/	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	mail.google.com	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 19:18:37.997212
7cae84a4-be31-425e-816a-a44f93fee4e0	0ca193a4-85ef-49aa-85a1-b216fdc3ffb0	191.116.91.209	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 20:05:29.603013
6259d4f1-bdc4-423c-986a-fe7306f1ed8a	00150537-722c-4303-9278-de9ead07cb10	190.107.226.61	Mozilla/5.0 (Linux; Android 6.0; CAM-L03 Build/HUAWEICAM-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 20:06:36.654649
75b35ea6-c614-4b84-97a2-d1a1d4d09f33	943738a8-ff9f-4cb2-a860-00c2c01b1232	191.125.177.131	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 20:53:46.214622
654a01fe-9aea-4867-a3ce-0f205e160206	f5a8d64d-d587-48b7-843b-3d889386b9dc	200.83.90.191	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 20:56:55.833447
31e63f92-7930-4009-9d0e-bd75ff3b54e0	c936763d-4995-4413-834e-792af1bbe40a	191.126.170.185	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 20:42:34.400884
983722bf-04ff-4999-b6e4-57711fb50ed5	5be4b5f5-987e-4108-98f4-ea4e09daa049	190.20.12.50	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:51.0) Gecko/20100101 Firefox/51.0	\N	https://abre.penalolen.cl/	56	\N	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 20:59:38.565268
a2d8c21a-7bdb-40a7-9076-a3f9e1249871	d989af4c-acf0-41eb-9d3b-4a7ccb4e6e51	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome	Windows 7	Desktop	820	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 21:25:21.861116
2be6ba1c-159e-4383-814a-f0d44212b4f3	207029ca-ffc6-487e-b16b-2d20ea74049d	191.126.45.63	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	124	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 21:37:38.417971
77524573-1663-4dcb-98fa-c8d2390261c7	51c24be3-db81-4c62-86e2-3a9886a1f515	191.126.45.63	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	124	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 21:41:38.601842
bb47f79d-4567-4276-9108-0e3fe359ae4e	e83e81d3-bf1d-4432-a899-fce5a51c0bf0	190.20.197.229	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	125	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 19:32:53.684567
160c5a30-dbe4-40f9-859d-d6700ce35668	eb471904-cc42-4df0-897c-a39cc98bfc28	191.125.177.131	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	126	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 21:51:09.438807
0e95cdb5-094b-45a2-a270-cd40836beffd	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.12.50	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	54	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 22:03:49.945597
927eab80-b72e-4d4b-a2ad-6f8a78740d89	769ecc8e-dc79-4edd-a011-bfd49c92034f	191.125.177.131	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	127	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 21:59:40.761443
aee75a51-0606-435a-8e5e-16b8e052ff49	15184d0d-21b5-4e68-96e7-4de9ee43eed4	191.125.177.131	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 22:20:38.923449
84df95dc-2484-4f53-86a1-f15ac16b67eb	935efb4a-18df-4a31-aa4a-6b74b9507867	191.125.177.131	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 22:42:04.392805
72bbd7e1-6afd-4a8e-becd-bcc3b9075a4c	ff54610d-3649-4ef7-add6-e0b043a45a18	191.119.5.7	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 23:14:34.144387
3cadd8b4-f6ce-46f5-855e-80e22bf7ae52	95940032-e88e-4054-aa11-1605b33317c8	181.73.57.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	128	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 23:19:10.63108
03d2a210-e797-41c2-87dc-371bfcc4c5c6	463c77f7-1b6c-4812-b50a-f70fbbc23b74	181.75.11.59	Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Windows XP	Desktop	600	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-24 23:20:58.131381
0c627a3e-eb6c-42d5-9ae4-e4cff4819b6d	14966e92-32e6-4925-aca5-2646a85ca7bc	186.9.131.40	Mozilla/5.0 (Linux; Android 7.0; Moto G (5) Plus Build/NPN25.137-15) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 00:14:06.537169
02b9e5e4-f854-480e-a0bb-e2ed2a4d3777	ff54610d-3649-4ef7-add6-e0b043a45a18	181.160.69.92	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 05:54:03.786218
d4a21aa6-68fe-4301-a5a6-2555bc378f41	ff54610d-3649-4ef7-add6-e0b043a45a18	191.116.23.148	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 13:40:19.709528
2e67197c-9448-4ab2-9edd-fbabbd543bbb	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 14:00:34.322792
49c39200-784c-4e8f-9f50-8c8543c1259a	e83e81d3-bf1d-4432-a899-fce5a51c0bf0	190.20.12.50	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 14:33:44.144801
e729a984-8c82-4e97-bdcf-219508fb5c2b	e2be0261-25c7-4eca-824c-b500e8bbb428	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	149	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:23:51.968741
b13abde0-8854-47b2-81b3-0bc4b36a7a69	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.12.50	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 14:37:43.395406
d941c49e-c79b-45b7-8215-1528578acafc	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.146.73	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 15:41:30.269234
c81e8284-0940-4efc-8813-5e49fbc81af3	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.146.73	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 15:44:07.183791
5ed01981-906c-438a-9cbd-b66c22b9744f	15e7853d-d0f3-4724-8b15-84a2bb27b8f9	190.20.165.246	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 17:08:30.037414
f8885823-fc38-4ae3-94ce-305f92bd83ce	18ed254d-39f8-4960-9262-30ecf6739d8f	190.20.165.246	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 18:42:00.442735
0bdbd2ef-7328-40b2-9373-618d7e86af1b	14966e92-32e6-4925-aca5-2646a85ca7bc	190.47.131.119	Mozilla/5.0 (Linux; Android 7.0; Moto G (5) Plus Build/NPN25.137-15) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	129	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 19:08:16.452318
6d250fca-cf40-42e4-b244-842ce21d885f	2d147497-e932-4f90-bdc6-7d2dce91c3be	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	150	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:30:01.612711
61586dc9-bd7a-49be-a734-5de641c64777	74790b4b-d65b-415d-9729-0643544ed6d8	190.47.131.119	Mozilla/5.0 (Linux; Android 5.0.1; ALE-L21 Build/HuaweiALE-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	130	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 19:15:31.728876
6f8b5da9-3300-4ed4-8acf-a49519f3ff5b	5be4b5f5-987e-4108-98f4-ea4e09daa049	190.20.165.246	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:51.0) Gecko/20100101 Firefox/51.0	\N	https://abre.penalolen.cl/	56	\N	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 20:22:01.212547
c2a44537-3939-41de-8b64-c7a71ab40953	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.165.246	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 20:22:40.990777
52b91bbf-09b7-4401-a06b-78788d0adad2	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.165.246	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	53	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-25 20:22:45.350778
07367109-8a31-42fe-813b-f91b36a5eef5	4daa4b42-8dd5-479c-84c1-e59d4496a1be	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	152	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:49:58.25815
7784ec0f-cb70-4643-a282-da4f569d1bc4	5e42105e-3b6d-4113-b21e-4656b0583e15	191.125.133.117	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	153	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:55:24.656226
c14c5806-5872-484f-97f8-84f22451b4f0	bc67c829-3f82-4e64-924f-ab81cc518c3e	200.89.69.32	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	154	www.google.cl	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-26 22:56:13.254669
afe7e4ca-461d-4ebc-b36f-c686042def4c	b3f8cca6-707e-419e-803b-c56b8b72331e	200.120.65.247	Mozilla/5.0 (Linux; Android 4.2.2; SM-T110 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome	Android	Tablet	1024	600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 00:46:40.061425
d86daf24-78ca-49b2-b3ba-55590b8dffd2	b5b821c1-a20d-451f-8462-7635dd8d5834	181.73.57.72	Mozilla/5.0 (Linux; Android 7.0; HUAWEI VNS-L23 Build/HUAWEIVNS-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 02:59:34.641942
4c0ea1fd-0492-48ef-8d7b-22f2dca9edb8	f6c79845-e816-477d-aee5-fbcc30bb280b	190.20.168.31	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 14:45:30.162526
2cf6f74b-d5fb-4d8f-89f6-28eab5161149	e7f15cd6-054d-4268-9716-5aefa718d8e7	201.215.190.75	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 16:46:57.098686
d65e1911-3936-4134-9dac-2e468eed584c	cb759d8b-31bb-4311-b8ce-148017894588	200.83.189.146	Mozilla/5.0 (Linux; Android 4.4.2; G735-L03 Build/HuaweiG735-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/users/8/direct_messages/new	157	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 17:03:14.887464
f6086494-2d17-428e-8097-1d0163b62850	e83e81d3-bf1d-4432-a899-fce5a51c0bf0	190.20.168.31	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://abre.penalolen.cl/proposals	https://abre.penalolen.cl/proposals	1	abre.penalolen.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 19:57:25.224088
0658c796-12b3-4d32-ab2c-e5cddf92b6a6	f6c79845-e816-477d-aee5-fbcc30bb280b	190.20.168.31	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 20:04:49.635421
afc227b9-51b7-499f-b4fa-a73670049396	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.18.185	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 21:01:54.040861
dbeaf51d-1393-48a1-a53b-18789ef0c9c7	4b60906f-c0ba-49a5-b3f8-16744a107f26	190.20.18.185	Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	https://web.telegram.org/	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia	\N	web.telegram.org	\N	Firefox	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 21:30:46.416005
949ce810-bdf7-4357-88be-12a98912e821	f5474900-dce9-46e3-b7cb-ae2e51deaed1	201.219.233.230	Mozilla/5.0 (Linux; Android 6.0; CAM-L23 Build/HUAWEICAM-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-27 21:31:25.105761
6f5515fa-af67-4850-a3c0-0d6f90f156a7	4dbd85e8-4ccf-42fe-af47-6a83b3a2956c	201.241.180.120	Mozilla/5.0 (iPad; CPU OS 10_1_1 like Mac OS X) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0 Mobile/14B100 Safari/602.1	https://www.google.es/	https://abre.penalolen.cl/users/8	\N	www.google.es	\N	Mobile Safari	iOS	Tablet	1024	768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 01:48:56.966899
433feda5-15a6-4aa1-8794-0300a2d3018c	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	181.160.92.39	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://m.facebook.com/v2.8/dialog/oauth/read	https://abre.penalolen.cl/proposals#_=_	\N	m.facebook.com	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 02:40:26.200495
ad428a94-0cf3-446d-baaf-a1cde80a32cf	73204b11-c911-40e6-bb9e-45e422bff91a	181.160.78.211	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 04:58:15.558122
60f39bc9-afd6-498c-8e68-cc51e487c989	ff54610d-3649-4ef7-add6-e0b043a45a18	181.160.78.211	Mozilla/5.0 (Linux; Android 6.0; LG-H540 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals	80	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 06:12:08.717603
6ec259f2-f5c4-48d7-b32b-eec5ecc5500d	cb759d8b-31bb-4311-b8ce-148017894588	200.83.189.146	Mozilla/5.0 (Linux; Android 4.4.2; G735-L03 Build/HuaweiG735-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	https://abre.penalolen.cl/users	https://abre.penalolen.cl/users/sign_up	157	abre.penalolen.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 12:28:58.104925
dfaee0d2-71a0-4409-8c58-b584c06cd37d	559f3963-ed7d-4588-aced-c5e9cab86710	186.9.130.69	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 15:15:50.001921
1d0630fb-f40d-46dc-87e7-0f2e2fc017ce	7b6a7cd9-806e-4c58-b883-af4fdc299cb9	181.42.28.99	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/comments/4	\N	www.google.cl	\N	Chrome	Fedora	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 16:21:19.41195
78fb63e6-7741-48a8-88e2-8d011d8170ac	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.130.151	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 19:46:56.788432
026f509d-e463-411b-bb3d-f1880aa66c35	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.18.185	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 15:09:33.541883
221c4bdb-625f-4a3b-be37-6acf33f269f9	5ebe8a65-7560-44bb-9771-310d01ccf2a9	186.9.130.69	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 21:59:04.601615
3b0e397e-fefd-475d-a87e-60485b830024	9c8247c6-2b34-4419-a5b1-f7c426fd0105	201.215.53.241	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 22:25:11.204321
58b06303-1a6d-43bb-9e6a-8d5ee1449dc6	e83e81d3-bf1d-4432-a899-fce5a51c0bf0	190.20.54.187	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://abre.penalolen.cl/admin/stats	https://abre.penalolen.cl/proposals	\N	abre.penalolen.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 22:34:54.637925
e00edf8a-c3a7-40d0-b625-5699ee2fddd7	0ea7c185-1211-402a-a10d-c77c78fb379b	186.9.131.95	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-28 23:22:54.222076
ead07b29-ff84-4b70-bff2-3e4690baf5ab	1921dbe6-f78f-4c7f-afac-69ca9d1a1675	190.100.9.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/comments/4	158	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 01:10:17.602539
4d5c17ba-4424-4431-a5c6-dd52f5abc04e	2abb277e-5f07-4267-922d-908d421e87dd	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	53	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 01:54:53.936046
cbcfcaf7-f5f8-433f-997f-b49dc03f86a6	cea80478-a919-4d85-b3b0-4444048f129a	191.116.33.173	Mozilla/5.0 (Linux; Android 5.1.1; SM-J111M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.91 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 12:23:30.762993
0688ade1-a095-48e8-b6e6-6b11403f92c3	291a4a88-d078-4497-9fb6-7b527879efad	191.116.33.173	Mozilla/5.0 (Linux; Android 5.1.1; SAMSUNG SM-J111M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.5 Chrome/38.0.2125.102 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	159	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 12:51:06.109346
1ff95450-7393-40d3-a216-81e58f6d1a62	c96f3364-8efa-46ed-853b-febe953a4da5	201.215.190.75	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	160	\N	\N	Chrome Mobile iOS	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 15:22:05.626231
31fff759-40de-440d-8a80-0b3bf0425507	3533aa07-91a8-4b44-adb7-80e04c619223	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	161	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 17:56:55.061478
4d7c7ff1-b659-4982-bac1-29258867d39c	2ecef3ab-949f-4254-a9ef-912c07d3d98c	191.125.33.232	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	168	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:01:16.708493
9c405fec-34fe-490d-a3ac-00e65604f478	4f61ae66-1476-4333-a08f-ded7451e30cc	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:03:00.633994
afbf9aa4-32a6-46e5-a411-ccc907be2cc7	79322b6e-4213-410a-a41d-fe72ecee194b	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	8	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:01:34.557022
18d25eff-e5b4-488f-b6f5-1f076a4feb1e	780c70ba-ac17-4b2a-88f9-a2bfe33ede46	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:13:49.974727
4bc910bb-c2e2-4d4b-be5c-958b67a658a6	3ed7e096-9ea3-4a33-bba6-019e1846261f	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:15:17.209221
343efc4b-c8d1-478d-9315-174963a66f7e	df47430c-33ae-4f7f-86bf-c9328a048846	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	65	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:14:36.23497
01037b8b-375d-41bd-a328-3f3243de3ff5	f7a9a600-322a-486b-bfe7-ff4a2e42a4ed	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	69	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:17:02.809019
062ece7e-d29c-4891-8b5e-18cf9651806e	1b69fb10-25a6-4e7c-8634-399b5302298b	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:19:07.415942
085d0052-af5e-4a1f-a8c6-0fbf0d1a432f	c7f8e818-3f19-414e-a7b2-f81608e947a8	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:21:12.936631
ba037841-4ae5-4cb3-a1d4-5395050e4aa5	fefbd8cb-72e5-42fc-836b-2625530a04db	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	164	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:22:53.848924
3d86e7bb-f0f1-4bae-ae53-83335d4ee71c	de88bfa3-82a3-4810-a3f5-cc06395b670c	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	163	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:22:22.025537
c425c238-0a21-4181-b0a0-7d98101a481a	9ba081a9-68c3-4558-88b4-c368e78e42e6	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	165	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:25:20.073524
66df52ca-27f3-4a8e-9940-37d2328db770	1f18e737-2e31-49be-82a6-5dd041d2ce50	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	164	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:28:41.126266
71c765bd-a421-4bf6-a601-7bb72f60d3a9	264897ad-397a-4f25-9626-4f29bb8c6e9e	191.126.147.10	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:29:31.297409
891a31a6-5720-4ace-80d6-242550e4ac1e	0870008e-779e-4210-809a-b3d1f4b35ce1	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	167	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:30:08.884942
4d6a3ee4-81be-46c9-b405-4c7fc5f9341f	a94cf819-0dac-41e8-94b1-b2273527d3e4	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	167	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:32:30.94929
764a19e9-978b-4656-97fc-86dfd1b1a7ba	ed4628d9-00c5-4ef9-9e9d-67481396a074	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	167	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:34:22.59475
c4787e07-356a-4b3a-8e03-2daef4c18b6c	38a464e8-6694-40b3-8f4e-cc1ae63b09b0	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	169	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:31:52.253571
74d33763-8226-4ef4-9e1b-8a140e04cf2e	48779f87-8f1c-4dda-ab6d-49129e200381	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	170	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:38:39.771687
b162accf-d484-477a-b7ae-efcab7492236	8797fa62-2c3b-4598-8367-ceef1189a739	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	171	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:39:37.116118
b4600e21-2f89-4b93-8025-45410af92743	85d993c8-86dd-41a9-86bf-e7bd068036f7	191.126.54.134	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	99	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:44:12.083543
eeaacd43-eba2-4706-ab6f-113e234a7cd1	23cd7ef9-0516-4e4d-adfa-fc3bfffeeb30	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	172	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:45:17.721159
fa564e96-b4fa-4f45-83bf-45eecfa98432	121ed36c-c373-469d-a77a-9933c42ba550	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:54:02.237666
36a2eda6-169a-468b-abad-88f8b73542bc	e86f83c9-a757-40cb-89d0-f21ea1f19f21	191.125.181.205	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	81	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:44:31.389814
65d81658-c1cd-48ba-8255-20fc8e40b3a7	943738a8-ff9f-4cb2-a860-00c2c01b1232	191.126.136.32	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	84	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:43:47.552625
9439d396-dadf-4615-af66-ae32ff68e685	fa914856-3f6f-49eb-baa9-f44015406c51	191.125.156.14	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	176	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:55:59.050369
90fe95f5-dd39-46c6-abeb-109fe44c7584	f879f7ec-72ef-44c0-9c5b-a33defa33271	191.125.181.205	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	178	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:56:28.644885
55dc388a-2e8e-46e8-ba59-cefd2e92e931	b8d92fd5-8d36-4868-b7b1-c95d07b09cf4	186.9.134.112	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/users/sign_in	173	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:59:01.864954
5ad9ee24-aecc-4ad1-8730-5634cc2c26be	6ab932b6-ec53-4ec4-bd07-5de842c3969e	191.126.52.246	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	180	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 18:44:37.498588
417641b0-44a4-4c5e-9566-fc1b13b2cca9	8dabf0b1-c79b-4d22-a6ee-c55ef6dbf677	191.125.168.176	Mozilla/5.0 (Linux; Android 6.0.1; SM-J510MN Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:15:42.504561
a6e1bec6-b5df-41ad-9a0b-0a0c315fd3f0	2dfcbf8c-def1-402e-938b-6e59595f6b83	201.219.233.194	Mozilla/5.0 (Linux; Android 6.0; F3113 Build/33.2.A.4.72) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:17:22.857116
5bde22d8-840a-4285-89d5-955468f7ce31	619ac29c-0b4f-4279-a0a3-7d9b672f0d44	201.219.233.188	Mozilla/5.0 (Linux; Android 6.0.1; LG-H840 Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:19:08.20434
c413b199-b088-4bc1-96b9-1c3466b0f9b6	5738d5c4-77e6-4511-a028-42a5a8b6816f	186.9.135.249	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.72 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:20:47.495269
1a70792c-f772-4e7c-8a60-2d14a3bdb262	931d2767-38a0-4645-bbe7-d66af2963d9b	190.107.226.18	Mozilla/5.0 (Linux; Android 7.0; Moto G (4) Build/NPJ25.93-14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:23:48.228536
a7eef9c0-0176-47c2-887c-26affcc33144	5d42e5bc-14c3-4604-b38e-65266c9ef794	191.119.9.117	Mozilla/5.0 (Linux; Android 6.0.1; HTC Desire 10 lifestyle Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:24:34.941296
86ed4e21-f0c1-4283-98ef-bba2c49a4e6d	522a7912-b892-46b1-af43-a33fd511b6cc	191.125.155.190	Mozilla/5.0 (Linux; Android 6.0.1; SM-G925I Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 19:26:26.659812
9def2d00-cf9f-4448-a968-97e31d55516a	a093355f-1705-4034-97d6-6bcd406b9e97	191.126.160.62	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:04:18.297089
38fe8c26-40c7-4bd0-bea7-8e1073c34719	354ce13c-f13b-46b4-96aa-9d0b8b44b02c	191.126.160.62	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:06:12.687489
83abd3d3-9d0e-458a-985a-0b31ea5a5d0c	9080650f-105e-4c09-806f-76ebba807b3c	191.126.132.215	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	186	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:05:27.713502
f1d7d8cc-ea92-459d-bb06-645e6b33fd88	9889be26-59f9-4fd6-80ae-43ef40ab99f5	191.126.50.159	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	41	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:13:00.945313
5e2afa24-d2f8-4835-a13e-cad338771042	cb54229f-ffb5-4d77-a0d6-1e99c2f9b82e	191.126.29.21	Mozilla/5.0 (Linux; Android 6.0; LG-K350 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:19:44.657088
a8f4b935-94f9-4b72-a974-2964242b1ec5	ba6c7e25-2f45-4a9f-a013-18a008294799	191.126.227.183	Mozilla/5.0 (Linux; Android 5.0; E2306 Build/26.1.A.3.111) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:23:34.966708
20347db2-a5df-44ce-aea7-c037026a6bcb	d2c11b76-7206-4f93-9029-d966142387ca	191.126.227.183	Mozilla/5.0 (Linux; Android 6.0.1; LG-K240 Build/MXB48T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:23:45.675899
04a4a6b8-2527-4f43-bf2a-c4335ee90faf	80303212-4aee-49df-a073-5e292900b56b	191.116.117.69	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:33:18.093898
fa4d842b-233a-460a-a08b-2cbc367ce797	1239f264-d7ba-4358-bc99-4e3fa190340f	190.162.218.131	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8	https://t.co/7XG9CmBaIK	https://abre.penalolen.cl/	\N	t.co	\N	Safari	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:36:38.472919
3b3a1233-112b-49b8-91fe-d53153c6d79d	409290a4-4414-4645-ac04-b8fb8b5b4870	191.126.58.175	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	196	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:37:08.13721
d49eb974-a056-48d0-bce5-8fcad617c26e	34f2fff6-1b1a-418b-8280-a2365973aacd	191.125.42.58	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	195	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:33:47.583995
65b19c38-5d09-434b-ac50-a785b99fb0ca	00a6ae8c-f455-4fbd-8bdb-2d12d69ab2de	201.219.233.26	Mozilla/5.0 (Linux; Android 6.0.1; LG-K240 Build/MXB48T; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/134.0.0.25.91;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:42:26.905409
cfce384b-7013-49fa-83c7-721fa8dd1f2e	83be73de-ff68-4678-8813-e29cf7a360fa	179.57.114.117	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14	\N	https://abre.penalolen.cl/	\N	\N	\N	Safari	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:49:32.887647
34e29d31-baa0-4420-91dc-87ffcb66b6c6	3a8db188-90e8-4f09-8c10-a3f52f933635	181.160.126.5	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	197	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:47:37.913216
8bf9cbef-ddb3-4ea9-ada0-e3b3cec65292	6535051a-20c1-42ad-92bf-7fec76b270ec	191.126.58.175	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	198	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 20:46:48.130265
afd98788-45ad-4b5e-ad6f-a4ed0e085c32	78c73ca9-b50c-43fa-b858-f2415a72af06	186.9.129.41	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	\N	outlook.live.com	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:06:59.865649
e36c3dd9-5cba-4bf0-9fa3-4f2df92155e5	ef5e2021-00dd-4722-8bf9-558e7cf14ee4	179.9.107.112	Mozilla/5.0 (Linux; U; Android 4.2.2; es-es; GT-I9082L Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Android	Android	Mobile	800	480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:22:21.34252
ee499a88-4351-4c80-ad45-232089dc9985	a2957c66-94e5-40fc-b541-f8e225aab88f	191.126.132.215	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	37	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:24:19.052493
caf74f69-aeff-44f2-be7c-116e06c18031	c53f8559-70ab-48c2-96ac-0b9fbfa52414	191.126.163.197	Mozilla/5.0 (Linux; Android 5.1; E5506 Build/29.1.A.0.101) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:39:58.494968
f77028ae-1bd6-48ff-bc7c-452adbc11502	002030df-5ce2-43a1-863f-e20c24cd1bf2	191.126.12.235	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	203	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:37:37.727972
81d21dd0-e4f3-4808-a973-d41f09d88435	d3a0440f-9b55-435f-8c27-4c2019de1755	201.246.221.240	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://t.co/7XG9CmBaIK	https://abre.penalolen.cl/	\N	t.co	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:44:32.673015
d7631b89-2643-471d-a221-1ecb9c3cffe1	f62c0587-1b12-4229-a77f-aec62255c69e	190.153.200.182	Mozilla/5.0 (Linux; Android 5.0; ALE-L23 Build/HuaweiALE-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://t.co/7XG9CmBaIK?amp=1	https://abre.penalolen.cl/	\N	t.co	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:45:00.424827
5e69bad7-3793-44a2-a169-27fcb606cdac	33c1f209-0dff-4e18-b1e0-266de1a97fbf	179.9.99.124	Mozilla/5.0 (Linux; Android 4.4.2; CHC-U03 Build/HuaweiCHC-U03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:52:32.190349
d9ee0bf9-d8e5-43da-b903-83455bb4a148	2106f327-ada0-4eab-9804-350e91e9e179	179.9.99.124	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	206	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:32:52.74748
786817fb-9ec6-4764-9818-6b2dda1bb918	73f1715b-2a0a-4e21-b10f-8fb781dbcaab	37.123.187.233	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 21:58:46.753287
bc364043-9c93-4cec-adbf-e09a6ec268be	b4efb4e2-ff8d-4d4b-a30d-629dfc3e5407	191.125.3.139	Mozilla/5.0 (Linux; Android 6.0; Lenovo A7010a48 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	360	640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:00:01.212303
e51963ad-9db4-43eb-8b92-b09d018ee0ed	4369a169-ac06-4a47-91db-5bf24ac659a9	181.160.126.5	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	https://abre.penalolen.cl/proposals	https://abre.penalolen.cl/proposals	\N	abre.penalolen.cl	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:22:01.507349
a6260558-65ab-4fe9-ae46-693d9fee7d44	5efbee9e-7eba-4ab0-9374-2233af2be0c5	191.119.83.65	Mozilla/5.0 (Linux; Android 6.0; LG-K430 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:33:32.745122
8f42d07d-72ee-4957-8bfb-1cd7589e7689	d9beafb6-faab-4b24-b1bd-bded7cf83301	191.126.160.121	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	210	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:08:14.857275
aa05bd5f-2d24-4acc-a49f-5d669f8af679	2dc9f99f-e73f-4690-a0fd-90c67a39364a	186.156.193.43	Mozilla/5.0 (Linux; Android 6.0.1; SM-J500M Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:45:58.424782
e3de785e-9f53-4b85-9e1d-0b78f4ee06b4	234d3cd4-88a9-4d6f-a130-58aa34c82772	201.215.193.102	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:45:58.474721
45b5a7e2-5b25-450c-b417-adbb65bd907d	52fc7359-106e-4d60-8836-a8465092036c	186.9.132.236	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/59.0.3071.102 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 22:56:05.295827
c113dfc6-6941-49c0-94ac-b50cbadc900d	a3cdde76-8b6f-4192-ada2-7a2d5d74d9fc	181.74.176.126	Mozilla/5.0 (Linux; Android 5.1; XT1032 Build/LPBS23.13-56-2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/134.0.0.25.91;]	http://m.facebook.com/	https://abre.penalolen.cl/proposals/42-ninos-felices-y-seguros	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 23:25:43.682804
f70f9683-4d99-4a61-9653-b9eaf87ba695	bd631c78-673e-42ee-b2e8-4c1e52705017	181.160.215.69	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	220	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-29 23:58:05.765934
0050da21-1b09-46c5-b9b1-45f3f02b1453	98434494-c449-41fa-bee0-79f9fc7a6800	31.13.114.55	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	http://m.facebook.com	https://abre.penalolen.cl/proposals/42-ninos-felices-y-seguros	\N	m.facebook.com	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 00:46:44.035144
e87596d9-009c-4a36-b2e2-fd45b6c05f4c	198e24eb-c670-49ec-b21f-3a0b63646e6f	190.160.70.149	Mozilla/5.0 (Linux; Android 6.0; Redmi Note 4 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox/https/www.google.com	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 00:48:11.769582
e879c294-55a0-48ed-8430-bccd2c88198c	0fe634e7-711d-45fe-a876-5e3ae847abd4	181.73.57.191	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36 OPR/46.0.2597.57	https://t.co/7XG9CmBaIK	https://abre.penalolen.cl/	\N	t.co	\N	Opera	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 01:31:15.369749
8db0aa44-96bb-4cbf-9bc5-c2466c810ad8	0d7dfeee-11bd-4f96-9086-702182962e22	186.9.132.208	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.4 Chrome/51.0.2704.106 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 02:19:11.702358
02c4b70e-8a20-4923-9d6f-cac3516385d3	64cf3129-3bf3-47dc-b95b-be648e1df601	190.160.247.47	Mozilla/5.0 (Linux; Android 5.1.1; SM-G531H Build/LMY48B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/106.0.0.26.68;]	http://m.facebook.com/	https://abre.penalolen.cl/proposals/42-ninos-felices-y-seguros	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 02:29:08.12637
e5946fbb-ed18-4f0b-8016-fd50341fce3c	37c0bb07-3f7c-4f8f-a2ad-b88848eeeb70	190.161.227.227	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 [FBAN/FBIOS;FBAV/133.0.0.51.89;FBBV/65438308;FBDV/iPhone7,2;FBMD/iPhone;FBSN/iOS;FBSV/10.3.2;FBSS/2;FBCR/ENTELPCS;FBID/phone;FBLC/en_US;FBOP/5;FBRV/0]	http://m.facebook.com	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 15:56:20.369765
e98a155a-d232-4cdf-b51f-261dd65e815e	5320aada-6131-46aa-bd44-d95402c64c6d	186.143.199.49	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 [FBAN/FBIOS;FBAV/134.0.0.51.89;FBBV/66179625;FBDV/iPhone8,1;FBMD/iPhone;FBSN/iOS;FBSV/10.3.2;FBSS/2;FBCR/Carrier;FBID/phone;FBLC/es_LA;FBOP/5;FBRV/0]	http://m.facebook.com	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 16:36:07.45183
fb5d8c44-1f4e-4e86-9c06-4f45f6c55604	f6ef3b49-e802-44c3-a478-dcd9fc14ce9d	190.161.227.227	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 17:04:35.57125
a42936cb-3438-481b-9772-ece78e1205a6	4f7ee436-daf8-492b-863e-2822a6cbba96	201.215.190.75	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.facebook.com/	https://abre.penalolen.cl/proposals/42-ninos-felices-y-seguros	160	www.facebook.com	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 17:47:07.551867
f1947e9c-dc29-4c81-a2e8-aba6e12baffc	3575453b-6314-4b96-94bc-f235747132e2	201.215.190.105	Mozilla/5.0 (Linux; Android 6.0.1; Lenovo K53b36 Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 20:12:16.353694
c8f39281-f167-4125-96aa-a35fe1c68641	d3db75da-096e-4a51-ae8d-621759a6eaef	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 23:30:41.756114
c790f534-d3c8-43bc-8963-db76834a3a86	34cecdcd-4083-47eb-9cc3-3d016c94edd8	181.160.196.248	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	103	outlook.live.com	\N	Chrome	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-30 23:39:11.88901
8ecc2f3c-5169-4b35-bfcf-e2ef8e49d1e5	36ca9578-b5de-4eb4-8ee1-3b8d3c814ecd	190.160.244.166	Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36	\N	https://abre.penalolen.cl/	221	\N	\N	Chrome	Windows XP	Desktop	768	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 00:15:26.397425
172aad90-c4d1-490d-8f44-3d56055c8981	69cba174-0256-4cbb-a860-d583334d8892	152.174.203.140	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	https://www.facebook.com/	https://abre.penalolen.cl/	\N	www.facebook.com	\N	Chrome	Windows 7	Desktop	768	1360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 02:18:17.55123
f176694c-ed2c-43d3-9c13-125cdf8d2c63	2abb277e-5f07-4267-922d-908d421e87dd	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	53	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 03:01:25.367678
7dc1b584-412f-4627-8440-8ca07e53fca8	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.208.185	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 14:22:21.020421
9ee2b5b4-a878-4c6d-95b6-bf39c9cf87bd	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.208.185	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 14:54:35.835242
fcda69a3-c78e-41e2-b421-7f8c5318f934	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 14:59:13.218178
6c0e59ee-8a2e-48db-96fe-5c8501e78e5e	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.208.185	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 16:23:44.612334
a6177e88-51a1-429f-8f8f-a5d0758d419b	9ba942cb-e556-400d-8f1f-2e1c62f8f503	200.83.137.32	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 16:54:43.120823
7121ae11-b8c2-4940-b04a-06f2ca8efd1f	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 17:44:17.93769
2c924dac-d999-40ce-a612-7918627b8d6b	e83e81d3-bf1d-4432-a899-fce5a51c0bf0	190.20.208.185	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 19:34:23.791938
a7205252-d87c-4653-bb9d-b1bd19d08b40	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.208.185	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 19:35:48.226266
b6b33d41-5bc6-410d-863b-518e6cdeb919	39835255-64b4-4903-aca0-28e87ab63153	186.9.130.152	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.72 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-07-31 23:11:11.686988
191d7cef-9619-4597-bd1c-6332768d3ef3	696c3b42-de63-4f41-ab77-94a58b248066	179.9.122.223	Mozilla/5.0 (Linux; Android 5.1.1; SM-J111M Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.83 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 00:42:35.419677
9c6ff612-70af-47df-8b5a-d914b41295c6	4b24740a-ec3a-4624-b088-9cfc801cbe13	201.215.190.105	Mozilla/5.0 (Linux; Android 6.0; BLL-L23 Build/HUAWEIBLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 01:01:06.961019
6daf2d6c-3cc2-4492-8e3e-c4680f9c0753	73cd95fd-9908-407d-a8d4-7a2c5a12582f	190.98.205.98	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/537.36	http://www.google.com/search	https://abre.penalolen.cl/	\N	www.google.com	\N	Chrome	Linux	Desktop	1024	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 01:43:27.813945
b89180da-ffee-4e54-9c5b-0cbc0efbc56e	9ba942cb-e556-400d-8f1f-2e1c62f8f503	200.83.137.32	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 03:48:23.19228
a27b7e14-0ab5-4023-9913-2fbbfb45ca93	fde2aebd-1fee-4314-b0af-131344050bed	201.239.165.17	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 03:52:58.206038
943ded22-a287-44b9-b147-638a7f6ef9f7	39835255-64b4-4903-aca0-28e87ab63153	190.20.160.92	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.72 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 04:42:20.833834
874c0318-e415-4f89-98bc-08435cba28b0	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 13:34:51.951048
c3a8667a-20da-4225-9bd7-82f79c5e5d34	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 13:38:48.852074
244e9111-a3dc-4dc5-b430-ab7d1643b6ed	39835255-64b4-4903-aca0-28e87ab63153	190.98.205.98	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.72 Mobile/14F89 Safari/602.1	https://abre.penalolen.cl/	https://abre.penalolen.cl/more-information	\N	abre.penalolen.cl	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 18:30:12.886441
af868880-9ab8-4ce0-a038-67ba05e40133	f5a8d64d-d587-48b7-843b-3d889386b9dc	200.83.90.191	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 19:22:43.190744
3a7e9a35-16ba-4989-a1d7-b1bf745e054d	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.82.175	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 15:55:35.868699
407e9a20-3e8a-48d4-b78a-4680f8f15020	449b5d02-702a-4c78-882c-bd1609fb301d	190.98.205.98	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4	\N	https://abre.penalolen.cl/	\N	\N	\N	Safari	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 19:48:03.509882
cb35fc82-d426-4ea7-bc5d-18e1f6388c63	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.82.175	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-01 22:27:58.672256
79b28d72-8a11-4b87-bdde-f8d55526822a	198e24eb-c670-49ec-b21f-3a0b63646e6f	190.101.117.14	Mozilla/5.0 (Linux; Android 6.0; Redmi Note 4 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox/https/www.google.com	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-02 01:17:21.292416
50ebbe02-a04e-4b13-8699-7418d55e17a4	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.188.186	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-02 21:55:37.77983
dbd0d62a-23d3-40c1-9f23-f2c22db67bc5	34cecdcd-4083-47eb-9cc3-3d016c94edd8	181.160.66.169	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	103	outlook.live.com	\N	Chrome	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-03 01:33:47.079804
fe0bc016-3534-48cc-8d13-8bf7d9889361	1921dbe6-f78f-4c7f-afac-69ca9d1a1675	190.100.9.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	158	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-03 23:32:05.208356
5cad16a5-0852-4a9b-bc7b-7bafd71daec6	e9f9edcb-c6a8-48ac-b6d5-75b1066d07ac	181.160.215.247	Mozilla/5.0 (Linux; Android 4.4.4; GT-I9060M Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.gm	https://abre.penalolen.cl/users/sign_in	\N	com.google.android.gm	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-04 10:52:31.892815
3f982851-2c96-48fa-b141-303d1ffcd761	74790b4b-d65b-415d-9729-0643544ed6d8	190.47.131.119	Mozilla/5.0 (Linux; Android 5.0.1; ALE-L21 Build/HuaweiALE-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://abre.penalolen.cl/users/sign_up	https://abre.penalolen.cl/proposals?order=hot_score&page=1	\N	abre.penalolen.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-05 04:52:06.275361
010f62b1-394a-4a68-ac63-61fd3c7e6efb	74790b4b-d65b-415d-9729-0643544ed6d8	190.47.131.119	Mozilla/5.0 (Linux; Android 5.0.1; ALE-L21 Build/HuaweiALE-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://abre.penalolen.cl/users/sign_up	https://abre.penalolen.cl/proposals?order=hot_score&page=1	\N	abre.penalolen.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-06 04:45:14.768584
43ec737c-112d-4029-a7bf-40f237599e9b	39835255-64b4-4903-aca0-28e87ab63153	186.9.131.60	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.72 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-06 22:04:35.718255
48c96701-eb7b-43ff-a31f-689406a5728c	803b9e20-b0d5-4eaf-8ac9-ea4c3138259c	190.164.143.20	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia?order-selector=%2Fproposals%2F15-parque-cultural-de-dia%3Forder%3Dnewest%26page%3D1&order=oldest&page=1	\N	www.google.cl	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-07 01:30:57.291398
b6c82e12-105b-4a34-934a-fc8def33be86	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.175.82	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-07 14:15:36.735055
28e441fe-6168-4e56-b7c8-6af34edfa190	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.3.38	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-07 20:31:40.21285
aedae8eb-1d7b-4bd8-b998-1611166738a9	0c2a7666-a0b2-4bdb-a4da-5d35d0a1ea36	201.219.233.114	Mozilla/5.0 (Linux; Android 6.0.1; SM-G532M Build/MMB29T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/users/8	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 03:57:43.943952
408b12ed-7636-4dd2-9529-4a187de92f70	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	191.126.25.222	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://m.facebook.com/v2.8/dialog/oauth/read	https://abre.penalolen.cl/proposals#_=_	\N	m.facebook.com	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 14:33:49.699177
7db4c491-b68d-4425-bcc1-1f9345411a56	871bcb6f-660d-4829-add1-10db2f165e1e	190.20.24.189	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 17:15:53.744066
31291ed1-9b1d-4138-8b89-f813c9f130d2	89dc2f94-fb83-4dbe-a8fe-7f3cee532e96	181.160.95.73	Mozilla/5.0 (Linux; Android 4.4.4; HUAWEI G7-L03 Build/HuaweiG7-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	79	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 20:32:53.977907
b263105a-e909-41f1-9f71-ff92aa3414fe	0ff22259-00f3-48de-bf4d-1b06884ae14e	179.9.0.151	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 21:26:37.695833
43b15e5b-760d-472d-9a5f-bdcd41fe1c67	0281ff51-d02a-4499-acea-f8f8a43324d6	190.20.37.171	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 20:09:27.135684
e0e78b4a-5985-49bd-9daa-7e44792ddd81	cd5e1bdb-ab72-4cab-ad2d-f4576d7da58d	190.20.37.171	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 22:00:22.805665
abe1a6f2-ba1c-4191-8978-8292a5a8ddff	fb2a7a40-af32-4b21-94e0-7030d771fd34	181.75.8.65	Mozilla/5.0 (Linux; Android 4.4.4; Y635-L02 Build/HuaweiY635-L02) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.91 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/users/8	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-11 00:53:31.240926
83c1c354-ff9f-4bd7-b214-7f5ed405edfe	796e3924-6ee7-4dc8-b4bf-4b4d8160d260	190.129.127.216	Mozilla/5.0 (Linux; Android 5.1; HUAWEI TAG-L23 Build/HUAWEITAG-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-11 02:22:05.144956
48e857a3-ec27-48cd-8b7a-123da7cbc429	c232b316-168a-4981-9199-c64c4dd78096	190.20.24.189	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36 OPR/46.0.2597.57	\N	https://abre.penalolen.cl/	\N	\N	\N	Opera	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 22:00:28.484006
784bac1d-69c2-44c3-9486-28679f29904c	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	179.9.102.4	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://m.facebook.com/v2.8/dialog/oauth/read	https://abre.penalolen.cl/proposals#_=_	\N	m.facebook.com	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-08 22:40:09.979574
04ceda67-512f-408d-8e7d-8063ac189ee0	2abb277e-5f07-4267-922d-908d421e87dd	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-09 04:25:29.483608
7b0b6703-8eff-4d0c-9ca7-30a3acc0ff01	5738d5c4-77e6-4511-a028-42a5a8b6816f	186.9.129.20	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-09 16:49:29.077999
7e6804f2-30e5-4fe8-9af8-f1bf3595dba4	9ba942cb-e556-400d-8f1f-2e1c62f8f503	186.9.131.20	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-09 18:51:15.145935
f13469e1-fac2-4d95-8555-9d410a04ad40	a28a4eb0-fe66-4571-aab7-a6d47c68e8e9	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:55.0) Gecko/20100101 Firefox/55.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 7	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-09 20:18:06.94103
6638825d-2c0f-4433-bccc-b437a275b273	e3d0e645-99db-4908-8aec-b4af6de209c8	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 7	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-09 20:14:26.367819
3693fea4-d4f4-4e4d-be02-4c6025af87e9	89dc2f94-fb83-4dbe-a8fe-7f3cee532e96	181.160.107.155	Mozilla/5.0 (Linux; Android 4.4.4; HUAWEI G7-L03 Build/HuaweiG7-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-09 21:17:41.632652
2a099158-8608-4f5c-bf0b-736589d6ac44	79b3addc-5f56-47a6-a8fc-6e28b82fd47d	186.7.25.83	Mozilla/5.0 (Linux; Android 6.0.1; SM-G550T1 Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.com.do/	https://abre.penalolen.cl/proposals/22-un-parque-mas-lindo-y-familiar-para-todos	\N	www.google.com.do	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 02:58:14.878371
922c1184-bb4c-49a8-9f54-3e30eb73fb7b	c0104e3f-6d43-4599-bd8f-db86de4eae11	191.125.8.198	Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X) AppleWebKit/602.4.6 (KHTML, like Gecko) Version/10.0 Mobile/14D27 Safari/602.1	https://www.google.cl/	https://abre.penalolen.cl/proposals/10-parque-entretenido-para-ninos?order-selector=/proposals/10-parque-entretenido-para-ninos%3Forder-selector%3D%252Fproposals%252F10-parque-entretenido-para-ninos%253Forder-selector%253D%25252Fproposals%25252F10-parque-entretenido-para-ninos%25253Forder%25253Doldest%252526page%25253D1%2526order%253Dnewest%2526page%253D1%26order%3Doldest%26page%3D1	\N	www.google.cl	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 06:28:20.123106
bcac74bb-7d32-41ec-ae7a-5acf36888bcc	e3d0e645-99db-4908-8aec-b4af6de209c8	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 7	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 14:03:21.496414
8ea4e732-5b3b-4262-8c87-c94ffffa356a	2751dfc6-33f1-426e-9ca2-253a605dcc6f	190.215.124.222	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/comments/4	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	1024	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 14:15:31.415745
133c42ea-0c5b-46cb-b7ed-367fc2c08abb	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 14:25:29.509347
7e0203db-cfb6-49f5-8379-98ca9f6fdb1e	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.64.106	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 14:24:44.547393
7dd42043-b6ca-42d2-8cec-feda51f863fc	6776b423-bcc7-45f0-a0c2-37109bf73f5a	190.20.64.106	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 14:53:57.868899
d32cdd13-2a71-4a66-821a-1bd27bb9bf7b	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 14:57:47.257307
a2b7b7db-477b-4cf7-b57b-b1602147214f	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.64.106	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/projects	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 15:19:59.553772
51c83fea-6039-4e50-bdac-61c6af8ce5e0	4f16faa7-4721-42d8-93b2-6e86ed5006e8	186.9.128.187	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/projects	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 15:30:09.356812
6c46a22a-4ace-410f-8736-f5179eb6c35c	73ec72f3-a92d-4596-8675-e1f5a5a536a2	186.9.128.138	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/projects	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 15:33:07.707767
43f5e2b1-8d9f-4b49-be3b-474c10df3183	73de6c71-56da-4a62-af13-8fcf431c386c	190.162.106.241	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/projects	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 15:38:50.078152
4ae543f5-2a0e-49f9-b6a3-ae98e6d38723	1f511ddc-61c3-40fc-a879-9482a266419c	190.20.13.135	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 16:57:25.561282
83c259c3-696a-4f7f-8df6-24ecaf2b1e8f	796e3924-6ee7-4dc8-b4bf-4b4d8160d260	200.105.216.42	Mozilla/5.0 (Linux; Android 5.1; HUAWEI TAG-L23 Build/HUAWEITAG-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 17:06:39.15614
cb3857d5-0e1b-4b76-a09a-3d93e8c7344b	871bcb6f-660d-4829-add1-10db2f165e1e	190.20.37.171	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-10 19:14:31.800179
dd7154dc-2d64-48e2-8f43-8961038a165f	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-11 14:56:32.826236
f2f42f0b-e9a3-4f4f-8ba9-a0caee2f5ecd	15a06257-cc4a-4b1d-82c2-39ab2f8a9d8f	190.20.37.171	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-11 19:35:21.19343
74bf9cee-fc31-43a5-8796-4a5c560c49db	6a43ac7b-095c-47cc-b32b-7970b7fdfc6e	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-11 22:45:20.425581
3f8c0efe-c10b-4876-b9cb-b68b3b77715c	34cecdcd-4083-47eb-9cc3-3d016c94edd8	181.160.231.78	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	103	outlook.live.com	\N	Chrome	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-13 01:43:26.19951
c1c0daa0-bf0a-4cbe-bf98-5cdd226dbe62	fc05c2c9-c28e-4da8-9881-b2bbf75e81db	190.162.173.56	Mozilla/5.0 (Linux; Android 5.0.1; ALE-L21 Build/HuaweiALE-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-13 18:22:53.290384
6e4f539a-b652-4ae0-baf3-aa61dbb9d672	9c8247c6-2b34-4419-a5b1-f7c426fd0105	190.162.26.254	Mozilla/5.0 (Linux; Android 6.0.1; SM-J700M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-13 20:57:03.076134
b867fa5f-f441-48a2-8797-c790cf345c39	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	181.160.13.47	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://m.facebook.com/v2.8/dialog/oauth/read	https://abre.penalolen.cl/proposals#_=_	\N	m.facebook.com	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-15 00:28:27.33965
697d5ed9-c94e-438e-a6e9-cca2cdb092ac	20e67d26-62cf-471f-967b-3f85084541f9	186.156.132.181	Mozilla/5.0 (Linux; Android 6.0; LG-K350 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-15 20:29:51.52238
820ce8e9-6856-4cdd-aa21-bfaefc990dfd	aceee763-68d5-4bd6-afa7-58d848962059	92.185.175.192	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	http://localhost:3000/	https://abre.penalolen.cl/users/sign_in	\N	localhost	\N	Firefox	Ubuntu	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 11:30:10.152255
32000bcb-367b-4dde-bc00-7d563f8483ef	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.133.241	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 13:28:25.722123
ddb722de-d0e9-4484-8e2c-c38f8dcae372	18ed254d-39f8-4960-9262-30ecf6739d8f	190.20.222.145	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 14:23:17.064281
fe53aee1-f973-4a7a-a19b-aa70cb0d437e	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.222.145	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 14:27:09.029988
c7bb4cbc-50dd-4335-a6ec-eeedd84bb520	20e67d26-62cf-471f-967b-3f85084541f9	186.156.197.227	Mozilla/5.0 (Linux; Android 6.0; LG-K350 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 16:00:04.898438
44a92a83-94ef-4f56-bed8-84f75ca08d2c	4e8a16af-dafb-4e67-855d-291b3d02bc8c	190.196.212.174	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 19:29:57.875452
d391cd7e-81cf-4542-b53a-7c26ebef1367	8f988d57-5f5c-471f-b5a2-2c3f42ebe2ff	189.182.111.238	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	https://l.facebook.com/	https://abre.penalolen.cl/?ref=br_rs	\N	l.facebook.com	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-16 22:22:20.284728
a635f752-2a40-45c1-b2fb-08c74f57e498	8f7d6f50-95e7-45e5-89ec-85987a44605b	181.160.209.148	Mozilla/5.0 (Linux; Android 4.2.2; GT-I9082L Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 01:26:11.260757
dd0376b5-a642-4476-8ef1-9cc9f274be2d	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.222.145	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 14:16:26.511563
930ebcdf-4b50-4ced-8ca4-1e278c7e0c8d	c539130d-0984-4925-84c2-5e25f9c30923	190.20.222.145	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 14:18:52.721044
3418a84d-7803-4c8a-bc01-1d16749d39fd	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.222.145	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36	\N	https://abre.penalolen.cl/projects	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 14:21:42.358542
f3abfbf2-08e6-4592-a65c-3395388f333b	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.222.145	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 14:18:05.27755
c6508c04-7c79-4885-bf00-89928eaf4f18	ca8ca826-6244-4cb9-baed-53357b93b885	191.125.17.253	Mozilla/5.0 (Linux; Android 6.0.1; SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	android-app://org.telegram.messenger	https://abre.penalolen.cl/projects	\N	org.telegram.messenger	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 18:46:04.920061
3def9eb4-48a3-4183-b433-151cc71c4d8d	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.233.149	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-17 19:13:54.65398
49aa69b7-b17b-4250-8e68-d5127aab464c	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.219.245	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 14:35:39.589143
3c1c910d-63fa-4d79-bbc7-18e247e1ceaf	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.233.149	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 13:06:18.216733
832ec5c6-848a-4fb1-86c4-b82af3d5e03b	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 15:28:48.91591
3f5b855d-b093-457d-8e67-3de59e5d460f	73ec72f3-a92d-4596-8675-e1f5a5a536a2	186.9.132.76	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 16:54:19.364208
f5ee19d7-48ea-46c6-8913-aa1a95e53693	a4b513ce-ef1a-45a6-af1c-f47c4e7c0b21	181.160.169.169	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 18:30:17.644772
6ad281e5-f2af-4667-bc5c-797e68b7e885	5e0557bf-008b-4496-b3a2-8dbcf071ef10	201.219.233.197	Mozilla/5.0 (Linux; Android 6.0.1; SM-J710MN Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.91 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/proposals/36-renovacion-de-cesped-caminos-peatonales-y-juegos-infantiles	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 19:01:45.706096
5e7b233c-5a0b-4b0f-a674-eb04591845ce	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.219.245	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-18 19:30:43.573829
8844be93-1a8e-4bac-9405-30cc3300a91c	34cecdcd-4083-47eb-9cc3-3d016c94edd8	179.9.121.2	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	https://outlook.live.com/	https://abre.penalolen.cl/users/sign_in	103	outlook.live.com	\N	Chrome	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-19 01:20:47.651997
e2cedd79-3970-44fd-a53a-a601fcb3e408	73ec72f3-a92d-4596-8675-e1f5a5a536a2	186.9.129.185	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F89 Safari/602.1	\N	https://abre.penalolen.cl/projects	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-19 13:31:37.023123
5c514394-25da-407a-9ba6-56e05e7ba44c	0ff22259-00f3-48de-bf4d-1b06884ae14e	200.27.107.202	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-19 18:13:22.293271
236c8059-7943-4947-b271-a19bf5345bfc	9cf09ce9-e17a-42fc-b9b5-1f7e28281666	181.160.222.165	Mozilla/5.0 (Linux; Android 7.0; SM-A310M Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	https://m.facebook.com/v2.8/dialog/oauth/read	https://abre.penalolen.cl/proposals#_=_	\N	m.facebook.com	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-20 14:03:53.897044
b38d6fc7-0c88-4256-9eca-d2254588029a	161471cf-b1ba-4982-8ab3-3b7d5cff0cec	191.114.20.58	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/projects	\N	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-20 22:12:23.954596
7c056356-66c0-46a9-8dd6-b0ea53ed2163	5b9d9bb3-87aa-4356-b8c6-43335c0159c7	190.20.6.232	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0	https://www.google.com/	https://abre.penalolen.cl/projects	\N	www.google.com	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 12:27:22.144034
69786392-0f75-408b-9feb-e8a243318a21	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 12:54:04.650031
50090e57-1ad7-4476-a99b-20704a9ea76a	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.6.232	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 13:04:22.216858
85c91c72-471b-43c3-a7e7-f4bd82801c4e	fee25903-d56f-42d7-b7d7-5d505b98133b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 13:10:34.654023
18d960da-3ff0-40d4-8981-a529d0181dfc	10150833-72e8-405b-86fd-0542af039761	190.20.6.232	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 17:54:46.020892
4b916476-7414-4c72-8412-3816ee013139	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.6.232	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 18:08:05.163471
ee2f6621-8449-4d34-992c-f1a4e1d2b9c9	e46f4f3d-29f2-441b-915a-609de334b32f	190.20.6.232	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-21 20:54:41.246264
cc9ce80f-1263-4b07-ae76-fd58dc36f14c	44b1e20a-bcc8-4514-8ea4-5642db7cd8ed	186.9.131.100	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 13:38:36.57612
1e8354a9-bd3f-4585-a230-47311d0954b5	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.144.184	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 13:40:42.378935
d1011032-5168-4093-b9ef-2a3634e22728	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.144.184	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 13:43:23.810143
e25012a9-7fb3-4069-a066-62c4565dbea9	0952c33a-cb2b-419c-bace-f55edeba0b47	190.20.144.184	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 14:03:26.182264
9502ff30-5c64-4767-b744-e69054aef448	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 14:55:39.050507
c75dc9f0-5f13-478e-9d10-b8c758d51f74	e46f4f3d-29f2-441b-915a-609de334b32f	190.20.144.184	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 16:35:42.960493
6b4befe6-18a7-4903-a6fe-bf3dff5ed918	1921dbe6-f78f-4c7f-afac-69ca9d1a1675	190.100.9.192	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	119	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 19:50:26.428849
d408e4c6-188e-45f5-b4cf-918c95db6a62	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.144.184	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-22 20:02:37.930375
d94d8f97-c98c-4775-8f67-e7a0addf09de	c7e02d01-9080-47b0-acf3-487f36ebd3ac	200.83.189.146	Mozilla/5.0 (Linux; Android 6.0; HUAWEI VNS-L23 Build/HUAWEIVNS-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-23 01:00:13.615194
9e77bb66-0cc0-403b-9c91-82ef349f4d22	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.19.60	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-23 13:15:23.92569
1e88e507-4602-4978-9001-47dd99415777	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-23 14:42:06.263085
1f30f038-c85b-4bdb-87b5-a813d66c3428	9ba942cb-e556-400d-8f1f-2e1c62f8f503	201.207.5.38	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-23 16:23:30.576716
786c72b6-9191-489e-8ebc-ccbb5c6183d2	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.19.60	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	http://wiki.ciudadanointeligente.org/wiki/Abre	https://abre.penalolen.cl/	1	wiki.ciudadanointeligente.org	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-23 18:47:01.608412
47d06ba7-acc6-4bd8-9841-bafe12e85d2a	d3db75da-096e-4a51-ae8d-621759a6eaef	200.86.203.142	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-24 13:46:04.901895
b9e60c97-f973-4639-bdd4-8c67b4615f24	9ba942cb-e556-400d-8f1f-2e1c62f8f503	201.193.183.232	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-24 22:26:14.119823
aa0a5dc6-3890-40cb-98d5-8b05b584183d	d1527a3c-e4f3-4dba-a19b-12f73dea310b	179.9.108.50	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393	\N	https://abre.penalolen.cl/users/sign_in	\N	\N	\N	Edge	Windows 10	Desktop	615	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-25 00:14:19.628044
dca39af8-a61e-4654-89e0-155da5b67cf1	9ba942cb-e556-400d-8f1f-2e1c62f8f503	201.193.183.232	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-25 06:43:50.735989
e69f34bf-161c-4b28-bd19-f79b851f1b58	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.9.95	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	http://localhost:3000/	https://abre.penalolen.cl/more-information	\N	localhost	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-25 13:37:05.354967
c12768aa-b2ec-4bef-b628-4c0c080bd6c3	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.9.95	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-25 19:59:49.000792
f315809a-b26c-4ce4-a9f7-991ff7d48e74	9ba942cb-e556-400d-8f1f-2e1c62f8f503	201.207.5.38	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-25 21:32:17.000522
ea2b646a-d88c-4dc4-8768-497cbe54173a	fc05c2c9-c28e-4da8-9881-b2bbf75e81db	186.9.130.126	Mozilla/5.0 (Linux; Android 5.0.1; ALE-L21 Build/HuaweiALE-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.107 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-26 00:35:13.036075
cedbaa5c-60ec-4022-9eb3-e886f75fa1e6	39835255-64b4-4903-aca0-28e87ab63153	190.20.86.147	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-26 03:28:15.211011
d03ebff4-acc1-4839-ae31-eff26a6b8772	39835255-64b4-4903-aca0-28e87ab63153	190.20.86.147	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile iOS	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-26 13:06:33.030505
7f7a78c3-0adf-4f08-8b5e-46e5196b528a	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.250.205	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-28 12:20:20.413334
1c4960c9-e97a-48c4-bb4a-fbf9a403b4b4	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/projects	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-28 13:29:29.599514
12a756f3-6b38-4ab5-bbf5-d263253d72d8	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.250.205	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-28 14:22:18.793944
e26af0aa-0395-439c-ae13-f940e2f998ff	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-29 12:53:16.049976
6bc41e97-4d28-49fe-ad67-62121332db29	98223eff-772f-4e15-bcb0-bcf378a8ca15	190.44.113.103	Mozilla/5.0 (Linux; Android 6.0.1; SM-G570M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.107 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-29 13:52:07.478797
8e2679b4-6da2-4e9e-9a3b-c6a59ed545e7	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.14.27	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-29 16:39:51.928526
d2a61e63-b475-41b3-bf6b-eb976cc0d70c	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.14.27	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-29 17:16:52.283588
6885c828-7c1f-46a2-95b6-f4a0e39e96c6	f6c79845-e816-477d-aee5-fbcc30bb280b	190.20.14.27	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-29 19:02:16.978999
2e08e033-d58b-41fe-ba6f-60ef7f1efd55	5bb6420e-5201-4bba-876b-ce53dbdd4dbf	190.20.14.27	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-30 13:54:12.4875
bb26035f-2065-478f-9c22-0ab32ae10b26	b721fc7f-9b22-49e9-a5e6-aaef5edf5efa	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-30 16:55:16.7066
cb5ad31e-57d8-4b36-9e11-d4466f3e7659	0bcb3c8a-de25-4789-87cf-3772352784b1	186.9.134.13	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-07 18:35:57.890263
8c22530a-110d-4a0e-9a02-e05fd7d4e711	5707fe27-ffe6-4a72-982d-fcb62d75b1a6	191.125.128.142	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-08 14:55:21.602502
d0b6767a-164d-465a-a78f-c677134f9312	5d212c66-549e-4918-9721-1c8d0acfa9e5	200.2.119.115	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8	\N	https://abre.penalolen.cl/	\N	\N	\N	Safari	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-08 18:38:10.884313
0049ce9f-91ee-43b4-a0f1-5a3352b72016	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-11 12:33:01.840292
1a165fef-b039-446b-ae41-d23286f120f3	31d65939-d841-4872-b2be-28a886da2b47	102.251.185.68	Mozilla/5.0 (Linux; Android 5.1; HUAWEI LUA-L21 Build/HUAWEILUA-L21) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36	https://lm.facebook.com/l.php?u=https%3A%2F%2Fabre.penalolen.cl%2F&h=ATM7V5AMVkbOrsr47JQbILLpZslxTFAV5qkqA3d3vKnMBqMdOq5j7a-qBl6hO9c7XgpOob2cU4S-kcFyehtGWIMkjrr0PIHIoq6bR57gjqPytF7x5klVlZKET8UgoZSD4jkP2evJRy4&enc=AZP8d2M4tRFdvJKJJu2D0Drig9hb9ijcIiLai8qi5iAuQS_PKnhqnm7ay-epW6QhWO-OLT4KwNVmqWpTYymYYHMJ03gyVx4c17RpaI2HQyFQzFtGgW0-NwXIOpiUHCL9RFMs3BcdKWOSDHN17EEt7N_S81tcvMO20-PAabh4gBgAUNix5cszQGNSoqmAX8IQ1OASCagb3TEEXwM5_7Igomsg2lTWMufqJuUvsSZ79beBAbXvDVk6bhn9HGR2RwcGD3v5-RQ6TK9m469hcqKfkP4Ig8_52Tqjh4NjLPVBh-DuNYdX60REyOdg9PCSVgAn3NWrvf9QevtQgfh5IYXr4SK-dDsrn4MGaFId1yaZMQQvXw8hPV7VDV5NzOLC6QW0P99H4mfuBPAnLQnZJsGcaJEmAdsvj0cNG3Wcg1kcbSV2XWg0Cmw6QMj6xZW7zg7x_JCMYuAQXfnQkXrC5iskI7EFXnj29V-Xsl7rmd2pfnUWQEuROht3BlhGyv8c3z8NzuiPiO18VTqbsLFJ8z1kq0BSaH7rC3unNI59vWu3whLFg9XNqvPfnBmnJUqOzNlItVC9aMy0o4FazaqU_c312O8SXkhelS2g6zxvFnXAXiG-nw&s=1	https://abre.penalolen.cl/	\N	lm.facebook.com	\N	Chrome Mobile	Android	Mobile	570	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-30 17:08:28.215505
14ecf421-f3da-41ea-ba12-87631feb6c12	81a9c494-acec-4804-a9bb-2549d0276c31	190.20.94.162	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-30 18:11:45.686236
9f9aedce-cb61-48e3-93f6-d0400c3e2c5c	96ecbe4e-7fa7-4406-be75-4e3cbd072283	190.20.94.162	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-30 19:52:42.62395
04abf8d4-3207-4398-b79c-26305859330c	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	https://abre.penalolen.cl/	https://abre.penalolen.cl/projects	\N	abre.penalolen.cl	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-31 20:36:33.341764
6a89c2ce-6a31-4a15-be40-3469ec14074a	16b246a8-2560-4803-b2af-0de4424adb72	190.101.117.14	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/537.36	http://www.google.com/search	https://abre.penalolen.cl/	\N	www.google.com	\N	Chrome	Linux	Desktop	1024	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-08-31 20:55:09.89929
eabd42d9-a634-4b33-8b5d-fd1455235d3b	ff535726-8e5a-45e4-992c-dd48496815e1	201.219.233.36	Mozilla/5.0 (Linux; Android 6.0; BLL-L23 Build/HUAWEIBLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.107 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/proposals/18-mejoramiento-del-parque	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	699	393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-01 02:34:48.381225
cddb440e-d94e-4ced-a0a6-b2513069205b	5e14757e-4a78-4b23-8b1e-7b97b4f4cafa	190.20.238.38	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-01 19:07:47.325205
df76c067-382a-4ffb-af7a-77969913583c	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.238.38	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-01 21:13:13.003208
d9e20332-1174-4841-a871-049da05973ef	2f1996f9-c1d5-4f36-b5d6-63133e5ae13e	191.112.242.22	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:55.0) Gecko/20100101 Firefox/55.0	https://www.google.com/	https://abre.penalolen.cl/	\N	www.google.com	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-03 18:53:10.194989
298ffca9-3ecf-4edb-b7bb-b3988972bf3e	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-04 11:49:42.465325
794bc373-b724-4127-b15a-0ea1329b0250	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.101.168	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-04 19:29:02.50786
6d3c6200-e3e1-4a8a-950d-84edc5da3339	96ecbe4e-7fa7-4406-be75-4e3cbd072283	190.20.101.168	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-04 20:46:51.581974
1d29c57f-57a9-4dbe-b184-d8ba36c6a5f7	7d60ca99-e0c9-4273-b9d2-b46a221003b4	190.20.101.168	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-04 20:46:53.08525
18b00a8c-6ae4-4471-92fe-067c763981ba	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.101.168	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	https://www.facebook.com/	https://abre.penalolen.cl/	98	www.facebook.com	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-05 12:46:23.458013
a995c960-72d5-40ea-a2fe-c148aa9be8b9	ea8b3b3a-30be-493b-9317-0ef0dcad4edd	190.20.101.168	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0	https://www.google.com/	https://abre.penalolen.cl/	\N	www.google.com	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-05 12:55:28.739564
ac53a9ed-5f0c-4fa5-a02a-ca6dd821d06d	38eb4082-2cd8-413b-a3e7-a852fe4f1200	201.239.242.147	Mozilla/5.0 (Linux; Android 7.0; Moto G (4) Build/NPJ25.93-14-8.1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/139.0.0.26.93;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-05 15:32:42.57332
8ddae96a-a4e8-4c7e-8222-5b008e0c1484	5e14757e-4a78-4b23-8b1e-7b97b4f4cafa	190.20.101.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-05 16:41:22.704925
673de79f-6ba1-45a2-a81c-8987a5d784ba	da4c5f2b-86df-4e0e-88e6-fc03841627ee	146.155.117.96	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	https://www.facebook.com/	https://abre.penalolen.cl/	\N	www.facebook.com	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-05 18:38:05.042058
7faabe32-bab0-49c3-961e-fbf7a1bff032	48875ead-fbb4-400e-8221-64183370e3aa	181.74.105.79	Mozilla/5.0 (Linux; Android 4.4.4; GT-I9060M Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/138.0.0.19.93;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-05 22:04:48.018491
0b5cd234-a4e4-4bac-8f61-d58f5dc46eb8	b36b9d8a-0842-496f-bb27-c0e01eb98405	186.156.128.135	Mozilla/5.0 (Linux; Android 6.0.1; SM-J510MN Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.107 Mobile Safari/537.36	android-app://com.google.android.googlequicksearchbox	https://abre.penalolen.cl/	\N	com.google.android.googlequicksearchbox	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-06 12:33:15.133683
5459c6a1-e43b-4380-8219-0092f4357887	5d212c66-549e-4918-9721-1c8d0acfa9e5	200.2.119.115	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.1.2 Safari/603.3.8	https://www.google.com/	https://abre.penalolen.cl/	\N	www.google.com	\N	Safari	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-06 14:14:32.995492
c966783e-ced1-4d41-93a4-9250b2723f87	13bda229-5331-404c-a6c6-0c05883dc841	190.162.33.62	Mozilla/5.0 (Linux; Android 7.1.1; Robin Build/Robin_Nougat_108; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.116 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/139.0.0.26.93;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-07 01:29:33.290462
3e6afaa0-efc8-4480-a5de-af7600c10a0b	298a78ab-94a5-40ea-aeb0-75f913c92c7b	181.163.162.69	Mozilla/5.0 (Linux; Android 5.1.1; SM-J500M Build/LMY48B; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/125.0.0.23.80;]	http://m.facebook.com/	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-07 01:29:34.483889
b209cfb4-2afc-4183-b447-1bfe7bf989b6	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.203.199	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-11 13:11:56.131741
9547ac08-9f77-48a8-8cb4-f5638511feb0	5e14757e-4a78-4b23-8b1e-7b97b4f4cafa	190.20.21.76	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-11 18:34:53.711737
244fc214-9f46-4a90-b5cc-a249e3baefc4	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.188.112	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	43	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-11 17:58:19.109948
d05a2563-34c8-40cf-b58e-3258d3236070	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-12 18:29:53.569535
246fda8d-3535-4491-8b65-1fec2914df48	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.21.76	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-12 19:33:56.01388
956a7c0a-a3b4-43c0-b99e-79a05ae0e663	b037d5e7-4b49-4da5-80ab-805d7d5dd1b7	190.44.188.135	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 10	Desktop	720	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-14 05:23:25.559176
032e4690-d14b-4506-b285-4f06e0967ccd	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-14 12:08:26.704844
25462750-0764-4888-9f6d-87fcaff1cf83	36bc9d6c-36db-43df-a764-6b0cd431e965	186.103.220.234	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 10	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-14 15:30:47.538774
a3ab5082-af31-432d-a26c-04fa3e3cb453	5e14757e-4a78-4b23-8b1e-7b97b4f4cafa	190.20.42.237	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-14 16:14:38.94759
47858342-2e65-42c5-a95f-f7a3831325f9	e961d21f-d23b-4d67-9a6f-b1396581b6ea	190.20.160.53	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36	\N	https://abre.penalolen.cl/users/sign_in	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-15 13:46:52.058045
77463f39-209d-4be3-b807-5f4ddddd813d	2abb277e-5f07-4267-922d-908d421e87dd	200.104.207.231	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-18 20:44:22.735394
131944f5-5a81-4ebd-93b0-a36cadb89e68	79ac1325-e61e-40b9-adf9-50a54d0c14cc	190.153.200.157	Mozilla/5.0 (Linux; Android 5.0; E2306 Build/26.1.A.3.111) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.116 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/proposals/16-mas-orden-en-la-plaza	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-19 05:11:21.335668
d62c8940-8596-4460-a9cd-ede8d7d2da7c	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-20 17:51:05.260494
deae5c76-77bc-4beb-9ac0-af1975c7bb70	0952c33a-cb2b-419c-bace-f55edeba0b47	201.219.236.175	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-21 16:37:54.807245
16ff02b4-3705-4c76-93ac-228705fa2696	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.112.104	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-22 16:37:54.168407
21c398a6-b668-49c4-8a89-4db4b3eda83a	73ec72f3-a92d-4596-8675-e1f5a5a536a2	186.9.134.252	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Version/10.0 Mobile/14G60 Safari/602.1	\N	https://abre.penalolen.cl/	\N	\N	\N	Mobile Safari	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-24 14:26:38.617374
10ae10be-9cfb-4da6-b292-9aec82be09e5	7fbae525-6518-4f1f-8bfa-7e68fb059fa4	181.160.113.93	Mozilla/5.0 (Linux; Android 6.0.1; SM-J510MN Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.107 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-24 19:29:04.659229
684f98e0-e32f-42a2-8c54-5a200c0db582	2abb277e-5f07-4267-922d-908d421e87dd	200.86.203.142	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-25 03:55:40.050903
32e4e254-dded-453e-8bd5-94607259b3ee	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.92.12	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-25 13:12:16.404458
5d42b74e-1b6c-46ca-ab04-cfd82b79187a	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.9.94	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-26 18:34:40.775851
e3ca46ac-8310-4fad-a45b-25321350f6b7	c4072ad0-410e-4868-9f7f-366a2e9d3127	186.36.52.27	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-27 17:41:27.837145
82b1fea9-37c6-44cd-9d25-cd8d317f5c1c	0ff22259-00f3-48de-bf4d-1b06884ae14e	186.67.71.59	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-27 17:50:17.245764
503c39b3-9240-41ef-8983-08d6fd850c39	0bcb3c8a-de25-4789-87cf-3772352784b1	190.20.136.38	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-27 18:03:37.610441
bc6e6ceb-9e6b-4978-a583-86c789ccbf8b	e9e58927-3c77-4e69-9aeb-af1d230819a3	190.101.117.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-28 15:29:56.522428
8dfd1cbd-2869-4c59-a26d-671b5d0136a9	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-28 18:19:12.527273
476ee32e-591a-41b0-a7c8-79f6578090b7	e9e58927-3c77-4e69-9aeb-af1d230819a3	190.20.239.184	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/admin/problems/new	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-09-29 18:27:21.468969
4fa51790-9691-41ea-b29f-9b200eeb9335	e9e58927-3c77-4e69-9aeb-af1d230819a3	190.101.117.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-02 23:58:35.321775
a2f5dcd1-23c5-4274-9ab8-8a2134e65e45	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-03 12:50:34.858959
ba8eac6a-a225-4dbe-8e36-d8b81e3e47dd	e9e58927-3c77-4e69-9aeb-af1d230819a3	190.164.160.209	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-03 13:35:18.997458
c970320c-61e4-47ce-8630-a6a276463c87	96ecbe4e-7fa7-4406-be75-4e3cbd072283	190.20.9.221	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-03 13:39:35.185041
6e8de4b3-0d28-4b27-b9fb-4723bf3a1b72	0ff22259-00f3-48de-bf4d-1b06884ae14e	200.120.160.212	Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Mobile Safari/537.36	\N	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	\N	\N	Chrome Mobile	Android	Mobile	534	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-03 17:57:06.033914
688ce2d2-9260-4bb5-a3cf-2616b1a5f6c4	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.20.9.221	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-03 18:11:25.079167
f3a21faf-0694-4801-8607-f70e7f7a3fad	e9e58927-3c77-4e69-9aeb-af1d230819a3	190.20.9.221	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-03 19:55:26.828501
c247d2c5-93ff-410f-b7d8-5802c129fae8	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-04 14:28:15.099673
73ce0b3a-e9d7-4a32-a77f-422b0323d8f7	8eb7d690-7d58-4620-b7c3-b34c1937f62a	190.101.117.14	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/537.36	http://www.google.com/search	https://abre.penalolen.cl/	\N	www.google.com	\N	Chrome	Linux	Desktop	1024	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-04 21:15:59.16681
efec5252-903f-4ee6-9327-a4d5ee11b90e	02a6f9fc-12d4-401e-b5f2-1d3505b18360	190.164.160.209	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-05 13:43:08.931145
2a5a57c6-11b5-4313-836e-e79c89b12d0f	9ba942cb-e556-400d-8f1f-2e1c62f8f503	186.9.131.187	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-05 18:28:25.441752
7ac88535-b6fe-4502-9341-b96add114e78	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-05 19:32:59.971059
8c44a3dc-25f4-4a01-b811-7629977a6b10	ec0fc98c-7edf-4154-bb74-5806804eede8	186.9.131.170	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-05 22:31:25.850145
aa582cfc-41ae-485c-864f-6d6ae07c037d	7e53b26c-83b1-4c0f-a52e-3e70f4bf5331	190.196.162.154	Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 8.1	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-06 12:47:15.343561
3adfa59f-fd11-41b1-bd5d-b994120b2d47	f6c79845-e816-477d-aee5-fbcc30bb280b	190.20.209.226	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-06 13:18:32.815057
a8b7348c-1128-4b46-97d4-f1642bbc0452	5652b3e9-eef8-456c-a071-5b808889e571	190.101.117.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-06 13:39:02.024278
39706b86-ce12-4441-934f-5bcfe85bb982	bd34433e-6a7a-45a0-b38e-397f31fb5732	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	https://abre.penalolen.cl/	https://abre.penalolen.cl/proposals	\N	abre.penalolen.cl	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-06 13:39:39.777671
5134132a-4bef-4809-ab29-a9599c344ec9	76cb8e85-47fb-424d-ade9-b7e263933eb2	186.9.131.95	Mozilla/5.0 (Linux; Android 6.0; LG-K350 Build/MRA58K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-07 01:20:32.02432
53a7bec3-7ecc-4c93-ae75-0878aff70c98	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-10 20:43:58.483568
c2fe03b9-a23c-4c3c-9333-3d4df30607bb	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.170.20	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-11 16:16:40.761397
801bbaca-fdba-4f32-900c-fef1992b722a	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-11 17:12:46.783829
80656af2-15d4-48f0-92c0-a20e3dfc8ca4	18ed254d-39f8-4960-9262-30ecf6739d8f	190.20.48.120	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/proposals	\N	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 13:32:59.084227
1f639d9e-fa1c-42a5-bc82-0fac8c24b7e5	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.184.158	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 15:38:59.769489
cf05e929-d534-453f-bb9b-2be7a707f9e4	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.164.160.209	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 15:59:09.599949
481fbb2d-a947-4ec3-9812-2ab6bccb3ecd	8f1e5c3a-4eb4-4fdb-b438-f21c3005754d	190.164.160.209	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 16:09:46.406958
eeabb878-cc3d-4679-82b5-fd339f0a1c36	96ecbe4e-7fa7-4406-be75-4e3cbd072283	190.20.184.158	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 19:50:53.919259
c44d5df0-b7e9-4935-b026-0b9ead08d2e0	8f1e5c3a-4eb4-4fdb-b438-f21c3005754d	190.20.184.158	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 20:22:01.386857
c9952e50-c67c-4010-bcf8-96faf5d1676c	dc0807e4-59db-4c36-860e-305cc892d81e	190.20.184.158	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-12 20:33:07.717893
54afc061-ddfb-4157-bd65-0acadbb21397	cc9e2bac-4be1-4dd7-a853-7ff74d69ff49	190.107.226.248	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-13 20:50:25.038425
1e048bec-be0e-40ca-a60a-4347f8404e2e	877e0b94-70f5-49f8-b421-e21d09ebd419	190.238.52.8	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/602.4.8 (KHTML, like Gecko) Version/10.0.3 Safari/602.4.8	\N	https://abre.penalolen.cl/	\N	\N	\N	Safari	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-13 22:42:50.561586
4a8cf2c0-bd12-425c-9450-5b4296c08086	9ba942cb-e556-400d-8f1f-2e1c62f8f503	200.83.137.32	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-15 19:02:16.045568
7af61744-a6d2-42f5-a83f-8df09606b457	96ecbe4e-7fa7-4406-be75-4e3cbd072283	190.164.160.209	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Linux	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-16 12:20:58.83596
b5de548d-4f80-41c1-9b01-55a00705af3d	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.98.89	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-16 13:01:16.946254
31b0f725-9169-4652-b81f-bd2c9b496feb	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Fedora	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-16 14:46:33.301276
853ac604-1371-4bd0-96b7-a346c3bd402b	8f1e5c3a-4eb4-4fdb-b438-f21c3005754d	190.20.98.89	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-16 21:44:49.839582
e6040b0b-cc99-4bac-9a3e-2a590b4c0c7f	8f1e5c3a-4eb4-4fdb-b438-f21c3005754d	190.20.11.36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-17 16:20:45.652512
ecf9e5ce-b4be-4303-ae9c-d0d4054c91de	9ba942cb-e556-400d-8f1f-2e1c62f8f503	186.9.133.157	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-18 18:48:33.329513
64efb765-2809-4d32-926a-6c899680556b	677cfbcd-7214-4661-8f99-3ab063b7560c	201.218.154.210	Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0	\N	https://abre.penalolen.cl/	\N	\N	\N	Firefox	Linux	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-19 17:34:12.345018
095c590f-bf65-4788-8ef0-1be2ba125067	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.20.124.238	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-20 20:29:09.460902
34442c2a-112a-4348-b3b7-49545697312e	ea8b3b3a-30be-493b-9317-0ef0dcad4edd	152.172.133.185	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0	https://www.google.com/	https://abre.penalolen.cl/	\N	www.google.com	\N	Firefox	Ubuntu	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-23 01:33:06.689254
e4e38bd4-2b47-408b-90c5-e7a638cfc4f9	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-23 12:31:19.007565
6a9351a8-841b-4835-ae16-16633d98e443	b0a30f65-f387-4241-a483-72444f476a23	200.119.225.64	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-23 18:07:52.79592
e4a81a5d-3c93-454d-a0e5-c4a4f171cd58	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-23 18:16:50.824446
d25ea840-a346-4a52-aba7-dbfbf1dff4c8	f4ecf4a3-01e7-43a5-af7b-922fa113974a	190.164.160.209	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-23 21:12:11.58609
8949c47e-cf7c-4124-8ff4-57e87825fd83	accde988-1c61-44a5-b564-973ecf9ef5ea	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	900	1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-24 12:06:14.082266
6c57a354-12f3-4d5b-b21f-8d4c42ec678b	73de6c71-56da-4a62-af13-8fcf431c386c	190.47.22.178	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-24 12:50:37.983861
8c5da48f-3c16-42ce-8375-2f857860b28e	546d79ab-7c4c-4087-8873-328daf22a29a	190.98.205.98	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-25 14:18:53.808977
8e148f33-fd94-4f54-8d87-86adc039377d	f4ecf4a3-01e7-43a5-af7b-922fa113974a	190.20.182.133	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-26 14:53:23.528639
09cfcd5d-ec35-44ed-bb7d-a3d4216ea963	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-26 18:33:25.566653
4aeda01b-724b-4d82-8386-807d3799fc34	8628f116-8fb2-4b74-bdb3-95373045e7d5	190.96.56.244	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-26 23:39:56.815187
4f4a6f90-d70d-455f-b43b-3aec5935d079	8fa85687-30fd-4a2c-9a0d-6bce1109352b	181.161.53.113	Mozilla/5.0 (Linux; Android 5.1.1; SAMSUNG SM-J500M Build/LMY48B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.3 Chrome/38.0.2125.102 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/proposals/15-parque-cultural-de-dia	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-28 16:35:02.785047
ae246ec4-9714-4ba4-8b2a-7c2525abe2fd	0ca87fc8-656a-42c9-9e18-75a5973956b0	190.101.117.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-29 16:56:15.770412
03d74d62-37d4-464d-9989-eb98aa4345a2	44459232-9b45-47df-ae1c-f724fb109512	189.138.45.238	Mozilla/5.0 (Linux; Android 6.0.1; XT1563 Build/MPDS24.107-52-5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36	http://www.google.com.mx/	https://abre.penalolen.cl/proposals/20-conserva-tu-parque-san-luis	\N	www.google.com.mx	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-30 01:56:37.999509
256209a3-9a2c-4779-877d-c69a5a49b04e	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.235.95	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	98	\N	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-30 14:01:56.413112
1a2417bc-a2bc-4fda-8dc7-ec675a56df4a	c571ab21-91eb-455c-a721-b9a05f0c9a90	190.20.235.95	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-30 21:40:31.808876
e95e4e4b-5131-4af5-8031-d160022800bc	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.20.111.123	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-31 16:08:51.114395
2f484441-c633-4edb-9e78-4c3ec1d4038b	fc537fb4-57bc-4505-90c6-c71f3715a88b	190.20.111.123	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	http://localhost:3000/	https://abre.penalolen.cl/proposals/new	98	localhost	\N	Chrome	Mac OS X	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-10-31 18:48:34.164634
a295ab55-deb1-4c42-8d74-ac2ea8233563	97304680-01aa-479f-8e2c-b490decd8202	190.46.240.183	Mozilla/5.0 (Linux; Android 7.0; PRA-LX3 Build/HUAWEIPRA-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-02 00:51:47.554517
b105cc43-0beb-4e5e-bc8b-de46ede78da8	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-02 17:50:42.490014
b649d567-f6c7-48c7-81e3-db60a63c9ade	5ea045b7-acef-468a-a4c8-f9d59b1e8396	190.101.117.14	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/41.0.2272.118 Safari/537.36	http://www.google.com/search	https://abre.penalolen.cl/	\N	www.google.com	\N	Chrome	Linux	Desktop	1024	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-05 23:55:52.3707
cd50bc7a-1006-411b-aa57-2094b70c15fd	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-06 14:37:59.646445
c6520878-9df5-4b4b-85ab-605e95d3bb9a	0ca87fc8-656a-42c9-9e18-75a5973956b0	190.164.160.209	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-06 20:14:35.577853
504b9bff-3d0b-484e-902d-9c2a891097f1	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-07 13:53:04.466798
530257e4-6266-4ea9-a2c4-3c25e19fbf29	00b1a7a5-6395-4430-929a-81aaba62484b	190.98.205.98	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 7	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-07 16:16:24.059156
3da510b9-f231-4774-8107-95971392b98f	04477618-4bde-40d0-aad8-e0f9bc540ffb	45.5.118.34	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-08 17:31:20.759115
4b003bf2-c885-466c-8ecc-61cbe358e9ae	06dbd325-d55f-425d-9193-1f3a95aac88f	181.174.66.136	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Windows 10	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-08 18:41:26.438859
c2ecafa0-5939-4575-b4bf-ef862c9e5d77	534e40e1-2df2-47dd-986a-47484f07d5de	146.155.117.84	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36	https://www.facebook.com/	https://abre.penalolen.cl/	\N	www.facebook.com	\N	Chrome	Windows 10	Desktop	1080	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-08 18:56:47.39383
18c9df24-0c85-45d9-bfaa-83bfe4f78bc4	bd54ce75-ce0a-4f05-8f3f-7bb358eb8b8a	190.162.175.184	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36	https://www.facebook.com/	https://abre.penalolen.cl/	\N	www.facebook.com	\N	Chrome	Mac OS X	Desktop	900	1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-08 21:49:00.899755
e1b831bc-7f78-4038-ade4-6c53fed72e4d	fa62ef90-8280-428c-b7b0-c2ce63bbb28d	191.114.87.211	Mozilla/5.0 (iPhone; CPU iPhone OS 11_1 like Mac OS X) AppleWebKit/604.3.5 (KHTML, like Gecko) Mobile/15B93 [FBAN/FBIOS;FBAV/148.0.0.45.64;FBBV/78032376;FBDV/iPhone8,4;FBMD/iPhone;FBSN/iOS;FBSV/11.1;FBSS/2;FBCR/ENTELPCS;FBID/phone;FBLC/es_LA;FBOP/5;FBRV/0]	http://m.facebook.com	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-09 13:18:32.858835
fd51cc59-2c8b-4329-99f9-ddc0f69f75d8	c571ab21-91eb-455c-a721-b9a05f0c9a90	190.186.51.194	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	https://www.google.com/	https://abre.penalolen.cl/	\N	www.google.com	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-09 13:39:29.964936
1d01aa1c-ae58-45ea-ac86-27efd4773748	c571ab21-91eb-455c-a721-b9a05f0c9a90	190.186.51.194	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-09 20:16:28.649014
6b7f7454-64bd-4e9c-96b6-5e79a0e93568	9ba942cb-e556-400d-8f1f-2e1c62f8f503	190.15.200.229	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-10 01:33:57.982179
679f738f-ba4a-4c1f-bcb5-725e95ed20f1	4ebbd866-b162-4d24-b54a-bd5e76f95cf7	200.120.118.144	Mozilla/5.0 (Linux; Android 6.0.1; Moto G Play Build/MPIS24.241-2.47-14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.107 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/users/220	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-10 23:21:08.435779
096e72db-cbbd-431d-9fef-4536e6955046	c53831ad-77fc-42c6-8a35-8875b7dfb89a	190.104.115.91	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G60 [FBAN/FBIOS;FBAV/148.0.0.45.64;FBBV/78032376;FBDV/iPhone7,2;FBMD/iPhone;FBSN/iOS;FBSV/10.3.3;FBSS/2;FBCR/ClaroGuatemala;FBID/phone;FBLC/es_LA;FBOP/5;FBRV/0]	http://m.facebook.com	https://abre.penalolen.cl/	\N	m.facebook.com	\N	Facebook	iOS	Mobile	667	375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-11 03:10:25.089285
251fa91f-c7c4-41cb-98ae-347a0484e8d9	e45201bd-a09b-4d06-85c7-58018e80844b	186.9.131.155	Mozilla/5.0 (Linux; Android 7.0; SM-T810 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.116 Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/comments/4	\N	www.google.cl	\N	Chrome	Android	Tablet	768	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-14 13:51:08.411714
703c97de-edb5-4e04-a324-ceb55d95db85	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.20.77.33	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	1	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-15 14:24:49.560115
93d31f8d-130e-4813-adff-a5b25e69b63d	81711bbf-e522-4996-b704-53b90119216e	190.82.3.32	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36	\N	https://abre.penalolen.cl/	56	\N	\N	Chrome	Mac OS X	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-15 14:30:11.945704
dac1a3fd-4650-49ec-b8a6-a22ba95cbb5d	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.20.77.33	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	http://localhost:3000/	https://abre.penalolen.cl/proposals/new	1	localhost	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-15 19:48:11.860039
417f41e9-5f70-43db-a3a2-33e20d7e26a0	828b72e1-995a-4cc2-9583-b35f09ca7fea	146.155.117.58	Mozilla/5.0 (Linux; Android 6.0.1; SM-G570M Build/MMB29K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/users/8	\N	www.google.cl	\N	Chrome Mobile	Android	Mobile	640	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-17 12:10:32.92518
93d91dbd-c94f-480e-86fc-52a903258cad	73de6c71-56da-4a62-af13-8fcf431c386c	190.162.122.3	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Mac OS X	Desktop	800	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-17 14:26:45.140402
aa4dc709-f3b5-46cf-8f7f-c6cb44ffd84f	11ca2d47-fa47-4100-bb06-a05868d8f8bf	190.162.142.55	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36	https://www.google.cl/	https://abre.penalolen.cl/polls	\N	www.google.cl	\N	Chrome	Windows 7	Desktop	720	1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-19 01:42:55.743232
7c3fad3f-b071-4212-bcc8-b89acf382aba	41b715c5-4a55-4186-b80f-0cf9c0deb2d9	190.162.181.242	Mozilla/5.0 (iPhone; CPU iPhone OS 11_1_1 like Mac OS X) AppleWebKit/604.3.5 (KHTML, like Gecko) Version/11.0 Mobile/15B150 Safari/604.1	https://www.google.cl/	https://abre.penalolen.cl/proposals/48-sector-en-ayuda-de-vecinos-y-medio-ambiente	\N	www.google.cl	\N	Mobile Safari	iOS	Mobile	568	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-19 13:18:21.911645
e5ff8dfe-0cc2-4e25-8a54-d10ae7def1e9	e45201bd-a09b-4d06-85c7-58018e80844b	190.20.104.144	Mozilla/5.0 (Linux; Android 7.0; SM-T810 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.116 Safari/537.36	http://www.google.cl/	https://abre.penalolen.cl/	\N	www.google.cl	\N	Chrome	Android	Tablet	768	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-21 11:30:51.403816
76fb74c3-a909-4e1a-a9a6-178937f328a5	e0db4fda-c51f-4b0b-af0e-b0660e21650d	190.164.160.209	Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36	\N	https://abre.penalolen.cl/	\N	\N	\N	Chrome	Fedora	Desktop	768	1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-11-21 12:15:24.133789
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: abre
--

COPY votes (id, votable_id, votable_type, voter_id, voter_type, vote_flag, vote_scope, vote_weight, created_at, updated_at, signature_id) FROM stdin;
1	1	Comment	52	User	t	\N	1	2017-07-14 15:55:53.736117	2017-07-14 15:55:53.736117	\N
2	1	Proposal	53	User	t	\N	1	2017-07-14 16:03:30.554577	2017-07-14 16:03:30.554577	\N
3	2	Proposal	52	User	t	\N	1	2017-07-14 16:19:47.49096	2017-07-14 16:19:47.49096	\N
4	1	Proposal	52	User	t	\N	1	2017-07-14 16:23:53.145447	2017-07-14 16:23:53.145447	\N
5	3	Proposal	52	User	t	\N	1	2017-07-14 17:33:05.870219	2017-07-14 17:33:05.870219	\N
6	2	Proposal	1	User	t	\N	1	2017-07-14 19:47:26.313079	2017-07-14 19:47:26.313079	\N
7	4	Proposal	53	User	t	\N	1	2017-07-14 20:25:42.195052	2017-07-14 20:25:42.195052	\N
8	3	Proposal	53	User	t	\N	1	2017-07-14 20:26:22.214784	2017-07-14 20:26:22.214784	\N
9	4	Proposal	55	User	t	\N	1	2017-07-14 20:56:54.74024	2017-07-14 20:56:54.74024	\N
10	2	Proposal	55	User	t	\N	1	2017-07-14 20:56:58.825346	2017-07-14 20:56:58.825346	\N
11	5	Proposal	69	User	t	\N	1	2017-07-19 16:32:21.930466	2017-07-19 16:32:21.930466	\N
12	5	Proposal	66	User	t	\N	1	2017-07-19 17:28:51.48699	2017-07-19 17:28:51.48699	\N
13	3	Comment	52	User	t	\N	1	2017-07-19 19:22:40.051021	2017-07-19 19:22:40.051021	\N
14	6	Proposal	70	User	t	\N	1	2017-07-19 20:40:23.214008	2017-07-19 20:40:23.214008	\N
15	8	Proposal	8	User	t	\N	1	2017-07-19 21:09:40.389279	2017-07-19 21:09:40.389279	\N
16	10	Proposal	78	User	t	\N	1	2017-07-19 21:41:52.726103	2017-07-19 21:41:52.726103	\N
17	13	Proposal	79	User	t	\N	1	2017-07-19 22:07:44.897399	2017-07-19 22:07:44.897399	\N
18	17	Proposal	8	User	t	\N	1	2017-07-19 22:19:32.832899	2017-07-19 22:19:32.832899	\N
19	16	Proposal	8	User	t	\N	1	2017-07-19 22:21:02.97625	2017-07-19 22:21:02.97625	\N
20	20	Proposal	87	User	t	\N	1	2017-07-20 04:29:35.094635	2017-07-20 04:29:35.094635	\N
21	20	Proposal	88	User	t	\N	1	2017-07-20 04:32:32.492457	2017-07-20 04:32:32.492457	\N
22	15	Proposal	1	User	t	\N	1	2017-07-20 15:23:44.65981	2017-07-20 15:23:44.65981	\N
23	12	Proposal	1	User	t	\N	1	2017-07-20 15:24:02.681296	2017-07-20 15:24:02.681296	\N
24	9	Proposal	1	User	t	\N	1	2017-07-20 15:24:32.850968	2017-07-20 15:24:32.850968	\N
25	10	Proposal	1	User	t	\N	1	2017-07-20 15:24:49.550105	2017-07-20 15:24:49.550105	\N
26	20	Proposal	90	User	t	\N	1	2017-07-20 15:49:32.57184	2017-07-20 15:49:32.57184	\N
27	20	Proposal	52	User	t	\N	1	2017-07-20 19:18:01.480782	2017-07-20 19:18:01.480782	\N
28	20	Proposal	89	User	t	\N	1	2017-07-20 20:38:34.098321	2017-07-20 20:38:34.098321	\N
29	20	Proposal	93	User	t	\N	1	2017-07-20 23:30:58.399957	2017-07-20 23:30:58.399957	\N
30	20	Proposal	94	User	t	\N	1	2017-07-21 00:55:28.233587	2017-07-21 00:55:28.233587	\N
31	8	Proposal	94	User	t	\N	1	2017-07-21 00:58:15.431998	2017-07-21 00:58:15.431998	\N
32	21	Proposal	95	User	t	\N	1	2017-07-21 01:19:47.150333	2017-07-21 01:19:47.150333	\N
33	20	Proposal	53	User	t	\N	1	2017-07-21 16:17:14.733241	2017-07-21 16:17:14.733241	\N
34	20	Proposal	97	User	t	\N	1	2017-07-21 16:32:10.37186	2017-07-21 16:32:10.37186	\N
35	18	Proposal	80	User	t	\N	1	2017-07-21 17:20:14.227371	2017-07-21 17:20:14.227371	\N
36	22	Proposal	80	User	t	\N	1	2017-07-21 17:56:53.319113	2017-07-21 17:56:53.319113	\N
37	20	Proposal	98	User	t	\N	1	2017-07-21 18:57:16.190281	2017-07-21 18:57:16.190281	\N
38	10	Proposal	98	User	t	\N	1	2017-07-21 18:59:38.056538	2017-07-21 18:59:38.056538	\N
39	15	Proposal	99	User	t	\N	1	2017-07-21 19:12:58.879601	2017-07-21 19:12:58.879601	\N
40	6	Comment	80	User	t	\N	1	2017-07-21 19:50:00.468679	2017-07-21 19:50:00.468679	\N
41	23	Proposal	101	User	t	\N	1	2017-07-22 19:50:10.64232	2017-07-22 19:50:10.64232	\N
42	23	Proposal	102	User	t	\N	1	2017-07-22 20:05:43.199791	2017-07-22 20:05:43.199791	\N
43	26	Proposal	8	User	t	\N	1	2017-07-22 20:24:09.530276	2017-07-22 20:24:09.530276	\N
44	25	Proposal	104	User	t	\N	1	2017-07-22 20:26:21.791443	2017-07-22 20:26:21.791443	\N
45	23	Proposal	104	User	t	\N	1	2017-07-22 20:26:41.370299	2017-07-22 20:26:41.370299	\N
46	27	Proposal	105	User	t	\N	1	2017-07-22 20:42:11.248801	2017-07-22 20:42:11.248801	\N
47	28	Proposal	106	User	t	\N	1	2017-07-22 20:54:25.12843	2017-07-22 20:54:25.12843	\N
48	30	Proposal	108	User	t	\N	1	2017-07-22 21:05:10.356771	2017-07-22 21:05:10.356771	\N
49	29	Proposal	108	User	t	\N	1	2017-07-22 21:06:08.097143	2017-07-22 21:06:08.097143	\N
50	31	Proposal	107	User	t	\N	1	2017-07-22 21:09:21.264322	2017-07-22 21:09:21.264322	\N
51	27	Proposal	8	User	t	\N	1	2017-07-22 21:11:23.872021	2017-07-22 21:11:23.872021	\N
52	33	Proposal	8	User	t	\N	1	2017-07-22 21:25:21.718903	2017-07-22 21:25:21.718903	\N
53	27	Proposal	109	User	t	\N	1	2017-07-22 21:37:31.964202	2017-07-22 21:37:31.964202	\N
54	24	Proposal	109	User	t	\N	1	2017-07-22 21:38:30.33813	2017-07-22 21:38:30.33813	\N
55	28	Proposal	8	User	t	\N	1	2017-07-22 22:02:51.198242	2017-07-22 22:02:51.198242	\N
56	25	Proposal	103	User	t	\N	1	2017-07-22 22:10:31.372401	2017-07-22 22:10:31.372401	\N
57	16	Proposal	112	User	t	\N	1	2017-07-22 22:28:00.045736	2017-07-22 22:28:00.045736	\N
58	17	Proposal	112	User	t	\N	1	2017-07-22 22:28:20.984296	2017-07-22 22:28:20.984296	\N
59	23	Proposal	112	User	t	\N	1	2017-07-22 22:29:22.815515	2017-07-22 22:29:22.815515	\N
60	27	Proposal	112	User	t	\N	1	2017-07-22 22:30:06.079696	2017-07-22 22:30:06.079696	\N
61	23	Proposal	8	User	t	\N	1	2017-07-22 22:34:51.742206	2017-07-22 22:34:51.742206	\N
62	25	Proposal	8	User	t	\N	1	2017-07-22 22:35:21.554982	2017-07-22 22:35:21.554982	\N
63	30	Proposal	8	User	t	\N	1	2017-07-22 22:36:00.351892	2017-07-22 22:36:00.351892	\N
64	34	Proposal	8	User	t	\N	1	2017-07-22 22:37:36.442317	2017-07-22 22:37:36.442317	\N
65	25	Proposal	113	User	t	\N	1	2017-07-22 22:39:11.168426	2017-07-22 22:39:11.168426	\N
66	26	Proposal	113	User	t	\N	1	2017-07-22 22:44:16.903896	2017-07-22 22:44:16.903896	\N
67	22	Proposal	115	User	t	\N	1	2017-07-22 22:59:26.350407	2017-07-22 22:59:26.350407	\N
68	35	Proposal	116	User	t	\N	1	2017-07-23 16:50:11.956796	2017-07-23 16:50:11.956796	\N
69	20	Proposal	117	User	t	\N	1	2017-07-23 19:21:35.170158	2017-07-23 19:21:35.170158	\N
70	36	Proposal	119	User	t	\N	1	2017-07-23 20:25:24.884623	2017-07-23 20:25:24.884623	\N
71	26	Proposal	103	User	t	\N	1	2017-07-23 23:23:14.477261	2017-07-23 23:23:14.477261	\N
72	25	Proposal	98	User	t	\N	1	2017-07-24 16:02:14.206144	2017-07-24 16:02:14.206144	\N
73	35	Proposal	98	User	t	\N	1	2017-07-24 16:04:54.346067	2017-07-24 16:04:54.346067	\N
74	30	Proposal	122	User	t	\N	1	2017-07-24 18:11:30.684365	2017-07-24 18:11:30.684365	\N
75	27	Proposal	122	User	t	\N	1	2017-07-24 18:12:14.9177	2017-07-24 18:12:14.9177	\N
76	25	Proposal	122	User	t	\N	1	2017-07-24 18:12:40.158904	2017-07-24 18:12:40.158904	\N
77	24	Proposal	122	User	t	\N	1	2017-07-24 18:12:55.252005	2017-07-24 18:12:55.252005	\N
78	21	Proposal	122	User	t	\N	1	2017-07-24 18:13:42.942032	2017-07-24 18:13:42.942032	\N
79	20	Proposal	122	User	t	\N	1	2017-07-24 18:15:06.026114	2017-07-24 18:15:06.026114	\N
80	37	Proposal	8	User	t	\N	1	2017-07-24 21:30:49.949059	2017-07-24 21:30:49.949059	\N
81	20	Proposal	129	User	t	\N	1	2017-07-25 19:13:30.402191	2017-07-25 19:13:30.402191	\N
82	25	Proposal	130	User	t	\N	1	2017-07-25 19:20:13.73646	2017-07-25 19:20:13.73646	\N
83	15	Proposal	131	User	t	\N	1	2017-07-26 16:03:09.766877	2017-07-26 16:03:09.766877	\N
84	15	Proposal	132	User	t	\N	1	2017-07-26 16:05:53.938575	2017-07-26 16:05:53.938575	\N
85	15	Proposal	133	User	t	\N	1	2017-07-26 16:08:55.221776	2017-07-26 16:08:55.221776	\N
86	29	Proposal	133	User	t	\N	1	2017-07-26 16:10:54.797062	2017-07-26 16:10:54.797062	\N
87	15	Proposal	134	User	t	\N	1	2017-07-26 16:11:45.272759	2017-07-26 16:11:45.272759	\N
88	20	Proposal	134	User	t	\N	1	2017-07-26 16:15:42.167736	2017-07-26 16:15:42.167736	\N
89	10	Proposal	135	User	t	\N	1	2017-07-26 16:41:25.903474	2017-07-26 16:41:25.903474	\N
90	45	Proposal	8	User	t	\N	1	2017-07-26 20:41:37.204874	2017-07-26 20:41:37.204874	\N
91	20	Proposal	8	User	t	\N	1	2017-07-26 20:51:58.154084	2017-07-26 20:51:58.154084	\N
92	42	Proposal	124	User	t	\N	1	2017-07-26 21:00:30.640995	2017-07-26 21:00:30.640995	\N
93	25	Proposal	136	User	t	\N	1	2017-07-26 21:04:16.938091	2017-07-26 21:04:16.938091	\N
94	15	Proposal	137	User	t	\N	1	2017-07-26 21:04:59.873637	2017-07-26 21:04:59.873637	\N
95	42	Proposal	8	User	t	\N	1	2017-07-26 21:11:44.370224	2017-07-26 21:11:44.370224	\N
96	10	Proposal	143	User	t	\N	1	2017-07-26 21:44:39.306971	2017-07-26 21:44:39.306971	\N
97	46	Proposal	142	User	t	\N	1	2017-07-26 21:48:22.756564	2017-07-26 21:48:22.756564	\N
98	15	Proposal	144	User	t	\N	1	2017-07-26 21:59:30.018189	2017-07-26 21:59:30.018189	\N
99	46	Proposal	141	User	t	\N	1	2017-07-26 22:03:09.323564	2017-07-26 22:03:09.323564	\N
100	15	Proposal	145	User	t	\N	1	2017-07-26 22:04:13.140847	2017-07-26 22:04:13.140847	\N
101	35	Proposal	146	User	t	\N	1	2017-07-26 22:15:20.222308	2017-07-26 22:15:20.222308	\N
102	20	Proposal	147	User	t	\N	1	2017-07-26 22:16:13.118957	2017-07-26 22:16:13.118957	\N
103	15	Proposal	147	User	t	\N	1	2017-07-26 22:17:25.78216	2017-07-26 22:17:25.78216	\N
104	25	Proposal	147	User	t	\N	1	2017-07-26 22:18:12.934113	2017-07-26 22:18:12.934113	\N
105	47	Proposal	139	User	t	\N	1	2017-07-26 22:20:56.403379	2017-07-26 22:20:56.403379	\N
106	16	Proposal	148	User	t	\N	1	2017-07-26 22:23:01.387863	2017-07-26 22:23:01.387863	\N
107	16	Proposal	149	User	t	\N	1	2017-07-26 22:28:41.504284	2017-07-26 22:28:41.504284	\N
108	15	Proposal	150	User	t	\N	1	2017-07-26 22:39:51.71661	2017-07-26 22:39:51.71661	\N
109	16	Proposal	151	User	t	\N	1	2017-07-26 22:45:23.669913	2017-07-26 22:45:23.669913	\N
110	20	Proposal	152	User	t	\N	1	2017-07-26 22:54:09.204216	2017-07-26 22:54:09.204216	\N
111	20	Proposal	153	User	t	\N	1	2017-07-26 22:57:46.979092	2017-07-26 22:57:46.979092	\N
112	47	Proposal	154	User	t	\N	1	2017-07-26 23:00:26.271554	2017-07-26 23:00:26.271554	\N
113	46	Proposal	154	User	t	\N	1	2017-07-26 23:00:30.38061	2017-07-26 23:00:30.38061	\N
114	20	Proposal	157	User	t	\N	1	2017-07-27 17:25:46.906116	2017-07-27 17:25:46.906116	\N
115	36	Proposal	158	User	t	\N	1	2017-07-29 01:17:59.152153	2017-07-29 01:17:59.152153	\N
116	20	Proposal	159	User	t	\N	1	2017-07-29 12:52:34.567277	2017-07-29 12:52:34.567277	\N
117	42	Proposal	160	User	t	\N	1	2017-07-29 15:25:19.089061	2017-07-29 15:25:19.089061	\N
118	36	Proposal	161	User	t	\N	1	2017-07-29 18:00:50.387722	2017-07-29 18:00:50.387722	\N
119	15	Proposal	8	User	t	\N	1	2017-07-29 18:13:52.571954	2017-07-29 18:13:52.571954	\N
120	5	Proposal	65	User	t	\N	1	2017-07-29 18:16:17.978814	2017-07-29 18:16:17.978814	\N
121	20	Proposal	69	User	t	\N	1	2017-07-29 18:20:13.989504	2017-07-29 18:20:13.989504	\N
122	20	Proposal	163	User	t	\N	1	2017-07-29 18:27:24.076904	2017-07-29 18:27:24.076904	\N
123	25	Proposal	165	User	t	\N	1	2017-07-29 18:27:46.543847	2017-07-29 18:27:46.543847	\N
124	20	Proposal	166	User	t	\N	1	2017-07-29 18:28:57.491008	2017-07-29 18:28:57.491008	\N
125	25	Proposal	166	User	t	\N	1	2017-07-29 18:29:29.004857	2017-07-29 18:29:29.004857	\N
126	25	Proposal	164	User	t	\N	1	2017-07-29 18:30:54.480645	2017-07-29 18:30:54.480645	\N
127	20	Proposal	169	User	t	\N	1	2017-07-29 18:37:52.615024	2017-07-29 18:37:52.615024	\N
128	25	Proposal	169	User	t	\N	1	2017-07-29 18:38:01.969189	2017-07-29 18:38:01.969189	\N
129	15	Proposal	169	User	t	\N	1	2017-07-29 18:38:08.490581	2017-07-29 18:38:08.490581	\N
130	23	Proposal	169	User	t	\N	1	2017-07-29 18:38:21.054387	2017-07-29 18:38:21.054387	\N
131	16	Proposal	169	User	t	\N	1	2017-07-29 18:38:29.155389	2017-07-29 18:38:29.155389	\N
132	10	Proposal	169	User	t	\N	1	2017-07-29 18:38:41.444175	2017-07-29 18:38:41.444175	\N
133	20	Proposal	168	User	t	\N	1	2017-07-29 18:39:54.736711	2017-07-29 18:39:54.736711	\N
134	20	Proposal	170	User	t	\N	1	2017-07-29 18:42:29.101567	2017-07-29 18:42:29.101567	\N
135	25	Proposal	170	User	t	\N	1	2017-07-29 18:42:32.565832	2017-07-29 18:42:32.565832	\N
136	15	Proposal	170	User	t	\N	1	2017-07-29 18:42:34.373903	2017-07-29 18:42:34.373903	\N
137	20	Proposal	171	User	t	\N	1	2017-07-29 18:43:59.631947	2017-07-29 18:43:59.631947	\N
138	20	Proposal	172	User	t	\N	1	2017-07-29 18:46:43.652346	2017-07-29 18:46:43.652346	\N
139	16	Proposal	99	User	t	\N	1	2017-07-29 18:46:56.743117	2017-07-29 18:46:56.743117	\N
140	16	Proposal	175	User	t	\N	1	2017-07-29 18:58:58.207042	2017-07-29 18:58:58.207042	\N
141	36	Proposal	175	User	t	\N	1	2017-07-29 19:04:02.930595	2017-07-29 19:04:02.930595	\N
142	10	Proposal	176	User	t	\N	1	2017-07-29 19:04:47.45213	2017-07-29 19:04:47.45213	\N
143	20	Proposal	180	User	t	\N	1	2017-07-29 19:16:52.574615	2017-07-29 19:16:52.574615	\N
144	23	Proposal	176	User	t	\N	1	2017-07-29 19:19:03.400396	2017-07-29 19:19:03.400396	\N
145	20	Proposal	179	User	t	\N	1	2017-07-29 19:19:28.542847	2017-07-29 19:19:28.542847	\N
146	15	Proposal	182	User	t	\N	1	2017-07-29 19:25:01.375887	2017-07-29 19:25:01.375887	\N
147	15	Proposal	183	User	t	\N	1	2017-07-29 19:28:34.580684	2017-07-29 19:28:34.580684	\N
148	35	Proposal	188	User	t	\N	1	2017-07-29 20:12:33.636802	2017-07-29 20:12:33.636802	\N
149	46	Proposal	188	User	t	\N	1	2017-07-29 20:12:45.252049	2017-07-29 20:12:45.252049	\N
150	35	Proposal	41	User	t	\N	1	2017-07-29 20:19:01.396542	2017-07-29 20:19:01.396542	\N
151	25	Proposal	41	User	t	\N	1	2017-07-29 20:19:06.897198	2017-07-29 20:19:06.897198	\N
152	15	Proposal	190	User	t	\N	1	2017-07-29 20:24:50.899487	2017-07-29 20:24:50.899487	\N
153	36	Proposal	192	User	t	\N	1	2017-07-29 20:26:11.486897	2017-07-29 20:26:11.486897	\N
154	5	Proposal	193	User	t	\N	1	2017-07-29 20:27:34.534161	2017-07-29 20:27:34.534161	\N
155	46	Proposal	194	User	t	\N	1	2017-07-29 20:35:07.782002	2017-07-29 20:35:07.782002	\N
156	47	Proposal	196	User	t	\N	1	2017-07-29 20:39:08.327411	2017-07-29 20:39:08.327411	\N
157	20	Proposal	195	User	t	\N	1	2017-07-29 20:39:24.62981	2017-07-29 20:39:24.62981	\N
158	36	Proposal	196	User	t	\N	1	2017-07-29 20:44:55.435863	2017-07-29 20:44:55.435863	\N
159	20	Proposal	40	User	t	\N	1	2017-07-29 20:46:38.411825	2017-07-29 20:46:38.411825	\N
160	36	Proposal	40	User	t	\N	1	2017-07-29 20:47:02.922294	2017-07-29 20:47:02.922294	\N
161	20	Proposal	198	User	t	\N	1	2017-07-29 20:54:58.075716	2017-07-29 20:54:58.075716	\N
162	35	Proposal	40	User	t	\N	1	2017-07-29 20:58:26.299134	2017-07-29 20:58:26.299134	\N
163	20	Proposal	199	User	t	\N	1	2017-07-29 21:02:27.422863	2017-07-29 21:02:27.422863	\N
164	20	Proposal	197	User	t	\N	1	2017-07-29 21:05:23.197463	2017-07-29 21:05:23.197463	\N
165	25	Proposal	200	User	t	\N	1	2017-07-29 21:05:36.674863	2017-07-29 21:05:36.674863	\N
166	20	Proposal	201	User	t	\N	1	2017-07-29 21:08:32.061434	2017-07-29 21:08:32.061434	\N
167	15	Proposal	201	User	t	\N	1	2017-07-29 21:09:24.351598	2017-07-29 21:09:24.351598	\N
168	25	Proposal	201	User	t	\N	1	2017-07-29 21:10:03.885561	2017-07-29 21:10:03.885561	\N
169	16	Proposal	201	User	t	\N	1	2017-07-29 21:10:44.771064	2017-07-29 21:10:44.771064	\N
170	36	Proposal	201	User	t	\N	1	2017-07-29 21:10:45.075006	2017-07-29 21:10:45.075006	\N
171	23	Proposal	201	User	t	\N	1	2017-07-29 21:11:26.342021	2017-07-29 21:11:26.342021	\N
172	10	Proposal	201	User	t	\N	1	2017-07-29 21:11:41.896556	2017-07-29 21:11:41.896556	\N
173	35	Proposal	201	User	t	\N	1	2017-07-29 21:11:47.50462	2017-07-29 21:11:47.50462	\N
174	46	Proposal	201	User	t	\N	1	2017-07-29 21:11:49.460525	2017-07-29 21:11:49.460525	\N
175	27	Proposal	201	User	t	\N	1	2017-07-29 21:11:54.148992	2017-07-29 21:11:54.148992	\N
176	5	Proposal	201	User	t	\N	1	2017-07-29 21:12:00.160065	2017-07-29 21:12:00.160065	\N
177	42	Proposal	201	User	t	\N	1	2017-07-29 21:12:06.068007	2017-07-29 21:12:06.068007	\N
178	26	Proposal	201	User	t	\N	1	2017-07-29 21:12:09.63049	2017-07-29 21:12:09.63049	\N
179	47	Proposal	201	User	t	\N	1	2017-07-29 21:12:13.870658	2017-07-29 21:12:13.870658	\N
180	30	Proposal	201	User	t	\N	1	2017-07-29 21:12:18.255641	2017-07-29 21:12:18.255641	\N
181	28	Proposal	201	User	t	\N	1	2017-07-29 21:12:22.964619	2017-07-29 21:12:22.964619	\N
182	24	Proposal	201	User	t	\N	1	2017-07-29 21:12:27.452576	2017-07-29 21:12:27.452576	\N
183	8	Proposal	201	User	t	\N	1	2017-07-29 21:12:33.372022	2017-07-29 21:12:33.372022	\N
184	22	Proposal	201	User	t	\N	1	2017-07-29 21:12:36.226466	2017-07-29 21:12:36.226466	\N
185	21	Proposal	201	User	t	\N	1	2017-07-29 21:12:40.955173	2017-07-29 21:12:40.955173	\N
186	17	Proposal	201	User	t	\N	1	2017-07-29 21:12:45.419671	2017-07-29 21:12:45.419671	\N
187	29	Proposal	201	User	t	\N	1	2017-07-29 21:12:49.308559	2017-07-29 21:12:49.308559	\N
188	37	Proposal	201	User	t	\N	1	2017-07-29 21:12:53.664779	2017-07-29 21:12:53.664779	\N
189	31	Proposal	201	User	t	\N	1	2017-07-29 21:12:58.694016	2017-07-29 21:12:58.694016	\N
190	18	Proposal	201	User	t	\N	1	2017-07-29 21:13:03.136936	2017-07-29 21:13:03.136936	\N
191	10	Proposal	200	User	t	\N	1	2017-07-29 21:13:07.852617	2017-07-29 21:13:07.852617	\N
192	20	Proposal	200	User	t	\N	1	2017-07-29 21:13:42.867447	2017-07-29 21:13:42.867447	\N
193	23	Proposal	37	User	t	\N	1	2017-07-29 21:26:54.558464	2017-07-29 21:26:54.558464	\N
194	23	Proposal	202	User	t	\N	1	2017-07-29 21:28:51.293973	2017-07-29 21:28:51.293973	\N
195	25	Proposal	204	User	t	\N	1	2017-07-29 21:42:58.946096	2017-07-29 21:42:58.946096	\N
196	20	Proposal	26	User	t	\N	1	2017-07-29 21:45:45.138747	2017-07-29 21:45:45.138747	\N
197	15	Proposal	203	User	t	\N	1	2017-07-29 21:47:32.159137	2017-07-29 21:47:32.159137	\N
198	15	Proposal	26	User	t	\N	1	2017-07-29 21:47:43.217342	2017-07-29 21:47:43.217342	\N
199	10	Proposal	37	User	t	\N	1	2017-07-29 21:47:50.169668	2017-07-29 21:47:50.169668	\N
200	23	Proposal	36	User	t	\N	1	2017-07-29 21:49:04.914399	2017-07-29 21:49:04.914399	\N
201	20	Proposal	206	User	t	\N	1	2017-07-29 21:53:14.88021	2017-07-29 21:53:14.88021	\N
202	20	Proposal	207	User	t	\N	1	2017-07-29 22:01:58.822205	2017-07-29 22:01:58.822205	\N
203	25	Proposal	35	User	t	\N	1	2017-07-29 22:05:05.085882	2017-07-29 22:05:05.085882	\N
204	20	Proposal	208	User	t	\N	1	2017-07-29 22:06:33.6686	2017-07-29 22:06:33.6686	\N
205	10	Proposal	209	User	t	\N	1	2017-07-29 22:15:07.383992	2017-07-29 22:15:07.383992	\N
206	10	Proposal	33	User	t	\N	1	2017-07-29 22:21:18.567902	2017-07-29 22:21:18.567902	\N
207	23	Proposal	34	User	t	\N	1	2017-07-29 22:27:30.641017	2017-07-29 22:27:30.641017	\N
208	20	Proposal	32	User	t	\N	1	2017-07-29 22:30:14.342368	2017-07-29 22:30:14.342368	\N
209	20	Proposal	34	User	t	\N	1	2017-07-29 22:34:02.105631	2017-07-29 22:34:02.105631	\N
210	35	Proposal	210	User	t	\N	1	2017-07-29 22:35:48.576071	2017-07-29 22:35:48.576071	\N
211	25	Proposal	30	User	t	\N	1	2017-07-29 22:35:51.248434	2017-07-29 22:35:51.248434	\N
212	10	Proposal	210	User	t	\N	1	2017-07-29 22:36:14.799169	2017-07-29 22:36:14.799169	\N
213	25	Proposal	211	User	t	\N	1	2017-07-29 22:40:59.146305	2017-07-29 22:40:59.146305	\N
214	25	Proposal	28	User	t	\N	1	2017-07-29 22:46:56.410939	2017-07-29 22:46:56.410939	\N
215	20	Proposal	213	User	t	\N	1	2017-07-29 22:47:39.112856	2017-07-29 22:47:39.112856	\N
216	25	Proposal	215	User	t	\N	1	2017-07-29 22:51:29.453856	2017-07-29 22:51:29.453856	\N
217	20	Proposal	27	User	t	\N	1	2017-07-29 22:53:04.489829	2017-07-29 22:53:04.489829	\N
218	35	Proposal	216	User	t	\N	1	2017-07-29 22:53:09.79829	2017-07-29 22:53:09.79829	\N
219	20	Proposal	216	User	t	\N	1	2017-07-29 22:53:24.333229	2017-07-29 22:53:24.333229	\N
220	10	Proposal	26	User	t	\N	1	2017-07-29 22:55:25.560348	2017-07-29 22:55:25.560348	\N
221	20	Proposal	217	User	t	\N	1	2017-07-29 23:00:35.979584	2017-07-29 23:00:35.979584	\N
222	25	Proposal	24	User	t	\N	1	2017-07-29 23:04:44.382346	2017-07-29 23:04:44.382346	\N
223	35	Proposal	22	User	t	\N	1	2017-07-29 23:06:39.840219	2017-07-29 23:06:39.840219	\N
224	20	Proposal	22	User	t	\N	1	2017-07-29 23:07:12.127386	2017-07-29 23:07:12.127386	\N
225	10	Proposal	221	User	t	\N	1	2017-07-31 00:18:29.630467	2017-07-31 00:18:29.630467	\N
226	10	Proposal	222	User	t	\N	1	2017-07-31 00:22:03.722791	2017-07-31 00:22:03.722791	\N
227	23	Comment	79	User	t	\N	1	2017-08-08 20:48:04.083956	2017-08-08 20:48:04.083956	\N
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: abre
--

SELECT pg_catalog.setval('votes_id_seq', 227, true);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: administrators_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);


--
-- Name: ahoy_events_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY ahoy_events
    ADD CONSTRAINT ahoy_events_pkey PRIMARY KEY (id);


--
-- Name: annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- Name: banners_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: budget_ballot_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_ballot_lines
    ADD CONSTRAINT budget_ballot_lines_pkey PRIMARY KEY (id);


--
-- Name: budget_ballots_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_ballots
    ADD CONSTRAINT budget_ballots_pkey PRIMARY KEY (id);


--
-- Name: budget_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_groups
    ADD CONSTRAINT budget_groups_pkey PRIMARY KEY (id);


--
-- Name: budget_headings_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_headings
    ADD CONSTRAINT budget_headings_pkey PRIMARY KEY (id);


--
-- Name: budget_investments_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_investments
    ADD CONSTRAINT budget_investments_pkey PRIMARY KEY (id);


--
-- Name: budget_valuator_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budget_valuator_assignments
    ADD CONSTRAINT budget_valuator_assignments_pkey PRIMARY KEY (id);


--
-- Name: budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: debates_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY debates
    ADD CONSTRAINT debates_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: design_events_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY design_events
    ADD CONSTRAINT design_events_pkey PRIMARY KEY (id);


--
-- Name: direct_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY direct_messages
    ADD CONSTRAINT direct_messages_pkey PRIMARY KEY (id);


--
-- Name: failed_census_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY failed_census_calls
    ADD CONSTRAINT failed_census_calls_pkey PRIMARY KEY (id);


--
-- Name: flags_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: geozones_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY geozones
    ADD CONSTRAINT geozones_pkey PRIMARY KEY (id);


--
-- Name: geozones_polls_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY geozones_polls
    ADD CONSTRAINT geozones_polls_pkey PRIMARY KEY (id);


--
-- Name: identities_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: legislations_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY legislations
    ADD CONSTRAINT legislations_pkey PRIMARY KEY (id);


--
-- Name: locks_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (id);


--
-- Name: managers_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: moderators_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY moderators
    ADD CONSTRAINT moderators_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: poll_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_answers
    ADD CONSTRAINT poll_answers_pkey PRIMARY KEY (id);


--
-- Name: poll_booth_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_booth_assignments
    ADD CONSTRAINT poll_booth_assignments_pkey PRIMARY KEY (id);


--
-- Name: poll_booths_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_booths
    ADD CONSTRAINT poll_booths_pkey PRIMARY KEY (id);


--
-- Name: poll_final_recounts_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_final_recounts
    ADD CONSTRAINT poll_final_recounts_pkey PRIMARY KEY (id);


--
-- Name: poll_null_results_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_null_results
    ADD CONSTRAINT poll_null_results_pkey PRIMARY KEY (id);


--
-- Name: poll_officer_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_officer_assignments
    ADD CONSTRAINT poll_officer_assignments_pkey PRIMARY KEY (id);


--
-- Name: poll_officers_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_officers
    ADD CONSTRAINT poll_officers_pkey PRIMARY KEY (id);


--
-- Name: poll_partial_results_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_partial_results
    ADD CONSTRAINT poll_partial_results_pkey PRIMARY KEY (id);


--
-- Name: poll_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_questions
    ADD CONSTRAINT poll_questions_pkey PRIMARY KEY (id);


--
-- Name: poll_recounts_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_recounts
    ADD CONSTRAINT poll_recounts_pkey PRIMARY KEY (id);


--
-- Name: poll_voters_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_voters
    ADD CONSTRAINT poll_voters_pkey PRIMARY KEY (id);


--
-- Name: poll_white_results_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_white_results
    ADD CONSTRAINT poll_white_results_pkey PRIMARY KEY (id);


--
-- Name: polls_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY polls
    ADD CONSTRAINT polls_pkey PRIMARY KEY (id);


--
-- Name: problems_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: proposal_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY proposal_notifications
    ADD CONSTRAINT proposal_notifications_pkey PRIMARY KEY (id);


--
-- Name: proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: reports_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: signature_sheets_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY signature_sheets
    ADD CONSTRAINT signature_sheets_pkey PRIMARY KEY (id);


--
-- Name: signatures_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY signatures
    ADD CONSTRAINT signatures_pkey PRIMARY KEY (id);


--
-- Name: site_customization_content_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY site_customization_content_blocks
    ADD CONSTRAINT site_customization_content_blocks_pkey PRIMARY KEY (id);


--
-- Name: site_customization_images_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY site_customization_images
    ADD CONSTRAINT site_customization_images_pkey PRIMARY KEY (id);


--
-- Name: site_customization_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY site_customization_pages
    ADD CONSTRAINT site_customization_pages_pkey PRIMARY KEY (id);


--
-- Name: spending_proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY spending_proposals
    ADD CONSTRAINT spending_proposals_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tolk_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tolk_locales
    ADD CONSTRAINT tolk_locales_pkey PRIMARY KEY (id);


--
-- Name: tolk_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tolk_phrases
    ADD CONSTRAINT tolk_phrases_pkey PRIMARY KEY (id);


--
-- Name: tolk_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY tolk_translations
    ADD CONSTRAINT tolk_translations_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: valuation_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY valuation_assignments
    ADD CONSTRAINT valuation_assignments_pkey PRIMARY KEY (id);


--
-- Name: valuators_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY valuators
    ADD CONSTRAINT valuators_pkey PRIMARY KEY (id);


--
-- Name: verified_users_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY verified_users
    ADD CONSTRAINT verified_users_pkey PRIMARY KEY (id);


--
-- Name: visits_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: access_inappropiate_flags; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX access_inappropiate_flags ON flags USING btree (user_id, flaggable_type, flaggable_id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: doc_by_poll; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX doc_by_poll ON poll_voters USING btree (poll_id, document_number, document_type);


--
-- Name: index_activities_on_actionable_id_and_actionable_type; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_activities_on_actionable_id_and_actionable_type ON activities USING btree (actionable_id, actionable_type);


--
-- Name: index_activities_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_activities_on_user_id ON activities USING btree (user_id);


--
-- Name: index_administrators_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_administrators_on_user_id ON administrators USING btree (user_id);


--
-- Name: index_ahoy_events_on_name_and_time; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_ahoy_events_on_name_and_time ON ahoy_events USING btree (name, "time");


--
-- Name: index_ahoy_events_on_time; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_ahoy_events_on_time ON ahoy_events USING btree ("time");


--
-- Name: index_ahoy_events_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_ahoy_events_on_user_id ON ahoy_events USING btree (user_id);


--
-- Name: index_ahoy_events_on_visit_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_ahoy_events_on_visit_id ON ahoy_events USING btree (visit_id);


--
-- Name: index_annotations_on_legislation_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_annotations_on_legislation_id ON annotations USING btree (legislation_id);


--
-- Name: index_annotations_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_annotations_on_user_id ON annotations USING btree (user_id);


--
-- Name: index_banners_on_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_banners_on_hidden_at ON banners USING btree (hidden_at);


--
-- Name: index_budget_ballot_lines_on_ballot_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_ballot_lines_on_ballot_id ON budget_ballot_lines USING btree (ballot_id);


--
-- Name: index_budget_ballot_lines_on_investment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_ballot_lines_on_investment_id ON budget_ballot_lines USING btree (investment_id);


--
-- Name: index_budget_groups_on_budget_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_groups_on_budget_id ON budget_groups USING btree (budget_id);


--
-- Name: index_budget_headings_on_group_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_headings_on_group_id ON budget_headings USING btree (group_id);


--
-- Name: index_budget_investments_on_administrator_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_investments_on_administrator_id ON budget_investments USING btree (administrator_id);


--
-- Name: index_budget_investments_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_investments_on_author_id ON budget_investments USING btree (author_id);


--
-- Name: index_budget_investments_on_heading_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_investments_on_heading_id ON budget_investments USING btree (heading_id);


--
-- Name: index_budget_investments_on_tsv; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_investments_on_tsv ON budget_investments USING gin (tsv);


--
-- Name: index_budget_valuator_assignments_on_investment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_budget_valuator_assignments_on_investment_id ON budget_valuator_assignments USING btree (investment_id);


--
-- Name: index_comments_on_ancestry; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_ancestry ON comments USING btree (ancestry);


--
-- Name: index_comments_on_cached_votes_down; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_cached_votes_down ON comments USING btree (cached_votes_down);


--
-- Name: index_comments_on_cached_votes_total; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_cached_votes_total ON comments USING btree (cached_votes_total);


--
-- Name: index_comments_on_cached_votes_up; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_cached_votes_up ON comments USING btree (cached_votes_up);


--
-- Name: index_comments_on_commentable_id_and_commentable_type; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_commentable_id_and_commentable_type ON comments USING btree (commentable_id, commentable_type);


--
-- Name: index_comments_on_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_hidden_at ON comments USING btree (hidden_at);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_debates_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_author_id ON debates USING btree (author_id);


--
-- Name: index_debates_on_author_id_and_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_author_id_and_hidden_at ON debates USING btree (author_id, hidden_at);


--
-- Name: index_debates_on_cached_votes_down; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_cached_votes_down ON debates USING btree (cached_votes_down);


--
-- Name: index_debates_on_cached_votes_score; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_cached_votes_score ON debates USING btree (cached_votes_score);


--
-- Name: index_debates_on_cached_votes_total; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_cached_votes_total ON debates USING btree (cached_votes_total);


--
-- Name: index_debates_on_cached_votes_up; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_cached_votes_up ON debates USING btree (cached_votes_up);


--
-- Name: index_debates_on_confidence_score; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_confidence_score ON debates USING btree (confidence_score);


--
-- Name: index_debates_on_geozone_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_geozone_id ON debates USING btree (geozone_id);


--
-- Name: index_debates_on_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_hidden_at ON debates USING btree (hidden_at);


--
-- Name: index_debates_on_hot_score; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_hot_score ON debates USING btree (hot_score);


--
-- Name: index_debates_on_title; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_title ON debates USING btree (title);


--
-- Name: index_debates_on_tsv; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_debates_on_tsv ON debates USING gin (tsv);


--
-- Name: index_design_events_on_project_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_design_events_on_project_id ON design_events USING btree (project_id);


--
-- Name: index_failed_census_calls_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_failed_census_calls_on_user_id ON failed_census_calls USING btree (user_id);


--
-- Name: index_flags_on_flaggable_type_and_flaggable_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_flags_on_flaggable_type_and_flaggable_id ON flags USING btree (flaggable_type, flaggable_id);


--
-- Name: index_flags_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_flags_on_user_id ON flags USING btree (user_id);


--
-- Name: index_geozones_polls_on_geozone_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_geozones_polls_on_geozone_id ON geozones_polls USING btree (geozone_id);


--
-- Name: index_geozones_polls_on_poll_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_geozones_polls_on_poll_id ON geozones_polls USING btree (poll_id);


--
-- Name: index_identities_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_identities_on_user_id ON identities USING btree (user_id);


--
-- Name: index_locks_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_locks_on_user_id ON locks USING btree (user_id);


--
-- Name: index_managers_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_managers_on_user_id ON managers USING btree (user_id);


--
-- Name: index_moderators_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_moderators_on_user_id ON moderators USING btree (user_id);


--
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_notifications_on_user_id ON notifications USING btree (user_id);


--
-- Name: index_organizations_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_organizations_on_user_id ON organizations USING btree (user_id);


--
-- Name: index_pictures_on_design_event_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_pictures_on_design_event_id ON pictures USING btree (design_event_id);


--
-- Name: index_pictures_on_report_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_pictures_on_report_id ON pictures USING btree (report_id);


--
-- Name: index_poll_answers_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_answers_on_author_id ON poll_answers USING btree (author_id);


--
-- Name: index_poll_answers_on_question_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_answers_on_question_id ON poll_answers USING btree (question_id);


--
-- Name: index_poll_answers_on_question_id_and_answer; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_answers_on_question_id_and_answer ON poll_answers USING btree (question_id, answer);


--
-- Name: index_poll_booth_assignments_on_booth_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_booth_assignments_on_booth_id ON poll_booth_assignments USING btree (booth_id);


--
-- Name: index_poll_booth_assignments_on_poll_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_booth_assignments_on_poll_id ON poll_booth_assignments USING btree (poll_id);


--
-- Name: index_poll_final_recounts_on_booth_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_final_recounts_on_booth_assignment_id ON poll_final_recounts USING btree (booth_assignment_id);


--
-- Name: index_poll_final_recounts_on_officer_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_final_recounts_on_officer_assignment_id ON poll_final_recounts USING btree (officer_assignment_id);


--
-- Name: index_poll_null_results_on_booth_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_null_results_on_booth_assignment_id ON poll_null_results USING btree (booth_assignment_id);


--
-- Name: index_poll_null_results_on_officer_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_null_results_on_officer_assignment_id ON poll_null_results USING btree (officer_assignment_id);


--
-- Name: index_poll_officer_assignments_on_booth_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_officer_assignments_on_booth_assignment_id ON poll_officer_assignments USING btree (booth_assignment_id);


--
-- Name: index_poll_officer_assignments_on_officer_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_officer_assignments_on_officer_id ON poll_officer_assignments USING btree (officer_id);


--
-- Name: index_poll_officer_assignments_on_officer_id_and_date; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_officer_assignments_on_officer_id_and_date ON poll_officer_assignments USING btree (officer_id, date);


--
-- Name: index_poll_officers_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_officers_on_user_id ON poll_officers USING btree (user_id);


--
-- Name: index_poll_partial_results_on_answer; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_partial_results_on_answer ON poll_partial_results USING btree (answer);


--
-- Name: index_poll_partial_results_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_partial_results_on_author_id ON poll_partial_results USING btree (author_id);


--
-- Name: index_poll_partial_results_on_booth_assignment_id_and_date; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_partial_results_on_booth_assignment_id_and_date ON poll_partial_results USING btree (booth_assignment_id, date);


--
-- Name: index_poll_partial_results_on_origin; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_partial_results_on_origin ON poll_partial_results USING btree (origin);


--
-- Name: index_poll_partial_results_on_question_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_partial_results_on_question_id ON poll_partial_results USING btree (question_id);


--
-- Name: index_poll_questions_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_questions_on_author_id ON poll_questions USING btree (author_id);


--
-- Name: index_poll_questions_on_poll_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_questions_on_poll_id ON poll_questions USING btree (poll_id);


--
-- Name: index_poll_questions_on_proposal_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_questions_on_proposal_id ON poll_questions USING btree (proposal_id);


--
-- Name: index_poll_questions_on_tsv; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_questions_on_tsv ON poll_questions USING gin (tsv);


--
-- Name: index_poll_recounts_on_booth_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_recounts_on_booth_assignment_id ON poll_recounts USING btree (booth_assignment_id);


--
-- Name: index_poll_recounts_on_officer_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_recounts_on_officer_assignment_id ON poll_recounts USING btree (officer_assignment_id);


--
-- Name: index_poll_voters_on_booth_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_voters_on_booth_assignment_id ON poll_voters USING btree (booth_assignment_id);


--
-- Name: index_poll_voters_on_document_number; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_voters_on_document_number ON poll_voters USING btree (document_number);


--
-- Name: index_poll_voters_on_officer_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_voters_on_officer_assignment_id ON poll_voters USING btree (officer_assignment_id);


--
-- Name: index_poll_voters_on_poll_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_voters_on_poll_id ON poll_voters USING btree (poll_id);


--
-- Name: index_poll_voters_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_voters_on_user_id ON poll_voters USING btree (user_id);


--
-- Name: index_poll_white_results_on_booth_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_white_results_on_booth_assignment_id ON poll_white_results USING btree (booth_assignment_id);


--
-- Name: index_poll_white_results_on_officer_assignment_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_poll_white_results_on_officer_assignment_id ON poll_white_results USING btree (officer_assignment_id);


--
-- Name: index_polls_on_starts_at_and_ends_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_polls_on_starts_at_and_ends_at ON polls USING btree (starts_at, ends_at);


--
-- Name: index_problems_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_problems_on_user_id ON problems USING btree (user_id);


--
-- Name: index_projects_on_proposal_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_projects_on_proposal_id ON projects USING btree (proposal_id);


--
-- Name: index_proposals_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_author_id ON proposals USING btree (author_id);


--
-- Name: index_proposals_on_author_id_and_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_author_id_and_hidden_at ON proposals USING btree (author_id, hidden_at);


--
-- Name: index_proposals_on_cached_votes_up; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_cached_votes_up ON proposals USING btree (cached_votes_up);


--
-- Name: index_proposals_on_confidence_score; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_confidence_score ON proposals USING btree (confidence_score);


--
-- Name: index_proposals_on_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_hidden_at ON proposals USING btree (hidden_at);


--
-- Name: index_proposals_on_hot_score; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_hot_score ON proposals USING btree (hot_score);


--
-- Name: index_proposals_on_problem_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_problem_id ON proposals USING btree (problem_id);


--
-- Name: index_proposals_on_question; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_question ON proposals USING btree (question);


--
-- Name: index_proposals_on_summary; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_summary ON proposals USING btree (summary);


--
-- Name: index_proposals_on_title; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_title ON proposals USING btree (title);


--
-- Name: index_proposals_on_tsv; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_proposals_on_tsv ON proposals USING gin (tsv);


--
-- Name: index_reports_on_project_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_reports_on_project_id ON reports USING btree (project_id);


--
-- Name: index_settings_on_key; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_settings_on_key ON settings USING btree (key);


--
-- Name: index_site_customization_content_blocks_on_name_and_locale; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_site_customization_content_blocks_on_name_and_locale ON site_customization_content_blocks USING btree (name, locale);


--
-- Name: index_site_customization_images_on_name; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_site_customization_images_on_name ON site_customization_images USING btree (name);


--
-- Name: index_spending_proposals_on_author_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_spending_proposals_on_author_id ON spending_proposals USING btree (author_id);


--
-- Name: index_spending_proposals_on_geozone_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_spending_proposals_on_geozone_id ON spending_proposals USING btree (geozone_id);


--
-- Name: index_spending_proposals_on_tsv; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_spending_proposals_on_tsv ON spending_proposals USING gin (tsv);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_tags_on_debates_count; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_tags_on_debates_count ON tags USING btree (debates_count);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_tags_on_proposals_count; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_tags_on_proposals_count ON tags USING btree (proposals_count);


--
-- Name: index_tags_on_spending_proposals_count; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_tags_on_spending_proposals_count ON tags USING btree (spending_proposals_count);


--
-- Name: index_tolk_locales_on_name; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_tolk_locales_on_name ON tolk_locales USING btree (name);


--
-- Name: index_tolk_translations_on_phrase_id_and_locale_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_tolk_translations_on_phrase_id_and_locale_id ON tolk_translations USING btree (phrase_id, locale_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_geozone_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_users_on_geozone_id ON users USING btree (geozone_id);


--
-- Name: index_users_on_hidden_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_users_on_hidden_at ON users USING btree (hidden_at);


--
-- Name: index_users_on_password_changed_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_users_on_password_changed_at ON users USING btree (password_changed_at);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: index_valuators_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_valuators_on_user_id ON valuators USING btree (user_id);


--
-- Name: index_verified_users_on_document_number; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_verified_users_on_document_number ON verified_users USING btree (document_number);


--
-- Name: index_verified_users_on_email; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_verified_users_on_email ON verified_users USING btree (email);


--
-- Name: index_verified_users_on_phone; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_verified_users_on_phone ON verified_users USING btree (phone);


--
-- Name: index_visits_on_started_at; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_visits_on_started_at ON visits USING btree (started_at);


--
-- Name: index_visits_on_user_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_visits_on_user_id ON visits USING btree (user_id);


--
-- Name: index_votes_on_signature_id; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_votes_on_signature_id ON votes USING btree (signature_id);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: abre
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: abre
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0278263567; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_white_results
    ADD CONSTRAINT fk_rails_0278263567 FOREIGN KEY (booth_assignment_id) REFERENCES poll_booth_assignments(id);


--
-- Name: fk_rails_04a0fbfec8; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fk_rails_04a0fbfec8 FOREIGN KEY (design_event_id) REFERENCES design_events(id);


--
-- Name: fk_rails_0504e701a6; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_answers
    ADD CONSTRAINT fk_rails_0504e701a6 FOREIGN KEY (question_id) REFERENCES poll_questions(id);


--
-- Name: fk_rails_0f4193386a; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_voters
    ADD CONSTRAINT fk_rails_0f4193386a FOREIGN KEY (poll_id) REFERENCES polls(id);


--
-- Name: fk_rails_114bdf6c0a; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY valuators
    ADD CONSTRAINT fk_rails_114bdf6c0a FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_1306270b4d; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY managers
    ADD CONSTRAINT fk_rails_1306270b4d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_15391c3bf3; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_questions
    ADD CONSTRAINT fk_rails_15391c3bf3 FOREIGN KEY (author_id) REFERENCES users(id);


--
-- Name: fk_rails_1a75a07c27; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY geozones_polls
    ADD CONSTRAINT fk_rails_1a75a07c27 FOREIGN KEY (poll_id) REFERENCES polls(id);


--
-- Name: fk_rails_2733f5ea0b; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY administrators
    ADD CONSTRAINT fk_rails_2733f5ea0b FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_27d458674f; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT fk_rails_27d458674f FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_30d70775f9; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_recounts
    ADD CONSTRAINT fk_rails_30d70775f9 FOREIGN KEY (officer_assignment_id) REFERENCES poll_officer_assignments(id);


--
-- Name: fk_rails_30e1999036; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_recounts
    ADD CONSTRAINT fk_rails_30e1999036 FOREIGN KEY (booth_assignment_id) REFERENCES poll_booth_assignments(id);


--
-- Name: fk_rails_3185993e47; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_final_recounts
    ADD CONSTRAINT fk_rails_3185993e47 FOREIGN KEY (booth_assignment_id) REFERENCES poll_booth_assignments(id);


--
-- Name: fk_rails_4043df79bf; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT fk_rails_4043df79bf FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_408497a0c6; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_booth_assignments
    ADD CONSTRAINT fk_rails_408497a0c6 FOREIGN KEY (poll_id) REFERENCES polls(id);


--
-- Name: fk_rails_426f571216; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY locks
    ADD CONSTRAINT fk_rails_426f571216 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_4a2598368d; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_null_results
    ADD CONSTRAINT fk_rails_4a2598368d FOREIGN KEY (booth_assignment_id) REFERENCES poll_booth_assignments(id);


--
-- Name: fk_rails_516a3f6f23; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_officer_assignments
    ADD CONSTRAINT fk_rails_516a3f6f23 FOREIGN KEY (booth_assignment_id) REFERENCES poll_booth_assignments(id);


--
-- Name: fk_rails_5373344100; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY identities
    ADD CONSTRAINT fk_rails_5373344100 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_5801fb2778; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_partial_results
    ADD CONSTRAINT fk_rails_5801fb2778 FOREIGN KEY (booth_assignment_id) REFERENCES poll_booth_assignments(id);


--
-- Name: fk_rails_5e48e7fb7c; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY design_events
    ADD CONSTRAINT fk_rails_5e48e7fb7c FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_66d167f482; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_questions
    ADD CONSTRAINT fk_rails_66d167f482 FOREIGN KEY (proposal_id) REFERENCES proposals(id);


--
-- Name: fk_rails_7b93e0061c; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_rails_7b93e0061c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_7bdf861408; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_partial_results
    ADD CONSTRAINT fk_rails_7bdf861408 FOREIGN KEY (officer_assignment_id) REFERENCES poll_officer_assignments(id);


--
-- Name: fk_rails_7f753a4f0d; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fk_rails_7f753a4f0d FOREIGN KEY (report_id) REFERENCES reports(id);


--
-- Name: fk_rails_95a29ebd75; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY failed_census_calls
    ADD CONSTRAINT fk_rails_95a29ebd75 FOREIGN KEY (poll_officer_id) REFERENCES poll_officers(id);


--
-- Name: fk_rails_9760352283; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_questions
    ADD CONSTRAINT fk_rails_9760352283 FOREIGN KEY (poll_id) REFERENCES polls(id);


--
-- Name: fk_rails_9a0a9c9bec; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_9a0a9c9bec FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_9bc6624d99; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY failed_census_calls
    ADD CONSTRAINT fk_rails_9bc6624d99 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_a39246f6f0; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY geozones_polls
    ADD CONSTRAINT fk_rails_a39246f6f0 FOREIGN KEY (geozone_id) REFERENCES geozones(id);


--
-- Name: fk_rails_a51811a866; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_a51811a866 FOREIGN KEY (geozone_id) REFERENCES geozones(id);


--
-- Name: fk_rails_a8f7d7f5c4; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_final_recounts
    ADD CONSTRAINT fk_rails_a8f7d7f5c4 FOREIGN KEY (officer_assignment_id) REFERENCES poll_officer_assignments(id);


--
-- Name: fk_rails_ac462fba15; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY annotations
    ADD CONSTRAINT fk_rails_ac462fba15 FOREIGN KEY (legislation_id) REFERENCES legislations(id);


--
-- Name: fk_rails_b080fb4855; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_b080fb4855 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_b0b42588cb; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY problems
    ADD CONSTRAINT fk_rails_b0b42588cb FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c3378bb744; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY proposals
    ADD CONSTRAINT fk_rails_c3378bb744 FOREIGN KEY (problem_id) REFERENCES problems(id);


--
-- Name: fk_rails_c5c6bbae5e; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_null_results
    ADD CONSTRAINT fk_rails_c5c6bbae5e FOREIGN KEY (officer_assignment_id) REFERENCES poll_officer_assignments(id);


--
-- Name: fk_rails_e02a2b37a7; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_partial_results
    ADD CONSTRAINT fk_rails_e02a2b37a7 FOREIGN KEY (author_id) REFERENCES users(id);


--
-- Name: fk_rails_e69979a229; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY moderators
    ADD CONSTRAINT fk_rails_e69979a229 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_eac53449bb; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_partial_results
    ADD CONSTRAINT fk_rails_eac53449bb FOREIGN KEY (question_id) REFERENCES poll_questions(id);


--
-- Name: fk_rails_fb2d0a29bd; Type: FK CONSTRAINT; Schema: public; Owner: abre
--

ALTER TABLE ONLY poll_white_results
    ADD CONSTRAINT fk_rails_fb2d0a29bd FOREIGN KEY (officer_assignment_id) REFERENCES poll_officer_assignments(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

