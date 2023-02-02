server <- function(input, output){
  
  library(reticulate)
  
  py_ver <- "3.10.7"
  install_python(version = py_ver)
  use_virtualenv("venv", python_version = py_ver)
  message(list.files("/home/shiny/.pyenv/versions/3.10.7"))
  system("curl -sSL https://install.python-poetry.org | /home/shiny/.pyenv/versions/3.10.7/bin/python3 -")
  #py_install("schematicpy")

  observeEvent(input$action, {
    cat("action button") 
  })
}
