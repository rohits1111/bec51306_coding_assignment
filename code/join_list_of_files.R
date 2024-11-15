# Load required libraries
library(dplyr)
library(readr)
library(purrr)

# Read the list of file paths from a TSV file
file_paths <- read_tsv("data/list_q3.tsv", col_names = FALSE, show_col_types = FALSE)$X1

# Check if the file list is empty
if (length(file_paths) == 0) stop("No files to process.")

# Use safely to create a safe read function
safe_read <- safely(read_tsv)

# Read all files into a list of data frames
data_list <- map(file_paths, ~ safe_read(.x))

# Check if any files failed to load
if (any(map_lgl(data_list, ~ !is.null(.x$error)))) {
  warning("Some files could not be read.")
}

# Rename the first column to 'unique_id' in all data frames
data_list <- map(data_list, ~ rename(.x$result, unique_id = 1))

# Merge all data frames by 'unique_id'
merged_data <- reduce(data_list, inner_join, by = "unique_id")

# Write the merged data to a TSV file
write_tsv(merged_data, "data/join_output.tsv")
