# Prediction of Duration Online for Driver
Prediction of duration online for drivers based on the historical data and driver details.  

### Software Requirements 
R version 3.4.4  
R-studio

### Environment Variables
Environment variable "MyGitRepo" should be created or appropriate care should be taken while placing the unzipped folder.  

### Packages Required Within R
vPackageList = c('rmarkdown', 'data.table', 'ggplot2', 'zoo', 'psych', 'aTSA', 
                 'glmnet', 'rpart', 'rattle', 'randomForest')

lapply(vPackageList, install.packages, character.only = T)

### Folder Structure
The main zipped folder contains following files and folders:    
- READMe.md  
- .gitignore  
- Go-JekRegression.Rmd  
- Go-Jek.Rproj  
- .git  
- PredictedOutput.csv  
- Go-JekRegression.html  

### Folder To Be Added
The data folder is not attached with zip file as it is big.  
Folder named "DS TakeHome Assignment" should be added to unzipped Go-Jek folder.  

### Running Code
Go-JekRegression.Rmd can be used to run the code. Latest output is provided with zipped folder.  