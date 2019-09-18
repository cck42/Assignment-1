X <- model.matrix(y ~., lm_patho)
Y <- matrix(lm_patho[,1],ncol = 1)

beta <- double(length = ncol(lm_patho)+1)
if(ncol(lm_patho)>nrow(lm_patho)){
  beta[ncol(lm_patho)+1] <- NA
}

#solve directly
beta <- solve( t(X) %*% X ) %*% t(X) %*% Y
