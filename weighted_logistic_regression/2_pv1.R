#############################################
#makes PV1 on study 1 aka study (a)
#############################################
pv0_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv0.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

m_betaa_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/m_betab.csv"

pv1_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv1.csv"

pv0<-as.matrix(read.csv(pv0_in, header=TRUE))
m_betaa<-as.matrix(read.csv(m_betaa_in, header=TRUE))
n<-read.csv(n_in, header=TRUE)

#############################################
pv1<-rep(NA, n[1])

for (i in 1:length(pv1)){
pv1[i]<-pv0[i] + m_betaa [i]
}

write.table(pv1, row.names=FALSE, sep=",", pv1_out)
