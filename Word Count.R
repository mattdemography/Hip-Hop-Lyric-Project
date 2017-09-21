
cname<-file.path("F:/Lyrics(Cleaned)")
dir(cname)

library(tm)
library(qdap)
library(stringr)

docs<-Corpus(DirSource(cname))
#Make Periods blank
for(j in seq(docs))
{
  docs[[j]]<-gsub("[.|?|!|,|'|-|(|)|\"]"," ", docs[[j]])
  docs[[j]]<-gsub("1 ","one ", docs[[j]])
  docs[[j]]<-gsub("2 ","two ", docs[[j]])
  docs[[j]]<-gsub("3 ","three ", docs[[j]])
  docs[[j]]<-gsub("4 ","four ", docs[[j]])
  docs[[j]]<-gsub("5 ","five ", docs[[j]])
  docs[[j]]<-gsub("6 ","six ", docs[[j]])
  docs[[j]]<-gsub("7 ","seven ", docs[[j]])
  docs[[j]]<-gsub("8 ","eight ", docs[[j]])
  docs[[j]]<-gsub("9 ","nine ", docs[[j]])
  docs[[j]]<-gsub("10 ","ten ", docs[[j]])
  docs[[j]]<-gsub("100 ","one hundred ", docs[[j]])
  docs[[j]]<-gsub("1000 ","one thousand ", docs[[j]])
  docs[[j]]<-gsub("[`]", "", docs[[j]])
  docs[[j]]<-gsub("[\r\n]", " ", docs[[j]])
  
}

#Take care of the rest of the punctuation
  docs<-tm_map(docs, removePunctuation)
#Make all lower case
  docs<-tm_map(docs, tolower)

list<-DirSource(cname)
files<-list$filelist
rows<-length(files)
all<-data.frame(Path=character(),wordcount=integer(),char=integer(), pchar=integer(), 
                uniquect=integer(), punique=integer())
tab<-data.frame(Path=character(),wordcount=integer(),char=integer(), pchar=integer(), 
                uniquect=integer(), punique=integer())


for(i in 1:rows){
  tab<-as.data.frame(files[i])
  tab$Path<-files[i]
#Count Words
  tab$wordcount<-sum(wc(docs[i], digit.remove=F))
#Character Count
  tab$char<-sum(character_count(docs[i]))
#Proportion Char/Word
  tab$pchar<-(tab$char/tab$wordcount)
#Count Unique Words
  ul <- unlist(strsplit(docs[[i]], "\\s+|[[:punct:]]"))
  tab$uniquect<-sum(wc(unique(ul)),na.rm=T)
#Proportion
  tab$punique<-(tab$uniquect/tab$wordcount)
all<-rbind(all,tab)
}

write.csv(all, "F:/WordCount.csv")
