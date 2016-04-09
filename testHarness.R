#testHarness
source("cachematrix.R") 
#create a simple matrix
m<-matrix(data=1:4,nrow=2,ncol=2)
#view the atomic vector
m
#call cache matrix function
m_cache <- makeCacheMatrix(m)
#check that is the same as m
identical(m,m_cache$get())

cacheSolve(m_cache)