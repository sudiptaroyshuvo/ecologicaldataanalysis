model <- lm(Petal.Width ~ Petal.Length,
            data = iris)
model
model
summary(model)
coef(model)
fitted(model)
predict(model, interval = "confidence")
predict(model, interval = "prediction")
resid(model)

petal_coef <- coef(model)

ggplot(iris) +
  geom_point(aes(x = Petal.Length,
                 y = Petal.Width)) +
  geom_abline(intercept = petal_coef[1],
              slope = petal_coef[2])

library(modelr)

petal_model <- lm(Petal.Width ~ Petal.Length,
                  data = iris)
iris2 <- add_predictions(data = iris,
                         model = petal_model)

ggplot(iris2) +
  geom_point(aes(x = Petal.Length,
                 y = pred)) +
  geom_line(aes(x= Petal.Length,
                y= pred)
            )
#adding residuals

#inspecting model residuals
petal_resid <- resid(petal_model)
iris2 <- add_residuals(iris2, petal_model)
ggplot(iris2) +
  geom_density(aes(x = resid))


ggplot(iris2) +
  geom_point(aes(x = Petal.Length,
                 y = resid))

#action 1
ggplot(glb,aes(x= Jan,
               y= Apr))+
  geom_point() +
  geom_smooth(method ="lm")
glbm<- lm(Apr~ Jan, data = glb)
summary(glbm)

#predicting new values
glb_model <- lm(Apr ~ Jan, data = glb)
predict(glb_model)
which(glb$Jan == -0.22)
predict(glb_model, newdata = list(Jan = -0.22))

#predict more in one go
predict(glb_model, 
        newdata = list(Jan = seq(-0.5, 1.0,
                                 by = 0.01)))
#confidence interval
summary(glb_model)

#confidence intervals
confint(glb_model,"Jan", level = 0.95)

#associating our prediction to this uncertainty
predict(glb_model, newdata = list(Jan = -0.22),
        interval = "prediction", levels = 0.95)

#increasing certainty
predict(glb_model, newdata = list(Jan = -0.22),
        interval = "prediction", levels = 0.999)

#Action 2
iris
irism<- lm(Petal.Length ~ Sepal.Length, data = iris)
predict(irism, newdata = list(Sepal.Length = 7.5),
        interval = "prediction", levels = 0.95)
