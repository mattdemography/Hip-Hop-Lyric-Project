*Work;
	libname music "C:\Users\mmarti24\Dropbox\Papers\Cultural Tectonics\Data"; run;

*Home;
	*libname music "C:\Users\matthew\Dropbox\Papers\Cultural Tectonics\Data"; run;

data all; set music.allcalc;
newlvl=.;
if lvl1=1 then newlvl=1;
if lvl1=2 then newlvl=2;
if lvl1=3 then newlvl=3;
if lvl1=5 then newlvl=4;
if (lvl1=4 & ind1=2) then newlvl=5;
if (lvl1=4 & ind1=1) then newlvl=6;

newind=.;
if newlvl=6 then newind=1;
if 1<=newlvl<=5 then newind=0;
run;
*By Week;
	proc sort data=all; by year month date; run;
	*Create Unique Week ID;
	data all; set all;
	WeekID=(Year||Month||Date);
	run;

proc freq data=all; tables ind1 lvl1 newlvl newind; run;

proc sort data=all; by year;
proc freq data=all noprint; 
tables newlvl/out=freqcnt; by year; run;
PROC EXPORT DATA= WORK.FREQCNT 
            OUTFILE= "C:\Users\Matthew\Dropbox\Papers\Cultural Tectonics\Results\Levels.csv" 
            DBMS=csv LABEL REPLACE;
RUN;

proc freq data=all noprint; 
tables newlvl/out=freqcnt; by year; run;
PROC EXPORT DATA= WORK.FREQCNT 
            OUTFILE= "C:\Users\Matthew\Dropbox\Papers\Cultural Tectonics\Results\Levels.csv" 
            DBMS=csv LABEL REPLACE;
RUN;

proc sort data=all nodupkey out=unique; by songid; quit;
proc sort data=unique; by year; run;
proc freq data=unique noprint; 
tables newind/out=freqcnt; by year; run;
PROC EXPORT DATA= WORK.FREQCNT 
            OUTFILE= "C:\Users\Matthew\Dropbox\Papers\Cultural Tectonics\Results\IndStatusU.csv" 
            DBMS=csv LABEL REPLACE;
RUN;

*Remove Duplicates to have Independents By Week;
proc sort data=all; by WeekID; run;
proc freq data=all noprint; 
tables newind/out=freqcnt; by WeekID; run;
PROC EXPORT DATA= WORK.FREQCNT 
            OUTFILE= "C:\Users\Matthew\Dropbox\Papers\Cultural Tectonics\Results\IndStatusWK.csv" 
            DBMS=csv LABEL REPLACE;
RUN;

data all; set all;
if newind ne .;
run;
PROC EXPORT DATA= WORK.all
            OUTFILE= "C:\Users\Matthew\Dropbox\Papers\Cultural Tectonics\Results\all.csv" 
            DBMS=csv LABEL REPLACE;
RUN;

PROC EXPORT DATA= work.majors
            OUTFILE= "C:\Users\Matthew\Dropbox\Papers\Cultural Tectonics\Results\labelyears.csv" 
            DBMS=csv LABEL REPLACE;
RUN;

proc corr data=all; var wordcount newind; run;

*Not Factoring in time;
data all2; set all;
ln=log(wordcount);
rank2=16-rank;
profanes=(prosct/wordcount)*100;
profanen=(pronct/wordcount)*100;
profane=(proct/wordcount)*100;
religion=(relct/wordcount)*100;
material=(materialct/wordcount)*100;
cc=(year*1);
drop year;
rename cc=year;
if year ne .;
by weekid;
if first.weekid then wkid+1;
run;

data all2; set all2;
ym=(year||month);
run;
data all2; set all2;
by ym;
if first.ym then ymid+1;
run;
data all2; set all2;
by year;
if first.year then yearid+1;
if wordcount ne .;
run;
data all2; set all2;
ymid2=ymid*ymid;
ymid3=ymid*ymid*ymid;
wkid2=wkid*wkid;
wkid3=wkid*wkid*wkid;
yearid2=yearid*yearid;
yearid3=yearid*yearid*yearid;
run;

*Rank;
proc genmod data=all2; class songid;
model rank2= newind; run;
proc genmod data=all2; class songid newlvl;
model rank2= newlvl; run;
proc genmod data=all2; class songid;
model rank= newind yearid yearid*newind; run;

*Weeks On;
proc genmod data=all2; class songid;
model weekson= newind/dist=poisson link=log; run;
proc genmod data=all2; class songid newlvl;
model weekson= newlvl/dist=poisson link=log; run;
proc genmod data=all2; class songid;
model weekson= newind yearid yearid*newind/dist=poisson link=log; run;

title "Uniquect - Year - Newlvl";
proc genmod data=all2; class songid newlvl;
model uniquect =yearid yearid2 newlvl/dist=poisson link=log offset=ln; run;
title "Uniquect - Month - Newlvl";
proc genmod data=all2; class songid newlvl;
model uniquect =ymid ymid2 newlvl/dist=poisson link=log offset=ln; run;
title "Uniquect - Year - Ind";
proc genmod data=all2; class songid;
model uniquect =yearid yearid2 newind/dist=poisson link=log offset=ln; run;
title "Uniquect - Month - Ind";
proc genmod data=all2; class songid;
model uniquect =ymid ymid2 newind/dist=poisson link=log offset=ln; run;


title "Char - Year - Newlvl";
proc genmod data=all2; class songid newlvl;
model char =yearid yearid2 newlvl/dist=poisson link=log offset=ln; run;
title "Char - Month - Newlvl";
proc genmod data=all2; class songid newlvl;
model char =ymid ymid2 newlvl/dist=poisson link=log offset=ln; run;
title "Char - Year - Ind";
proc genmod data=all2; class songid;
model char =yearid yearid2 newind/dist=poisson link=log offset=ln; run;
title "Char - Month - Ind";
proc genmod data=all2; class songid;
model char =ymid ymid2 newind/dist=poisson link=log offset=ln; run;

title "Pronct - Year - Newlvl";
proc genmod data=all2; class songid newlvl;
model pronct =yearid yearid2 newlvl/dist=poisson link=log offset=ln; run;
title "Pronct - Month - Newlvl";
proc genmod data=all2; class songid newlvl;
model pronct =ymid ymid2 newlvl/dist=poisson link=log offset=ln; run;
title "Pronct - Year - Ind";
proc genmod data=all2; class songid;
model pronct =yearid yearid2 newind/dist=poisson link=log offset=ln; run;
title "Pronct - Month - Ind";
proc genmod data=all2; class songid;
model pronct =ymid ymid2 newind/dist=poisson link=log offset=ln; run;

title "Materialct - Year - Newlvl";
proc genmod data=all2; class songid newlvl;
model materialct =yearid yearid2 newlvl/dist=poisson link=log offset=ln; run;
title "Materialct - Month - Newlvl";
proc genmod data=all2; class songid newlvl;
model materialct =ymid ymid2 newlvl/dist=poisson link=log offset=ln; run;
title "Materialct - Year - Ind";
proc genmod data=all2; class songid;
model materialct =yearid yearid2 newind/dist=poisson link=log offset=ln; run;
title "Materialct - Month - Ind";
proc genmod data=all2; class songid;
model materialct =ymid ymid2 newind/dist=poisson link=log offset=ln; run;

title "Relct - Year - Newlvl";
proc genmod data=all2; class songid newlvl;
model relct =yearid yearid2 newlvl/dist=poisson link=log offset=ln; run;
title "Relct - Month - Newlvl";
proc genmod data=all2; class songid newlvl;
model relct =ymid ymid2 newlvl/dist=poisson link=log offset=ln; run;
title "Relct - Year - Ind";
proc genmod data=all2; class songid;
model relct =yearid yearid2 newind/dist=poisson link=log offset=ln; run;
title "Relct - Month - Ind";
proc genmod data=all2; class songid;
model relct =ymid ymid2 newind/dist=poisson link=log offset=ln; run;



*********MEANS;


proc means data=all2; var weekson; by year; run;

/*
proc univariate data=all2; var prosct profanes profanen profane religion material;histogram; run;
proc contents data=all2; run;

*Unique Words;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model uniquect =yearid yearid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model uniquect =ymid ymid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model uniquect =wkid wkid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;
	****Level;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model uniquect =yearid yearid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model uniquect =ymid ymid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model uniquect =wkid wkid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

*Word Length;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model char =yearid yearid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model char =ymid ymid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model char =wkid wkid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;
	****Level;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model char =yearid yearid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model char =ymid ymid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model char =wkid wkid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

*Religion;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model relct =yearid yearid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model relct =ymid ymid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model relct =wkid wkid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;
	****Level;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model relct =yearid yearid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model relct =ymid ymid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model relct =wkid wkid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;


*Material;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model materialct =yearid yearid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model materialct =ymid ymid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model materialct =wkid wkid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;
	****Level;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model materialct =yearid yearid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model materialct =ymid ymid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model materialct =wkid wkid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

*Profanity N-Word;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model pronct =yearid yearid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model pronct =ymid ymid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newind;
	ln=log(wordcount);
	model pronct =wkid wkid2 newind/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;
	****Level;
	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model pronct =yearid yearid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model pronct =ymid ymid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

	proc glimmix data=all2 pconv=1e-4 noclprint;
	class songid newlvl;
	ln=log(wordcount);
	model pronct =wkid wkid2 newlvl/ link=log s dist=poisson offset=ln solution;
	random int/ subject=songid;
	run;

/*
*****Models for Change;
data change; set all2;
array time[1989:2015] y89-y15;
do year=1989 to 2015;
	y=time[year];
	output;
	end;
run;*/

*Null;
proc mixed data=all2 covtest noclprint noitprint noinfo method=ml; class songid;
model profanes=/solution notest;
random intercept/ subject=songid type=un;
run;

proc sort data=all2; by songid;
proc mixed data=all2 covtest noclprint noitprint noinfo method=reml;
model profanes=year/solution notest;
random intercept year / subject=songid type=un;
run;

proc sort data=all2; by songid;
proc mixed data=all2 covtest noclprint noitprint noinfo method=reml;
model profanes=year newind/solution notest;
random intercept year / subject=songid type=un;
run;




proc sort data=all2; by year;
proc mixed data=all2 covtest noclprint noitprint noinfo method=reml; class songid;
model profanes= year/solution notest;
random intercept year / subject=newind type=un;
run;
