#! /usr/bin/env bash

Rscript list_variables.R
Rscript ma_ata.R
Rscript mb_btb.R
Rscript ma_atb.R
Rscript mb_bta.R
Rscript create_sums.R
Rscript make_cov_matrix.R
#Rscript glm_cov_matrix.R
Rscript scalable_glm_cov_matrix.R

