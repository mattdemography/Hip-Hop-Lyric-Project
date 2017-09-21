*Create Label Information with Dates;
data label_songs; set home.label_songs; 
drop Song MainArtist WeeksOn; run;
proc sort data=home.Songscaptured; by SongTie; run;
proc sort data=label_songs; by SongTie; run;
data home.Final_UniqueSongs; merge home.Songscaptured label_songs; by SongTie; run;

data f_us; set home.Final_UniqueSongs;
drop Song MainArtist WeeksOn; run;
proc sort data=home.complete_songs; by SongTie; run;
proc sort data=f_us; by SongTie; run;
data home.Final_CompleteSongs; merge home.complete_songs f_us; by SongTie; run;

*Create List of Unique Labels;
proc freq data=home.Final_UniqueSongs; tables label1 label2 label3 label4; run;
data labels; set home.Final_UniqueSongs;
keep label1 label2 label3 label4;
run;

data labels2; set labels;
Label=Label1;
output;
Label=Label2;
output;
Label=Label3;
output;
Label=Label4;
output;
run;

data labels3; set labels2;
if Label ne ' ';
Keep Label;
run;

proc freq data=labels3; table label/ out=labels4; run;
proc sort data=labels4; by label; run;

PROC EXPORT DATA= WORK.LABELS4 
            OUTFILE= "C:\Users\mmarti24\Dropbox\Papers\Cultural Tectonic
s\Data\Labels.csv" 
            DBMS=CSV LABEL REPLACE;
     PUTNAMES=YES;
RUN;
