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

        # generate bins based on input$bins from ui.R
        # dt_degree <- top_n(dt_degree,input$top,Starting_Salary)
        # dt_degree <- top_n(dt_degree,-input$bottom,Starting_Salary)
        
#input$bins

        # draw the histogram with the specified number of bins
        # browser()
        
        ggplot(data = dt_degree,
               mapping = aes(x = reorder(stringr::str_wrap(Undergraduate_Major,15),Starting_Salary),
                             y = Starting_Salary))+
            geom_bar(stat = "identity") + 
            theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + 
    labs(
            title = "Where it Pays to Attend College",
            x = "Undergraduate Major",
            y = "Starting Median Salary"
        )

    })
    
    output$distPlot <- renderPlot

})
