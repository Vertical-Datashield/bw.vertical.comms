##################################################
#create cloaking vector
####################################################fn_a_in="a.csv"
fn_a_in="a.csv"
fn_cv_a_out="cv_a.csv"

loc_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"


#########################################
# set input and outputfiles 
#########################################

input_a=sprintf("%s%s", loc_a_in, fn_a_in)
output_cv_a=sprintf("%s%s", loc_a_in, fn_cv_a_out)

###########################################
#read files in
###########################################

data<-as.matrix(read.csv(input_a, header=TRUE))
a<-data[,1] #smoke

cv_a<- runif(length(a), 1, 10)
write.table(cv_a, row.names=FALSE, sep=",", file = output_cv_a)
