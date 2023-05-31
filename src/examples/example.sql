SELECT
  country,
  source_name,
  inchi,
  ccc_cas
FROM
  substances
  JOIN cleanventory_chemicals ON cleanventory_chemicals.inchi_id = substances.inchi_id
  JOIN inventories ON inventories.inventory_id = cleanventory_chemicals.inventory_id
  JOIN sources ON sources.source_id = inventories.source_id
  JOIN country_sources_index ON country_sources_index.source_id = inventories.source_id
  JOIN countries ON country_sources_index.country_id = countries.country_id
  JOIN region_country_index ON region_country_index.country_id = countries.country_id
  JOIN global_regions ON global_regions.region_id = region_country_index.region_id
WHERE
  "Sweden" in (countries.country)
