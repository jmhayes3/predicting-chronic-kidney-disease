library(keras)

source("preprocess.r")

# encode attributes
data$age <- as.numeric(data$age)-1
data$bp <- as.numeric(data$bp)-1
data$bu <- as.numeric(data$bu)-1
data$sc <- as.numeric(data$sc)-1
data$pcc <- to_categorical(as.numeric(data$pcc)-1)
data$ba <- to_categorical(as.numeric(data$ba)-1)
data$htn <- to_categorical(as.numeric(data$htn)-1)
data$dm <- to_categorical(as.numeric(data$dm)-1)
data$cad <- to_categorical(as.numeric(data$cad)-1)
data$appet <- to_categorical(as.numeric(data$appet)-1)
data$pe <- to_categorical(as.numeric(data$pe)-1)
data$ane <- to_categorical(as.numeric(data$ane)-1)
data$class <- to_categorical(as.numeric(data$class)-1)

# split into training/testing sets
n <- nrow(data)
p <- ncol(data)-1

set.seed(1)
train <- sample(n, 0.8*n)
train_data <- data[train, 1:p] %>% as.matrix()
train_labels <- data[train, p+1, drop = FALSE] %>% as.matrix()
test_data <- data[-train, 1:p] %>% as.matrix()
test_labels <- data[-train, p+1] %>% as.matrix()

# scale the data
train_data <- scale(train_data)
col_means_train <- attr(train_data, "scaled:center")
col_stddevs_train <- attr(train_data, "scaled:scale")
test_data <- scale(test_data,
    center = col_means_train,
    scale = col_stddevs_train)
attr(test_data, "scaled:center")
attr(test_data, "scaled:scale")
ncol(data)
ncol(train_data)

use_session_with_seed(1)

# build the model
model <- keras_model_sequential(layers=list(
    layer_dense(units = 11, activation = "relu",
    input_shape = dim(train_data)[2]),
    layer_dense(units = 2, activation = "softmax")
))

compile(model,
    loss = "categorical_crossentropy",
    optimizer = "adam",
    metrics = "accuracy")

# helper function to show training progress
print_dot_callback <- callback_lambda(
    on_epoch_end = function(epoch, logs) {
        if (epoch %% 80 == 0) cat("\n")
        cat(".")
    }
)

# function to battle overfitting during training
early_stop <- callback_early_stopping(monitor = "val_loss", patience = 20)

# fit the model
history <- fit(model,
    train_data, train_labels,
    epochs = 100,
    batch_size = 32,
    validation_split = 0.2,
    verbose = 0,
    callbacks = list(early_stop, print_dot_callback))

# plot training loss/accuracy
plot(history, smooth=F)

# testing accuracy
eval.results <- evaluate(model, test_data, test_labels, verbose = 0)
eval.results

