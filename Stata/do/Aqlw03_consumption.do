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

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet_v5"
global inflat "D:\Docs\Myanmar\DATA\AquaAgri\inflation\MM_Inflation_1997-2016.dta"
 
cd $workdir 


use $limmade/hhexpenditure.dta, clear

tab good group 
tab good2 group
tab good3 group 

* Merge in housheold characteristics 
merge m:1 eahhid using $hhgroup 
drop _m 

* Now collapse the way we want:  
sort eahhid 
list eahhid good good2 good3 total_foodexp group annual_total_foodexp /// 
		expend1 annual_expend1 annual_expend2 exppc annual_expend in 1/ 300 , ///
		sepby(eahh) string(15) 

* original categorization: 
* source: 1 "self-consumed" 2 "local retail"  3 "elsewhere"
* group  1 "crops"  2 "fresh meat"  3 "fresh fish"  4 "processed food"  5 "other food" 	
*	6  "local crafts"  7 "all other non-food"  8 "services"   9 "other"  

* make a new categorization like this: 
* 1 local crops 
* 2 local meat 
* 3 local fish 
* 4 local production
* 5 local retail
* 6 local services
* 7 non-local non-local everything 


*keep eahh annual* good*  source pct* 
 
gen group2 = . 
* 323 observations have "."as the source - edit appropriately 
* Foods 
replace group2 = 1 if group==1 & inlist(source, 1,2,.)
replace group2 = 2 if group==2 & inlist(source, 1,2,.)
replace group2 = 3 if group==3 & inlist(source, 1,2,.)
* Anything else self-produced - by far the smallest category, for good reason
replace group2 = 4 if inlist(group,4,5,6,7) & (source== 1 | source==.)

* All other local retail 
replace group2 = 5 if  inlist(group,4,5,6,7) & source== 2
* Local services 
replace group2 = 6 if group==8 & inlist(source, 1,2,.)
* Exogenous expenses 
replace group2 = 7 if source==3 

* see if there's a full partition
count if group!=. & group2==.
list  eahh annual* good* group source pct* if group!=. & group2==., string(20)

label define group2  1 "local crops"  2 "local meat"  3 "local fish" 4 "local production" 5 "local retail" ///
				6 "local services" 7 "everything bought outside"
label values group2 group2

collapse (mean)  annual_total_f annual_expend1 annual_expend2 annual_expend, by(lwgroup group2)
list, sepby(lwgroup)
keep group lwgroup  annual_expend
decode lwgroup , gen(gnames)
rename annual_expend ae 
levelsof gnames , local(g_names) 
di `g_names' 

tab lwgroup 
keep ae group lwgroup 
reshape wide ae , i(group) j(lwgroup)
list 

* Decode and add names: 
decode group2 , gen(items)
mkmat  ae* , matrix(m)  rownames(items)
matrix list m  
matrix colnames m = `g_names' 
matrix list m  

putexcel B2 = matrix(m, names) using $lewiesheet, sheet("Cons") modify keepcellformat 


* Compute average shares with SE's for next version:  










