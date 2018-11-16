# physico-chemical analysis

# Packages ----
SciViews::R
# Import raw data -----
pc <- read("data/raw/physico.xlsx")

# Correction -----
pc$cond <- as.factor(pc$cond)
pc$code <- as.factor(pc$code)


# new variable ----
pc %>.%
  mutate(., periode = case_when(number_day >= 30 & number_day < 35.6 ~ "experience",
                                number_day > 35.6 ~ "return",
                                number_day < 30 ~ "change")) -> pc

# labelise ----
pc <-labelise(pc,self = FALSE,
              label = list(cond = "Conditions",
                           code = "Conditions",
                           date = "Temps",
                           S = "Salinité",
                           T = "Température",
                           ph = "pH",
                           number_day = "Nombre de jour"
                           ),
              units = list(cond = NA,
                           code = NA,
                           date = NA,
                           S = NA,
                           T = "C°",
                           ph = NA,
                           number_day = NA),
              as_labelled = TRUE)

# Write data
write(pc, file = "data/physico.rds", type = "rds", compress = "xz")
