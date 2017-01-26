library(shiny)

shinyServer(function(input, output) {
  
    usertable <- read.csv(file = "~/Bureau/tests/users.csv", stringsAsFactors = F)
    output$mydat <- renderTable(usertable)
    
  observeEvent(input$send, {
         if (input$username %in% usertable$username){
           
           a <- which(input$username == usertable[3])
           if(input$pdw == usertable[a,4]){
             
           user <- paste(usertable[a,1] ,usertable[a,2])
           output$text1 <- renderText(paste("Welcome", user))
           }else{
             
            output$text1 <- renderText("Wrong password")
            
        }}else{
          output$text1 <- renderText("Wrong username")
        }
         
    })
  
  
  observeEvent(input$signin, {
    
    if(input$name == "" | input$surname == "" | input$pwd == ""){
      output$text1 <- renderText("Fill all the inputs to Sign In.")                                      #Test of inputs's replenishement
      
    }else if (tolower(input$name) %in% usertable$Prenom & tolower(input$surname) %in% usertable$Nom){
      output$text1 <- renderText("This user already exist.")                                             #Test for user's existance
      
    }else{
      username <- tolower(paste0(substr(input$name, 1, 1), input$surname))                               #Create username
      output$text1 <- renderText(username)                                                               #Show username
      usertable <- rbind(c(tolower(input$name), tolower(input$surname), username, input$pwd), usertable) #Update usertable
      write.csv(usertable, file = "~/Bureau/tests/users.csv", row.names = F)                             #Write the file with the new table
      output$mydat <- renderTable(usertable)}                                                            #Show the table
    })
  
})