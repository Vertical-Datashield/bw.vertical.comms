###########################################
# First study prepares a masked dataset 
#including a weight element to the second study.
#outputs: k, mat21, mat22, Rb
#################################################

p1_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p1.csv" #p to make exp(p)

w_1_exp_gammap_tau_expp_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/w_1_exp_gammap_tau_expp.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/b.csv"

x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/x_variables.csv"

k_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/k.csv"

mat21_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat21.csv"

mat22_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat22.csv"

Rb_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/Rb.csv"

w_1_exp_gammap_tau_expp<-as.matrix(read.csv(w_1_exp_gammap_tau_expp_in, header=TRUE))
p1<-as.matrix(read.csv(p1_in, header=TRUE))
n<-as.matrix(read.csv(n_in, header=TRUE))
data<-as.matrix(read.csv(b_in, header=TRUE))
x_variables<-as.matrix(read.csv(x_variables_in, header=TRUE))

################################################
#divide exp(p) by what comes from analysis comp
################################################
exp_p<-exp(p1)
M<-exp_p/w_1_exp_gammap_tau_expp

##############################################
# Generate Rb (random vector) and k (random scalar)
#to add to the study data before sending it to
# the second study.
#####################################################

Rb<-runif(n[1],2,100) 
k<- runif(1, 5,1000) #need just a single value

####################################################
#subset relevant variables in study b
#################################################
x_tf<-x_variables %in% colnames(data)
x_true<-which(x_tf == TRUE)
study_x_variables<-x_variables[x_true]

xcol<-which(colnames(data) == study_x_variables)

b<-data[,xcol]
b<-as.matrix(b)

b_names<-rep(NA,ncol(b))
names<-colnames(data)
for (i in 1:length(b_names)){
b_names[i]<-names[xcol[i]]
}

colnames(b)<-b_names
head(b) #subset of data that contains all x_variables in this study

#############################################
#calculate two masked study matrices
#############################################

mat21<-M*Rb
mat22<-M*k*(b+Rb)
colnames(mat21)<-"mat21"
colnames(mat22)<-"mat22"

###############################################
#write outputs
###########################################

write.table(mat21, row.names=FALSE, sep=",", file = mat21_out)
write.table(mat22, row.names=FALSE, sep=",", file = mat22_out)
write.table(k, row.names=FALSE, sep=",", file = k_out)
write.table(Rb, row.names=FALSE, sep=",", file = Rb_out)


