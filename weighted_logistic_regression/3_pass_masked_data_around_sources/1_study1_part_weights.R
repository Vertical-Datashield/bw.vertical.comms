###########################################
# First study prepares a masked dataset 
#including a weight element to the second study.
#################################################

p1_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p1.csv" #p to make exp(p)

w_1_exp_gammap_tau_expp_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/w_1_exp_gammap_tau_expp.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

w_1_exp_gammap_tau_expp<-as.matrix(read.csv(w_1_exp_gammap_tau_expp_in, header=TRUE))
p1<-as.matrix(read.csv(p1_in, header=TRUE))
n<-as.matrix(read.csv(n_in, header=TRUE))

################################################
#divide exp(p) by what comes from analysis comp
################################################
exp_p<-exp(p1)
M<-exp_p/w_1_exp_gammap_tau_expp

##############################################
# Generate Rb random vector to add to the study data
#####################################################

Rb<-runif(2,100)

