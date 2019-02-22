library(shiny)
library(tidyverse)
library(gapminder)
library(shinydashboard)


dat <- gapminder

cont <- levels(dat$continent)

year <- levels(factor(dat$year))



#user interface
ui <- dashboardPage(skin = "green",
          dashboardHeader(title = "Shiny Apps with U of T Coders", titleWidth=350),
          dashboardSidebar(
            sidebarMenu(id = "menu1", 
                        menuItem("Life Expectancy Over Time", tabName = "life", icon = icon("th")),
                        menuItem("Population Over Time", tabName = "pop",icon = icon("area-chart")),
                        menuItem("GDP Per Capita Over Time", tabName = "gdp", icon = icon("cogs"))),
            conditionalPanel(condition = "input.menu1 == 'life'", 
                             selectInput("select", label = "Select Continent", 
                                         choices = c("Africa", "Americas",
                                                     "Asia", "Europe", "Oceania"), selected = "Europe")), 
            conditionalPanel(condition = "input.menu1 == 'pop'", 
                checkboxGroupInput("sample", "Check for Year Selection:", choices = year),
                checkboxInput("bulk", "Select All", value = TRUE))),
            
            dashboardBody(
              tabItems(
                tabItem(tabName = "life",
                        fluidRow(
                          box(title = h3("Shiny App with Gapminder"), width = 12, htmlOutput("text1"), br()),
                          box(title = "Gapminder: Life Expectancy Over Time",plotOutput("plot1"), width = 8))
              ),
              tabItem(tabName = "pop",
                      fluidRow(box(title = "Gapminder: Population Over Time",plotOutput("plot2"), width = 8))),
              tabItem(tabName = "gdp",
                      fluidRow(
                        titlePanel("Mean GDP per Capita 1952:2007"),
                        
                        box(dataTableOutput("view"), width = 8))))))
             
                         
            


#server
server <- function(input, output, session) {
  
  
  output$text1 <- renderText({paste0("The ","<b>Shiny App Lesson</b>"," for ", "<font color=\"#008000\"><b>UofTCoders</b></font>",".")})
  
  output$plot1 <- renderPlot({
    sub1 <- dat %>% filter(continent==input$select)
    
    ggplot(sub1, aes(year, lifeExp, color = country)) + geom_point() +
      stat_smooth(method = "lm") +
      theme_bw() +
      ggtitle(paste0("Continent == ", input$select))
  })  
  
  #Reactive update of check boxes for mutants, including the bulk options 'all' or 'none'  
  observe({
    updateCheckboxGroupInput(session, "sample",
                             choices = year,
                             selected = if (input$bulk) year)
  })
  
  output$plot2 <- renderPlot({
      if (any(input$sample %in% year)){

      sub1 <- dat %>% filter(year %in% input$sample)
    
      ggplot(sub1, aes(continent, pop, fill = factor(year))) + geom_bar(stat="identity", position = "dodge") +
        theme_bw() + coord_flip() 
      } else {
        ggplot(dat, aes(continent, pop, fill = factor(year))) + geom_bar(stat="identity", position = "dodge") +
          theme_bw() + coord_flip()
      }
  })  
  
  
  output$view <- renderDataTable({
    dat %>% group_by(continent, country) %>% summarize(mean = round(mean(gdpPercap),2))})
 
}



shinyApp(ui, server)
