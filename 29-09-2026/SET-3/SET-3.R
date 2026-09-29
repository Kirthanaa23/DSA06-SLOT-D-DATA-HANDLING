employee_id <- c(1, 2, 3, 4, 5)
department <- c("Sales", "HR", "Marketing", "Sales", "HR")
years <- c(5, 3, 7, 4, 2)
score <- c(85, 92, 78, 90, 76)

ord <- order(years)
plot(years[ord], score[ord],
     type = "o",
     pch = 19,
     col = "blue",
     lwd = 2,
     ylim = c(70, 100),
     xlab = "Years of Service",
     ylab = "Performance Score",
     main = "Employee Performance Trend")
text(years[ord], score[ord], labels = score[ord], pos = 3)
legend("topright",
       legend = "Performance Score",
       col = "blue", lty = 1, pch = 19)

dept_count <- table(department)
colors <- c("skyblue", "lightgreen", "orange")
bp <- barplot(dept_count,
              xlab = "Department",
              ylab = "Number of Employees",
              main = "Employee Distribution by Department",
              col = colors,
              ylim = c(0, 3))
text(bp, dept_count, labels = dept_count, pos = 3)
legend("topright",
       legend = names(dept_count),
       fill = colors)

plot(years, score,
     main = "Years of Service vs Performance Score",
     xlab = "Years of Service",
     ylab = "Performance Score",
     pch = 19,
     col = "red")
abline(lm(score ~ years), col = "blue", lty = 2)
cor(years, score)