DATA  home.SongsCaptured;
LENGTH
 SongID $ 4
 Match $ 3
 Song $ 58
 MainArtist $ 66
 WeeksOn $ 3
 NewSong $ 99
 NewArtist $ 99
 x $ 1
;

INFILE  "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Data/SongsCaptured.csv" 
     DSD;
INPUT
 SongID
 Match
 song
 MainArtist
 WeeksOn
 NewSong
 NewArtist
 x
;
RUN;

data home.SongsCaptured; set home.SongsCaptured;
CArt=lowcase(MainArtist);
CSong=lowcase(Song);
SongTie=CSong||CArt;
where SongID ne 'Song'; drop CArt CSong x; run;
