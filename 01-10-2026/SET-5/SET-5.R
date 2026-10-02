# Dataset
date        <- as.Date(c("2023-01-01", "2023-01-02", "2023-01-03",
                         "2023-01-04", "2023-01-05"))
page_views  <- c(1500, 1600, 1400, 1650, 1800)
ctr         <- c(2.3, 2.7, 2.0, 2.4, 2.6)

# Line Chart
plot(date, page_views,
     type = "o",
     pch  = 19,
     col  = "blue",
     xaxt = "n",
     xlab = "Date",
     ylab = "Page Views",
     main = "Daily Page Views")
axis(1, at = date, labels = format(date, "%b %d"))

# Dataset
web <- data.frame(
  date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03",
                   "2023-01-04", "2023-01-05")),
  page_views = c(1500, 1600, 1400, 1650, 1800),
  ctr = c(2.3, 2.7, 2.0, 2.4, 2.6)
)

# Select the top N days (N = 3)
N   <- 3
top <- head(web[order(-web$ctr), ], N)

# Bar Chart
barplot(top$ctr,
        names.arg = format(top$date, "%Y-%m-%d"),
        xlab = "Date",
        ylab = "Click-through Rate (%)",
        main = paste("Top", N, "Days by Click-through Rate"),
        col  = "darkorange",
        ylim = c(0, 3.3))

install.packages("ggplot2")
library(ggplot2)

# Dataset
date     <- as.Date(c("2023-01-01", "2023-01-02", "2023-01-03",
                      "2023-01-04", "2023-01-05"))
likes    <- c(120, 150, 110, 170, 190)
shares   <- c(40, 55, 35, 60, 70)
comments <- c(25, 30, 20, 35, 45)

interactions <- data.frame(
  date  = rep(date, 3),
  type  = factor(rep(c("Likes", "Shares", "Comments"), each = 5),
                 levels = c("Comments", "Shares", "Likes")),
  count = c(likes, shares, comments)
)

# Stacked Area Chart
ggplot(interactions, aes(x = date, y = count, fill = type)) +
  geom_area() +
  labs(title = "User Interactions Over Time",
       x = "Date",
       y = "Number of Interactions",
       fill = "Interaction")

