server <- function(input, output){
  observeEvent(input$action, {
    cat("action button") 
  })
}