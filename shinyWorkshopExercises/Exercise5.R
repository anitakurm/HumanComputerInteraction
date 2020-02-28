############################################################################# Yay - You made it this far!!
################## Assigment 5 - Chose your own adventure ################### 
#############################################################################

library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage(
  dashboardHeader(title = "Exercise 5"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data overview", tabName ="dataOverview_tab", icon = icon("table")), #find more awesome icons here https://fontawesome.com/icons?from=io
      menuItem("A clock", tabName ="aClock_tab", icon = icon("clock")),
      menuItem("Chose Plot Type", tabName ="plot_tab", icon = icon("chart-bar")),
      menuItem("Freestyle", tabName ="numberFour_tab", icon = icon("accessible-icon"))
    )
  ), #sidebar
  dashboardBody(
    
    tabItems(
      tabItem(tabName = "dataOverview_tab"
              #Task: Create a nice overview of the data 
              #Hint: Look up renderTable() & tableOutput()
              #      If you want to do it more advanced/more difficult: look up formattable (https://www.displayr.com/formattable/ ~ library(formattable))
      ), #tabItem data
      
      tabItem(tabName = "aClock_tab"
              #Task: Create a clock
              #Hint: Create a reactive({}) element that is equal to the current time (look up Sys.time()).
              #      This reactive element must invalidate itself every second - so that it re-reads the time (look up invalidateLater())
              #      Display this element as text here 
      ), #tabItem clock
      
      tabItem(tabName = "plot_tab"
              #Task: Make an interactive plot; you must be able to decide whether to do a geom_point, geom_boxplot etc. from the ui
              #Hint: Look for example with "switch" in https://shiny.rstudio.com/articles/basics.html 
              #      Need an selectinput and then have an reactive switch that determines which geom_ to use.
      ), #tabItem plot
      
      tabItem(tabName = "numberFour_tab"
              #Task: Freestyle
      ) #tabItem 4
    )#tabItems
  )#body
)#page


server <- function(input, output, session) {
  appData = iris #our testData taken from iris-dataset
  
################# Data overview - START #########################
  # write code here
################# Data overview - END ###########################
  
  
################# A clock - START ###############################
  #write server code for a clock here
################# A clock - END #################################

  
################# Plots - START ################################
  # write code here
################# Plots - END ##################################
  
  
################# Freestyle - START #####################################
  # write code here
################# Freestyle - END #######################################
  
}#server end


shinyApp(ui, server) #This function gets the ui-function and the server-function and creates the Shiny App.
