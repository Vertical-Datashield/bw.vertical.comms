#! /usr/bin/env bash
Rscript create_sums.R
Rscript create_cloaking_vector.R
Rscript get_linear_predictor.R
Rscript client_gets_coeffs.R
Rscript outcome_server_z.R
Rscript client_calculates_coeffs.R

