library(rvest)
library(plyr)
library(data.table)
library(reshape2)

############ Generate List of Dates ########
list89<- read_html("http://www.billboard.com/archive/charts/1989/rap-song")
list90<- read_html("http://www.billboard.com/archive/charts/1990/rap-song")
list91<- read_html("http://www.billboard.com/archive/charts/1991/rap-song")
list92<- read_html("http://www.billboard.com/archive/charts/1992/rap-song")
list93<- read_html("http://www.billboard.com/archive/charts/1993/rap-song")
list94<- read_html("http://www.billboard.com/archive/charts/1994/rap-song")
list95<- read_html("http://www.billboard.com/archive/charts/1995/rap-song")
list96<- read_html("http://www.billboard.com/archive/charts/1996/rap-song")
list97<- read_html("http://www.billboard.com/archive/charts/1997/rap-song")
list98<- read_html("http://www.billboard.com/archive/charts/1998/rap-song")
list99<- read_html("http://www.billboard.com/archive/charts/1999/rap-song")
list00<- read_html("http://www.billboard.com/archive/charts/2000/rap-song")
list01<- read_html("http://www.billboard.com/archive/charts/2001/rap-song")
list02<- read_html("http://www.billboard.com/archive/charts/2002/rap-song")
list03<- read_html("http://www.billboard.com/archive/charts/2003/rap-song")
list04<- read_html("http://www.billboard.com/archive/charts/2004/rap-song")
list05<- read_html("http://www.billboard.com/archive/charts/2005/rap-song")
list06<- read_html("http://www.billboard.com/archive/charts/2006/rap-song")
list07<- read_html("http://www.billboard.com/archive/charts/2007/rap-song")
list08<- read_html("http://www.billboard.com/archive/charts/2008/rap-song")
list09<- read_html("http://www.billboard.com/archive/charts/2009/rap-song")
list10<- read_html("http://www.billboard.com/archive/charts/2010/rap-song")
list11<- read_html("http://www.billboard.com/archive/charts/2011/rap-song")
list12<- read_html("http://www.billboard.com/archive/charts/2012/rap-song")
list13<- read_html("http://www.billboard.com/archive/charts/2013/rap-song")
list14<- read_html("http://www.billboard.com/archive/charts/2014/rap-song")
list15<- read_html("http://www.billboard.com/archive/charts/2015/rap-song")

Grablist15<-html_nodes(list15, xpath="//td")
list15a<-html_text(Grablist15)
tablist15<-data.table(list15a,sep="auto")
flist15<-tablist15[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist15$list15a), ]
flist15$newdate<-(gsub('\n','',flist15$list15a))
flist15$newdate<-(trimws(flist15$newdate))
flist15<-as.data.frame(ldply(strsplit(flist15$newdate, split=" ")))
flist15$Month<-flist15$V1
flist15$Date<-flist15$V2
flist15$Year="2015"
attach(flist15)
flist15$MonthID[flist15$Month=="January"]<- "01"
flist15$MonthID[flist15$Month=="February"]<-"02"
flist15$MonthID[flist15$Month=="March"]<-"03"
flist15$MonthID[flist15$Month=="April"]<-"04"
flist15$MonthID[flist15$Month=="May"]<-"05"
flist15$MonthID[flist15$Month=="June"]<-"06"
flist15$MonthID[flist15$Month=="July"]<-"07"
flist15$MonthID[flist15$Month=="August"]<-"08"
flist15$MonthID[flist15$Month=="September"]<-"09"
flist15$MonthID[flist15$Month=="October"]<-"10"
flist15$MonthID[flist15$Month=="November"]<-"11"
flist15$MonthID[flist15$Month=="December"]<-"12"
detach(flist15)

Grablist14<-html_nodes(list14, xpath="//td")
list14a<-html_text(Grablist14)
tablist14<-data.table(list14a,sep="auto")
flist14<-tablist14[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist14$list14a), ]
flist14$newdate<-(gsub('\n','',flist14$list14a))
flist14$newdate<-(trimws(flist14$newdate))
flist14<-as.data.frame(ldply(strsplit(flist14$newdate, split=" ")))
flist14$Month<-flist14$V1
flist14$Date<-flist14$V2
flist14$Year="2014"
attach(flist14)
flist14$MonthID[flist14$Month=="January"]<- "01"
flist14$MonthID[flist14$Month=="February"]<-"02"
flist14$MonthID[flist14$Month=="March"]<-"03"
flist14$MonthID[flist14$Month=="April"]<-"04"
flist14$MonthID[flist14$Month=="May"]<-"05"
flist14$MonthID[flist14$Month=="June"]<-"06"
flist14$MonthID[flist14$Month=="July"]<-"07"
flist14$MonthID[flist14$Month=="August"]<-"08"
flist14$MonthID[flist14$Month=="September"]<-"09"
flist14$MonthID[flist14$Month=="October"]<-"10"
flist14$MonthID[flist14$Month=="November"]<-"11"
flist14$MonthID[flist14$Month=="December"]<-"12"
detach(flist14)

Grablist13<-html_nodes(list13, xpath="//td")
list13a<-html_text(Grablist13)
tablist13<-data.table(list13a,sep="auto")
flist13<-tablist13[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist13$list13a), ]
flist13$newdate<-(gsub('\n','',flist13$list13a))
flist13$newdate<-(trimws(flist13$newdate))
flist13<-as.data.frame(ldply(strsplit(flist13$newdate, split=" ")))
flist13$Month<-flist13$V1
flist13$Date<-flist13$V2
flist13$Year="2013"
attach(flist13)
flist13$MonthID[flist13$Month=="January"]<- "01"
flist13$MonthID[flist13$Month=="February"]<-"02"
flist13$MonthID[flist13$Month=="March"]<-"03"
flist13$MonthID[flist13$Month=="April"]<-"04"
flist13$MonthID[flist13$Month=="May"]<-"05"
flist13$MonthID[flist13$Month=="June"]<-"06"
flist13$MonthID[flist13$Month=="July"]<-"07"
flist13$MonthID[flist13$Month=="August"]<-"08"
flist13$MonthID[flist13$Month=="September"]<-"09"
flist13$MonthID[flist13$Month=="October"]<-"10"
flist13$MonthID[flist13$Month=="November"]<-"11"
flist13$MonthID[flist13$Month=="December"]<-"12"
detach(flist13)

Grablist12<-html_nodes(list12, xpath="//td")
list12a<-html_text(Grablist12)
tablist12<-data.table(list12a,sep="auto")
flist12<-tablist12[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist12$list12a), ]
flist12$newdate<-(gsub('\n','',flist12$list12a))
flist12$newdate<-(trimws(flist12$newdate))
flist12<-as.data.frame(ldply(strsplit(flist12$newdate, split=" ")))
flist12$Month<-flist12$V1
flist12$Date<-flist12$V2
flist12$Year="2012"
attach(flist12)
flist12$MonthID[flist12$Month=="January"]<- "01"
flist12$MonthID[flist12$Month=="February"]<-"02"
flist12$MonthID[flist12$Month=="March"]<-"03"
flist12$MonthID[flist12$Month=="April"]<-"04"
flist12$MonthID[flist12$Month=="May"]<-"05"
flist12$MonthID[flist12$Month=="June"]<-"06"
flist12$MonthID[flist12$Month=="July"]<-"07"
flist12$MonthID[flist12$Month=="August"]<-"08"
flist12$MonthID[flist12$Month=="September"]<-"09"
flist12$MonthID[flist12$Month=="October"]<-"10"
flist12$MonthID[flist12$Month=="November"]<-"11"
flist12$MonthID[flist12$Month=="December"]<-"12"
detach(flist12)

Grablist11<-html_nodes(list11, xpath="//td")
list11a<-html_text(Grablist11)
tablist11<-data.table(list11a,sep="auto")
flist11<-tablist11[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist11$list11a), ]
flist11$newdate<-(gsub('\n','',flist11$list11a))
flist11$newdate<-(trimws(flist11$newdate))
flist11<-as.data.frame(ldply(strsplit(flist11$newdate, split=" ")))
flist11$Month<-flist11$V1
flist11$Date<-flist11$V2
flist11$Year="2011"
attach(flist11)
flist11$MonthID[flist11$Month=="January"]<- "01"
flist11$MonthID[flist11$Month=="February"]<-"02"
flist11$MonthID[flist11$Month=="March"]<-"03"
flist11$MonthID[flist11$Month=="April"]<-"04"
flist11$MonthID[flist11$Month=="May"]<-"05"
flist11$MonthID[flist11$Month=="June"]<-"06"
flist11$MonthID[flist11$Month=="July"]<-"07"
flist11$MonthID[flist11$Month=="August"]<-"08"
flist11$MonthID[flist11$Month=="September"]<-"09"
flist11$MonthID[flist11$Month=="October"]<-"10"
flist11$MonthID[flist11$Month=="November"]<-"11"
flist11$MonthID[flist11$Month=="December"]<-"12"
detach(flist11)

Grablist10<-html_nodes(list10, xpath="//td")
list10a<-html_text(Grablist10)
tablist10<-data.table(list10a,sep="auto")
flist10<-tablist10[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist10$list10a), ]
flist10$newdate<-(gsub('\n','',flist10$list10a))
flist10$newdate<-(trimws(flist10$newdate))
flist10<-as.data.frame(ldply(strsplit(flist10$newdate, split=" ")))
flist10$Month<-flist10$V1
flist10$Date<-flist10$V2
flist10$Year="2010"
attach(flist10)
flist10$MonthID[flist10$Month=="January"]<- "01"
flist10$MonthID[flist10$Month=="February"]<-"02"
flist10$MonthID[flist10$Month=="March"]<-"03"
flist10$MonthID[flist10$Month=="April"]<-"04"
flist10$MonthID[flist10$Month=="May"]<-"05"
flist10$MonthID[flist10$Month=="June"]<-"06"
flist10$MonthID[flist10$Month=="July"]<-"07"
flist10$MonthID[flist10$Month=="August"]<-"08"
flist10$MonthID[flist10$Month=="September"]<-"09"
flist10$MonthID[flist10$Month=="October"]<-"10"
flist10$MonthID[flist10$Month=="November"]<-"11"
flist10$MonthID[flist10$Month=="December"]<-"12"
detach(flist10)

Grablist09<-html_nodes(list09, xpath="//td")
list09a<-html_text(Grablist09)
tablist09<-data.table(list09a,sep="auto")
flist09<-tablist09[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist09$list09a), ]
flist09$newdate<-(gsub('\n','',flist09$list09a))
flist09$newdate<-(trimws(flist09$newdate))
flist09<-as.data.frame(ldply(strsplit(flist09$newdate, split=" ")))
flist09$Month<-flist09$V1
flist09$Date<-flist09$V2
flist09$Year="2009"
attach(flist09)
flist09$MonthID[flist09$Month=="January"]<- "01"
flist09$MonthID[flist09$Month=="February"]<-"02"
flist09$MonthID[flist09$Month=="March"]<-"03"
flist09$MonthID[flist09$Month=="April"]<-"04"
flist09$MonthID[flist09$Month=="May"]<-"05"
flist09$MonthID[flist09$Month=="June"]<-"06"
flist09$MonthID[flist09$Month=="July"]<-"07"
flist09$MonthID[flist09$Month=="August"]<-"08"
flist09$MonthID[flist09$Month=="September"]<-"09"
flist09$MonthID[flist09$Month=="October"]<-"10"
flist09$MonthID[flist09$Month=="November"]<-"11"
flist09$MonthID[flist09$Month=="December"]<-"12"
detach(flist09)

Grablist08<-html_nodes(list08, xpath="//td")
list08a<-html_text(Grablist08)
tablist08<-data.table(list08a,sep="auto")
flist08<-tablist08[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist08$list08a), ]
flist08$newdate<-(gsub('\n','',flist08$list08a))
flist08$newdate<-(trimws(flist08$newdate))
flist08<-as.data.frame(ldply(strsplit(flist08$newdate, split=" ")))
flist08$Month<-flist08$V1
flist08$Date<-flist08$V2
flist08$Year="2008"
attach(flist08)
flist08$MonthID[flist08$Month=="January"]<- "01"
flist08$MonthID[flist08$Month=="February"]<-"02"
flist08$MonthID[flist08$Month=="March"]<-"03"
flist08$MonthID[flist08$Month=="April"]<-"04"
flist08$MonthID[flist08$Month=="May"]<-"05"
flist08$MonthID[flist08$Month=="June"]<-"06"
flist08$MonthID[flist08$Month=="July"]<-"07"
flist08$MonthID[flist08$Month=="August"]<-"08"
flist08$MonthID[flist08$Month=="September"]<-"09"
flist08$MonthID[flist08$Month=="October"]<-"10"
flist08$MonthID[flist08$Month=="November"]<-"11"
flist08$MonthID[flist08$Month=="December"]<-"12"
detach(flist08)

Grablist07<-html_nodes(list07, xpath="//td")
list07a<-html_text(Grablist07)
tablist07<-data.table(list07a,sep="auto")
flist07<-tablist07[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist07$list07a), ]
flist07$newdate<-(gsub('\n','',flist07$list07a))
flist07$newdate<-(trimws(flist07$newdate))
flist07<-as.data.frame(ldply(strsplit(flist07$newdate, split=" ")))
flist07$Month<-flist07$V1
flist07$Date<-flist07$V2
flist07$Year="2007"
attach(flist07)
flist07$MonthID[flist07$Month=="January"]<- "01"
flist07$MonthID[flist07$Month=="February"]<-"02"
flist07$MonthID[flist07$Month=="March"]<-"03"
flist07$MonthID[flist07$Month=="April"]<-"04"
flist07$MonthID[flist07$Month=="May"]<-"05"
flist07$MonthID[flist07$Month=="June"]<-"06"
flist07$MonthID[flist07$Month=="July"]<-"07"
flist07$MonthID[flist07$Month=="August"]<-"08"
flist07$MonthID[flist07$Month=="September"]<-"09"
flist07$MonthID[flist07$Month=="October"]<-"10"
flist07$MonthID[flist07$Month=="November"]<-"11"
flist07$MonthID[flist07$Month=="December"]<-"12"
detach(flist07)

Grablist06<-html_nodes(list06, xpath="//td")
list06a<-html_text(Grablist06)
tablist06<-data.table(list06a,sep="auto")
flist06<-tablist06[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist06$list06a), ]
flist06$newdate<-(gsub('\n','',flist06$list06a))
flist06$newdate<-(trimws(flist06$newdate))
flist06<-as.data.frame(ldply(strsplit(flist06$newdate, split=" ")))
flist06$Month<-flist06$V1
flist06$Date<-flist06$V2
flist06$Year="2006"
attach(flist06)
flist06$MonthID[flist06$Month=="January"]<- "01"
flist06$MonthID[flist06$Month=="February"]<-"02"
flist06$MonthID[flist06$Month=="March"]<-"03"
flist06$MonthID[flist06$Month=="April"]<-"04"
flist06$MonthID[flist06$Month=="May"]<-"05"
flist06$MonthID[flist06$Month=="June"]<-"06"
flist06$MonthID[flist06$Month=="July"]<-"07"
flist06$MonthID[flist06$Month=="August"]<-"08"
flist06$MonthID[flist06$Month=="September"]<-"09"
flist06$MonthID[flist06$Month=="October"]<-"10"
flist06$MonthID[flist06$Month=="November"]<-"11"
flist06$MonthID[flist06$Month=="December"]<-"12"
detach(flist06)

Grablist05<-html_nodes(list05, xpath="//td")
list05a<-html_text(Grablist05)
tablist05<-data.table(list05a,sep="auto")
flist05<-tablist05[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist05$list05a), ]
flist05$newdate<-(gsub('\n','',flist05$list05a))
flist05$newdate<-(trimws(flist05$newdate))
flist05<-as.data.frame(ldply(strsplit(flist05$newdate, split=" ")))
flist05$Month<-flist05$V1
flist05$Date<-flist05$V2
flist05$Year="2005"
attach(flist05)
flist05$MonthID[flist05$Month=="January"]<- "01"
flist05$MonthID[flist05$Month=="February"]<-"02"
flist05$MonthID[flist05$Month=="March"]<-"03"
flist05$MonthID[flist05$Month=="April"]<-"04"
flist05$MonthID[flist05$Month=="May"]<-"05"
flist05$MonthID[flist05$Month=="June"]<-"06"
flist05$MonthID[flist05$Month=="July"]<-"07"
flist05$MonthID[flist05$Month=="August"]<-"08"
flist05$MonthID[flist05$Month=="September"]<-"09"
flist05$MonthID[flist05$Month=="October"]<-"10"
flist05$MonthID[flist05$Month=="November"]<-"11"
flist05$MonthID[flist05$Month=="December"]<-"12"
detach(flist05)

Grablist04<-html_nodes(list04, xpath="//td")
list04a<-html_text(Grablist04)
tablist04<-data.table(list04a,sep="auto")
flist04<-tablist04[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist04$list04a), ]
flist04$newdate<-(gsub('\n','',flist04$list04a))
flist04$newdate<-(trimws(flist04$newdate))
flist04<-as.data.frame(ldply(strsplit(flist04$newdate, split=" ")))
flist04$Month<-flist04$V1
flist04$Date<-flist04$V2
flist04$Year="2004"
attach(flist04)
flist04$MonthID[flist04$Month=="January"]<- "01"
flist04$MonthID[flist04$Month=="February"]<-"02"
flist04$MonthID[flist04$Month=="March"]<-"03"
flist04$MonthID[flist04$Month=="April"]<-"04"
flist04$MonthID[flist04$Month=="May"]<-"05"
flist04$MonthID[flist04$Month=="June"]<-"06"
flist04$MonthID[flist04$Month=="July"]<-"07"
flist04$MonthID[flist04$Month=="August"]<-"08"
flist04$MonthID[flist04$Month=="September"]<-"09"
flist04$MonthID[flist04$Month=="October"]<-"10"
flist04$MonthID[flist04$Month=="November"]<-"11"
flist04$MonthID[flist04$Month=="December"]<-"12"
detach(flist04)

Grablist03<-html_nodes(list03, xpath="//td")
list03a<-html_text(Grablist03)
tablist03<-data.table(list03a,sep="auto")
flist03<-tablist03[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist03$list03a), ]
flist03$newdate<-(gsub('\n','',flist03$list03a))
flist03$newdate<-(trimws(flist03$newdate))
flist03<-as.data.frame(ldply(strsplit(flist03$newdate, split=" ")))
flist03$Month<-flist03$V1
flist03$Date<-flist03$V2
flist03$Year="2003"
attach(flist03)
flist03$MonthID[flist03$Month=="January"]<- "01"
flist03$MonthID[flist03$Month=="February"]<-"02"
flist03$MonthID[flist03$Month=="March"]<-"03"
flist03$MonthID[flist03$Month=="April"]<-"04"
flist03$MonthID[flist03$Month=="May"]<-"05"
flist03$MonthID[flist03$Month=="June"]<-"06"
flist03$MonthID[flist03$Month=="July"]<-"07"
flist03$MonthID[flist03$Month=="August"]<-"08"
flist03$MonthID[flist03$Month=="September"]<-"09"
flist03$MonthID[flist03$Month=="October"]<-"10"
flist03$MonthID[flist03$Month=="November"]<-"11"
flist03$MonthID[flist03$Month=="December"]<-"12"
detach(flist03)

Grablist02<-html_nodes(list02, xpath="//td")
list02a<-html_text(Grablist02)
tablist02<-data.table(list02a,sep="auto")
flist02<-tablist02[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist02$list02a), ]
flist02$newdate<-(gsub('\n','',flist02$list02a))
flist02$newdate<-(trimws(flist02$newdate))
flist02<-as.data.frame(ldply(strsplit(flist02$newdate, split=" ")))
flist02$Month<-flist02$V1
flist02$Date<-flist02$V2
flist02$Year="2002"
attach(flist02)
flist02$MonthID[flist02$Month=="January"]<- "01"
flist02$MonthID[flist02$Month=="February"]<-"02"
flist02$MonthID[flist02$Month=="March"]<-"03"
flist02$MonthID[flist02$Month=="April"]<-"04"
flist02$MonthID[flist02$Month=="May"]<-"05"
flist02$MonthID[flist02$Month=="June"]<-"06"
flist02$MonthID[flist02$Month=="July"]<-"07"
flist02$MonthID[flist02$Month=="August"]<-"08"
flist02$MonthID[flist02$Month=="September"]<-"09"
flist02$MonthID[flist02$Month=="October"]<-"10"
flist02$MonthID[flist02$Month=="November"]<-"11"
flist02$MonthID[flist02$Month=="December"]<-"12"
detach(flist02)

Grablist01<-html_nodes(list01, xpath="//td")
list01a<-html_text(Grablist01)
tablist01<-data.table(list01a,sep="auto")
flist01<-tablist01[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist01$list01a), ]
flist01$newdate<-(gsub('\n','',flist01$list01a))
flist01$newdate<-(trimws(flist01$newdate))
flist01<-as.data.frame(ldply(strsplit(flist01$newdate, split=" ")))
flist01$Month<-flist01$V1
flist01$Date<-flist01$V2
flist01$Year="2001"
attach(flist01)
flist01$MonthID[flist01$Month=="January"]<- "01"
flist01$MonthID[flist01$Month=="February"]<-"02"
flist01$MonthID[flist01$Month=="March"]<-"03"
flist01$MonthID[flist01$Month=="April"]<-"04"
flist01$MonthID[flist01$Month=="May"]<-"05"
flist01$MonthID[flist01$Month=="June"]<-"06"
flist01$MonthID[flist01$Month=="July"]<-"07"
flist01$MonthID[flist01$Month=="August"]<-"08"
flist01$MonthID[flist01$Month=="September"]<-"09"
flist01$MonthID[flist01$Month=="October"]<-"10"
flist01$MonthID[flist01$Month=="November"]<-"11"
flist01$MonthID[flist01$Month=="December"]<-"12"
detach(flist01)

Grablist00<-html_nodes(list00, xpath="//td")
list00a<-html_text(Grablist00)
tablist00<-data.table(list00a,sep="auto")
flist00<-tablist00[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist00$list00a), ]
flist00$newdate<-(gsub('\n','',flist00$list00a))
flist00$newdate<-(trimws(flist00$newdate))
flist00<-as.data.frame(ldply(strsplit(flist00$newdate, split=" ")))
flist00$Month<-flist00$V1
flist00$Date<-flist00$V2
flist00$Year="2000"
attach(flist00)
flist00$MonthID[flist00$Month=="January"]<- "01"
flist00$MonthID[flist00$Month=="February"]<-"02"
flist00$MonthID[flist00$Month=="March"]<-"03"
flist00$MonthID[flist00$Month=="April"]<-"04"
flist00$MonthID[flist00$Month=="May"]<-"05"
flist00$MonthID[flist00$Month=="June"]<-"06"
flist00$MonthID[flist00$Month=="July"]<-"07"
flist00$MonthID[flist00$Month=="August"]<-"08"
flist00$MonthID[flist00$Month=="September"]<-"09"
flist00$MonthID[flist00$Month=="October"]<-"10"
flist00$MonthID[flist00$Month=="November"]<-"11"
flist00$MonthID[flist00$Month=="December"]<-"12"
detach(flist00)

Grablist99<-html_nodes(list99, xpath="//td")
list99a<-html_text(Grablist99)
tablist99<-data.table(list99a,sep="auto")
flist99<-tablist99[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist99$list99a), ]
flist99$newdate<-(gsub('\n','',flist99$list99a))
flist99$newdate<-(trimws(flist99$newdate))
flist99<-as.data.frame(ldply(strsplit(flist99$newdate, split=" ")))
flist99$Month<-flist99$V1
flist99$Date<-flist99$V2
flist99$Year="1999"
attach(flist99)
flist99$MonthID[flist99$Month=="January"]<- "01"
flist99$MonthID[flist99$Month=="February"]<-"02"
flist99$MonthID[flist99$Month=="March"]<-"03"
flist99$MonthID[flist99$Month=="April"]<-"04"
flist99$MonthID[flist99$Month=="May"]<-"05"
flist99$MonthID[flist99$Month=="June"]<-"06"
flist99$MonthID[flist99$Month=="July"]<-"07"
flist99$MonthID[flist99$Month=="August"]<-"08"
flist99$MonthID[flist99$Month=="September"]<-"09"
flist99$MonthID[flist99$Month=="October"]<-"10"
flist99$MonthID[flist99$Month=="November"]<-"11"
flist99$MonthID[flist99$Month=="December"]<-"12"
detach(flist99)

Grablist98<-html_nodes(list98, xpath="//td")
list98a<-html_text(Grablist98)
tablist98<-data.table(list98a,sep="auto")
flist98<-tablist98[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist98$list98a), ]
flist98$newdate<-(gsub('\n','',flist98$list98a))
flist98$newdate<-(trimws(flist98$newdate))
flist98<-as.data.frame(ldply(strsplit(flist98$newdate, split=" ")))
flist98$Month<-flist98$V1
flist98$Date<-flist98$V2
flist98$Year="1998"
attach(flist98)
flist98$MonthID[flist98$Month=="January"]<- "01"
flist98$MonthID[flist98$Month=="February"]<-"02"
flist98$MonthID[flist98$Month=="March"]<-"03"
flist98$MonthID[flist98$Month=="April"]<-"04"
flist98$MonthID[flist98$Month=="May"]<-"05"
flist98$MonthID[flist98$Month=="June"]<-"06"
flist98$MonthID[flist98$Month=="July"]<-"07"
flist98$MonthID[flist98$Month=="August"]<-"08"
flist98$MonthID[flist98$Month=="September"]<-"09"
flist98$MonthID[flist98$Month=="October"]<-"10"
flist98$MonthID[flist98$Month=="November"]<-"11"
flist98$MonthID[flist98$Month=="December"]<-"12"
detach(flist98)

Grablist97<-html_nodes(list97, xpath="//td")
list97a<-html_text(Grablist97)
tablist97<-data.table(list97a,sep="auto")
flist97<-tablist97[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist97$list97a), ]
flist97$newdate<-(gsub('\n','',flist97$list97a))
flist97$newdate<-(trimws(flist97$newdate))
flist97<-as.data.frame(ldply(strsplit(flist97$newdate, split=" ")))
flist97$Month<-flist97$V1
flist97$Date<-flist97$V2
flist97$Year="1997"
attach(flist97)
flist97$MonthID[flist97$Month=="January"]<- "01"
flist97$MonthID[flist97$Month=="February"]<-"02"
flist97$MonthID[flist97$Month=="March"]<-"03"
flist97$MonthID[flist97$Month=="April"]<-"04"
flist97$MonthID[flist97$Month=="May"]<-"05"
flist97$MonthID[flist97$Month=="June"]<-"06"
flist97$MonthID[flist97$Month=="July"]<-"07"
flist97$MonthID[flist97$Month=="August"]<-"08"
flist97$MonthID[flist97$Month=="September"]<-"09"
flist97$MonthID[flist97$Month=="October"]<-"10"
flist97$MonthID[flist97$Month=="November"]<-"11"
flist97$MonthID[flist97$Month=="December"]<-"12"
detach(flist97)

Grablist96<-html_nodes(list96, xpath="//td")
list96a<-html_text(Grablist96)
tablist96<-data.table(list96a,sep="auto")
flist96<-tablist96[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist96$list96a), ]
flist96$newdate<-(gsub('\n','',flist96$list96a))
flist96$newdate<-(trimws(flist96$newdate))
flist96<-as.data.frame(ldply(strsplit(flist96$newdate, split=" ")))
flist96$Month<-flist96$V1
flist96$Date<-flist96$V2
flist96$Year="1996"
attach(flist96)
flist96$MonthID[flist96$Month=="January"]<- "01"
flist96$MonthID[flist96$Month=="February"]<-"02"
flist96$MonthID[flist96$Month=="March"]<-"03"
flist96$MonthID[flist96$Month=="April"]<-"04"
flist96$MonthID[flist96$Month=="May"]<-"05"
flist96$MonthID[flist96$Month=="June"]<-"06"
flist96$MonthID[flist96$Month=="July"]<-"07"
flist96$MonthID[flist96$Month=="August"]<-"08"
flist96$MonthID[flist96$Month=="September"]<-"09"
flist96$MonthID[flist96$Month=="October"]<-"10"
flist96$MonthID[flist96$Month=="November"]<-"11"
flist96$MonthID[flist96$Month=="December"]<-"12"
detach(flist96)

Grablist95<-html_nodes(list95, xpath="//td")
list95a<-html_text(Grablist95)
tablist95<-data.table(list95a,sep="auto")
flist95<-tablist95[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist95$list95a), ]
flist95$newdate<-(gsub('\n','',flist95$list95a))
flist95$newdate<-(trimws(flist95$newdate))
flist95<-as.data.frame(ldply(strsplit(flist95$newdate, split=" ")))
flist95$Month<-flist95$V1
flist95$Date<-flist95$V2
flist95$Year="1995"
attach(flist95)
flist95$MonthID[flist95$Month=="January"]<- "01"
flist95$MonthID[flist95$Month=="February"]<-"02"
flist95$MonthID[flist95$Month=="March"]<-"03"
flist95$MonthID[flist95$Month=="April"]<-"04"
flist95$MonthID[flist95$Month=="May"]<-"05"
flist95$MonthID[flist95$Month=="June"]<-"06"
flist95$MonthID[flist95$Month=="July"]<-"07"
flist95$MonthID[flist95$Month=="August"]<-"08"
flist95$MonthID[flist95$Month=="September"]<-"09"
flist95$MonthID[flist95$Month=="October"]<-"10"
flist95$MonthID[flist95$Month=="November"]<-"11"
flist95$MonthID[flist95$Month=="December"]<-"12"
detach(flist95)

Grablist94<-html_nodes(list94, xpath="//td")
list94a<-html_text(Grablist94)
tablist94<-data.table(list94a,sep="auto")
flist94<-tablist94[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist94$list94a), ]
flist94$newdate<-(gsub('\n','',flist94$list94a))
flist94$newdate<-(trimws(flist94$newdate))
flist94<-as.data.frame(ldply(strsplit(flist94$newdate, split=" ")))
flist94$Month<-flist94$V1
flist94$Date<-flist94$V2
flist94$Year="1994"
attach(flist94)
flist94$MonthID[flist94$Month=="January"]<- "01"
flist94$MonthID[flist94$Month=="February"]<-"02"
flist94$MonthID[flist94$Month=="March"]<-"03"
flist94$MonthID[flist94$Month=="April"]<-"04"
flist94$MonthID[flist94$Month=="May"]<-"05"
flist94$MonthID[flist94$Month=="June"]<-"06"
flist94$MonthID[flist94$Month=="July"]<-"07"
flist94$MonthID[flist94$Month=="August"]<-"08"
flist94$MonthID[flist94$Month=="September"]<-"09"
flist94$MonthID[flist94$Month=="October"]<-"10"
flist94$MonthID[flist94$Month=="November"]<-"11"
flist94$MonthID[flist94$Month=="December"]<-"12"
detach(flist94)

Grablist93<-html_nodes(list93, xpath="//td")
list93a<-html_text(Grablist93)
tablist93<-data.table(list93a,sep="auto")
flist93<-tablist93[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist93$list93a), ]
flist93$newdate<-(gsub('\n','',flist93$list93a))
flist93$newdate<-(trimws(flist93$newdate))
flist93<-as.data.frame(ldply(strsplit(flist93$newdate, split=" ")))
flist93$Month<-flist93$V1
flist93$Date<-flist93$V2
flist93$Year="1993"
attach(flist93)
flist93$MonthID[flist93$Month=="January"]<- "01"
flist93$MonthID[flist93$Month=="February"]<-"02"
flist93$MonthID[flist93$Month=="March"]<-"03"
flist93$MonthID[flist93$Month=="April"]<-"04"
flist93$MonthID[flist93$Month=="May"]<-"05"
flist93$MonthID[flist93$Month=="June"]<-"06"
flist93$MonthID[flist93$Month=="July"]<-"07"
flist93$MonthID[flist93$Month=="August"]<-"08"
flist93$MonthID[flist93$Month=="September"]<-"09"
flist93$MonthID[flist93$Month=="October"]<-"10"
flist93$MonthID[flist93$Month=="November"]<-"11"
flist93$MonthID[flist93$Month=="December"]<-"12"
detach(flist93)

Grablist92<-html_nodes(list92, xpath="//td")
list92a<-html_text(Grablist92)
tablist92<-data.table(list92a,sep="auto")
flist92<-tablist92[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist92$list92a), ]
flist92$newdate<-(gsub('\n','',flist92$list92a))
flist92$newdate<-(trimws(flist92$newdate))
flist92<-as.data.frame(ldply(strsplit(flist92$newdate, split=" ")))
flist92$Month<-flist92$V1
flist92$Date<-flist92$V2
flist92$Year="1992"
attach(flist92)
flist92$MonthID[flist92$Month=="January"]<- "01"
flist92$MonthID[flist92$Month=="February"]<-"02"
flist92$MonthID[flist92$Month=="March"]<-"03"
flist92$MonthID[flist92$Month=="April"]<-"04"
flist92$MonthID[flist92$Month=="May"]<-"05"
flist92$MonthID[flist92$Month=="June"]<-"06"
flist92$MonthID[flist92$Month=="July"]<-"07"
flist92$MonthID[flist92$Month=="August"]<-"08"
flist92$MonthID[flist92$Month=="September"]<-"09"
flist92$MonthID[flist92$Month=="October"]<-"10"
flist92$MonthID[flist92$Month=="November"]<-"11"
flist92$MonthID[flist92$Month=="December"]<-"12"
detach(flist92)

Grablist91<-html_nodes(list91, xpath="//td")
list91a<-html_text(Grablist91)
tablist91<-data.table(list91a,sep="auto")
flist91<-tablist91[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist91$list91a), ]
flist91$newdate<-(gsub('\n','',flist91$list91a))
flist91$newdate<-(trimws(flist91$newdate))
flist91<-as.data.frame(ldply(strsplit(flist91$newdate, split=" ")))
flist91$Month<-flist91$V1
flist91$Date<-flist91$V2
flist91$Year="1991"
attach(flist91)
flist91$MonthID[flist91$Month=="January"]<- "01"
flist91$MonthID[flist91$Month=="February"]<-"02"
flist91$MonthID[flist91$Month=="March"]<-"03"
flist91$MonthID[flist91$Month=="April"]<-"04"
flist91$MonthID[flist91$Month=="May"]<-"05"
flist91$MonthID[flist91$Month=="June"]<-"06"
flist91$MonthID[flist91$Month=="July"]<-"07"
flist91$MonthID[flist91$Month=="August"]<-"08"
flist91$MonthID[flist91$Month=="September"]<-"09"
flist91$MonthID[flist91$Month=="October"]<-"10"
flist91$MonthID[flist91$Month=="November"]<-"11"
flist91$MonthID[flist91$Month=="December"]<-"12"
detach(flist91)

Grablist90<-html_nodes(list90, xpath="//td")
list90a<-html_text(Grablist90)
tablist90<-data.table(list90a,sep="auto")
flist90<-tablist90[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist90$list90a), ]
flist90$newdate<-(gsub('\n','',flist90$list90a))
flist90$newdate<-(trimws(flist90$newdate))
flist90<-as.data.frame(ldply(strsplit(flist90$newdate, split=" ")))
flist90$Month<-flist90$V1
flist90$Date<-flist90$V2
flist90$Year="1990"
attach(flist90)
flist90$MonthID[flist90$Month=="January"]<- "01"
flist90$MonthID[flist90$Month=="February"]<-"02"
flist90$MonthID[flist90$Month=="March"]<-"03"
flist90$MonthID[flist90$Month=="April"]<-"04"
flist90$MonthID[flist90$Month=="May"]<-"05"
flist90$MonthID[flist90$Month=="June"]<-"06"
flist90$MonthID[flist90$Month=="July"]<-"07"
flist90$MonthID[flist90$Month=="August"]<-"08"
flist90$MonthID[flist90$Month=="September"]<-"09"
flist90$MonthID[flist90$Month=="October"]<-"10"
flist90$MonthID[flist90$Month=="November"]<-"11"
flist90$MonthID[flist90$Month=="December"]<-"12"
detach(flist90)

Grablist89<-html_nodes(list89, xpath="//td")
list89a<-html_text(Grablist89)
tablist89<-data.table(list89a,sep="auto")
flist89<-tablist89[grep("January [0-9]| February [0-9]| March [0-9]|April [0-9]|May [0-9]|June [0-9]|July [0-9]|August [0-9]|September [0-9]|October [0-9]|November [0-9]|December [0-9]", tablist89$list89a), ]
flist89$newdate<-(gsub('\n','',flist89$list89a))
flist89$newdate<-(trimws(flist89$newdate))
flist89<-as.data.frame(ldply(strsplit(flist89$newdate, split=" ")))
flist89$Month<-flist89$V1
flist89$Date<-flist89$V2
flist89$Year="1989"
attach(flist89)
flist89$MonthID[flist89$Month=="January"]<- "01"
flist89$MonthID[flist89$Month=="February"]<-"02"
flist89$MonthID[flist89$Month=="March"]<-"03"
flist89$MonthID[flist89$Month=="April"]<-"04"
flist89$MonthID[flist89$Month=="May"]<-"05"
flist89$MonthID[flist89$Month=="June"]<-"06"
flist89$MonthID[flist89$Month=="July"]<-"07"
flist89$MonthID[flist89$Month=="August"]<-"08"
flist89$MonthID[flist89$Month=="September"]<-"09"
flist89$MonthID[flist89$Month=="October"]<-"10"
flist89$MonthID[flist89$Month=="November"]<-"11"
flist89$MonthID[flist89$Month=="December"]<-"12"
detach(flist89)

Blist<-rbind(flist15, flist14, flist13, flist12, flist11, flist10, flist09, flist08, flist07,
             flist06, flist05, flist04, flist03, flist02, flist01, flist00, flist99, flist98,
             flist97, flist96, flist95, flist94, flist93, flist92, flist91, flist90, flist89)

library(foreign)
write.csv(Blist,file="C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Billboard_Dates.csv")
write.foreign(Blist, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Billboard_Dates.txt",
              "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Billboard_Dates.sas", package="SAS")
