# Define UI for the app
fluidPage(
  # App title
  titlePanel("French Noun Gender Practice"),
  
  # Layout: split the page into three columns
  fluidRow(
    # First column: controls
    column(3,
           wellPanel(
             actionButton("randomize", "Randomize Words")
           )
    ),
    
    # Second column: buttons for article selection
    column(3,
           wellPanel(
             actionButton("la", "La (Feminine)"),
             br(),
             actionButton("le", "Le (Masculine)"),
             br(),
             actionButton("skip", "Skip")
           )
    ),
    
    # Third column: display the French word
    column(6,
           wellPanel(
             h3("Word:"),
             h2(textOutput("french_word"))
           )
    )
  )
)
