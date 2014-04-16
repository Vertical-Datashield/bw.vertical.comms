
fn_a_in="a.csv"
fn_b_in="b.csv"
fn_log_glm_out="log_glm.csv"

loc_data_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

loc_log_glm_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/"

#########################################
# set input and outputfiles and read in data
#########################################

input_a=sprintf("%s%s", loc_data_in, fn_a_in)
input_b=sprintf("%s%s", loc_data_in, fn_b_in)
output_log_glm=sprintf("%s%s", loc_log_glm_out, fn_log_glm_out)

a<-as.matrix(read.csv(input_a, header=TRUE))
b<-as.matrix(read.csv(input_b, header=TRUE))
head(a)
head(b)
##assign data
#attach(a)
#attach(b)
#const<-as.numeric(rep("1",length(smoke)))

##create X matrix
X<-a[,1]
Y<-b[,2]

XTX<-t(X)%*%X
XTY<-t(X)%*%Y

coeffs<- solve(XTX)%*%XTY
 
#real answer###############################################
answer<-glm(selfharm~smoke, family="binomial")
summary(answer)

Call:
glm(formula = selfharm ~ smoke, family = "binomial")

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-0.3073  -0.1787  -0.1787  -0.1787   2.8795  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)  -4.1298     0.1555 -26.552  < 2e-16 ***
smoke         1.1003     0.2995   3.673 0.000239 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 572.60  on 2999  degrees of freedom
Residual deviance: 561.28  on 2998  degrees of freedom
AIC: 565.28

Number of Fisher Scoring iterations: 7
###############################################################

#test<-t(X)%*%X
#Y<-t(X)%*%b


###################################################
#iteration start
###################################################
coeff.matrix<-matrix(NA,nrow=20,ncol=2)#output matrix

#set coefficients
b0.start=1
b1.start=0
b2.start=0

icount=1

lp.start<- b0.start + b1.start*smoke
p=exp(lp.start) #########is this still the case?
w.vec = 1/((p*(1-p))*(1/(p*(1-p)))^2)#weight vector 1/(p(1-p)*(1/p(1-p))^2)
w.matrix<-diag(w.vec) #create diagonal weight matrix
z.start<-lp.start+(selfharm-p)*(1/(p*(1-p)))# z.start = lp1+(outcome-p)(1/p(1-p))
 
#calculate linear predictor (lp) and and weight vector (w.vec) from set constants log(N) = lp and  N = exp(lp) and W=1/N

coeff <- solve((t(X)) %*% w.matrix %*% X) %*% (t(X)) %*% w.matrix %*% z.start

coeff.matrix[1,]<-t(coeff)
coeff.matrix

######################################################
#loop while loop while coeffs row i ==coeffs row i-1
######################################################

for (i in 2:length(coeff.matrix[,1])){
#i=2# remove
 coeff.row= i-1
	lp.start<- coeff.matrix[coeff.row,1] + coeff.matrix[coeff.row,2]*smoke
	p<-exp(lp.start)
	w.vec = 1/((p*(1-p))*(1/(p*(1-p)))^2)#weight vector
	w.matrix<-diag(w.vec) #create diagonal weight matrix
	z.start<-lp.start+(selfharm-p)*(1/(p*(1-p)))
 	coeff <- solve((t(X)) %*% w.matrix %*% X) %*% (t(X)) %*% w.matrix %*% z.start #calculate new coefficients
	coeff.matrix[i,]<-t(coeff) #input new coefficients into a matrix

	#var.cov<-solve((t(X)) %*% w.matrix %*% X)
	#s.error<-sqrt(diag(var.cov)) #output standard error
	icount=icount+1
				  }
print(coeff.matrix)




