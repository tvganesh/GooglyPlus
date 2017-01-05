#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: analyzeIPLTeamPerfOverall.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
# Analyze an IPL team's performance in all matches
analyzeIPLTeamPerfOverall <- function(matches,matchFunc,team,rankV,plotOrTable2,repType2) {
    
    # Check and get the team indices of IPL teams in which the bowler has played
    IPLmatch <- paste("./allMatchesallOppn/", matches,".RData",sep="")
    load(IPLmatch)
    matchesDF <- matches
    
    if(plotOrTable2 == 1){
        val3=TRUE
    } else {
        val3= FALSE
    }
    
    print(repType2)
    

    # Call the correct function
    if(matchFunc == "Team Batting Scorecard Overall"){
        teamBattingScorecardAllOppnAllMatches(matchesDF,team)
    } else if (matchFunc == "Team Batsmen Partnerships Overall"){
        if(val3 == TRUE){
            teamBatsmenPartnershipAllOppnAllMatchesPlot(matchesDF,team,main=team,plot=val3)
        } else if(val3 == FALSE){
            if(repType2 ==1){
                teamBatsmenPartnershipAllOppnAllMatches(matchesDF,team,report="summary")
            } else if(repType2 ==2){
                teamBatsmenPartnershipAllOppnAllMatches(matchesDF,team,report="detailed")
            }
        }
        
        
    } else if (matchFunc == "Team Batsmen vs Bowlers Overall"){
        if(val3 == TRUE){
           df <- teamBatsmenVsBowlersAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV),dispRows = 20)
           teamBatsmenVsBowlersAllOppnAllMatchesPlot(df)
        } else {
            teamBatsmenVsBowlersAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))
        }
        
    } else if(matchFunc == "Team Bowling Scorecard Overall"){
        teamBowlingScorecardAllOppnAllMatchesMain(matchesDF,theTeam=team)
        
    } else if (matchFunc == "Team Bowler vs Batsmen Overall"){
        if(val3 == TRUE){
           df <- teamBowlersVsBatsmenAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))  
           teamBowlersVsBatsmenAllOppnAllMatchesPlot(df,team,team)
        } else {
            teamBowlersVsBatsmenAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))  
        }
        
  
    } else if (matchFunc == "Team Bowler Wicket Kind Overall"){
        teamBowlingWicketKindAllOppnAllMatches(matchesDF,team,"All")

    }
    
}
