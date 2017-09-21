* Written by R;
*  write.foreign(Blist, "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Billboard_Dates.txt",  ;
libname home "C:\Users\mmarti24\Dropbox\Papers\Cultural Tectonics"; run;
DATA  home.Billboard_Dates ;
LENGTH
 V1 $ 9
 V2 $ 2
 Month $ 9
 Date $ 2
 Year $ 4
 MonthID $ 2
;

INFILE  "C:/Users/mmarti24/Dropbox/Papers/Cultural Tectonics/Billboard_Dates.txt" 
     DSD 
     LRECL= 49 ;
INPUT
 V1
 V2
 Month
 Date
 Year
 MonthID $ 
;
RUN;
