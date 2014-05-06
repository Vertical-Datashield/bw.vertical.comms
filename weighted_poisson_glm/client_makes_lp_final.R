#########################################################
#client add b0 to linear predictor and remove cva and cvb
#calculate mu and weight matrix
##########################################################
cv_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cv_a.csv"
cv_b_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/cv_b.csv"
lp_ab_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/lp_ab.csv"


lp_final_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/lp_final.csv"
##########################
#read data in
cv_b<-as.matrix(read.csv(cv_b_in, header=TRUE)) #cloaking vector b
cv_a<-as.matrix(read.csv(cv_b_in, header=TRUE)) #cloaking vector a
lp_ab<-as.matrix(read.csv(lp_ab_in, header=TRUE))

const = 1 # will need to set this through args in subsequent iterations

#######################################################
#ad const (b0) and subtract cv_a and vc_b from each row
########################################################
lp_final<-rep(NA, length(lp_ab))

for (i in 1:length(lp_ab)){
lp_final[i]<- const + lp_ab[i] - cv_a[i] - cv_b[i]
}
lp_final<-as.matrix(lp_final)
colnames(lp_final)<-"lp"

############################################################
#calculate mu for each row
############################################################
mu<-rep(NA, length(lp_final))
for (i in 1:length(lp_final)){
mu[i]<- exp(lp_final[i])
}
mu<-as.matrix(mu)
colnames(mu)<-"mu"

############################################################
#calculate weight vector and weight matrix
############################################################

for (i in 1:length(lp_ab)){
wv[i]<-1/(mu[i]*((1/mu[i])^2))
}

W<-diag(wv)
head(wv)


