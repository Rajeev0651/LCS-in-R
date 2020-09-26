library(shiny)
library(qualV)
ui <- fluidPage(
   titlePanel("Sequence Matching"),
   sidebarLayout(
     sidebarPanel(
       textInput("inputsequence1","Input sequence 1"),
       textInput("inputsequence2","Input sequence 2"),
       textInput("inputsequence3","Input sequence 3"),
       textInput("inputsequence4","Input sequence 4"),
       textInput("inputsequence5","Input sequence 5")
     ),
     mainPanel(
       paste("Longest common subsequence length is :"),
       textOutput("result")
     )
   )
 )
 
 server <- shinyServer(function(input, output){
   output$result <- renderText({
     sequences <- c(input$inputsequence1, input$inputsequence2, input$inputsequence3, input$inputsequence4, input$inputsequence5)
     maxval <- 0
     len <- 0
     for ( i in 1:4) {
      for ( j in (i+1):5) {
         a <- unlist(strsplit(sequences[i], ""))
         b <- unlist(strsplit(sequences[j], ""))
         len <- LCS(a,b)
         maxval <- max(maxval, len$LLCS)
         print(maxval)
       }
     }
     paste(maxval)
   })
 })

 shinyApp(ui=ui , server=server)