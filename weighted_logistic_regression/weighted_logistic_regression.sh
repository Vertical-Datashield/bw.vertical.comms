#! /usr/bin/env bash
create_beta_table.R
1_get_variable_and_mask_a.R # study 1: output (masking vector * study variables) and masking vector
1_get_variable_and_mask_b.R # study 2: output (masking vector * study variables) and masking vector
1_make_pv0.R # analysis computer creates PV0
2_pv1.R # pv0 + (beta * (masking vector*study variable))
3_pv2.R # pv1 + (beta * (masking vector*study variable))
4_p2.R # MV0 + MV2 
5_p1.R # P2 + MV1 = sum(masking vectors)
