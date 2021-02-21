# Initialization Step


# Random Assignment -------------------------------------------------------

random_initialization <- function(X, target, K, clusters, p){
  # Inputs:
    # x: dataframe containing features
    # y: character string identify the column
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

KMeans_initialization <- function(X, target, K, clusters){
  
}

# Multinomial Assignment --------------------------------------------------

Multinomial_initialization <- function(X, target, clusters){
  
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
    target <- KMeans_initialization()
  }else if (method == "Multinomial") {
    target <- Multinomial_initialization()
  }else{
    print("Incorrect initialization method specified, program will resort to
          default (K-Means)")
  }
  return(target)
}
