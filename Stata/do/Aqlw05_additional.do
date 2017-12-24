clear
capture log close
set more off
cap mat clear 
global drop 

* define paths
include "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata\do\Aqlw00000_paths.do"
 
cd $workdir 

use $aquamade\aqua_allcosts, clear
merge 1:1 eahh using $hhgroups 
drop if _m==2 
drop _m 
count

bysort lwgroup: reg gmarg_fish aqua_spha

bysort lwgroup: reg gmarg_fish aqua_spha if gmarg_fish > 0 & gmarg_fish<1000

bysort lwgroup: reg rev_fmax aqua_spha
gen imputed = rev_fmax
imputeout imputed, bylist(cluster)
bysort lwgroup: reg imputedimp aqua_spha
* The value of an additional acre of land in  
* terms of additional production value 
* is 5.5 for a small farmer, 7.6 for a large farmer. 
* (if no floods) 
* ratio is about 0.72


*imputeout gmarg_fish, bylist(cluster) 
*bysort lwgroup: reg gmarg_fishimp aqua_spha
*bysort lwgroup: reg gmarg_fish aqua_spha if gmargf_pa > -10 & gmargf_pa<50


* Check construction method vs. farm size  
clear
use $hhchars
merge 1:1 eahh using $hhgroups 
drop _m 
merge 1:1 ea hhid using $rawdata\sec_t1v0.dta

clonevar constmeth = t101 
tab lwg constmeth [aw=wei], row nof
tab lwg constmeth 



