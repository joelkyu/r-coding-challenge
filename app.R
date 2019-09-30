library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(
      ".title {margin: auto; width: 200px}"
    )
  ),
  tags$div(class="title", titlePanel("Iris Dataset")),
  sidebarPanel(
    
    
    selectInput('xaxis', 'X Variable', names(iris)[c(1,2,3,4)]),
    selectInput('yaxis', 'Y Variable', names(iris)[c(1,2,3,4)]),
    actionButton(inputId = "updateBtn", label = "Update")
    
  ),
  mainPanel(
    plotOutput('plot')
  )
)

server <- function(input, output) {
  
  
  
  data <- eventReactive(input$updateBtn, iris[, c(input$xaxis, input$yaxis)])
  
  
  output$plot <- renderPlot({
    plot(data())
  })
}

shinyApp(ui, server)

