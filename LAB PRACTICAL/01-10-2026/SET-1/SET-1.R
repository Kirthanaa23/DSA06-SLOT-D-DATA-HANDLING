# SET 1: MONTHLY SALES

# Data
month <- c("January","February","March","April","May")
sales <- c(15000,18000,22000,20000,23000)
product <- c("Laptop","Mobile","Tablet","Headphone","Watch")
product_sales <- c(50000,45000,30000,25000,20000)
advertising <- c(5000,6000,7000,6500,8000)

# 1. Line Chart
plot(sales, type="o", xaxt="n",
     xlab="Month", ylab="Sales",
     main="Monthly Sales")
axis(1, 1:5, month)

# 2. Bar Chart
barplot(product_sales, names.arg=product,
        xlab="Products", ylab="Sales",
        main="Top-Selling Products")

# 3. Scatter Plot
plot(advertising, sales, pch=19,
     xlab="Advertising Budget",
     ylab="Monthly Sales",
     main="Advertising vs Sales")
abline(lm(sales ~ advertising))

# Insight:
# Advertising and sales show a positive relationship.

# 4. Simple Interactive Dashboard using Shiny
# Run this part separately after installing shiny:
# install.packages("shiny")

library(shiny)

ui <- fluidPage(
  titlePanel("Monthly Sales Dashboard"),
  plotOutput("line"),
  plotOutput("bar")
)

server <- function(input, output) {
  output$line <- renderPlot({
    plot(sales, type="o", xaxt="n",
         xlab="Month", ylab="Sales",
         main="Monthly Sales")
    axis(1, 1:5, month)
  })
  
  output$bar <- renderPlot({
    barplot(product_sales, names.arg=product,
            xlab="Products", ylab="Sales",
            main="Top-Selling Products")
  })
}

shinyApp(ui, server)