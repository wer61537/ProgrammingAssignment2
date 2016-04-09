#testHarness
source("cachematrix.R") 
#create a simple matrix
m<-matrix(data=1:4,nrow=2,ncol=2)
#view the atomic vector
m
#call cache matrix function
m_cache <- makeCacheMatrix(m)
#check that is the same as m
identical(m,m_cache$getMatrix())
<<<<<<< HEAD
#timing for getInverse method in makeCacheMatrix
startTime <-proc.time()
m_cache$getInverse()
proc.time()-startTime
#user  system elapsed 
#0.00    0.02    0.01

#timing for cacheSolve first call
startTime <-proc.time()
cacheSolve(m_cache)
proc.time()-startTime
#user  system elapsed 
#0.01    0.00    0.02

#timing for cacheSolve 2nd call
startTime <-proc.time()
cacheSolve(m_cache)
proc.time()-startTime
#user  system elapsed 
#0.00    0.02    0.02

#not seeing much of a difference

#check that inverse calculated both ways is the same
#first iteration is false, 2nd is true
=======
#check that inverse calculated both ways is the same
>>>>>>> b62dbd7f804240006296353217d0c0ad3ddaa655
identical(m_cache$getInverse(),cacheSolve(m_cache))

#another example
m2<-0.001*diag(1,5)
m_cache2 <- makeCacheMatrix(m2)
#may not work before cached; 2nd try works
identical(m_cache2$getInverse(),cacheSolve(m_cache2))

