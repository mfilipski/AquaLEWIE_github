* This part of the code just reads in the data from the excel spreadsheet
* and makes it into a set of parameters to be used in the model

* Name the sets that will be used:
sets
ac all accounts
g(ac) goods
f(ac) factors
h(ac) households
var  variable names
;
parameter Alldata(*,*,*,*,h);


* Read in the data from LEWIE spreadsheet:
* the $call reads XL data and makes a .gdx file with it
* (unstar the "call" statement to re-read from the excel spreadsheet)
$call "gdxxrw input=%data_input%.xlsx output=%data_input%.gdx index=%input_sheet_index%"
* The "Index" tab of the XL spreadsheet tells the gdxxrw procedure where things are.
* The index looks like this:

*Type        Name        Range        Dimensions
*                                        rdim       cdim
*dset        ac        Input!A3            1
*dset        var       Input!B3           1
*dset        h         Input!F2                       1
*dset        g         Input!C3             1
*dset        f         Input!E3:E300        1
*par         alldata   Input!B2        4         1

* Which means, for instance, that the column going down from cell "INPUT!a3" contains the set ac
* ac are all the accounts of the SAM, so you need to make sure this column contains all of those.
* similarly, column "Input!C3" is where GAMS reads the names of all the goods - so you need to make sure all are there
* etc. for all these elements.

* the $gdxin opens the data loading procedure and calls the .gdx file we just made
$gdxin %data_input%.gdx
$load AC G F H VAR ALLDATA
display ac, g, f, h, var, ALLDATA ;

* This option controls the decimals and display format
option alldata:2:4:1;
display alldata;

* the phantom element "null" can be put in a set to avoid leaving the set empty in some simulations
* (GAMS can't handle empty sets)
$phantom null


* in future: read sim set from excel too:
set sim simulations  ;
parameter fsim(g,f,h,sim) shock to the fixed factor parameter;
$call "gdxxrw input=%sim_dashboard%.xlsx output=%sim_dashboard%.gdx index=index!a2"
$gdxin %sim_dashboard%.gdx
$load sim fsim
display sim, fsim ;

$ontext
* One acre coming out of nowhere (rental value is 2 lakh in fish, 0.7 lahk in crop, according to our Research Highlights)
fsim("Fish","Land","AqFSm","sim1") = 2 ;
fsim("Fish","Land","AqFBg","sim2") = 2 ;
fsim("Crop","Land","AqAg","sim3")  = 0.7 ;
* One acre from your own farm converted from ag to fish:
fsim("Fish","Land","AqFSm","sim4")  = 2 ;
fsim("Crop","Land","AqFSm","sim4")  = -0.7 ;
fsim("Fish","Land","AqFBg","sim5")  = 2 ;
fsim("Crop","Land","AqFBg","sim5")  = -0.7 ;
* tests in sim 6:
* nurseries - not good, overinflates results
*fsim("Fseed","Land","AqNurs","sim6")  = 2 ;

* value added of small and large fish farms
* <10 = 389 while 10-40 = 1283, and >40=2891
* 389/1283 is == 0.3
fsim("Fish","Land","AqFSm","sim6") = 2*0.72 ;

* redistribution:
*fsim("Fish","Land","AqFSm","sim6") = 2 ;
*fsim("Fish","Land","AqFBg","sim6") = -2 ;
$offtext


* Read in the matrix:
*======================================================
alias (ac, aca) ;
alias (g,gg,ggg,gfac)
      (h,hh)
      (f,fa) ;

* Get raw values for input variables and some parameter values
parameter
* expenditure function parameters:
     xleshare(g,h)         expenditure share of good g by household h
     xleshare_se(g,h)        expenditure share standard error
     xlemin(g,h)           minimum expenditure on g

* production function parameters:
     xlidsh(gg,g,h)        intermediate demand share for of gg for production of g by h
*     xlFD(g,f,h)           factor demand in g production by h
     xlqp(g,h)             quantity of g produced by household h
     xlfshare(g,f,h)       exponent on factor f in produciton of g
     xlfshare_se(g,f,h)    standard error on beta (gfh)
     xlpshift(g,h)         shift parameter on production of g
     xlpshift_se(g,h)      standard error on acobb

* other parameters:

     xlendow(f,h)          endowment of factors in the economy
     xlROCendow(f,h)       endowment of factors outside the economy
     xlROWendow(f,h)       endowment of factors outside the country
     xlTRINsh(h)           cash transfers given to other households (share of income)
     xlTROUTsh(h)          cash transfers received from other households  (share of expenditures)
     xlTRINsh_se(h)         standard error of cash transfers given to other households (share of income)
     xlTROUTsh_se(h)        standard error of cash transfers received from other households  (share of expenditures)
     xlsavsh(h)         share of income going to informal savings
     xlsavsh_se(h)       standard error of share of income going to informal savings
     xllabexp(h)           not sure what this is and why there's a negative value
     xlexpoutsh(h)         share of expenditures on outside goods
     xlremit(h)            level of remittances
     xlothertransfers(h)   level of exogenous transfers
     xlnhh(h)              number of households represented by this
     xlhhinc(h)            mean household income
     xlhhexp(h)            mean household expenditures
     xlhhsize(h)           mean household size
     xlrevsh_vil(g,h)        share of business in the village
     xlrevsh_zoi(g,h)        share of business in the zoi
     xlrevsh_rol(g,h)        share of business in the rest of lesotho
     xlrevsh_row(g,h)        share of business in the row
     xlVA2IDsh(g,gg,h)     for each dollar of VA how much ID was consumed
     xlwrkagepop(h)           number of working-age ppl in the household
;

* expenditure parameters
xleshare(g,h) = alldata("eshare",g,"","",h) ;
xleshare_se(g,h) = alldata("eshare_se",g,"","",h) ;
xlemin(g,h) = alldata("emin",g,"","",h) ;

* production parameters
xlqp(g,h)      = alldata("qp",g,"","",h) ;
* G and gg are in the order of G and f for fshare - like in the spreadsheet
* ie: g is the produced good, gg is the intermediate good
xlidsh(g,gg,h) = alldata("idsh",g,gg,"",h) ;
xlfshare(g,f,h) = alldata("fshare",g,"",f,h) ;
xlfshare_se(g,f,h) = alldata("fshare_se",g,"",f,h) ;

* transfers and savings
xlTROUTsh(h) = alldata("transfout","","","",h) ;
xlTRINsh(h) = alldata("transfin","","","",h) ;
xlTROUTsh_se(h) = alldata("transfout_se","","","",h) ;
xlTRINsh_se(h) = alldata("transfin_se","","","",h) ;

xlsavsh(h) = alldata("savsh","","","",h) ;
xlSAVsh_se(h) = alldata("savsh_se","","","",h) ;

xlendow(f,h) = alldata("endow","","",f,h) + alldata("zoiendow","","",f,h) ;
xlROCendow(f,h) = alldata("ROCendow","","",f,h) ;
xlROWendow(f,h) = alldata("ROWendow","","",f,h) ;



xlexpoutsh(h) = alldata("exproles","","","",h) ;

xlremit(h)  =  alldata("remits","","","",h) ;
xlothertransfers(h)  =  alldata("NONSCtransfers","","","",h) ;


xlnhh(h) = alldata("HHNum","","","",h) ;
xlhhinc(h) = alldata("HHinc","","","",h) ;
xlhhexp(h) = alldata("HHexp","","","",h) ;
xlhhsize(h) = alldata("HHsize","","","",h) ;

xlrevsh_vil(g,h) = alldata("revsh_vil",g,"","",h) ;
xlrevsh_zoi(g,h) = alldata("revsh_zoi",g,"","",h) ;
xlrevsh_rol(g,h) = alldata("revsh_rol",g,"","",h) ;
xlrevsh_row(g,h) = alldata("revsh_row",g,"","",h) ;

*xlVA2IDsh(gg,g,h) = alldata("VA2IDsh",g,gg,"",h) ;

xlwrkagepop(h)      = alldata("wrkagepop", "","","",h)


display xlidsh, xlfshare, xlfshare_se,  xleshare, xlemin, xlendow, xlROCendow, xlROWendow,
     xlTROUTsh, xlTRINsh, xlTROUTsh_se, xlTRINsh_se, xlSAVsh, xlSAVsh_se,
     xlexpoutsh, xlremit, xlothertransfers, xlnhh, xlhhinc, xlhhexp, xlhhsize, xlrevsh_vil, xlrevsh_zoi,
     xlrevsh_rol, xlrevsh_row ;
*xlpshift, xlpshift_se,, xlVA2IDsh
