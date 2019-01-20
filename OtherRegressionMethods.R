# Data Preperation --------------------------------------------------------

Predictors <- data.matrix(dtDayDuration[, .(is_weekend, is_male, age_bin,
                                            at_least_one_kid)])

Response <- data.matrix(dtDayDuration[, duration_online_hrs])


# Lasso Regression --------------------------------------------------------

lm.fit6 <- cv.glmnet(x = Predictors,
                     y = Response,
                     family = "gaussian",
                     alpha = 1)

dtDayDuration[, predicted := predict(lm.fit6, Predictors)]

dtDayDuration[, residuals := duration_online_hrs - predicted]

summary(dtDayDuration$residuals)

hist(dtDayDuration$residuals, 
     breaks = 100, 
     xlab = "Residuals",
     main = "Histogram of Residual for Lasso Model")

# Ridge Regression --------------------------------------------------------

lm.fit7 <- cv.glmnet(x = Predictors,
                     y = Response,
                     family = "gaussian",
                     alpha = 0)

dtDayDuration[, predicted := predict(lm.fit7, Predictors)]

dtDayDuration[, residuals := duration_online_hrs - predicted]

summary(dtDayDuration$residuals)

hist(dtDayDuration$residuals, 
     breaks = 100, 
     xlab = "Residuals",
     main = "Histogram of Residual for Ridge Regression Model")
