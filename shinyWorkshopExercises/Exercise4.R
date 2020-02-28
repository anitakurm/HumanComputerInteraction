############################################################################# Yay - You made it this far!!
#################### Assigment 4 - Make the app pretty! ##################### https://shiny.rstudio.com/articles/layout-guide.html
############################################################################# https://rstudio.github.io/shinydashboard/structure.html

library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage(
  
  dashboardHeader(title = "Exercise 4"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName ="Dashboard_tab", icon = icon("tachometer-alt"))
    )
  ), #sidebar
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "Dashboard_tab",
              fluidRow(box( title = "Histogram", status = "primary", solidHeader = TRUE,
                            collapsible = TRUE,
                column(6, selectInput("selectIrisColumn", 
                                      label = h3("Select box"), 
                                      choices = list("Sepal Length" = "Sepal.Length", 
                                                     "Sepal Width" = "Sepal.Width",
                                                     "Petal Length" = "Petal.Length",
                                                     "Petal Width" = "Petal.Width",
                                                     "Species" = "Species"), 
                                      selected = 1),
                       plotOutput("testDataPlot1")),
                column(6, 
                       selectInput("selectIrisColumn2", 
                                   label = h3("Select box"), 
                                   choices = list("Sepal Length" = "Sepal.Length", 
                                                  "Sepal Width" = "Sepal.Width",
                                                  "Petal Length" = "Petal.Length",
                                                  "Petal Width" = "Petal.Width",
                                                  "Species" = "Species"), 
                                   selected = 1),
                       plotOutput("testDataPlot2"))))
      )#tabItem ends
    )#tabItems
  )#body
)#ui end


server <- function(input, output) {
  appData = iris #our testData taken from iris-dataset
  #print(input$selectIrisColumn)
  
  output$testDataPlot1 <- renderPlot({
    ggplot(appData) + geom_point(aes_string("Sepal.Length", input$selectIrisColumn))
  })
  
  output$testDataPlot2 <- renderPlot({
    ggplot(appData) + geom_point(aes_string("Sepal.Length", input$selectIrisColumn2))
  })
  
}#server end


shinyApp(ui, server) #Run app