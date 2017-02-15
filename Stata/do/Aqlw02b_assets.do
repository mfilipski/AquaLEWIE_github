set more off
cap mat clear 


* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata"
global aquamade "D:\Docs\Myanmar\AquaAgri\Analysis\Aqua\stata\made"

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

use "$rawdata\sec_f1v0.dta", clear
gen eahhid = ea*1000 + hhid 
clonevar asset = f100_id
clonevar num = f103
clonevar price = f107a 
clonevar priceu = f107b

tab num 
tab price 
recode price ( 97 98 99 999999 = .)
tab priceu 
recode priceu( 9=.)

* check consistency 
tab price priceu 

* recode to laks 
gen nval = price*num if priceu==2 
replace nval = price*num/100000 if priceu==1


clonevar year = f106 
recode year ( 97 98 99 = .)

merge m:1 year using $inflat
* assume inflation same for years before 1997 
list asset num price priceu year inflat 

replace inflation = 	13.36 if year<1997 & year !=. & f101==1 
gen rval = nval*inflation 

* Just collapse on total asset ownership of the household: 
collapse (sum)  nval rval , by(eahhid)
label var nval "nominal value of all hh assets"
label var rval "real value of all hh assets"  

save $madedata\ass_val.dta, replace  






  
