####################################################################
#the highest number pv = gamma+p.  in this case pv2 is from study 2
#Study 2 must create random vector tau to mask gamma+p 
#that is sent to the first study. tau is sent to analysis computer
####################################################################
pv2_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/pv2.csv"

n_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/n.csv"

tau_exp_gammap_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau_exp_gammap.csv"

tau_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/test.data/simulated_self_harm_data/tau.csv"

pv2<-as.matrix(read.csv(pv2_in, header=TRUE))
n<-as.matrix(read.csv(n_in, header=TRUE))

###########
#create tau
###########
tau<-runif(n[1], 2, 10)

tau_exp_gammap<-exp(pv2)+tau

write.table(tau_exp_gammap, row.names=FALSE, sep=",", file = tau_exp_gammap_out)
write.table(tau, row.names=FALSE, sep=",", file = tau_out)
