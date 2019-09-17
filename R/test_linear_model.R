#' a linear model function mimicking lm
#'
#' @param form A formula
#' @param raw_data A data frame
#' @param const A list of constants for factor variables
#'
#' @examples
#'
#'
#'


F <- function(beta, Y, X){
   drop(t(Y) %*%  Y + t(beta) %*% t(X) %*% X %*% beta - 2 *  t(Y) %*% X  %*% beta)
}
dF <- function(beta, Y, X){
  (2 * t(X) %*%  X  %*% beta - 2 *  t(X) %*%  Y)
}

linear_model <- function(form, data, constants = NULL){
  if(!is.null(constants)){
    #however you want to deal with the factor levels
  }
  #Make a model matrix
  X <- model.matrix(form, data)
  Y <- matrix(data[,1],ncol = 1)

  beta_k <- matrix(1, ncol = 1, nrow = ncol(data)+1)
  beta_k_new <- matrix(18, ncol = 1, nrow = ncol(data)+1)
  while(!isTRUE(all.equal(beta_k, beta_k_new, tolerance = 1e-6))){
    beta_k <- beta_k_new
    F(beta_k_new, Y, X)
    beta_k_new <- beta_k -  0.0001 * dF(beta_k_new, Y, X)
  }
 return(beta_k_new)
}
