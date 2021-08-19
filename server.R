#setwd("~/REE Projects/shiny")


shinyServer(function(input, output) {

output$e2 <- renderUI({
  dat <- ree_aggregates%>%filter(Confidence == input$e1)
  nam <- dat$Project
  
  selectInput("e2", "Project", choices=nam, multiple=TRUE, selected = NULL)
})

a <- reactive({if(input$e0=="Aggregates") {ree_aggregates%>%filter(variable%in%input$e4, Project%in%input$e2, Confidence == input$e1)}
  else {ree_elements%>%filter(variable%in%input$e3, Project%in%input$e2, Confidence == input$e1)}
  })

output$oxides <- renderDataTable(element_uses)

output$aggs <- renderDataTable(aggregate_metrics)


output$Plot<- renderPlot({f<- ggplot(data = a(), mapping = aes(x = Project, y = value, fill = variable)) +  geom_bar(stat="identity", position=position_dodge())+ theme(axis.text.x=element_text(angle=-90, vjust=.5, hjust=0, size=14, color = "black"), plot.title = element_text(hjust =0, vjust=0)) +ylab("Percentage")+ theme(legend.position="bottom")
  print(f)})
  
})