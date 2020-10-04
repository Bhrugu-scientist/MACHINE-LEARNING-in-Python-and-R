df = read.csv(file.choose())

head(df)

tail(df)

summary(df)

par(bg = 'grey')
plot(df, col = 'red')

library('caTools')

set.seed(123)
split = sample.split(df$Salary, SplitRatio =  2/3)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == F)

## Fitting Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

summary(regressor)

## Predicting the test results

predictions = predict(regressor, newdata = test_set)
predictions
head(predictions)


library('ggplot2')
install.packages("ggplot2")
library('ggplot2')


ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')


library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')
