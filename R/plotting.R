# assorted functions associated with plotting

# fancy_ts
# adds Y-axis gridlines at the maximum value of each group
# 
# from Gordon Shotwell @GShotwell
# https://gist.github.com/GShotwell/b19ef520b6d56f61a830fabb3454965b
# https://twitter.com/gshotwell/status/1574392590354505728?s=20&t=ACoGsq2bPLaj2IIjmCrD-g
#
breaks_ts_max_grp <- function(df, date_var, val, group) {
  labs <- df |> 
    group_by({{group}}) |> 
    summarize(breaks = max({{val}}))
  
  ggplot(df, 
         aes(
           x = {{date_var}}, 
           y = {{val}}, 
           group = {{group}}, 
           color = {{group}})) +
    geom_path() +
    scale_y_continuous(breaks = labs$breaks, minor_breaks = NULL) +
    theme_minimal()
}


# Y axis breaks at the minimum & maximum values
# modification of `breaks_ts_max_grp()` by Gordon Shotwell (above)
breaks_ts_min_max <- function(df, date_var, val) {
  labs <- df |>
    summarize(
      breaks = c(
        min({{val}}),
        max({{val}}))
      )
      
      ggplot(df,
             aes(x = {{date_var}},
                 y = {{val}})) +
        geom_path() +
        scale_y_continuous(breaks = labs$breaks) +
        theme_minimal()
}

# Y axis breaks at the first and last points in the series
# modification of `breaks_ts_max_grp()` by Gordon Shotwell (above)
breaks_ts_1_2 <- function(df, date_var, val) {
  labs <- df |>
    summarize(
      breaks = c(
        {{val}}[1],                 # first value
        {{val}}[length({{val}})]    # last value in series
      ))
      
      ggplot(df,
             aes(x = {{date_var}},
                 y = {{val}})) +
        geom_path() +
        scale_y_continuous(breaks = labs$breaks) +
        theme_minimal()
}


###---###

# absolute value AND comma function
# from https://stackoverflow.com/questions/37949473/how-do-you-make-ggplot-labels-use-both-labels-abs-and-labels-comma
abs_comma <- function (x, ...) {
  format(abs(x), ..., big.mark = ",", scientific = FALSE, trim = TRUE)
}


