server <- function(input, output){
  
  library(reticulate)
  if (!file.exists(".venv")) utils::unzip(".venv.zip")
  system("chmod -R +x .venv")
  py_ver <- "3.10.7"
  install_python(version = py_ver)
  use_python("/home/shiny/.pyenv/versions/3.10.7/bin/python3")
  virtualenv_create("venv", python_version = py_ver)
  message(paste(list.files(all.files=TRUE), collapse = ", "))
  use_virtualenv("./.venv", required = TRUE)
  import("schematicpy")
  #message(list.files("/home/shiny/.pyenv/versions/3.10.7"))
  #system("curl -sSL https://install.python-poetry.org | /home/shiny/.pyenv/versions/3.10.7/bin/python3 -")
  #py_install("schematicpy")

  observeEvent(input$action, {
    cat("action button") 
  })
}
