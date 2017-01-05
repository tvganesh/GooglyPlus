#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: analyzeIPLMatches2Teams.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
#Analyze all IPL matches between 2 IPL teams
analyzeIPLMatches2Teams <- function(match2,matchFunc,plotOrTable1,repType, team,opposition) {
    
    # Check and get the team indices of IPL teams in which the bowler has played

    IPLmatch <- paste("./IPLMatches2Teams/", match2,".RData",sep="")
    load(IPLmatch)
    matchesDF <- matches
    
    if(plotOrTable1 == 1){
        val1=TRUE
    } else {
        val1= FALSE
    }
    
    print(repType)
    if(repType == 1){
        val2="summary"
    } else {
        val2= "detailed"
    }
    
    # Call the correct function
    if(matchFunc == "Team Batting Scorecard All Matches"){
        
        teamBattingScorecardOppnAllMatches(matchesDF,team, opposition)
    } else if (matchFunc == "Team Batsmen Batting Partnerships All Matches"){
        if(val1 == TRUE){
            teamBatsmenPartnershipOppnAllMatchesChart(matchesDF,team,opposition,plot=val1)
        } else if(val1 == FALSE){
            if(repType ==1){
                teamBatsmenPartnershiOppnAllMatches(matchesDF,team,report="summary")
            } else if(repType ==2){
                teamBatsmenPartnershiOppnAllMatches(matchesDF,team,report="detailed")
            }
        }
    } else if (matchFunc == "Team Batsmen vs Bowlers all Matches"){
        teamBatsmenVsBowlersOppnAllMatches(matchesDF,team,opposition,plot=val1)
    }  else if (matchFunc == "Team Bowling Scorecard All Matches"){
        teamBowlingPerfOppnAllMatches(matchesDF,team, opposition)    
    } else if (matchFunc == "Team Wickets Opposition All Matches"){
        teamBowlersWicketsOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Team Bowler vs Batsmen All Matches"){
        teamBowlersVsBatsmenOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Team Bowlers Wicket Kind All Matches"){
        teamBowlersWicketKindOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Team Bowler Wicket Runs All Matches"){
        teamBowlersWicketRunsOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Win Loss All Matches"){
        plotWinLossBetweenTeams(team,opposition,"./IPLmatches")
    }
    
    
   
    
}

