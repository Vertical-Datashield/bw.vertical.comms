##################################
#calculate linear predictor
##################################
a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/a.csv"
x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/x_variables.csv"
cv_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cv_a.csv"
lp_a_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/lp_a.csv"


###########################################
#read files in
###########################################

data<-as.matrix(read.csv(a_in, header=TRUE))
x_variables<-as.matrix(read.csv(x_variables_in, header=FALSE))#no header in file
cv_a<-as.matrix(read.csv(cv_a_in, header=TRUE)) #cloaking vector a

##################################################
#search for explanatory variables
##################################################
#xcol<-rep(NA, length(x_variables))

#for (i in 1:length(x_variables)){
#xcol[i]<-which(colnames(data) == x_variables[i])
#}

xcol<-which(colnames(data) == x_variables)

#for (i in 1:length(x_variables)){
#if(colnames(data) == x_variables[i]){
#xcol[i]<-x_variables[i]}
#else{xcol[i]<-NA}
#}

a<-data[,xcol]
a<-as.matrix(a)

a_names<-rep(NA,ncol(a))
names<-colnames(data)
for (i in 1:length(a_names)){
a_names[i]<-names[xcol[i]]
}


colnames(a)<-a_names
head(a)


######################################################
#linear predictor start = set to 1
######################################################
lp_a<-rep(NA, length(a))
no.beta<-ncol(a)
beta_vector<-rep(1,length(no.beta))

for (i in 1:length(a)){
lp_a[i]<- cv_a[i] + (beta_vector[1]*a[i])
}
lp_a<-as.matrix(lp_a)
colnames(lp_a)<-a_names
##########################
#need to scale this to be any number of betas
##############################
write.table(lp_a, row.names=FALSE, sep=",", file = lp_a_out)












