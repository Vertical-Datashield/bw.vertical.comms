#! /usr/bin/env bash
create_beta_table.R
/1_lp_and_masking_vectors/1_get_variable_and_mask_a.R # study 1: output (masking vector * study variables) and masking vector
/1_lp_and_masking_vectors/1_get_variable_and_mask_b.R # study 2: output (masking vector * study variables) and masking vector
/1_lp_and_masking_vectors/1_make_pv0.R # analysis computer creates PV0
/1_lp_and_masking_vectors/2_pv1.R # pv0 + (beta * (masking vector*study variable))
/1_lp_and_masking_vectors/3_pv2.R # pv1 + (beta * (masking vector*study variable))
/1_lp_and_masking_vectors/4_p2.R # MV0 + MV2 
/1_lp_and_masking_vectors/5_p1.R # P2 + MV1 = sum(masking vectors)
/2_exp_gamma_p/1_last_study_tau.R #last study in source(study 2) creates t 
/2_exp_gamma_p/2_frst_study_expp_tau_exo_gammap.R #on first study product of previous script with product of first study. sent to AC
/2_exp_gamma_p/3_ac_masks_rem_tau.R # AC masks and removes tau from product and sends to S1 and S2/
/3_pass_masked_data_around_sources/1_a_make_Rk_a.R #Study 2 masks dataset a (Rk+a)
/3_pass_masked_data_around_sources/1_study1_makemat21_mat22.R #Study 1 (varibale b) makes mat21, mat22, Rb and k passes products to study 2 (holding variable a).
/3_pass_masked_data_around_sources/2_study2_makemat41_mat42.R #Study 2 (varibale 1) makes mat41, mat42 mat12 mat11
/3_pass_masked_data_around_sources/3_ac_calcs_AtWB.R #final calculation of AtWB and AtWA

