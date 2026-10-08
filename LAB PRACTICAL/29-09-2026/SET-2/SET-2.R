
# Dataset: Customer Ages
age <- c(25, 30, 35, 28, 40)

# Histogram of Customer Ages
hist(age,
     main = "Distribution of Customer Ages",
     xlab = "Age",
     ylab = "Frequency",
     col = "skyblue",
     border = "black")


# Dataset: Customer Satisfaction Scores
satisfaction <- c(4, 5, 3, 4, 5)

# Calculate frequency counts
score_counts <- table(satisfaction)

# Calculate percentages
percent <- round(score_counts / sum(score_counts) * 100)

# Create labels
pie_labels <- paste("Score", names(score_counts),
                    "\n", score_counts,
                    "(", percent, "%)")

# Pie Chart
pie(score_counts,
    labels = pie_labels,
    main = "Overall Distribution of Customer Satisfaction Scores",
    col = c("salmon", "skyblue", "lightgreen"))



# Dataset: Ages and Satisfaction Scores
age <- c(25, 30, 35, 28, 40)
satisfaction <- c(4, 5, 3, 4, 5)

# Create Age Groups
age_group <- cut(age,
                 breaks = c(20, 29, 39, 49),
                 labels = c("20-29", "30-39", "40-49"))

# Create frequency table
table_data <- table(satisfaction, age_group)

# Stacked Bar Chart
barplot(table_data,
        main = "Distribution of Customer Satisfaction Scores by Age Group",
        xlab = "Age Group",
        ylab = "Number of Customers",
        col = c("salmon", "skyblue", "lightgreen"),
        legend.text = rownames(table_data),
        args.legend = list(title = "Score",
                           x = "topright"))


# Install packages only once if required
# install.packages("wordcloud")
# install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)

# Sample Open-Ended Customer Feedback
# The original dataset contains no text feedback,
# so sample feedback is used for the word cloud.

feedback <- c(
  "Excellent customer service and friendly staff",
  "Great product quality and quick delivery",
  "Very helpful support team",
  "Good quality product and satisfied experience",
  "Fast delivery and friendly staff",
  "Excellent service and helpful support"
)

# Combine all feedback
text <- paste(feedback, collapse = " ")

# Convert text to lowercase
text <- tolower(text)

# Split text into individual words
words <- unlist(strsplit(text, "\\W+"))

# Remove common words
stop_words <- c("and", "the", "very", "with")

words <- words[!words %in% stop_words]

# Remove very short words
words <- words[nchar(words) > 2]

# Count word frequencies
word_freq <- table(words)

# Sort frequencies
word_freq <- sort(word_freq, decreasing = TRUE)

# Generate Word Cloud
set.seed(123)

wordcloud(
  words = names(word_freq),
  freq = as.numeric(word_freq),
  min.freq = 1,
  scale = c(3, 0.8),
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2"),
  main = "Prevalent Customer Sentiments Word Cloud"
)