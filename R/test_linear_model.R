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


linear_model <- function(raw_data, form, constants){

  if(!is.null(contrasts)){

  }

  #first make a matrix from the data frame
  dataX <- model.matrix(f,rdat)
  dataY <- matrix(raw_data[,1],ncol=1)

  #then solve
  beta <- solve( t(dataX) %*% dataX ) %*% t(dataX) %*% dataY
}
