#####
#To generate B.A
# mb_bt * a
#####
##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

fn_b_in="a.csv" #a
fn_ma_at_in="mb_bt.csv" #mb_bt

fn_ma_atb_out="mb_bta.csv" #mb_bt_a

loc_b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_ma_at_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_ma_atb_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"



#########################################
# set input and outputfiles 
#########################################

input_b=sprintf("%s%s", loc_b_in, fn_b_in)
input_ma_at=sprintf("%s%s", loc_ma_at_in, fn_ma_at_in)
output_ma_atb=sprintf("%s%s", loc_ma_atb_out, fn_ma_atb_out)

###########################################
#read files in
###########################################

b<-as.matrix(read.csv(input_b, header=TRUE))
ma_at<-as.matrix(read.csv(input_ma_at, header=TRUE))

##########################################
#product at * a
#product ma * ata
###########################################
ma_atb<-ma_at%*%b

###########################################
# write AMa to file somewhere
###########################################
write.table(ma_atb, row.names=FALSE, sep=",", file = output_ma_atb)


