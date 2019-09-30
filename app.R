library(shiny)
library(ggplot2)

ui <- fluidPage(
  tags$head(
    tags$style(
      ".title {margin: auto; width: 200px}"
    )
  ),
  tags$div(class="title", titlePanel("Iris Dataset")),
  sidebarPanel(
    
    
    selectInput('xaxis', 'X Variable', names(iris)[c(1:4)]),
    selectInput('yaxis', 'Y Variable', names(iris)[c(1:4)]),
    actionButton(inputId = "scatterBtn", label = "Scatter Plot"),
    actionButton(inputId = "histBtn", label = "Histogram"),
    actionButton(inputId = "boxBtn", label = "Box Plot")
    
    
    
  ),
  mainPanel(
    plotOutput('plot')
  )
)

server <- function(input, output) {
  
  
  
  showScatter <- eventReactive(input$scatterBtn, 
                               plot(iris[, c(input$xaxis, input$yaxis)]))
  
  showHistorgram <- eventReactive(input$histBtn, hist(iris[,input$xaxis]))
  
  showBox <- eventReactive(input$boxBtn, boxplot(iris[,input$xaxis]))
  
  
  output$plot <- renderPlot({
    showScatter()
    showHistorgram()
    showBox()
    
    
  })
}

shinyApp(ui, server)

