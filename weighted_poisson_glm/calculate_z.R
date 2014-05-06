##################################################
#study B calculates Z
#################################################

b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/b.csv"
mu_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mu.csv"
lp_final_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/lp_final.csv"
y_variable_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/y_variable.csv"


z_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/z1.csv"

##########################
#read data in
##########################
data<-as.matrix(read.csv(b_in, header=TRUE)) 
mu<-as.matrix(read.csv(mu_in, header=TRUE)) 
lp_final<-as.matrix(read.csv(lp_final_in, header=TRUE))
y_variable<-as.matrix(read.csv(y_variable_in, header=TRUE))

############################################################
#identify which column is the outcome variable (y_variable)
###########################################################
ycol<-which(colnames(data) == y_variable[1])
outcome<-data[,ycol]
outcome<-as.matrix(outcome)

colnames(outcome)<-y_variable
head(outcome)

##############################################
#calculate z for each row
#############################################
z<-rep(NA, length(outcome))

for (i in 1:length(outcome)){
z[i]<-lp_final[i]+(outcome[i]-mu[i])*(1/mu[i])
}
z<-as.matrix(z)
colnames(z)<-"z"

write.table(z, sep=",", row.names=FALSE, z_out)







