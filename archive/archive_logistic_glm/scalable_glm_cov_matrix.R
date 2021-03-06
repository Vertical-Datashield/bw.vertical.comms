
fn_cov_matrix_in="cov_matrix.csv"
fn_x_in="x_variables.csv"
fn_y_in="y_variable.csv"

fn_coeffs_out="coeffs.csv"

loc_cov_matrix_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_coeffs_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set input and outputfiles 
#########################################

input_cov_matrix=sprintf("%s%s", loc_cov_matrix_in, fn_cov_matrix_in)
input_x=sprintf("%s%s", loc_cov_matrix_in, fn_x_in)
input_y=sprintf("%s%s", loc_cov_matrix_in, fn_y_in)

output_coeffs=sprintf("%s%s", loc_coeffs_out, fn_coeffs_out)

###########################################
#read files in
###########################################

cov.matrix<-as.matrix(read.csv(input_cov_matrix, header=TRUE))
x<-as.matrix(read.csv(input_x, header=TRUE))
y<-as.matrix(read.csv(input_y, header=TRUE))
###########################################
#test files
###########################################
cov.matrix
x
y

############################################
#select column names from the varibale names files
#############################################
const<-"sums"
sumsrow<-which(rownames(cov.matrix) == const)
sumscol<-which(colnames(cov.matrix) == const)
ycol<-which(colnames(cov.matrix) == y[1])
yrow<-which(rownames(cov.matrix) == y[1])

xcol<-rep(NA, length(x))
xrow<-rep(NA, length(x))

for (i in 1:length(x)){
xcol[i]<-which(colnames(cov.matrix) == x[i])
xrow[i]<-which(rownames(cov.matrix) == x[i])
}

sums1<-cov.matrix[sumsrow,c(sumscol,xcol)]
xrows<-cov.matrix[xrow,c(sumscol,xcol)]


#########################################
#create XTX and XTY
##########################################
xtx<-rbind(sums1, xrows)
rownames(xtx)<-c(const, x) #XtX
Y<-cov.matrix[yrow,c(sumscol,xcol)] #XtY

#######################################
#calculate coeffs
#######################################
X<-solve(xtx)
	coeff<-X %*% Y
	print(coeff)


