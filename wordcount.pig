A = load 's3://shreyasassignment1/Assignment1/Input/exercise1.txt';
B = foreach A generate flatten(TOKENIZE((chararray)$0)) as word;
C = filter B by word matches '\\w+';
D = group C by word;
E = foreach D generate COUNT(C) as cnt, group;
store E into 's3://shreyasassignment1/Assignment1/output/wordcount1a';
F = order E by cnt desc;
G = limit F 10;
store E into 's3://shreyasassignment1/Assignment1/output/wordcount1a';







H = load 's3://shreyasassignment1/Assignment1/Input/exercise2.csv' using PigStorage(',') as
(year:int,month:int,date:int,day:int,deptime:int,crsdeptime:int,arrtime:int,crsarrtime:int,uniquecarrier:chararray,fnum:int,tnum:int,etime:int,crsetime:int,atime:int,arrdelay:int,depdelay:int,org:chararray,
dest:chararray,dist:int,tin:int,tout:int,cancelled:int,cancelcode:chararray,diverted:int,cardelay:int,weatherdelay:int,nasdelay:int,secdelay:int,lateairdelay:int);
I = filter H by arrdelay < 15 and depdelay < 15;
J = foreach I generate year,month,date,fnum,arrdelay,depdelay;
K = group I all;
L = foreach K generate COUNT(I);
store J into 's3://shreyasassignment1/Assignment1/output/ontimeflights2a';
store L into 's3://shreyasassignment1/Assignment1/output/ontimeflightsportion2a';





