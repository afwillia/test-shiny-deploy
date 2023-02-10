server <- function(input, output){
 
  cat("test")

  observeEvent(input$action, {
    cat("action button") 
  })
}
