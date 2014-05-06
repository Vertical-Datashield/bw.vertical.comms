#####
#To generate A.A or B.B
# ma * at * a
#####

##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

#for height
#fn_a_in="b.csv"
#fn_ma_in="mb.csv"
#fn_ma_ata_out="mb_btb.csv"
#fn_ma_at_out="mb_bt.csv"

#for weight
fn_a_in="a.csv"
fn_ma_in="ma.csv"
fn_ma_ata_out="ma_ata.csv"
fn_ma_at_out="ma_at.csv"

loc_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_ma_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_ma_ata_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_ma_at_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"


#########################################
# set input and outputfiles 
#########################################

input_a=sprintf("%s%s", loc_a_in, fn_a_in)
input_ma=sprintf("%s%s", loc_ma_in, fn_ma_in)
output_ma_ata=sprintf("%s%s", loc_ma_ata_out, fn_ma_ata_out)
output_ma_at=sprintf("%s%s", loc_ma_at_out, fn_ma_at_out)

###########################################
#read files in
###########################################

a<-as.matrix(read.csv(input_a, header=TRUE))
ma<-as.matrix(read.csv(input_ma, header=TRUE))

###########################################
#product at * a
#product ma * ata
###########################################
ata<-t(a) %*% a

ma_ata<-ma %*% ata

ma_at<-ma %*% t(a)

at = t(a)
###########################################
# write AMa to file somewhere
###########################################
write.table(ma_ata, row.names=FALSE, sep=",", file = output_ma_ata)
write.table(ma_at, row.names=FALSE, sep=",", file = output_ma_at)

#write.table(ata, row.names=FALSE, sep=",", file = output_ma_ata)
#write.table(at, row.names=FALSE, sep=",", file = output_ma_at)


