#####
#To generate B.B DOES NOT INCLUDE CONSTANT column.
#####

##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/b.csv"
mb_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb.csv"
w_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/W.csv"
mb_btwb_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb_btwb.csv"
mb_btw_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb_btw.csv"

###########################################
#read files in
###########################################

b<-as.matrix(read.csv(b_in, header=TRUE))
mb<-as.matrix(read.csv(mb_in, header=TRUE))
w<-as.matrix(read.csv(w_in, header=TRUE))

###########################################
#product at * a
#product ma * ata
###########################################
btwb<- t(b) %*% w %*% b
btw<- t(b) %*% w 

mb_btwb<-mb %*% btwb

mb_btw<-mb %*% btw

###########################################
# write AMa to file somewhere
###########################################
write.table(mb_btwb, row.names=FALSE, sep=",", file = mb_btwb_out)
write.table(mb_btw, row.names=FALSE, sep=",", file = mb_btw_out)
