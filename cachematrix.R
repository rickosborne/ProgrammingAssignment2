## @author Rick Osborne

## These functions implement wrappers around a matrix that
## provide a cache layer for inversion.

## Example:
## m <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2))
## cacheSolve(m)  # Should see "Calculating & caching inverse"
## cacheSolve(m)  # Should see "Using cached value for inverse"

## Constructor: use this method to create a new caching matrix.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() { x }
    solve <- function() {
        ## I went with a memoization approach instead of
        ## explicit get/set methods.  See:
        ## http://en.wikipedia.org/wiki/Memoization
        if (is.null(inverse)) {
            message("Calculating & caching inverse")
            inverse <<- base:::solve(x)
        } else {
            message("Using cached value for inverse")
        }
        inverse
    }
    list(set = set, get = get, solve = solve)
}

## Solver: Instead of using `solve`, use this function to solve
##  for the inverse of the matrix.  The result will be cached and
##  subsequent calls will return the result much faster.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## Due to the use of memoization above, this is a bit silly.
    x$solve(...)
}
