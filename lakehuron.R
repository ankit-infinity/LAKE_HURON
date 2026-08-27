data("LakeHuron")

head(LakeHuron)

summary(LakeHuron)

class(LakeHuron)

print(dim(data.frame(LakeHuron)))

length(LakeHuron)

plot(LakeHuron,main='lakehuron water level',ylab='feet',col="blue",lwd= 2)

lake_train=window(LakeHuron,start=1875,end=1950)
lake_test=window(LakeHuron,start=1951,end=1972)

# stationary checking

library(tseries)
adf_test=adf.test(lake_train)
print(adf_test)

#making the data stationary
diff_lake=diff(lake_train)
plot(diff_lake,main="difference lake huron series",ylab='difference water level',col='red')

#removing trend 
adf_diff_test=adf.test(diff_lake)
adf_diff_test

#acf and pacf plot

par(mfrow=c(1,2))
acf(diff_lake,main="acf")
pacf(diff_lake,main="pacf")
par(mfrow=c(1,1))


# arima model manual parameter selection using acf pacf
# arima(1,1,2)
# library(forecast)

manual=arima(lake_train,order =c(1,1,2))
print(manual)

#arima(1,1,1)
manual_1=arima(lake_train,order =c(1,1,1))
print(manual_1)

#arima(1,1,0)
manual_2=arima(lake_train,order =c(1,1,0))
print(manual_2)

#using autoarima
library(forecast)
model=auto.arima(lake_train)
print(model)

manual_3=arima(lake_train,order =c(0,1,0))
print(manual_3)

checkresiduals(manual)
checkresiduals(manual_3)

#actual vs fitted plot
plot(fitted(manual),col='red',main='arima(1,1,2) fitted vs actual')
lines(lake_train,col='blue') 
legend("topright",legend = c('fitted','actual'),fill=c('red','blue'))

#forecast plot
forecast_lake=forecast(manual,h=length(lake_test),level=c(85,95))
autoplot(forecast_lake,main='arima(1,1,2)forecast')

plot
plot(lake_test,col='black',main='forecast vs test data in arima(1,1,2)')
lines(forecast_lake$mean,col='red')
legend('bottomright',legend = c('forecast','actual'),fill=c('red','black'))



#model comaparison
accuracy=forecast_lake$mean-lake_test
rmse=sqrt(mean(accuracy^2))
print(rmse)
cat("test error n 22 data points",sum(accuracy^2),'\n')
cat('train_error',manual$sigma2)

forecast_lake_1=forecast(manual_3,h=22,level=c(85,95))
accuracy_1=forecast_lake_1$mean-lake_test
rmse_3=sqrt(mean(accuracy_1^2))
print(rmse_3)
cat("test error n 22 data points",sum(accuracy_1^2),'\n')
cat('train_error',manual_3$sigma2)

forecast_comparison=data.frame(
  
  model=c(
    "arima(0,1,0)",
    
    "arima(1,1,2)"
  ),
  AIC=c(
    
    AIC(manual_3),
    AIC(manual)
    
  ),
  
  RMSE=c(
    
    rmse_3,
    rmse
    
    )
  )

print(forecast_comparison)






