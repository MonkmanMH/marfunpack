# assorted utility functions

# not in (opposite of %in%)
'%!in%' <- function(x,y)!('%in%'(x,y))
# alternative
# `%not_in%` <- purrr::negate(`%in%`)

