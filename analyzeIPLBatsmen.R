#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: analyzeIPLBatsmen.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################

# Analyze IPL batsmen
analyzeIPLBatsmen <- function(IPLBatsman,func) {
   #print(IPLBatsman)
    
    # Return when name is NULL at start
    if(is.null(IPLBatsman))
        return()
    
    # Check and get the team indices of IPL teams in which the batsman has played
    i <- getTeamIndex(IPLBatsman)
    
    # Get the team names
    teamNames <- getTeams(i)
    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    batsmanDF <- NULL
    # Create a consolidated Data frame of batsman for all IPL teams played
    for (i in seq_along(teamNames)){
          df <- getBatsmanDetails(team=teamNames[i],name=IPLBatsman,dir="./data")
          batsmanDF <- rbind(batsmanDF,df) 
    }
    print(dim(batsmanDF))
    # Call the approporiate function
    if(func == "Batsman Runs vs. Deliveries"){
        batsmanRunsVsDeliveries(batsmanDF,IPLBatsman)
    } else if (func == "Predict runs of batsman"){
        batsmanRunsPredict(batsmanDF,IPLBatsman)
    }     else if (func == "Dismissals of batsman"){
        batsmanDismissals(batsmanDF,IPLBatsman)
    } else if (func == "Batsman's Runs vs Strike Rate"){
        batsmanRunsVsStrikeRate(batsmanDF,IPLBatsman)
    } else if (func == "Batsman's Moving Average"){
        batsmanMovingAverage(batsmanDF,IPLBatsman)
    } else if (func == "Batsman's Cumulative Average Runs"){
        batsmanCumulativeAverageRuns(batsmanDF,IPLBatsman)
    } else if (func == "Batsman's Cumulative Strike Rate"){
        batsmanCumulativeStrikeRate(batsmanDF,IPLBatsman)
    } else if (func == "Batsman's Runs against Opposition"){
        batsmanRunsAgainstOpposition(batsmanDF,IPLBatsman)
    } else if (func == "Batsman's  Runs at Venue"){
        batsmanRunsVenue(batsmanDF,IPLBatsman)
    } else if (func == "Predict Runs of batsman"){
        batsmanRunsPredict(batsmanDF,IPLBatsman)
    } 
   
}

