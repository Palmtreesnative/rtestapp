library(shiny)

shinyUI(fluidPage(
  
  titlePanel("LogIn"),
  
  verticalLayout(
    wellPanel(
      tabsetPanel(
        
        tabPanel("Login", 
                 textInput("username", "Nom D'utilisateur"),
                 textInput("pdw", "Mot de passe"),
                 actionButton("send", "Se connecter")),
        
      tabPanel("Singin",
               textInput("name", "Prenom"),
               textInput("surname", "Nom de famille"),
               textInput("pwd", "Mot de Passe"),
               actionButton("signin", "S'inscrire")),
      
      tabPanel("Enregistrer une longe",
               selectInput("user", "Client", paste(usertable[,1], usertable[,2]))
               )
      
      )),
    
    wellPanel(
      tabsetPanel(
        tabPanel("Username", textOutput("text1")),
        tabPanel("Users Table", tableOutput("mydat"))
        )
    )
  )
))