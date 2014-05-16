#####################
#create beta
#####################
beta_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/beta.csv"
beta.number<-3 #will read in from model when compiled
beta<-matrix(NA, 1, beta.number)
beta[1,]<-1
colnames(beta)=c("b0", "b1", "b2")#need to auto expand depending on model
write.table(beta, row.names=FALSE, sep=",", file = beta_out)

