# @author Rick Osborne

# These functions implement wrappers around a matrix that
# provide a cache layer for inversion.

# Constructor: use this method to create a new caching matrix.

makeCacheMatrix <- function(x = matrix()) {

}

# Solver: Instead of using `inverse`, use this function to solve
#  for the inverse of the matrix.  The result will be cached and
#  subsequent calls will return the result much faster.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
