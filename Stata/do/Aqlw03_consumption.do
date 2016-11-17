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

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet_v0"
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
		expend1 annual_expend1 annual_expend2 exppc annual_expend in 1/300, ///
		sepby(eahh) string(15) 


collapse (sum)  annual_total_f annual_expend1 annual_expend2 annual_expend, by(lwgroup group)
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
decode group , gen(items)
mkmat  ae* , matrix(m)  rownames(items)
matrix list m  
matrix colnames m = `g_names' 
matrix list m  

putexcel B2 = matrix(m, names) using $lewiesheet, sheet("Cons") modify keepcellformat 


* Compute average shares with SE's for next version:  










