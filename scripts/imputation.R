library(mice)

# Load merged data
merged_data <- read_csv("data/partA/merged.csv")

# Impute missing values using mice
imputed <- mice(merged_data, m = 1, method = 'norm.boot', seed = 123)

# Get completed data
completed_data <- complete(imputed)

# Save completed data
write_csv(completed_data, "data/partA/imputed.csv")