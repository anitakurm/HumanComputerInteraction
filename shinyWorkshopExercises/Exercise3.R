#############################################################################
#################### Assigment 3 - Outputs from inputs ######################
#############################################################################
# a) Create a textInput and an actionButton in the UI.
# Task 1: When you open the app and write something in the textInput and press the button,
#         the text that you have written must appear below button as verbatimText.
#
# Task 2: Until the user has submitted any text, the verbatimText must say "No 
#         text has been submitted yet".
#
# Task 3(hard): As soon as the user has written just one letter in the textInput,
#               some additional elements (such as sliderInput or selectInput), must
#               appear in the app. 

library(shiny)
library(shinydashboard)
library(ggplot2)


ui <- dashboardPage(
  dashboardHeader(
    title = "Exercise 3"
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName ="Dashboard_tab", icon = icon("tachometer-alt"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "Dashboard_tab",
              textInput("text_submitted", "Your Text", value = "", width = NULL,
                        placeholder = NULL),
              actionButton("submit_button", "Submit", icon = NULL, width = "200px"),
              verbatimTextOutput("text_value"),
              uiOutput("InteractiveUI")
      )
    )
  )#body
)#ui end

## keep track of elements inserted and not yet removed
inserted <- c()

server <- function(input, output){
  reactive <- reactiveValues(text = "No text has been submitted yet")
  
  observeEvent(input$submit_button, {
    reactive$text <- input$text_submitted
  })
  
  output$text_value <- renderText({reactive$text})
  
  output$InteractiveUI <-  renderUI({
    if (nchar(input$text_submitted)>0){
      tagList(
        sliderInput("obs", "Number of observations:", min = 0, max=1000, value=500)
      )
    }
  })
  
}  #server end


shinyApp(ui, server) #Run app