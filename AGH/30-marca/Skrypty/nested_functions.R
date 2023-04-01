severely_delayed_flights <- arrange(
  filter(
    summarise(
      group_by(flights, month, day), 
      delay = mean(dep_delay, na.rm = TRUE)
    ), delay>30
  ), -delay
 )
