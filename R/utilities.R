# assorted utility functions

# not in (opposite of %in%)
#'%!in%' <- function(x,y)!('%in%'(x,y))

#'%!in%' <- function(x,y){
not_in <- function(x,y){
    !('%in%'(x,y))
}
# alternative (with dependency)
# `%not_in%` <- purrr::negate(`%in%`)



