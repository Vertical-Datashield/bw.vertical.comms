#################################################################
#Analysis computer makes PV0
##################################################################
beta_table_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/beta.csv"
n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

pv0_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv0.csv"
m0_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/m0.csv"

beta_table<-as.matrix(read.csv(beta_table_in, header=TRUE))
n<-as.matrix(read.csv(n_in, header=TRUE))

#####################################################
#create mask and pv0 for each row = mask[i] + beta0
####################################################
mask <- runif(n[1], 1, 10)
beta_col<- 1
iteration_number<-1 #will need to use args to insert which iteration we are on for the glm
betas<-beta_table[iteration_number,beta_col]
betas<-as.matrix(betas)
print(betas)

C<- rep(1, n[1]) #column of 1s

pv0<-rep(NA, n[1])

for (i in 1:(n[1])){
pv0[i]<-mask[i] + betas[1]*C[i]
}

write.table(pv0, row.names=FALSE, sep=",", file = pv0_out)
write.table(mask, row.names=FALSE, sep=",", file = m0_out)



