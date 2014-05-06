#######################################################################
# test the answer for a poisson weighted glm on raw simulated
# data without using covariance matrix
#######################################################################
data_in="/home/rw13742/Documents/datashield/testing/vertical_comms/data/data.csv"
xtx_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/xtx_poisson.csv"
xty_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/xty_poisson.csv"
xtwx1_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/xtwx_1poisson.csv"
xtwy1_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/xtwy_1poisson.csv"
coeff_out="/home/rw13742/Documents/datashield/testing/vertical_comms/data/coeff_answerpoisson.csv"
#########################################
# read in data
#########################################

data<-read.csv(data_in, header=TRUE)

attach(data)


#assign data
age.c<-a[,"age.c"]
ht.c<-b[,"ht.c"]
N<-b[,"N"]
const<-as.numeric(rep("1",length(age.c)))

#create X matrix
X<-cbind(const, age.c, ht.c)
#head(X)
#answer<-glm(N~age.c+ht.c, family="poisson")
#summary(answer)

xtx<-t(X)%*%X
xty<-t(X)%*%N

xtx
xty

write.table(xtx, row.names=FALSE, sep=",", file = xtx_out)
write.table(xty, row.names=FALSE, sep=",", file = xty_out)
###################################################
#iteration start
###################################################
coeff.matrix<-matrix(NA,nrow=20,ncol=3)#output matrix

#set coefficients
b0.start=1
b1.start=0
b2.start=0

icount=1

lp.start<- b0.start + b1.start*age.c + b2.start*ht.c
mu=exp(lp.start)

w.vec = 1/(mu*((1/mu)^2))#weight vector
w.matrix<-diag(w.vec) #create diagonal weight matrix
z.start<-lp.start+(N-mu)*(1/mu)
 
#calculate linear predictor (lp) and and weight vector (w.vec) from set constants log(N) = lp and  N = exp(lp) and W=1/N

xtwx<-t(X) %*% w.matrix %*% X
xtwy<- t(X) %*% w.matrix %*% z.start

write.table(xtwx, row.names=FALSE, sep=",", file = xtwx1_out)
write.table(xtwy, row.names=FALSE, sep=",", file = xtwy1_out)


coeff <- solve((t(X)) %*% w.matrix %*% X) %*% (t(X)) %*% w.matrix %*% z.start

coeff.matrix[1,]<-t(coeff)
#coeff.matrix

######################################################
#loop while loop while coeffs row i ==coeffs row i-1
######################################################

for (i in 2:length(coeff.matrix[,1])){
#i=2# remove
 coeff.row= i-1
	lp.start<- coeff.matrix[coeff.row,1] + coeff.matrix[coeff.row,2]*age.c + coeff.matrix[coeff.row,2]*ht.c
	mu<-exp(lp.start)
	w.vec = 1/(mu*((1/mu)^2))#weight vector
	w.matrix<-diag(w.vec) #create diagonal weight matrix
	z.start<-lp.start+(N-mu)*(1/mu)
 	coeff <- solve((t(X)) %*% w.matrix %*% X) %*% (t(X)) %*% w.matrix %*% z.start #calculate new coefficients
	coeff.matrix[i,]<-t(coeff) #input new coefficients into a matrix

	#var.cov<-solve((t(X)) %*% w.matrix %*% X)
	#s.error<-sqrt(diag(var.cov)) #output standard error
	icount=icount+1
				  }
		
write.table(coeff.matrix, sep=",", row.names=FALSE, coeff_out)

var cov of parameter estimates = solve(t(X)%*%W%*%X)  
diagonals of var cov of parameter = variance of estimates 
standard error = sqare root of variance of estimates
slide 26 of workshop.


standard error. 

Coefficients:
             Estimate Std. Error z value Pr(>|z|)    
(Intercept)  0.685786   0.007116  96.368  < 2e-16 ***
age.c        0.058504   0.006136   9.534  < 2e-16 ***
ht.c        -0.528084   0.070498  -7.491 6.85e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for poisson family taken to be 1)

    Null deviance: 11604  on 9999  degrees of freedom
Residual deviance: 11456  on 9997  degrees of freedom
AIC: 34085

Number of Fisher Scoring iterations: 5


----------


A.A
atwa

no study can know the weight matrix



























