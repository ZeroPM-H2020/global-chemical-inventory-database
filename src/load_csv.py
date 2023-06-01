import csv_to_sqlite

input_files_folder = "csv_files"

options = csv_to_sqlite.CsvOptions()

input_files = [
    "./csv_files/api_services.csv ",
    "./csv_files/api_ready_query.csv",
    "./csv_files/api_results.csv",
    "./csv_files/cleanventory_chemicals.csv",
    "./csv_files/consensus_index.csv",
    "./csv_files/countries.csv",
    "./csv_files/country_sources_index.csv",
    "./csv_files/global_regions.csv",
    "./csv_files/inventories.csv",
    "./csv_files/inventory_summary.csv",
    "./csv_files/region_country_index.csv",
    "./csv_files/sources.csv",
    "./csv_files/substances.csv",
    "./csv_files/zeropm_chemicals.csv",
]

csv_to_sqlite.write_csv(input_files, "zeropm-0.0.2.sqlite", options)
