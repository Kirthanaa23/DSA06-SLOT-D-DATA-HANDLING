# Dataset (rows = months, columns = products)
sales_matrix <- rbind(
  January  = c(2000, 1500, 1200),
  February = c(2200, 1800, 1400),
  March    = c(2400, 1600, 1100)
)
colnames(sales_matrix) <- c("Product A", "Product B", "Product C")

# Grouped Bar Chart
barplot(sales_matrix,
        beside = TRUE,
        col  = c("steelblue", "darkorange", "forestgreen"),
        xlab = "Product",
        ylab = "Sales",
        main = "Quarter 1 Sales by Product",
        legend.text = rownames(sales_matrix),
        args.legend = list(x = "topright", title = "Month"),
        ylim = c(0, 3000))

library(ggplot2)

# Dataset in long format
long_sales <- data.frame(
  month   = rep(1:3, times = 3),
  product = rep(c("Product A", "Product B", "Product C"), each = 3),
  sales   = c(2000, 2200, 2400,
              1500, 1800, 1600,
              1200, 1400, 1100)
)

# Stacked Area Chart
ggplot(long_sales, aes(x = month, y = sales, fill = product)) +
  geom_area() +
  scale_x_continuous(breaks = 1:3,
                     labels = c("January", "February", "March")) +
  labs(title = "Overall Sales Trend - First Quarter",
       x = "Month",
       y = "Sales",
       fill = "Product")
