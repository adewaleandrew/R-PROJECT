# Sample customer purchase data
customer_data <- data.frame(
  customer_id = c(1, 1, 1, 1, 1, 1),
  purchase_date = as.Date(c('2021-01-01', '2021-04-01', '2021-07-01', '2022-01-01', '2022-04-01', '2022-07-01')),
  purchase_amount = c(500, 300, 200, 600, 400, 500)
)

# Calculate average order value
avg_order_value <- mean(customer_data$purchase_amount)

# Calculate number of repeat purchases per year
total_purchases <- nrow(customer_data)
total_years <- as.numeric(difftime(max(customer_data$purchase_date), min(customer_data$purchase_date), units = "weeks")/52)
repeat_purchases_per_year <- total_purchases/total_years

# Calculate average customer lifespan
first_purchase_date <- min(customer_data$purchase_date)
last_purchase_date <- max(customer_data$purchase_date)
lifespan_in_years <- as.numeric(difftime(last_purchase_date, first_purchase_date, units = "weeks")/52)

# Calculate CLV
clv <- avg_order_value * repeat_purchases_per_year * lifespan_in_years

# Print CLV
cat("CLV for the customer is $", round(clv, 2))
