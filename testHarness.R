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
#check that inverse calculated both ways is the same
identical(m_cache$getInverse(),cacheSolve(m_cache))

#another example
m2<-0.001*diag(1,5)
m_cache2 <- makeCacheMatrix(m2)
#may not work before cached; 2nd try works
identical(m_cache2$getInverse(),cacheSolve(m_cache2))

