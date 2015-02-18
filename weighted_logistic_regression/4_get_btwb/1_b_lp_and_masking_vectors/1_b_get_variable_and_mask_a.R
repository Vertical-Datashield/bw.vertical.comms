###############################################################
#Runs on Study 1 with dataset b
# identify which variables are in a study a and mask them
###############################################################
b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/b.csv"
x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/x_variables.csv"
beta_table_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/beta.csv"

bmv2_betaa_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/bmv2_betaa.csv"
#n_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv" #take n already
bmv2_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/bmv2.csv"

####################################
#read in data
####################################

data<-as.matrix(read.csv(b_in, header=TRUE))
x_variables<-as.matrix(read.csv(x_variables_in, header=TRUE))
beta_table<-as.matrix(read.csv(beta_table_in, header=TRUE))

######################################
#identify which cols have any of the
# x variables and subset the data
#######################################
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

#########################################
#create masking vector and product must 
#be square dims of ncol(b)
#########################################
mask <- runif(nrow(b), 1, 10) # a.k.a bmv2 = masking vector must be same as length of each column in a
x_variable_number<- c(1) #will need to use args to insert the order here
beta_col<- x_variable_number + 1
iteration_number<-1 #will need to use args to insert which iteration we are on for the glm
betas<-beta_table[iteration_number,beta_col]
betas<-as.matrix(betas)
print(betas)

#need to automate expanding number of betas and explanetory variables
bmv2_betaa<-rep(NA, ncol(b))
for (i in 1:nrow(b)){
bmv2_betaa[i]<-mask[i] + (betas[1] * b[i]) #bmv2 + beta1*x1
}

write.table(bmv2_betaa, row.names=FALSE, sep=",", file = bmv2_betaa_out)
#write.table(nrow(a), row.names=FALSE, sep=",", file = n_out) #to send to analysis computer
write.table(mask, row.names=FALSE, sep=",", file = bmv2_out) #mv2



