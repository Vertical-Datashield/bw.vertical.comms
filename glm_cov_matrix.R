#################################
#model Y ~X
# (XtX)^-1 . XtY
#
#model B ~A
#(AtA)^-1 . AtB
# AA^-1.AB
#################################


##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

fn_cov_matrix_in="cov_matrix.csv"
#fn_N_in="N.csv"

fn_coeffs_out="coeffs.csv"

loc_cov_matrix_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_coeffs_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set input and outputfiles 
#########################################

input_cov_matrix=sprintf("%s%s", loc_cov_matrix_in, fn_cov_matrix_in)
output_coeffs=sprintf("%s%s", loc_coeffs_out, fn_coeffs_out)

###########################################
#read files in
###########################################

cov.matrix<-as.matrix(read.csv(input_cov_matrix, header=TRUE))

###########################################
#where cov matrix = X to glm do 
#
#B~A
###########################################
cov.matrix

#ds.glm<-function(y,x){
#x<-"age.c"
#y<-"weight.c"
#	X<-solve(cov_matrix[x,x])
#	Y<-cov_matrix[x,y]
#	coeff<-X %*% Y
#	return(coeff)


###################################
#y~x+z
###################################
#phenotype~age60+sex  this works!!!!

##ds.glm<-function(y,x){
#x<-"age60"
#z<- "sex"
#y<-"phenotype"
#
#const<-"sums"
#
#sumsrow<-which(rownames(cov.matrix) == const)
#sumscol<-which(colnames(cov.matrix) == const)
#ycol<-which(colnames(cov.matrix) == y)
#yrow<-which(rownames(cov.matrix) == y)
#xcol<-which(colnames(cov.matrix) == x)
#xrow<-which(rownames(cov.matrix) == x)
#zcol<-which(colnames(cov.matrix) == z)
#zrow<-which(rownames(cov.matrix) == z)
#
#sums1<-cov.matrix[sumsrow,c(sumscol,xcol, zcol)]
#xrows<-cov.matrix[xrow,c(sumscol,xcol,zcol)]
#zrows<-cov.matrix[zrow,c(sumscol,xcol,zcol)]
#Y<-cov.matrix[yrow,c(sumscol,xcol,zcol)]
#
#xtx<-rbind(sums1, xrows,zrows)
#rownames(xtx)<-c(const, x, z)
#	X<-solve(xtx)
#	coeff<-X %*% Y
#	print(coeff)
##}


######################################
#Y~X
######################################
#ds.glm<-function(y,x){
x<-"smoke"
y<-"selfharm"

const<-"sums"

sumsrow<-which(rownames(cov.matrix) == const)
sumscol<-which(colnames(cov.matrix) == const)
ycol<-which(colnames(cov.matrix) == y)
yrow<-which(rownames(cov.matrix) == y)
xcol<-which(colnames(cov.matrix) == x)
xrow<-which(rownames(cov.matrix) == x)

sums1<-cov.matrix[sumsrow,c(sumscol,xcol)]
xrows<-cov.matrix[xrow,c(sumscol,xcol)]
Y<-cov.matrix[yrow,c(sumscol,xcol)]

xtx<-rbind(sums1, xrows)
rownames(xtx)<-c(const, x)

	X<-solve(xtx)
	coeff<-X %*% Y
	print(coeff)
#}




