# Oats Production Forecasting in BC

## Overview

This project analyzes and forecasts the production of oats in British Columbia using time series analysis techniques. The dataset contains historical oats production data from 1982 to 2022. The project utilizes R libraries for data manipulation, visualization, and forecasting.

## Methodology

### 1 Data Preprocessing:

The dataset is imported and filtered to include data from December 1981 to December 2022.

The columns are renamed for better readability (REF_DATE → Date, VALUE → Oats).

### 2 Visualization:

A time series plot is generated using ggplot2, including a trend line.

### 3 Time Series Analysis:

The oats production data is converted into a time series (ts) object with a monthly frequency.

The Autocorrelation Function (ACF) and Partial Autocorrelation Function (PACF) are plotted to examine dependencies at different lags.

The Extended Autocorrelation Function (EACF) is computed to determine potential ARMA model orders.

The Augmented Dickey-Fuller (ADF) test is performed to check for stationarity.

### 4 Model Selection & Fitting:

First differencing is applied if the data is non-stationary.

The best ARIMA model is selected using auto.arima().

A manual ARIMA(3,1,1) * Seasonal ARIMA(1,0,1) model is fitted using Maximum Likelihood Estimation (MLE).

Model residuals are analyzed via plots, histograms, and QQ plots to assess model adequacy.

### 5 Forecasting:

A 12-month forecast is generated with confidence levels of 90% and 50%.

The forecast results are visualized.

## Required Libraries

``` R
library(TSA)
library(stats)
library(tidyverse)
library(readxl)
library(forecast)
library(tseries)
library(lubridate)
```
