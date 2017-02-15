clear
capture log close
set more off
cap mat clear 
global drop 

* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata"
global aquamade "D:\Docs\Myanmar\AquaAgri\Analysis\Aqua\stata\made"
global agrimade "D:\Docs\Myanmar\AquaAgri\Analysis\Agri\stata\made" 

global graphs "$workdir\graphs"
global madedata "$workdir\madedata"
global tables "$workdir\tables"
global outtab "$tables\table.xlsx"

global rawdata "D:\Docs\Myanmar\Data\AquaAgri\version0_9July16_v14"
global hhchar "D:\Docs\Myanmar\Data\AquaAgri\hhchars\160714_hhchar_v14_un.dta"
global hhgroup "$madedata\hhgroups.dta"

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet"

cd $workdir 


* ============================================================
* ============= Data for Fish Activity =======================
* ============================================================

/*  1) Compute total output from fish activity, by household:  */
*----------------------------------------------------------------------------------------------
* ============================================================
* ============= Nursery Ponds  ===========
* ============================================================
use $aquamade\clean_nurscost, clear

* Revenues: 
egen rev_nurs = rowtotal(r_sold r_keep) 
keep if rev_nurs !=0
collapse (mean) rev_nurs
mkmat rev_nurs , mat(nursrev) 
matrix list nursrev 
matrix colname nursrev = "AquaNurs"


* ============================================================
* ============= Growout Ponds  ===========
* ============================================================

use $aquamade\aqua_allcosts, clear
merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count
 

collapse (mean) rev_fish, by (lwgroup) 
decode lwgroup, gen(gname)
list 
mkmat rev_fish, matrix(m) rownames(gname)
* transpose and add nurseries
mat list m
matrix fishrev = m'  , nursrev
matrix list fishrev 

putexcel B2 = matrix(fishrev, names) using $lewiesheet, sheet("Fish") modify keepcellformat 
clear


/*  2) Compute factor shares: */
*----------------------------------------------------------------------------------------------
* ============================================================
* ============= Nursery Ponds  ===========
* ============================================================
use $aquamade\clean_nurscost, clear
* Merge in value of aqua-related machinery:   
merge m:1 eahhid using $aquamade\c_machines
drop if _m==2
drop _m 


*Define variables: 
egen rev_nurs = rowtotal(r_sold r_keep) 
egen i_intinp = rowtotal(c_oinp)
egen i_nurs = rowtotal(c_stock)
egen i_labor = rowtotal(cstlab) 
egen i_land = rowtotal(area) 
egen i_other = rowtotal(c_feed)
egen  i_capit = rowtotal(rvmach)

* Label variables
label var i_intinp "all other purchased intermediate inputs"
label var i_nurs "fish seed"
label var i_land "Land"
label var i_labor "labor"
label var i_other "other inputs that create value added"

* make the logs
foreach v of varlist rev_nurs i_* {
	gen l`v' = log(`v')
}

* unconstrained and constrained log-log regression
local rhs "li_labor li_land li_capit li_other "
constraint 1 li_labor + li_land +li_capit + li_other= 1 , c(1)

* put into a matrix 
eststo clear
reg lrev_nurs  `rhs' [aw=wei] 
eststo: cnsreg lrev_nurs `rhs', r  c(1) 
return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix nout = r(coefs) 

* extract submatrices 
mat noutb = nout[1..., "est1:b"]
mat noutse = nout[1..., "est1:se"]
matrix coleq noutb = "AquaNurs" 
matrix coleq noutse = "AquaNurs" 
matrix colnames noutb = beta 
mat l noutb
mat l noutse

* intermediate input share: 
gen iish_nurs = i_nurs / rev_nurs 
gen iish_intinp = i_intinp / rev_nurs 
tabstat iish* [aw=wei],  stat(mean) save 

matrix ii = r(StatTotal)
matrix rownames ii = "AquaNurs"  
mat inpn = ii' 
mat l inpn

* ============================================================
* ============= Growout Ponds  ===========
* ============================================================
use $aquamade\aqua_allcosts, clear
* Merge in value of total assets 
merge m:1 eahhid using $madedata\ass_val 
drop if _m==2
drop _m 

* Impute out values if needed: 
imputeout cst_purch cst_constrep, bylist(cluster) 
 
 
cap mat clear
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital

* intermediate inputs:
egen i_nurs = rowtotal(cst_seed)
egen i_intinp = rowtotal(cst_oinp cst_harv cst_mkt cst_leg cst_bor) 


* Value-added creating inputs: 
* MUST ADD FAMILY LABOR HOURS OTHERWISE MIGHT UNDERESTIMATE INPUTS ON SMALL FARMS. 
egen i_labor = rowtotal(cst_lab) 
* Is land the area or the investment?  *aqua_sparea
egen i_land = rowtotal(aqua_sparea) 
* Includes real value of all assets rval: 
* egen i_capit = rowtotal(cst_purch cst_constrep cst_mach nval ) 
* adding cost of purchase and cost of construction makes a negative coeff for small farms. 
* that might be because land is already picking up that investment
* value of all aquaculture-related machines on the farm: rvmach 

egen i_capit = rowtotal(rvmach)
egen i_other = rowtotal(cst_feed )

label var i_land "Land"
label var i_labor "labor"
label var i_capit "capital"
label var i_other "other inputs that create value added"
label var i_nurs "intermediate inputs from aquaculture (seed)"
label var i_intinp "all other purchased intermediate inputs"

gen y = rev_fish 
keep eahhid y i_*  wei
 
sort eahhid
tempfile growout 
save `growout' 

merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count

* Generate Log variables where needed: 
foreach v of varlist y i_* {
	gen l`v' = log(`v')
}

* generate variables for the regression:
* Maybe no need for Other - they are intermediate inputs, not value-added creating inputs
global rhsfish "li_labor li_land  li_capit li_other"
global cstrfish "li_labor+li_land+li_capit +li_other"

* look for outliers: 
tab li_labor 
tab li_land
tab li_capit
*drop if li_capit <=-2
*drop if li_capit >=9 & li_capit!=.


* run a constrained log-log regression
eststo clear  
constraint 3 $cstrfish = 1 , c(3)
*bysort lwgroup : eststo: reg ly $rhsfish , r 
bysort lwgroup : eststo: cnsreg ly $rhsfish [aw=wei], r  c(3) 

estout
return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix mout = r(coefs) 
mat l mout

* extract submatrices: 
mat moutb = mout[1..., "est1:b"], mout[1..., "est2:b"]
mat moutse = mout[1..., "est1:se"], mout[1..., "est2:se"]
matrix coleq moutb = "`r(m1_estimates_title)'"  "`r(m2_estimates_title)'"
matrix colnames moutb = beta beta 
matrix coleq moutse = "`r(m1_estimates_title)'"  "`r(m2_estimates_title)'"
mat l moutb 
mat l moutse 

mat fishprodb = moutb, noutb
mat fishprodse = moutse, noutse
mat l fishprodb 
mat l fishprodse 

putexcel B8 = matrix(fishprodb, names) using $lewiesheet, sheet("Fish") modify keepcellformat 
putexcel B20 = matrix(fishprodse, names) using $lewiesheet, sheet("Fish") modify keepcellformat 

* intermediate input shares: 
gen iish_nurs = i_nurs / y 
gen iish_intinp = i_intinp / y 
tabstat iish* [aw=wei], by(lwgroup)  stat(mean) save 

matrix ii = r(Stat1) \ r(Stat2) 
matrix rownames ii = "`r(name1)'"  "`r(name2)'"  
mat l ii 
mat inpm = ii' 
* Put both growout and nurseries together: 

mat inp = inpm, inpn
putexcel B31 = matrix(inp, names) using $lewiesheet, sheet("Fish") modify keepcellformat 

* share of intermediate inputs coming from OUT versus retail: 
use $aquamade\clean_inputs, clear 
merge m:1 eahhid using $hhgroup 

collapse (sum) cinpt, by(lwgroup locpurch)
egen tc = sum(cinpt)  , by(lwgroup)
gen share = cinpt/tc
list 

use $aquamade\clean_feed, clear 
merge m:1 eahhid using $hhgroup 
collapse (sum) cfeed, by(lwgroup locpurch)
egen tc = sum(cfeed)  , by(lwgroup)
gen share = cfeed/tc
list 

 

* ============================================================
* ============= Data for Crop - Livestock Activity ===========
* ============================================================

/* 3) Agriculture total output  */
*----------------------------------------------------------------------
use $agrimade\agri_costs_revs,  clear
merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count
 

egen y = rowtotal(gross_sale_monsoon gross_sale_dry)
* Convert to Lahks 
replace y=y/100000
decode lwgroup , gen(groupname)

* Give non-ag households some production, assuming they use their ag land same as ag people: 
gen y_pa = y/ld_agown 
label var y_pa "crop income per acre of ag land"
egen y_mean = mean(y_pa) , by(cluster)
* assign imputed production only to groups 1 and 2: 
gen y_imp = y_mean*ld_agown 



collapse (mean)  y y_imp, by(lwgroup groupname)
drop if lwgroup ==. 
mkmat  y y_imp, matrix(mm) rownames(groupname) 
matrix croprev = mm'
mat l croprev 
putexcel B2 = matrix(croprev, names) using $lewiesheet, sheet("Crop") modify keepcellformat 



/* 4) Agriculture factor shares */
*----------------------------------------------------------------------

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
* No need to recode to lahk.
foreach v of varlist y i_* {
		gen l`v' = log(`v')
}

sum l* 

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
 
putexcel B8 = matrix(mout, names) using $lewiesheet, sheet("Crop") modify keepcellformat 
 


 
