# assorted date functions

# calculate age in years
calc_age <- function(birth_date, ref_date = Sys.Date()) {
  age_calc = lubridate::as.period(lubridate::interval(birth_date, ref_date), unit = "year")
  age_calc_year = age_calc %/% years(1)
  return(age_calc_year)
}





