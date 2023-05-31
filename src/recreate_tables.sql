-- Step 1. Create new tables with PRIMARY KEY and FOREIGN KEY
CREATE TABLE [api_services_modified] (
        [api_id] integer PRIMARY KEY,
        [name] text,
        [source] text
);

CREATE TABLE [api_ready_query_modified] (
        [query_id] integer PRIMARY KEY,
        [query] text,
        [type] text
);

CREATE TABLE [api_results_modified] (
        [query_id] integer,
        [api_id] integer,
        [inchi_id] integer,
        [rank] integer,
        FOREIGN KEY (query_id) REFERENCES api_ready_query(query_id),
        FOREIGN KEY (api_id) REFERENCES api_services(api_id),
        FOREIGN KEY (inchi_id) REFERENCES substances(inchi_id)
);

CREATE TABLE [cleanventory_chemicals_modified] (
        [cleanventory_id] integer PRIMARY KEY,
        [inventory_id] integer,
        [inchi_id] integer,
        FOREIGN KEY (inventory_id) REFERENCES inventory_summary(inventory_id),
        FOREIGN KEY (inchi_id) REFERENCES substances(inchi_id)
);

CREATE TABLE [consensus_index_modified] (
        [inventory_id] integer,
        [inchi_id] text,
        [consensus_score] text,
        FOREIGN KEY (inventory_id) REFERENCES inventory_summary(inventory_id),
        FOREIGN KEY (inchi_id) REFERENCES substances(inchi_id)
);

CREATE TABLE [countries_modified] (
        [country_id] integer PRIMARY KEY,
        [country] text
);

CREATE TABLE [country_sources_index_modified] (
        [country_id] integer,
        [source_id] integer,
        FOREIGN KEY (country_id) REFERENCES countries(country_id),
        FOREIGN KEY (source_id) REFERENCES sources(source_id)
);

CREATE TABLE [global_regions_modified] (
        [region_id] integer PRIMARY KEY,
        [region] text
);

CREATE TABLE [inventories_modified] (
        [inventory_id] integer PRIMARY KEY,
        [cas_no] text,
        [names] text,
        [source_id] integer,
        FOREIGN KEY (source_id) REFERENCES sources(source_id)
);

CREATE TABLE [inventory_summary_modified] (
        [inventory_id] integer,
        [query_id] integer,
        FOREIGN KEY (inventory_id) REFERENCES inventories(inventory_id),
        FOREIGN KEY (query_id) REFERENCES api_ready_query(query_id)
);

CREATE TABLE [region_country_index_modified] (
        [country_id] integer,
        [region_id] integer,
        FOREIGN KEY (country_id) REFERENCES countries(country_id),
        FOREIGN KEY ( region_id) REFERENCES global_regions(region_id)
        
);

CREATE TABLE [sources_modified] (
        [source_id] integer PRIMARY KEY,
        [source_name] text,
        [link] text,
        [disclosure] text,
        [type] text,
        [country_scope] text,
        [comments] text
);

CREATE TABLE [substances_modified] (
        [inchi] text,
        [inchi_id] integer PRIMARY KEY,
        [pubchem_cid] text,
        [ccc_cas] text,
        [chemspider_id] text
);

CREATE TABLE [zeropm_chemicals_modified] (
        [zeropm_id] integer PRIMARY KEY,
        [inchi_id] integer,
        FOREIGN KEY (inchi_id) REFERENCES substances(inchi_id)
);


-- Step 2. Copy data from old tables to new temp tables
INSERT INTO api_services_modified SELECT * FROM api_services;
INSERT INTO api_ready_query_modified SELECT * FROM api_ready_query;
INSERT INTO api_results_modified SELECT * FROM api_results;
INSERT INTO cleanventory_chemicals_modified SELECT * FROM cleanventory_chemicals;
INSERT INTO consensus_index_modified SELECT * FROM consensus_index;
INSERT INTO countries_modified SELECT * FROM countries;
INSERT INTO country_sources_index_modified SELECT * FROM country_sources_index;
INSERT INTO global_regions_modified SELECT * FROM global_regions;
INSERT INTO inventories_modified SELECT * FROM inventories;
INSERT INTO inventory_summary_modified SELECT * FROM inventory_summary;
INSERT INTO region_country_index_modified SELECT * FROM region_country_index;
INSERT INTO sources_modified SELECT * FROM sources;
INSERT INTO substances_modified SELECT * FROM substances;
INSERT INTO zeropm_chemicals_modified SELECT * FROM zeropm_chemicals;




-- Step 3. Delete temp modified tables and rename tables
DROP TABLE api_services;
ALTER TABLE api_services_modified RENAME TO api_services;

DROP TABLE api_ready_query;
ALTER TABLE api_ready_query_modified RENAME TO api_ready_query;

DROP TABLE api_results;
ALTER TABLE api_results_modified RENAME TO api_results;

DROP TABLE cleanventory_chemicals;
ALTER TABLE cleanventory_chemicals_modified RENAME TO cleanventory_chemicals;

DROP TABLE consensus_index;
ALTER TABLE consensus_index_modified RENAME TO consensus_index;

DROP TABLE countries;
ALTER TABLE countries_modified RENAME TO countries;

DROP TABLE country_sources_index;
ALTER TABLE country_sources_index_modified RENAME TO country_sources_index;

DROP TABLE global_regions;
ALTER TABLE global_regions_modified RENAME TO global_regions;

DROP TABLE inventories;
ALTER TABLE inventories_modified RENAME TO inventories;

DROP TABLE inventory_summary;
ALTER TABLE inventory_summary_modified RENAME TO inventory_summary;

DROP TABLE region_country_index;
ALTER TABLE region_country_index_modified RENAME TO region_country_index;

DROP TABLE sources;
ALTER TABLE sources_modified RENAME TO sources;

DROP TABLE substances;
ALTER TABLE substances_modified RENAME TO substances;

DROP TABLE zeropm_chemicals;
ALTER TABLE zeropm_chemicals_modified RENAME TO zeropm_chemicals;
