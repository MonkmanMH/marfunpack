# functions to add variables (could also be using in a `summarise()`)

# NOTE: these are designed to work with StatCan data downloaded using {cansim} and cleanded with `janitor::clean_names()`

# get_mom_stats / get_yoy_stats
#
# intended for monthly data series, calculates the month-over-month
#   and year-over-year change
get_mom_stats <- function(df) {
  df %>%
    arrange(ref_date) %>%
    mutate(mom_val = lag(value), 
           mom_pct = ((value / lag(value, n = 1)) - 1) * 100,
           mom_chg = (value - lag(value, n = 1)))
}


get_yoy_stats <- function(df) {
  df %>%
    arrange(ref_date) %>%
    mutate(yoy_val = lag(value, n = 12),
           yoy_pct = ((value / lag(value, n = 12)) - 1) * 100,
           yoy_chg = (value - lag(value, n = 12)))
}


# get period over period (row over row?)
get_pop_stats <- function(df) {
  df %>%
    arrange(ref_date) %>%
    mutate(pop_val = lag(value), 
           pop_pct = ((value / lag(value, n = 1)) - 1) * 100,
           pop_chg = (value - lag(value, n = 1)))
}


