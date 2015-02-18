########################################################
#AC removes tau, creates new mask (omega) and sends
# product to each study)


tau_exp_gammap_expp_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau_exp_gammap_expp.csv"

tau_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau.csv"

K_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/K.csv" # 1/omega * (exp_gammap_tau_expp - tau)

J_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/J.csv"# omega * (exp_gammap_tau_expp - tau)

omega_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/omega.csv"

tau_exp_gammap_expp<-as.matrix(read.csv(tau_exp_gammap_expp_in, header=TRUE))
tau<-as.matrix(read.csv(tau_in, header=TRUE))

########################
#remove tau
########################

exp_gammap_expp<-tau_exp_gammap_expp - tau

###########################
#create omega mask
############################

omega<-runif(length(tau), 2, 10) #how big a number does this need to be?

################################################
#1/omega * exp_gammap_expp goes to study 1
# omega * exp_gammap_expp goes to study 2
###############################################

K <- (1/omega) * exp_gammap_expp #1/omega * (exp_gammap_tau_expp - tau)
J <- omega * exp_gammap_expp # omega * (exp_gammap_tau_expp - tau)

write.table(K, row.names=FALSE, sep=",", file = K_out)
write.table(J, row.names=FALSE, sep=",", file = J_out)
write.table(omega, row.names=FALSE, sep=",", file = omega_out)

