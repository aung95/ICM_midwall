# Load required libraries
library(survival)
library(compareC)
library(pec)
library(dplyr)

### Helper Function to Create Survival Models
fitCoxModel <- function(df, event, time, variables) {
  formula_str <- sprintf("Surv(%s, %s) ~ %s", time, event, paste(variables, collapse = "+"))
  coxph(as.formula(formula_str), data = df, x = TRUE)
}

### Helper Function to Compute Chi2 and Log-rank Tests
chi2Function <- function(df, event, time, model1, model2 = NULL) {
  formula_str <- sprintf("Surv(%s, %s) ~ 1", time, event)
  null_model <- coxph(as.formula(formula_str), data = df)
  comparison <- if (is.null(model2)) anova(null_model, model1) else anova(model1, model2)
  data.frame(Chi2 = comparison$Chisq[2], LR = comparison$`Pr(>|Chi|)`[2])
}

### Helper Function to Compare C-Indices
compareCindexList <- function(df, time, event, model1, model2) {
  scoreY <- predictSurvProb(model1, newdata = df, times = max(df[[time]]))
  scoreZ <- predictSurvProb(model2, newdata = df, times = max(df[[time]]))
  compareC(timeX = df[[time]], statusX = df[[event]], scoreY = scoreY, scoreZ = scoreZ)
}

### Helper Function for NRI and IDI Calculations
calculateNRI_IDI <- function(df, time, event, time_to_analyze, var1, var2) {
  t0 <- time_to_analyze * 12
  covs0 <- as.matrix(df[, var1])
  covs1 <- as.matrix(df[, var2])
  x <- IDI.INF(df[, c(time, event)], covs0, covs1, t0, npert = 300, alpha = 0.05, seed1 = 23)
  data.frame(IDI = x$m1, NRI = x$m2)
}

### Main Function to Compile Results
incremental_function_updated <- function(df, event, time, time_analyzed, ...) {
  df <- droplevels(df)
  list_vars <- list(...)
  
  models <- lapply(list_vars, function(vars) fitCoxModel(df, event, time, vars))
  names(models) <- paste("Model", seq_along(models))
  
  # Computing Chi2 and Log-rank Tests
  chi2_results <- lapply(models, function(model) chi2Function(df, event, time, model))
  
  # Comparing models for Chi2
  chi2_comparisons <- mapply(function(model1, model2) chi2Function(df, event, time, model1, model2), 
                             models[-length(models)], models[-1], SIMPLIFY = FALSE, USE.NAMES = TRUE)
  
  # Compute C-index comparisons
  c_index_comparisons <- mapply(function(model1, model2) compareCindexList(df, time, event, model1, model2), 
                                models[-length(models)], models[-1], SIMPLIFY = FALSE, USE.NAMES = TRUE)
  
  # Compute NRI and IDI
  nri_idi_results <- mapply(function(var1, var2) calculateNRI_IDI(df, time, event, time_analyzed, var1, var2), 
                            list_vars[1], list_vars[-1], SIMPLIFY = FALSE, USE.NAMES = TRUE)
  
  # Combine all results
  results <- list(
    Chi2 = chi2_results,
    Chi2Comparisons = chi2_comparisons,
    CIndexComparisons = c_index_comparisons,
    NRI_IDI = nri_idi_results
  )
  
  # Optional: Convert results list to a data frame
  results_df <- do.call(rbind, lapply(results, function(x) do.call(rbind, x)))
  return(results_df)
}

# Example usage
# df_all <- read.csv("path/to/data.csv")
# results <- incrementalFunction(df_all, "outcome_death", "outcome_FU_time_death", median(df_all$outcome_FU_time_death), c("demo_age"), c("demo_age", "CMR_LGE_ischemic_extent_categ"), c("demo_age", "CMR_LGE_ischemic_extent_categ", "CMR_LGE_midwall_presence"))
# results
