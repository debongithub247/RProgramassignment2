## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

##---------------------------------------------------------------------


##----------------##MY SOLUTION--------------  

## This function computes the inverse of the special "matrix" created by makeCacheMatrix below. 

  makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
  }



##If the inverse has been calculated already and the  matrix remains unchanged,then it should give the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

##RESULTS of the Execution of the above code. 
##Output of the lines are shown in comments
mmt <- makeCacheMatrix(matrix(rnorm(4), 2, 2))
#I have used rnorm function to generate the 4 numbers so the 4 numbers will change
#every time. 
mmt$get()
# [,1]        [,2]
# [1,] -0.67290043 -0.55102682
# [2,]  0.08510713  0.08545136
mmt$getInverse()
#NULL
cacheSolve(mmt)
#[,1]      [,2]
#[1,] -8.058449 -51.96432
#[2,]  8.025987  63.45755

cacheSolve(mmt)
#getting cached data
#[,1]      [,2]
#[1,] -8.058449 -51.96432
#[2,]  8.025987  63.45755

mmt$getInverse()
# [,1]      [,2]
# [1,] -8.058449 -51.96432
# [2,]  8.025987  63.45755

