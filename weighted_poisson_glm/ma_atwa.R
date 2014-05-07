#####
#To generate A.A includes CONSTANT COLUMN
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
a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/a.csv"
ma_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma.csv"
w_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/W.csv"
ma_atwa_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atwa.csv"
ma_atw_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atw.csv"

###########################################
#read files in
###########################################

a<-as.matrix(read.csv(a_in, header=TRUE))
ma<-as.matrix(read.csv(ma_in, header=TRUE))
w<-as.matrix(read.csv(w_in, header=TRUE))

const=rep(1, length(a[,1])) #add column of 1st to A.A matrix then don't need to do sums col/sumsrow
a<-cbind(const, a)

###########################################
#product at * a
#product ma * ata
###########################################
atwa<- t(a) %*% w %*% a
atw<- t(a) %*% w 

ma_atwa<-ma %*% atwa

ma_atw<-ma %*% atw

###########################################
# write AMa to file somewhere
###########################################
write.table(ma_atwa, row.names=FALSE, sep=",", file = ma_atwa_out)
write.table(ma_atw, row.names=FALSE, sep=",", file = ma_atw_out)



