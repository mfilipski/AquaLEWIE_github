set more off
cap mat clear 
global drop 


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

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet_v0"

cd $workdir 

use "$rawdatav1\sec_e3v1.dta", clear
gen eahhid=ea*1000+hhid
clonevar activ = e300_id 
clonevar yesact = e301
clonevar sale = e312a 
clonevar saleunit = e312b 
clonevar salefreq = e312c 

* First remove the "don't know" codes.   
tab yesact 
recode yesact (2=0)
tab sale
recode sale ( 97 98 99 = .)
tab saleunit 
recode sale ( 9=.)
tab salefreq 
recode salefreq ( 9=.)

* Now check that nobody made any mistakes: 
tab sale saleunit 

* Three observations seem too large to be "kyats" 
list ea hhid activ sale saleunit salefreq if sale >=1000 & saleunit==2 
* Ok, maybe... let's check that it's in line with the rest of the data: 
list eahhid activ sale saleunit salefreq if salefreq==4
* One seems really excessive, check the other variables:  
 
list eahhid activ sale saleunit salefreq e306 e307* e308 e309a e309b  e311a e311b if sale>1000 & saleunit==2 
* I think I don't believe 125000, since they report no recurrent costs and no labor costs
replace saleunit = 1 if sale==125000 & saleunit==2 
 
* NOW you can compute your  sale revenues in kyats: 
gen slk = sale if saleunit==2 
replace slk = sale/100000 if saleunit==1
label var slk "sale revenues in Lakh Kyats"

* And check again - this time looking at frequency: 
tab slk salefreq 

* three observations above 500000 per day - look at them
list eahhid activ sale saleunit salefreq e306 e307* e308 e309a e309b  e311a e311b if slk>500000 & slk!=. & salefreq==1 
* not very reasonable, but maybe 


 

*Step2-unit change (working month per year)
egen wm = rsum (e307*)
replace wm = 12 if e306 == 1
label var wm "No of Working Months per Year"

*Step3- Calculation of working days per month & per year
replace e308 = . if e308 == 99
gen wd_month = e308
replace wd_month = 0 if e308 == . & e301 == 1
label var wd_month "No of Working Days per Month"
gen wd_year = wd_month * wm 
label var wd_year "No of working days per year"


*Step4- Calculation of Yearly Income & Daily Income
gen dsales = slk  if salefreq ==1 
replace dsales = slk/7  if salefreq ==2 
 * (I would actually assume that people work 6 days per week, not 7 ) 
replace dsales = slk/wd_month if salefreq==3 
* (you already computed  wd_month: use it!)
replace dsales = slk/wd_year if salefreq==4 
sort salefreq 
list eahh activ wm wd_month wd_year slk  salefreq  dsales if sale!=.
* here's a comparison of our two versions. 
list eahh activ wm wd_month wd_year slk  salefreq  dsales if sale!=. 
* I left in those big outliers.  Now is a better time to impute them to the median, if you want.  

 
 * The more standard way to do it is more mechanical.  You don't choose a "limit" number yourself, but rather
 * you just impute everything that is larger than 3 standard-deveations from the mean (sometimes 2)
sum dsales 
egen dsalesmed = median(dsales) , by(activ)
egen dsalesmean = mean(dsales) , by(activ)
egen  dsalessd = sd(dsales) , by(activ) 
gen dsalesimp = dsales 
replace dsalesimp = dsalesmed if dsales>dsalesmean+3*dsalessd & dsales!=.
replace dsalesimp = dsalesmed if dsales<dsalesmean-3*dsalessd & dsales!=.
list eahh activ wm wd_month wd_year slk  salefreq  dsales dsalesimp if dsales != dsalesimp 


* Yearly income: 
gen ysale = slk if salefreq==4
replace ysale = slk *wm if salefreq==3
replace ysale =slk *wm*4 if salefreq==2
replace ysale =slk*wd_year if salefreq==1 
tab ysale 
lab var ysale "yearly revenues in lakh"
tab ysale salefreq 

list ysale 
list ysale if salefreq==1 | salefreq==2 
list ysale if inlist(salefreq,1,2)



*Step5 - Calculation of Total Labour Cost per Year (Kyat)
clonevar tlc = e309a 
clonevar tlcu = e309b 
recode tlc (97 98 99=.)
tab tlc tlcu
 
* Two changes to make : 1 kyat and 34 kyat are obviously supposed to by lahk
replace tlcu = 2 if tlcu==1 & tlc<100

* Now I recode into kyats: 
gen tlclak =  tlc if tlcu==2
replace tlclak= tlc/ 100000 if tlcu ==1
label var tlclak "total labor cots in lak Kyats"
* again, it's not clear that you should be imputing the big values right away.  
* it's good to check consistency: do households with big tlc values also have  big ysale values? 
 
list  eahh activ  wm wd_year  slk tlclak ysale if tlclak>50 & tlclak!=.
* It seems that they do, so maybe it's not a good idea to impute right away.  
* I suggest to wait until you see your margins. 
gen ylc = tlclak 
label var ylc "yearly labor costs in lakh"


*Step6 - Calculation of Total Recurrent Cost per Year (kyat)
clonevar rc = e311a 
clonevar rcu = e311b 
clonevar rcfreq = e311c
tab rc rcu , missing 
recode rc  (97 98 99 =.)
recode rcu (9=.)

tab rc rcu
* one odd value: 
list eahh ysale tlc tlcu rc rcu if rc>1000 & rcu==2
* This is the largest and the craziest value, but costs and benefits seem in line! 

gen rclak = rc if rcu==2 
replace rclak = rc/ 100000 if rcu==1

tab rclak rcfreq
* Ten lakh per day seems fishy
list activ eahh ysale wm wd_year tlc tlcu rc rclak rcu rcfreq if rclak>1 & rcfreq==1 
* Several of those are very unlikely, but we can't really guess if they are per month or per week or in total.  
* leave them in for now and remove outliers later: 

gen yrc = rclak  if rcfreq == 4
replace yrc = rclak * wm if rcfreq == 3
replace yrc = rclak * wm*4  if rcfreq == 2
replace yrc = rclak * wd_year if rcfreq == 1

tab yrc 
tab yrc rcfreq 

label var yrc "total yearly recurrent costs"

*Step8 - calculation of mean net income
gen netinc =  ysale - (yrc+ylc)


* Group it by type
* 1 = production or processing
* 2 = services other than trade and retail  
* 3 = trade and retail shops  
gen btype = . 
label list E300_ID
replace btype = 1 if inlist(activ, 2 , 9 , 10 , 14 , 19 , 20  )
replace btype = 2 if inlist(activ,    6 ,  11 , 12 , 13 , 15 , 16 ,  23 , 25 , 26    )
replace btype = 3 if inlist( activ, 1 , 3 , 4 , 5 , 7 , 8 , 17 , 18 , 21 , 22 , 24 , 27 )

label define btype 1 "prod n proc" 2 "services" 3 "trade n retail"
label values btype btype

sort btype 
tab activ btype 


* Look at weather they are local or not local: 
clonevar locinpa = e313a if yesact==1
clonevar locinpb = e313b if yesact==1
clonevar locinpc = e313c if  yesact==1 
clonevar locinpd = e313d if yesact==1
recode locinp* ( 97 98 99 =.) 
egen locinpt = rsum(locinp*)
tab locinpt 

* two problematic values: 
list if locinpt == 20 
* even split: 
recode locinpa locinpc (10=50) if locinpt==20 
replace locinpt = locinpa + locinpc if locinpt==20

list if locinpt == 80 
* twenty missing 
recode locinpb locinpc (0 = 10)  if locinpt==80
replace locinpt =  locinpa + locinpb + locinpc +locinpd if locinpt==80

tab locinpt 

clonevar locouta = e314a  if  yesact==1
clonevar locoutb = e314b  if  yesact==1
clonevar locoutc = e314c  if   yesact==1 
clonevar locoutd = e314d  if  yesact==1
recode locout* ( 97 98 99 =.) 
egen locoutt = rsum(locout*) 
tab locoutt

* Now define weather it is local or not local by whether custommers are local:    
egen locsh = rsum (locouta locoutb) if yesact==1
gen locald =  .
replace locald = 0 if e301 == 1 
replace locald =1 if locsh>=50  
tab locald 
tab locald btype 
labe var locald "indicator for locally procured"



* Merge with asset values  - Unnecessary in the end 
* asset values are for all hh assets, not activity-specific: not surprising that is doesn't work too well. 
*=====================================
merge m:1 eahhid using $madedata\ass_val 
drop if _m==2 
drop _m


* Regression log-log to figure share of labor: 
* ========================================
gen nothing =1
imputeout ysale ylc nval, bylist(nothing)

gen ly = log(ysaleimp) 
gen llc = log(ylcimp) 
lab var ly "log of income from activity"
lab var llc "log of value of labor inputs"
* unnecessary (results were bad): 
* gen lass = log(nvalimp)
*lab var lass "log of value of total assets of the household"



eststo clear 
* tried with constraint - bad results. 
* constraint 4 llc + lass = 1 
*bysort btype:  eststo: cstreg ly llc  lass if locald==1 , c(4)

* Try just one regressor, and do 1-beta for the other? 
bysort btype:  eststo: reg ly llc   if locald==1 
estout

return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix mout = r(coefs) 
mat l mout

*matrix coleq mout = 
matrix coleq mout = "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'" ///
					"`r(m2_estimates_title)'"  "`r(m2_estimates_title)'"  "`r(m2_estimates_title)'" ///
						"`r(m3_estimates_title)'"  "`r(m3_estimates_title)'"  "`r(m3_estimates_title)'"
mat l mout

 
putexcel B4 = matrix(mout, names) using $lewiesheet, sheet("ProdSerRet") modify keepcellformat 
crash
* FIGURE OUT WHY THIS GIVES NEGATIVE RESULTS! 



* Figure out share of intermediate inputs: 
* =============================================
gen inpsh = yrc / ysale 
tabstat inpsh, by(btype)
* Removing outliers 
gen nothing = 1 
imputeout inpsh , bylist(nothing)
label var inpshimp "itermediate inputs share"
tabstat inpshimp, by (btype) save 
return list 

matrix ish = r(Stat1) \ r(Stat2) \ r(Stat3)
matrix rownames ish = "`r(name1)'"  "`r(name2)'"  "`r(name3)'"
mat l ish 


* Figure out share of inputs purchased locally:   
* =================================================
gen outsh = 100-locsh 
replace outsh = outsh/100
tabstat outsh, by(btype) 

* same, but weighted by the amounts purchased 
tabstat outsh [w=yrc] , by(btype) save
return list 
matrix osh = r(Stat1) \ r(Stat2) \ r(Stat3)

matrix iosh = ish , osh 
matrix colname iosh = "intermediate inputs share"  "share of inputs bought outside"
mat l iosh 
 

putexcel B20 = matrix(iosh, names) using $lewiesheet, sheet("ProdSerRet") modify keepcellformat 
 

