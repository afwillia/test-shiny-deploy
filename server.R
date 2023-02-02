server <- function(input, output){
  
  library(reticulate)
  
  py_ver <- "3.10.7"
  install_python(version = py_ver)
  use_virtualenv("venv", python_version = py_ver)
  py_install("schematicpy")

  observeEvent(input$action, {
    cat("action button") 
  })
}
