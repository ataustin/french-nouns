# Load required libraries
library(shiny)

# Load helper functions
source("helpers.R")


# Define server logic required to run the app
function(input, output, session) {
  
  # Load initial data
  data <- reactiveVal(load_data())
  
  print("Reactive data:")   # Add this line
  print(head(data()))        # Add this line
  
  # Randomize the list of nouns
  randomize_nouns <- function() {
    data(data()[sample(nrow(data())), ])
  }
  
  # Observe the randomize button and update the nouns list when clicked
  observeEvent(input$randomize, {
    randomize_nouns()
  })
  
  # Get the next noun from the list
  next_noun <- function() {
    data()[1, "noun"]
  }
  
  # Display the French word in the UI
  output$french_word <- renderText({
    next_noun()
  })
  
  # Check the user's answer and update the table
  check_answer <- function(article) {
    noun <- next_noun()
    correct_article <- data()[which(data()$noun == noun), "article"]
    correct <- (article == correct_article)
    new_data <- update_table(data(), noun, article, correct)
    data(new_data)
    randomize_nouns()
    return(correct)
  }
  
  # Observe the article buttons and update the table when clicked
  observeEvent(input$la, {
    check_answer("la")
  })
  observeEvent(input$le, {
    check_answer("le")
  })
  
  # Observe the skip button and randomize the nouns list when clicked
  observeEvent(input$skip, {
    randomize_nouns()
  })
  
}
