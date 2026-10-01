# Dataset
product_id <- 1:5
product    <- c("Product A", "Product B", "Product C", "Product D", "Product E")
quantity   <- c(250, 175, 300, 200, 220)

# Bar Chart
barplot(quantity,
        names.arg = product,
        xlab = "Product Name",
        ylab = "Quantity Available",
        main = "Quantity Available by Product",
        col  = "steelblue",
        ylim = c(0, 340))

# Dataset
product  <- c("Product A", "Product B", "Product C", "Product D", "Product E")
quantity <- c(250, 175, 300, 200, 220)
category <- c("Electronics", "Electronics", "Accessories",
              "Accessories", "Home Appliances")

inventory <- data.frame(product, category, quantity)

# Rows = products, columns = categories
stack_data <- xtabs(quantity ~ product + category, data = inventory)

# Stacked Bar Chart
barplot(stack_data,
        col  = c("#4e79a7", "#f28e2b", "#59a14f", "#e15759", "#b07aa1"),
        xlab = "Product Category",
        ylab = "Quantity Available",
        main = "Quantity Available by Product Category",
        legend.text = rownames(stack_data),
        args.legend = list(x = "topright", title = "Product"),
        ylim = c(0, 620))

# Dataset
price    <- c(20, 35, 15, 25, 22)
quantity <- c(250, 175, 300, 200, 220)

# Scatter Plot
plot(price, quantity,
     main = "Product Price vs Quantity Available",
     xlab = "Product Price ($)",
     ylab = "Quantity Available",
     pch  = 19,
     col  = "red")

text(price, quantity, labels = c("A", "B", "C", "D", "E"), pos = 3)
abline(lm(quantity ~ price), lty = 2, col = "gray")

# Correlation coefficient
cor(price, quantity)
