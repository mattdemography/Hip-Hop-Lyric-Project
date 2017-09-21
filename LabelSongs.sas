PROC IMPORT OUT= HOME.Label_Songs 
            DATAFILE= "C:\Users\mmarti24\Dropbox\Papers\Cultural Tectonics\Data\Label_Songs.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

DATA  home.label_songs;
LENGTH
 Song $ 58
 MainArtist $ 66
 WeeksOn $ 3
 Label1 $ 99
 Label2 $ 99
 Label3 $ 99
 Label4 $ 99
;

INFILE  "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Data/Label_Songs.csv" 
     DSD;
INPUT
 Song
 MainArtist
 WeeksOn
 Label1
 Label2
 Label3
 Label4
;
RUN;

data home.label_songs; set home.label_songs;
CArt=lowcase(MainArtist);
CSong=lowcase(Song);
SongTie=CSong||CArt;
where Label1 ne 'Label1'; drop CArt CSong; run;
