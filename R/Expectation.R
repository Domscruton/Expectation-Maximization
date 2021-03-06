#Load and rename dataframe
load("Data/FishLengths.RData")
fish_df <- x
rm(x)

Expectation_step <- function(estimates, X){
  
  # Calculate no. features- could also add this to the initialization step since
  # it is also calculated there
  no_features <- dim(X)[2]
  no_observations <- dim(X)[1]
  
  # Extract prior, P(k)
  prior <- estimates[[1]]
  
  # Likelihood- Multivariate Normal Distribution
  for (i in 1:K) {
    
    # Calculate determinant and inverse or covariance matrix
    Sigma_determinant <- det(estimates[[(i + 2)]])
    Sigma_inverse <- solve(estimates[[(i + 2)]])
    
    # Likelihood function for each observation
    for (n in 1:no_observations) {
      likelihood <- (1 / ((2 *pi)^( no_features / 2) * det(estimates[[(i + 2)]]))) * 
        exp(-0.5 * t(X[n, ] - estimates[[2]][K, ]) %*% Sigma_inverse %*% (X[n, ] - 
        estimates[[2]][K, ]))      
    }
  }
  
  # Partition Theorem
  total_prob 
  
  # Bayes Rule
  posterior <- (likelihood * prior) / total_prob
  # 
}