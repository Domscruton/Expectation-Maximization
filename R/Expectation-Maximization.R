# Expectation-Maximization Algorithm

#Load Source files
files <- c("Initialization", "Convergence", "Maximization", "Expectation")

#paste and paste0 combine several inputs into a character string. Specifying the 'sep'
#(separator) argument with an empty space ensures the strings are concatenated together,
#since the default is to provide a space between each one. Note that the paste0 function
#is a simpler version of the paste function, in that it does not provide a separator
#argument and by default prints the whole line without any separation (we could have
#therefore used it here instead of paste). For paste, we can also use the collapse = ""
#argument, which enables us to collapse a vector of stings into a single string.
for (i in files){
  infile <- paste("R/", i, ".R", sep = "")
  source(infile)
}

EM_Algorithm <- function(df, y, col.rm = NULL, epochs = 1000, method = "K-Means"){
  
  # Extract target, design matrix and proportion of pre-classified observations in 
  # each cluster
  target <- df[, y]
  X <- df[, setdiff(names(df), c(col.rm, y))]
  # Inputs:
    # df: dataframe
    # y: character string containing cluster column
    # col.rm: character string/vector of stings containing any columns to be removed 
            # from the dataset
    # epochs: Number of training iterations
    # Method: Method to use for initialization
  target_iter <- initialization_fun(method, target, X)
  
  # Return a list, containing the estimated parameters, predicted classes and number
  # of iterations
}
