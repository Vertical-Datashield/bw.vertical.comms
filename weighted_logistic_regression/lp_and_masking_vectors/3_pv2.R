#############################################
#makes PV2on study 2 aka study (b)
#############################################
pv1_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv1.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

m_betab_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/m_betab.csv"

pv2_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv2.csv"

pv1<-as.matrix(read.csv(pv1_in, header=TRUE))
m_betab<-as.matrix(read.csv(m_betab_in, header=TRUE))
n<-read.csv(n_in, header=TRUE)

#############################################
pv2<-rep(NA, n[1])

for (i in 1:length(pv2)){
pv2[i]<-pv1[i] + m_betab [i]
}

write.table(pv2, row.names=FALSE, sep=",", pv2_out)
