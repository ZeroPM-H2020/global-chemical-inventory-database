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
    "./csv_files/c1_api_ids.csv",
    "./csv_files/c2_api_ready_query.csv",
]

csv_to_sqlite.write_csv(input_files, "output.sqlite", options)
