##################################################
#on outcome variable server calculate Z and send back to client
###################################################
fn_y_variable_in="y_variable.csv"
fn_b_in="b.csv"
fn_pa_in="pa.csv"
fn_lp_a_in="lp_a.csv"

fn_z_out="z.csv"

loc="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

input_b=sprintf("%s%s", loc, fn_b_in)
input_y_variable=sprintf("%s%s", loc, fn_y_variable_in)
input_pa=sprintf("%s%s", loc, fn_pa_in)
input_lp_a=sprintf("%s%s", loc, fn_lp_a_in)
output_z=sprintf("%s%s", loc, fn_z_out)

##########################################
#read in files
##############################################
data<-read.csv(input_b,header=TRUE)
attach(data)
y_variable<-as.matrix(read.csv(input_y_variable, header=TRUE))
pa<-as.matrix(read.csv(input_pa,header=TRUE))
lp.start<-as.matrix(read.csv(input_lp_a,header=TRUE))


####################################
#get just the outcome variable in a matrix
###########################################
ycol<-rep(NA, length(y_variable))

for (i in 1:length(y_variable)){
ycol[i]<-which(colnames(data) == y_variable[i])
}

b<-data[,ycol]
b<-as.matrix(b)


a_names<-rep(NA,ncol(b))
names<-colnames(data)
for (i in 1:length(a_names)){
a_names[i]<-names[ycol[i]]
}


colnames(b)<-a_names
head(b)


#############################################
#calculate z
##############################################
z.start<-lp.start+(b[1]-pa)*(1/(pa*(1-pa)))

write.table(z.start, row.names=FALSE, sep=",", file = output_z)

