library(ggplot2)
library(dplyr)

data <- ggplot2::diamonds
head(data)
summary(data)

ggplot(data, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "blue", color = "white") +
  labs(title = "Distribution of Diamond Prices", x = "Price (USD)", y = "Count") +
  theme_minimal()

ggplot(data, aes(x = carat, y = price)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Relationship between Carat and Price", x = "Carat", y = "Price (USD)") +
  theme_minimal()

average_price_by_cut <- data %>%
  group_by(cut) %>%
  summarise(AvgPrice = mean(price))

ggplot(average_price_by_cut, aes(x = reorder(cut, -AvgPrice), y = AvgPrice, fill = cut)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Price by Cut", x = "Cut", y = "Average Price (USD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data, aes(x = carat)) +
  geom_histogram(binwidth = 0.1, fill = "green", color = "white") +
  labs(title = "Distribution of Carat Weights", x = "Carat", y = "Count") +
  theme_minimal()

