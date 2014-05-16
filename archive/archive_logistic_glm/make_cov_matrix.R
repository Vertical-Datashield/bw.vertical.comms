#############################################
# Remove MA and Make covariance matrix
#############################################

##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

fn_ma_ata_in="ma_ata.csv" #a.a
fn_ma_atb_in="ma_atb.csv"  #a.b
fn_mb_btb_in="mb_btb.csv" #b.b
fn_mb_bta_in="mb_bta.csv" #b.a
fn_sums_in="sums.csv" #b.a
fn_sumscol_in="sumscol.csv" 

fn_ma_in="ma.csv" # ma
fn_mb_in="mb.csv" # mb

fn_cov_matrix_out="cov_matrix.csv"

loc_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set input and outputfiles 
#########################################

input_ma_ata=sprintf("%s%s", loc_in, fn_ma_ata_in)
input_ma_atb=sprintf("%s%s", loc_in, fn_ma_atb_in)
input_mb_btb=sprintf("%s%s", loc_in, fn_mb_btb_in)
input_mb_bta=sprintf("%s%s", loc_in, fn_mb_bta_in)
input_sums=sprintf("%s%s", loc_in, fn_sums_in)
input_sumscol=sprintf("%s%s", loc_in, fn_sumscol_in)

input_ma=sprintf("%s%s", loc_in, fn_ma_in)
input_mb=sprintf("%s%s", loc_in, fn_mb_in)

output_cov_matrix=sprintf("%s%s", loc_out, fn_cov_matrix_out)

###########################################
#read files in
###########################################

ma_ata<-as.matrix(read.csv(input_ma_ata, header=TRUE))
ma_atb<-as.matrix(read.csv(input_ma_atb, header=TRUE))
mb_btb<-as.matrix(read.csv(input_mb_btb, header=TRUE))
mb_bta<-as.matrix(read.csv(input_mb_bta, header=TRUE))
sums<-as.matrix(read.csv(input_sums, header=TRUE))
colnames(sums)<-"sums"
sumscol<-as.matrix(read.csv(input_sumscol, header=TRUE))

ma<-as.matrix(read.csv(input_ma, header=TRUE))
mb<-as.matrix(read.csv(input_mb, header=TRUE))

##############################################
#strip ma and mb from respective products
##############################################
a.a<-solve(ma) %*% ma_ata #age weight
rownames(a.a)<-colnames(a.a)
b.b<-solve(mb) %*% mb_btb #ht bmi
rownames(b.b)<-colnames(b.b)
a.b<-solve(ma) %*% ma_atb #ht bmi
rownames(a.b)<-colnames(a.a)
b.a<-solve(mb) %*% mb_bta #age weight
rownames(b.a)<-colnames(b.b)

aa.ab<-cbind(a.a, a.b)
ba.bb<-cbind(b.a, b.b)
cov.matrix<-rbind(t(sums),aa.ab, ba.bb)

cov.matrix<-cbind(sumscol,cov.matrix)
rownames(cov.matrix)[1]<-"sums"
colnames(cov.matrix)[1]<-"sums"
#a.a<-ma_ata 
#b.b<-mb_btb
#a.b<-ma_atb
#b.a<-mb_bta

#cov.matrix<-c(a.a, b.a, b.a, b.b) ; dim(cov.matrix)<-c(2,2)

#############################################
#covariance matrix
#############################################
write.table(cov.matrix, sep=",", file = output_cov_matrix)




 






















