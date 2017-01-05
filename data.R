#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: data.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
load("./data/batsmen.RData")
IPLBatsmen <-b

load("./data/bowlers.RData")
IPLBowlers <-b

a <-list.files("IPLmatches/")
IPLMatches <- gsub(".RData","",a)

a1 <-list.files("IPLMatches2Teams/")
IPLMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("allMatchesallOppn/")
IPLTeamsAll <- gsub(".RData","",a2)
