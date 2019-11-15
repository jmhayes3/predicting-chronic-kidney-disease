# Predicting Chronic Kidney Disease With Machine Learning

## Goal
Our kidneys perform an important function to help filter blood and pass waste as urine. Chronic kidney disease, also called chronic kidney failure, describes the gradual loss of this function. At advanced stages, dangerous levels of fluid, electrolytes and wastes can build up in the body. Once this happens, patients must go through dialysis or consider a transplant.
Our goal in this project is to see if we can predict if a patient will have chronic kidney disease or not using 24 predictors. If we are able to find variables with a strong influence on kidney failure, we may be able to detect and help patients at risk to prevent it.

## Dataset Description

http://archive.ics.uci.edu/ml/datasets/Chronic_Kidney_Disease

The source of the dataset is Dr. P .Soundarapandian M.D., D.M (Senior Consultant Nephrologist), Apollo Hospitals, Managiri, Madurai Main Road, Karaikudi, Tamilnadu, India. The dataset was found in the UCI Machine Learning Repository.

This dataset has 400 observations and 25 variables. (250 ckd, 150 notckd)
1. age: age in years
2. bp: Blood pressure in mm of Hg.
3. sg: Specific Gravity
4. al: Albumin - (0,1,2,3,4,5)
5. su: Sugar - (0,1,2,3,4,5)
6. rbc: Red Blood Cells - (normal,abnormal)
7. pc: Pus Cell - (normal,abnormal)
8. pcc: Pus Cell clumps - (present,notpresent)
9. ba: Bacteria - (present,notpresent)
10. bgr: Blood Glucose Random(numerical) in mgs/dl
11. bu: Blood Urea in mgs/dl
12. sc: Serum Creatinine in mgs/dl
13. sod: Sodium in mEq/L
14. pot: Potassium in mEq/L
15. hemo: Hemoglobin in gms
16. pcv: Packed Cell Volume
17. wc: White Blood Cell Count in cells/cumm
18. rc: Red Blood Cell Count in millions/cmm
19. htn: Hypertension - (yes,no)
20. dm: Diabetes Mellitus - (yes,no)
21. cad: Coronary Artery Disease - (yes,no)
22. appt: Appetite - (good,poor)
23. pe: Pedal Edema - (yes,no)
24. ane: Anemia - (yes,no)
25. class: Class - (ckd,notckd)

## Proposed Model Types
- Logistic Regression
- Decision Tree
- Neural Network

## Preprocessing
- Encode nominal attributes.
- Handle missing values.

