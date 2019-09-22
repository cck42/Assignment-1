library(testthat)

context("Test that the gradient descent function on homework 1 works")

test_that("gradient descent works for an easy case",{
  data(iris)

  fit_linear_model <- linear_model2(Sepal.Length ~ ., iris)

  fit_lm <- lm(Sepal.Length  ~ ., iris)

  expect_equivalent(fit_lm$coefficients, fit_linear_model$coefficients,
                    tolerance = 1e-5)
})
