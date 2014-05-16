########################################################################
#script to create manual XTX and XTY to do unweighted glm on raw data
#########################################################################
#selfharm~smoke
########################


##########################################
# these arguments to be read in from elsewhere e.g. fn_a_in <- commandArgs(7)
##########################################

fn_data_in="combined_data.csv"

fn_coeffs_out="coeffs.csv"

loc_data_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/rosie_data/"

loc_coeffs_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/rosie_data/output"

#########################################
# set input and outputfiles 
#########################################

input_data=sprintf("%s%s", loc_data_in, fn_data_in)
output_coeffs=sprintf("%s%s", loc_coeffs_out, fn_coeffs_out)

###########################################
#read files in
###########################################

data<-read.csv(input_data, header=TRUE)
attach(data)

########################################
#create X and Y
########################################
const<-as.numeric(rep("1",length(smoke)))
X<-cbind(const,smoke)
Y<-selfharm

########################################
#create XTX and XTY
########################################
XTX<-t(X)%*%X
XTY<-t(X)%*%Y

#########################################
#calculate coeffs using (XTX)^-1 * XTY
#########################################
coeffs<-(solve(XTX))%*%XTY
print(coeffs)


