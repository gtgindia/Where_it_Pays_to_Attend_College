#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        #browser()

        # generate bins based on input$bins from ui.R
        dt_degree <- top_n(dt_degree,-(51-input$top[1]),Starting_Salary)
        dt_degree <- top_n(dt_degree,(-input$top[1]+input$top[2]+1),Starting_Salary)
        
#input$bins

        # draw the histogram with the specified number of bins
      
        
        ggplot(data = dt_degree,
               mapping = aes(x = reorder(stringr::str_wrap(Undergraduate_Major,15),Starting_Salary),
                             y = Starting_Salary))+
            geom_bar(stat = "identity",fill = "darkgreen") + 
            theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + 
    labs(
            title = "Where it Pays to Attend College",
            x = "Undergraduate Major",
            y = "Starting Median Salary"
        )

    })
    
    output$distPlot2 <- renderPlot({
        
        dt_degree_den <- melt(dt_degree)
        dt_degree_den <- subset(dt_degree_den,variable=="Starting_Salary" | variable=="MidCareer_Salary")
        
        
        ggplot(data = dt_degree_den,
               mapping = aes(x = value,
                             fill = variable))+
            geom_density(alpha = 0.2, color = NA) +
            geom_histogram(aes(y = ..density..), alpha = 0.5, position = 'dodge') +
            scale_fill_manual(values = c('darkgreen', 'purple4'))
    })

})
