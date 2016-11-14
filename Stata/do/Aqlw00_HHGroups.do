clear
capture log close
set more off

* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata"
global rawdata "D:\Docs\Myanmar\Data\AquaAgri\version0_9July16_v14"
global aadir "D:\Docs\Myanmar\AquaAgri\Analysis"
global hhchar "D:\Docs\Myanmar\Data\AquaAgri\hhchars\160714_hhchar_v14_un.dta"


global graphs "$workdir\graphs"
global madedata "$workdir\madedata"
global tables "$workdir\tables"
global outtab "$tables\table.xlsx"

cd $workdir 


* Take all household characteristics, and make it into the groups we want
use $hhchar

* Groups defined as: 
* Non-farm households 
* Fish-farmers <40  (anyone who answered aqua, minus the following:
* Fish-farmers >40  (aquasize >40)
* Agricultural households (anyone who has an agritype)
* Absentee owners (not in data) 
gen lwgroup = . 
replace lwgroup = 0 if landless==1 | resp==3
replace lwgroup = 1 if resp== 1
replace lwgroup = 2 if aqua_sizecat==3
replace lwgroup = 3 if agritype!=.

label define lwgroup 0 "nonfarm" 1 "aqua_le40" 2 "aqua_gt40" 3 "agri household"
label values lwgroup lwgroup 

count 
tab lwgroup 
sort eahhid  
keep eahhid lwgroup 
save $madedata\hhgroups.dta, replace 

