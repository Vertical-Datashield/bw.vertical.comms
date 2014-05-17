#############################
#calculate p2 (mv of last in source list + m0)
#############################
mb_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mb.csv"

m0_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/m0.csv"

p2_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p2.csv"

m0<-read.csv(m0_in, header=TRUE)
m2<-read.csv(mb_in, header=TRUE)


p2<-rep(NA, length(m0))

for (i in 1:length(m0)){
p2[i]<-m0[i] + m2 [i]
}

write.table(p2, row.names=FALSE, sep=",", p2_out)
