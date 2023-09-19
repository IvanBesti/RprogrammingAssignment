# Function to create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        # Initialize the cache
        cache <- NULL
        
        # Function to set the matrix
        setMatrix <- function(matrix) {
                x <<- matrix
                cache <<- NULL
        }
        
        # Function to get the matrix
        getMatrix <- function() {
                x
        }
        
        # Function to set the cached inverse of the matrix
        setInverse <- function(inverse) {
                cache <<- inverse
        }
        
        # Function to get the cached inverse of the matrix
        getInverse <- function() {
                cache
        }
        
        # Return a list of functions to interact with the matrix object
        list(setMatrix = setMatrix, getMatrix = getMatrix,
             setInverse = setInverse, getInverse = getInverse)
}

# Function to compute the inverse of a cached matrix (if available)
cacheSolve <- function(cacheMatrix) {
        # Check if the cached inverse already exists
        if (!is.null(cacheMatrix$getInverse())) {
                cat("Getting cached inverse\n")
                return(cacheMatrix$getInverse())
        }
        
        # If the cached inverse doesn't exist, compute it and cache it
        matrixData <- cacheMatrix$getMatrix()
        inverse <- solve(matrixData)
        cacheMatrix$setInverse(inverse)
        inverse
}

# Create a special matrix object and set a matrix
myMatrix <- makeCacheMatrix(matrix(1:4, nrow = 2))

# Compute and cache the inverse of the matrix
cacheSolve(myMatrix)

# Retrieve the cached inverse
cacheSolve(myMatrix)



