ui <- fluidPage(
  
  # App title ----
  titlePanel("Analiza danych z portalu Airbnb"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # br() element to introduce extra vertical spacing ----
      br(),
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("EDA",
                           img(src='mapa_all.png', align = "center", heigt=500, width=500),
                           img(src='mapa_biedna.png', align = "center", heigt=600, width=600),
                           img(src='mapa_bogata.png', align = "center", heigt=600, width=600),
                           img(src='mapa_dom_mieszkanie.png', align = "center", heigt=600, width=600)
                           ),
                  tabPanel("Holt",
                           p("Poniższy wykres przedstawia zagregowane dzienne dane dla cen mieszkań"
                             ),
                           plotOutput("plot"),
                           plotOutput("plot_holt"),
                           verbatimTextOutput("holt")),
                  tabPanel("Inna metoda", verbatimTextOutput("summary")),
                  tabPanel("Dane", dataTableOutput("dataTable"))
      )
      
    )
  )
)
