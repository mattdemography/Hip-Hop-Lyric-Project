library(rvest)
library(magrittr)
library(tidyr)
library(XML)
library(RCurl)
library(stringr)
library(rjson)
library(jsonlite)

artid<-21742

tab<-data.frame(Year=character(), Artist=character(), ID=character(), Title=character(),
                Label=character())
artists<-fromJSON(paste("https://api.discogs.com/artists/",artid,"/releases?page=1&per_page=100",sep=""))
artists2<-fromJSON(paste("https://api.discogs.com/artists/",artid,"/releases?page=2&per_page=100",sep=""))
artists3<-fromJSON(paste("https://api.discogs.com/artists/",artid,"/releases?page=3&per_page=100",sep=""))
artists4<-fromJSON(paste("https://api.discogs.com/artists/",artid,"/releases?page=4&per_page=100",sep=""))

#Create Tables for each artist
firsttab<-as.data.frame(cbind(artists$releases$year, artists$releases$artist, 
                              artists$releases$id, artists$releases$title, artists$releases$label))
secondtab<-as.data.frame(cbind(artists2$releases$year, artists2$releases$artist, 
                              artists2$releases$id, artists2$releases$title, artists2$releases$label))
thirdtab<-as.data.frame(cbind(artists3$releases$year, artists3$releases$artist, 
                               artists3$releases$id, artists3$releases$title, artists3$releases$label))
fourthtab<-as.data.frame(cbind(artists4$releases$year, artists4$releases$artist, 
                              artists4$releases$id, artists4$releases$title, artists4$releases$label))

#Bind together all tables for each artist
tab<-rbind(firsttab, secondtab, thirdtab, fourthtab)

tab$Year<-tab$V1
tab$Artist<-tab$V2
tab$ID<-tab$V3
tab$Title<-tab$V4
tab$Label<-tab$V5

tab<-tab[,6:10]

tab<-tab[order(tab$Year),]


ispresent<-data.frame(playerid=character(), player=character(), year=character())
tab<-data.frame(playerid=character(), player=character(), year=character())

######Create Loop#####
for(i in 1:rows){
  tryCatch({
    html<- read_html(theurl[i])
    Grab <-html_node(html, "table#stats.stats_table")
    text <-html_text(Grab)
    
    #Transform into a table
    table<-html_table(Grab)
    colnames(table)=table[1,]
    table$Player<-player[i]
    table$ID<-playerid[i]
    table$Year<-year[i]
    table$First<-first[i]
    table$Last<-last[i]
    all<-rbind(all, table)
    
    tab<-as.data.frame(playerid[i])
    tab$player<-player[i]
    tab$year<-year[i]
    ispresent<-rbind(ispresent,tab)
  }, error=function(e){cat(conditionMessage(e))})
  
}