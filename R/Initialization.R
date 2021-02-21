# Initialization Step


# Random Assignment -------------------------------------------------------

random_initialization <- function(X, target, K, clusters){
  # Inputs:
    # x: dataframe containing features
    # y: character string identify the column
    # K: no. clusters
    # clusters: cluster values to impute
  # calculate a vector of probability weights
  # for the elements that are NA, we want to sample- remember that we want to
  # keep the target values for those that already exist.
  for (i in which(is.na(target))) {
    target[i] <- sample(clusters, 1)
    print(target[i])
  }
  return(target)
}

# K-Means Assignment ------------------------------------------------------


# Multinomial Assignment --------------------------------------------------



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
  
  if (method == "K-Means") {
    
  }
    
  else if (method == "Random"){
    
  }
    
  else{
    print("Incorrect initialization method specified, program will resort to
          default (K-Means)")
  }
}
