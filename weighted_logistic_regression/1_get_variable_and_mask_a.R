###############################################################
# identify which variables are in a study a and mask them
###############################################################
a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/a.csv"
x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/x_variables.csv"
beta_table_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/beta.csv"

m_betaa_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/m_betaa.csv"
n_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"
ma_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/ma.csv"

####################################
#read in data
####################################

data<-as.matrix(read.csv(a_in, header=TRUE))
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

a<-data[,xcol]
a<-as.matrix(a)

a_names<-rep(NA,ncol(a))
names<-colnames(data)
for (i in 1:length(a_names)){
a_names[i]<-names[xcol[i]]
}

colnames(a)<-a_names
head(a) #subset of data that contains all x_variables in this study

#########################################
#create masking vector and product must 
#be square dims of ncol(a)
#########################################
mask <- runif(nrow(a), 1, 10) #masking vector must be same as length of each column in a
x_variable_number<- c(1) #will need to use args to insert the order here
beta_col<- x_variable_number + 1
iteration_number<-1 #will need to use args to insert which iteration we are on for the glm
betas<-beta_table[iteration_number,beta_col]
betas<-as.matrix(betas)
print(betas)

#need to automate expanding number of betas and explanetory variables
m_beta.a<-rep(NA, ncol(a))
for (i in 1:nrow(a)){
m_beta.a[i]<-mask[i] + (betas[1] * a[i])
}

write.table(m_beta.a, row.names=FALSE, sep=",", file = m_betaa_out)
write.table(nrow(a), row.names=FALSE, sep=",", file = n_out) #to send to analysis computer
write.table(mask, row.names=FALSE, sep=",", file = ma_out)



