shinyUI(fluidPage(
  titlePanel("Rare Earth Element Development Projects"),
  
  sidebarLayout(
    sidebarPanel(strong("Make a selection or multiple selections in each of the drop down menus below 
                   and click the 'Plot' tab to the right."),
                 p(""),
                 
                radioButtons("e0", "Analysis", choices=c("Elements", "Aggregates"), selected = NULL),
                 
                radioButtons("e1", "Deposit Confidence", choices=c("Proven + Probable", "Measured + Indicated", "Measured + Indicated + Inferred"), selected = "Measured + Indicated"),
                 
                uiOutput("e2"),

                 conditionalPanel(
                   condition = "input.e0 == 'Elements'",
                   selectInput("e3", "Elements", choices=ree_elements$variable, multiple=TRUE, selected = NULL)
                 ),
                 
                 conditionalPanel(
                   condition = "input.e0 == 'Aggregates'",
                   selectInput("e4", "Metric", choices=ree_aggregates$variable, multiple=TRUE, selected = NULL)
                 )
                 
    ),
    
    
    mainPanel(
      tabsetPanel(type="tabs",
                  
                  tabPanel("Summary", 
                           p("The Rare Earth Elements (REE) consist of the lanthanide family, and yttrium. On the 
                             periodic table they are atomic numbers 39, and 57 to 71. They are used in 
                             in small amounts, but are critical to the advanced technologies
                             that we have come to use in our everyday lives. These 15 elements are 
                             always found in the same mineral deposits, in varying ratios. Due to their chemical
                             similarities to one another, to produce
                             one element in the lanthanide family, companies must produce them all."),
                           p("China is currently the world's dominant supplier, producing 
                             greater than 90% of the world's consumption, an even higher share of
                             the more scarce Heavy Rare Earths, and uses greater than 70% in 
                             their own downstream industires. Due to forcast increases in future
                             demand, tightening environmental standards within China, and resource
                             exhaustion, it is posited that China will be unable to continue to meet 
                             demand for the REE in the future."),
                           p("In 2011, in response to a decrease in Chinese export quotas, and large corresponding
                             price increases, dozens of juniors joined a few leaders in exploring and developing
                             deposits with potential economic concentrations of the REE. Since that time, some of
                             these companies have released mineral reserve and resource estimates, in compliance with
                             NI 43-101 (Canada), JORC (Australia), and SAMREC (South Africa) reporting requirements."),
                           p("This Shiny App contains data on REE Project deposits under development. The data set has been 
                             compiled from public company filings. Every effort has been made to ensure that the data 
                             contained therin is true and accurate, as of February 26, 2015. However, no guarantees can be made. The use of this
                             data for any reason other personal interest is at the users own risk.")
                  ),
                  
                  tabPanel("Elements", 
                           p("The Rare Earth Elements consist of the lanthanide family, atomic numbers 39, 54-71 on the 
                             periodic table. The following table has been sourced from Wikipedia, and can be found ",
                             a("here", href="https://en.wikipedia.org/wiki/Rare_earth_element", target="_blank"),". 
                             Information on individual rare earths are viewable by clicking 'Element' in the analysis
                             radio button, Selecting a project and element (or multiple projects and elements). 
                             The individual elements are reported as % for a given weight of ore."),
                           dataTableOutput('oxides')
                           ),
                           
                  tabPanel("Aggregates", 
                           p("Because there are 16 individual REE, it is often the case that elements are grouped together
                             in order to ease the analysis of single deposits and for comparison purposes. The table
                             below outlines some of the more common aggregates.
                             Information on these aggregate metrics are viewable by clicking 'Aggregate' in the analysis
                             radio button, Selecting a project and Metric (or multiple projects and metrics). 
                             The metrics are reported as % for a given weight of ore, a ratio of a subset to total rare earth,
                             or metric tonnes of ore."),
                           dataTableOutput('aggs')
                           ),
                  
                  tabPanel("Plot", plotOutput("Plot"))
                  
                  )
              )
                ))
)
