####################################################################
#identify which variables are in a study a and mask them with beta for each row
##############################################################################
#


a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/b.csv"
x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/x_variables.csv"
beta_table_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/beta.csv"

mv1_betab_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv1_betab.csv"
mv1_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/mv1.csv"


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
x_variable_number<- c(2) #will need to use args to insert the order here
beta_col<- x_variable_number + 1
iteration_number<-1 #will need to use args to insert which iteration we are on for the glm
betas<-beta_table[iteration_number,beta_col]
betas<-as.matrix(betas)
print(betas)

#need to automate expanding number of betas and explanetory variables
mv1_betab<-rep(NA, ncol(a))
for (i in 1:nrow(a)){
mv1_betab[i]<-mask[i] + (betas[1] * a[i])
}

write.table(mv1_betab, row.names=FALSE, sep=",", file = mv1_betab_out)
write.table(mask, row.names=FALSE, sep=",", file = mv1_out)



