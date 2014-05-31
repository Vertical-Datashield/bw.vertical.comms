#############################################
#makes PV1 on study 1 housing variable b
#############################################
pv0_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv0.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

mv1_betab_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv1_betab.csv"

pv1_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv1.csv"

pv0<-as.matrix(read.csv(pv0_in, header=TRUE))
mv1_betab<-as.matrix(read.csv(mv1_betab_in, header=TRUE))
n<-read.csv(n_in, header=TRUE)

#############################################
pv1<-rep(NA, n[1])

for (i in 1:length(pv1)){
pv1[i]<-pv0[i] + mv1_betab [i]
}

write.table(pv1, row.names=FALSE, sep=",", pv1_out)
