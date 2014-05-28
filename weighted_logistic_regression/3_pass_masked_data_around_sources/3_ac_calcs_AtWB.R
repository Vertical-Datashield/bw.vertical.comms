##############################################
#analysis computer finally calculates AtWB
##############################################

mat41_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat41.csv"
mat42_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat42.csv"
k_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/k.csv"

AtWB_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/AtWB_out.csv"

mat41<-as.matrix(read.csv(mat41_in, header=TRUE))
mat42<-as.matrix(read.csv(mat42_in, header=TRUE))
k<-as.matrix(read.csv(k_in, header=TRUE))

#############################
#divide by k to remove it
##############################
mat42_k<-mat42/k

AtWB<-mat42_k-mat41

write.table(AtWB, row.names=FALSE, sep="'", file = AtWB_out)

#########################################


