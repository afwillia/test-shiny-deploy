library(shiny)

ui <- fluidPage(
  fileInput("file", label = h3("Upload a CSV")),
  actionButton("action", label = "Add row to table"),
)