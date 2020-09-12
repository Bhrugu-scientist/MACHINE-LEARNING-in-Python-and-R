#--------------------------DATA PREPROCESSING ---------------------------##

df = read.csv(file.choose())

head(df)
str(df)
summary(df)
tail(df)

df$Age = ifelse(is.na(df$Age),
                ave(df$Age, FUN = function(x) mean(x, na.rm = T)),
                df$Age)
head(df)

df$Salary = ifelse(is.na(df$Salary),
                   ave(df$Salary, FUN = function(x) mean(x, na.rm = T)),
                   df$Salary)
head(df)

df$Country = factor(df$Country,
                    levels = c('France', 'Spain', 'Germany'),
                    labels = c(1,2,3))

head(df)

df$Purchased = factor(df$Purchased,
                      levels = c('Yes', 'No'),
                      labels = c(1, 0))
head(df)

##-------SPLITTING THE DATASET INTO TRAINING AND TESTING DATSET--------##

install.packages('caTools')

library('caTools')
updateR()

set.seed(123)
split = sample.split(df$Purchased, SplitRatio = 0.8)
training_set = subset(df,split == TRUE)
test_set = subset(df, split == FALSE)


##---------------FEATURE SCALING----------------------------------------#

training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])

