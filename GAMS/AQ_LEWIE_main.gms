$TITLE MYANMAR AQUACULTURE LEWIE MODEL
* Mateusz Filipski, Dec 2016

* The model reads in data from excel spreadsheet in the form of parameter distributions
* Then it draws from those distributions and constructs a SAM from the values drawn
* The it uses those same values to calibrate a village economywide model
* A few useful gams options
option limrow=30 ;
option limcol=30 ;
*$onsymlist
*$onsymxref
* unstar the following only if you don't have a PATH licence
*option mcp = miles;


* name of the excel file (WITHOUT .xlsx extension):
$setglobal data_input "AQ_LEWIE_InputSheet_v1"
* name of index sheet (village-specific):
$setglobal input_sheet_index "Index!A2"
* name of include file containing village-specific assumptions
$setglobal assumptions_file  "2_MarketAssumptions.gms"
* name of output file for text output:
$setglobal output_txt_file "AQ_LEWIE_output"

* choose the elasticity of supply of labor - hired and family
$setglobal hlse 100
$setglobal flse 100

* choose whether or not to have a budget constraint and how much of the transfer releives that constraint
* 0 = no constraint ,  1 = constraint
* If the constraint is active, the parameter shSCTprod determines what % of the transfer is used to relieve the constraint
$setglobal budgetconstraint 0
parameter shSCTprod share of SCT used for buying purchased inputs ;
shSCTprod = 0 ;


* choose the number of draws (the second number)
* nb: must be greater than 10 to allow for percentiles to be computed
set draw /dr0*dr11/ ;


* Choose simulation parameters:
$setglobal new_land 0



* #################################################################################################
* Understanding the output:
* = Parameters with a "_dr" suffix are the inputs to each round of simulation. They were either
* drawn from a distribution, or are computed so that the economy is at equilibrium (given the drawn parameters)
* The first draw is "dr0" and corresponds to the mean values of the parameter distributions.
* ex: fshare_dr(g,f,h,draw) is the cobb douglas factor share drawn from the known distributions of factor shares
*     fshare_dr(g,f,h,"dr0") is the mean of that cobb douglas factor share known distribution
*     endow_dr(f,h,draw) is the household endowment of factor that is consistent with the draws of fshare_dr

* = Parameters with a "1" suffix are the values generated from the calibration run of each drawns model. In theory
* they should be identical to the _dr parameters, because those were chosen to satisfy the model equations.

* = Parameters with a "2" suffix are the values generated from the simulation performed on each draw.
* = Parameters with a "D" suffix are the level changes between the "2" and "1" parameter of the same name. ex: yD(h,draw) = y2(h,draw)-y1(h,draw)
* = Parameters with a "PC" suffix are the % changes from "1" level.  ex: tqpPC(g,draw) = tqpD(g,draw)/tqp1(g,draw)
* = Multipliers are computed for each draw. ex: ymult_h(h,draw) is the change in nominal income of a household / the transfer it received

* The above parameters are all indexed by draw. IE, if we do 1000 iterations, there will be 1000 observations of those parameters.
* = Parameters with a "_mv" suffix contain MEANS, STDEV, and for some PERCENTILES of the parameters that are indexed by draw.
* ex: yD_mv(h,"mean") = sum(draw, yD(h,draw)) / card(draw) ;
*     yD_mv(h,"stdev") = sqrt(sum(draw, sqr(yD(h,draw) - yD_mv(h,"mean")))/(card(draw)-1)) ;

* = Multipliers also have "_mv" versions. ex: ymult_all_mv(mv) holds the means, stdev, and percentiles of the overall nominal income multiplier.
* #################################################################################################


* ================================================================================================
* ================================================================================================
* ==================== STEP 1 - READ IN DATA FROM EXCEL ==========================================
* ================================================================================================
* ================================================================================================



$include includes/1_Read_Excel.gms



* ================================================================================================
* ================================================================================================
* ==================== STEP 2 - MAKE ASSUMPTIONS FOR THE ECONOMY (village-specific) ==============
* ================================================================================================
* ================================================================================================
* This file is defined as a macro for convenience:
* that way sub-sets of simulations can easily be edited
$include includes/%assumptions_file%


* ================================================================================================
* ================================================================================================
* ========================= STEP 3 - MODEL   =====================================================
* ================================================================================================
* ================================================================================================

$include includes/3_Model.gms

* ================================================================================================
* ================================================================================================
* ========================= STEP 4 - CALIBRATION  ================================================
* ================================================================================================
* ================================================================================================

$include includes/4a_DefineAllParameters.gms


* ================================================================================================
* ================================================================================================
* ====================== STEP 4 - CALIBRATE THE MODEL  ===========================================
* ================================================================================================
* ================================================================================================

* PARAMETERS THAT ARE DRAWN
* =================================================================================
* temporary values for parameters that get drawn but need to be corrected if negative
fshare_t(g,f,h,draw) = xlfshare(g,f,h) ;
eshare_t(g,h,draw)   = xleshare(g,h)   ;

* default values for parameters that were drawn
fshare_dr(g,f,h,draw) = xlfshare(g,f,h) ;
eshare_dr(g,h,draw)   = xleshare(g,h)   ;
pshift_dr(g,h,draw)  = xlpshift(g,h) ;

* Those are actually not drawn unless they have _se versions
troutsh_dr(h,draw)   = xltroutsh(h)  ;
savsh_dr(h,draw)     = xlSAVsh(h)    ;
exprocsh_dr(h,draw)  = xlexpoutsh(h) ;

* pshift_t(g,h,draw)   = xlpshift(g,h)   ;
* draw all values once - except for dr0 wich will be the xl base
*fshare_t(g,f,h,"dr0") = xlfshare(g,f,h);
*eshare_t(g,h,"dr0")   = eshare(g,h) ;
*troutsh_dr(h,"dr0")   = xltroutsh(h) ;
*savsh_dr(h,"dr0")     = xlSAVinfsh(h) ;
*exprocsh_dr(h,"dr0")  = xlexpoutsh(h) ;

fshare_t(g,f,h,draw)$(not sameas(draw,"dr0")) = normal(xlfshare(g,f,h),xlfshare_se(g,f,h));
eshare_t(g,h,draw)$(not sameas(draw,"dr0"))    = normal(xleshare(g,h),xleshare_se(g,h));
savsh_dr(h,draw)$(not sameas(draw,"dr0"))     = normal(xlSAVsh(h),xlSAVsh_se(h));
troutsh_dr(h,draw)$(not sameas(draw,"dr0"))   = normal(xltroutsh(h),xltroutsh_se(h));

display fshare_t, eshare_t, troutsh_dr, savsh_dr, exprocsh_dr;


* ### DATA CHECKPOINT: avoid negative values

* a- correct the factor shares that were drawn negative
* -------------------------------------------------------------
* just for info, display the negatives:
parameter negfshare_t(g,f,h,draw) ;
negfshare_t(g,f,h,draw)$((fshare_t(g,f,h,draw) le 0) or (fshare_t(g,f,h,draw) ge 1)) = fshare_t(g,f,h,draw);
display negfshare_t;
* and correct with a while structure
loop((g,f,h,draw)$(xlfshare(g,f,h)*((fshare_t(g,f,h,draw) le 0) or (fshare_t(g,f,h,draw) ge 1))),
     while((fshare_t(g,f,h,draw) le 0) or (fshare_t(g,f,h,draw) ge 1),
            fshare_t(g,f,h,draw) = normal(xlfshare(g,f,h),xlfshare_se(g,f,h));
     );
);
display fshare_t;
* finally, we can use that as our parameter draw:
fshare_dr(g,f,h,draw)$fshare_t(g,f,h,draw) = fshare_t(g,f,h,draw)/sum(fa,fshare_t(g,fa,h,draw)) ;
display fshare_t, fshare_dr ;




* b- correct the expenditure shares that were drawn negative
* ------------------------------------------------------------
* just for info, display the negatives
parameter negeshare_t(g,h,draw) ;
negeshare_t(g,h,draw)$((eshare_t(g,h,draw) le 0) or (eshare_t(g,h,draw) ge 1)) = eshare_t(g,h,draw) ;
display negeshare_t;
* and correct with a while loop (while negative, keep drawing)
loop((g,h,draw)$(xleshare(g,h)*((eshare_t(g,h,draw) le 0) or (eshare_t(g,h,draw) ge 1))) ,
     while( (eshare_t(g,h,draw) le 0) or (eshare_t(g,h,draw) ge 1),
           eshare_t(g,h,draw) = normal(xleshare(g,h),xleshare_se(g,h));
     );
);
display eshare_t;
* once all were drawn positive, use that as the draw
eshare_dr(g,h,draw)  = eshare_t(g,h,draw)/sum(gg,eshare_t(gg,h,draw)) ;
parameter escheck(h,draw) ;
escheck(h,draw) = sum(gg,eshare_dr(gg,h,draw))
display eshare_dr, escheck ;

* c- correct the rest-of world expenditure shares.  They cannot be negative, and they cannot add up to more than 1
* (really, maybe they shouldn't add up to more than 0.3 or something)
* so we make a loop in the loop:
expzoish_dr(h,draw) = 1-(troutsh_dr(h,draw)+savsh_dr(h,draw)+exprocsh_dr(h,draw)) ;

display troutsh_dr, savsh_dr, exprocsh_dr, expzoish_dr ;
* TROUTSHARE NEEDS TO BE RESCALED TO A 0<X<1 NUMBER
loop((h,draw),
     while( ((troutsh_dr(h,draw) < 0) or (troutsh_dr(h,draw) ge 1))
            or ((savsh_dr(h,draw) < 0) or (savsh_dr(h,draw) ge 1))
            or (expzoish_dr(h,draw) < 0),
               troutsh_dr(h,draw)$(not sameas(draw,"dr0")) = normal(xltroutsh(h),xltroutsh_se(h));
               savsh_dr(h,draw)$(not sameas(draw,"dr0")) = normal(xlSAVsh(h),xlSAVsh_se(h));
               expzoish_dr(h,draw) = 1-(troutsh_dr(h,draw)+savsh_dr(h,draw)+exprocsh_dr(h,draw)) ;
     );
);
display troutsh_dr, savsh_dr, exprocsh_dr, expzoish_dr;

$exit

* THOSE WERE THE PARAMETERS THAT ARE ACTUALLY DRAWN FROM A DISTRIBUTION
* ALL OTHER PARAMETERS EITHER FOLLOW FROM THOSE DRAWS (RATHER THAN DRAWN DIRECTLY)
* OR RESULT FROM ASSUMPTIONS OR CLOSURE RULES

* set wages and prices to 1:
*pm_dr(g,draw) = 1 ;
pv_dr(gtv,v,draw) = 1 ;
pz_dr(g,draw) = 1 ;
ph_dr(g,h,draw) = [pz_dr(g,draw)$(gtz(g)+gtw(g)) + sum(v$maphv(h,v),pv_dr(g,v,draw))$gtv(g)] ;
display pv_dr, pz_dr, ph_dr ;
r_dr(g,fk,h,draw)     = 1 ;
wv_dr(ftv,v,draw)     = 1 ;
wz_dr(ft,draw)        = 1 ;

* START FROM INCOME - TWO PORRIBILITIES:
option decimals = 2 ;
parameter y_dr1(h,draw) income reported directly in data
          y_dr2(h,draw) income computed from factor values + reported earnings;

y_dr1(h,draw) = xlhhinc(h)*xlnhh(h) ;
y_dr2(h,draw) = sum(f,xlendow(f,h)+xlROCendow(f,h)+xlROWendow(f,h))+xlremit(h)+xlothertransfers(h) ;

display y_dr1, y_dr2;

* now pick the one we prefer and see how it fares at creating a nice-looking matrix of the economy:
* (y_dr2 is almost equal to the former version of Y)
y_dr(h,draw) = y_dr1(h,draw) ;
* all prices are 1 so cpi is 1
cpi_dr(h,draw) = 1 ;
ry_dr(h,draw) = y_dr(h,draw) ;

* levels of expenditures on everything outside of the economy:
trout_dr(h,draw) = y_dr(h,draw)*troutsh_dr(h,draw) ;
sav_dr(h,draw) = y_dr(h,draw)*savsh_dr(h,draw) ;
exproc_dr(h,draw) = y_dr(h,draw)*exprocsh_dr(h,draw) ;
display troutsh_dr, savsh_dr, exprocsh_dr, trout_dr, sav_dr, exproc_dr ;


* ## DATA CHECKPOINT
* an abort statement if tansfers represent too much of income - means something is wrong with the data
set bigtr_dr(h,draw);
bigtr_dr(h,draw)$(troutsh_dr(h,draw) > 0.1) = yes ;
ABORT$(card(bigtr_dr)) "These household spend over 10% of income on transfers", bigtr_dr ;
set smallzoi_dr(h,draw);
smallzoi_dr(h,draw)$(expzoish_dr(h,draw) < 0.5) = yes ;
ABORT$(card(smallzoi_dr)) "These household spend over 10% of income on transfers", smallzoi_dr ;

* LEVELS OF CONSUMPTION:
qc_dr(g,h,draw) = (y_dr(h,draw)-sav_dr(h,draw)-trout_dr(h,draw)-exproc_dr(h,draw))*eshare_dr(g,h,draw)/ph_dr(g,h,draw) ;

display qc_dr ;
parameter qcshare(h,g) share of household h in total consumption of g ;
qcshare(h,g)$qc_dr(g,h,"dr0") = qc_dr(g,h,"dr0") / sum(hh,qc_dr(g,hh,"dr0")) ;
display qcshare;

* PRODUCTION: we can compute the output to equal local demand + net exports
* total qp must equal qc + net exports + use as intermediate demands:
* NB: We initialise QP and ID at plausible values, but then we use an NLP solve
* to refine them.

parameter netexpsh(g) net export share of a good out of the zoi;
netexpsh(g)$gnag(g) = 1-(1/card(h)*(sum(h,xlrevsh_vil(g,h)+xlrevsh_zoi(g,h)))) ;
*netexpsh(g)$gnag(g) = 0;
display netexpsh ;

* intermediate demand requirements
* NEW WAY OF COMPUTING THEM:
*idsh_dr(g,gg,h,draw) = xlVA2IDsh(gg,g,h)/(1+xlVA2IDsh(gg,g,h));
display xlFD, xlID ;
idsh_dr(gg,g,h,draw)$xlID(gg,g,h) = xlID(gg,g,h) / (sum(f,xlFD(g,f,h))+sum(ggg,xlID(ggg,g,h))) ;
tidsh_dr(g,h,draw) = sum(gg,idsh_dr(gg,g,h,draw));
display idsh_dr, tidsh_dr;


tqc_dr(g,draw) = sum(h,qc_dr(g,h,draw)) ;
display tqc_dr ;
parameter tempid_dr(g,draw) temporary total intermediate demand;
*  id = qc*s/(1-s)
tempid_dr(g,draw) = sum((gg,h),
                     qc_dr(gg,h,draw)*(idsh_dr(g,gg,h,draw)/(1-idsh_dr(g,gg,h,draw)))) ;
display tempid_dr ;

* now determine total QP
tqp_dr(g,draw) = [sum(h, qc_dr(g,h,draw)) + tempid_dr(g,draw) ]
                         /(1-netexpsh(g)) ;
ttqp_dr(draw)= sum(g,tqp_dr(g,draw));

display tqp_dr, ttqp_dr ;

* split qp in each household according to their capital shares:
parameter qpshare(h,g) share of household h in production of g ;
qpshare(h,g)$gnag(g) = xlFD(g,"Capital",h) / sum(hh,xlFD(g,"Capital",hh)) ;
*qpshare(h,g)$gag(g) = xlFD(g,"LAND",h) / sum(hh,xlFD(g,"LAND",hh)) ;   -- makes huge exinc
display qpshare ;
qp_dr(g,h,draw) = tqp_dr(g,draw) * qpshare(h,g) ;
display qp_dr ;


* several possibilities for crop/livestock closures.  Pick the one that makes a nice matrix:
* what if they are all self - reliant on food?   -- let's go with that
* this doesn't work for households that don't produce!!
qp_dr(g,h,draw)$(gag(g)*hnc(h)) = qc_dr(g,h,draw) ;
display qp_dr ;
qp_dr(g,h,draw)$(gag(g)*hc(h))  = qc_dr(g,h,draw) ;
qpshare(h,g)$gag(g) = qp_dr(g,h,"dr0")/sum(hh,qp_dr(g,hh,"dr0")) ;
display qp_dr ;


* what if the villages are self-reliant but hh'ds are not?   -- makes negative exinc
*parameter qpvilsh(h,g) share of village production by the household ;
*qpvilsh(h,g)$gag(g) = xlFD(g,"FL",h) / sum((hh,v)$(maphv(h,v)*maphv(hh,v)),xlFD(g,"FL",hh)) ;
*display qpvilsh ;
*qp_dr(g,h,draw)$gag(g) = qpvilsh(h,g)
*                    * sum((hh,v)$(maphv(h,v)*maphv(hh,v)), qc_dr(g,hh,draw)) ;


* And that determines all factor demands and intermediate demands:
id_dr(gg,g,h,draw) = qp_dr(g,h,draw) * idsh_dr(gg,g,h,draw) ;
display id_dr ;
display idsh_dr ;

* NEW APPROACH = WITH A MINI-SOLVE STATEMENT TO FIGURE OUT THE PRODUCTION SIDE
* minisolve is just for the QP/ID balance:
Variables
         NETEXPTEMP(g,draw)
         FAKE;

Nonnegative Variables
         QPTEMP(g,h,draw)
         TQPTEMP(g,draw)
         IDTEMP(g,gg,h,draw);

QPTEMP.l(g,h,draw) = qp_dr(g,h,draw) ;
TQPTEMP.l(g,draw) = sum(hh,qp_dr(g,hh,draw)) ;
IDTEMP.l(gg, g,h,draw) = id_dr(gg,g,h,draw) ;
NETEXPTEMP.l(g,draw) = netexpsh(g) * TQPTEMP.l(g,draw) ;
FAKE.l = 1 ;

display QPTEMP.l, TQPTEMP.l, IDTEMP.l, NETEXPTEMP.l, FAKE.l;

equations
     NETEXPTEMP_eq(g,draw)
     TQPTEMP_eq(g,draw)
     QPTEMP_eq(g,h,draw)
     IDTEMP_eq(g,gg,h,draw)
     MKTCLR_mini(g,draw)
     FAKEQ ;

IDTEMP_eq(g,gg,h,draw)..
     IDTEMP(g,gg,h,draw) =e= idsh_dr(g,gg,h,draw)*QPTEMP(gg,h,draw) ;

QPTEMP_eq(g,h,draw)..
     QPTEMP(g,h,draw) =e= TQPTEMP(g,draw) * qpshare(h,g) ;

NETEXPTEMP_eq(g,draw)..
     NETEXPTEMP(g,draw) =e= TQPTEMP(g,draw) * netexpsh(g);

MKTCLR_mini(g,draw)..
     TQPTEMP(g,draw) =e= sum(h,qc_dr(g,h,draw)) + sum((h,gg), IDTEMP(g,gg,h,draw)) + NETEXPTEMP(g,draw) ;

FAKEQ..
     FAKE =e= 1 ;

model miniQPIDsolve /MKTCLR_mini, IDTEMP_eq, QPTEMP_eq, NETEXPTEMP_eq, FAKEQ/
solve miniQPIDsolve using nlp maximizing FAKE;
display IDTEMP.l, QPTEMP.l, TQPTEMP.l, NETEXPTEMP.l ;



* The model should have solved for a balanced system of production, consumption and intermediate demands:
qp_dr(g,h,draw) = QPTEMP.l(g,h,draw) ;
id_dr(gg,g,h,draw) = IDTEMP.l(gg,g,h,draw) ;
display qp_dr, id_dr, fshare_dr ;

* We can figure out the rest from there:
* Factor demands derived from factor shares
fd_dr(g,f,h,draw)  = (qp_dr(g,h,draw) - sum(gg,id_dr(gg,g,h,draw))) * fshare_dr(g,f,h,draw)  ;
display fd_dr ;
qva_dr(g,h,draw)   = sum(f, fd_dr(g,f,h,draw)) ;
acobb_dr(g,h,draw)$(qva_dr(g,h,draw))    = qva_dr(g,h,draw)/prod(f,fd_dr(g,f,h,draw)**fshare_dr(g,f,h,draw)) ;

* and compute value added share for all activities
vash_dr(g,h,draw)$qp_dr(g,h,draw) = (qp_dr(g,h,draw)-sum(gg, id_dr(gg,g,h,draw))) / qp_dr(g,h,draw) ;
display id_dr, idsh_dr, tidsh_dr, vash_dr ;

parameter tid_dr(g,draw) check of total id
          tqcid_dr(g,draw)  check of qc+id ;
tid_dr(g,draw)= sum((gg,h),id_dr(g,gg,h,draw)) ;
tqcid_dr(g,draw) = tid_dr(g,draw) + tqc_dr(g,draw) ;
display tqc_dr, tid_dr, tqcid_dr, tqp_dr ;


* FACTOR ENDOWMENTS :
* --------------------------
* for fixed factors, endowment is just factor use:
endow_dr(fk,h,draw) = sum(g,fd_dr(g,fk,h,draw)) ;
fixfac_dr(g,fk,h,draw) = fd_dr(g,fk,h,draw) ;

* for family labor, split the labor use among households in the same village
* using karen's shares
* for hired labor, split endowment among all households
* using karen's shares

parameter shfl(h) share of village family labor coming from a household
          shhl(h) share of zoi hired labor coming from a household ;
shfl(h) = xlendow("Labor",h)/sum((hh,v)$(maphv(hh,v)*maphv(h,v)),xlendow("Labor",hh)) ;
shhl(h) = xlendow("Labor",h)/sum(hh,xlendow("Labor",hh)) ;
display shhl , shfl ;

*endow_dr("FL",h,draw) = shfl(h) * sum((hh,g,v)$(maphv(hh,v)*maphv(h,v)), fd_dr(g,"FL",hh,draw)) ;
endow_dr("Labor",h,draw) = shfl(h) * sum((hh,g), fd_dr(g,"Labor",hh,draw)) ;
display endow_dr ;


* MARKETS AGGREGATES
* ================================================================================================
* factor demand aggregates
hfd_dr(f,h,draw)= sum(g,fd_dr(g,f,h,draw)) ;
vfd_dr(f,v,draw)= sum(h$maphv(h,v), hfd_dr(f,h,draw)) ;
zfd_dr(f,draw)  = sum(v, vfd_dr(f,v,draw)) ;

* marketed surpluses for goods
hms_dr(g,h,draw) = qp_dr(g,h,draw) - qc_dr(g,h,draw) - sum(gg,id_dr(g,gg,h,draw)) ;
vms_dr(g,v,draw) = sum(h$maphv(h,v),hms_dr(g,h,draw));
zms_dr(g,draw) = sum(v, vms_dr(g,v,draw));

* marketed surpluses for factors
hfms_dr(ft,h,draw) = endow_dr(ft,h,draw) - sum(g, fd_dr(g,ft,h,draw));
vfms_dr(ft,v,draw) = sum(h$maphv(h,v), hfms_dr(ft,h,draw));
zfms_dr(ft,draw) = sum(v, vfms_dr(ft,v,draw))  ;

* fixed factor demands at village/zoi level
vfmsfix_dr(ftv,v,draw) = vfms_dr(ftv,v,draw) ;
zfmsfix_dr(ftz,draw) = zfms_dr(ftz,draw) ;

* fixed goods trade levels at village/zoi level
vmsfix_dr(gtv,v,draw) = vms_dr(gtv,v,draw) ;
zmsfix_dr(gtz,draw) = zms_dr(gtz,draw) ;

* minimum consumption: zero for now.
cmin_dr(g,h,draw) = 0 ;

pva_dr(g,h,draw) = ph_dr(g,h,draw)
                - sum(gg,idsh_dr(gg,g,h,draw)*ph_dr(gg,h,draw)) ;
trinsh_dr(h,draw) = y_dr(h,draw)*xltrinsh(h)/sum(hh,y_dr(hh,draw)*xltrinsh(hh))  ;
trin_dr(h,draw) = trinsh_dr(h,draw)*sum(hh,trout_dr(hh,draw)) ;

* last missing: exinc_dr THAT'S WHAT HAS TO CLEAR THE MATRIX
parameter exinc_dr1(h,draw) old exogenous income computation
          exinc_dr2(h,draw) new exogenous income computation
          exincsh1(h,draw)  share of income being exogenous using exinc1
          exincsh2(h,draw)  share of income being exogenous using exinc2
          feinc_dr(h,draw) income from factor endowments in the household
          fecomp_dr(f,h,draw) income components ;
* this is if we use karen's data to get exogenous income
exinc_dr1(h,draw) = sum(f,xlROCendow(f,h)+xlROWendow(f,h)) + xlremit(h) + xlothertransfers(h) ;
* this is if we make exogenous income the residual from Y-FD
feinc_dr(h,draw) = sum((g,fk),r_dr(g,fk,h,draw)*fd_dr(g,fk,h,draw)) + sum(ft, wz_dr(ft,draw)*endow_dr(ft,h,draw)) ;
fecomp_dr(f,h,draw) = sum(g,r_dr(g,f,h,draw)*fd_dr(g,f,h,draw))$fk(f) + wz_dr(f,draw)*endow_dr(f,h,draw)$ft(f) ;
exinc_dr2(h,draw) = y_dr(h,draw) - feinc_dr(h,draw) ;
exincsh1(h,draw) = exinc_dr1(h,draw) / y_dr(h,draw) ;
exincsh2(h,draw) = exinc_dr2(h,draw) / y_dr(h,draw) ;
display feinc_dr, fecomp_dr, exinc_dr1, exinc_dr2, exincsh1, exincsh2 ;
exinc_dr(h,draw) = exinc_dr2(h,draw) ;

display acobb_dr, fshare_dr, pv_dr, pz_dr, ph_dr, pva_dr, qva_dr, fd_dr, id_dr, r_dr, wz_dr, qp_dr, fixfac_dr, pva_dr,
        exinc_dr, endow_dr, y_dr, trinsh_dr, qc_dr, eshare_dr, troutsh_dr, hfd_dr, vfd_dr, zfd_dr,
        hms_dr, vms_dr, zms_dr, hfms_dr, vfms_dr, zfms_dr ;

* TOGETHER, THE "_DR" PARAMETERS CONTAIN INITIAL VALUES FOR ALL THE ECONOMIC VARIABLES IN LEWIE
* THEY FORM AN ECONOMY THAT IS AT EQUILIBRIUM. WE CAN THUS REPRESENT THEM IN SAM FORM.
* THE SAM IS NOW A BY-PRODUCT OF THE MODEL RATHER THAN AN INPUT TO IT

* OUTPUT A MATRIX
* ================================================================================================
parameter outmat(*,*,*,*,*,*) matrix to output to excel for checking purposes IN MILLIONS ;

* divide by a factor if numbers are too big:
$setlocal samdivider 1

* ACT(h,g), COMM(g), FACT(f), INST(h), REST

* ACTIVITY ROWS
outmat("ACT",h,g,"COMM","",g) = qp_dr(g,h,"dr0")   / %samdivider%;

* FACTOR ROW
* factor demand
outmat("FACT","",f,"ACT",h,g)   = fd_dr(g,f,h,"dr0") / %samdivider% ;

* COMMODITY ROW
* intermediate demand
outmat("COMM","",g,"ACT",h,gg) = id_dr(g,gg,h,"dr0") / %samdivider%;
* household demand
outmat("COMM","",g,"INST","",h) = qc_dr(g,h,"dr0") / %samdivider%;
* exogenous demand
*outmat("COMM","",g,"ROW","","") = sum(h,hms_dr(g,h,"dr0"));

* INSTITUTION ROW
* income from factors
outmat("INST","",h,"FACT","",f)  = endow_dr(f,h,"dr0") / %samdivider%;
* income from outside
outmat("INST","",h,"ROW","","") = exinc_dr(h,"dr0")    / %samdivider%;

* ROW row and column
* factor imports or exports
parameter signzfms(f) sign of net factor trade
          signzms(g) sign of net commodity trade;
signzfms(f) = sign(zfms_dr(f,"dr0"));
signzms(g) = sign(zms_dr(g,"dr0"));
* net sellers or net buyers:
outmat("ROW","","","FACT","",f)$(signzfms(f) = -1)  = -zfms_dr(f,"dr0") / %samdivider%;
outmat("FACT","",f,"ROW","","")$(signzfms(f) =  1) =   zfms_dr(f,"dr0") / %samdivider%;
* commodity imports or exports
outmat("ROW","","","COMM","",g)$(signzms(g) = -1)  = -zms_dr(g,"dr0")   / %samdivider%;
outmat("COMM","",g,"ROW","","")$(signzms(g) = 1)  = zms_dr(g,"dr0")     / %samdivider%;
* exogenous expenditures
outmat("ROW","","","INST","",h)  = (sav_dr(h,"dr0")+trout_dr(h,"dr0")+exproc_dr(h,"dr0")) / %samdivider% ;

option outmat:0:3:3 ;
display outmat ;

* This unloads the parameter into a .gdx data file:
execute_unload "outmat.gdx" outmat ;
* And this writes in an excel sheet called "MakeMeASam":
execute "xlstalk.exe -s   MakeMeASam_V1.xlsx" ;
execute "gdxxrw.exe outmat.gdx par=outmat o=MakeMeASam_V1.xlsx rng=a1:ab28 rdim=3 cdim=3" ;
execute 'xlstalk.exe -O MakeMeASam_V1.xlsx' ;

* NB: the range is important here rng=a1:am39 is the exact size of the Lesotho matrix
* this is to prevent the gdxxrw procedure from overwriting everything on the entire xl spreadsheet
* The first time you run the program, erase rng=a1:am39,
* then the program will put the SAM in cell a1, and from then you'll know how big your range needs to be.


$exit

$include includes/4b_Calibration.gms


* ================================================================================================
* ================================================================================================
* ===================== STEP 4 - SOLVE THE MODEL IN A LOOP OVER PARAMETERS DRAWS =================
* ================================================================================================
* ================================================================================================


$exit

* The zero draw is using the mean values. Starting after dr1, those values are randomely drawn.
loop(draw,
* re-initialise all the variables in the matrix
* but this time not at the I levels - rather, at the _dr levels
cmin(g,h)      = cmin_dr(g,h,draw) ;
acobb(g,h)     = acobb_dr(g,h,draw) ;
fshare(g,f,h)  = fshare_dr(g,f,h,draw) ;
PZ.l(g)        = pz_dr(g,draw) ;
PV.l(g,v)      = pv_dr(g,v,draw) ;
PH.l(g,h)      = ph_dr(g,h,draw) ;
QVA.l(g,h)     = qva_dr(g,h,draw) ;
FD.l(g,f,h)    = fd_dr(g,f,h,draw) ;
ID.l(gg,g,h)   = id_dr(gg,g,h,draw) ;
R.l(g,fk,h)    = r_dr(g,fk,h,draw);
WV.l(f,v)      = wv_dr(f,v,draw) ;
WZ.l(f)        = wz_dr(f,draw);
QP.l(g,h)      = qp_dr(g,h,draw) ;
fixfac(g,fk,h) = fixfac_dr(g,fk,h,draw) ;
vfmsfix(ftv,v) = vfmsfix_dr(ftv,v,draw) ;
zfmsfix(ftz)   = zfmsfix_dr(ftz,draw) ;
PVA.l(g,h)     = pva_dr(g,h,draw) ;
vash(g,h)      = vash_dr(g,h,draw) ;
idsh(gg,g,h)   = idsh_dr(gg,g,h,draw) ;
tidsh(g,h)     = tidsh_dr(g,h,draw) ;
exinc(h)       = exinc_dr(h,draw) ;
endow(f,h)     = endow_dr(f,h,draw) ;
Y.l(h)         = y_dr(h,draw) ;
CPI.l(h)       = cpi_dr(h,draw) ;
RY.l(h)        = ry_dr(h,draw) ;
TRIN.l(h)      = trin_dr(h,draw) ;
trinsh(h)      = trinsh_dr(h,draw) ;
QC.l(g,h)      = qc_dr(g,h,draw) ;
eshare(g,h)     = eshare_dr(g,h,draw) ;
troutsh(h)     = troutsh_dr(h,draw) ;
TROUT.l(h)     = trout_dr(h,draw) ;
HFD.l(f,h)     = hfd_dr(f,h,draw);
VFD.l(f,v)     = vfd_dr(f,v,draw);
ZFD.l(f)       = zfd_dr(f,draw);
HMS.l(g,h)     = hms_dr(g,h,draw);
VMS.l(g,v)     = vms_dr(g,v,draw);
ZMS.l(g)       = zms_dr(g,draw);
vmsfix(gtv,v)  = vmsfix_dr(gtv,v,draw);
zmsfix(gtz)    = zmsfix_dr(gtz,draw);
HFMS.l(ft,h)   = hfms_dr(ft,h,draw);
VFMS.l(ft,v)   = vfms_dr(ft,v,draw);
ZFMS.l(ft)     = zfms_dr(ft,draw);
savsh(h)       = savsh_dr(h,draw) ;
exprocsh(h)    = exprocsh_dr(h,draw) ;
SAV.l(h)       = sav_dr(h,draw) ;
EXPROC.l(h)    = exproc_dr(h,draw) ;
hfsupzero(ft,h) = endow_dr(ft,h, draw) ;
pibudget(g,h)  = FD.l(g,"INPUT",h)*WZ.l("INPUT") ;
pibsh(g,h)$sum(gg,pibudget(gg,h))  = pibudget(g,h)/sum(gg,pibudget(gg,h)) ;

* for those who sell part of their package onto the market
packsold(g) = 0 ;



* read the supply elasticities from the locals defined at the top of the program
hfsupel("LABOR",h) = %hlse% ;
*hfsupel("FL",h) = %flse% ;
HFSUP.l(f,h)    = hfsupzero(f,h) ;
hfsnewref(ft,h) = 0 ;

* closures: fixed wages and prices on world-market-integrated factors and goods (ftw & gtw)
WZ.fx(ftw) = WZ.l(ftw);
PZ.fx(gtw) = PZ.l(gtw) ;

display PV.l, PZ.l, PH.l, PVA.l, QVA.l, FD.l, QP.l, ID.l, QC.l, Y.l, CPI.l, RY.l, SAV.l, EXPROC.l, HMS.l, VMS.l, ZMS.l, R.l, WZ.l, HFMS.l, VFMS.l, ZFMS.l;

*---------------------------------
* RE-CALIBRATION
*---------------------------------
* set iterlim to 2 when using nlp, to 1 when using mcp. It's all about a difference between CONPT and PATH solvers.
option iterlim = 1 ;
solve genCD using mcp ;
*solve genCDnlp using nlp maximizing USELESS ;
option iterlim=1000;
ABORT$(genCD.modelstat ne 1) "NOT WELL CALIBRATED IN THIS DRAW - CHECK THE DATA INPUTS" ;
display PV.l, PZ.l, PH.l, PVA.l, QVA.l, FD.l, QP.l, ID.l, QC.l, Y.l, Y.l, CPI.l, RY.l, SAV.l, EXPROC.l, HMS.l, VMS.l, ZMS.l, R.l, WZ.l, HFMS.l, VFMS.l, ZFMS.l;
display CPI.l ;

acobb1(g,h,draw)    = acobb(g,h) ;
fshare1(g,f,h,draw) = fshare(g,f,h) ;

pv1(g,v,draw)       = PV.l(g,v) ;
pz1(g,draw)         = PZ.l(g) ;
ph1(g,h,draw)       = PH.l(g,h) ;
qva1(g,h,draw)      = QVA.l(g,h) ;
fd1(g,f,h,draw)     = FD.l(g,f,h) ;
id1(gg,g,h,draw)    = ID.l(gg,g,h) ;
r1(g,fk,h,draw)     = R.l(g,fk,h) ;
wv1(f,v,draw)       = WV.l(f,v) ;
wz1(f,draw)         = WZ.l(f) ;
qp1(g,h,draw)       = QP.l(g,h) ;
fixfac1(g,fk,h,draw) = fixfac(g,fk,h) ;
pva1(g,h,draw)      = PVA.l(g,h) ;
vash1(g,h,draw)     = vash(g,h) ;
idsh1(g,gg,h,draw)  = idsh(g,gg,h) ;
tidsh1(g,h,draw)    = tidsh(g,h) ;
exinc1(h,draw)      = exinc(h) ;
endow1(f,h,draw)    = endow(f,h) ;
y1(h,draw)          = Y.l(h) ;
qc1(g,h,draw)       = QC.l(g,h) ;
cpi1(h,draw)        = CPI.l(h) ;
vqc1(v,g,draw)      = sum(h$maphv(h,v), qc1(g,h,draw));
* village cpi is weighted sum of prices
vcpi1(v,draw)       = sum((h,g)$maphv(h,v), (ph1(g,h,draw)**2)*qc1(g,h,draw)) / sum((h,g)$maphv(h,v),ph1(g,h,draw)*qc1(g,h,draw)) ;
cri1(v,f,draw)      = sum((g,h)$maphv(h,v), r1(g,f,h,draw)*fd1(g,f,h,draw)/sum((gg,hh)$maphv(hh,v),fd1(gg,f,hh,draw)) ) ;

ry1(h,draw)         = RY.l(h) ;
ty1(draw)           = sum(h,y1(h,draw));
try1(draw)          = sum(h,ry1(h,draw));
trin1(h,draw)       = TRIN.l(h) ;
trout1(h,draw)      = TROUT.l(h) ;
trinsh1(h,draw)     = trinsh(h) ;
sav1(h,draw)        = SAV.l(h) ;
exproc1(h,draw)     = EXPROC.l(h) ;
eshare1(g,h,draw)    = eshare(g,h) ;
cmin1(g,h,draw)     = cmin(g,h) ;
troutsh1(h,draw)    = troutsh(h) ;
hfd1(f,h,draw)      = HFD.l(f,h) ;
vfd1(f,v,draw)      = VFD.l(f,v) ;
zfd1(f,draw)        = ZFD.l(f) ;
hms1(g,h,draw)      = HMS.l(g,h) ;
vms1(g,v,draw)      = VMS.l(g,v) ;
zms1(g,draw)        = ZMS.l(g) ;
hfms1(ft,h,draw)    = HFMS.l(ft,h) ;
vfms1(ft,v,draw)    = VFMS.l(ft,v) ;
zfms1(ft,draw)      = ZFMS.l(ft) ;
hfsup1(ft,h,draw)   = HFSUP.l(ft,h) ;

vfmsfix1(ft,v,draw) = vfmsfix_dr(ft,v,draw) ;
zfmsfix1(ft,draw)   = zfmsfix_dr(ft,draw) ;

* more params
tqp1(g,draw)        = sum(h,qp1(g,h,draw)) ;
ttqp1(draw)        = sum(g,tqp1(g,draw)) ;
hqp1(h,draw)        = sum(g, qp1(g,h,draw)) ;



*------------------------------------
* SIMULATION FOR EACH CALIBRATED DRAW
*------------------------------------
$include includes/generic_simulation.gms


* help the program reach a solution by re-initializing pva
PVA.l(g,h) = PH.l(g,h) - sum(gg,idsh(gg,g,h)*PH.l(gg,h))

*solve genCD using mcp ;
*solve genCDnlp using nlp maximizing USELESS ;
ABORT$(genCD.modelstat ne 1) "NO OPTIMAL SOLUTION REACHED" ;

display PV.l, PZ.l, PH.l, PVA.l, QVA.l, FD.l, QP.l, ID.l, QC.l, Y.l, HMS.l, VMS.l, ZMS.l, R.l, WZ.l, HFMS.l, VFMS.l, ZFMS.l, fd.l;
display CPI.l ;

acobb2(g,h,draw)    = acobb(g,h) ;
fshare2(g,f,h,draw) = fshare(g,f,h) ;

pv2(g,v,draw)       = PV.l(g,v) ;
pz2(g,draw)         = PZ.l(g) ;
ph2(g,h,draw)       = PH.l(g,h) ;
qva2(g,h,draw)      = QVA.l(g,h) ;
fd2(g,f,h,draw)     = FD.l(g,f,h) ;
id2(gg,g,h,draw)    = ID.l(gg,g,h) ;
r2(g,fk,h,draw)     = R.l(g,fk,h) ;
wv2(f,v,draw)       = WV.l(f,v) ;
wz2(f,draw)         = WZ.l(f) ;
qp2(g,h,draw)       = QP.l(g,h) ;
tqp2(g,draw)        = sum(h,qp2(g,h,draw)) ;
ttqp2(draw)        = sum(g,tqp2(g,draw)) ;
hqp2(h,draw)        = sum(g, qp2(g,h,draw)) ;

fixfac2(g,fk,h,draw) = fixfac(g,fk,h) ;
pva2(g,h,draw)      = PVA.l(g,h) ;
vash2(g,h,draw)      = vash(g,h) ;
exinc2(h,draw)      = exinc(h) ;
endow2(f,h,draw)    = endow(f,h) ;
y2(h,draw)          = Y.l(h) ;
qc2(g,h,draw)       = QC.l(g,h) ;
cpi2(h,draw)        = CPI.l(h) ;
vqc2(v,g,draw)      = sum(h$maphv(h,v), qc2(g,h,draw));
* village cpi is weighted sum of prices
vcpi2(v,draw)       = sum((h,g)$maphv(h,v), (ph2(g,h,draw)**2)*qc2(g,h,draw)) / sum((h,g)$maphv(h,v),ph2(g,h,draw)*qc2(g,h,draw)) ;
* wieghted capital rent in the village
cri2(v,f,draw)          = sum((g,h)$maphv(h,v), r2(g,f,h,draw)*fd2(g,f,h,draw)/sum((gg,hh)$maphv(hh,v),fd2(gg,f,hh,draw)) ) ;

ry2(h,draw)         = RY.l(h) ;
ty2(draw)           = sum(h,y2(h,draw));
try2(draw)          = sum(h,ry2(h,draw));
trinsh2(h,draw)     = trinsh(h) ;
eshare2(g,h,draw)    = eshare(g,h) ;
troutsh2(h,draw)    = troutsh(h) ;
hfd2(f,h,draw)      = HFD.l(f,h) ;
vfd2(f,v,draw)      = VFD.l(f,v) ;
zfd2(f,draw)        = ZFD.l(f) ;
hms2(g,h,draw)      = HMS.l(g,h) ;
vms2(g,v,draw)      = VMS.l(g,v) ;
zms2(g,draw)        = ZMS.l(g) ;
hfms2(ft,h,draw)    = HFMS.l(ft,h) ;
vfms2(ft,v,draw)    = VFMS.l(ft,v) ;
zfms2(ft,draw)      = ZFMS.l(ft) ;
trin2(h,draw)       = TRIN.l(h) ;
trout2(h,draw)      = TROUT.l(h) ;
sav2(h,draw)        = SAV.l(h) ;
exproc2(h,draw)     = EXPROC.l(h) ;


hfsup2(ft,h,draw)   = HFSUP.l(ft,h) ;


* ================================================================================================
* ===================== LOOP ENDS HERE    ========================================================
* ================================================================================================
);

$exit

* Output : compute all the parameters
$include includes/3_Output_Parameters.gms

* Output : create a formatted text file with a series of "put" statements
$include includes/4_Output_to_text_file.gms
