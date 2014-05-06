##################################
#calculate linear predictor_ab 
##################################
b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/b.csv"
lp_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/lp_a.csv"
x_variables_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/x_variables.csv"
cv_b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cv_a.csv"
lp_ab_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/lp_ab.csv"


###########################################
#read files in
###########################################

data<-as.matrix(read.csv(b_in, header=TRUE))
x_variables<-as.matrix(read.csv(x_variables_in, header=TRUE))#no header in file
cv_b<-as.matrix(read.csv(cv_b_in, header=TRUE)) #cloaking vector b
lp_a<-as.matrix(read.csv(lp_a_in, header=TRUE))


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

b<-data[,xcol]
b<-as.matrix(b)

b_names<-rep(NA,ncol(b))
names<-colnames(data)
for (i in 1:length(b_names)){
b_names[i]<-names[xcol[i]]
}


colnames(b)<-b_names
head(b)


######################################################
#linear predictor start = set to 1
######################################################
lp_ab<-rep(NA, length(b))
no.beta<-ncol(b)
beta_vector<-rep(1,length(no.beta)) #value will be read in by an args function in subsequent iterations

for (i in 1:length(b)){
lp_ab[i]<- lp_a[i] + cv_b[i] + (beta_vector[1]*b[i])
}
lp_ab<-as.matrix(lp_ab)
colnames(lp_ab)<-"lp_ab"
##########################
#need to scale this to be any number of betas
##############################
write.table(lp_ab, row.names=FALSE, sep=",", file = lp_ab_out)












