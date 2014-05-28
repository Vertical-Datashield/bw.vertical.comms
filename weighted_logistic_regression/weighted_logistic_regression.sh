#! /usr/bin/env bash
create_beta_table.R
/lp_and_masking_vectors/1_get_variable_and_mask_a.R # study 1: output (masking vector * study variables) and masking vector
/lp_and_masking_vectors/1_get_variable_and_mask_b.R # study 2: output (masking vector * study variables) and masking vector
/lp_and_masking_vectors/1_make_pv0.R # analysis computer creates PV0
/lp_and_masking_vectors/2_pv1.R # pv0 + (beta * (masking vector*study variable))
/lp_and_masking_vectors/3_pv2.R # pv1 + (beta * (masking vector*study variable))
/lp_and_masking_vectors/4_p2.R # MV0 + MV2 
/lp_and_masking_vectors/5_p1.R # P2 + MV1 = sum(masking vectors)
/exp_gamma_p/1_last_study_tau.R #last study in source(study 2) creates t 
/exp_gamma_p/2_frst_study_last_study_tau.R #on first study product of previous script with product of first study. sent to AC
/exp_gamma_p/3_ac_masks_rem_tau.R # AC masks and removes tau from product and sends to S1 and S2
