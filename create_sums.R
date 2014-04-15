#create sums of x and y for cov_matrix outcome = 


fn_a_in="a.csv" #a
fn_b_in="b.csv" #b

fn_sumscol_out="sumscol.csv" 
fn_sums_out="sums.csv"
#fn_sumsa_out="sumsa.csv"
#fn_sumsb_out="sumsb.csv"

loc_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_sums_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"



#########################################
# set input and outputfiles 
#########################################

input_a=sprintf("%s%s", loc_a_in, fn_a_in)
input_b=sprintf("%s%s", loc_b_in, fn_b_in)

output_sums=sprintf("%s%s", loc_sums_out, fn_sums_out)
output_sumscol=sprintf("%s%s", loc_sums_out, fn_sumscol_out)
#output_sumsa=sprintf("%s%s", loc_sums_out, fn_sumsa_out)
#output_sumsb=sprintf("%s%s", loc_sums_out, fn_sumsb_out)
###########################################
#read files in
###########################################
a<-as.matrix(read.csv(input_a, header=TRUE))
b<-as.matrix(read.csv(input_b, header=TRUE))

##########################################
#sum of variables
###########################################
#const.const<-length(a)
#sums<-c(const.const,colSums(a), colSums(b))

#sumsa<-colSums(a)
#sumsb<-colSums(b)

sums<-c(colSums(a), colSums(b))
sumscol<-c(length(a), sums)


#write.table(sumsa,sep=",", file=output_sumsa)
#write.table(sumsb, sep=",", file=output_sumsb)
write.table(sums, sep=",", file = output_sums)
write.table(sumscol, sep=",", file = output_sumscol)









