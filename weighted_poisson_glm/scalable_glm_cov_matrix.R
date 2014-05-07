#################################################
#calculate coeffs using XTX and XTY scalable
###################################################
cov_matrix_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cov_matrix.csv"
x_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/x_variables.csv"
y_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/y_variable.csv"

coeffs_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/coeffs.csv"

###########################################
#read files in
###########################################

cov.matrix<-as.matrix(read.csv(cov_matrix_in, header=TRUE))
x<-as.matrix(read.csv(x_in, header=TRUE))
y<-as.matrix(read.csv(y_in, header=TRUE))
###########################################
#test files
###########################################
cov.matrix
x
y

x<-c("const",x)
############################################
#select column names from the varibale names files
#############################################
#const<-"sums"
#sumsrow<-which(rownames(cov.matrix) == const)
#sumscol<-which(colnames(cov.matrix) == const)
ycol<-which(colnames(cov.matrix) == y[1])
yrow<-which(rownames(cov.matrix) == y[1])

xcol<-rep(NA, length(x))
xrow<-rep(NA, length(x))

for (i in 1:length(x)){
xcol[i]<-which(colnames(cov.matrix) == x[i])
xrow[i]<-which(rownames(cov.matrix) == x[i])
}

#sums1<-cov.matrix[sumsrow,c(sumscol,xcol)]
xtx<-cov.matrix[xrow,xcol] #xtx


#########################################
#create XTX and XTY
##########################################
#xtx<-rbind(sums1, xrows)
#rownames(xtx)<-c(const, x) #XtX
Y<-cov.matrix[yrow,xcol] #XtY

#######################################
#calculate coeffs
#######################################
X<-solve(xtx)
	coeff<-X %*% Y
	print(coeff)

write.table(coeff, sep=",", row.names=FALSE, coeffs_out)


