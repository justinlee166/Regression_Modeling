library(dplyr)
library(readr)

# Load datasets
independent <- read_csv("data/partA/independent.csv")
dependent <- read_csv("data/partA/dependent.csv")

# Merge by subject ID
merged_data <- merge(independent, dependent, by = "ID")

# Sort by ID (optional but neat)
merged_data <- merged_data[order(merged_data$ID), ]

# Remove rows with both IV and DV missing
merged_data <- merged_data[!(is.na(merged_data$IV) & is.na(merged_data$DV)), ]

# Save merged result
write_csv(merged_data, "data/partA/merged.csv")