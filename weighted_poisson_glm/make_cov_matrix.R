#############################################
# Remove MA and Make covariance matrix
#############################################

##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

ma_atwa_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atwa.csv" #a.a
ma_atwb_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma_atwb.csv"  #a.b
mb_btwb_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb_btwb.csv" #b.b
mb_btwa_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb_btwa.csv" #b.a
#fn_sums_in="sums.csv" #b.a
#fn_sumscol_in="sumscol.csv" 

ma_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/ma.csv" # ma
mb_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/mb.csv" # mb

cov_matrix_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cov_matrix.csv"

###########################################
#read files in
###########################################

ma_atwa<-as.matrix(read.csv(ma_atwa_in, header=TRUE))
ma_atwb<-as.matrix(read.csv(ma_atwb_in, header=TRUE))
mb_btwb<-as.matrix(read.csv(mb_btwb_in, header=TRUE))
mb_btwa<-as.matrix(read.csv(mb_btwa_in, header=TRUE))
#sums<-as.matrix(read.csv(input_sums, header=TRUE))
#colnames(sums)<-"sums"
#sumscol<-as.matrix(read.csv(input_sumscol, header=TRUE))

ma<-as.matrix(read.csv(ma_in, header=TRUE))
mb<-as.matrix(read.csv(mb_in, header=TRUE))

##############################################
#strip ma and mb from respective products
##############################################
a.a<-solve(ma) %*% ma_atwa #age weight
rownames(a.a)<-colnames(a.a)
b.b<-solve(mb) %*% mb_btwb #ht bmi
rownames(b.b)<-colnames(b.b)
a.b<-solve(ma) %*% ma_atwb #ht bmi
rownames(a.b)<-colnames(a.a)
b.a<-solve(mb) %*% mb_btwa #age weight
rownames(b.a)<-colnames(b.b)

aa.ab<-cbind(a.a, a.b)
ba.bb<-cbind(b.a, b.b)
cov.matrix<-rbind(aa.ab, ba.bb)

#############################################
#covariance matrix
#############################################
write.table(cov.matrix, sep=",", file = cov_matrix_out)




 






















