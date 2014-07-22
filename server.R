library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {

        output$doPlot <- renderPlot({

            switch (input$displayStocks,
                    'Google' = df <- read.table(header=T,text="Date Price
                                                 7/7/14 590.76
                                                 7/8/14 578.40
                                                 7/9/14 583.36 
                                                7/10/14 580.04 
                                                7/11/14 586.65
                                                7/14/14 594.26 
                                                7/15/14 593.06 
                                                7/16/14 590.62
                                                7/17/14 580.82 
                                                7/18/14 605.11 "),

                    'Priceline.com' = df <- read.table(header=T,text="Date Price
                                                 7/7/14 1252.40
                                                 7/8/14 1225.23
                                                 7/9/14 1236.37 
                                                7/10/14 1216.13 
                                                7/11/14 1214.92
                                                7/14/14 1228.49 
                                                7/15/14 1231.00 
                                                7/16/14 1223.65
                                                7/17/14 1201.37
                                                7/18/14 1212.78 "),

                    'Netflix' = df <- read.table(header=T,text="Date Price
                                                7/7/14 460.62
                                                7/8/14 445.05
                                                7/9/14 443.00 
                                                7/10/14 438.55 
                                                7/11/14 439.96
                                                7/14/14 452.58 
                                                7/15/14 449.09 
                                                7/16/14 444.44
                                                7/17/14 439.36 
                                                7/18/14 444.17 ")
            )
           
            switch (input$displayType,
                    'Scatter' = thePlot <- ggplot(df, aes(x = Date, y = Price)) + ggtitle(input$displayStocks) + geom_point(),

                    'Line' = thePlot <- ggplot(df, aes(x = Date, y = Price, group = 1)) + ggtitle(input$displayStocks) + geom_line(),

                    'Smooth' = thePlot <- ggplot(df, aes(x = Date, y = Price, group = 1)) + ggtitle(input$displayStocks) + stat_smooth(method = "lm") + geom_point()
                             
            )

            thePlot + theme(panel.background = element_rect(fill = input$displayPanel), plot.background = element_rect(fill = input$displayPlot))
            
        })
        
    }
)
