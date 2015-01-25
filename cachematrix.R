## This set of functions returns and stores the inverse of a given matrix 


## This function creates a list with the matrices and corresponding
## inverted matrices calculated by cacheSolve function 

makeCacheMatrix <- function(mat=matrix()) {  
  m <- NULL  
  set <- function(newmat){  
    mat <<- newmat
    m <<- NULL
  }
  get <- function() mat
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set=set , get=get,
       setsolve=setsolve, 
       getsolve=getsolve)
}


## This function checks if the matrix has been inverted and stored in cache previously.
## If this is the case, the function returns the storage data.
## If the inverted matrix has not been stored, this function calculate the inverted 
## matrix and store it in cache.

cacheSolve <- function(makeCacheMatrix,...){
  m <- makeCacheMatrix$getsolve()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- makeCacheMatrix$get()
  newsolve <- solve(data)
  makeCacheMatrix$setsolve(newsolve)
  newsolve
}