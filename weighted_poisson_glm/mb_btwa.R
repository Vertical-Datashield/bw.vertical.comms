#####
#To generate B.A MUST BIND CONST COLUMN 1 to a
#
#####
##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
######
a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/a.csv"
mb_btw_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb_btw.csv"

mb_btwa_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb_btwa.csv"

###########################################
#read files in
###########################################

a<-as.matrix(read.csv(a_in, header=TRUE))
mb_btw<-as.matrix(read.csv(mb_btw_in, header=TRUE))

const=rep(1, length(a[,1])) #add column of 1st to A.A matrix then don't need to do sums col/sumsrow
a<-cbind(const, a)

##########################################
#product at * a
#product ma * ata
###########################################
mb_btwa<-mb_btw%*%a

###########################################
# write AMa to file somewhere
###########################################
write.table(mb_btwa, row.names=FALSE, sep=",", file = mb_btwa_out)


