* Written by R;
*  write.foreign(finalfinal, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Complete_Songs.txt",  ;

DATA  rdata ;
LENGTH
 Year $ 4
 Month $ 2
 Date $ 2
 Rank $ 2
 MainArtist $ 66
 FeatArtist $ 53
 Song $ 58
 Artists $ 87
;

INFILE  "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Data/Complete_Songs.csv" 
     DSD;
INPUT
 Year
 Month
 Date
 Rank
 MainArtist
 FeatArtist
 Song
 Artists $ 
;
RUN;

data music.Complete_Songs; set rdata;
CArt=lowcase(MainArtist);
CSong=lowcase(Song);
SongTie=CSong||CArt;
CSid=Year||Month||Date||Rank;
where Year ne 'Year'; drop CArt CSong; run;
