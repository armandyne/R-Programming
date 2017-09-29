## Functions to implement caching for Computing the inverse of a matrix
## usage :
##   > inv<-makeCacheMatrix(matrix(c(4,2,7,6),2,2))
##   > cacheSolve(inv)
##   [,1] [,2]
##   [1,]  0.6 -0.7
##   [2,] -0.2  0.4
##   > cacheSolve(inv)
##   getting cached data
##   [,1] [,2]
##   [1,]  0.6 -0.7
##   [2,] -0.2  0.4

## creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
     if(!is.matrix(x)) {
          stop("Argument x is not a matrix")
     }
     
     inverted <- NULL
     
     set <- function(y) {
          x<<-y
          inverted<<-NULL
     }
     
     get <- function() {
          x
     }
     
     setInverted <- function(inv) {
          inverted<<-inv
     }
     
     getInverted <- function() {
          inverted
     }
     
     return(list(set=set, get=get, setInverted=setInverted, getInverted=getInverted))
}


## computes the inverse of the special "matrix" returned by makeCacheMatrix function
## or retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
     inverted<-x$getInverted()

     if(!is.null(inverted)) {
          message("getting cached data")
          return(inverted)
     }
     data <- x$get()
     inverted <- solve(data, ...)
     x$setInverted(inverted)
     inverted
}
