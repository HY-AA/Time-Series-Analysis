library(TSA)
library(stats)
library(tidyverse)
library(readxl)
library(forecast)
library(tseries)
library(lubridate)

# Import the oats dataset
oat_dt <- read_excel("oats.xlsx")
# head(oat_dt)
# summary(oat_dt)

oat_dt <- oat_dt %>%
  select(Date = REF_DATE, Oats = VALUE) %>%
  filter(as.Date(Date) > as.Date("1981-12-01") & as.Date(Date) <= as.Date("2022-12-01"))


# Plot production of oats against date
ggplot(oat_dt, aes(x = Date, y = Oats)) + 
  geom_line() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Time Series Plot of Oats Production in BC from 1982 to 2022",
       subtitle = "Units in Tonnes",
       x = "Time",
       y = "Oats Produced")

# Convert the variables into TS objects and plot ACF&PACF
oat_dt_tsa <- ts(oat_dt$Oats, start = c(year(oat_dt$Date[1]), month(oat_dt$Date[1])), frequency = 12)
plot(oat_dt_tsa)

# ACF - with lag.max = 100/default
acf(oat_dt_tsa,main = "ACF for Oats Production in BC at Different Lag", lag.max = 100)
acf(oat_dt_tsa, main = "ACF for Oats Production in BC at Different Lag")

# PACF - with lag.max = 100/default
pacf(oat_dt_tsa,main = "PACF for Oats Production in BC at Different Lag", lag.max = 100)
pacf(oat_dt_tsa,main = "PACF for Oats Production in BC at Different Lag")

# Compute EACF results to determine possible orders of ARMA process
eacf(oat_dt_tsa)

# Use ADF test to check for non-stationarity
ndiffs(oat_dt_tsa, alpha = 0.05, test = "adf")
tseries::adf.test(oat_dt_tsa,k = 50)

# First-differencing
plot(oat_dt_tsa)
oat_diff1 <- diff(oat_dt_tsa)
plot(oat_diff1, main = "Time Series Plot of First Difference")
acf(oat_diff1, main = "ACF of First Difference")
pacf(oat_diff1, main = "PACF of First Difference")
eacf(oat_diff1)

# Select the most appropriate ARMA model using auto.arima() command
print(auto.arima(oat_diff1))
fit <- Arima(oat_dt_tsa,order=c(3,1,1), seasonal = c(1,0,1),include.constant=TRUE,method='ML')
plot(residuals(fit), main="Residual plot from ARIMA(3, 1, 1)*ARIMA(1, 0, 1) model")
hist(rstandard(fit),xlab="Standardised residuals",main="Histogram")
qqnorm(rstandard(fit),main="QQplot");qqline(rstandard(fit))
acf(residuals(fit),main="ACF for ARIMA(3, 1, 1)*ARIMA(1, 0, 1) standardized residuals")


arima_order <- c(3, 1, 1)
sarima_order <- c(1, 0, 1)

arima_model <- Arima(oat_dt_tsa, order = arima_order, seasonal = list(order = sarima_order))

forecast_result <- forecast(arima_model, h = 12, level = 90)
forecast_result

plot(forecast_result, main = "Oats Production Forecast", xlab = "Time", ylab = "Tonnes")

forecast_result <- forecast(arima_model, h = 12, level = 50)
forecast_result

plot(forecast_result, main = "Oats Production Forecast", xlab = "Time", ylab = "Tonnes")