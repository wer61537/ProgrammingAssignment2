# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

## Function: makeCacheMatrix
## Args:
##
## Purpose:
##   matrix object that caches its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  #create set method to matrix
  setMatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  #create get method to matrix
  getMatrix <- function() x
  
  #create set matrix inverse
  setInverse <- function(inverse) m <<- inverse
  
  #create get matrix inverse
  getInverse <- function() m
  
  #create list of methods to present to user
  list(
      setMatrix = setMatrix, 
      getMatrix = getMatrix,
      setInverse = setInverse,
      getInverse = getInverse
      )
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

## Function: cacheSolve
## Args:
##
## Purpose:
##   matrix object that caches its inverse

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
  #get inverse property of matrix passed as argument
  inv <- x$getInverse()
  
  if(is.null(inv)) {
    message("Calculating inverse of matrix.")
  }
  else{
    message("Inverse previously calculated. Getting cached inverse of matrix.")
    return(inv)
  }
  #get the matrix detail
  data <- x$getMatrix()
  
  inv <- solve(data, ...)
  
  #set inverse property of matrix
  x$setInverse(inv)
  
  #return newly calculated invers
  inv
}