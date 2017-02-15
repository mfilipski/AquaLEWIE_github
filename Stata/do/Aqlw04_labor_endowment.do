clear
capture log close
set more off
cap mat clear 
global drop 

* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata"
global aquamade "D:\Docs\Myanmar\AquaAgri\Analysis\Aqua\stata\made"
global agrimade "D:\Docs\Myanmar\AquaAgri\Analysis\Agri\stata\made" 
global limmade "D:\Docs\Myanmar\AquaAgri\Analysis\Consumption\lim\data"

global graphs "$workdir\graphs"
global madedata "$workdir\madedata"
global tables "$workdir\tables"
global outtab "$tables\table.xlsx"

global rawdata "D:\Docs\Myanmar\Data\AquaAgri\version0_9July16_v14"
global rawdatav1 "D:\Docs\Myanmar\Data\AquaAgri\version1"
global hhchar "D:\Docs\Myanmar\Data\AquaAgri\hhchars\160714_hhchar_v14_un.dta"
global hhgroup "$madedata\hhgroups.dta"

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet"
global inflat "D:\Docs\Myanmar\DATA\AquaAgri\inflation\MM_Inflation_1997-2016.dta"
 
cd $workdir 


* Compute the amounts of working-aged population in the household
use "$rawdata/sec_av0.dta"
gen eahhid = ea*1000+hhid
* cleanup a bit
clonevar age = a103 
tab age
gen wrkage = (age<=55) & (age>=15) & age!=. 

merge m:1 eahhid using $hhgroup 
tabstat wrkage , by(lwgroup) s(count) save


collapse (mean) wrkage , by(lwgroup)
list 

decode lwgroup , gen(groupname)
levelsof groupname, local(names)
mkmat wrkage, matrix(m) 
mat list m

matrix list m
di `names'
matrix rownames m =  `names'
matrix list m 

mat wrk = m' 
mat list wrk 
putexcel B4 = matrix(wrk, names) using $lewiesheet, sheet("Endow") modify keepcellformat 


crash 
egen wrksum = sum(wrkage)
list
gen endowsh = wrkage/wrksum 
list  



