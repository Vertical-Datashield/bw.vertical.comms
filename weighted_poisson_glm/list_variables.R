###############################################
#list of variables
###############################################

fn_y_out="y_variable.csv"
fn_x_out="x_variables.csv"

loc_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"
output_y=sprintf("%s%s", loc_out, fn_y_out)
output_x=sprintf("%s%s", loc_out, fn_x_out)
################

y<-"N"
x<-c("age.c", "ht.c")

write.table(y, sep=",", row.names=FALSE, file = output_y)
write.table(x, sep=",", row.names=FALSE, file = output_x)
