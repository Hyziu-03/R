flights %>%
  group_by(month, day) %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE)) %>%
  filter(delay > 30) %>%
  arrange(-delay)
