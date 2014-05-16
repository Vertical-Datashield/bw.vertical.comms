#####
#To generate A.B
# 
#####
##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/b.csv"
ma_at_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_at.csv"

ma_atb_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atb.csv"

###########################################
#read files in
###########################################

b<-as.matrix(read.csv(b_in, header=TRUE))
ma_at<-as.matrix(read.csv(ma_at_in, header=TRUE))

###########################################
#product atw * b to give a.b
###########################################
ma_atb<-ma_at%*%b

###########################################
# write AMa to file somewhere
###########################################
write.table(ma_atb, row.names=FALSE, sep=",", file = ma_atb_out)


