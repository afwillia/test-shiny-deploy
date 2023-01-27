server <- function(input, output){
  
  library(reticulate)
  import("schematicpy")
  
  observeEvent(input$action, {
    cat("action button") 
  })
}