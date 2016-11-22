
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

* Read in the matrix:
*======================================================
alias (ac, aca) ;
alias (g,gg,ggg)
      (h,hh)
      (f,fa) ;

* Get raw values for input variables and some parameter values
parameter
     xlID(gg,g,h)          intermediate demand for of gg for production of g by h
     xlFD(g,f,h)           factor demand in g production by h
     xlbeta(g,f,h)         exponent on factor f in produciton of g
     xlbetase(g,f,h)       standard error on beta(gfh)
     xlacobb(g,h)          shift parameter on production of g
     xlacobbse(g,h)        standard error on acobb
     xlalpha(g,h)          consumption share of income
     xlalphase(g,h)          consumption share of income
     xlcmin(g,h)           incompressible consumption
     xlendow(f,h)          endowment of factors in the economy
     xlROCendow(f,h)       endowment of factors outside the economy
     xlROWendow(f,h)       endowment of factors outside the country
     xlTRINsh(h)           cash transfers given to other households (share of income)
     xlTROUTsh(h)          cash transfers received from other households  (share of expenditures)
     xlTRINshse(h)         standard error of cash transfers given to other households (share of income)
     xlTROUTshse(h)        standard error of cash transfers received from other households  (share of expenditures)
     xlSAVinfsh(h)         share of income going to informal savings
     xlSAVinfshse(h)       standard error of share of income going to informal savings
     xlSAVformsh(h)        share of income going to formal savings
     xlSAVformshse(h)      standard error of share of income going to formal savings
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
;

xlID(gg,g,h) = alldata("INTD",g,gg,"",h) ;
xlFD(g,f,h) = alldata("FD",g,"",f,h) ;
xlbeta(g,f,h) = alldata("beta",g,"",f,h) ;
xlbetase(g,f,h) = alldata("se",g,"",f,h) ;

* note: the A is actually log(A) because of the log-log regression
*xlacobb(g,h) = exp(alldata("acobb",g,"","",h)) ;
*xlacobbse(g,h) = exp(alldata("acobbse",g,"","",h)) ;
xlacobb(g,h) = (alldata("acobb",g,"","",h)) ;
xlacobbse(g,h) = (alldata("acobbse",g,"","",h)) ;

xlalpha(g,h) = alldata("alpha",g,"","",h) ;
xlalphase(g,h) = alldata("alphase",g,"","",h) ;
xlcmin(g,h) = alldata("acobbse",g,"","",h) ;

xlendow(f,h) = alldata("endow","","",f,h) + alldata("zoiendow","","",f,h) ;
xlendow("LABOR",h) = sum(g, xlFD(g,"LABOR",h));
xlendow("LAND",h) = sum(g, xlFD(g,"LAND",h));
xlendow("CAPITAL",h) = sum(g, xlFD(g,"CAPITAL",h));
xlROCendow(f,h) = alldata("ROCendow","","",f,h) ;
xlROWendow(f,h) = alldata("ROWendow","","",f,h) ;

xlTROUTsh(h) = alldata("TRANSFOUT","","","",h) ;
xlTRINsh(h) = alldata("TRANSFIN","","","",h) ;
xlTROUTshse(h) = alldata("TRANSFOUTse","","","",h) ;
xlTRINshse(h) = alldata("TRANSFINse","","","",h) ;

xlSAVinfsh(h) = alldata("savinformal","","","",h) ;
xlSAVinfshse(h) = alldata("savinformalse","","","",h) ;
xlSAVformsh(h) = alldata("savinformal","","","",h)   ;
xlSAVformshse(h) = alldata("savinformalse","","","",h) ;

xlexpoutsh(h) = alldata("exproles","","","",h) ;

xlremit(h)  =  alldata("remits","","","",h) ;
xlothertransfers(h)  =  alldata("NONSCtransfers","","","",h) ;


xlnhh(h) = alldata("NumberHH","","","",h) ;
xlhhinc(h) = alldata("HHinc","","","",h) ;
xlhhexp(h) = alldata("HHexp","","","",h) ;
xlhhsize(h) = alldata("HHsize","","","",h) ;

xlrevsh_vil(g,h) = alldata("revsh_vil",g,"","",h) ;
xlrevsh_zoi(g,h) = alldata("revsh_zoi",g,"","",h) ;
xlrevsh_rol(g,h) = alldata("revsh_rol",g,"","",h) ;
xlrevsh_row(g,h) = alldata("revsh_row",g,"","",h) ;

xlVA2IDsh(gg,g,h) = alldata("VA2IDsh",g,gg,"",h) ;


display xlID, xlFD, xlbeta, xlbetase, xlacobb, xlacobbse, xlalpha, xlcmin, xlendow, xlROCendow, xlROWendow,
     xlTROUTsh, xlTRINsh, xlTROUTshse, xlTRINshse, xlSAVinfsh, xlSAVinfshse, xlSAVformsh, xlSAVformshse,
     xlexpoutsh, xlremit, xlothertransfers, xlnhh, xlhhinc, xlhhexp, xlhhsize, xlrevsh_vil, xlrevsh_zoi,
     xlrevsh_rol, xlrevsh_row, xlVA2IDsh ;
