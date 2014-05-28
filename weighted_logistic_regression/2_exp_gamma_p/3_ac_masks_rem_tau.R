########################################################
#AC removes tau, creates new mask (omega) and sends
# product to each study)


exp_gammap_tau_expp_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/exp_gammap_tau_expp.csv"

tau_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau.csv"

w_1_exp_gammap_tau_expp_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/w_1_exp_gammap_tau_expp.csv"

w_exp_gammap_tau_expp_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/w_exp_gammap_tau_expp.csv"

omega_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/omega.csv"

exp_gammap_tau_expp<-as.matrix(read.csv(exp_gammap_tau_expp_in, header=TRUE))
tau<-as.matrix(read.csv(tau_in, header=TRUE))

########################
#remove tau
########################

exp_gammap_expp<-exp_gammap_tau_expp - tau

###########################
#create omega mask
############################

omega<-runif(length(tau), 2, 10) #how big a number does this need to be?

################################################
#1/omega * exp_gammap_expp goes to study 1
# omega * exp_gammap_expp goes to study 2
###############################################

w_1_exp_gammap_tau_expp <- (1/omega) * exp_gammap_expp #1/w *product
w_exp_gammap_tau_expp <- omega * exp_gammap_expp # w* product

write.table(w_1_exp_gammap_tau_expp, row.names=FALSE, sep=",", file = w_1_exp_gammap_tau_expp_out)
write.table(w_exp_gammap_tau_expp, row.names=FALSE, sep=",", file = w_exp_gammap_tau_expp_out)
write.table(omega, row.names=FALSE, sep=",", file = omega_out)

