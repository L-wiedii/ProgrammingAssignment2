## Put comments here that give an overall description of what your
## functions do

## manage the cache

makeCacheMatrix <- function(x = matrix()) {
  cm <- x
  om <- NULL
  
  set <- function(y){
    s <<- solve(y)
    om <<- cm
    cm <<- y
  }
  get <- function() s
  getOm <- function() om
  getCm <- function() cm
  list(set=set,get=get,getOm=getOm, getCm=getCm)
}


## receive a makeCacheMatrix object and return it's cached inversed matrix or cache it if not.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  if(!identical(x$getCm(),x$getOm())){
    message('caching')
    x$set(x$getCm())
  }else{
    message('cached')
  }
  x$get()
}
#d<-makeCacheMatrix(matrix(c(1,2,3,4),nrow=2,ncol=2))
#cacheSolve(d)