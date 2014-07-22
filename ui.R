library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Stock Selection And Plot Characteristics"),

    sidebarPanel(

        helpText("The purpose of this application is to display closing stock prices in several different formats."),

        HTML("<br />"),

        helpText("Once the user selects a stock, the prices can be represented as either:"),

	p(HTML('<ul>'),
	HTML('<li>'),"Scatter",HTML('</li>'),
	HTML('<li>'),"Line",HTML('</li>'),
	HTML('<li>'),"Smooth",HTML('</li>'),
	HTML('</ul>')),

        HTML("<br />"),

        helpText("From the remaining two dropdowns, the user can change either the Panel Background Color or the Plot Background Color."), 

        HTML("<hr />"),

        selectInput(inputId = "displayStocks",
                    label = "Select Stock:",
                    choices = list("Google" = "Google", "Priceline.com" = "Priceline.com", "Netflix" = "Netflix"),
                    selected = "GOOGL"),

        selectInput(inputId = "displayType",
                    label = "Type Of Plot:",
                    choices = list("Scatter" = "Scatter", "Line" = "Line", "Smooth" = "Smooth"),
                    selected = "Scatter"),

        selectInput(inputId = "displayPanel",
                    label = "Panel Background Color:",
                    choices = list("white" = "white", "beige" = "beige", "gray" = "gray", "khaki1" = "khaki1", "lightskyblue" = "lightskyblue", "thistle1" = "thistle1"),
                    selected = "beige"),

        selectInput(inputId = "displayPlot",
                    label = "Plot Background Color:",
                    choices = list("white" = "white", "beige" = "beige", "gray" = "gray", "khaki1" = "khaki1", "lightskyblue" = "lightskyblue", "thistle1" = "thistle1"),
                    selected = "white")),

    mainPanel(

        plotOutput('doPlot')
        
    )
))