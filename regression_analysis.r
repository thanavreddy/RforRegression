
data(mtcars)
data(iris)

print("First few rows of mtcars:")
head(mtcars)

print("Structure of mtcars:")
str(mtcars)

# Simple Linear Regression: Predict mpg using weight (wt)
model_mtcars_simple <- lm(mpg ~ wt, data = mtcars)
print("Simple Linear Regression: mpg ~ wt")
summary(model_mtcars_simple)

# Visualization: mpg vs wt with regression line
plot(mtcars$wt, mtcars$mpg,
     main = "MPG vs Weight (Simple Linear Regression)",
     xlab = "Weight",
     ylab = "Miles Per Gallon",
     col = "darkgray", pch = 19)
abline(model_mtcars_simple, col = "blue", lwd = 2)

# Multiple Linear Regression: mpg ~ wt + hp + qsec
model_mtcars_multi <- lm(mpg ~ wt + hp + qsec, data = mtcars)
print("Multiple Linear Regression: mpg ~ wt + hp + qsec")
summary(model_mtcars_multi)


#  Regression on iris Dataset


# Explore the iris dataset
print("First few rows of iris:")
head(iris)

print("Structure of iris:")
str(iris)

# Linear Regression: Predict Petal.Length using other features
model_iris <- lm(Petal.Length ~ Sepal.Length + Sepal.Width + Petal.Width, data = iris)
print("Linear Regression: Petal.Length ~ Sepal.Length + Sepal.Width + Petal.Width")
summary(model_iris)

# Diagnostic Plots for the iris regression model
par(mfrow = c(2, 2))  # Set up 2x2 plotting area
plot(model_iris)

# Reset plotting area
par(mfrow = c(1, 1))


model_mtcars_full <- lm(mpg ~ ., data = mtcars)
print("Full Model with all predictors for mpg:")
summary(model_mtcars_full)

# Optional: Stepwise regression (forward & backward)
step_model <- step(model_mtcars_full, direction = "both")
print("Stepwise Regression Summary:")
summary(step_model)
