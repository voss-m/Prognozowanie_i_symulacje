library(DT)
library(data.table)
library(dplyr)
library(tidyverse)
server <- function(input, output) {
  
data_summary_week<-fread('data_summary_week.csv') 
data_summary<-fread('data_summary.csv') 
 dane<- reactive({
   data<-as.data.frame(data)
   data<-data %>%
     filter(data$available=='t')
   data$price<-as.numeric(gsub("[^0-9.]", "", data$price))
 })
 
 output$dataTable<- renderDataTable({
   data_summary$Cena<-round(data_summary$Cena,2)
   datatable(data_summary[,2:3], rownames=FALSE)
 })
 
 data.s_7 <- ts(data_summary$Cena, frequency = 7)
 Holt_7<-HoltWinters(data.s_7, beta = 0, gamma = 0)
 
 output$holt<-renderPrint({
   Holt_7$SSE
 })
 
 output$plot_holt<-renderPlot({
   plot(Holt_7)
 })
 
 output$plot <- renderPlot({
   data_summary<-data_summary
   data_summary$`Numer tygodnia`<-as.Date(data_summary$`Numer tygodnia`)
   ggplot(data=data_summary, aes(data_summary$`Numer tygodnia`, Cena)) +
     geom_line() +
     xlab("Data") +
     ylab("Średnia cena wynajmnu")
 })
}