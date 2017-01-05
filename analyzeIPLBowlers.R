#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: analyzeIPLBowlers.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
# Analyze IPL bowlers
analyzeIPLBowlers <- function(IPLBowler,func) {
  
    # Check and get the team indices of IPL teams in which the bowler has played
    i <- getTeamIndex_bowler(IPLBowler)
    
    # Get the team names
    teamNames <- getTeams(i)
    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    bowlerDF <- NULL
    
    # Create a consolidated Data frame of batsman for all IPL teams played
    for (i in seq_along(teamNames)){
          df <- getBowlerWicketDetails(team=teamNames[i],name=IPLBowler,dir="./data")
          bowlerDF <- rbind(bowlerDF,df) 
        
    }
 
    # Call the necessary function
    if(func == "Mean Economy Rate of bowler"){
        bowlerMeanEconomyRate(bowlerDF,IPLBowler)
    } else if (func == "Mean runs conceded by bowler"){
        bowlerMeanRunsConceded(bowlerDF,IPLBowler)
    }     else if (func == "Bowler's Moving Average"){
        bowlerMovingAverage(bowlerDF,IPLBowler)
    } else if (func == "Bowler's Cumulative Avg. Wickets"){
        bowlerCumulativeAvgWickets(bowlerDF,IPLBowler)
    } else if (func == "Bowler's Cumulative Avg. Economy Rate"){
        bowlerCumulativeAvgEconRate(bowlerDF,IPLBowler)
    } else if (func == "Bowler's Wicket Plot"){
        bowlerWicketPlot(bowlerDF,IPLBowler)
    } else if (func == "Bowler's Wickets against opposition"){
        bowlerWicketsAgainstOpposition(bowlerDF,IPLBowler)
    } else if (func == "Bowler's Wickets at Venues"){
        bowlerWicketsVenue(bowlerDF,IPLBowler)
    } else if (func == "Bowler's wickets prediction"){
        # This is for the function wicket predict
        bowlerDF1 <- NULL
        # Create a consolidated Data frame of batsman for all IPL teams played
        for (i in seq_along(teamNames)){    
            # The below 2 lines for Bowler's wicket prediction
            df1 <- getDeliveryWickets(team=teamNames[i],dir="./IPLmatches",name=IPLBowler,save=FALSE)
            bowlerDF1 <- rbind(bowlerDF1,df1)
        }
        bowlerWktsPredict(bowlerDF1,IPLBowler)
        
    }

}

