clear
capture log close
set more off

* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata"
global rawdata "D:\Docs\Myanmar\Data\AquaAgri\version0_9July16_v14"
global aadir "D:\Docs\Myanmar\AquaAgri\Analysis"
global hhchar "D:\Docs\Myanmar\Data\AquaAgri\hhchars\160714_hhchar_v14_un.dta"

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet"

global graphs "$workdir\graphs"
global madedata "$workdir\madedata"
global tables "$workdir\tables"
global outtab "$tables\table.xlsx"

* cd $workdir 


* Take all household characteristics, and make it into the groups we want
use $hhchar

* Groups defined as: 
* Non-farm households 
* Fish-farmers <40  (anyone who answered aqua, minus the following:
* Fish-farmers >40  (aquasize >40)
* Agricultural households (anyone who has an agritype)
* Absentee owners (not in data) 

gen lwgroup = . 

* all in aqua cluster: 
replace lwgroup = 1 if resp== 1
* larger farms than 10 acres in aqua cluster 
replace lwgroup = 2 if aqua_sizecat==3 | aqua_sizecat==2
* small nurseries in aqua cluster: 
replace lwgroup = 3 if aquatype==1 & lwgroup!=2
* agri households in aqua cluster
replace lwgroup = 4 if agritype!=. & cluster == 1
* landless households in aqua cluster
replace lwgroup = 5 if (landless==1 | resp==3) & cluster == 1  & lwgroup==.

* one household mischaracterized.  Labeled a pure nursery, but answered the growout section: 
replace lwgroup = 1 if eahhid == 110017 


* agri cluster
* replace lwgroup = 6 if agritype!=. & cluster == 2 & lwgroup ==. 
* replace lwgroup = 7 if (landless==1 | resp==3) & cluster == 2 

label define lwgroup 0 "nonfarm" 1 "AquaFSm" 2 "AquaFBg" 3 "AquaNurs" 4 "AquaAg" 5 "AquaLL" 
* dropped: 6 "AgriAg" 7 "AgriLL" 
label values lwgroup lwgroup 
tab resp lwgroup

tab lwgroup , matcell(counts)
tab lwgroup [aw=weight], matcell(wcounts)

* Export to the excel file
gen count =1 
tabstat count , by(lwgroup) stat(count)  save


matrix hhnum = r(Stat1) \ r(Stat2) \ r(Stat3)\r(Stat4)\r(Stat5)
* dropped: \r(Stat6)
matrix rownames hhnum = "`r(name1)'"  "`r(name2)'"  "`r(name3)'""`r(name4)'"  "`r(name5)'"  
* dropped: "`r(name6)'"
mat list hhnum
mat list wcounts 
mat hh = hhnum, wcounts
mat list hh
mat hh = hh' 
mat list hh 
mat rownames hh = "obs" "weighted"
mat list hh 
* tabstat count [w=wei], by(lwgroup) stat(count) 
putexcel B4 = matrix(hh, names) using $lewiesheet, sheet("Demog") modify keepcellformat 
 
count 
tab lwgroup 
sort eahhid  
keep eahhid lwgroup 

save $madedata\hhgroups.dta, replace 

