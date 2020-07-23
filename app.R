library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(shinydashboardPlus)
library(leaflet)
library(dashboardthemes)

source("theme.R")

shinyApp(
  ui = dashboardPagePlus(
    title = "DashboardPage",
    header = dashboardHeaderPlus(
      title = "DSPG 2020"
      ),
    
    sidebar = dashboardSidebar(
      sidebarMenu(
        id = "tabs",
        menuItem(
          tabName = "overview",
          text = "Project Overview",
          icon = icon("info circle")
        ),
        menuItem(
          tabName = "map",
          text = "Interactive Map",
          icon = icon("map-marked-alt")
        ),
        menuItem(
          tabName = "graph",
          text = "Interactive Graph",
          icon = icon("map-marked-alt")
        ),
        menuItem(
          tabName = "both",
          text = "Mutiple Interactive",
          icon = icon("map-marked-alt")
        ),
        menuItem(
          tabName = "data",
          text = "Data & Methodology",
          icon = icon("database")
        ),
        menuItem(
          tabName = "findings",
          text = "Findings",
          icon = icon("chart-pie")
        ),
        menuItem(
          tabName = "team",
          text = "Team",
          icon = icon("user-friends")
        )
      )
    ),
    
    body = dashboardBody(
      customTheme,
      fluidPage(
      tabItems(
        tabItem(tabName = "overview",
                fluidRow(
                  boxPlus(
                    title = "Project Overview",
                    closable = FALSE,
                    width = NULL,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    h1("2020 DSPG Project Name"),
                    h2("Project Description"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Fusee justo nisi, suscipit a lacus et, posuere sagittis ex."),
                    h2("Project Goals"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Fusee justo nisi, suscipit a lacus et, posuere sagittis ex."),
                    h2("Our Approach"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Fusee justo nisi, suscipit a lacus et, posuere sagittis ex."),
                    h2("Ethical Considerations"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Fusee justo nisi, suscipit a lacus et, posuere sagittis ex.")
                  )
                )),
        tabItem(tabName = "map",
                fluidRow(
                  boxPlus(
                    title = "Interactive Map",
                    closable = FALSE,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    width = NULL,
                    enable_sidebar = TRUE,
                    sidebar_width = 25,
                    sidebar_start_open = TRUE,
                    sidebar_content = tagList(p(),
                                              actionButton("recalc", "Click Me!")),
                    leafletOutput("mymap")
                  ),
                  p("Explanatory text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                  br()
                )),
        tabItem(tabName = "graph",
                fluidRow(
                  boxPlus(
                    title = "Interactive Graph",
                    closable = FALSE,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    width = NULL,
                    enable_sidebar = TRUE,
                    sidebar_width = 25,
                    sidebar_start_open = TRUE,
                    sidebar_content = sliderInput(
                      "obs",
                      "Number of observations:",
                      min = 0,
                      max = 1000,
                      value = 500
                    ),
                    plotOutput("distPlot")
                  ),
                  p("Explanatory text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                  br()
                )),
        tabItem(tabName = "both",
                fluidRow(
                  boxPlus(
                    title = "Interactive Graph",
                    closable = FALSE,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    width = 6,
                    enable_sidebar = TRUE,
                    sidebar_width = 25,
                    sidebar_start_open = TRUE,
                    sidebar_content = tagList(sliderInput(
                      "obs2",
                      "Number of observations:",
                      min = 0,
                      max = 1000,
                      value = 500
                    )
                    ),
                    plotOutput("distPlot2"),
                    footer = "Explanatory text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."
                  ),
                  boxPlus(
                    title = "Interactive Map",
                    closable = FALSE,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    width = 6,
                    enable_sidebar = TRUE,
                    sidebar_width = 25,
                    sidebar_start_open = TRUE,
                    sidebar_content = tagList(
                      p(),
                      actionButton("recalc2", "Click Me!")
                      ),
                    leafletOutput("mymap2"),
                    footer = "Explanatory text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."
                  )
                )),
        tabItem(tabName = "data",
                fluidRow(
                  boxPlus(
                    title = "Data & Methodology",
                    closable = FALSE,
                    width = NULL,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    h2("Data Sources"),
                    img(src = "data_sets.png", width = "450px", align = "right"),
                    h3("Data Source 1"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h3("Data Source 2"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h3("Data Source 3"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h2("Methodology"),
                    h3("Data Preparation"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h3("Data Modeling"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante.")
                  )
                )),
        tabItem(tabName = "findings",
                fluidRow(
                  boxPlus(
                    title = "Findings",
                    closable = FALSE,
                    width = NULL,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    h2("Summary of Findings"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h3("Results Section One"),
                    img(src = "irrational_venn_diagram.png", width = "360px", align = "right"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h3("Results Section Two"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante."),
                    h3("Results Section Three"),
                    img(src = "food_reality_chart.png", width = "400px", align = "right"),
                    p("Example text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in varius purus. Nullam ut sodales ante.")
                  )
                )),
        tabItem(tabName = "team",
                fluidRow(
                  boxPlus(
                    title = "Findings",
                    closable = FALSE,
                    width = NULL,
                    status = "warning",
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    h2("DSPG Team Members"),
                    p("[Photos go about here.]"),
                    h2("UVA SDAD Team Members"),
                    p("[Photos go about here.]"),
                    h2("Project Sponsors"),
                    p("[Photos, information, and/or links about your sponsor go about here. You may want to use materials that your sponsors have already shared with you about their institution or coordinate with your stakeholders to include pertinent information here.]"),
                    h2("Acknowledgements"),
                    p("[Optional: You can also include external collaborators in this section or a separate section.]")
                  )
                ))
      )
    ))
  ),
  
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    
    output$distPlot2 <- renderPlot({
      hist(rnorm(input$obs2))
    })
    
    points <- eventReactive(input$recalc, {
      cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
    }, ignoreNULL = FALSE)
    
    output$mymap <- renderLeaflet({
      leaflet() %>%
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE)) %>%
        addMarkers(data = points())
    })
    
    points2 <- eventReactive(input$recalc2, {
      cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
    }, ignoreNULL = FALSE)
    
    output$mymap2 <- renderLeaflet({
      leaflet() %>%
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE)) %>%
        addMarkers(data = points2())
    })
  }
)