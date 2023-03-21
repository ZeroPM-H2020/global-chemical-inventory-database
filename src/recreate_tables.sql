CREATE TABLE [a1_global_regions_modified] (
        [region_id] integer PRIMARY KEY,
        [region] text
);
CREATE TABLE [a3_countries_modified] (
        [country_id] integer PRIMARY KEY,
        [country] text
);
CREATE TABLE [a5_source_modified] (
        [source_id] integer PRIMARY KEY,
        [source_name] text,
        [link] text,
        [disclosure] text,
        [type] text,
        [country_scope] text,
        [comments] text
);

CREATE TABLE [a2_region_country_index_modified] (
        [country_id] integer,
        [region_id] integer,
        FOREIGN KEY (country_id) REFERENCES a3_countries_modified(country_id),
        FOREIGN KEY ( region_id) REFERENCES a1_global_regions_modified(region_id)
        
);
CREATE TABLE [a4_country_source_index_modified] (
        [country_id] integer,
        [source_id] integer,
        FOREIGN KEY (country_id) REFERENCES a3_countries_modified(country_id),
        FOREIGN KEY (source_id) REFERENCES a5_source_modified(source_id)
);


CREATE TABLE [b1_inventories_modified] (
        [inventory_id] integer PRIMARY KEY,
        [cas_no] text,
        [names] text,
        [source_id] integer,
        FOREIGN KEY (source_id) REFERENCES a5_source_modified(source_id)
);
CREATE TABLE [b2_inventory_summary_modified] (
        [inventory_id] integer,
        [query_id] integer,
        FOREIGN KEY (inventory_id) REFERENCES b1_inventories_modified(inventory_id),
        FOREIGN KEY (query_id) REFERENCES c2_api_ready_query_modified(query_id)
);
CREATE TABLE [c1_apis_modified] (
        [api_id] integer PRIMARY KEY,
        [name] text,
        [source] text
);
CREATE TABLE [c2_api_ready_query_modified] (
        [query_id] integer PRIMARY KEY,
        [query] text,
        [type] text
);
CREATE TABLE [c3_api_results_modified] (
        [query_id] integer,
        [api_id] integer,
        [inchi_id] integer,
        [rank] integer,
        FOREIGN KEY (query_id) REFERENCES c2_api_ready_query_modified(query_id),
        FOREIGN KEY (api_id) REFERENCES c1_apis_modified(api_id),
        FOREIGN KEY (inchi_id) REFERENCES e1_substances_modified(inchi_id)
);
CREATE TABLE [c4_consensus_index_modified] (
        [inventory_id] integer,
        [inchi_id] text,
        [consensus_score] text,
        FOREIGN KEY (inventory_id) REFERENCES b1_inventory_summary_modified(inventory_id),
        FOREIGN KEY (inchi_id) REFERENCES e1_substances_modified(inchi_id)
);
CREATE TABLE [c5_consensus_score_modified] (
        [inventory_id] integer,
        [inchi_id] text,
        [inventory_id_score] text,
        FOREIGN KEY (inventory_id) REFERENCES b1_inventory_summary_modified(inventory_id),
        FOREIGN KEY (inchi_id) REFERENCES e1_substances_modified(inchi_id)
);
CREATE TABLE [d1_cleanventory_chemicals_modified] (
        [cleanventory_id] integer PRIMARY KEY,
        [inventory_id] integer,
        [inchi_id] integer,
        FOREIGN KEY (inventory_id) REFERENCES b1_inventory_summary_modified(inventory_id),
        FOREIGN KEY (inchi_id) REFERENCES e1_substances_modified(inchi_id)
);
CREATE TABLE [d2_zeropm_chemicals_modified] (
        [zeropm_id] integer PRIMARY KEY,
        [inchi_id] integer,
        FOREIGN KEY (inchi_id) REFERENCES e1_substances_modified(inchi_id)
);
CREATE TABLE [e1_substances_modified] (
        [inchi] text,
        [inchi_id] integer PRIMARY KEY,
        [pubchem_cid] text,
        [ccc_cas] text,
        [chemspider_id] text
);
