import csv_to_sqlite

input_files_folder = "csv_files"

options = csv_to_sqlite.CsvOptions()

input_files = [
    "./csv_files/a1_global_regions.csv",
    "./csv_files/a2_region_country_index.csv",
    "./csv_files/a3_countries.csv",
    "./csv_files/a4_country_source_index.csv",
    "./csv_files/a5_source.csv",
    "./csv_files/b1_inventories.csv",
    "./csv_files/b2_inventory_summary.csv",
    "./csv_files/c1_apis.csv",
    "./csv_files/c2_api_ready_query.csv",
    "./csv_files/c3_api_results.csv",
    "./csv_files/c4_consensus_index.csv",
    "./csv_files/c5_consensus_score.csv",
    "./csv_files/d1_cleanventory_chemicals.csv",
    "./csv_files/d2_zeropm_chemicals.csv",
    "./csv_files/e1_substances.csv",
]

csv_to_sqlite.write_csv(input_files, "output.sqlite", options)
