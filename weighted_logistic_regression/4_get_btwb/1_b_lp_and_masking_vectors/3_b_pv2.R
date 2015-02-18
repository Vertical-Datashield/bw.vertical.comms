#############################################
#makes PV2on study 2 aka study (b)
#############################################
pv1_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv1.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

mv2_betaa_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv2_betaa.csv"

pv2_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv2.csv"

pv1<-as.matrix(read.csv(pv1_in, header=TRUE))
mv2_betaa<-as.matrix(read.csv(mv2_betaa_in, header=TRUE))
n<-read.csv(n_in, header=TRUE)

#############################################
pv2<-rep(NA, n[1])

for (i in 1:length(pv2)){
pv2[i]<-pv1[i] + mv2_betaa [i]
}

write.table(pv2, row.names=FALSE, sep=",", pv2_out)
