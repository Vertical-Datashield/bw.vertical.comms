#######################################################
#client gets coefficients
#######################################################
fn_lp_a_in="lp_a.csv"
fn_cv_a_in="cv_a.csv"

fn_pa_out="pa.csv"
fn_wa_out="wa.csv"

loc="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set input and outputfiles 
#########################################

input_lp_a=sprintf("%s%s", loc, fn_lp_a_in)
input_cv_a=sprintf("%s%s", loc, fn_cv_a_in)

output_pa=sprintf("%s%s", loc, fn_pa_out)
output_wa=sprintf("%s%s", loc, fn_wa_out)

###########################################
#read files in
###########################################

lp_a<-as.matrix(read.csv(input_lp_a, header=TRUE))
cv_a<-as.matrix(read.csv(input_cv_a,header=TRUE))

############################################################
#client adds b0 to each row of a.  b0 initially set to 1
##############################################################
b0=1 #this will need to convert to an args() term next iteration

lp.start=rep(NA, length(lp_a))
for (i in 1:length(lp_a)){
lp.start[i]<- lp_a[i] + b0 - cv_a[i] #lp_a + b0 gives lp and uncloaked by - cv_a
}

#####################################################
#client calculates p and W
#######################################################
p=exp(lp.start)/(1+exp(lp.start))
w.vec = 1/((p*(1-p))*(1/(p*(1-p)))^2)#weight vector 1/(p(1-p)*(1/p(1-p))^2)
w.matrix<-diag(w.vec) #create diagonal weight matrix

write.table(p, row.names=FALSE, sep=",", file = output_pa)
write.table(w.matrix, row.names=FALSE, sep=",", file = output_wa)




