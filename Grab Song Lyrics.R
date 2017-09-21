library(rvest)
library(plyr)
library(data.table)
library(reshape2)
library(foreign)
library(Hmisc)
library(foreign)

trim <- function( x ) {
  gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)
}

########## CREATE LOOP #############
Slist<-read.csv("c:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Data/Unique_Songs.csv")

#Make Variables Lower Case
  Slist$Song<-tolower(Slist$Song)
  Slist$MainArtist<-tolower(Slist$MainArtist)
  Slist$MainArtist<-capitalize(Slist$MainArtist)

#Remove Special Characters from Song List
  Slist$NewSong<-trim(gsub("[.|?|!|'|(|)|,|'|$|#]","", Slist$Song, perl=T))
  Slist$NewSong<-trim(gsub("&","and", Slist$NewSong))  
  Slist$NewSong<-trim(gsub("[*]","1490", Slist$NewSong, perl=T))
  Slist$NewSong<-trim(sub("1490149014901490","itch", Slist$NewSong))  
  Slist$NewSong<-trim(sub("149014901490","itch", Slist$NewSong))  
  Slist$NewSong<-trim(sub("14901490","uc", Slist$NewSong))  
  Slist$NewSong<-trim(sub("['[']","!", Slist$NewSong, perl=T))
  Slist$NewSong<-trim(sub("]","!", Slist$NewSong))
  Slist$NewSong<-trim(gsub("-"," ", Slist$NewSong))
  Slist$NewSong<-trim(gsub("[.|?|!|'|(|)|,|'|$]","", Slist$NewSong, perl=T))
  #Taking Care of Special Cases after initial cleaning
    Slist$NewSong<-trim(sub("auc","ass", Slist$NewSong))
    Slist$NewSong<-trim(sub("b1490tches","bitches", Slist$NewSong))
    Slist$NewSong<-trim(sub("bitchh","bitch", Slist$NewSong))
    Slist$NewSong<-trim(sub("h1490a1490m","ham", Slist$NewSong))
    Slist$NewSong<-trim(sub("bitch1490s","bitches", Slist$NewSong))
    Slist$NewSong<-trim(sub("1490","shit", Slist$NewSong))
    Slist$NewSong<-trim(sub("fitch","fuck", Slist$NewSong))
    Slist$NewSong<-trim(sub("nitch","nigga", Slist$NewSong))
    Slist$NewSong<-trim(sub("pitchycat","pussycat", Slist$NewSong))
    Slist$NewSong<-trim(sub("niucas","niggas", Slist$NewSong))
    Slist$NewSong<-trim(sub("suct","shit", Slist$NewSong))
    Slist$NewSong<-trim(sub("\"g\"","g", Slist$NewSong))
    Slist$NewSong<-trim(sub("\"b\"","b", Slist$NewSong))

#Remove Characters After '/' for Song
  Slist$NewSong<-trim((laply(strsplit(as.character(Slist$NewSong), split = "/"), "[",1)))
  Slist$NewSong<-trim((laply(strsplit(as.character(Slist$NewSong), split = "from"), "[",1)))

#Remove Special Characters from Song List
  Slist$NewArtist<-trim(gsub("['|@|`|-|.|?|*|!|'|(|)']","", Slist$MainArtist, perl=T))
  Slist$NewArtist<-trim(sub("[$]","s", Slist$NewArtist, perl=T))
  Slist$NewArtist<-trim(sub("['[']","", Slist$NewArtist, perl=T))
  Slist$NewArtist<-trim(gsub("-"," ", Slist$NewArtist))
  #Taking Care of Special Cases
    Slist$NewArtist<-trim(sub("Missy \"misdemeanor\" elliott","Missy elliott", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("Damian \"jr gong\" marley","Damian marley", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("Devyne stephens \"the entertainer\"","Devyne stephens", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("Jay z  kanye west","Kanye west", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("Kanye west  jay z","Kanye west", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("Magoo and timbaland","Timbaland", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("Nasty nas","Nas", Slist$NewArtist, perl=T))
    Slist$NewArtist<-trim(sub("The young and the restless","Young and restless", Slist$NewArtist, perl=T))

#Remove Characters After '&' for Artist
  Slist$NewArtist<-trim((laply(strsplit(as.character(Slist$NewArtist), split = ", | & | with | feat | or | featuring "), "[",1)))
  Slist$NewArtist<-trim((laply(strsplit(as.character(Slist$NewArtist), split = "\\+"), "[",1)))
  Slist$NewArtist2<-trim((laply(strsplit(as.character(Slist$NewArtist), split= "presents | introducing"), "[",2)))
  Slist$NewArtist3<-ifelse(is.na(Slist$NewArtist2), Slist$NewArtist, Slist$NewArtist2)
  
  Slistvar<-c("Song","MainArtist","WeeksOn", "NewSong", "NewArtist3")
  Slist<-Slist[Slistvar]
  Slist$SongID<-row.names(Slist)
  
rows<-nrow(Slist)
artist<-trim(gsub(" ","-", Slist$NewArtist3))
artist2<-trim(Slist$NewArtist3)
song<-trim(gsub(" ","-", Slist$NewSong))
id<-Slist$SongID
theurl<-paste("http://genius.com/",artist,"-",song,"-","lyrics", sep="")
ispresent<-data.frame(id=character())
tab<-data.frame(id=character())

for(i in 1:rows){
  tryCatch({
  html<- read_html(theurl[i])
  Grablyrics<-html_nodes(html, xpath="//*[contains(concat( \" \", @class, \" \" ), concat( \" \", \"lyrics\", \" \" ))]//p")
  lyrics<-html_text(Grablyrics)  
  
  write.table(lyrics, paste("c:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/LyricsNew/",artist2[i],"_",id[i],".txt", sep = ""))
  tab<-as.data.frame(id[i])
  ispresent<-rbind(ispresent,tab)
  }, error=function(e){cat(conditionMessage(e))})
}

#Create Matching Variable
  ispresent$SongID<-(ispresent$`id[i]`)
  ispresent$Match<-"Yes"

#Merge Matching variable with full table keeping all observations regardless of match
CapturedSongs<-merge(ispresent, Slist, by="SongID",all.x=TRUE, all.y=TRUE)
CapturedSongs$Match<-ifelse(is.na(CapturedSongs$Match), "No", "Yes")

#Keep Only unique songs
AllSongs<-aggregate(numeric(nrow(CapturedSongs)), CapturedSongs[c("SongID", "Match", "Song", "MainArtist", "WeeksOn",
                                                                  "NewSong", "NewArtist3")], length)

write.csv(AllSongs, "c:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Data/SongsCaptured.csv", row.names = F)

#Keep only songs that did not match
Fixsongs<-AllSongs[which(AllSongs$Match=='No'),]

#Generate URL to test
  artist<-trim(gsub(" ","-", Fixsongs$NewArtist3))
  song<-trim(gsub(" ","-", Fixsongs$NewSong))
  Fixsongs$theurl<-paste("http://genius.com/",artist,"-",song,"-","lyrics", sep="")
  
########Transfer to SAS to make edits to URL then bring back when done.
  write.foreign(Fixsongs, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/FixSongs.txt",
                "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/FixSongs.sas", package="SAS")
  Flist<-read.csv("c:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Data/FixSongs.csv")
  
  Flist<-Flist[which((Flist$newurl!="")),]
  rows<-nrow(Flist)
  artist<-trim(gsub(" ","-", Flist$NewArtist3))
  artist2<-trim(Flist$NewArtist3)
  song<-trim(gsub(" ","-", Flist$NewSong))
  id<-Flist$SongID
  theurl<-paste(Flist$newurl)
  ispresent<-data.frame(id=character())
  tab<-data.frame(id=character())
  
  for(i in 1:rows){
    tryCatch({
      html<- read_html(theurl[i])
      Grablyrics<-html_nodes(html, xpath="//*[contains(concat( \" \", @class, \" \" ), concat( \" \", \"lyrics\", \" \" ))]//p")
      lyrics<-html_text(Grablyrics)  
      
      write.table(lyrics, paste("c:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/LyricsNew/",artist2[i],"_",id[i],".txt", sep = ""))
      tab<-as.data.frame(id[i])
      ispresent<-rbind(ispresent,tab)
    }, error=function(e){cat(conditionMessage(e))})
  }
  
  #Create Matching Variable
  ispresent$SongID<-(ispresent$`id[i]`)
  ispresent$Match2<-"Yes"
  
  #Merge Matching variable with full table keeping all observations regardless of match
  CapturedSongs2<-merge(ispresent, Flist, by="SongID",all.x=TRUE, all.y=TRUE)
  CapturedSongs2$Match2<-ifelse(is.na(CapturedSongs$Match2), "No", "Yes")


  