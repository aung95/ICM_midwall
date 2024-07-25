---
title: "ICM_midwall_main"
author: "Alexandre Unger"
date: "2024-07-25"
output:
  html_document:
    df_print: paged
    toc: true
    toc_depth: 2
    toc_float: 
      collapsed: false
      smooth_scroll: true
    number_sections: true
    theme: united
    highlight: tango
    code_folding: "hide"
    keep_md: yes
    fig_width: 7
    fig_height: 6
    fig_caption: true
---

# Setting up

# Package installation

```r
library(rmarkdown)             # Documentation generation
library(officer)              # Manipulating Microsoft Word documents
library(flextable)            # Creating formatted tables in Microsoft Word documents
library(tableHTML)            # Creating tables in HTML format
library(gtsummary)            # Creating summary tables
library(here)                 # Dealing with file path

# ---- dealing with data
library(dplyr)                # Data manipulation and transformation
library(tidyr)                # Data tidying
library(DataExplorer)         # Exploratory data analysis
library(compareGroups)        # Comparing groups
library(psych)                # Psychological statistics and data manipulation
library(Hmisc)                # Miscellaneous functions for data analysis
library(purrr)

# ---- Survival analysis
library(poptrend)             # Calculating p-trend in survival analysis
library(survival)             # Survival analysis
library(survivalAnalysis)     # Survival analysis functions
library(survminer)            # Drawing survival curves
library(adjustedCurves)       # Plotting adjusted survival curves
library(pammtools)            # Plotting adjusted survival curves
library(survIDINRI)           # Make reclassification and discrimination 
library(glmnet)               # Regularized regression models
library(olsrr)                # Variable selection at its best !
library(StepReg)                # Variable selection at its best !

# ---- Graphics
library(ggplot2)              # Data visualization
library(mctest)               # Multiple hypothesis testing --> assess colinearity between continuous variable
library(corrplot)             # Visualizing correlation matrices
library(fmsb)                 # Creating radar plots
library(concreg)              # Plotting adjusted survival curves
library(ggpubr)               # Associating the risk table when plotting


# My packages
# Function to source all R files in a specified directory
source_all <- function(directory_path) {
  # Obtain a list of R script files in the directory
  r_files <- list.files(directory_path, pattern = "\\.R$", full.names = TRUE)
  
  # Source each file
  for (file in r_files) {
    source(file)
  }
}

# Usage example:
# Assuming your scripts are stored in the 'Functions' directory within your project
source_all(here("Functions_R"))
```

# Data Download (RData).  
Using the data.management_ICM_Tradi_V4 results directly saved in RData. \n
* df_all : 6,082 patients \n
* df_LGE : 3,591 patients

```r
load(file = here("data","df_all.RData"))
load(file = here("data","df_LGE.RData"))
```

# All population (N=6,081)

## Descriptive
### Tab1-descr-all-LGE_midwall_presence

```r
Descr_table = createTable(compareGroups(
  CMR_LGE_midwall_presence ~ 
    demo_age + demo_gender + demo_BMI + CV_risk_diabete + 
    CV_risk_HTA + CV_risk_obesity + CV_risk_dyslipidemia + CV_risk_Smoking + 
    
    history_med_MI  + history_coronary_procedure + history_interv_PCI + 
    history_interv_CABG + med_periph_atheroma + history_stroke + 
    med_pacemaker + med_CKD + history_hospit_HF + history_AFib + clini_NYHA + 
    clini_cardiac_rythm + 
    
    CMR_LVEF + CMR_LVEDV + 
    CMR_LVESV + CMR_LV_mass + CMR_RV_dysfunction + 
    
    CMR_LGE_presence_ischemic_and_midwall +
    
    CMR_LGE_ischemic_presence + 
    CMR_LGE_ischemic_extent_count +
    CMR_LGE_ischemic_extent_categ +
    CMR_LGE_ischemic_transmurality +
    CMR_LGE_ischemic_location_4 +
    
    CMR_LGE_midwall_presence +
    CMR_LGE_midwall_extent_count + 
    CMR_LGE_midwall_extent_categ +
    CMR_LGE_midwall_location_3 + 
    CMR_LGE_midwall_location_4 +
    CMR_LGE_midwall_anterior +
    CMR_LGE_midwall_septal +
    CMR_LGE_midwall_inferior +
    CMR_LGE_midwall_lateral +
    CMR_LGE_midwall_apical +
    
    outcome_revascularisation_90days,
  data= df_all,
  method = 1, conf.level = 0.95),
  hide.no = "No",
  show.all=T, show.p.overall = T) 

export2md(Descr_table, strip=TRUE, first.strip=TRUE)
```

<table class="table table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Summary descriptives table by groups of `CMR_LGE_midwall_presence'</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> [ALL] </th>
   <th style="text-align:center;"> A_No_midwall_LGE </th>
   <th style="text-align:center;"> B_Presence_of_midwall_LGE </th>
   <th style="text-align:center;"> p.overall </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=6082 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=5380 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=702 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_age </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64.5 (11.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64.4 (11.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65.8 (11.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_gender </td>
   <td style="text-align:center;"> 4419 (72.7%) </td>
   <td style="text-align:center;"> 3894 (72.4%) </td>
   <td style="text-align:center;"> 525 (74.8%) </td>
   <td style="text-align:center;"> 0.193 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_BMI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.7 (5.33) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.6 (5.31) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.3 (5.43) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabete </td>
   <td style="text-align:center;"> 2309 (38.0%) </td>
   <td style="text-align:center;"> 1985 (36.9%) </td>
   <td style="text-align:center;"> 324 (46.2%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_HTA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3144 (51.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2665 (49.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 479 (68.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_obesity </td>
   <td style="text-align:center;"> 1687 (27.7%) </td>
   <td style="text-align:center;"> 1459 (27.1%) </td>
   <td style="text-align:center;"> 228 (32.5%) </td>
   <td style="text-align:center;"> 0.003 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_dyslipidemia </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3005 (49.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2619 (48.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 386 (55.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_Smoking </td>
   <td style="text-align:center;"> 1285 (21.1%) </td>
   <td style="text-align:center;"> 1144 (21.3%) </td>
   <td style="text-align:center;"> 141 (20.1%) </td>
   <td style="text-align:center;"> 0.503 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_med_MI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2354 (38.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2082 (38.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 272 (38.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_coronary_procedure </td>
   <td style="text-align:center;"> 5394 (88.7%) </td>
   <td style="text-align:center;"> 4775 (88.8%) </td>
   <td style="text-align:center;"> 619 (88.2%) </td>
   <td style="text-align:center;"> 0.696 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_interv_PCI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 380 (6.25%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 336 (6.25%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 44 (6.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_interv_CABG </td>
   <td style="text-align:center;"> 5085 (83.6%) </td>
   <td style="text-align:center;"> 4501 (83.7%) </td>
   <td style="text-align:center;"> 584 (83.2%) </td>
   <td style="text-align:center;"> 0.793 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_periph_atheroma </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 344 (5.66%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 298 (5.54%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 46 (6.55%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.314 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_stroke </td>
   <td style="text-align:center;"> 186 (3.06%) </td>
   <td style="text-align:center;"> 165 (3.07%) </td>
   <td style="text-align:center;"> 21 (2.99%) </td>
   <td style="text-align:center;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_pacemaker </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 41 (0.67%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28 (0.52%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 13 (1.85%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKD </td>
   <td style="text-align:center;"> 121 (1.99%) </td>
   <td style="text-align:center;"> 93 (1.73%) </td>
   <td style="text-align:center;"> 28 (3.99%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_hospit_HF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 368 (6.05%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 332 (6.17%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 36 (5.13%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.315 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFib </td>
   <td style="text-align:center;"> 453 (7.45%) </td>
   <td style="text-align:center;"> 377 (7.01%) </td>
   <td style="text-align:center;"> 76 (10.8%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> clini_NYHA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 753 (12.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 681 (12.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 72 (10.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.079 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> clini_cardiac_rythm </td>
   <td style="text-align:center;"> 426 (7.00%) </td>
   <td style="text-align:center;"> 360 (6.69%) </td>
   <td style="text-align:center;"> 66 (9.40%) </td>
   <td style="text-align:center;"> 0.010 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVEF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.7 (5.70) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.8 (5.69) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.3 (5.78) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.034 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEDV </td>
   <td style="text-align:center;"> 103 (21.5) </td>
   <td style="text-align:center;"> 103 (21.5) </td>
   <td style="text-align:center;"> 104 (21.6) </td>
   <td style="text-align:center;"> 0.188 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVESV </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 58.6 (17.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 58.5 (17.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 59.6 (17.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LV_mass </td>
   <td style="text-align:center;"> 91.0 (19.5) </td>
   <td style="text-align:center;"> 90.7 (19.7) </td>
   <td style="text-align:center;"> 93.5 (17.8) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_RV_dysfunction </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 218 (3.58%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 188 (3.49%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 30 (4.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.349 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_presence_ischemic_and_midwall </td>
   <td style="text-align:center;"> 354 (5.82%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 354 (50.4%) </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_presence: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2491 (41.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2143 (39.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Presence_of_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3591 (59.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3237 (60.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 354 (50.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:center;"> 1.83 (1.96) </td>
   <td style="text-align:center;"> 1.83 (1.91) </td>
   <td style="text-align:center;"> 1.83 (2.26) </td>
   <td style="text-align:center;"> 0.998 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_extent_categ: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2491 (41.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2143 (39.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_1_2_segments </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1392 (22.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1282 (23.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 110 (15.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_3_5_segments </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1953 (32.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1774 (33.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 179 (25.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_more6_segments </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 246 (4.04%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 181 (3.36%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65 (9.26%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_transmurality: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 2491 (41.0%) </td>
   <td style="text-align:center;"> 2143 (39.8%) </td>
   <td style="text-align:center;"> 348 (49.6%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Subendocardial&lt;50% </td>
   <td style="text-align:center;"> 1698 (27.9%) </td>
   <td style="text-align:center;"> 1572 (29.2%) </td>
   <td style="text-align:center;"> 126 (17.9%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_Subendocardial≥50% </td>
   <td style="text-align:center;"> 1549 (25.5%) </td>
   <td style="text-align:center;"> 1392 (25.9%) </td>
   <td style="text-align:center;"> 157 (22.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_Transmural </td>
   <td style="text-align:center;"> 344 (5.66%) </td>
   <td style="text-align:center;"> 273 (5.07%) </td>
   <td style="text-align:center;"> 71 (10.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_location_4: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2491 (41.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2143 (39.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_Neither_anterior_nor_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2662 (43.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2445 (45.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 217 (30.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_Anterior_without_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 422 (6.94%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 379 (7.04%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43 (6.13%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_Septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 507 (8.34%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 413 (7.68%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 94 (13.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_presence: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_midwall_LGE </td>
   <td style="text-align:center;"> 5380 (88.5%) </td>
   <td style="text-align:center;"> 5380 (100%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Presence_of_midwall_LGE </td>
   <td style="text-align:center;"> 702 (11.5%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 702 (100%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.13 (0.39) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.00 (0.00) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.14 (0.37) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> None </td>
   <td style="text-align:center;"> 5380 (88.5%) </td>
   <td style="text-align:center;"> 5380 (100%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Low_=1 </td>
   <td style="text-align:center;"> 610 (10.0%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 610 (86.9%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> High_&gt;1 </td>
   <td style="text-align:center;"> 92 (1.51%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 92 (13.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_location_3: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> No_midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 5380 (88.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 5380 (100%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 471 (7.74%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 471 (67.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 231 (3.80%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 231 (32.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> No_midwall_LGE </td>
   <td style="text-align:center;"> 5380 (88.5%) </td>
   <td style="text-align:center;"> 5380 (100%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;"> 471 (7.74%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 471 (67.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lateral_midwall_LGE </td>
   <td style="text-align:center;"> 118 (1.94%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 118 (16.8%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Septal_Midwall_LGE </td>
   <td style="text-align:center;"> 113 (1.86%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 113 (16.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_anterior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 140 (2.30%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 140 (19.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_septal </td>
   <td style="text-align:center;"> 113 (1.86%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 113 (16.1%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_inferior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 212 (3.49%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 212 (30.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_lateral </td>
   <td style="text-align:center;"> 124 (2.04%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 124 (17.7%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_apical </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 146 (2.40%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 146 (20.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> outcome_revascularisation_90days </td>
   <td style="text-align:center;"> 2773 (45.6%) </td>
   <td style="text-align:center;"> 2545 (47.3%) </td>
   <td style="text-align:center;"> 228 (32.5%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>

```r
export2word(x = Descr_table, 
            file = here(tables_output_dir, paste0("Tab1-descr-all-midwall_LGE_presence-",Sys.Date(), ".docx")), 
            which.table="descr", nmax=TRUE, header.labels=c(), 
            caption=NULL, strip=FALSE, first.strip=FALSE, background="#D2D2D2",
            size=NULL, header.background=NULL, header.color=NULL)
```
## Details of comparison {.tabset}
### LVEF

```r
# Parametric test (t-test)
t_test_LVEF <- t.test(
  subset(df_all, CMR_LGE_midwall_presence == "A_No_midwall_LGE")$CMR_LVEF,
  subset(df_all, CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE")$CMR_LVEF
)

# Non-parametric test (Wilcoxon test)
wilcox_test_LVEF <- wilcox.test(
  subset(df_all, CMR_LGE_midwall_presence == "A_No_midwall_LGE")$CMR_LVEF,
  subset(df_all, CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE")$CMR_LVEF
)

# Create a combined dataset for plotting
combined_data_LVEF <- df_all %>%
  filter(CMR_LGE_midwall_presence %in% c("A_No_midwall_LGE", "B_Presence_of_midwall_LGE")) %>%
  mutate(Group = case_when(
    CMR_LGE_midwall_presence == "A_No_midwall_LGE" ~ "No Midwall LGE",
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE" ~ "Midwall LGE"
  ))

# Generate a density plot using ggplot2
ggplot(combined_data_LVEF, aes(x = CMR_LVEF, color = Group, fill = Group)) +
  geom_density(alpha = 0.4) +
  labs(title = "Density Plot of CMR_LVEF by Midwall LGE Presence",
       x = "CMR_LVEF") +
  theme_minimal() +
  annotate("text", x = -Inf, y = Inf, label = paste0("t-test p-value: ", round(t_test_LVEF$p.value, 3)), hjust = -0.1, vjust = 1.5, size = 5, color = "black") +
  annotate("text", x = -Inf, y = Inf, label = paste0("Wilcoxon p-value: ", round(wilcox_test_LVEF$p.value, 3)), hjust = -0.1, vjust = 3, size = 5, color = "black")
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/figures_LVEF_comp-1.png)<!-- -->
### LVEDV

```r
# Parametric test (t-test)
t_test_LVEDV <- t.test(
  subset(df_all, CMR_LGE_midwall_presence == "A_No_midwall_LGE")$CMR_LVEDV,
  subset(df_all, CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE")$CMR_LVEDV
)

# Non-parametric test (Wilcoxon test)
wilcox_test_LVEDV <- wilcox.test(
  subset(df_all, CMR_LGE_midwall_presence == "A_No_midwall_LGE")$CMR_LVEDV,
  subset(df_all, CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE")$CMR_LVEDV
)

# Create a combined dataset for plotting
combined_data_LVEDV <- df_all %>%
  filter(CMR_LGE_midwall_presence %in% c("A_No_midwall_LGE", "B_Presence_of_midwall_LGE")) %>%
  mutate(Group = case_when(
    CMR_LGE_midwall_presence == "A_No_midwall_LGE" ~ "No Midwall LGE",
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE" ~ "Midwall LGE"
  ))

# Generate a density plot using ggplot2
ggplot(combined_data_LVEDV, aes(x = CMR_LVEDV, color = Group, fill = Group)) +
  geom_density(alpha = 0.4) +
  labs(title = "Density Plot of CMR_LVEDV by Midwall LGE Presence",
       x = "CMR_LVEDV") +
  theme_minimal() +
  annotate("text", x = -Inf, y = Inf, label = paste0("t-test p-value: ", round(t_test_LVEDV$p.value, 3)), hjust = -0.1, vjust = 1.5, size = 5, color = "black") +
  annotate("text", x = -Inf, y = Inf, label = paste0("Wilcoxon p-value: ", round(wilcox_test_LVEDV$p.value, 3)), hjust = -0.1, vjust = 3, size = 5, color = "black")
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/figures_LVED_comp-1.png)<!-- -->
### Tab2-descr-all-center

```r
Descr_table = createTable(compareGroups(
  demo_center ~ 
    demo_age + demo_gender + demo_BMI + CV_risk_diabete + 
    CV_risk_HTA + CV_risk_obesity + CV_risk_dyslipidemia + CV_risk_Smoking + 
    
    history_med_MI  + history_coronary_procedure + history_interv_PCI + 
    history_interv_CABG + med_periph_atheroma + history_stroke + 
    med_pacemaker + med_CKD + history_hospit_HF + history_AFib + clini_NYHA + 
    clini_cardiac_rythm + 
    
    CMR_LVEF + CMR_LVEDV + 
    CMR_LVESV + CMR_LV_mass + CMR_RV_dysfunction + 
    
    CMR_LGE_ischemic_presence + 
    CMR_LGE_ischemic_extent_count +
    CMR_LGE_ischemic_transmurality +
    CMR_LGE_ischemic_location_4 +
    
    CMR_LGE_midwall_presence +
    CMR_LGE_midwall_extent_count + 
    CMR_LGE_midwall_location_3 + 
    CMR_LGE_midwall_location_4 +
    
    CMR_LGE_midwall_anterior +
    CMR_LGE_midwall_septal +
    CMR_LGE_midwall_inferior +
    CMR_LGE_midwall_lateral +
    CMR_LGE_midwall_apical +
    
    outcome_revascularisation_90days,
  data = df_all,
  method = 1, conf.level = 0.95),
  hide.no = "No",
  show.all=T, show.p.overall = T)

export2md(Descr_table, strip=TRUE, first.strip=TRUE)
```

<table class="table table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Summary descriptives table by groups of `demo_center'</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> [ALL] </th>
   <th style="text-align:center;"> ICPS </th>
   <th style="text-align:center;"> Lariboisiere </th>
   <th style="text-align:center;"> p.overall </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=6082 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=5214 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=868 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_age </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64.5 (11.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64.4 (11.9) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65.3 (11.4) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_gender </td>
   <td style="text-align:center;"> 4419 (72.7%) </td>
   <td style="text-align:center;"> 3738 (71.7%) </td>
   <td style="text-align:center;"> 681 (78.5%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_BMI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.7 (5.33) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.7 (5.34) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.8 (5.24) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.658 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabete </td>
   <td style="text-align:center;"> 2309 (38.0%) </td>
   <td style="text-align:center;"> 1850 (35.5%) </td>
   <td style="text-align:center;"> 459 (52.9%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_HTA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3144 (51.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2698 (51.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 446 (51.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.872 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_obesity </td>
   <td style="text-align:center;"> 1687 (27.7%) </td>
   <td style="text-align:center;"> 1452 (27.8%) </td>
   <td style="text-align:center;"> 235 (27.1%) </td>
   <td style="text-align:center;"> 0.667 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_dyslipidemia </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3005 (49.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2571 (49.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 434 (50.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.734 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_Smoking </td>
   <td style="text-align:center;"> 1285 (21.1%) </td>
   <td style="text-align:center;"> 1092 (20.9%) </td>
   <td style="text-align:center;"> 193 (22.2%) </td>
   <td style="text-align:center;"> 0.413 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_med_MI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2354 (38.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1929 (37.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 425 (49.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_coronary_procedure </td>
   <td style="text-align:center;"> 5394 (88.7%) </td>
   <td style="text-align:center;"> 4657 (89.3%) </td>
   <td style="text-align:center;"> 737 (84.9%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_interv_PCI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 380 (6.25%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 278 (5.33%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 102 (11.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_interv_CABG </td>
   <td style="text-align:center;"> 5085 (83.6%) </td>
   <td style="text-align:center;"> 4439 (85.1%) </td>
   <td style="text-align:center;"> 646 (74.4%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_periph_atheroma </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 344 (5.66%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 294 (5.64%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 50 (5.76%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.949 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_stroke </td>
   <td style="text-align:center;"> 186 (3.06%) </td>
   <td style="text-align:center;"> 160 (3.07%) </td>
   <td style="text-align:center;"> 26 (3.00%) </td>
   <td style="text-align:center;"> 0.992 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_pacemaker </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 41 (0.67%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 37 (0.71%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 4 (0.46%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.545 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKD </td>
   <td style="text-align:center;"> 121 (1.99%) </td>
   <td style="text-align:center;"> 111 (2.13%) </td>
   <td style="text-align:center;"> 10 (1.15%) </td>
   <td style="text-align:center;"> 0.076 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_hospit_HF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 368 (6.05%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 306 (5.87%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 62 (7.14%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.167 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFib </td>
   <td style="text-align:center;"> 453 (7.45%) </td>
   <td style="text-align:center;"> 395 (7.58%) </td>
   <td style="text-align:center;"> 58 (6.68%) </td>
   <td style="text-align:center;"> 0.390 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> clini_NYHA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 753 (12.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 645 (12.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (12.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.997 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> clini_cardiac_rythm </td>
   <td style="text-align:center;"> 426 (7.00%) </td>
   <td style="text-align:center;"> 367 (7.04%) </td>
   <td style="text-align:center;"> 59 (6.80%) </td>
   <td style="text-align:center;"> 0.852 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVEF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.7 (5.70) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.8 (5.53) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.1 (6.61) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEDV </td>
   <td style="text-align:center;"> 103 (21.5) </td>
   <td style="text-align:center;"> 103 (20.9) </td>
   <td style="text-align:center;"> 104 (25.0) </td>
   <td style="text-align:center;"> 0.189 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVESV </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 58.6 (17.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 58.4 (17.3) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 59.9 (20.3) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.035 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LV_mass </td>
   <td style="text-align:center;"> 91.0 (19.5) </td>
   <td style="text-align:center;"> 91.0 (19.4) </td>
   <td style="text-align:center;"> 91.6 (19.8) </td>
   <td style="text-align:center;"> 0.399 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_RV_dysfunction </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 218 (3.58%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 174 (3.34%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 44 (5.07%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.015 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_presence: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> No_ischemic_LGE </td>
   <td style="text-align:center;"> 2491 (41.0%) </td>
   <td style="text-align:center;"> 2314 (44.4%) </td>
   <td style="text-align:center;"> 177 (20.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Presence_of_ischemic_LGE </td>
   <td style="text-align:center;"> 3591 (59.0%) </td>
   <td style="text-align:center;"> 2900 (55.6%) </td>
   <td style="text-align:center;"> 691 (79.6%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.83 (1.96) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.74 (1.96) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2.37 (1.85) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_transmurality: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 2491 (41.0%) </td>
   <td style="text-align:center;"> 2314 (44.4%) </td>
   <td style="text-align:center;"> 177 (20.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Subendocardial&lt;50% </td>
   <td style="text-align:center;"> 1698 (27.9%) </td>
   <td style="text-align:center;"> 1355 (26.0%) </td>
   <td style="text-align:center;"> 343 (39.5%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_Subendocardial≥50% </td>
   <td style="text-align:center;"> 1549 (25.5%) </td>
   <td style="text-align:center;"> 1268 (24.3%) </td>
   <td style="text-align:center;"> 281 (32.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_Transmural </td>
   <td style="text-align:center;"> 344 (5.66%) </td>
   <td style="text-align:center;"> 277 (5.31%) </td>
   <td style="text-align:center;"> 67 (7.72%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_location_4: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2491 (41.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2314 (44.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 177 (20.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_Neither_anterior_nor_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2662 (43.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2136 (41.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 526 (60.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_Anterior_without_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 422 (6.94%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 351 (6.73%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 71 (8.18%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_Septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 507 (8.34%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 413 (7.92%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 94 (10.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_presence: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_midwall_LGE </td>
   <td style="text-align:center;"> 5380 (88.5%) </td>
   <td style="text-align:center;"> 4581 (87.9%) </td>
   <td style="text-align:center;"> 799 (92.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Presence_of_midwall_LGE </td>
   <td style="text-align:center;"> 702 (11.5%) </td>
   <td style="text-align:center;"> 633 (12.1%) </td>
   <td style="text-align:center;"> 69 (7.95%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.13 (0.39) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.14 (0.39) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.10 (0.35) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_3: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> No_midwall_LGE </td>
   <td style="text-align:center;"> 5380 (88.5%) </td>
   <td style="text-align:center;"> 4581 (87.9%) </td>
   <td style="text-align:center;"> 799 (92.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;"> 471 (7.74%) </td>
   <td style="text-align:center;"> 426 (8.17%) </td>
   <td style="text-align:center;"> 45 (5.18%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:center;"> 231 (3.80%) </td>
   <td style="text-align:center;"> 207 (3.97%) </td>
   <td style="text-align:center;"> 24 (2.76%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_location_4: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.004 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> No_midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 5380 (88.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 4581 (87.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 799 (92.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 471 (7.74%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 426 (8.17%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 45 (5.18%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Lateral_midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 118 (1.94%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 104 (1.99%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (1.61%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Septal_Midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (1.86%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 103 (1.98%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10 (1.15%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_anterior </td>
   <td style="text-align:center;"> 140 (2.30%) </td>
   <td style="text-align:center;"> 132 (2.53%) </td>
   <td style="text-align:center;"> 8 (0.92%) </td>
   <td style="text-align:center;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (1.86%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 103 (1.98%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10 (1.15%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.127 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_inferior </td>
   <td style="text-align:center;"> 212 (3.49%) </td>
   <td style="text-align:center;"> 191 (3.66%) </td>
   <td style="text-align:center;"> 21 (2.42%) </td>
   <td style="text-align:center;"> 0.080 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_lateral </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 124 (2.04%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 110 (2.11%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (1.61%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.407 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_apical </td>
   <td style="text-align:center;"> 146 (2.40%) </td>
   <td style="text-align:center;"> 127 (2.44%) </td>
   <td style="text-align:center;"> 19 (2.19%) </td>
   <td style="text-align:center;"> 0.749 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> outcome_revascularisation_90days </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2773 (45.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2235 (42.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 538 (62.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>

```r
export2word(x = Descr_table, 
            file = here(tables_output_dir, paste0("Tab2-descr-all-center-",Sys.Date(), ".docx")), 
            which.table="descr", nmax=TRUE, header.labels=c(), 
            caption=NULL, strip=FALSE, first.strip=FALSE, background="#D2D2D2",
            size=NULL, header.background=NULL, header.color=NULL)
```

## Survival
### Tab3-univ-all-death

```r
df_selected <- df_all %>%
  mutate(
    surv.event = Surv(
      time = outcome_FU_time_death,
      event = outcome_death
    ),
    CMR_LVEF_5 = CMR_LVEF/5,
    CMR_LVEDV_5 = CMR_LVEDV/10,
    CMR_LVESV_5 = CMR_LVESV/10
  )

model <- coxph(formula = surv.event ~ CMR_LGE_midwall_presence, data = df_selected)
print("CMR_LGE_midwall_presence univariate analysis for all-cause death")
```

```
## [1] "CMR_LGE_midwall_presence univariate analysis for all-cause death"
```

```r
extract_model_stats(model, conf_level = 0.95, show.coef = F, decimals = 3)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"2.848 ( 2.391 - 3.393 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
Descr_table = createTable(compareGroups(
  surv.event ~ 
    demo_age + demo_gender + demo_BMI + CV_risk_diabete + 
    CV_risk_HTA + CV_risk_obesity + CV_risk_dyslipidemia + CV_risk_Smoking + 
    
    history_med_MI  + history_coronary_procedure + history_interv_PCI + 
    history_interv_CABG + med_periph_atheroma + history_stroke + 
    med_pacemaker + med_CKD + history_hospit_HF + history_AFib + clini_NYHA + 
    clini_cardiac_rythm + 
    
   outcome_revascularisation_90days +
    
    CMR_LVEF_5 + CMR_LVEDV_5 + 
    CMR_LVESV_5 + CMR_LV_mass + CMR_RV_dysfunction + 
    
    CMR_LGE_presence_ischemic_and_midwall +
    
    CMR_LGE_ischemic_presence + 
    CMR_LGE_ischemic_extent_count +
    CMR_LGE_ischemic_extent_categ +
    CMR_LGE_ischemic_transmurality +
    CMR_LGE_ischemic_location_4 +
    
    CMR_LGE_ischemic_anterior + 
    CMR_LGE_ischemic_septal +
    CMR_LGE_ischemic_inferior +
    CMR_LGE_ischemic_lateral +
    CMR_LGE_ischemic_Apical +
    
    CMR_LGE_midwall_presence +
    CMR_LGE_midwall_extent_count + 
    CMR_LGE_midwall_extent_categ +
    CMR_LGE_midwall_location_3 + 
    CMR_LGE_midwall_location_4 +
    CMR_LGE_midwall_anterior +
    CMR_LGE_midwall_septal +
    CMR_LGE_midwall_inferior +
    CMR_LGE_midwall_lateral +
    CMR_LGE_midwall_apical,
  data= df_selected,
  method = 1, conf.level = 0.95),
  hide.no = "No",
  show.ratio =T, show.p.ratio =  T) 

export2md(Descr_table, strip=TRUE, first.strip=TRUE)
```

<table class="table table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Summary descriptives table by groups of `surv.event'</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> No event </th>
   <th style="text-align:center;"> Event </th>
   <th style="text-align:center;"> HR </th>
   <th style="text-align:center;"> p.ratio </th>
   <th style="text-align:center;"> p.overall </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=5430 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=652 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_age </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64.1 (11.8) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 68.3 (11.3) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.03 [1.02;1.04] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_gender </td>
   <td style="text-align:center;"> 3843 (70.8%) </td>
   <td style="text-align:center;"> 576 (88.3%) </td>
   <td style="text-align:center;"> 2.83 [2.23;3.59] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_BMI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.7 (5.30) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.8 (5.57) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.01 [0.99;1.02] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.490 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.490 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabete </td>
   <td style="text-align:center;"> 1945 (35.8%) </td>
   <td style="text-align:center;"> 364 (55.8%) </td>
   <td style="text-align:center;"> 2.09 [1.79;2.44] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_HTA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2817 (51.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 327 (50.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.92 [0.79;1.07] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.277 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.276 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_obesity </td>
   <td style="text-align:center;"> 1509 (27.8%) </td>
   <td style="text-align:center;"> 178 (27.3%) </td>
   <td style="text-align:center;"> 0.98 [0.82;1.16] </td>
   <td style="text-align:center;"> 0.804 </td>
   <td style="text-align:center;"> 0.805 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_dyslipidemia </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2677 (49.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 328 (50.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.04 [0.89;1.21] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.637 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.634 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_Smoking </td>
   <td style="text-align:center;"> 1137 (20.9%) </td>
   <td style="text-align:center;"> 148 (22.7%) </td>
   <td style="text-align:center;"> 1.08 [0.90;1.30] </td>
   <td style="text-align:center;"> 0.401 </td>
   <td style="text-align:center;"> 0.402 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_med_MI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2090 (38.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 264 (40.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.08 [0.92;1.26] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.342 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.341 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_coronary_procedure </td>
   <td style="text-align:center;"> 4817 (88.7%) </td>
   <td style="text-align:center;"> 577 (88.5%) </td>
   <td style="text-align:center;"> 0.98 [0.77;1.25] </td>
   <td style="text-align:center;"> 0.878 </td>
   <td style="text-align:center;"> 0.879 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_interv_PCI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 310 (5.71%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 70 (10.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.74 [1.35;2.24] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_interv_CABG </td>
   <td style="text-align:center;"> 4566 (84.1%) </td>
   <td style="text-align:center;"> 519 (79.6%) </td>
   <td style="text-align:center;"> 0.78 [0.64;0.95] </td>
   <td style="text-align:center;"> 0.011 </td>
   <td style="text-align:center;"> 0.011 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_periph_atheroma </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 276 (5.08%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 68 (10.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.97 [1.53;2.53] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_stroke </td>
   <td style="text-align:center;"> 150 (2.76%) </td>
   <td style="text-align:center;"> 36 (5.52%) </td>
   <td style="text-align:center;"> 1.92 [1.37;2.69] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_pacemaker </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 38 (0.70%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3 (0.46%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.71 [0.23;2.21] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.556 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.555 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKD </td>
   <td style="text-align:center;"> 84 (1.55%) </td>
   <td style="text-align:center;"> 37 (5.67%) </td>
   <td style="text-align:center;"> 3.98 [2.86;5.55] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_hospit_HF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 286 (5.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 82 (12.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2.32 [1.84;2.92] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFib </td>
   <td style="text-align:center;"> 382 (7.03%) </td>
   <td style="text-align:center;"> 71 (10.9%) </td>
   <td style="text-align:center;"> 1.60 [1.25;2.05] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> clini_NYHA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 668 (12.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 85 (13.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.02 [0.81;1.28] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.885 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.884 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> clini_cardiac_rythm </td>
   <td style="text-align:center;"> 368 (6.78%) </td>
   <td style="text-align:center;"> 58 (8.90%) </td>
   <td style="text-align:center;"> 1.34 [1.02;1.75] </td>
   <td style="text-align:center;"> 0.036 </td>
   <td style="text-align:center;"> 0.034 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> outcome_revascularisation_90days </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2525 (46.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 248 (38.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.73 [0.62;0.85] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEF_5 </td>
   <td style="text-align:center;"> 8.79 (1.12) </td>
   <td style="text-align:center;"> 8.43 (1.28) </td>
   <td style="text-align:center;"> 0.82 [0.77;0.87] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVEDV_5 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10.3 (2.12) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10.6 (2.40) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.05 [1.02;1.09] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.002 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVESV_5 </td>
   <td style="text-align:center;"> 5.82 (1.75) </td>
   <td style="text-align:center;"> 6.19 (1.96) </td>
   <td style="text-align:center;"> 1.09 [1.05;1.13] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LV_mass </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 91.1 (19.5) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 90.9 (19.5) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.00 [1.00;1.00] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.772 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.772 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_RV_dysfunction </td>
   <td style="text-align:center;"> 153 (2.82%) </td>
   <td style="text-align:center;"> 65 (9.97%) </td>
   <td style="text-align:center;"> 3.32 [2.57;4.29] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_presence_ischemic_and_midwall </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 223 (4.11%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 131 (20.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 4.44 [3.66;5.38] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_presence: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> No_ischemic_LGE </td>
   <td style="text-align:center;"> 2388 (44.0%) </td>
   <td style="text-align:center;"> 103 (15.8%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Presence_of_ischemic_LGE </td>
   <td style="text-align:center;"> 3042 (56.0%) </td>
   <td style="text-align:center;"> 549 (84.2%) </td>
   <td style="text-align:center;"> 3.76 [3.05;4.64] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.53 (1.66) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 4.30 (2.44) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.70 [1.65;1.76] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 2388 (44.0%) </td>
   <td style="text-align:center;"> 103 (15.8%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_1_2_segments </td>
   <td style="text-align:center;"> 1369 (25.2%) </td>
   <td style="text-align:center;"> 23 (3.53%) </td>
   <td style="text-align:center;"> 0.41 [0.26;0.64] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_3_5_segments </td>
   <td style="text-align:center;"> 1659 (30.6%) </td>
   <td style="text-align:center;"> 294 (45.1%) </td>
   <td style="text-align:center;"> 3.64 [2.91;4.55] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_more6_segments </td>
   <td style="text-align:center;"> 14 (0.26%) </td>
   <td style="text-align:center;"> 232 (35.6%) </td>
   <td style="text-align:center;"> 27.7 [22.0;35.0] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_transmurality: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2388 (44.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 103 (15.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_Subendocardial&lt;50% </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1619 (29.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 79 (12.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.14 [0.85;1.53] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.386 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_Subendocardial≥50% </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1290 (23.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 259 (39.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 4.06 [3.23;5.10] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_Transmural </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 133 (2.45%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 211 (32.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 16.7 [13.2;21.1] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 2388 (44.0%) </td>
   <td style="text-align:center;"> 103 (15.8%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Neither_anterior_nor_septal </td>
   <td style="text-align:center;"> 2563 (47.2%) </td>
   <td style="text-align:center;"> 99 (15.2%) </td>
   <td style="text-align:center;"> 0.89 [0.67;1.17] </td>
   <td style="text-align:center;"> 0.395 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_Anterior_without_septal </td>
   <td style="text-align:center;"> 317 (5.84%) </td>
   <td style="text-align:center;"> 105 (16.1%) </td>
   <td style="text-align:center;"> 6.40 [4.88;8.40] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_Septal </td>
   <td style="text-align:center;"> 162 (2.98%) </td>
   <td style="text-align:center;"> 345 (52.9%) </td>
   <td style="text-align:center;"> 19.4 [15.5;24.1] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_anterior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 384 (7.07%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 402 (61.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 12.4 [10.6;14.5] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_septal </td>
   <td style="text-align:center;"> 162 (2.98%) </td>
   <td style="text-align:center;"> 345 (52.9%) </td>
   <td style="text-align:center;"> 14.6 [12.5;17.0] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_inferior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1097 (20.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 117 (17.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.88 [0.72;1.08] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.218 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.216 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_lateral </td>
   <td style="text-align:center;"> 966 (17.8%) </td>
   <td style="text-align:center;"> 229 (35.1%) </td>
   <td style="text-align:center;"> 2.20 [1.87;2.59] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_Apical </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 875 (16.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 293 (44.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.54 [3.03;4.13] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_presence: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_midwall_LGE </td>
   <td style="text-align:center;"> 4901 (90.3%) </td>
   <td style="text-align:center;"> 479 (73.5%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Presence_of_midwall_LGE </td>
   <td style="text-align:center;"> 529 (9.74%) </td>
   <td style="text-align:center;"> 173 (26.5%) </td>
   <td style="text-align:center;"> 2.85 [2.39;3.39] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.10 (0.31) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.39 (0.71) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2.63 [2.35;2.95] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> None </td>
   <td style="text-align:center;"> 4901 (90.3%) </td>
   <td style="text-align:center;"> 479 (73.5%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Low_=1 </td>
   <td style="text-align:center;"> 510 (9.39%) </td>
   <td style="text-align:center;"> 100 (15.3%) </td>
   <td style="text-align:center;"> 1.88 [1.52;2.33] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> High_&gt;1 </td>
   <td style="text-align:center;"> 19 (0.35%) </td>
   <td style="text-align:center;"> 73 (11.2%) </td>
   <td style="text-align:center;"> 10.3 [8.03;13.2] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_location_3: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> No_midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 4901 (90.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 479 (73.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 406 (7.48%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65 (9.97%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.53 [1.18;1.98] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 123 (2.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (16.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 5.94 [4.81;7.32] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> No_midwall_LGE </td>
   <td style="text-align:center;"> 4901 (90.3%) </td>
   <td style="text-align:center;"> 479 (73.5%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;"> 406 (7.48%) </td>
   <td style="text-align:center;"> 65 (9.97%) </td>
   <td style="text-align:center;"> 1.53 [1.18;1.98] </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lateral_midwall_LGE </td>
   <td style="text-align:center;"> 64 (1.18%) </td>
   <td style="text-align:center;"> 54 (8.28%) </td>
   <td style="text-align:center;"> 6.03 [4.55;7.99] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Septal_Midwall_LGE </td>
   <td style="text-align:center;"> 59 (1.09%) </td>
   <td style="text-align:center;"> 54 (8.28%) </td>
   <td style="text-align:center;"> 5.84 [4.40;7.77] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_anterior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (2.08%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27 (4.14%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.62 [1.10;2.39] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.015 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.012 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_septal </td>
   <td style="text-align:center;"> 59 (1.09%) </td>
   <td style="text-align:center;"> 54 (8.28%) </td>
   <td style="text-align:center;"> 5.16 [3.90;6.85] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_inferior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 166 (3.06%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 46 (7.06%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2.46 [1.82;3.32] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_lateral </td>
   <td style="text-align:center;"> 64 (1.18%) </td>
   <td style="text-align:center;"> 60 (9.20%) </td>
   <td style="text-align:center;"> 5.75 [4.41;7.50] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_apical </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 132 (2.43%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (2.15%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.79 [0.46;1.34] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.382 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.370 </td>
  </tr>
</tbody>
</table>

```r
export2word(x = Descr_table, 
            file = here(tables_output_dir, paste0("Tab3-univ-all-death-",Sys.Date(), ".docx")), 
            which.table="descr", nmax=TRUE, header.labels=c(), 
            caption=NULL, strip=FALSE, first.strip=FALSE, background="#D2D2D2",
            size=NULL, header.background=NULL, header.color=NULL)
```
### Tab4-multi-all-death

```r
df <- df_all %>% mutate(
  event = outcome_death,
  time = outcome_FU_time_death,
  CMR_LVEF_5 = CMR_LVEF/5
) %>% select(
  event, time,
  demo_age, demo_gender, demo_BMI , CV_risk_diabete , CV_risk_Smoking , CV_risk_HTA,  CV_risk_Smoking, CV_risk_dyslipidemia ,  history_hospit_HF, history_AFib, med_CKD, history_med_MI , CMR_LVEF_5, CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_presence, CMR_LGE_midwall_location_3, CMR_LGE_midwall_extent_count, outcome_revascularisation_90days) %>% droplevels()

# Define models
models <- list(
  model1 = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LVEF_5)),
  model2 = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LGE_ischemic_extent_count)),
  model3A = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_presence)),
  model3B = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_location_3)),
  model3C = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_extent_count))
)

# Extract model statistics and combine
model_stats <- lapply(models, extract_model_stats) # adaptation possible to have more decimals

# Rename the columns in each dataframe to include the model name
model_stats_named <- lapply(names(model_stats), function(model_name) {
  data <- model_stats[[model_name]]
  # Ensure row names are in a column (if not already)
  if (!"A_Variable" %in% colnames(data)) {
    data$A_Variable <- rownames(data)
  }
  # Rename other columns to include the model name for uniqueness
  colnames(data)[-which(colnames(data) == "A_Variable")] <- paste(colnames(data)[-which(colnames(data) == "A_Variable")], model_name, sep = "_")
  return(data)
})

# Combine all models using full_join, join by 'Variable'
combined_models <- purrr::reduce(model_stats_named, full_join, by = "A_Variable")

# Set 'Variable' as rownames and remove 'Variable' from the dataframe columns
rownames(combined_models) <- combined_models$A_Variable
combined_models$A_Variable <- NULL


# export in html
knitr::kable(combined_models, caption = "Models multi- all pop (N=6,082)", format = "html") %>%
  kableExtra::kable_styling(full_width = F, bootstrap_options = c("striped", "hover", "condensed", "bordered"))
```

<table class="table table-striped table-hover table-condensed table-bordered" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Models multi- all pop (N=6,082)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> HR_CI_model1 </th>
   <th style="text-align:left;"> p_value_model1 </th>
   <th style="text-align:left;"> HR_CI_model2 </th>
   <th style="text-align:left;"> p_value_model2 </th>
   <th style="text-align:left;"> HR_CI_model3A </th>
   <th style="text-align:left;"> p_value_model3A </th>
   <th style="text-align:left;"> HR_CI_model3B </th>
   <th style="text-align:left;"> p_value_model3B </th>
   <th style="text-align:left;"> HR_CI_model3C </th>
   <th style="text-align:left;"> p_value_model3C </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> demo_age </td>
   <td style="text-align:left;"> 1.03 ( 1.03 - 1.04 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.02 ( 1.02 - 1.03 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.02 ( 1.01 - 1.03 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.02 ( 1.01 - 1.03 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.02 ( 1.01 - 1.03 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_genderYes </td>
   <td style="text-align:left;"> 2.69 ( 2.11 - 3.43 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.24 ( 1.76 - 2.86 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.29 ( 1.80 - 2.92 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.29 ( 1.80 - 2.92 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.33 ( 1.82 - 2.97 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_BMI </td>
   <td style="text-align:left;"> 1.01 ( 0.99 - 1.02 ) </td>
   <td style="text-align:left;"> 0.543 </td>
   <td style="text-align:left;"> 1.01 ( 1.00 - 1.03 ) </td>
   <td style="text-align:left;"> 0.167 </td>
   <td style="text-align:left;"> 1.01 ( 0.99 - 1.03 ) </td>
   <td style="text-align:left;"> 0.324 </td>
   <td style="text-align:left;"> 1.01 ( 0.99 - 1.03 ) </td>
   <td style="text-align:left;"> 0.173 </td>
   <td style="text-align:left;"> 1.01 ( 0.99 - 1.02 ) </td>
   <td style="text-align:left;"> 0.475 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabeteYes </td>
   <td style="text-align:left;"> 1.94 ( 1.65 - 2.28 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.56 ( 1.33 - 1.83 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.56 ( 1.33 - 1.83 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.52 ( 1.30 - 1.79 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.51 ( 1.28 - 1.77 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_SmokingYes </td>
   <td style="text-align:left;"> 1.27 ( 1.05 - 1.54 ) </td>
   <td style="text-align:left;"> 0.015 </td>
   <td style="text-align:left;"> 1.25 ( 1.03 - 1.52 ) </td>
   <td style="text-align:left;"> 0.025 </td>
   <td style="text-align:left;"> 1.29 ( 1.06 - 1.57 ) </td>
   <td style="text-align:left;"> 0.011 </td>
   <td style="text-align:left;"> 1.26 ( 1.03 - 1.54 ) </td>
   <td style="text-align:left;"> 0.022 </td>
   <td style="text-align:left;"> 1.25 ( 1.02 - 1.52 ) </td>
   <td style="text-align:left;"> 0.028 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_HTAYes </td>
   <td style="text-align:left;"> 0.76 ( 0.64 - 0.89 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 0.78 ( 0.66 - 0.92 ) </td>
   <td style="text-align:left;"> 0.004 </td>
   <td style="text-align:left;"> 0.76 ( 0.64 - 0.90 ) </td>
   <td style="text-align:left;"> 0.001 </td>
   <td style="text-align:left;"> 0.79 ( 0.67 - 0.93 ) </td>
   <td style="text-align:left;"> 0.006 </td>
   <td style="text-align:left;"> 0.79 ( 0.67 - 0.93 ) </td>
   <td style="text-align:left;"> 0.006 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_dyslipidemiaYes </td>
   <td style="text-align:left;"> 0.98 ( 0.84 - 1.15 ) </td>
   <td style="text-align:left;"> 0.827 </td>
   <td style="text-align:left;"> 0.99 ( 0.84 - 1.16 ) </td>
   <td style="text-align:left;"> 0.877 </td>
   <td style="text-align:left;"> 1.03 ( 0.88 - 1.21 ) </td>
   <td style="text-align:left;"> 0.734 </td>
   <td style="text-align:left;"> 1.05 ( 0.89 - 1.23 ) </td>
   <td style="text-align:left;"> 0.562 </td>
   <td style="text-align:left;"> 1.07 ( 0.91 - 1.25 ) </td>
   <td style="text-align:left;"> 0.424 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_hospit_HFYes </td>
   <td style="text-align:left;"> 1.69 ( 1.32 - 2.16 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.27 ( 0.98 - 1.64 ) </td>
   <td style="text-align:left;"> 0.068 </td>
   <td style="text-align:left;"> 1.35 ( 1.05 - 1.74 ) </td>
   <td style="text-align:left;"> 0.021 </td>
   <td style="text-align:left;"> 1.26 ( 0.98 - 1.64 ) </td>
   <td style="text-align:left;"> 0.073 </td>
   <td style="text-align:left;"> 1.41 ( 1.09 - 1.83 ) </td>
   <td style="text-align:left;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFibYes </td>
   <td style="text-align:left;"> 1.02 ( 0.79 - 1.31 ) </td>
   <td style="text-align:left;"> 0.903 </td>
   <td style="text-align:left;"> 0.95 ( 0.74 - 1.23 ) </td>
   <td style="text-align:left;"> 0.723 </td>
   <td style="text-align:left;"> 0.98 ( 0.76 - 1.27 ) </td>
   <td style="text-align:left;"> 0.898 </td>
   <td style="text-align:left;"> 0.94 ( 0.73 - 1.22 ) </td>
   <td style="text-align:left;"> 0.667 </td>
   <td style="text-align:left;"> 1.00 ( 0.77 - 1.29 ) </td>
   <td style="text-align:left;"> 0.976 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKDYes </td>
   <td style="text-align:left;"> 2.82 ( 2.00 - 3.99 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.64 ( 1.87 - 3.73 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.66 ( 1.88 - 3.75 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.78 ( 1.97 - 3.92 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.70 ( 1.91 - 3.81 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_med_MIYes </td>
   <td style="text-align:left;"> 1.02 ( 0.86 - 1.19 ) </td>
   <td style="text-align:left;"> 0.854 </td>
   <td style="text-align:left;"> 1.00 ( 0.85 - 1.17 ) </td>
   <td style="text-align:left;"> 0.982 </td>
   <td style="text-align:left;"> 0.99 ( 0.84 - 1.16 ) </td>
   <td style="text-align:left;"> 0.865 </td>
   <td style="text-align:left;"> 0.99 ( 0.84 - 1.17 ) </td>
   <td style="text-align:left;"> 0.898 </td>
   <td style="text-align:left;"> 0.99 ( 0.84 - 1.16 ) </td>
   <td style="text-align:left;"> 0.860 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEF_5 </td>
   <td style="text-align:left;"> 0.90 ( 0.85 - 0.96 ) </td>
   <td style="text-align:left;"> 0.002 </td>
   <td style="text-align:left;"> 0.93 ( 0.87 - 0.99 ) </td>
   <td style="text-align:left;"> 0.023 </td>
   <td style="text-align:left;"> 0.95 ( 0.89 - 1.01 ) </td>
   <td style="text-align:left;"> 0.111 </td>
   <td style="text-align:left;"> 0.96 ( 0.90 - 1.02 ) </td>
   <td style="text-align:left;"> 0.172 </td>
   <td style="text-align:left;"> 0.95 ( 0.89 - 1.01 ) </td>
   <td style="text-align:left;"> 0.088 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 1.63 ( 1.57 - 1.68 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.60 ( 1.54 - 1.65 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.59 ( 1.54 - 1.65 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.59 ( 1.54 - 1.65 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_presenceB_Presence_of_midwall_LGE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 2.45 ( 2.05 - 2.93 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_3Midwall_LGE_not_at_risk </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 1.49 ( 1.14 - 1.95 ) </td>
   <td style="text-align:left;"> 0.003 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_3At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 3.92 ( 3.16 - 4.87 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 2.05 ( 1.83 - 2.30 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>

```r
combined_models$A_Variable <- rownames(combined_models)

# Make A_Variable the first column
combined_models <- combined_models %>%
  select(A_Variable, everything())

# Export in word
ft <- flextable(combined_models)
ft <- set_table_properties(ft, layout = "autofit")
doc <- read_docx() %>%
  body_add_par("Model full - all pop (N=6,082)", style = "heading 1") %>%
  body_add_flextable(ft)

print(doc, target = here(tables_output_dir,paste0("Tab4-multi-all-death-",Sys.Date(), ".docx")))
```
### Tab5-incr-all-death 
function could be improved (probably since there is bootstrapping etc, the ideal would be to save somewhere the results and to recalculate only if parameters changes). For the future me. 
"Supplementary Figure 3. Incremental prognostic value of the presence of midwall-LGE in the overall population (N=6,082)"

```r
var_base = c("demo_age", "demo_gender" , "demo_BMI" , "CV_risk_diabete" , "CV_risk_HTA", "CV_risk_Smoking" , "CV_risk_dyslipidemia" ,  "history_hospit_HF", "history_AFib" , "med_CKD" , "history_med_MI" , "CMR_LVEF")
var_added = c("CMR_LGE_ischemic_extent_count",
    "CMR_LGE_midwall_presence")

D <- incremental_function(
  df = df_all,
  event = "outcome_death",
  time = "outcome_FU_time_death",
  time_analyzed = median(df_all$outcome_FU_time_death/12), # big debate on which value to use (use in NRI and IDI)
  var_1 = var_base,
  var_2 = c(var_base,c("CMR_LGE_ischemic_extent_count")),
  var_3 = c(var_base,c("CMR_LGE_ischemic_extent_count",
    "CMR_LGE_midwall_presence")))
```

```
## [1] 6082   69
## $var_1
##  [1] "demo_age"             "demo_gender"          "demo_BMI"            
##  [4] "CV_risk_diabete"      "CV_risk_HTA"          "CV_risk_Smoking"     
##  [7] "CV_risk_dyslipidemia" "history_hospit_HF"    "history_AFib"        
## [10] "med_CKD"              "history_med_MI"       "CMR_LVEF"            
## 
## $var_2
##  [1] "demo_age"                      "demo_gender"                  
##  [3] "demo_BMI"                      "CV_risk_diabete"              
##  [5] "CV_risk_HTA"                   "CV_risk_Smoking"              
##  [7] "CV_risk_dyslipidemia"          "history_hospit_HF"            
##  [9] "history_AFib"                  "med_CKD"                      
## [11] "history_med_MI"                "CMR_LVEF"                     
## [13] "CMR_LGE_ischemic_extent_count"
## 
## $var_3
##  [1] "demo_age"                      "demo_gender"                  
##  [3] "demo_BMI"                      "CV_risk_diabete"              
##  [5] "CV_risk_HTA"                   "CV_risk_Smoking"              
##  [7] "CV_risk_dyslipidemia"          "history_hospit_HF"            
##  [9] "history_AFib"                  "med_CKD"                      
## [11] "history_med_MI"                "CMR_LVEF"                     
## [13] "CMR_LGE_ischemic_extent_count" "CMR_LGE_midwall_presence"     
## 
## [1] "modelmodel_1"
## [1] "modelmodel_2"
## [1] "modelmodel_3"
## [1] "analysis CHI2"
## [1] "testChi2 = 340.27, LR test 0.0000"
## [1] "testChi2 = 1104.35, LR test 0.0000"
## [1] "testChi2 = 1187.95, LR test 0.0000"
## [1] "analysis CHI2 comparaison"
## [1] "analysis c index"
## [1] "analysis c index comparaison"
## [1] "Analysis of models NRI et IDI basics"
## [1] "Analysis of models NRI et IDI comparaison"
```

```r
D
```

```
## $chi2_null
## $chi2_null$model_1
## [1] "Chi2 = 340.27, LR test 0.0000"
## 
## $chi2_null$model_2
## [1] "Chi2 = 1104.35, LR test 0.0000"
## 
## $chi2_null$model_3
## [1] "Chi2 = 1187.95, LR test 0.0000"
## 
## 
## $chi2_comparison
## $chi2_comparison$`Comparison 1 vs 2`
## [1] "Chi2 = 764.08, LR test 0.0000"
## 
## $chi2_comparison$`Comparison 2 vs 3`
## [1] "Chi2 = 83.60, LR test 0.0000"
## 
## 
## $concordance
## $concordance$`Model 1`
## [1] "0.71, 95%CI(0.68-0.73)"
## 
## $concordance$`Model 2`
## [1] "0.83, 95%CI(0.81-0.85)"
## 
## $concordance$`Model 3`
## [1] "0.84, 95%CI(0.83-0.86)"
## 
## 
## $c_index_comparison
## $c_index_comparison$`Comparison of Model 1 and Model 2`
## [1] "C-index: 0.706243765247869, P-value: 0"
## [2] "C-index: 0.827081520174292, P-value: 0"
## 
## $c_index_comparison$`Comparison of Model 2 and Model 3`
## [1] "C-index: 0.827081520174292, P-value: 2.6839446605198e-06"
## [2] "C-index: 0.84244256279206, P-value: 2.6839446605198e-06" 
## 
## 
## $nri_idi_basic
## $nri_idi_basic$`Comparison of Model 2 and Model 1`
## $nri_idi_basic$`Comparison of Model 2 and Model 1`$IDI
##                2.5%     97.5%           
## 0.1510709 0.1225705 0.1858774 0.0000000 
## 
## $nri_idi_basic$`Comparison of Model 2 and Model 1`$NRI
##                2.5%     97.5%           
## 0.4065624 0.3582640 0.4709355 0.0000000 
## 
## 
## $nri_idi_basic$`Comparison of Model 3 and Model 1`
## $nri_idi_basic$`Comparison of Model 3 and Model 1`$IDI
##                2.5%     97.5%           
## 0.1652517 0.1358757 0.2033350 0.0000000 
## 
## $nri_idi_basic$`Comparison of Model 3 and Model 1`$NRI
##                2.5%     97.5%           
## 0.4451703 0.3942912 0.5000170 0.0000000 
## 
## 
## 
## $nri_idi_comparison
## $nri_idi_comparison$`Comparison of Model 1 and Model 2`
## $nri_idi_comparison$`Comparison of Model 1 and Model 2`$IDI
##                2.5%     97.5%           
## 0.1510709 0.1225705 0.1858774 0.0000000 
## 
## $nri_idi_comparison$`Comparison of Model 1 and Model 2`$NRI
##                2.5%     97.5%           
## 0.4065624 0.3582640 0.4709355 0.0000000 
## 
## 
## $nri_idi_comparison$`Comparison of Model 2 and Model 3`
## $nri_idi_comparison$`Comparison of Model 2 and Model 3`$IDI
##                  2.5%      97.5%            
## 0.01417917 0.00359631 0.02670306 0.00000000 
## 
## $nri_idi_comparison$`Comparison of Model 2 and Model 3`$NRI
##                  2.5%      97.5%            
## 0.16119124 0.02878297 0.20298412 0.03322259
```

## Figures
### Fig1-all-KM-LGE_midwall_presence
" Panel A central figure"

```r
# Data parameters
results <- createSurvivalPlot(
  data = df_all,
  compared_with = "CMR_LGE_midwall_presence",
  time = "outcome_FU_time_death",
  event = "outcome_death",
  my_colors = c("#25A26B","#FF002B"),
  confint_choosen = 0.95,
  mytitle = "Fig1: LGE presence (all pop = 6,082)"
)
```

```
## [1] "Cox model formula: Surv(outcome_FU_time_death/12, outcome_death) ~ CMR_LGE_midwall_presence"
```

```r
results$HR
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"2.85 ( 2.39 - 3.39 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
results$ggsurv
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig1-all-KM-LGE_midwall_presence-1.png)<!-- -->

```r
# Save the plot in a folder 
ggsave(
  filename = here(figures_output_dir, paste0("Fig1-all-KM-Midwall_presence_plot-", Sys.Date(),".png")),
  plot = results$ggsurv$plot, width = 10, height = 6, units = "in", dpi = 600)
ggsave(
  filename = here(figures_output_dir,paste0("Fig1-all-KM-Midwall_presence_presence_risk-", Sys.Date(),".png")),
  plot = results$ggsurv$table, width = 10, height = 3, units = "in", dpi = 600)
```
### Fig2-all-KM-LGE_type
" Suppl figure S2"

```r
# Data parameters
results <- createSurvivalPlot(
  data = df_all,
  compared_with = "CMR_LGE_type",
  time = "outcome_FU_time_death",
  event = "outcome_death",
  my_colors = c("#25A26B","#4292C6","#FF002B","#2C3E50"),
  confint_choosen = 0.95,
  mytitle = "Fig2: LGE type (all pop = 6,082)"
)
```

```
## [1] "Cox model formula: Surv(outcome_FU_time_death/12, outcome_death) ~ CMR_LGE_type"
```

```r
results$HR
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"4.18 ( 2.82 - 6.19 )","2":"<0.001","_rn_":"CMR_LGE_typeExclusive_midwall_LGE_presence"},{"1":"4.57 ( 3.50 - 5.98 )","2":"<0.001","_rn_":"CMR_LGE_typeExclusive_ischemic_LGE_presence"},{"1":"14.26 ( 10.51 - 19.34 )","2":"<0.001","_rn_":"CMR_LGE_typeischemic_and_midwall_LGE_presence"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
results$ggsurv
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig2-all-KM-LGE_type-1.png)<!-- -->

```r
# Save the plot in a folder 
ggsave(
  filename = here(figures_output_dir, paste0("Fig2-all-KM-LGE_type_plot-", Sys.Date(),".png")),
  plot = results$ggsurv$plot, width = 10, height = 6, units = "in", dpi = 600)
ggsave(
  filename = here(figures_output_dir,paste0("Fig2-all-KM-LGE_type_risk-", Sys.Date(),".png")),
  plot = results$ggsurv$table, width = 10, height = 3, units = "in", dpi = 600)
```
### Fig3-all-death_rate_pattern

```r
### BY EXTENT 
# Data
df_selected <- df_all %>%
  mutate(
    outcome = outcome_death,
    outcome_FU_time_death = outcome_FU_time_death,
    variable_to_group = CMR_LGE_ischemic_extent_categ,
    variable_of_interest = CMR_LGE_midwall_presence
  )

# Parameters # Set the title for the graph
mytitle <- c("Ischemic LGE extent by midwall - all (N=6082)")
my_colors <- c("#25A26B","#FF002B")
confint_choosen = 0.95 

# ANNUALISE /  py à faire en jour !
py1 <- pyears(Surv(outcome_FU_time_death*(365/12), outcome_death) ~ variable_to_group, data = df_selected, subset = df_selected$variable_of_interest == "A_No_midwall_LGE", data.frame = T) # change here for the categories you want to divide
df1 <- py1$data
df1$MidW <- c(rep("A_No_midwall_LGE",4))
df1$annual_rates <- round(100*(df1$event/df1$pyears), 2) # give pourcentage 

py2 <- pyears(Surv(outcome_FU_time_death*(365/12), outcome_death) ~ variable_to_group, data = df_selected, subset = df_selected$variable_of_interest == "B_Presence_of_midwall_LGE", data.frame = T)
df2 <- py2$data
df2$annual_rates <-  round(100*(df2$event/df2$pyears), 2) # give pourcentage 
df2$MidW <- c(rep("B_Presence_of_midwall_LGE",4))

df_add <- rbind(df1, df2) # fused two df


# The graph
gg_graph <- ggplot(data = df_add,
       aes(x = variable_to_group, y = annual_rates, fill = MidW, label = annual_rates)) + 
  geom_bar(position="dodge", stat='identity')+ 
  scale_fill_manual(values = adjustcolor(my_colors, alpha.f = 0.8)) +
  labs(
  x = "LGE Extent (in categories of segments)",
  y = "Annualized event rate (%)",
  fill = "Presence of Midwall" )+
  ggtitle(mytitle)+
  geom_text(
    aes(x = variable_to_group, y = annual_rates, label = annual_rates, group = MidW),
    position = position_dodge(width = 1),
    vjust = -0.5, size = 4, fontface = "bold") +
  scale_y_continuous(expand = c(0, 1), limits = c(0,15), breaks = seq(0, 17.5, 2.5)) + # Here to change the size of graphics
  theme_bw()+
  theme(
    panel.grid.major = element_line(color = "gray", size = 0.2, linetype = "dotted"),
    panel.grid.minor = element_line(color = "gray", size = 0.2, linetype = "dotted"),
    plot.title = element_text(hjust = 0.5),
    axis.title.x = element_blank(),
    # axis.text.x = element_blank(), to remove the x axis legend
    axis.line.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_text(size = 12, face = "bold"),
    panel.border = element_blank(),
    legend.position = c(0.1, 0.9),  # Move the legend to the top-left corner
    legend.justification = c(0, 1),  # Anchor the legend to the top-left corner
    legend.text = element_text(size = 12),  # Adjust the legend text size
    legend.title = element_text(size = 14)  # Adjust the legend title size
  )

gg_graph
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig3-all-death_rate_pattern-1.png)<!-- -->

```r
ggsave(
  filename = here(figures_output_dir, paste0("Fig3a-all-death_rate_extent-", Sys.Date(),".png")),
    plot = gg_graph, width = 6, height = 6, units = "in", dpi = 600)

# Compare subgroups
print(df_add) # u see the dataframe used to build the graph
```

```
##   variable_to_group     pyears    n event                      MidW
## 1 A_No_ischemic_LGE 19491.0666 2143    61          A_No_midwall_LGE
## 2    B_1_2_segments 11579.4855 1282    17          A_No_midwall_LGE
## 3    C_3_5_segments 15913.4337 1774   232          A_No_midwall_LGE
## 4  D_more6_segments  1418.4451  181   169          A_No_midwall_LGE
## 5 A_No_ischemic_LGE  3140.1825  348    42 B_Presence_of_midwall_LGE
## 6    B_1_2_segments   959.0931  110     6 B_Presence_of_midwall_LGE
## 7    C_3_5_segments  1539.1125  179    62 B_Presence_of_midwall_LGE
## 8  D_more6_segments   425.7917   65    63 B_Presence_of_midwall_LGE
##   annual_rates
## 1         0.31
## 2         0.15
## 3         1.46
## 4        11.91
## 5         1.34
## 6         0.63
## 7         4.03
## 8        14.80
```

```r
n_values <- c(1, 2, 3, 4) # now i want to compare by 2 therefore i use this method
for (n in n_values) {
  rate_comp <- ratedifference(df_add$event[n + 4], df_add$event[n], df_add$pyears[n + 4], df_add$pyears[n], CRC = TRUE, conf.level = 0.95)
  value <- as.character(rate_comp$p.value)
  result <- ifelse(rate_comp$p.value < 0.001 | rate_comp$p.value == 0, "<0.001", value)
  print(result)
}
```

```
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   4.200000e+01 3.140183e+03    1.337502e-02 9.330025e-03 1.742001e-02
## Unexposed 6.100000e+01 1.949107e+04    3.129639e-03 2.344263e-03 3.915014e-03
## Total     1.030000e+02 2.263125e+04    4.551229e-03 3.672291e-03 5.430167e-03
## [1] "<0.001"
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   6.000000e+00 9.590931e+02    6.255910e-03 1.250231e-03 1.126159e-02
## Unexposed 1.700000e+01 1.157949e+04    1.468114e-03 7.702295e-04 2.165998e-03
## Total     2.300000e+01 1.253858e+04    1.834339e-03 1.084680e-03 2.583998e-03
## [1] "0.0633545991244964"
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   6.200000e+01 1.539112e+03    4.028296e-02 3.025590e-02 5.031001e-02
## Unexposed 2.320000e+02 1.591343e+04    1.457888e-02 1.270290e-02 1.645486e-02
## Total     2.940000e+02 1.745255e+04    1.684568e-02 1.492009e-02 1.877127e-02
## [1] "<0.001"
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed     63.0000000  425.7916952       0.1479597    0.1114237    0.1844957
## Unexposed  169.0000000 1418.4451289       0.1191445    0.1011815    0.1371075
## Total      232.0000000 1844.2368241       0.1257973    0.1096100    0.1419846
## [1] "0.165384424094627"
```

```r
####### BY PATTERN
# Data
df_selected <- df_all %>%
  mutate(
    outcome = outcome_death,
    outcome_FU_time_death = outcome_FU_time_death,
    variable_to_group = CMR_LGE_ischemic_transmurality,
    variable_of_interest = CMR_LGE_midwall_presence
  )

# Parameters # Set the title for the graph
mytitle <- c("Ischemic LGE pattern by midwall - all (N=6082)")
my_colors <- c("#25A26B","#FF002B")
confint_choosen = 0.95 


# ANNUALISE /  py à faire en jour !
py1 <- pyears(Surv(outcome_FU_time_death*(365/12), outcome_death) ~ variable_to_group, data = df_selected, subset = df_selected$variable_of_interest == "A_No_midwall_LGE", data.frame = T) # change here for the categories you want to divide
df1 <- py1$data
df1$MidW <- c(rep("A_No_midwall_LGE",4))
df1$annual_rates <- round(100*(df1$event/df1$pyears), 2) # give pourcentage 

py2 <- pyears(Surv(outcome_FU_time_death*(365/12), outcome_death) ~ variable_to_group, data = df_selected, subset = df_selected$variable_of_interest == "B_Presence_of_midwall_LGE", data.frame = T)
df2 <- py2$data
df2$annual_rates <-  round(100*(df2$event/df2$pyears), 2) # give pourcentage 
df2$MidW <- c(rep("B_Presence_of_midwall_LGE",4))

df_add <- rbind(df1, df2) # fused two df


# The graph
gg_graph <- ggplot(data = df_add,
       aes(x = variable_to_group, y = annual_rates, fill = MidW, label = annual_rates)) + 
  geom_bar(position="dodge", stat='identity')+ 
  scale_fill_manual(values = adjustcolor(my_colors, alpha.f = 0.8)) +
  labs(
  x = "LGE Extent (in categories of segments)",
  y = "Annualized event rate (%)",
  fill = "Presence of Midwall" )+
  ggtitle(mytitle)+
  geom_text(
    aes(x = variable_to_group, y = annual_rates, label = annual_rates, group = MidW),
    position = position_dodge(width = 1),
    vjust = -0.5, size = 4, fontface = "bold") +
  scale_y_continuous(expand = c(0, 1), limits = c(0,15), breaks = seq(0, 17.5, 2.5)) + # Here to change the size of graphics
  theme_bw()+
  theme(
    panel.grid.major = element_line(color = "gray", size = 0.2, linetype = "dotted"),
    panel.grid.minor = element_line(color = "gray", size = 0.2, linetype = "dotted"),
    plot.title = element_text(hjust = 0.5),
    axis.title.x = element_blank(),
    # axis.text.x = element_blank(), to remove the x axis legend
    axis.line.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_text(size = 12, face = "bold"),
    panel.border = element_blank(),
    legend.position = c(0.1, 0.9),  # Move the legend to the top-left corner
    legend.justification = c(0, 1),  # Anchor the legend to the top-left corner
    legend.text = element_text(size = 12),  # Adjust the legend text size
    legend.title = element_text(size = 14)  # Adjust the legend title size
  )

gg_graph
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig3-all-death_rate_pattern-2.png)<!-- -->

```r
ggsave(
  filename = here(figures_output_dir, paste0("Fig3b-all-death_rate_transmurality-", Sys.Date(),".png")),
    plot = gg_graph, width = 6, height = 6, units = "in", dpi = 600)

# Compare subgroups
print(df_add) # u see the dataframe used to build the graph
```

```
##      variable_to_group    pyears    n event                      MidW
## 1    A_No_ischemic_LGE 19491.067 2143    61          A_No_midwall_LGE
## 2 B_Subendocardial<50% 14215.430 1572    59          A_No_midwall_LGE
## 3 C_Subendocardial≥50% 12448.973 1392   204          A_No_midwall_LGE
## 4         D_Transmural  2246.961  273   155          A_No_midwall_LGE
## 5    A_No_ischemic_LGE  3140.183  348    42 B_Presence_of_midwall_LGE
## 6 B_Subendocardial<50%  1052.363  126    20 B_Presence_of_midwall_LGE
## 7 C_Subendocardial≥50%  1308.021  157    55 B_Presence_of_midwall_LGE
## 8         D_Transmural   563.614   71    56 B_Presence_of_midwall_LGE
##   annual_rates
## 1         0.31
## 2         0.42
## 3         1.64
## 4         6.90
## 5         1.34
## 6         1.90
## 7         4.20
## 8         9.94
```

```r
n_values <- c(1, 2, 3, 4) # now i want to compare by 2 therefore i use this method
for (n in n_values) {
  rate_comp <- ratedifference(df_add$event[n + 4], df_add$event[n], df_add$pyears[n + 4], df_add$pyears[n], CRC = TRUE, conf.level = 0.95)
  value <- as.character(rate_comp$p.value)
  result <- ifelse(rate_comp$p.value < 0.001 | rate_comp$p.value == 0, "<0.001", value)
  print(result)
}
```

```
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   4.200000e+01 3.140183e+03    1.337502e-02 9.330025e-03 1.742001e-02
## Unexposed 6.100000e+01 1.949107e+04    3.129639e-03 2.344263e-03 3.915014e-03
## Total     1.030000e+02 2.263125e+04    4.551229e-03 3.672291e-03 5.430167e-03
## [1] "<0.001"
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   2.000000e+01 1.052363e+03    1.900486e-02 1.067576e-02 2.733395e-02
## Unexposed 5.900000e+01 1.421543e+04    4.150420e-03 3.091375e-03 5.209464e-03
## Total     7.900000e+01 1.526779e+04    5.174291e-03 4.033292e-03 6.315290e-03
## [1] "<0.001"
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   5.500000e+01 1.308021e+03    4.204826e-02 3.093568e-02 5.316084e-02
## Unexposed 2.040000e+02 1.244897e+04    1.638689e-02 1.413820e-02 1.863558e-02
## Total     2.590000e+02 1.375699e+04    1.882679e-02 1.653394e-02 2.111963e-02
## [1] "<0.001"
##                  Cases  Person-time Incidence rates     Lower CL     Upper CL
## Exposed   5.600000e+01 5.636140e+02    9.935879e-02 7.333561e-02 1.253820e-01
## Unexposed 1.550000e+02 2.246961e+03    6.898206e-02 5.812235e-02 7.984178e-02
## Total     2.110000e+02 2.810575e+03    7.507361e-02 6.494396e-02 8.520325e-02
## [1] "0.034739222982505"
```
### Fig4-all-KM-LGE_HTA
" Suppl figure S3"

```r
# Data parameters
df <- df_all %>%
  mutate(
    HTA_LGE = case_when(
      CMR_LGE_midwall_presence == "A_No_midwall_LGE" & CV_risk_HTA == "Yes" ~ "A LGE MW - ; HTA +",
      CMR_LGE_midwall_presence == "A_No_midwall_LGE" & CV_risk_HTA == "No" ~ "B LGE MW - ; HTA -",
      CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE" & CV_risk_HTA == "Yes" ~ "C LGE MW + ; HTA +",
      CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE" & CV_risk_HTA == "No" ~ "D LGE MW + ; HTA -",
      TRUE ~ NA_character_
    )
  )

results <- createSurvivalPlot(
  data = df,
  compared_with = "HTA_LGE",
  time = "outcome_FU_time_death",
  event = "outcome_death",
  my_colors = c("#25A26B","orange4","#FF002B","#2C3E50"),
  confint_choosen = 0.95,
  mytitle = "Fig4: LGE x HTA (all pop = 6,082)"
)
```

```
## [1] "Cox model formula: Surv(outcome_FU_time_death/12, outcome_death) ~ HTA_LGE"
```

```r
results$HR
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"0.96 ( 0.80 - 1.15 )","2":"0.647","_rn_":"HTA_LGEB LGE MW - ; HTA -"},{"1":"1.89 ( 1.47 - 2.43 )","2":"<0.001","_rn_":"HTA_LGEC LGE MW + ; HTA +"},{"1":"4.85 ( 3.81 - 6.18 )","2":"<0.001","_rn_":"HTA_LGED LGE MW + ; HTA -"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
results$ggsurv
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig4-all-KM-LGE_HTA-1.png)<!-- -->

```r
# Save the plot in a folder 
ggsave(
  filename = here(figures_output_dir, paste0("Fig4-all-KM-LGE_HTA-plot-", Sys.Date(),".png")),
  plot = results$ggsurv$plot, width = 10, height = 6, units = "in", dpi = 600)
ggsave(
  filename = here(figures_output_dir,paste0("Fig4-all-KM-LGE_HTA-plot", Sys.Date(),".png")),
  plot = results$ggsurv$table, width = 10, height = 3, units = "in", dpi = 600)
```
### Fig5-ForestPlot
Find a way to save this plot

```r
library(forestplot)
# function
df_selected <- df_all %>%
  mutate(
    demo_age_categ = factor(case_when(
      demo_age < 65 ~ "age<65",
      TRUE ~ "age≥65"
    ), levels = c("age<65", "age≥65")),
    CMR_LVEF_categ = factor(ifelse(
      CMR_LVEF <= 40, "HFrEF", "HFmrEF"
    ), levels = c("HFrEF", "HFmrEF"))
  )

print("Forest plot")
```

```
## [1] "Forest plot"
```

```r
D <- forest_function(
  df = df_selected, 
  time_var = "outcome_FU_time_death",
  event_var = "outcome_death",
  var_of_interest = "CMR_LGE_midwall_presence",
  "demo_age_categ",
  "demo_gender",
  "CV_risk_obesity",
  "CV_risk_diabete",
  "CV_risk_HTA",
  "CV_risk_Smoking",
  "clini_NYHA",
  "CMR_LVEF_categ"
)

base_data <- D

name_row_vector <- c("Age","<65 years", "≥65 years", "Gender","Female", "Male", "Body Mass Index ","No obesity", "Obesity", "Diabete mellitus", "No", "Yes", "Hypertension", "No", "Yes", "Smoking", "No", "Yes", "Symptoms", "Asymptomatic","Symptomatic", "LVEF","≤40%", ">40%")

base_data$name <- name_row_vector

# png(here(figures_output_dir,paste0("Fig5-forestplot", Sys.Date(),".png")), width = 10, height = 5, dpi = 300)

# Generate the forestplot
forest_plot <- base_data |>
  forestplot(
    labeltext = c(name, ratio1, ratio2, OR, Pval, PValInter), 
    graph.pos = 4,
    mean = mean,
    upper = upper,
    lower = lower,
    is.summary = FALSE, # c(rep(TRUE, 2), rep(c(TRUE, FALSE, FALSE), 8)), #Make Text Bold to highlight Summary rows
    boxsize = 0.2,  # Adjust the boxsize as needed) 
    clip = c(0, 7),  #Lower and upper limits for clipping confidence intervals to arrows
    align = c("r", "c", "c", "r","l", "l"), # make it work 
    vertices = TRUE,
    
    xlog = FALSE,  #Log scale on X axis 
    
    col = fpColors(box = "royalblue",
                    line = "darkblue",
                    summary = "royalblue")) |>

  fp_set_zebra_style("#EFEFEF", ignore_subheaders = FALSE)|>

  fp_set_style(box = "red",
               line = "gray0",
               summary = "royalblue",
               align = "lrrr")

print(forest_plot)
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig5-ForestPlot-1.png)<!-- -->

```r
# dev.off()
```

# Midwall population (N=702)
## descriptive
### Tab6-descr-all-LGE_midwall_location
" Suppl table S3"

```r
df <- df_all %>% filter(CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE") %>% droplevels()

Descr_table = createTable(compareGroups(
  CMR_LGE_midwall_location_3 ~ 
    demo_age + demo_gender + demo_BMI + CV_risk_diabete + 
    CV_risk_HTA + CV_risk_obesity + CV_risk_dyslipidemia + CV_risk_Smoking + 
    
    history_med_MI  + history_coronary_procedure + history_interv_PCI + 
    history_interv_CABG + med_periph_atheroma + history_stroke + 
    med_pacemaker + med_CKD + history_hospit_HF + history_AFib + clini_NYHA + 
    clini_cardiac_rythm + 
    
    CMR_LVEF + CMR_LVEDV + 
    CMR_LVESV + CMR_LV_mass + CMR_RV_dysfunction + 
    
    CMR_LGE_presence_ischemic_and_midwall +
    
    CMR_LGE_ischemic_presence + 
    CMR_LGE_ischemic_extent_count +
    CMR_LGE_ischemic_extent_categ +
    CMR_LGE_ischemic_transmurality +
    CMR_LGE_ischemic_location_4 +
    
    CMR_LGE_midwall_extent_count + 
    CMR_LGE_midwall_extent_categ +
    CMR_LGE_midwall_location_3 + 
    CMR_LGE_midwall_location_4 +
    CMR_LGE_midwall_anterior +
    CMR_LGE_midwall_septal +
    CMR_LGE_midwall_inferior +
    CMR_LGE_midwall_lateral +
    CMR_LGE_midwall_apical +
    
    outcome_revascularisation_90days,
  data= df,
  method = 1, conf.level = 0.95),
  hide.no = "No",
  show.all=T, show.p.overall = T) 

export2md(Descr_table, strip=TRUE, first.strip=TRUE)
```

<table class="table table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Summary descriptives table by groups of `CMR_LGE_midwall_location_3'</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> [ALL] </th>
   <th style="text-align:center;"> Midwall_LGE_not_at_risk </th>
   <th style="text-align:center;"> At_risk_midwall_LGE_(septal_and/or_lateral) </th>
   <th style="text-align:center;"> p.overall </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=702 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=471 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=231 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_age </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65.8 (11.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65.3 (11.7) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 66.9 (11.2) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.074 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_gender </td>
   <td style="text-align:center;"> 525 (74.8%) </td>
   <td style="text-align:center;"> 340 (72.2%) </td>
   <td style="text-align:center;"> 185 (80.1%) </td>
   <td style="text-align:center;"> 0.030 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_BMI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.3 (5.43) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.7 (5.74) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27.4 (4.63) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabete </td>
   <td style="text-align:center;"> 324 (46.2%) </td>
   <td style="text-align:center;"> 218 (46.3%) </td>
   <td style="text-align:center;"> 106 (45.9%) </td>
   <td style="text-align:center;"> 0.985 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_HTA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 479 (68.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 345 (73.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 134 (58.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_obesity </td>
   <td style="text-align:center;"> 228 (32.5%) </td>
   <td style="text-align:center;"> 170 (36.1%) </td>
   <td style="text-align:center;"> 58 (25.1%) </td>
   <td style="text-align:center;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_dyslipidemia </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 386 (55.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 268 (56.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 118 (51.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_Smoking </td>
   <td style="text-align:center;"> 141 (20.1%) </td>
   <td style="text-align:center;"> 85 (18.0%) </td>
   <td style="text-align:center;"> 56 (24.2%) </td>
   <td style="text-align:center;"> 0.068 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_med_MI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 272 (38.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 188 (39.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 84 (36.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.409 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_coronary_procedure </td>
   <td style="text-align:center;"> 619 (88.2%) </td>
   <td style="text-align:center;"> 415 (88.1%) </td>
   <td style="text-align:center;"> 204 (88.3%) </td>
   <td style="text-align:center;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_interv_PCI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 44 (6.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 30 (6.37%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (6.06%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_interv_CABG </td>
   <td style="text-align:center;"> 584 (83.2%) </td>
   <td style="text-align:center;"> 392 (83.2%) </td>
   <td style="text-align:center;"> 192 (83.1%) </td>
   <td style="text-align:center;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_periph_atheroma </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 46 (6.55%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 26 (5.52%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 20 (8.66%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.157 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_stroke </td>
   <td style="text-align:center;"> 21 (2.99%) </td>
   <td style="text-align:center;"> 14 (2.97%) </td>
   <td style="text-align:center;"> 7 (3.03%) </td>
   <td style="text-align:center;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_pacemaker </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 13 (1.85%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 8 (1.70%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 5 (2.16%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.767 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKD </td>
   <td style="text-align:center;"> 28 (3.99%) </td>
   <td style="text-align:center;"> 17 (3.61%) </td>
   <td style="text-align:center;"> 11 (4.76%) </td>
   <td style="text-align:center;"> 0.598 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_hospit_HF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 36 (5.13%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 24 (5.10%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 12 (5.19%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFib </td>
   <td style="text-align:center;"> 76 (10.8%) </td>
   <td style="text-align:center;"> 47 (9.98%) </td>
   <td style="text-align:center;"> 29 (12.6%) </td>
   <td style="text-align:center;"> 0.367 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> clini_NYHA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 72 (10.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 51 (10.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 21 (9.09%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.562 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> clini_cardiac_rythm </td>
   <td style="text-align:center;"> 66 (9.40%) </td>
   <td style="text-align:center;"> 40 (8.49%) </td>
   <td style="text-align:center;"> 26 (11.3%) </td>
   <td style="text-align:center;"> 0.298 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVEF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.3 (5.78) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.5 (5.70) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.0 (5.93) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.349 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEDV </td>
   <td style="text-align:center;"> 104 (21.6) </td>
   <td style="text-align:center;"> 103 (21.1) </td>
   <td style="text-align:center;"> 105 (22.8) </td>
   <td style="text-align:center;"> 0.394 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVESV </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 59.6 (17.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 59.2 (17.3) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 60.5 (18.2) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.363 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LV_mass </td>
   <td style="text-align:center;"> 93.5 (17.8) </td>
   <td style="text-align:center;"> 94.0 (17.5) </td>
   <td style="text-align:center;"> 92.5 (18.5) </td>
   <td style="text-align:center;"> 0.306 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_RV_dysfunction </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 30 (4.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 16 (3.40%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (6.06%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.150 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_presence_ischemic_and_midwall </td>
   <td style="text-align:center;"> 354 (50.4%) </td>
   <td style="text-align:center;"> 231 (49.0%) </td>
   <td style="text-align:center;"> 123 (53.2%) </td>
   <td style="text-align:center;"> 0.334 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_presence: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.334 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 240 (51.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (46.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Presence_of_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 354 (50.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 231 (49.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 123 (53.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:center;"> 1.83 (2.26) </td>
   <td style="text-align:center;"> 1.59 (2.06) </td>
   <td style="text-align:center;"> 2.31 (2.56) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_extent_categ: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 240 (51.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (46.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_1_2_segments </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 110 (15.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 91 (19.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 19 (8.23%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_3_5_segments </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 179 (25.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 112 (23.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 67 (29.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_more6_segments </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65 (9.26%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28 (5.94%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 37 (16.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_transmurality: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.038 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 348 (49.6%) </td>
   <td style="text-align:center;"> 240 (51.0%) </td>
   <td style="text-align:center;"> 108 (46.8%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Subendocardial&lt;50% </td>
   <td style="text-align:center;"> 126 (17.9%) </td>
   <td style="text-align:center;"> 84 (17.8%) </td>
   <td style="text-align:center;"> 42 (18.2%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_Subendocardial≥50% </td>
   <td style="text-align:center;"> 157 (22.4%) </td>
   <td style="text-align:center;"> 110 (23.4%) </td>
   <td style="text-align:center;"> 47 (20.3%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_Transmural </td>
   <td style="text-align:center;"> 71 (10.1%) </td>
   <td style="text-align:center;"> 37 (7.86%) </td>
   <td style="text-align:center;"> 34 (14.7%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_location_4: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 240 (51.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (46.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_Neither_anterior_nor_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 217 (30.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 168 (35.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 49 (21.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_Anterior_without_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43 (6.13%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 22 (4.67%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 21 (9.09%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_Septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 94 (13.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 41 (8.70%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 53 (22.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:center;"> 1.14 (0.37) </td>
   <td style="text-align:center;"> 1.08 (0.29) </td>
   <td style="text-align:center;"> 1.26 (0.48) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_extent_categ: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Low_=1 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 610 (86.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 437 (92.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 173 (74.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> High_&gt;1 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 92 (13.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 34 (7.22%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 58 (25.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_3: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;"> 471 (67.1%) </td>
   <td style="text-align:center;"> 471 (100%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:center;"> 231 (32.9%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 231 (100%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_location_4: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 471 (67.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 471 (100%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Lateral_midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 118 (16.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 118 (51.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Septal_Midwall_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (16.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (48.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_anterior </td>
   <td style="text-align:center;"> 140 (19.9%) </td>
   <td style="text-align:center;"> 136 (28.9%) </td>
   <td style="text-align:center;"> 4 (1.73%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_septal </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (16.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (48.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_inferior </td>
   <td style="text-align:center;"> 212 (30.2%) </td>
   <td style="text-align:center;"> 196 (41.6%) </td>
   <td style="text-align:center;"> 16 (6.93%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_lateral </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 124 (17.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 124 (53.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_apical </td>
   <td style="text-align:center;"> 146 (20.8%) </td>
   <td style="text-align:center;"> 144 (30.6%) </td>
   <td style="text-align:center;"> 2 (0.87%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> outcome_revascularisation_90days </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 228 (32.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 164 (34.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64 (27.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.071 </td>
  </tr>
</tbody>
</table>

```r
export2word(x = Descr_table, 
            file = here(tables_output_dir, paste0("Tab6-descr-all-LGE_midwall_location-",Sys.Date(), ".docx")), 
            which.table="descr", nmax=TRUE, header.labels=c(), 
            caption=NULL, strip=FALSE, first.strip=FALSE, background="#D2D2D2",
            size=NULL, header.background=NULL, header.color=NULL)
```
### Tab7-descr-all-LGE_midwall_isch_add
" Suppl table S34

```r
df <- df_all %>% filter(CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE") %>% droplevels()

Descr_table = createTable(compareGroups(
  CMR_LGE_ischemic_presence ~ 
    demo_age + demo_gender + demo_BMI + CV_risk_diabete + 
    CV_risk_HTA + CV_risk_obesity + CV_risk_dyslipidemia + CV_risk_Smoking + 
    
    history_med_MI  + history_coronary_procedure + history_interv_PCI + 
    history_interv_CABG + med_periph_atheroma + history_stroke + 
    med_pacemaker + med_CKD + history_hospit_HF + history_AFib + clini_NYHA + 
    clini_cardiac_rythm + 
    
    CMR_LVEF + CMR_LVEDV + 
    CMR_LVESV + CMR_LV_mass + CMR_RV_dysfunction + 
    
    CMR_LGE_presence_ischemic_and_midwall +
    
    CMR_LGE_ischemic_extent_count +
    CMR_LGE_ischemic_extent_categ +
    CMR_LGE_ischemic_transmurality +
    CMR_LGE_ischemic_location_4 +
    
    CMR_LGE_midwall_extent_count + 
    CMR_LGE_midwall_extent_categ +
    CMR_LGE_midwall_location_3 + 
    CMR_LGE_midwall_location_4 +
    CMR_LGE_midwall_anterior +
    CMR_LGE_midwall_septal +
    CMR_LGE_midwall_inferior +
    CMR_LGE_midwall_lateral +
    CMR_LGE_midwall_apical +
    
    outcome_revascularisation_90days,
  data= df,
  method = 1, conf.level = 0.95),
  hide.no = "No",
  show.all=T, show.p.overall = T) 

export2md(Descr_table, strip=TRUE, first.strip=TRUE)
```

<table class="table table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Summary descriptives table by groups of `CMR_LGE_ischemic_presence'</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> [ALL] </th>
   <th style="text-align:center;"> No_ischemic_LGE </th>
   <th style="text-align:center;"> Presence_of_ischemic_LGE </th>
   <th style="text-align:center;"> p.overall </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=702 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=348 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=354 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_age </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65.8 (11.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65.2 (11.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 66.4 (11.5) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.147 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_gender </td>
   <td style="text-align:center;"> 525 (74.8%) </td>
   <td style="text-align:center;"> 251 (72.1%) </td>
   <td style="text-align:center;"> 274 (77.4%) </td>
   <td style="text-align:center;"> 0.128 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_BMI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.3 (5.43) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.1 (5.29) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.4 (5.58) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.466 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabete </td>
   <td style="text-align:center;"> 324 (46.2%) </td>
   <td style="text-align:center;"> 143 (41.1%) </td>
   <td style="text-align:center;"> 181 (51.1%) </td>
   <td style="text-align:center;"> 0.010 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_HTA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 479 (68.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 234 (67.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 245 (69.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.632 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_obesity </td>
   <td style="text-align:center;"> 228 (32.5%) </td>
   <td style="text-align:center;"> 110 (31.6%) </td>
   <td style="text-align:center;"> 118 (33.3%) </td>
   <td style="text-align:center;"> 0.684 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_dyslipidemia </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 386 (55.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 188 (54.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 198 (55.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.665 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_Smoking </td>
   <td style="text-align:center;"> 141 (20.1%) </td>
   <td style="text-align:center;"> 72 (20.7%) </td>
   <td style="text-align:center;"> 69 (19.5%) </td>
   <td style="text-align:center;"> 0.763 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_med_MI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 272 (38.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 141 (40.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 131 (37.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.380 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_coronary_procedure </td>
   <td style="text-align:center;"> 619 (88.2%) </td>
   <td style="text-align:center;"> 312 (89.7%) </td>
   <td style="text-align:center;"> 307 (86.7%) </td>
   <td style="text-align:center;"> 0.277 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_interv_PCI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 44 (6.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 15 (4.31%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 29 (8.19%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.049 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_interv_CABG </td>
   <td style="text-align:center;"> 584 (83.2%) </td>
   <td style="text-align:center;"> 301 (86.5%) </td>
   <td style="text-align:center;"> 283 (79.9%) </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_periph_atheroma </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 46 (6.55%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 21 (6.03%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 25 (7.06%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.691 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_stroke </td>
   <td style="text-align:center;"> 21 (2.99%) </td>
   <td style="text-align:center;"> 12 (3.45%) </td>
   <td style="text-align:center;"> 9 (2.54%) </td>
   <td style="text-align:center;"> 0.629 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_pacemaker </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 13 (1.85%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10 (2.87%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3 (0.85%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.087 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKD </td>
   <td style="text-align:center;"> 28 (3.99%) </td>
   <td style="text-align:center;"> 17 (4.89%) </td>
   <td style="text-align:center;"> 11 (3.11%) </td>
   <td style="text-align:center;"> 0.312 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_hospit_HF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 36 (5.13%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (4.02%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 22 (6.21%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.252 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFib </td>
   <td style="text-align:center;"> 76 (10.8%) </td>
   <td style="text-align:center;"> 41 (11.8%) </td>
   <td style="text-align:center;"> 35 (9.89%) </td>
   <td style="text-align:center;"> 0.493 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> clini_NYHA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 72 (10.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 36 (10.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 36 (10.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> clini_cardiac_rythm </td>
   <td style="text-align:center;"> 66 (9.40%) </td>
   <td style="text-align:center;"> 37 (10.6%) </td>
   <td style="text-align:center;"> 29 (8.19%) </td>
   <td style="text-align:center;"> 0.328 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVEF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.3 (5.78) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.7 (5.24) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 43.0 (6.24) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.099 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEDV </td>
   <td style="text-align:center;"> 104 (21.6) </td>
   <td style="text-align:center;"> 104 (22.7) </td>
   <td style="text-align:center;"> 104 (20.6) </td>
   <td style="text-align:center;"> 0.862 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVESV </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 59.6 (17.6) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 59.3 (17.7) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 60.0 (17.5) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.623 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LV_mass </td>
   <td style="text-align:center;"> 93.5 (17.8) </td>
   <td style="text-align:center;"> 93.6 (17.7) </td>
   <td style="text-align:center;"> 93.4 (18.0) </td>
   <td style="text-align:center;"> 0.891 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_RV_dysfunction </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 30 (4.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (4.02%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 16 (4.52%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.890 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_presence_ischemic_and_midwall </td>
   <td style="text-align:center;"> 354 (50.4%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 354 (100%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.83 (2.26) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.00 (0.00) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.63 (1.91) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 348 (49.6%) </td>
   <td style="text-align:center;"> 348 (100%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_1_2_segments </td>
   <td style="text-align:center;"> 110 (15.7%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 110 (31.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_3_5_segments </td>
   <td style="text-align:center;"> 179 (25.5%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 179 (50.6%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_more6_segments </td>
   <td style="text-align:center;"> 65 (9.26%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 65 (18.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_transmurality: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (49.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 348 (100%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_Subendocardial&lt;50% </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 126 (17.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 126 (35.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_Subendocardial≥50% </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 157 (22.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 157 (44.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_Transmural </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 71 (10.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0 (0.00%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 71 (20.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 348 (49.6%) </td>
   <td style="text-align:center;"> 348 (100%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Neither_anterior_nor_septal </td>
   <td style="text-align:center;"> 217 (30.9%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 217 (61.3%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_Anterior_without_septal </td>
   <td style="text-align:center;"> 43 (6.13%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 43 (12.1%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_Septal </td>
   <td style="text-align:center;"> 94 (13.4%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 94 (26.6%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.14 (0.37) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.08 (0.30) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.19 (0.43) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Low_=1 </td>
   <td style="text-align:center;"> 610 (86.9%) </td>
   <td style="text-align:center;"> 321 (92.2%) </td>
   <td style="text-align:center;"> 289 (81.6%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> High_&gt;1 </td>
   <td style="text-align:center;"> 92 (13.1%) </td>
   <td style="text-align:center;"> 27 (7.76%) </td>
   <td style="text-align:center;"> 65 (18.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_location_3: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.334 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 471 (67.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 240 (69.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 231 (65.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 231 (32.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (31.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 123 (34.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.491 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;"> 471 (67.1%) </td>
   <td style="text-align:center;"> 240 (69.0%) </td>
   <td style="text-align:center;"> 231 (65.3%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lateral_midwall_LGE </td>
   <td style="text-align:center;"> 118 (16.8%) </td>
   <td style="text-align:center;"> 53 (15.2%) </td>
   <td style="text-align:center;"> 65 (18.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Septal_Midwall_LGE </td>
   <td style="text-align:center;"> 113 (16.1%) </td>
   <td style="text-align:center;"> 55 (15.8%) </td>
   <td style="text-align:center;"> 58 (16.4%) </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_anterior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 140 (19.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 41 (11.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 99 (28.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_septal </td>
   <td style="text-align:center;"> 113 (16.1%) </td>
   <td style="text-align:center;"> 55 (15.8%) </td>
   <td style="text-align:center;"> 58 (16.4%) </td>
   <td style="text-align:center;"> 0.915 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_inferior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 212 (30.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 112 (32.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 100 (28.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.292 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_lateral </td>
   <td style="text-align:center;"> 124 (17.7%) </td>
   <td style="text-align:center;"> 54 (15.5%) </td>
   <td style="text-align:center;"> 70 (19.8%) </td>
   <td style="text-align:center;"> 0.168 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_apical </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 146 (20.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 91 (26.1%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 55 (15.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> outcome_revascularisation_90days </td>
   <td style="text-align:center;"> 228 (32.5%) </td>
   <td style="text-align:center;"> 0 (0.00%) </td>
   <td style="text-align:center;"> 228 (64.4%) </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>

```r
export2word(x = Descr_table, 
            file = here(tables_output_dir, paste0("Tab7-descr-all-LGE_midwall_isch_add-",Sys.Date(), ".docx")), 
            which.table="descr", nmax=TRUE, header.labels=c(), 
            caption=NULL, strip=FALSE, first.strip=FALSE, background="#D2D2D2",
            size=NULL, header.background=NULL, header.color=NULL)
```
## Survival
### Tab8-univ-mid-death

```r
df_selected <- df_all %>%
  filter(CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE") %>%
  mutate(
    surv.event = Surv(
      time = outcome_FU_time_death,
      event = outcome_death
    ),
    CMR_LVEF_5 = CMR_LVEF/5,
    CMR_LVEDV_5 = CMR_LVEDV/10,
    CMR_LVESV_5 = CMR_LVESV/10
  ) %>% droplevels()

# location
model <- coxph(formula = surv.event ~ CMR_LGE_midwall_location_3, data = df_selected)
print("CMR_LGE_midwall_location_3 for all-cause death in midwall pop (N=702")
```

```
## [1] "CMR_LGE_midwall_location_3 for all-cause death in midwall pop (N=702"
```

```r
extract_model_stats(model, conf_level = 0.95, show.coef = F, decimals = 3)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"3.837 ( 2.820 - 5.222 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
# extent
model <- coxph(formula = surv.event ~ CMR_LGE_midwall_extent_categ, data = df_selected)
print("CMR_LGE_midwall_extent_categ for all-cause death in midwall pop (N=702")
```

```
## [1] "CMR_LGE_midwall_extent_categ for all-cause death in midwall pop (N=702"
```

```r
extract_model_stats(model, conf_level = 0.95, show.coef = F, decimals = 3)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"5.534 ( 4.083 - 7.500 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
# ischemic added
model <- coxph(formula = surv.event ~ CMR_LGE_ischemic_presence, data = df_selected)
print("CMR_LGE_ischemic_presence for all-cause death in midwall pop (N=702")
```

```
## [1] "CMR_LGE_ischemic_presence for all-cause death in midwall pop (N=702"
```

```r
extract_model_stats(model, conf_level = 0.95, show.coef = F, decimals = 3)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"3.481 ( 2.458 - 4.931 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
Descr_table = createTable(compareGroups(
  surv.event ~ 
    demo_age + demo_gender + demo_BMI + CV_risk_diabete + 
    CV_risk_HTA + CV_risk_obesity + CV_risk_dyslipidemia + CV_risk_Smoking + 
    
    history_med_MI  + history_coronary_procedure + history_interv_PCI + 
    history_interv_CABG + med_periph_atheroma + history_stroke + 
    med_pacemaker + med_CKD + history_hospit_HF + history_AFib + clini_NYHA + 
    clini_cardiac_rythm + 
    
   outcome_revascularisation_90days +
    
    CMR_LVEF_5 + CMR_LVEDV_5 + 
    CMR_LVESV_5 + CMR_LV_mass + CMR_RV_dysfunction + 
    
    CMR_LGE_presence_ischemic_and_midwall +
    
    CMR_LGE_ischemic_presence + 
    CMR_LGE_ischemic_extent_count +
    CMR_LGE_ischemic_extent_categ +
    CMR_LGE_ischemic_transmurality +
    CMR_LGE_ischemic_location_4 +
    
    CMR_LGE_ischemic_anterior + 
    CMR_LGE_ischemic_septal +
    CMR_LGE_ischemic_inferior +
    CMR_LGE_ischemic_lateral +
    CMR_LGE_ischemic_Apical +
    
    CMR_LGE_midwall_presence +
    CMR_LGE_midwall_extent_count + 
    CMR_LGE_midwall_extent_categ +
    CMR_LGE_midwall_location_3 + 
    CMR_LGE_midwall_location_4 +
    CMR_LGE_midwall_anterior +
    CMR_LGE_midwall_septal +
    CMR_LGE_midwall_inferior +
    CMR_LGE_midwall_lateral +
    CMR_LGE_midwall_apical,
  data= df_selected,
  method = 1, conf.level = 0.95),
  hide.no = "No",
  show.ratio =T, show.p.ratio =  T) 

export2md(Descr_table, strip=TRUE, first.strip=TRUE)
```

<table class="table table-condensed" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Summary descriptives table by groups of `surv.event'</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> No event </th>
   <th style="text-align:center;"> Event </th>
   <th style="text-align:center;"> HR </th>
   <th style="text-align:center;"> p.ratio </th>
   <th style="text-align:center;"> p.overall </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=529 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey"> N=173 </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
   <td style="text-align:center;font-style: italic;border-bottom: 1px solid grey">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_age </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 64.9 (11.5) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 68.7 (11.2) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.02 [1.01;1.04] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_gender </td>
   <td style="text-align:center;"> 370 (69.9%) </td>
   <td style="text-align:center;"> 155 (89.6%) </td>
   <td style="text-align:center;"> 2.97 [1.82;4.84] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> demo_BMI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.3 (5.60) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 28.2 (4.92) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.00 [0.98;1.03] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.834 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.834 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabete </td>
   <td style="text-align:center;"> 231 (43.7%) </td>
   <td style="text-align:center;"> 93 (53.8%) </td>
   <td style="text-align:center;"> 1.54 [1.14;2.08] </td>
   <td style="text-align:center;"> 0.005 </td>
   <td style="text-align:center;"> 0.004 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_HTA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 396 (74.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 83 (48.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.40 [0.29;0.54] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_obesity </td>
   <td style="text-align:center;"> 174 (32.9%) </td>
   <td style="text-align:center;"> 54 (31.2%) </td>
   <td style="text-align:center;"> 0.95 [0.69;1.32] </td>
   <td style="text-align:center;"> 0.770 </td>
   <td style="text-align:center;"> 0.770 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CV_risk_dyslipidemia </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 304 (57.5%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 82 (47.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.74 [0.55;0.99] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.045 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.043 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_Smoking </td>
   <td style="text-align:center;"> 107 (20.2%) </td>
   <td style="text-align:center;"> 34 (19.7%) </td>
   <td style="text-align:center;"> 0.98 [0.67;1.42] </td>
   <td style="text-align:center;"> 0.903 </td>
   <td style="text-align:center;"> 0.903 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_med_MI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 206 (38.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 66 (38.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.91 [0.67;1.24] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.546 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.538 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_coronary_procedure </td>
   <td style="text-align:center;"> 467 (88.3%) </td>
   <td style="text-align:center;"> 152 (87.9%) </td>
   <td style="text-align:center;"> 0.98 [0.62;1.54] </td>
   <td style="text-align:center;"> 0.914 </td>
   <td style="text-align:center;"> 0.922 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_interv_PCI </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27 (5.10%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 17 (9.83%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.53 [0.91;2.59] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.110 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.094 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_interv_CABG </td>
   <td style="text-align:center;"> 447 (84.5%) </td>
   <td style="text-align:center;"> 137 (79.2%) </td>
   <td style="text-align:center;"> 0.81 [0.56;1.17] </td>
   <td style="text-align:center;"> 0.259 </td>
   <td style="text-align:center;"> 0.253 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_periph_atheroma </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 30 (5.67%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 16 (9.25%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.38 [0.82;2.31] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.220 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.216 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_stroke </td>
   <td style="text-align:center;"> 15 (2.84%) </td>
   <td style="text-align:center;"> 6 (3.47%) </td>
   <td style="text-align:center;"> 0.90 [0.39;2.07] </td>
   <td style="text-align:center;"> 0.807 </td>
   <td style="text-align:center;"> 0.799 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> med_pacemaker </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 12 (2.27%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1 (0.58%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.30 [0.04;2.17] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.234 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.207 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKD </td>
   <td style="text-align:center;"> 21 (3.97%) </td>
   <td style="text-align:center;"> 7 (4.05%) </td>
   <td style="text-align:center;"> 1.67 [0.78;3.57] </td>
   <td style="text-align:center;"> 0.183 </td>
   <td style="text-align:center;"> 0.177 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> history_hospit_HF </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 21 (3.97%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 15 (8.67%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 2.00 [1.17;3.40] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.011 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.009 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFib </td>
   <td style="text-align:center;"> 54 (10.2%) </td>
   <td style="text-align:center;"> 22 (12.7%) </td>
   <td style="text-align:center;"> 1.66 [1.06;2.60] </td>
   <td style="text-align:center;"> 0.027 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> clini_NYHA </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 52 (9.83%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 20 (11.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.10 [0.69;1.75] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.693 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.688 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> clini_cardiac_rythm </td>
   <td style="text-align:center;"> 50 (9.45%) </td>
   <td style="text-align:center;"> 16 (9.25%) </td>
   <td style="text-align:center;"> 1.34 [0.80;2.25] </td>
   <td style="text-align:center;"> 0.265 </td>
   <td style="text-align:center;"> 0.265 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> outcome_revascularisation_90days </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 174 (32.9%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 54 (31.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.98 [0.71;1.35] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.906 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.907 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEF_5 </td>
   <td style="text-align:center;"> 8.76 (1.11) </td>
   <td style="text-align:center;"> 8.37 (1.24) </td>
   <td style="text-align:center;"> 0.83 [0.74;0.93] </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LVEDV_5 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10.3 (2.09) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10.7 (2.36) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.06 [0.99;1.12] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.082 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.082 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVESV_5 </td>
   <td style="text-align:center;"> 5.85 (1.71) </td>
   <td style="text-align:center;"> 6.31 (1.88) </td>
   <td style="text-align:center;"> 1.09 [1.01;1.17] </td>
   <td style="text-align:center;"> 0.020 </td>
   <td style="text-align:center;"> 0.020 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LV_mass </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 94.4 (17.3) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 90.5 (19.1) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.99 [0.98;1.00] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.005 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_RV_dysfunction </td>
   <td style="text-align:center;"> 16 (3.02%) </td>
   <td style="text-align:center;"> 14 (8.09%) </td>
   <td style="text-align:center;"> 2.59 [1.49;4.49] </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_presence_ischemic_and_midwall </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 223 (42.2%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 131 (75.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.48 [2.46;4.93] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_presence: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> No_ischemic_LGE </td>
   <td style="text-align:center;"> 306 (57.8%) </td>
   <td style="text-align:center;"> 42 (24.3%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Presence_of_ischemic_LGE </td>
   <td style="text-align:center;"> 223 (42.2%) </td>
   <td style="text-align:center;"> 131 (75.7%) </td>
   <td style="text-align:center;"> 3.48 [2.46;4.93] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.15 (1.60) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.90 (2.70) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.44 [1.36;1.52] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 306 (57.8%) </td>
   <td style="text-align:center;"> 42 (24.3%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_1_2_segments </td>
   <td style="text-align:center;"> 104 (19.7%) </td>
   <td style="text-align:center;"> 6 (3.47%) </td>
   <td style="text-align:center;"> 0.48 [0.20;1.12] </td>
   <td style="text-align:center;"> 0.091 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_3_5_segments </td>
   <td style="text-align:center;"> 117 (22.1%) </td>
   <td style="text-align:center;"> 62 (35.8%) </td>
   <td style="text-align:center;"> 3.19 [2.15;4.72] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_more6_segments </td>
   <td style="text-align:center;"> 2 (0.38%) </td>
   <td style="text-align:center;"> 63 (36.4%) </td>
   <td style="text-align:center;"> 12.0 [8.09;17.8] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_transmurality: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 306 (57.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 42 (24.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> B_Subendocardial&lt;50% </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 106 (20.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 20 (11.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.53 [0.90;2.60] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.120 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> C_Subendocardial≥50% </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 102 (19.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 55 (31.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.13 [2.09;4.69] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> D_Transmural </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 15 (2.84%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 56 (32.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 8.04 [5.38;12.0] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> A_No_ischemic_LGE </td>
   <td style="text-align:center;"> 306 (57.8%) </td>
   <td style="text-align:center;"> 42 (24.3%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> B_Neither_anterior_nor_septal </td>
   <td style="text-align:center;"> 192 (36.3%) </td>
   <td style="text-align:center;"> 25 (14.5%) </td>
   <td style="text-align:center;"> 0.95 [0.58;1.56] </td>
   <td style="text-align:center;"> 0.832 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> C_Anterior_without_septal </td>
   <td style="text-align:center;"> 16 (3.02%) </td>
   <td style="text-align:center;"> 27 (15.6%) </td>
   <td style="text-align:center;"> 7.26 [4.47;11.8] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> D_Septal </td>
   <td style="text-align:center;"> 15 (2.84%) </td>
   <td style="text-align:center;"> 79 (45.7%) </td>
   <td style="text-align:center;"> 11.3 [7.75;16.6] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_anterior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 23 (4.35%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 93 (53.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 10.1 [7.44;13.8] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_septal </td>
   <td style="text-align:center;"> 15 (2.84%) </td>
   <td style="text-align:center;"> 79 (45.7%) </td>
   <td style="text-align:center;"> 8.62 [6.35;11.7] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_inferior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 76 (14.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 29 (16.8%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.02 [0.69;1.53] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.910 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.919 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_lateral </td>
   <td style="text-align:center;"> 71 (13.4%) </td>
   <td style="text-align:center;"> 51 (29.5%) </td>
   <td style="text-align:center;"> 2.07 [1.49;2.88] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_ischemic_Apical </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 67 (12.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 68 (39.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.15 [2.32;4.28] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_presence: B_Presence_of_midwall_LGE </td>
   <td style="text-align:center;"> 529 (100%) </td>
   <td style="text-align:center;"> 173 (100%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> . </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.04 (0.19) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 1.46 (0.58) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.64 [2.92;4.54] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_categ: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Low_=1 </td>
   <td style="text-align:center;"> 510 (96.4%) </td>
   <td style="text-align:center;"> 100 (57.8%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> High_&gt;1 </td>
   <td style="text-align:center;"> 19 (3.59%) </td>
   <td style="text-align:center;"> 73 (42.2%) </td>
   <td style="text-align:center;"> 5.53 [4.08;7.50] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_location_3: </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 406 (76.7%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 65 (37.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> Ref. </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;background-color: rgba(210, 210, 210, 255) !important;" indentlevel="1"> At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 123 (23.3%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 108 (62.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 3.84 [2.82;5.22] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_4: </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Midwall_LGE_not_at_risk </td>
   <td style="text-align:center;"> 406 (76.7%) </td>
   <td style="text-align:center;"> 65 (37.6%) </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;"> Ref. </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Lateral_midwall_LGE </td>
   <td style="text-align:center;"> 64 (12.1%) </td>
   <td style="text-align:center;"> 54 (31.2%) </td>
   <td style="text-align:center;"> 3.91 [2.72;5.61] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Septal_Midwall_LGE </td>
   <td style="text-align:center;"> 59 (11.2%) </td>
   <td style="text-align:center;"> 54 (31.2%) </td>
   <td style="text-align:center;"> 3.77 [2.62;5.41] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_anterior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 113 (21.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 27 (15.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.64 [0.43;0.97] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.036 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.032 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_septal </td>
   <td style="text-align:center;"> 59 (11.2%) </td>
   <td style="text-align:center;"> 54 (31.2%) </td>
   <td style="text-align:center;"> 2.51 [1.82;3.46] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_inferior </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 166 (31.4%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 46 (26.6%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.98 [0.70;1.38] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.921 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.928 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_lateral </td>
   <td style="text-align:center;"> 64 (12.1%) </td>
   <td style="text-align:center;"> 60 (34.7%) </td>
   <td style="text-align:center;"> 2.90 [2.12;3.98] </td>
   <td style="text-align:center;"> &lt;0.001 </td>
   <td style="text-align:center;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;background-color: rgba(210, 210, 210, 255) !important;"> CMR_LGE_midwall_apical </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 132 (25.0%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 14 (8.09%) </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> 0.29 [0.17;0.50] </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
   <td style="text-align:center;background-color: rgba(210, 210, 210, 255) !important;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>

```r
export2word(x = Descr_table, 
            file = here(tables_output_dir, paste0("Tab8-univ-mid-death-",Sys.Date(), ".docx")), 
            which.table="descr", nmax=TRUE, header.labels=c(), 
            caption=NULL, strip=FALSE, first.strip=FALSE, background="#D2D2D2",
            size=NULL, header.background=NULL, header.color=NULL)
```
### Tab9-multi-mid-death
"Part of Table 3"

```r
df <- df_all %>% 
  filter(
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE"
    ) %>% 
  mutate(
    event = outcome_death,
    time = outcome_FU_time_death,
    CMR_LVEF_5 = CMR_LVEF/5
    ) %>% 
  select(
    event, time,
    demo_age, demo_gender, demo_BMI , CV_risk_diabete , CV_risk_Smoking , CV_risk_HTA,  CV_risk_Smoking, CV_risk_dyslipidemia ,  history_hospit_HF, history_AFib, med_CKD, history_med_MI , CMR_LVEF_5, CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_location_3, CMR_LGE_midwall_extent_count
    ) %>%
  droplevels()

# Define models
models <- list(
  model1 = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LVEF_5)),
  model2 = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LGE_ischemic_extent_count)),
  model4 = coxph(Surv(time, event) ~ ., data = df %>% select(event:CMR_LGE_midwall_extent_count))
)

# Extract model statistics and combine
model_stats <- lapply(models, extract_model_stats) # adaptation possible to have more decimals

# Rename the columns in each dataframe to include the model name
model_stats_named <- lapply(names(model_stats), function(model_name) {
  data <- model_stats[[model_name]]
  # Ensure row names are in a column (if not already)
  if (!"A_Variable" %in% colnames(data)) {
    data$A_Variable <- rownames(data)
  }
  # Rename other columns to include the model name for uniqueness
  colnames(data)[-which(colnames(data) == "A_Variable")] <- paste(colnames(data)[-which(colnames(data) == "A_Variable")], model_name, sep = "_")
  return(data)
})

# Combine all models using full_join, join by 'Variable'
combined_models <- purrr::reduce(model_stats_named, full_join, by = "A_Variable")

# Set 'Variable' as rownames and remove 'Variable' from the dataframe columns
rownames(combined_models) <- combined_models$A_Variable
combined_models$A_Variable <- NULL


# export in html
knitr::kable(combined_models, caption = "Models multi- midwall pop (N=702)", format = "html") %>%
  kableExtra::kable_styling(full_width = F, bootstrap_options = c("striped", "hover", "condensed", "bordered"))
```

<table class="table table-striped table-hover table-condensed table-bordered" style="color: black; width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Models multi- midwall pop (N=702)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:left;"> HR_CI_model1 </th>
   <th style="text-align:left;"> p_value_model1 </th>
   <th style="text-align:left;"> HR_CI_model2 </th>
   <th style="text-align:left;"> p_value_model2 </th>
   <th style="text-align:left;"> HR_CI_model4 </th>
   <th style="text-align:left;"> p_value_model4 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> demo_age </td>
   <td style="text-align:left;"> 1.03 ( 1.02 - 1.05 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.02 ( 1.00 - 1.03 ) </td>
   <td style="text-align:left;"> 0.015 </td>
   <td style="text-align:left;"> 1.01 ( 1.00 - 1.03 ) </td>
   <td style="text-align:left;"> 0.065 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_genderYes </td>
   <td style="text-align:left;"> 2.63 ( 1.60 - 4.32 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.79 ( 1.70 - 4.60 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 2.67 ( 1.61 - 4.42 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> demo_BMI </td>
   <td style="text-align:left;"> 1.02 ( 0.99 - 1.05 ) </td>
   <td style="text-align:left;"> 0.199 </td>
   <td style="text-align:left;"> 1.02 ( 0.98 - 1.05 ) </td>
   <td style="text-align:left;"> 0.376 </td>
   <td style="text-align:left;"> 1.03 ( 0.99 - 1.06 ) </td>
   <td style="text-align:left;"> 0.140 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_diabeteYes </td>
   <td style="text-align:left;"> 1.38 ( 1.01 - 1.89 ) </td>
   <td style="text-align:left;"> 0.042 </td>
   <td style="text-align:left;"> 1.30 ( 0.95 - 1.77 ) </td>
   <td style="text-align:left;"> 0.100 </td>
   <td style="text-align:left;"> 1.09 ( 0.79 - 1.51 ) </td>
   <td style="text-align:left;"> 0.583 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_SmokingYes </td>
   <td style="text-align:left;"> 1.07 ( 0.72 - 1.60 ) </td>
   <td style="text-align:left;"> 0.724 </td>
   <td style="text-align:left;"> 1.22 ( 0.81 - 1.84 ) </td>
   <td style="text-align:left;"> 0.337 </td>
   <td style="text-align:left;"> 1.10 ( 0.73 - 1.66 ) </td>
   <td style="text-align:left;"> 0.641 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_HTAYes </td>
   <td style="text-align:left;"> 0.38 ( 0.27 - 0.52 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 0.52 ( 0.38 - 0.73 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 0.70 ( 0.49 - 0.99 ) </td>
   <td style="text-align:left;"> 0.042 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CV_risk_dyslipidemiaYes </td>
   <td style="text-align:left;"> 0.92 ( 0.67 - 1.26 ) </td>
   <td style="text-align:left;"> 0.607 </td>
   <td style="text-align:left;"> 1.01 ( 0.73 - 1.39 ) </td>
   <td style="text-align:left;"> 0.940 </td>
   <td style="text-align:left;"> 1.11 ( 0.80 - 1.53 ) </td>
   <td style="text-align:left;"> 0.537 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_hospit_HFYes </td>
   <td style="text-align:left;"> 1.37 ( 0.76 - 2.48 ) </td>
   <td style="text-align:left;"> 0.299 </td>
   <td style="text-align:left;"> 1.12 ( 0.61 - 2.06 ) </td>
   <td style="text-align:left;"> 0.716 </td>
   <td style="text-align:left;"> 1.29 ( 0.70 - 2.37 ) </td>
   <td style="text-align:left;"> 0.420 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_AFibYes </td>
   <td style="text-align:left;"> 1.04 ( 0.64 - 1.67 ) </td>
   <td style="text-align:left;"> 0.877 </td>
   <td style="text-align:left;"> 1.14 ( 0.69 - 1.87 ) </td>
   <td style="text-align:left;"> 0.605 </td>
   <td style="text-align:left;"> 1.11 ( 0.68 - 1.82 ) </td>
   <td style="text-align:left;"> 0.678 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> med_CKDYes </td>
   <td style="text-align:left;"> 1.37 ( 0.63 - 3.01 ) </td>
   <td style="text-align:left;"> 0.428 </td>
   <td style="text-align:left;"> 1.71 ( 0.78 - 3.77 ) </td>
   <td style="text-align:left;"> 0.183 </td>
   <td style="text-align:left;"> 2.08 ( 0.94 - 4.61 ) </td>
   <td style="text-align:left;"> 0.072 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> history_med_MIYes </td>
   <td style="text-align:left;"> 0.81 ( 0.59 - 1.11 ) </td>
   <td style="text-align:left;"> 0.190 </td>
   <td style="text-align:left;"> 0.78 ( 0.56 - 1.09 ) </td>
   <td style="text-align:left;"> 0.147 </td>
   <td style="text-align:left;"> 0.79 ( 0.57 - 1.11 ) </td>
   <td style="text-align:left;"> 0.173 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LVEF_5 </td>
   <td style="text-align:left;"> 0.91 ( 0.80 - 1.04 ) </td>
   <td style="text-align:left;"> 0.176 </td>
   <td style="text-align:left;"> 0.95 ( 0.83 - 1.10 ) </td>
   <td style="text-align:left;"> 0.508 </td>
   <td style="text-align:left;"> 0.95 ( 0.82 - 1.09 ) </td>
   <td style="text-align:left;"> 0.448 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_ischemic_extent_count </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 1.38 ( 1.30 - 1.47 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
   <td style="text-align:left;"> 1.33 ( 1.25 - 1.42 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_location_3At_risk_midwall_LGE_(septal_and/or_lateral) </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 2.38 ( 1.70 - 3.34 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CMR_LGE_midwall_extent_count </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> 2.19 ( 1.63 - 2.96 ) </td>
   <td style="text-align:left;"> &lt;0.001 </td>
  </tr>
</tbody>
</table>

```r
combined_models$A_Variable <- rownames(combined_models)

# Make A_Variable the first column
combined_models <- combined_models %>%
  select(A_Variable, everything())

# Export in word
ft <- flextable(combined_models)
ft <- set_table_properties(ft, layout = "autofit")
doc <- read_docx() %>%
  body_add_par("Model full - midwall pop (N=702)", style = "heading 1") %>%
  body_add_flextable(ft)

print(doc, target = here(tables_output_dir,paste0("Tab9-multi-mid-death-",Sys.Date(), ".docx")))
```
### Tab10-incr-mid-death 
function could be improved (probably since there is bootstrapping etc, the ideal would be to save somewhere the results and to recalculate only if parameters changes). For the future me. 
"Supplementary Figure 3. Incremental prognostic value of the presence of midwall-LGE in the overall population (N=6,082)"

```r
df <- df_all %>% 
  filter(
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE"
    ) %>% 
  mutate(
    event = outcome_death,
    time = outcome_FU_time_death,
    CMR_LVEF_5 = CMR_LVEF/5
    ) %>% 
  select(
    event, time,
    demo_age, demo_gender, demo_BMI , CV_risk_diabete , CV_risk_Smoking , CV_risk_HTA,  CV_risk_Smoking, CV_risk_dyslipidemia ,  history_hospit_HF, history_AFib, med_CKD, history_med_MI , CMR_LVEF_5, CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_location_3, CMR_LGE_midwall_extent_count
    ) %>%
  droplevels()

var_base = c("demo_age", "demo_gender" , "demo_BMI" , "CV_risk_diabete" , "CV_risk_HTA", "CV_risk_Smoking" , "CV_risk_dyslipidemia" ,  "history_hospit_HF", "history_AFib" , "med_CKD" , "history_med_MI" , "CMR_LVEF_5")


D <- incremental_function(
  df = df,
  event = "event",
  time = "time",
  time_analyzed = median(df_all$outcome_FU_time_death/12), # big debate on which value to use (use in NRI and IDI) > just for NRI and IDI
  var_1 = var_base,
  var_2 = c(var_base,c("CMR_LGE_ischemic_extent_count")),
  var_3 = c(var_base,c("CMR_LGE_ischemic_extent_count", "CMR_LGE_midwall_location_3", "CMR_LGE_midwall_extent_count")))
```

```
## [1] 702  17
## $var_1
##  [1] "demo_age"             "demo_gender"          "demo_BMI"            
##  [4] "CV_risk_diabete"      "CV_risk_HTA"          "CV_risk_Smoking"     
##  [7] "CV_risk_dyslipidemia" "history_hospit_HF"    "history_AFib"        
## [10] "med_CKD"              "history_med_MI"       "CMR_LVEF_5"          
## 
## $var_2
##  [1] "demo_age"                      "demo_gender"                  
##  [3] "demo_BMI"                      "CV_risk_diabete"              
##  [5] "CV_risk_HTA"                   "CV_risk_Smoking"              
##  [7] "CV_risk_dyslipidemia"          "history_hospit_HF"            
##  [9] "history_AFib"                  "med_CKD"                      
## [11] "history_med_MI"                "CMR_LVEF_5"                   
## [13] "CMR_LGE_ischemic_extent_count"
## 
## $var_3
##  [1] "demo_age"                      "demo_gender"                  
##  [3] "demo_BMI"                      "CV_risk_diabete"              
##  [5] "CV_risk_HTA"                   "CV_risk_Smoking"              
##  [7] "CV_risk_dyslipidemia"          "history_hospit_HF"            
##  [9] "history_AFib"                  "med_CKD"                      
## [11] "history_med_MI"                "CMR_LVEF_5"                   
## [13] "CMR_LGE_ischemic_extent_count" "CMR_LGE_midwall_location_3"   
## [15] "CMR_LGE_midwall_extent_count" 
## 
## [1] "modelmodel_1"
## [1] "modelmodel_2"
## [1] "modelmodel_3"
## [1] "analysis CHI2"
## [1] "testChi2 = 94.07, LR test 0.0000"
## [1] "testChi2 = 207.72, LR test 0.0000"
## [1] "testChi2 = 275.52, LR test 0.0000"
## [1] "analysis CHI2 comparaison"
## [1] "analysis c index"
## [1] "analysis c index comparaison"
## [1] "Analysis of models NRI et IDI basics"
## [1] "Analysis of models NRI et IDI comparaison"
```

```r
D
```

```
## $chi2_null
## $chi2_null$model_1
## [1] "Chi2 = 94.07, LR test 0.0000"
## 
## $chi2_null$model_2
## [1] "Chi2 = 207.72, LR test 0.0000"
## 
## $chi2_null$model_3
## [1] "Chi2 = 275.52, LR test 0.0000"
## 
## 
## $chi2_comparison
## $chi2_comparison$`Comparison 1 vs 2`
## [1] "Chi2 = 113.66, LR test 0.0000"
## 
## $chi2_comparison$`Comparison 2 vs 3`
## [1] "Chi2 = 67.80, LR test 0.0000"
## 
## 
## $concordance
## $concordance$`Model 1`
## [1] "0.72, 95%CI(0.68-0.76)"
## 
## $concordance$`Model 2`
## [1] "0.80, 95%CI(0.77-0.84)"
## 
## $concordance$`Model 3`
## [1] "0.85, 95%CI(0.82-0.88)"
## 
## 
## $c_index_comparison
## $c_index_comparison$`Comparison of Model 1 and Model 2`
## [1] "C-index: 0.721180574480842, P-value: 6.46624409195162e-06"
## [2] "C-index: 0.8030195672317, P-value: 6.46624409195162e-06"  
## 
## $c_index_comparison$`Comparison of Model 2 and Model 3`
## [1] "C-index: 0.8030195672317, P-value: 9.58762472391683e-05"  
## [2] "C-index: 0.852741592630948, P-value: 9.58762472391683e-05"
## 
## 
## $nri_idi_basic
## $nri_idi_basic$`Comparison of Model 2 and Model 1`
## $nri_idi_basic$`Comparison of Model 2 and Model 1`$IDI
##                  2.5%      97.5%            
## 0.14528694 0.08529046 0.21642709 0.00000000 
## 
## $nri_idi_basic$`Comparison of Model 2 and Model 1`$NRI
##                2.5%     97.5%           
## 0.3710785 0.2409142 0.4818305 0.0000000 
## 
## 
## $nri_idi_basic$`Comparison of Model 3 and Model 1`
## $nri_idi_basic$`Comparison of Model 3 and Model 1`$IDI
##                2.5%     97.5%           
## 0.2030050 0.1372389 0.2758759 0.0000000 
## 
## $nri_idi_basic$`Comparison of Model 3 and Model 1`$NRI
##                2.5%     97.5%           
## 0.4335756 0.3410519 0.5798233 0.0000000 
## 
## 
## 
## $nri_idi_comparison
## $nri_idi_comparison$`Comparison of Model 1 and Model 2`
## $nri_idi_comparison$`Comparison of Model 1 and Model 2`$IDI
##                  2.5%      97.5%            
## 0.14528694 0.08529046 0.21642709 0.00000000 
## 
## $nri_idi_comparison$`Comparison of Model 1 and Model 2`$NRI
##                2.5%     97.5%           
## 0.3710785 0.2409142 0.4818305 0.0000000 
## 
## 
## $nri_idi_comparison$`Comparison of Model 2 and Model 3`
## $nri_idi_comparison$`Comparison of Model 2 and Model 3`$IDI
##                  2.5%      97.5%            
## 0.05780747 0.01564579 0.10723032 0.01328904 
## 
## $nri_idi_comparison$`Comparison of Model 2 and Model 3`$NRI
##                2.5%     97.5%           
## 0.2982533 0.1113014 0.3980479 0.0000000
```

## Figures
### Fig6-mid-KM-LGE_midwall_location
" Panel B1 central figure"

```r
df <- df_all %>% 
  filter(
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE"
    ) %>% 
  mutate(
    event = outcome_death,
    time = outcome_FU_time_death,
    CMR_LVEF_5 = CMR_LVEF/5
    ) %>% 
  select(
    event, time,
    demo_age, demo_gender, demo_BMI , CV_risk_diabete , CV_risk_Smoking , CV_risk_HTA,  CV_risk_Smoking, CV_risk_dyslipidemia ,  history_hospit_HF, history_AFib, med_CKD, history_med_MI , CMR_LVEF_5, CMR_LGE_ischemic_extent_count, CMR_LGE_midwall_location_3, CMR_LGE_midwall_extent_count
    ) %>%
  droplevels()

# Data parameters
results <- createSurvivalPlot(
  data = df,
  compared_with = "CMR_LGE_midwall_location_3",
  show.pval = F,
  time = "time",
  event = "event",
  my_colors = c("#FF002B","#2C3E50"),
  confint_choosen = 0.95,
  mytitle = "Fig6: midwall location (midwall pop = 702)"
)
```

```
## [1] "Cox model formula: Surv(time/12, event) ~ CMR_LGE_midwall_location_3"
```

```r
results$HR
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"3.84 ( 2.82 - 5.22 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
results$ggsurv
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig6-mid-KM-LGE_midwall_location-1.png)<!-- -->

```r
# Save the plot in a folder 
ggsave(
  filename = here(figures_output_dir, paste0("Fig6-mid-KM-LGE_midwall_location_plot-", Sys.Date(),".png")),
  plot = results$ggsurv$plot, width = 10, height = 6, units = "in", dpi = 600)
ggsave(
  filename = here(figures_output_dir,paste0("Fig6-mid-KM-LGE_midwall_location_risk-", Sys.Date(),".png")),
  plot = results$ggsurv$table, width = 10, height = 3, units = "in", dpi = 600)
```
### Fig7-mid-KM-LGE_midwall_extent
" Panel B2 central figure"

```r
df <- df_all %>% 
  filter(
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE"
    ) %>% 
  mutate(
    event = outcome_death,
    time = outcome_FU_time_death,
    CMR_LVEF_5 = CMR_LVEF/5
    ) %>% 
  droplevels()

# Data parameters
results <- createSurvivalPlot(
  data = df,
  compared_with = "CMR_LGE_midwall_extent_categ",
  show.pval = F,
  time = "time",
  event = "event",
  my_colors = c("#FF002B","#2C3E50"),
  confint_choosen = 0.95,
  mytitle = "Fig7: midwall extent (midwall pop = 702)"
)
```

```
## [1] "Cox model formula: Surv(time/12, event) ~ CMR_LGE_midwall_extent_categ"
```

```r
results$HR
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"5.53 ( 4.08 - 7.50 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
results$ggsurv
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig7-mid-KM-LGE_midwall_extent-1.png)<!-- -->

```r
# Save the plot in a folder 
ggsave(
  filename = here(figures_output_dir, paste0("Fig7-mid-KM-LGE_midwall_extent_plot-", Sys.Date(),".png")),
  plot = results$ggsurv$plot, width = 10, height = 6, units = "in", dpi = 600)
ggsave(
  filename = here(figures_output_dir,paste0("Fig7-mid-KM-LGE_midwall_extent_risk-", Sys.Date(),".png")),
  plot = results$ggsurv$table, width = 10, height = 3, units = "in", dpi = 600)
```
### Fig8-mid-KM-LGE_midwall_with_ischemic
" Panel B3 central figure"

```r
df <- df_all %>% 
  filter(
    CMR_LGE_midwall_presence == "B_Presence_of_midwall_LGE"
    ) %>% 
  mutate(
    event = outcome_death,
    time = outcome_FU_time_death,
    CMR_LVEF_5 = CMR_LVEF/5
    ) %>% 
  droplevels()

# Data parameters
results <- createSurvivalPlot(
  data = df,
  compared_with = "CMR_LGE_ischemic_presence",
  show.pval = F,
  time = "time",
  event = "event",
  my_colors = c("#FF002B","#2C3E50"),
  confint_choosen = 0.95,
  mytitle = "Fig8: midwall with isch (midwall pop = 702)"
)
```

```
## [1] "Cox model formula: Surv(time/12, event) ~ CMR_LGE_ischemic_presence"
```

```r
results$HR
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["HR_CI"],"name":[1],"type":["chr"],"align":["left"]},{"label":["p_value"],"name":[2],"type":["chr"],"align":["left"]}],"data":[{"1":"3.48 ( 2.46 - 4.93 )","2":"<0.001"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
results$ggsurv
```

![](/Users/alexandreunger/Documents/PROJECTS/ICM/ICM_midwall/ICM_midwall_RProject/outputs/figure_html/Fig_html-2024-07-25/Fig8-mid-KM-LGE_midwall_with_ischemic-1.png)<!-- -->

```r
# Save the plot in a folder 
ggsave(
  filename = here(figures_output_dir, paste0("Fig8-mid-KM-LGE_midwall_with_ischemic_plot-", Sys.Date(),".png")),
  plot = results$ggsurv$plot, width = 10, height = 6, units = "in", dpi = 600)
ggsave(
  filename = here(figures_output_dir,paste0("Fig8-mid-KM-LGE_midwall_with_ischemic_risk-", Sys.Date(),".png")),
  plot = results$ggsurv$table, width = 10, height = 3, units = "in", dpi = 600)
```
