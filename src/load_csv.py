import csv_to_sqlite

input_files_folder = "csv_files"

options = csv_to_sqlite.CsvOptions()

input_files = ["./csv_files/a1_global_regions.csv"]

csv_to_sqlite.write_csv(input_files, "output.sqlite", options)
