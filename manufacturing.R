> # Install and load necessary packages
> install.packages(c("tidyverse", "caret", "pROC", "car", "rpart"))
Error in install.packages : Updating loaded packages
> library(tidyverse)
── Attaching core tidyverse packages ── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ──────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
Warning message:
package ‘tidyverse’ was built under R version 4.4.2 
> library(caret)
Loading required package: lattice

Attaching package: ‘caret’

The following object is masked from ‘package:purrr’:

    lift

Warning message:
package ‘caret’ was built under R version 4.4.2 
> library(pROC)
Type 'citation("pROC")' for a citation.

Attaching package: ‘pROC’

The following objects are masked from ‘package:stats’:

    cov, smooth, var

Warning message:
package ‘pROC’ was built under R version 4.4.2 
> library(car)
Loading required package: carData

Attaching package: ‘car’

The following object is masked from ‘package:dplyr’:

    recode

The following object is masked from ‘package:purrr’:

    some

Warning messages:
1: package ‘car’ was built under R version 4.4.2 
2: package ‘carData’ was built under R version 4.4.2 
> library(rpart)  # For Decision Trees
> 
> # Set working directory
> setwd("C:/Users/brady/Downloads/")
> 
> # Load the dataset
> data <- read.csv("manufact_data.csv")
> 
> # Manually identify and rename columns for clarity
> colnames(data) <- c("UDI", "Product_ID", "Type", "Air_temperature_K", "Process_temperature_K", 
+                     "Rotational_speed_rpm", "Torque_Nm", "Tool_wear_min", "Machine_failure", 
+                     "TWF", "HDF", "PWF", "OSF", "RNF")
> 
> # Verify the new column names
> print(colnames(data))
 [1] "UDI"                   "Product_ID"           
 [3] "Type"                  "Air_temperature_K"    
 [5] "Process_temperature_K" "Rotational_speed_rpm" 
 [7] "Torque_Nm"             "Tool_wear_min"        
 [9] "Machine_failure"       "TWF"                  
[11] "HDF"                   "PWF"                  
[13] "OSF"                   "RNF"                  
> 
> # Convert appropriate columns to factors
> data$Product_ID <- as.factor(data$Product_ID)
> data$Type <- as.factor(data$Type)
> data$Machine_failure <- as.factor(data$Machine_failure)
> data$TWF <- as.factor(data$TWF)
> data$HDF <- as.factor(data$HDF)
> data$PWF <- as.factor(data$PWF)
> data$OSF <- as.factor(data$OSF)
> data$RNF <- as.factor(data$RNF)
> 
> # Check for missing values and remove rows with missing values
> data <- na.omit(data)
> 
> # Define correct numerical column names from the dataset
> num_cols <- c("Air_temperature_K", "Process_temperature_K", "Rotational_speed_rpm", "Torque_Nm", "Tool_wear_min")
> 
> # Normalize numerical features
> data[num_cols] <- scale(data[num_cols])
> 
> # Handle NaN and Inf values column by column
> for (col in num_cols) {
+     data <- data[is.finite(data[[col]]), ]
+ }
> 
> # Remove rows with NA values again
> data <- na.omit(data)
> 
> # One-hot encode categorical variables
> dmy <- dummyVars(" ~ .", data = data)
> data_transformed <- data.frame(predict(dmy, newdata = data))

Restarting R session...

> install.packages(c("tidyverse", "caret", "pROC", "car", "rpart"))
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing packages into ‘C:/Users/brady/AppData/Local/R/win-library/4.4’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/tidyverse_2.0.0.zip'
Content type 'application/zip' length 431700 bytes (421 KB)
downloaded 421 KB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/caret_7.0-1.zip'
Content type 'application/zip' length 3602978 bytes (3.4 MB)
downloaded 3.4 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/pROC_1.18.5.zip'
Content type 'application/zip' length 1168538 bytes (1.1 MB)
downloaded 1.1 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/car_3.1-3.zip'
Content type 'application/zip' length 1541464 bytes (1.5 MB)
downloaded 1.5 MB

trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/rpart_4.1.24.zip'
Content type 'application/zip' length 716793 bytes (699 KB)
downloaded 699 KB

package ‘tidyverse’ successfully unpacked and MD5 sums checked
package ‘caret’ successfully unpacked and MD5 sums checked
package ‘pROC’ successfully unpacked and MD5 sums checked
package ‘car’ successfully unpacked and MD5 sums checked
package ‘rpart’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\brady\AppData\Local\Temp\RtmpKwdFGy\downloaded_packages
> # Load necessary packages
> library(tidyverse)
── Attaching core tidyverse packages ── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ──────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
Warning message:
package ‘tidyverse’ was built under R version 4.4.2 
> library(caret)
Loading required package: lattice

Attaching package: ‘caret’

The following object is masked from ‘package:purrr’:

    lift

Warning message:
package ‘caret’ was built under R version 4.4.2 
> library(pROC)
Type 'citation("pROC")' for a citation.

Attaching package: ‘pROC’

The following objects are masked from ‘package:stats’:

    cov, smooth, var

Warning message:
package ‘pROC’ was built under R version 4.4.2 
> library(car)
Loading required package: carData

Attaching package: ‘car’

The following object is masked from ‘package:dplyr’:

    recode

The following object is masked from ‘package:purrr’:

    some

Warning messages:
1: package ‘car’ was built under R version 4.4.2 
2: package ‘carData’ was built under R version 4.4.2 
> library(rpart)  # For Decision Trees
Warning message:
package ‘rpart’ was built under R version 4.4.2 
> 
> # Set working directory
> setwd("C:/Users/brady/Downloads/")
> 
> # Load the dataset
> data <- read.csv("manufact_data.csv")
> 
> # Manually identify and rename columns for clarity
> colnames(data) <- c("UDI", "Product_ID", "Type", "Air_temperature_K", "Process_temperature_K", 
+                     "Rotational_speed_rpm", "Torque_Nm", "Tool_wear_min", "Machine_failure", 
+                     "TWF", "HDF", "PWF", "OSF", "RNF")
> 
> # Verify the new column names
> print(colnames(data))
 [1] "UDI"                   "Product_ID"           
 [3] "Type"                  "Air_temperature_K"    
 [5] "Process_temperature_K" "Rotational_speed_rpm" 
 [7] "Torque_Nm"             "Tool_wear_min"        
 [9] "Machine_failure"       "TWF"                  
[11] "HDF"                   "PWF"                  
[13] "OSF"                   "RNF"                  
> 
> # Convert appropriate columns to factors
> data$Product_ID <- as.factor(data$Product_ID)
> data$Type <- as.factor(data$Type)
> data$Machine_failure <- as.factor(data$Machine_failure)
> data$TWF <- as.factor(data$TWF)
> data$HDF <- as.factor(data$HDF)
> data$PWF <- as.factor(data$PWF)
> data$OSF <- as.factor(data$OSF)
> data$RNF <- as.factor(data$RNF)
> 
> # Check for missing values and remove rows with missing values
> data <- na.omit(data)
> 
> # Define correct numerical column names from the dataset
> num_cols <- c("Air_temperature_K", "Process_temperature_K", "Rotational_speed_rpm", "Torque_Nm", "Tool_wear_min")
> 
> # Normalize numerical features
> data[num_cols] <- scale(data[num_cols])
> 
> # Handle NaN and Inf values column by column
> for (col in num_cols) {
+     data <- data[is.finite(data[[col]]), ]
+ }
> 
> # Remove rows with NA values again
> data <- na.omit(data)
> 
> # One-hot encode categorical variables
> dmy <- dummyVars(" ~ .", data = data)
> data_transformed <- data.frame(predict(dmy, newdata = data))
> 
> # Add the target variable back to the transformed data
> data_transformed$Machine_failure <- data$Machine_failure
> 
> # Handle class imbalance using SMOTE from smotefamily
> set.seed(123)
> smote_data <- SMOTE(X = data_transformed[, -which(names(data_transformed) == "Machine_failure")], 
+                     target = data_transformed$Machine_failure, 
+                     K = 5, 
+                     dup_size = 0)
Error in SMOTE(X = data_transformed[, -which(names(data_transformed) ==  : 
  could not find function "SMOTE"
> # Install and load necessary packages
> install.packages("smotefamily")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing package into ‘C:/Users/brady/AppData/Local/R/win-library/4.4’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.4/smotefamily_1.4.0.zip'
Content type 'application/zip' length 84370 bytes (82 KB)
downloaded 82 KB

package ‘smotefamily’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\brady\AppData\Local\Temp\RtmpKwdFGy\downloaded_packages
> library(tidyverse)
> library(caret)
> library(pROC)
> library(car)
> library(smotefamily)  # For SMOTE
Warning message:
package ‘smotefamily’ was built under R version 4.4.2 
> 
> # Set working directory
> setwd("C:/Users/brady/Downloads/")
> 
> # Load the dataset
> data <- read.csv("manufact_data.csv")
> 
> # Manually identify and rename columns for clarity
> colnames(data) <- c("UDI", "Product_ID", "Type", "Air_temperature_K", "Process_temperature_K", 
+                     "Rotational_speed_rpm", "Torque_Nm", "Tool_wear_min", "Machine_failure", 
+                     "TWF", "HDF", "PWF", "OSF", "RNF")
> 
> # Verify the new column names
> print(colnames(data))
 [1] "UDI"                   "Product_ID"           
 [3] "Type"                  "Air_temperature_K"    
 [5] "Process_temperature_K" "Rotational_speed_rpm" 
 [7] "Torque_Nm"             "Tool_wear_min"        
 [9] "Machine_failure"       "TWF"                  
[11] "HDF"                   "PWF"                  
[13] "OSF"                   "RNF"                  
> 
> # Convert appropriate columns to factors
> data$Product_ID <- as.factor(data$Product_ID)
> data$Type <- as.factor(data$Type)
> data$Machine_failure <- as.factor(data$Machine_failure)
> data$TWF <- as.factor(data$TWF)
> data$HDF <- as.factor(data$HDF)
> data$PWF <- as.factor(data$PWF)
> data$OSF <- as.factor(data$OSF)
> data$RNF <- as.factor(data$RNF)
> 
> # Check for missing values and remove rows with missing values
> data <- na.omit(data)
> 
> # Define correct numerical column names from the dataset
> num_cols <- c("Air_temperature_K", "Process_temperature_K", "Rotational_speed_rpm", "Torque_Nm", "Tool_wear_min")
> 
> # Normalize numerical features
> data[num_cols] <- scale(data[num_cols])
> 
> # Handle NaN and Inf values column by column
> for (col in num_cols) {
+     data <- data[is.finite(data[[col]]), ]
+ }
> 
> # Remove rows with NA values again
> data <- na.omit(data)
> 
> # One-hot encode categorical variables
> dmy <- dummyVars(" ~ .", data = data)
> data_transformed <- data.frame(predict(dmy, newdata = data))
> 
> # Add the target variable back to the transformed data
> data_transformed$Machine_failure <- data$Machine_failure
> 
> # Ensure the smotefamily package is installed and loaded correctly
> if (!requireNamespace("smotefamily", quietly = TRUE)) {
+     install.packages("smotefamily")
+ }
> library(smotefamily)
> 
> # Handle class imbalance using SMOTE from smotefamily
> set.seed(123)
> smote_data <- SMOTE(X = data_transformed[, -which(names(data_transformed) == "Machine_failure")], 
+                     target = data_transformed$Machine_failure, 
+                     K = 5, 
+                     dup_size = 0)
> data_transformed <- smote_data$data
> data_transformed$Machine_failure <- as.factor(data_transformed$class)
> data_transformed$class <- NULL
> 
> # Split the data into training and testing sets
> set.seed(123)
> trainIndex <- createDataPartition(data_transformed$Machine_failure, p = .8, 
+                                   list = FALSE, 
+                                   times = 1)
> trainData <- data_transformed[ trainIndex,]
> testData  <- data_transformed[-trainIndex,]
> 
> # Sample 2000 data points for training
> trainData_sample <- trainData[sample(nrow(trainData), 2000), ]
> 
> # Train the Decision Tree model with sampled data
> tree_model <- rpart(Machine_failure ~ ., data = trainData_sample, method = "class")
> 
> # Predict on the test set
> tree_predictions <- predict(tree_model, testData, type = "class")
> 
> # Evaluate the model
> confusionMatrix(tree_predictions, testData$Machine_failure)
Confusion Matrix and Statistics

          Reference
Prediction    0    1
         0 1932    0
         1    0 1898
                                    
               Accuracy : 1         
                 95% CI : (0.999, 1)
    No Information Rate : 0.5044    
    P-Value [Acc > NIR] : < 2.2e-16 
                                    
                  Kappa : 1         
                                    
 Mcnemar's Test P-Value : NA        
                                    
            Sensitivity : 1.0000    
            Specificity : 1.0000    
         Pos Pred Value : 1.0000    
         Neg Pred Value : 1.0000    
             Prevalence : 0.5044    
         Detection Rate : 0.5044    
   Detection Prevalence : 0.5044    
      Balanced Accuracy : 1.0000    
                                    
       'Positive' Class : 0         
                                    
> roc_curve <- roc(response = testData$Machine_failure, predictor = as.numeric(tree_predictions))
Setting levels: control = 0, case = 1
Setting direction: controls < cases
> auc(roc_curve)
Area under the curve: 1
> plot(roc_curve, col = "blue", main = "ROC Curve")
> 
> # Interpretation of results
> summary(tree_model)
Call:
rpart(formula = Machine_failure ~ ., data = trainData_sample, 
    method = "class")
  n= 2000 

    CP nsplit rel error xerror       xstd
1 1.00      0         1      1 0.02256284
2 0.01      1         0      0 0.00000000

Variable importance
   Machine_failure.0    Machine_failure.1 
                  26                   26 
           Torque_Nm Rotational_speed_rpm 
                  13                   12 
               OSF.0                OSF.1 
                  12                   12 

Node number 1: 2000 observations,    complexity param=1
  predicted class=0  expected loss=0.4955  P(node) =1
    class counts:  1009   991
   probabilities: 0.504 0.495 
  left son=2 (1009 obs) right son=3 (991 obs)
  Primary splits:
      Machine_failure.0 < 0.5          to the right, improve=999.9190, (0 missing)
      Machine_failure.1 < 0.5          to the left,  improve=999.9190, (0 missing)
      OSF.0             < 0.9991192    to the right, improve=301.5314, (0 missing)
      OSF.1             < 0.0008807789 to the left,  improve=301.5314, (0 missing)
      PWF.0             < 0.9999673    to the right, improve=287.1511, (0 missing)
  Surrogate splits:
      Machine_failure.1    < 0.5          to the left,  agree=1.000, adj=1.000, (0 split)
      Torque_Nm            < 0.7749483    to the left,  agree=0.756, adj=0.508, (0 split)
      Rotational_speed_rpm < -0.7911074   to the right, agree=0.741, adj=0.477, (0 split)
      OSF.0                < 0.9991192    to the right, agree=0.733, adj=0.461, (0 split)
      OSF.1                < 0.0008807789 to the left,  agree=0.733, adj=0.461, (0 split)

Node number 2: 1009 observations
  predicted class=0  expected loss=0  P(node) =0.5045
    class counts:  1009     0
   probabilities: 1.000 0.000 

Node number 3: 991 observations
  predicted class=1  expected loss=0  P(node) =0.4955
    class counts:     0   991
   probabilities: 0.000 1.000 
