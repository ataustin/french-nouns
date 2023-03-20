# Function to load initial data from CSV file
load_data <- function() {
  data <- read.csv("nouns.csv", stringsAsFactors = FALSE)
  data$timestamp <- as.POSIXct(data$timestamp)
  print("Loaded data:")   # Add this line
  print(head(data))       # Add this line
  return(data)
}

# Function to update table after an answer is submitted
update_table <- function(data, noun, article, correct) {
  row <- which(data$noun == noun)
  data[row, "shown"] <- data[row, "shown"] + 1
  if (!correct) {
    data[row, "incorrect"] <- data[row, "incorrect"] + 1
  }
  data[row, "timestamp"] <- Sys.time()
  return(data)
}
