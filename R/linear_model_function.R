#' a linear model function mimicking lm
#'
#' @param form A formula
#' @param raw_data A data frame
#' @param const A list of contrasts for factor variables
#'
#' @examples
#'
#'
#'

#---------------------------------------------------------
#the following will (hopefully) solve directly
#---------------------------------------------------------

linear_model <- function(form, data, contrasts = NULL){
  #Make a model matrix
  X <- model.matrix(form, data,  contrasts.arg = contrasts)
  Y <- matrix(data[,1],ncol = 1)

  #solve directly
  beta <- solve( t(X) %*% X, diag(ncol(X)),1e-36 ) %*% t(X) %*% Y

  #change into list
  return(list(coefficients = beta))
}


#---------------------------------------------------------
# the following will solve using gradient descent
#---------------------------------------------------------
#formula for the initial  function
F <- function(beta, Y, X){
   drop(t(Y) %*%  Y + t(beta) %*% t(X) %*% X %*% beta - 2 *  t(Y) %*% X  %*% beta)
}
#formula for the gradient
dF <- function(beta, Y, X){
  (2 * t(X) %*%  X  %*% beta - 2 *  t(X) %*%  Y)
}

linear_model2 <- function(form, data, contrasts = NULL){
#Make a model matrix
  X <- model.matrix(form, data, contrasts.arg = contrasts)
  Y <- matrix(data[,1],ncol = 1)

  beta_k <- matrix(1, ncol = 1, nrow = ncol(data)+1)
  beta_k_new <- matrix(18, ncol = 1, nrow = ncol(data)+1)

  if(ncol(data)>nrow(data)){
    beta_k[,ncol(data)+1] <- NA
    beta_k_new[,ncol(data)+1] <- NA
  }
  while(!isTRUE(all.equal(beta_k, beta_k_new, tolerance = 1e-12))){
    beta_k <- beta_k_new
    F(beta_k_new, Y, X)
    beta_k_new <- beta_k -  0.0001 * dF(beta_k_new, Y, X)
  }
 return(list(coefficients = beta_k_new))
}

