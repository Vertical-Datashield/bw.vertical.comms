#TO DO: Need to pull in number of columns of dataset to feed into creation of masking matrix. 


#####
#generate masking vector length mus equal number of columns of data matrix it is applied to.
#####
###1 vector matrix
##########################################
# arguments to be read in from elsewhere
##########################################

#set masking vector output filename (.csv file).  needs to be in the style fn_out <- commandArgs(7)
fn_out="mb.csv"

#set masking vector output file location needs to be in the style loc_out <- commandArgs(7)
loc_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"


#########################################
# set outputfile for writing the csv
#########################################
output=sprintf("%s%s", loc_out, fn_out)

###########################################
# create mask and write to the output file
###########################################
mask <- runif(1, 1, 10)
write.table(mask, row.names=FALSE, sep=",", file = output)

##############################################################
#### 2 x 2 matrix
#####
#generate masking vector length must equal number of columns of data matrix it is applied to. masking vector col number = dataset row number
#####

##########################################
# arguments to be read in from elsewhere
##########################################

#set masking vector output filename (.csv file).  needs to be in the style fn_out <- commandArgs(7)
fn_out="mb.csv"

#set masking vector output file location needs to be in the style loc_out <- commandArgs(7)
loc_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"


#########################################
# set outputfile for writing the csv
#########################################
output=sprintf("%s%s", loc_out, fn_out)


###########################################
# create mask and write to the output file
###########################################
mask1 <- runif(2, 1, 10)
mask2 <- runif(2,1,10)
mask<-cbind(mask1, mask2)
write.table(mask, row.names=FALSE, sep=",", file = output)
