#! /usr/bin/env bash

Rscript list_variables.R
#Rscript create_m.R
Rscript create_cva.R
Rscript create_cvb.R
Rscript poisson_get_linear_predictor_a.R
Rscript poisson_get_linear_predictor_b.R
Rscript client_makes_lp_final.R
Rscript calculate_z.R
Rscript ma_atwa.R
Rscript mb_atwb.R

Rscript ma_atb.R
Rscript mb_bta.R
Rscript make_cov_matrix.R
#Rscript glm_cov_matrix.R
Rscript scalable_glm_cov_matrix.R


