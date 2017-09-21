library(rvest)
library(plyr)
library(data.table)
library(reshape2)
library(foreign)

trim <- function( x ) {
  gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)
}

########## CREATE LOOP #############
Blist<-read.dta("c:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Billboard_dates.dta")
rows<-nrow(Blist)
dateid<-Blist$date
monthid<-Blist$monthid
year<-Blist$year
theurl<-paste("http://www.billboard.com/charts/rap-song/",year,"-",monthid,"-",dateid, sep="")
final1<-data.frame(row=character(),songs=character(),artists=character(),
                  Year=character(), Month=character(),Date=character(), Rank=character())

for(i in 1:700){
  html<- read_html(theurl[i])
  
  Grabsongs <-html_nodes(html, xpath= "//h2")
  Grabartists <-html_nodes(html, xpath= "//h3")
  songs <-html_text(Grabsongs)
  artists<-html_text(Grabartists)
  
  #Transform to Table
  tabsong1<-data.table(songs,sep="auto")
  tabart1<-data.table(artists, sep="auto")
  
  tabsong<-as.data.frame(tabsong1[grep("This Week In|Hot Rap Songs", tabsong1$songs, invert =TRUE),])
  tabsong<-tabsong[1]
  tabsong<-as.data.frame(tabsong[c(1:15),])
  tabsong$row<-(1:nrow(tabsong))
  tabart<-as.data.frame(tabart1[c(1:10, 12:16),])
  tabart<-tabart[1]
  tabart$row<-(1:nrow(tabart))
  
  #Bind Artist and Song Together
  taball<-merge(tabsong,tabart, by.y="row")
  taball$Year<-year[i]
  taball$Month<-monthid[i]
  taball$Date<-dateid[i]
  taball$Rank<-(1:nrow(taball))
  final1<-rbind(final1,taball)
   }

names(final1)
final1$MainArtist<-trim((laply(strsplit(as.character(final1$artists), split = "Featuring | Featruing"), "[",1)))
final1$FeatArtist<-trim((laply(strsplit(as.character(final1$artists), split = "Featuring | Featruing"), "[",2)))
final1$Song<-trim(final1$`tabsong[c(1:15), ]`)
final1$Artists<-trim(final1$artists)
names(final1)
write.csv(final1,file="C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/final1.csv")

#Next 349
final2<-data.frame(row=character(),songs=character(),artists=character(),
                   Year=character(), Month=character(),Date=character(), Rank=character())

for(i in 701:1349){
  html<- read_html(theurl[i])
  
  Grabsongs <-html_nodes(html, xpath= "//h2")
  Grabartists <-html_nodes(html, xpath= "//h3")
  songs <-html_text(Grabsongs)
  artists<-html_text(Grabartists)
  
  #Transform to Table
  tabsong1<-data.table(songs,sep="auto")
  tabart1<-data.table(artists, sep="auto")
  
  tabsong<-as.data.frame(tabsong1[grep("This Week In|Hot Rap Songs", tabsong1$songs, invert =TRUE),])
  tabsong<-tabsong[1]
  tabsong<-as.data.frame(tabsong[c(1:15),])
  tabsong$row<-(1:nrow(tabsong))
  tabart<-as.data.frame(tabart1[c(1:10, 12:16),])
  tabart<-tabart[1]
  tabart$row<-(1:nrow(tabart))
  
  #Bind Artist and Song Together
  taball<-merge(tabsong,tabart, by.y="row")
  taball$Year<-year[i]
  taball$Month<-monthid[i]
  taball$Date<-dateid[i]
  taball$Rank<-(1:nrow(taball))
  final2<-rbind(final2,taball)
}

names(final2)
final2$MainArtist<-trim((laply(strsplit(as.character(final2$artists), split = "Featuring | Featruing"), "[",1)))
final2$FeatArtist<-trim((laply(strsplit(as.character(final2$artists), split = "Featuring | Featruing"), "[",2)))
final2$Song<-trim(final2$`tabsong[c(1:15), ]`)
final2$Artists<-trim(final2$artists)
names(final2)
write.csv(final2,file="C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/final2.csv")

#Combine Tables
table(final1$Year)
table(final2$Year)
table(Blist$year)

finalfinal<-rbind(final1,final2)

dropvar<-names(finalfinal) %in% c("row", "tabsong[c(1:15), ]", "artists")
finalfinal<-finalfinal[!dropvar]

library(foreign)
write.csv(finalfinal,file="C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Complete_Songs.csv", row.names = F)
write.foreign(finalfinal, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Complete_Songs.txt",
              "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Complete_Songs.sas", package="SAS")

#Create Table with Unique Song+Artist Combination
WeeksOn<-aggregate(numeric(nrow(finalfinal)), finalfinal[c("Song", "MainArtist", "Rank")], length)
WeeksOn<-rename(WeeksOn, c(x="WeeksOn"))
WeeksOn<-WeeksOn[order(WeeksOn$MainArtist),]
write.csv(WeeksOn,file="C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/TimeOnList.csv", row.names = F)
write.foreign(WeeksOn, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/TimeOnList.txt",
              "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/TimeOnList.sas", package="SAS")

UniqueSongs<-aggregate(numeric(nrow(finalfinal)), finalfinal[c("Song", "MainArtist")], length)
UniqueSongs<-UniqueSongs[order(UniqueSongs$MainArtist),]
UniqueSongs<-rename(UniqueSongs, c(x="WeeksOn"))
write.csv(UniqueSongs,file="C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Unique_Songs.csv", row.names = F)
write.foreign(UniqueSongs, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Unique_Songs.txt",
              "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Unique_Songs.sas", package="SAS")
