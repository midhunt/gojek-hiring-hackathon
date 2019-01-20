tmp <- dtDayDuration[, .(duration_online_hrs = sum(duration_online_hrs)), 
              by = c("is_male", "is_weekend")][, duration_online_pct := duration_online_hrs/sum(duration_online_hrs)]

ggplot(tmp) +
  geom_tile(aes(x = is_male, 
                y = is_weekend, 
                fill = duration_online_pct)) +
  scale_fill_continuous(low = "#c6dbef", 
                        high = "#08306b",
                        label = scales::percent) +
  theme(legend.position = "bottom") +
  xlab("Is Male") +
  ylab("Is Weekend") +
  ggtitle("Distribution for Male and Weekend")



