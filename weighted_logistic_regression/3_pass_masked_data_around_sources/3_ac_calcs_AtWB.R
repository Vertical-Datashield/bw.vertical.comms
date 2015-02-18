##############################################
#analysis computer finally calculates AtWB AtWA
# outputs: AtWB, AtWA,
##############################################

mat41_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat41.csv"
mat42_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat42.csv"
mat11_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat11.csv"
mat12_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat12.csv"
k_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/k.csv"

AtWB_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/AtWB.csv"
AtWA_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/AtWA.csv"

mat41<-as.matrix(read.csv(mat41_in, header=TRUE))
mat42<-as.matrix(read.csv(mat42_in, header=TRUE))
mat11<-as.matrix(read.csv(mat11_in, header=TRUE))
mat12<-as.matrix(read.csv(mat12_in, header=TRUE))
k<-as.matrix(read.csv(k_in, header=TRUE))

#############################
#divide mat12 and mat42 by k to remove the mask k
##############################
mat42_k<-mat42/k
mat12_k<-mat12/k

AtWB<-mat42_k-mat41
AtWA<-mat12_k-mat11

write.table(AtWB, row.names=FALSE, sep="'", file = AtWB_out)
write.table(AtWA, row.names=FALSE, sep="'", file = AtWA_out)
#########################################


