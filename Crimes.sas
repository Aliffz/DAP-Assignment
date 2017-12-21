%let path= /home/aliffmarzuki070/DAP/Crimes.xls;
libname Crimes '/home/aliffmarzuki070/DAP/Crimes.xls';
run;

proc import datafile='/home/aliffmarzuki070/DAP/Crimes.xls'
out=Crimes
dbms=xls replace;
run;

proc means data=Crimes nmiss;
run;

data Crimes;
set Crimes;
if Arson = . then Arson = 0;
run;

data Crimes(drop= O P Q);
set Crimes;
run;

proc tabulate data=Crimes;
class Year State;
var ViolentCrime PropertyCrime;
table State, (Year ALL) * PropertyCrime (Year ALL) * ViolentCrime;
title 'Total Property Crime & Violent Crime in 2014 & 2015';
run;

proc means data=Crimes sum;
Title1 'Total of All Crime Types';
Title2 'Year 2014 & 2015';
footnote 'Uniform Crime Report from FBI';
var ViolentCrime Murder Rape Robbery AggravatedAssault PropertyCrime Burglary LarcenyTheft MotorVehicleTheft Arson;
run;

proc means data=Crimes sum;
Title1 'Total of All Crime Types';
Title2 'Year 2014 & 2015';
footnote 'Uniform Crime Report from FBI';
var ViolentCrime Murder Rape Robbery AggravatedAssault PropertyCrime Burglary LarcenyTheft MotorVehicleTheft Arson;
by State;
run;

data Crimes;
set Crimes;
TotalCrime = ViolentCrime + PropertyCrime + Arson;
run;

proc sort data=Crimes
out=TotalCrimeAscending;
by State TotalCrime;
run;

proc sort data=Crimes
out=TotalCrimeDescending;
by State TotalCrime;
run;

proc print data=TotalCrimeAscending (obs=5);
title 'Least City with Crime Rate in Florida 2014';
var State City ViolentCrime PropertyCrime Arson TotalCrime;
where State = 'FLORIDA' and Year=2014;
run;

proc print data=TotalCrimeAscending (obs=5);
title 'Least City with Crime Rate in Florida 2015';
var State City ViolentCrime PropertyCrime Arson TotalCrime;
where State = 'FLORIDA' and Year=2015;
run;

proc print data=TotalCrimeAscending (obs=5);
title 'Least City with Crime Rate in Texas 2014';
var State City ViolentCrime PropertyCrime Arson TotalCrime;
where State = 'TEXAS' and Year=2014;
run;

proc print data=TotalCrimeAscending (obs=5);
title 'Least City with Crime Rate in Texas 2015';
var State City ViolentCrime PropertyCrime Arson TotalCrime;
where State = 'TEXAS' and Year=2015;
run;

proc print data=TotalCrimeAscending (obs=5);
title 'Least City with Crime Rate in New York 2014';
var State City ViolentCrime PropertyCrime Arson TotalCrime;
where State = 'NEW YORK' and Year=2014;
run;

proc print data=TotalCrimeAscending (obs=5);
title 'Least City with Crime Rate in New York 2015';
var State City ViolentCrime PropertyCrime Arson TotalCrime;
where State = 'NEW YORK' and Year=2015;
run;




















