#! /usr/bin/env bash

Rscript create_cva.R
Rscript create_cvb.R
Rscript poisson_get_linear_predictor_a.R
Rscript poisson_get_linear_predictor_b.R
Rscript client_makes_lp_final.R
Rscript client_gets_coeffs.R
Rscript outcome_server_z.R
Rscript client_calculates_coeffs.R

