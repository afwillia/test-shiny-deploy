library(shiny)

ui <- fluidPage(
  fileInput("file", label = h3("Upload a CSV")),
  actionButton("action", label = "Add row to table"),
)

server <- function(input, output, session){
    observeEvent(input$action, {
      cat("action button") 
    })
}

shinyApp(ui, server)
