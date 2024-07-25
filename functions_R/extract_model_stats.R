# Function to extract model statistics
extract_model_stats <- function(model, show.coef = TRUE, conf_level = 0.95, decimals = 2) {
  
  # Extract coefficients and their confidence intervals
  coefficients <- coef(model)
  confint_coeffs <- confint(model, level = conf_level)
  
  # Compute the hazard ratios and their confidence intervals
  HR <- exp(coefficients)
  confint_model <- exp(confint(model, level = conf_level))
  
  # Build the format string for coefficients and HR
  format_str <- paste0("%.", decimals, "f")
  p_value_format_str <- "%.3f"  # Always use three decimals for p-values
  
  # Extract p-values and format them
  p_values <- summary(model)$coefficients[, "Pr(>|z|)"]
  formatted_p_values <- ifelse(p_values < 0.001, "<0.001", sprintf(p_value_format_str, p_values))
  
  # Create a data frame to store coefficients, hazard ratios, and other derived calculations
  data <- data.frame(
    Coefficients_CI = paste(sprintf(format_str, coefficients), 
                            "(", sprintf(format_str, confint_coeffs[, 1]), "-", 
                            sprintf(format_str, confint_coeffs[, 2]), ")"),
    HR_CI = paste(sprintf(format_str, HR), 
                  "(", sprintf(format_str, confint_model[, 1]), "-", 
                  sprintf(format_str, confint_model[, 2]), ")"),
    p_value = formatted_p_values
  )
  
  # Return the data frame based on show.coef flag
  if (show.coef) {
    return(data)
  } else {
    return(data[, c("HR_CI", "p_value")])
  }
}

# Example
# load(file = here("data","df_LGE.RData"))
# df <- df_LGE %>% mutate(
#   time = outcome_FU_time_death,
#   event = outcome_death,
#   var = CMR_LGE_ischemic_presence
# ) %>% droplevels()
# library(survival)
# library(dplyr)
# 
# model <- coxph(formula =  Surv(time, event) ~ CMR_LGE_ischemic_extent_count + CMR_LGE_ischemic_transmurality, data = df)
# data <- extract_model_stats(model, conf_level = 0.995, show.coef = FALSE, decimals = 3)
# data
