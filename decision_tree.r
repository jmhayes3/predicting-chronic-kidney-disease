# build decision tree
source("preprocess.r")

library(tree)
data.train.tree = tree(class ~ ., data=data.train)
plot(data.train.tree)
text(data.train.tree, pretty=0)
tree.pred = predict(data.train.tree, newdata=data.test, type="class")
table(tree.pred, data.test$class)
