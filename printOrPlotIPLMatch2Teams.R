# ############################################################################################333333
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Jan 2016
# File: printOrPlotIPLMatch2Teams
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
printOrPlotIPLMatch2Teams <- function(input,output){
    # Get the IPL teams
    p <- strsplit(as.character(input$match2),"-")
    teams2 <- c(p[[1]][1],p[[1]][2])
    
    # Set the IPL teams
    output$selectTeam2 <- renderUI({ 
        selectInput('team2', 'Choose team',choices=teams2,selected=input$team2)
    })
    
    #Find the other team
    otherTeam = setdiff(teams2,input$team2)
    a <- analyzeIPLMatches2Teams(input$match2,input$matches2TeamFunc,input$plotOrTable1,
                                 input$repType,input$team2,otherTeam)
    a
}