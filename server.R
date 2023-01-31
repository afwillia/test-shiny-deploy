server <- function(input, output){
  
  utils::unzip(".venv.zip")
  system("chmod -R +x .venv")
  
  library(reticulate)

  reticulate::use_virtualenv(file.path(getwd(), ".venv"), required = TRUE)
  
  message(system("python3", "--version"))
  message(sprintf("reticulate py version: %s"), reticulate::py_version())
  
  syn <<- reticulate::import("synapseclient")$Synapse()
  
  MetadataModel <<- reticulate::import("schematic.models.metadata")$MetadataModel
  CONFIG <<- reticulate::import("schematic")$CONFIG
  SchemaGenerator <<- reticulate::import("schematic.schemas.generator")$SchemaGenerator
  
  config = CONFIG$load_config("schematic/schematic_config.yml")
  
  inputMModelLocation = config$model$input$location
  inputMModelLocationType = config$model$input$file_type
  
  manifest_title = config$manifest$title
  manifest_data_type = config$manifest$data_type[1]
  
  metadata_model <<- MetadataModel(inputMModelLocation, inputMModelLocationType)
  
  # create schema generator object for associateMetadataWithFiles
  schema_generator <<- SchemaGenerator(inputMModelLocation)
  
  synapse_driver <<- reticulate::import("schematic.store.synapse")$SynapseStorage
  
  observeEvent(input$action, {
    cat("action button") 
  })
}
