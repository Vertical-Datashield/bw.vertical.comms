##################################################
#create cloaking vector 
####################################################fn_a_in="a.csv"
b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/b.csv"
cv_b_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cv_b.csv"


###########################################
#read files in
###########################################

data<-as.matrix(read.csv(b_in, header=TRUE))
head(data)

b<-data[,1] #age.c

cv_b<- runif(length(b), 1, 10)
write.table(cv_b, row.names=FALSE, sep=",", file = cv_b_out)
