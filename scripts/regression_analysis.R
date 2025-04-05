library(ggplot2)
library(alr3)
library(readr)
library(dplyr)

# Load imputed data from Part A
parta_data <- read_csv("data/partA/imputed.csv")

# ---- Part A: Basic Linear Regression ----
model_a <- lm(DV ~ IV, data = parta_data)
summary(model_a)
anova(model_a)
confint(model_a)

# Plot Part A regression
ggplot(parta_data, aes(x = IV, y = DV)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Part A: Linear Regression of DV ~ IV",
       x = "Independent Variable (IV)",
       y = "Dependent Variable (DV)") +
  theme_minimal()

# ---- Part B: Transformation Analysis ----
# Load full data for Part B (includes near-repeated x-values)
partb_data <- read_csv("data/partB/full_dataset.csv")

# Transformation 1: DV^(-2/3)
partb_data$DV_t1 <- partb_data$DV^(-2/3)
model_b1 <- lm(DV_t1 ~ IV, data = partb_data)
summary(model_b1)
lof_b1 <- pureErrorAnova(model_b1, data = partb_data, IV = partb_data$IV, groups = cut(partb_data$IV, 40))
print(lof_b1)

# Transformation 2: IV^(-1)
partb_data$IV_t2 <- partb_data$IV^(-1)
model_b2 <- lm(DV ~ IV_t2, data = partb_data)
summary(model_b2)
lof_b2 <- pureErrorAnova(model_b2, data = partb_data, IV = partb_data$IV_t2, groups = cut(partb_data$IV_t2, 40))
print(lof_b2)

# Transformation 3: IV^2 and DV^(-2/3)
partb_data$IV_t3 <- partb_data$IV^2
model_b3 <- lm(DV_t1 ~ IV_t3, data = partb_data)  # Reuse DV_t1 from earlier
summary(model_b3)
lof_b3 <- pureErrorAnova(model_b3, data = partb_data, IV = partb_data$IV_t3, groups = cut(partb_data$IV_t3, 40))
print(lof_b3)

# Scatterplots for each transformation
plot_list <- list(
  ggplot(partb_data, aes(x = IV, y = DV_t1)) +
    geom_point() +
    geom_smooth(method = "lm", color = "red") +
    ggtitle("Transformation 1: IV vs. DV^(-2/3)"),

  ggplot(partb_data, aes(x = IV_t2, y = DV)) +
    geom_point() +
    geom_smooth(method = "lm", color = "green") +
    ggtitle("Transformation 2: IV^(-1) vs. DV"),

  ggplot(partb_data, aes(x = IV_t3, y = DV_t1)) +
    geom_point() +
    geom_smooth(method = "lm", color = "purple") +
    ggtitle("Transformation 3: IV^2 vs. DV^(-2/3)")
)