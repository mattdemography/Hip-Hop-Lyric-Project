* Written by R;
*  write.foreign(WeeksOn, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/TimeOnList.txt",  ;

DATA  home.TimeOnList ;
LENGTH
 Song $ 58
 MainArtist $ 66
;

INFILE  "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/TimeOnList.txt" 
     DSD 
     LRECL= 107 ;
INPUT
 Song
 MainArtist
 Rank
 WeeksOn
;
RUN;
