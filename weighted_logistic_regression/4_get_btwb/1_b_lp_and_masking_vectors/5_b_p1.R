#############################
#calculate p1 (occurs on study a - study 1)
#############################
mv1_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv1.csv"

p2_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p2.csv"

p1_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p1.csv"

p2<-read.csv(p2_in, header=TRUE)
mv1<-read.csv(mv1_in, header=TRUE)


p1<-rep(NA, length(p2))

for (i in 1:length(p2)){
p1[i]<-p2[i] + mv1[i]
}

write.table(p1, row.names=FALSE, sep=",", p1_out)
