###########################################
# study a prepares a masked dataset 
# For A.B : study a creates Rb (random variable) and masks its data with that.
#new variables created: Rk, Rk_a
#################################################

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/a.csv"

x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/x_variables.csv"

Rk_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/Rk.csv"

U_Rk_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/U_Rk.csv"

Rk_a_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/Rk_a.csv"

n<-as.matrix(read.csv(n_in, header=TRUE))
data<-as.matrix(read.csv(a_in, header=TRUE))
x_variables<-as.matrix(read.csv(x_variables_in, header=TRUE))

##############################################
# Generate Rk (random vector) and U (random scalar)
#to add to the study data before sending it to
# the second study.
#####################################################

Rk<-runif(n[1],2,100) 
U<- runif(1, 2,100)
U_Rk<-U*Rk

#check mask
#head(Rk)
#head(U_Rk)

####################################################
#subset relevant variables in study b
#################################################
x_tf<-x_variables %in% colnames(data)
x_true<-which(x_tf == TRUE)
study_x_variables<-x_variables[x_true]

xcol<-which(colnames(data) == study_x_variables)

a<-data[,xcol]
a<-as.matrix(a)

a_names<-rep(NA,ncol(a))
names<-colnames(data)
for (i in 1:length(a_names)){
a_names[i]<-names[xcol[i]]
}

colnames(b)<-a_names
head(a) #subset of data that contains all x_variables in this study

#############################################
#calculate masked study matrices
#############################################
Rk_a<- a + Rk

###############################################
#write outputs
###########################################
write.table(Rk_a, row.names=FALSE, sep=",", file = Rk_a_out)
write.table(U_Rk, row.names=FALSE, sep=",", file = U_Rk_out)
