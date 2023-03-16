CREATE TABLE [a1_global_regions_backup] (
        [region_id] integer PRIMARY KEY,
        [region] text
);
CREATE TABLE [a3_countries_backup] (
        [country_id] integer PRIMARY KEY,
        [country] text
);
CREATE TABLE [a5_source_backup] (
        [source_id] integer PRIMARY KEY,
        [source_name] text,
        [link] text,
        [disclosure] text,
        [type] text,
        [country_scope] text,
        [comments] text
);

CREATE TABLE [a2_region_country_index_backup] (
        [country_id] integer,
        [region_id] integer,
        FOREIGN KEY (country_id) REFERENCES a3_countries_backup(country_id),
        FOREIGN KEY ( region_id) REFERENCES a1_global_regions_backup(region_id)
        
);
CREATE TABLE [a4_country_source_index_backup] (
        [country_id] integer,
        [source_id] integer,
        FOREIGN KEY (country_id) REFERENCES a3_countries_backup(country_id),
        FOREIGN KEY (source_id) REFERENCES a5_source_backup(source_id)
);


CREATE TABLE [b1_inventories_backup] (
        [inventory_id] integer PRIMARY KEY,
        [cas_no] text,
        [names] text,
        [source_id] integer,
        FOREIGN KEY (source_id) REFERENCES a5_source_backup(source_id)
);
CREATE TABLE [c1_api_ids_backup] (
        [api_id] integer PRIMARY KEY,
        [name] text,
        [source] text
);
CREATE TABLE [c2_api_ready_query_backup] (
        [query_id] integer PRIMARY KEY,
        [query] text,
        [type] text
);
CREATE TABLE [b2_inventory_summary_backup] (
        [inventory_id] integer,
        [query_id] integer,
        FOREIGN KEY (inventory_id) REFERENCES b1_inventories_backup(inventory_id),
        FOREIGN KEY (query_id) REFERENCES c2_api_ready_query_backup(query_id)
);
