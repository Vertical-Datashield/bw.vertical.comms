########################
#output: mat41, mat42
#########################
mat21_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat21.csv"

mat22_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat22.csv"

a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/a.csv"

J_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/J.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/x_variables.csv"

pv2_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv2.csv"

mat41_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat41.csv"

mat42_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mat42.csv"

J<-as.matrix(read.csv(J_in, header=TRUE))
n<-as.matrix(read.csv(n_in, header=TRUE))
data<-as.matrix(read.csv(a_in, header=TRUE))
x_variables<-as.matrix(read.csv(x_variables_in, header=TRUE))
mat21<-as.matrix(read.csv(mat21_in, header=TRUE))
mat22<-as.matrix(read.csv(mat22_in, header=TRUE))
pv2<-as.matrix(read.csv(pv2_in, header=TRUE))
#################################################
#subset variables needed from study a
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

colnames(a)<-a_names
head(a) #subset of data that contains all x_variables in this study

################################
#create L by dividing exp(pv2) by weighted product from AC
################################
L<-exp(pv2)/J
#############################################
# create mat41 and mat42
#############################################
mat41=t(a)%*%(L*mat21)
mat42=t(a)%*%(L*mat22)

################################
#write to files
################################

write.table(mat41, row.names=FALSE, sep=",", file = mat41_out)
write.table(mat42, row.names=FALSE, sep=",", file = mat42_out)

