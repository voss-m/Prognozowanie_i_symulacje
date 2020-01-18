ui <- fluidPage(
  
  # App title ----
  titlePanel("Analiza danych z portalu Airbnb"),
  
  # Sidebar layout with input and output definitions ----
fluidPage(
    

    
    # Main panel for displaying outputs ----
    mainPanel(fluidRow(
      align = "center",
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("EDA",
                           br(),
                           br(),
                           br(),
                           p('Poniższa mapa przedstawia rozmieszczenie wszystkich mieszkań/domów/pokoi jakie były oferowanie w Seattle w 2016 roku na platformie Airbnb'),
                           br(),
                           img(src='mapa_all.png', align = "center", heigt=700, width=700),
                           br(),
                           br(),
                           br(),
                           br(),
                           br(),
                           p('Przy wykorzystaniu innych źródeł danych udało nam się ustalić, które dzielnice są najmniej bezpieczne oraz najbiedniejsze. 
                           Wybraliśmy sześć najgorzej prosperujących dzielnic miasta Seattle i nałożyliśmy mieszkania z platformy wraz z cenami'),
                           img(src='mapa_biedna.png', align = "center", heigt=700, width=700),
                           p('Wyżej wymienione źródło zawierało również informacje o najbogatszych dzielnicach, których mieszkańcy mogą czuć się bezpiecznie.',
                           'Patrząc na legendy obu map można zauważyć istotną różnicę w cenach za jedną noc wynajmu.'),
                           img(src='mapa_bogata.png', align = "center", heigt=700, width=700),
                           p('Wykorzystany przez nas zbiór danych zawierał ponad 92 zmienne. Jedną z nich był typ mieszkania. Wizualizacja miała potwierdzić nasze domysły, że w centrum miasta dominować będą aparatamenty, a na obrzeżach domy'),
                           img(src='mapa_dom_mieszkanie.png', align = "center", heigt=700, width=700)
                           ),
                  tabPanel("Holt",
                           p('W ramach projektu wykorzystaliśmy 4 metody prognozowania: model Holta, ARIMA, regresję liniową oraz alteratywną metodę random forest'),
                           p(''),
                           p("Poniższy wykres przedstawia zagregowane dzienne dane dla cen mieszkań"),
                           plotOutput("plot"),
                           plotOutput("plot_holt"),
                           p('Optymalne wartości parametrów wygładzania, oparte na zminimalizowaniu błędów przewidywania o jeden stopień do przodu, wynoszą odpowiednio 0.9164643, 0 i 0.4 dla α, β i γ.'),
                           p('Współczynniki są szacunkowymi wartościami poziomu, nachylenia i mnożników sezonowych od stycznia do grudnia, dostępnymi w ostatnim punkcie czasowym (t = n = 7).
                           Na koniec, obliczyliśmy średni kwadratowy błąd prognozy, który wynosi 5.83, i porównaliśmy go z odchyleniem standardowym pierwotnego szeregu czasowego, które wynosi 9.86
                           Do identyfikacji składowych szeregu czasowego (trendu oraz sezonowości) wykorzystaliśmy funkcję autokorelacji - ACF. W środowisku R jest dostępna funkcja graficzna forecast::tsdisplay, za pomocą której zostają wygenerowane trzy wykresy: krzywa badanego zjawiska, funkcja autokorelacji ACF oraz funkcja częściowej autokorelacji PACF.'),
                           img(src='analiza_sezonowosci.jpeg', align = "center", heigt=700, width=700),
                           p('Wykres ceny wykazuje trend dlatego po zastosowaniu funkcji różnicowania szeregu czasowego trend został wyeliminowany'),
                           img(src='szereg_bez_trendu.jpeg', align = "center", heigt=700, width=700),
                           p('Ostatnią operacją na szeregu czasowym było pozbycie się sezonowości'),
                           img(src='szereg_bez_sezonowosci.jpeg', align = "center", heigt=700, width=700)),
                  tabPanel("ARIMA", 
                           verbatimTextOutput("summary"),
                           img(src='arima.jpeg', align = "center", heigt=700, width=700)),
                  tabPanel("Dane", dataTableOutput("dataTable"))        
                  )
      )
      
    )
    )
  )

