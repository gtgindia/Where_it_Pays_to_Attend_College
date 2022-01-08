#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


source("library.R", keep.source = TRUE)
source("../app/mod_1.R", keep.source = TRUE)
source("../app/data.R", keep.source = TRUE)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("superhero"),

    # Application title
    titlePanel("Where it Pays to Attend College"),
  h4("Undergraduate Major"),

    # # Sidebar with a slider input for number of bins
    #          sidebarPanel(
    #         sliderInput("top",
    #                     "Top n:",
    #                     min = 1,
    #                     max = 50,
    #                     value = 30)
    #     ,
    #     sliderInput("bottom",
    #                 "Bottom n:",
    #                 min = 1,
    #                 max = 50,
    #                 value = 30)
    # ),

        # Show a plot of the generated distribution

            plotOutput("distPlot")

    )
)
