# Initialization Step


# Random Assignment -------------------------------------------------------

random_initialization <- function(X, target, K, clusters, p){
  # Inputs:
    # x: dataframe containing features
    # y: character string identifying the column
    # K: no. clusters
    # clusters: cluster values to impute
    # p: vector of probability weights for each cluster
  # calculate a vector of probability weights
  # for the elements that are NA, we want to sample- remember that we want to
  # keep the target values for those that already exist.
  for (i in which(is.na(target))) {
    target[i] <- sample(x = clusters, size = 1, prob = p)
  }
  return(target)
}

# K-Means Assignment ------------------------------------------------------

KMeans_initialization <- function(X, target, clusters){
  
  # Use centroids for known observations to perform K-Means Clustering
  
  # Convert X to dataframe to allow generalization 
  X <- as.data.frame(X)
  # calculate vector of means for each cluster (for other latent variables) to use
  # as centroids for each cluster
  centroids <- c()
  for (i in clusters) {
    if (dim(X)[2] == 1) {
      centroids[i] <- mean(X[which(target == i), ])
    }else{
      centroids[i] <- colMeans(X[which(target == i), ])
    }
  }
  # Apply K-Means using calculated centroids and return a vecotr of cluster labels
  target <- kmeans(X, centers = centroids)[1]
  return(target)
}

# Multinomial Assignment --------------------------------------------------

Multinomial_initialization <- function(X, target, clusters){
  
  # Check if the relevant library is loaded- install packages if required
  if (!require(nnet)) {
    print("Installing nnet for Multinomial Initialization")
    install.packages(nnet, dependencies = TRUE, verbose = FALSE)
    library(nnet)
  }
  # Fit multinomial model for known data
  
  # Use fitted model to predict clusters for unknown observations
  
}

# Initialization Function -------------------------------------------------

initialization_fun <- function(method = "K-Means", target, X){
  # Inputs:
    # method: Method for initialization
  
  # Identify no. of unique clusters
  if (any(is.na(target))) {
    clusters <- na.omit(unique(target))
    K <- length(unique(target)) - 1
    paste("Idenfitied", K, "clusters:", paste(clusters, collapse = ","), 
          ". Please ensure this is correct- observations with missing cluster", 
          "should be identified as NA")
  }
  
  # Identify proportion of observations in each pre-assigned cluster
  p <- c()
  n <- length(which(!is.na(target)))
  for(i in clusters){
    p[i] <- length(which(target == i)) / n
  }
  
  if (method == "Random"){
    target <- random_initialization(X, target, K, clusters, p)
  }else if (method == "K-Means") {
    target <- KMeans_initialization(X, target, clusters)
  }else if (method == "Multinomial") {
    target <- Multinomial_initialization()
  }else{
    print("Incorrect initialization method specified, program will resort to
          default (K-Means)")
    target <- KMeans_initialization(X, target, clusters)
  }
  return(target)
}
