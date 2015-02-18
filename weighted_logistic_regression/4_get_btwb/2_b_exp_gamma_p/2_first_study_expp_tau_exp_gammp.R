##################################################
#study 1 adds exp(p1) to tau_exp_gammap and sends 
#to analysis computer
#################################################

p1_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/p1.csv"

tau_exp_gammap_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau_exp_gammap.csv"

tau_exp_gammap_expp_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau_exp_gammap_expp.csv"


p1<-read.csv(p1_in, header=TRUE)
tau_exp_gammap<-read.csv(tau_exp_gammap_in, header=TRUE)

####################################
#add exp(p1) to tau_exp_gammap
#####################################

tau_exp_gammap_expp<-tau_exp_gammap + exp(p1)

write.table(tau_exp_gammap_expp, row.names=FALSE, sep=",", file=tau_exp_gammap_expp_out)


