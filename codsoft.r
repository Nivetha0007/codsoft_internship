library(shiny) 
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      body, html {
        height: 100%;
        margin: 0;
      }
      body { 
        background-image: url('https://static7.depositphotos.com/1000128/710/i/450/depositphotos_7103328-stock-photo-smartphone-with-cloud-of-application.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center center;
      }
      .panel-title {
        color: white; 
      }
      .sidebar, .sidebar .panel-body {
        color: white; 
        background-color: rgba(0, 0, 0, 0.5); /* Optional: Adds transparency to the sidebar */
      }
    "))
  ),
  
  titlePanel("Mobile App Sign-up Prototype"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Name:"),
      textInput("email", "Email:"),
      passwordInput("password", "Password:"),
      actionButton("submit", "Sign Up"),
      class = "sidebar"
    ),
    mainPanel(
      textOutput("confirmation")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$submit, {
    output$confirmation <- renderText({
      paste("Thank you for signing up,", input$name)
    })
  })
}

shinyApp(ui = ui, server = server)
