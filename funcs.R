#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: funcs.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
# Get all the IPL batsmen
getBatsmen <- function(df){
    bmen <- df %>% distinct(batsman) 
    bmen <- as.character(bmen$batsman)
    batsmen <- sort(bmen)
}

find1 <- function(x, a){
    which(x==a)
}

# Find out the indices of the teams in which the batsman has played
getTeamIndex <- function(batsman){
    setwd("./data")
    load("csk.RData")
    load("dc.RData")
    load("dd.RData")
    load("kxip.RData")
    load("ktk.RData")
    load("kkr.RData")
    load("mi.RData")
    load("pw.RData")
    load("rr.RData")
    load("rcb.RData")
    load("sh.RData")
    load("gl.RData")
    load("rps.RData")
    setwd("..")
    getwd()
    print(ls())
    teams_batsmen = list(csk_batsmen,dc_batsmen,dd_batsmen,kxip_batsmen,ktk_batsmen,kkr_batsmen,mi_batsmen,
                         pw_batsmen,rr_batsmen,rcb_batsmen,sh_batsmen,gl_batsmen,rps_batsmen)
    b <- NULL
    for (i in 1:length(teams_batsmen)){
        a <- which(teams_batsmen[[i]] == batsman)
        
        if(length(a) != 0)
            b <- c(b,i)
    }
    b
}

# Get the list of the IPL team names from the indices passed
getTeams <- function(x){
   
    l <- NULL
    # Get the teams passed in as indexes
    for (i in seq_along(x)){
        
        l <- c(l, IPLTeamNames[[x[i]]]) 
        
    }
    l
}


# Get all IPL bowlers
getBowlers <- function(df){
    bwlr <- df %>% distinct(bowler) 
    bwlr <- as.character(bwlr$bowler)
    bowler <- sort(bwlr)
}

# Get the team indices of IPL teams for which the bowler as played
getTeamIndex_bowler <- function(bowler){
    # Load IPL Bowlers
    setwd("./data")
    load("csk1.RData")
    load("dc1.RData")
    load("dd1.RData")
    load("kxip1.RData")
    load("ktk1.RData")
    load("kkr1.RData")
    load("mi1.RData")
    load("pw1.RData")
    load("rr1.RData")
    load("rcb1.RData")
    load("sh1.RData")
    load("gl1.RData")
    load("rps1.RData")
    setwd("..")
    teams_bowlers = list(csk_bowlers,dc_bowlers,dd_bowlers,kxip_bowlers,ktk_bowlers,kkr_bowlers,mi_bowlers,
                         pw_bowlers,rr_bowlers,rcb_bowlers,sh_bowlers,gl_bowlers,rps_bowlers)
    b <- NULL
    for (i in 1:length(teams_bowlers)){
        a <- which(teams_bowlers[[i]] == bowler)
        if(length(a) != 0){
            b <- c(b,i)
        }
    }
    b
}
    