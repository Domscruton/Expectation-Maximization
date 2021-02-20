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
