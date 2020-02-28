#############################################################################
################### Assigment 1 - Make a graph in the App ###################
#############################################################################
# a) install packages "shiny" & "shinydashboard" - then press "Run App" (or just run all the code)
# b) Complete the output$testDataPlot1 with a plot within the brackets in the server code
# c) Create an additional page like the "Dashboard"-page  
# d) Create a second plot to display on this additional page 
# e) Create some text and headlines on both pages
# f) Create a "Select box" in the UI  - see: https://shiny.rstudio.com/gallery/select-box.html
# optional) Make the "Select box" interactive - so that it controls what is being plotted an axis in testDataPlot1 

library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage(
  dashboardHeader(
    title = "Exercise 1"
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName ="Dashboard_tab", icon = icon("tachometer-alt")),
      menuItem("Another Plot", tabName = "AnotherPlot", icon = icon("tachometer-alt")),
      menuItem("Widget", tabName = "widget", icon = icon("tachometer-alt"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "Dashboard_tab",
              selectInput("selectInputIris", "Select data column", choices = c("Sepal Length" = "Sepal.Length",
                                                                               "Petal Width" = "Petal.Width",
                                                                               "Sepal Width" = "Sepal.Width") ),
              h1("Plot nr 1"), "some normal text",
              plotOutput("testDataPlot1")
      ),
      
      tabItem(tabName = "AnotherPlot",
              h1("Plot nr 2"),
              plotOutput("testDataPlot2")),
      
      tabItem(tabName ="widget",
              h1("Widgets header"),
              h2("Widgets tab content"))
    )
  )#body
  
)#ui end


server <- function(input, output) {
  appData = iris #our testData taken from iris-dataset
  
  output$testDataPlot1 <- renderPlot({
    ggplot(appData, aes_string(input$selectInputIris, "Petal.Length"))+geom_point()
    #b) Write a plot here - that is to be displayed in the app
    })
  output$testDataPlot2 <- renderPlot({
    ggplot(appData, aes(Petal.Length, Sepal.Length))+geom_point()
    
    })
  
}#server end


shinyApp(ui, server) #Run app


########## HINTS ###########
# b) Use ggplot within  "renderPlot([ #HERE ])"
# c) Create another menuItem (the ID/tabName must be unique)
# d) Use 'plotOutput()' and 'output$...'
# d) Repeat what you already have
# e) use play text within "" or h1() or h2() etc.
# f) Read the link
# optional: You may need to use aes_string() in ggplot - because the 'input$selectBoxIrisGraph' probably is a string.