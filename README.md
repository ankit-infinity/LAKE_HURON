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

  First order differencing eas applied to remove the trend and acheive stationary.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/differnce%20lake%20huron.png)
  
5.MODEL IDENTIFICATION

  Autocorrelation(ACF) and Partial autocorrelation(PACF)plots of the differenced series were examinee to identify suitable ARIMA model.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/acf%2Cpacf.png)
  
6.MODEL ESTIMATION 

  multiple ARIMA models including ARIMA(0,1,0) AND ARIMA(1,1,2),were fitted using R.the auto.arima()function was also used for automated model selection.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/FITTED%20ARIMA(0%2C1%2C0).png)
  
7.MODEL EVALUATION

  Models were compared using AIC Ljungbox residuals diagnostic and train test forecast error.
  
  arima(1,1,2):
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/residuals%20arima(1%2C1%2C2).png)
  
  arima(0,1,0):
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/RESIDUALSARIMA(0%2C1%2C0).png)
  
8.MODEL SELECTION

  Although ARIMA(1,1,2)showed a lower training error and AIC both models produced identical test error .the simpler ARIMA(0,1,0)model was selected based on parsimony.
  
9.FORECASTING

  The selected model was used to generate future forecast of lake huron water levels along with confidence interval.
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/FORECAST%20ARIMA(0%2C1%2C0).png)
  
  ![alt text](https://github.com/ankit-infinity/LAKE_HURON/blob/main/image/FORECAST%20VS%20TEST%20ARIMA.png)
  

# CONCLUSION

Although ARIma(1,1,2) model acheived a lower AIC and slightly better in sample fit it did ot improve out of sample forecasting performance compared 
to the simpler ARIMA(0,1,0)random walk model .Both models produced identical test error indicating that the additional parameter in the complex model captured noise rather than meaningful structure .
residuals diagnostic including the ljung box test confirmed that the ARIMA(0,1,0)model adequately captured the temporal dependence in the data ,therefore random walk model was selected as the final module due to its robustness 