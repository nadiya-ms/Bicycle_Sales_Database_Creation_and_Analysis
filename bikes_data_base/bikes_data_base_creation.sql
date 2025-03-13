-- SCHEMA: bikes

-- DROP SCHEMA IF EXISTS bikes ;

CREATE SCHEMA IF NOT EXISTS bikes
    AUTHORIZATION postgres;

-- Table: bikes.bike_sales

-- DROP TABLE IF EXISTS bikes.bike_sales;

CREATE TABLE IF NOT EXISTS bikes.bike_sales
(
    order_date date,
    order_day smallint,
    order_month character varying(9) COLLATE pg_catalog."default",
    order_year smallint,
    customer_age smallint,
    customer_age_group character varying(20) COLLATE pg_catalog."default",
    customer_gender character varying(1) COLLATE pg_catalog."default",
    customer_country character varying(14) COLLATE pg_catalog."default",
    customer_state character varying(20) COLLATE pg_catalog."default",
    product_category character varying(12) COLLATE pg_catalog."default",
    product_subcategory character varying(20) COLLATE pg_catalog."default",
    product_name character varying(40) COLLATE pg_catalog."default",
    order_quantity smallint,
    unit_cost double precision,
    unit_price double precision,
    profit double precision,
    cost double precision,
    revenue double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS bikes.bike_sales
    OWNER to postgres;

COPY bike_sales
FROM 'link to csv file'
WITH (format csv, header, delimiter ',')
