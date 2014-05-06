##################################
#calculate linear predictor
##################################
fn_a_in="a.csv"
fn_x_variables_in="x_variables.csv"
fn_cv_a_in="cv_a.csv"
fn_lp_a_out="lp_a.csv"

loc="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set input and outputfiles 
#########################################

input_a=sprintf("%s%s", loc, fn_a_in)
input_x_variables=sprintf("%s%s", loc, fn_x_variables_in)
input_cv_a=sprintf("%s%s", loc, fn_cv_a_in)
output_lp_a=sprintf("%s%s", loc, fn_lp_a_out)


###########################################
#read files in
###########################################

data<-as.matrix(read.csv(input_a, header=TRUE))
x_variables<-as.matrix(read.csv(input_x_variables, header=TRUE))

##################################################
#search for explanatory variables
##################################################
xcol<-rep(NA, length(x_variables))

for (i in 1:length(x_variables)){
xcol[i]<-which(colnames(data) == x_variables[i])
}

a<-data[,xcol]
a<-as.matrix(a)

a_names<-rep(NA,ncol(a))
names<-colnames(data)
for (i in 1:length(a_names)){
a_names[i]<-names[xcol[i]]
}


colnames(a)<-a_names
head(a)

cv_a<-as.matrix(read.csv(input_cv_a, header=TRUE)) #cloaking vector a
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
#need to scale this to be ny number of betas
##############################
write.table(lp_a, row.names=FALSE, sep=",", file = output_lp_a)












