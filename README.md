Time Series Analysis Project

This project focuses on conducting a comprehensive time series analysis of monthly
oat producer delivery data in British Columbia, ranging from January 1982 to December
2022. The primary goal is to select and fit an accurate forecasting model, utilizing ARIMA
methodology, to predict future oat production in the province.
Our data was sourced from Statistics Canada, covering monthly producer deliveries of
major grains, with an emphasis on the production of oats. The dataset excludes observations
outside the specified time frame (i.e., observations prior to 1982 and observations after 2022)
to ensure accurate handling of potential seasonality in the analysis.
To ensure the proper application of an ARIMA model with seasonal components, our
model fulfills the following key assumptions:
1. Weak stationarity - the time series exhibits constant mean and variance over time.
2. Independent observations – the autocorrelation values of the observations do not
exhibit observable patterns that comprise our inferences.
3. Homoscedasticity – the variances of residuals of our fitted seasonal model remain
constant over time.
4. Normality of residuals – the residuals follow approximately a normal distribution.
5. Large sample size – our fitted seasonal ARIMA model used a sufficient number of
data points (monthly data collected for over four decades) to produce reliable
parameter estimates.
The methods employed to select and fit a seasonal ARIMA model for forecasting
future oats production in BC begin with visualization of the time series data, allowing for the
identification of trends and seasonality. Then we proceeded with caution to determine the
proper orders of the seasonal ARIMA model with the aid of ACF, PACF, and EACF plots
after differencing the model to ensure that we meet the stationarity assumption. Subsequently,
we conducted parameter estimation with the help of statistical software to optimize likelihood
functions. We also conducted the diagnostic analysis to validate the chosen SARIMA model.
Finally, we made predictions with two different
