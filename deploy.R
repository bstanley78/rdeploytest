library(rsconnect)

shiny.apps.username <- Sys.getenv("SHINY_APPS_USERNAME")   
shiny.apps.token <- Sys.getenv("SHINY_APPS_TOKEN")   
shiny.apps.secret <- Sys.getenv("SHINY_APPS_SECRET")   

rsconnect::setAccountInfo(name=shiny.apps.username,token=shiny.apps.token,secret=shiny.apps.secret)

common.files <- list.files(path = "./common", pattern = "(\\.json$|\\.R$)", full.names = TRUE)

for (folder in dir()[file.info(dir())$isdir]){
  file.copy(common.files, folder)
  rsconnect::deployApp(folder)
}