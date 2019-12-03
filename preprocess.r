library(readr)

# import dataset, coercing attributes to the appriopriate type
chronic_kidney_disease <- read_csv("projects/data_science_project/chronic_kidney_disease_dataset/chronic_kidney_disease.csv", 
col_types = cols(age = col_number(), 
    al = col_factor(levels = c("0", "1", 
        "2", "3", "4", "5")), ane = col_factor(levels = c("yes", 
        "no")), appet = col_factor(levels = c("good", 
        "poor")), ba = col_factor(levels = c("present", 
        "notpresent")), bgr = col_number(), 
    bp = col_number(), bu = col_number(), 
    cad = col_factor(levels = c("yes", 
        "no")), class = col_factor(levels = c("ckd", 
        "notckd")), dm = col_factor(levels = c("yes", 
        "no")), hemo = col_number(), 
    htn = col_factor(levels = c("yes", 
        "no")), pc = col_factor(levels = c("normal", 
        "abnormal")), pcc = col_factor(levels = c("present", 
        "notpresent")), pcv = col_number(), 
    pe = col_factor(levels = c("yes", 
        "no")), pot = col_number(), rbc = col_factor(levels = c("normal", 
        "abnormal")), rbcc = col_number(), 
    sc = col_number(), sg = col_factor(levels = c("1.005", 
        "1.010", "1.015", "1.020", "1.025")), 
    sod = col_number(), su = col_factor(levels = c("0", 
        "1", "2", "3", "4", "5")), wbcc = col_number()))

# drop attributes with numerous missing values
chronic_kidney_disease <- chronic_kidney_disease[1:nrow(chronic_kidney_disease), -c(3, 4, 5, 6, 7, 10, 13, 14, 15, 16, 17, 18)]

# use only rows containing no missing values
data <- chronic_kidney_disease[complete.cases(chronic_kidney_disease),]

# take random sample of 50% of observations and split into training and testing sets
RNGkind(sample.kind = "Rounding")
set.seed(1)
train <- sample(1:nrow(data), nrow(data)/2)
data.test <- data[-train,]
data.train <- data[train,]
