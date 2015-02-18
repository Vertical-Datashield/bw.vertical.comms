#############################
#calculate p2 (mv of last in source list + m0)
#############################
mv2_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv2.csv"

mv0_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv0.csv"

p2_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p2.csv"

mv0<-read.csv(mv0_in, header=TRUE)
mv2<-read.csv(mv2_in, header=TRUE)


p2<-rep(NA, length(mv0))

for (i in 1:length(mv0)){
p2[i]<-mv0[i] + mv2 [i]
}

write.table(p2, row.names=FALSE, sep=",", p2_out)
