#################################
#study A calculates XtWX and sends to client
##################################

fn_a_in="a.csv"
fn_ma_in="ma.csv"
fn_wa_in="wa.csv"
fn_ma_atwa_out="ma_ata.csv"
fn_ma_atw_out="ma_at.csv"

loc_a_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_ma_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_ma_atwa_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
loc_ma_atw_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"


#########################################
# set input and outputfiles 
#########################################

input_a=sprintf("%s%s", loc_a_in, fn_a_in)
input_ma=sprintf("%s%s", loc_ma_in, fn_ma_in)
input_wa=sprintf("%s%s", loc_a_in, fn_wa_in)
output_ma_atwa=sprintf("%s%s", loc_ma_atwa_out, fn_ma_atwa_out)
output_ma_atw=sprintf("%s%s", loc_ma_atw_out, fn_ma_atw_out)

###########################################
#read files in
###########################################

a<-as.matrix(read.csv(input_a, header=TRUE))
ma<-as.matrix(read.csv(input_ma, header=TRUE))
w<-as.matrix(read.csv(input_wa, header=TRUE))

###########################################
#product at * a
#product ma * ata
###########################################
atwa<-t(a) %*% w %*% a
atw<-t(a) %*% w 

ma_atwa<-ma %*% atwa
ma_atw<-ma %*% atw

###########################################
# write AMa to file somewhere
###########################################
write.table(ma_atwa, row.names=FALSE, sep=",", file = output_ma_atwa)
write.table(ma_atw, row.names=FALSE, sep=",", file = output_ma_atw)

#write.table(ata, row.names=FALSE, sep=",", file = output_ma_ata)
#write.table(at, row.names=FALSE, sep=",", file = output_ma_at)


