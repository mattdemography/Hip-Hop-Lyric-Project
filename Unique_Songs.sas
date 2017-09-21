* Written by R;
*  write.foreign(UniqueSongs, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Unique_Songs.txt",  ;

DATA  home.Unique_Songs;
LENGTH
 Song $ 58
 MainArtist $ 66
;

INFILE  "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Unique_Songs.txt" 
     DSD 
     LRECL= 105 ;
INPUT
 Song
 MainArtist
 WeeksOn
;
RUN;
