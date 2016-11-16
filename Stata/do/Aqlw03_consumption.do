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

crash 
collapse (sum) total_foodexp annual_total_f annual_expend1 annual_expend2 annual_expend, by(group)






