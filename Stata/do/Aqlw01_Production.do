clear
capture log close
set more off
cap mat clear 
global drop 

* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE\Stata"
global aquamade "D:\Docs\Myanmar\AquaAgri\Analysis\Aqua\stata\made"
global agrimade "D:\Docs\Myanmar\AquaAgri\Analysis\Agri\stata\made" 

global graphs "$workdir\graphs"
global madedata "$workdir\madedata"
global tables "$workdir\tables"
global outtab "$tables\table.xlsx"

global rawdata "D:\Docs\Myanmar\Data\AquaAgri\version0_9July16_v14"
global hhchar "D:\Docs\Myanmar\Data\AquaAgri\hhchars\160714_hhchar_v14_un.dta"
global hhgroup "$madedata\hhgroups.dta"

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE\GAMS\AQ_LEWIE_InputSheet_v0"

cd $workdir 


* ============================================================
* ============= Data for Fish Activity =======================
* ============================================================

* Need to take both nurseries and growout ponds - appending them together
* Keeping only the income and input costs: 
use $aquamade\aqua_allcosts, clear
cap mat clear
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital
egen i_aqua = rowtotal(cst_seed)
*gen i_agri = 
*egen i_feed = rowtotal() 
egen i_labor = rowtotal(cst_lab) 
egen i_land = rowtotal(aqua_sparea) 
egen i_capit = rowtotal(cst_purch cst_constrep cst_mach cst_bor) 
egen i_other = rowtotal(cst_oinp cst_harv cst_mkt cst_leg cst_feed)

global rhsfish "li_labor li_land li_capit li_other"
global cstrfish "li_labor+li_land+li_capit+li_other"

label var i_land "Land"

gen y = rev_fish 

keep eahhid y i_* 
sort eahhid
tempfile growout 
save `growout' 



keep eahhid y i_* 
sort eahhid
tempfile growout 
save `growout' , replace

 

merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count

* Generate Log variables where needed: 
foreach v of varlist y i_* {
	gen l`v' = log(`v')
}

* run a constrained log-log regression
eststo clear  
constraint 3 $cstrfish = 1 , c(3)
bysort lwgroup : eststo: cnsreg ly $rhsfish, r c(3) 

estout
return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix mout = r(coefs) 
mat l mout
*matrix coleq mout = 
matrix coleq mout = "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'" ///
					"`r(m2_estimates_title)'"  "`r(m2_estimates_title)'"  "`r(m2_estimates_title)'"
mat l mout
*matrix colnames mout = "`r(m1_estimates_title)' beta" "`r(m1_estimates_title)' se" "`r(m1_estimates_title)' p" ///
*					"`r(m2_estimates_title)' beta" "`r(m2_estimates_title)' se" "`r(m2_estimates_title)' p"
matrix colnames mout = beta se p beta se p 
mat l mout

putexcel B4 = matrix(mout, names) using $lewiesheet, sheet("Fish") modify keepcellformat 


* ============================================================
* ============= Nursery Ponds??  ===========
* ============================================================
* use $aquamade\clean_nurscost, clear
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital



* ============================================================
* ============= Data for Crop - Livestock Activity ===========
* ============================================================

use $agrimade\agri_costs_revs,  clear
cap mat clear 
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital
egen i_agri = rowtotal(dry_seeds_cost monsoon_seeds_cost)
*gen i_agri = 
*egen i_feed = rowtotal() 
egen i_labor = rowtotal(dry_dayrate dry_piecerate dry_add_templabor /// 
				monsoon_dayrate monsoon_piecerate monsoon_add_templabor) 
egen i_land = rowtotal(agri_sparea) 
egen i_capit = rowtotal(dry_irri_cost  /// 
						monsoon_irri_cost monsoon_equipment_cost ) 
egen i_other = rowtotal(dry_transport_costs dry_inputs_cost /// 
						monsoon_transport_costs monsoon_inputs_cost)

global rhscrop "li_labor li_land li_capit li_other"
global cstrcrop "li_labor+li_land+li_capit+li_other"

egen y = rowtotal(gross_sale_monsoon gross_sale_dry)



merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count

* Generate Log variables where needed: 
foreach v of varlist y i_* {
	gen l`v' = log(`v')
}

* run a constrained log-log regression
eststo clear  
constraint 3 $cstrcrop = 1 
bysort lwgroup : eststo: cnsreg ly $rhscrop, r c(3) 


estout
return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix mout = r(coefs) 
mat l mout
*matrix coleq mout = 
* Only one household has crops in this module: 
matrix coleq mout = "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'" 

mat l mout
matrix colnames mout = beta se p 
mat l mout
 
putexcel B4 = matrix(mout, names) using $lewiesheet, sheet("Crop") modify keepcellformat 
crash
*/ 
