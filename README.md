# LAKE_HURON
This project is based on time series modelling and forecasting of lakehuron water levels with a focus on model selection diagnostic and  forecast evaluation in R

# OVERVIEW

This project analyze the lake huron annual water level dataset using ARIMA time series models in R.Model selection is based on AIC ,residuals diagnostic and train test forecasting performance .Results demonstrate that a simple ARIMA (0,1,0)
random walked modle provides robust and reliable forecast.

# LAKE HURON 

Lake Huron is the second-largest of North America's Great Lakes, bordering Michigan (USA) and Ontario (Canada), known for its extensive shoreline (including Georgian Bay and Manitoulin Island) and connections via the Straits of Mackinac to Lake Michigan and the St. Marys River to Lake Superior, serving as a crucial part of the Great Lakes waterway system for shipping, recreation, and ecosystems.

# PROCEDURE

1.DATA SELECTION 

  The Lake HUron annual water level dataset (1875-1972)available in base R ,was selected for time series analysis
  
2.EXPLORATORY DATA ANALYSIS

  The time seris was visualized to identify overall trends and structural pattern .A downward trend was observed with no seasonal component.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/lake%20huron%20water%20level.png)

  
3.STATIONARY CHECK

  The augumented dickey fuller test was applied to assess stationarity .The series was found to be non stationary.
  
4.DIFFERENCING:

  First order differencing was applied to remove the trend and acheive stationary.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/differnce%20lake%20huron.png)
  
5.MODEL IDENTIFICATION

  Autocorrelation(ACF) and Partial autocorrelation(PACF)plots of the differenced series were examinee to identify suitable time series model.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/acf%2Cpacf.png)
  
6.MODEL ESTIMATION 

  multiple ARIMA models including ARIMA(0,1,0) AND ARIMA(1,1,2),were fitted using R.the auto.arima()function was also used for automated model selection.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/fitted%20vs%20actual.png)
  
7.MODEL EVALUATION

  Models were compared using AIC Ljungbox residuals diagnostic and train test forecast error.
  
  arima(1,1,2):
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/residuals%20arima(1%2C1%2C2).png)
  
  arima(0,1,0):
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/RESIDUALSARIMA(0%2C1%2C0).png)
  
8.MODEL SELECTION

 Arima(1,1,2) is selected as the best model as it produce lower aic and test rmse and sse of (38.78).
  
9.FORECASTING

  The selected model was used to generate future forecast of lake huron water levels along with confidence interval.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/arima(1%2C1%2C2)forecast.png)
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/forecast%20vs%20test.png)
  

# CONCLUSION
The Lake Huron waterlevel sseries was found to be non stationary so first order differencing was performed .The difference series became
stationary according to the adf test .Based on auto arima function was selected with an AIC of 161.53 and test sse of 43.10
whereas in this project arima(1,1,2) is standout to be the best model as it acheive lower test sse of 38.78suggest better forecasting performance on the chosen test data.
