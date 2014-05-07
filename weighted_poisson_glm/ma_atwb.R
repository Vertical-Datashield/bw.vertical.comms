#####
#To generate A.B
# 
#####
##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/b.csv"
ma_atw_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atw.csv"

ma_atwb_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atwb.csv"

###########################################
#read files in
###########################################

b<-as.matrix(read.csv(b_in, header=TRUE))
ma_atw<-as.matrix(read.csv(ma_atw_in, header=TRUE))

###########################################
#product atw * b to give a.b
###########################################
ma_atwb<-ma_atw%*%b

###########################################
# write AMa to file somewhere
###########################################
write.table(ma_atwb, row.names=FALSE, sep=",", file = ma_atwb_out)


