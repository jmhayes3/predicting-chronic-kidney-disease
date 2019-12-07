setwd(choose.dir())

ckd <- read.csv(file="chronic_kidney_disease_dataset/chronic_kidney_disease.csv", 
                header=TRUE, sep= ",", dec = ".", 
                na.strings = "?", strip.white = T)

ckd$sg <- as.factor(ckd$sg)
ckd$al <- as.factor(ckd$al)
ckd$su <- as.factor(ckd$su)

# dataset with dropped columns
ckd <- subset(ckd, select = -c(sg, al, su, rbc, pc, 
                               bgr, sod, pot, hemo, 
                               pcv, wbcc, rbcc))

#remove rows with missing values
ckd <- na.omit(ckd)

# decision tree ################
library(tree)
tree.ckd <- tree(class ~ ., data=ckd)
summary(tree.ckd)
tree.ckd

# plot tree
plot(tree.ckd)
text(tree.ckd, pretty=0)

# train/test
set.seed(1)
train = sample(1:nrow(ckd), 355*.8)
test = ckd[-train,]
tree.ckd <- tree(class ~ ., data=ckd, subset = train)

tree.pred <- predict(tree.ckd, test, type="class")
table(tree.pred, ckd$class[-train])
(44+25)/71

# pruning
set.seed(1)
cv.ckd = cv.tree(tree.ckd, FUN = prune.misclass)
cv.ckd

par(mfrow=c(1,2))
plot(cv.ckd$size, cv.ckd$dev, type="b")
plot(cv.ckd$k, cv.ckd$dev, type="b")
par(mfrow=c(1,1))

# prune using smallest size
prune.ckd = prune.misclass(tree.ckd, best=4)
plot(prune.ckd)
text(prune.ckd, pretty=0)

# use predict to check performance
tree.pred = predict(prune.ckd, test, type="class")
table(tree.pred, ckd$class[-train])
1-(41+26)/71

(0.014+0.056+0.042+0.042+0.098+0.056+0.042+0.07+0.028+0.084)/10
