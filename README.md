**(no idea what second line about CRAN mirror means but I need it for
the R code lines to not fuck everything up)**

Assignment 1 Lessons
--------------------

#### Creating a package

-   You need the following packages loaded: devtools, knitr, roxygen2,
    testthat

<!-- -->

    install.packages(c("devtools", "roxygen2", "testthat", "knitr"))

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/9v/4_r87pxs7v5b41b99yywrlqc0000gn/T//RtmpBglc5p/downloaded_packages

-   Then, create the package by entering:

<!-- -->

    devtools::create("path/package_name")

-   For more info on this, go [here](http://r-pkgs.had.co.nz/intro.html)

#### Working through code from class…

-   Matrix functions
    -   "%\*%" is matrix multiplication
    -   t(matrix) is a transposition of the matrix
    -   The last line is:

    <!-- -->

        beta <- solve( t(X) %*% X ) %*% t(X) %*% Y

    which, when broken down, is solving for the constant of regression
    (beta) for X multiplied by its transposition and then multiplying it
    by the transposition of X and by Y. Look later for the math (I don’t
    get it right now)
-   Working backwards, we have:

        Y <- matrix(iris$Sepal.Length, ncol = 1)

    which is, from what I understand, regressing everything onto
    Sepal.Length (but check on this)  
-   Then before that we have:

        X <- model.matrix(form, iris)

    which is creating a model matrix from the data frame “iris” using
    the formula “form”
-   The line before that

        form <- Sepal.Length ~ .

    is just setting a formula for the matrix, which should be one of the
    inputs for this assignment

#### Now, making this a function:

-   I need to import tibble I think  
-   Made dummy variables for all inputs  
-   Built matrix X using model.matrix function  
-   Dealing with “list of constants for factor variables”
    -   I looked at the test file for this because honestly didn’t
        understand what it wanted me to do  
    -   These constants are optional, only when the user puts them in,
        so I’m going to have a replace function for if it is not null?
        Maybe?  
    -   I am goin

##### Questions to ask:

-   How to resolve Travis thing (is this because all my github accounts
    are associated with my gmail?)  
-   What is a transposition? Why is it used?  
-   How to submit (fork, sandbox, or create own repository)  
-   Why is my beautiful markdown file not working
