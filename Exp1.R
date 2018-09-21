# Membuat aplikasi shiny untuk menampilkan nilai statistik sederhana (min, Q1, median[Q2], mean, Q3, maks)

library(shiny)
# Load package shiny


ui <- fluidPage(
  # fluidpage layout
  
  titlePanel("Statistik Sederhana"),
  # Judul panel
  
  sidebarLayout(
    # Layout page dengan sidebar panel dan main panel
    
    sidebarPanel(
      # Sidebar/input panel
      textAreaInput(inputId = "data", label = "Masukkan data:"),
      # widget text area input sebagai tempat memasukkan data
      
      br(),
      # memberikan ruang/jarak secara vertikal (enter)
      
      helpText("Pisahkan setiap amatan dengan spasi")
      # membuat teks sebagai informasi bagi user
    ),
    mainPanel(
      # main/output panel
      
      verbatimTextOutput("nilai")
      # menampilkan/display output dari R di shiny
    )
    )
  )

server <- function(input, output, session){
  # membuat server 
  
  output$nilai <- renderPrint({
    data1 <- strsplit(input$data, " ")
    data1 <- unlist(data1)
    data1 <- as.numeric(data1)
    summary(data1)
  })
}

shinyApp(ui, server)
