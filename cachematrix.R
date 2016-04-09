##=============================================================
## Function: makeCacheMatrix
## Args:
##   x: a matrix  
## Returns:
##    a list.  Enter m_cache at prompt to see of internal functions
##      $setMatrix
##      $getMatrix
##      $setInverse
##      $getInverse
## Purpose:
##   function that checks for previous calc of matric inverse
##     if exist then use cached inverse
##=============================================================
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  ## =========================
  ##  setters
  ## =========================
  #create set method to matrix
  setMatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  #create set matrix inverse
  setInverse <- function(inverse) m <<- inverse
  ## =========================
  ##  setters
  ## =========================
  
  
  ## =========================
  ##  getters
  ## =========================
  #create get method to matrix
  getMatrix <- function() x
  
  #create get matrix inverse
  getInverse <- function() m
  ## =========================
  ##  getters
  ## =========================
  
  #create list of methods to present to user
  list(
      setMatrix = setMatrix, 
      getMatrix = getMatrix,
      setInverse = setInverse,
      getInverse = getInverse
      )
}

##=============================================================
## Function: cacheSolve
## Args:
##   x:  a matrix   
## Returns:
##    Matrix object that is inverse of matrix passed in as argument
## Purpose:
##   Check for previously calculated inverse with getInverse
##     if missing then calcuate it and uses setInverse to store it
##       in passed in matrix's inverse property
## Note:
##    This function assumes that the matrix is always invertible.
##=============================================================
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
  mtrx <- x$getMatrix()
  
  newInverse <- solve(mtrx, ...)
  
  #set inverse property of matrix
  x$setInverse(newInverse)
  
  #return newly calculated inverse matrix
  newInverse
}