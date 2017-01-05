# ############################################################################################333333
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Jan 2016
# File: printOrPlotIPLTeamPerfOverall
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
printOrPlotIPLTeamPerfOverall <- function(input,output){
    # Set the rank of player
    rankValues <- c(1,2,3,4,5,6)
    output$Rank = renderUI({
        selectInput('rank', 'Choose the rank',choices=rankValues,selected=input$rank)
    })
    
    print(input$teamMatches)
    n <- strsplit(as.character(input$teamMatches),"-")
    
    analyzeIPLTeamPerfOverall(input$teamMatches,input$overallperfFunc,n[[1]][2],input$rank,
                              input$plotOrTable2,
                              input$repType2)
    


}