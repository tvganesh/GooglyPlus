# ############################################################################################333333
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Jan 2016
# File: printOrPlotIPLMatch
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
printOrPlotIPLMatch <- function(input,output){
    m <- strsplit(as.character(input$match),"-")
    teams <- c(m[[1]][1],m[[1]][2])
  
    
    # Set the IPL teams
    output$selectTeam <- renderUI({ 
        selectInput('team', 'Choose team',choices=teams,selected=input$team)
    })
 
    otherTeam = setdiff(teams,input$team)
    a <- analyzeIPLMatches(input$match,input$matchFunc,input$plotOrTable,input$team,otherTeam)
    a
}