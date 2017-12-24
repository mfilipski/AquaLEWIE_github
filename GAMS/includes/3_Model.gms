* ================================================================================================
* ================================================================================================
* ========================= STEP 2 - WRITE THE CORE MODEL ========================================
* ================================================================================================
* ================================================================================================


* MODEL STARTS HERE
* ======================================================
* Now variables and parameters
* ---------------------------------
nonnegative variables
* production
     QP(g,h)        quantity produced of a good by a household
     FD(g,f,h)      factor demand of f in production of g
     ID(g,gg,h)     intermediate demand for production of g
     QVA(g,h)       quantity of value added created in the production process

     HFD(f,h)       factor demand in the household
     UNEMP(f,h)     unemployment in the household
     HFSUP(f,h)    labor supply from the household (elastic endowment)
     VFD(f,v)       initial factor demand in the village
     ZFD(f)         initial factor demand in the economy

     R(g,f,h)       rent for fixed factors
     WV(f,v)        wage at the village level
     WZ(f)          wage at the zoi level

* consumption
     QC(g,h)        quantity consumed of g by h
     Y(h)           nominal household income
     RY(h)          real household income
     CPI(h)         consumer price index

* values
     PV(g,v)        price of a good at the village level
     PZ(g)          price of a good at the zoi level
     PH(g,h)        price as seen by household h (zoi or village price depending on good)
     PVA(g,h)       price of value added net of intermediate inputs as seen by the household


* transfers
     TRIN(h)        tranfered in - received by a household
     TROUT(h)       transfers out - given by a household
     SAV(h)         household savings
     EXPROC(h)      household expenditures out of the zoi
;

variables
* trade
     HMS(g,h)  household marketed surplus of good g
     VMS(g,v)  village marketed surplus of good g
     ZMS(g)     ZOI marketed surplus of a good

     HFMS(f,h) factor marketed surplus from the household
     VFMS(f,v) factor marketed surplus out of the village
     ZFMS(f)   factor marketed surplus out of the zoi
     USELESS   trick variable to make gams think it's maximising in the nlp
;
USELESS.l = 1 ;

parameters
*Production - Cobb-douglas
     pshift(g,h) production shift parameter for the CD
     fshare(g,f,h) factor share parameter for the CD
     vash(g,h) share of value added
     idsh(g,gfac,h) intermediate input share
     tidsh(g,h) total intermediate input share (1-vash)

*Consumption
     eshare(g,h) expenditure share parameters in the LES
     emin(g,h)  minimal expenditure in the LES
     exinc(h)   exogenous income of household
     vmsfix(g,v) fixed marketed surplus at the village level
     zmsfix(g)  fixed marketed surplus at the zoi level

* factor endowments for fixed factors
     fixfac(g,f,h) fixed factors
     unempsh(f,h)  household's share of total unemployment
     vfmsfix(f,v)  factors fixed at the Village level (family labor)
     zfmsfix(f)    factors fixed at the zoi level (hired labor)
     endow(f,h)    endowment of factors
     hfsupzero(f,h) initial labor supply

* Factor supply
     hfsupel(f,h) factor supply elasticity from household

* Budget for purchased inputs - if we want to have a constraint
     pibudget(g,h) budget available for input purchases
     pibsh(g,h)    share of total pibudget going to good g

* Transfers
     troutsh(h) share of transfers in the households expenditures
     exprocsh(h)  share of expenditures outside of the zoi
     savsh(h)  share of income saved
     trinsh(h) share of total transfers received by a given household

* Experiment (either directly in cash or in kind)
     newremits(h) new remittances received by a new refugee
     infood(h)   transfer received in-kind
     incash(h)   transfer received in cash
     transfer(h) effective value of transfer as perceived by the household
     packsold(g) quantity of in-kind package sold on the market (increase village supply)
     hfsnewref(ft,h) new refugees factor (labor) supply
     wfpcost(h)  cost of the transfer to WFP (cash or kind)
;

Equations
* prices
     EQ_PVA(g,h)         privet value added equation
     EQ_PH(g,h)          market price as seen from household h

* production
     EQ_FDCOBB(g,f,h)    factor demands cobb douglas
     EQ_FDPURCH(g,f,h)   factor demands for purchased inputs - constrained or not
     EQ_QVACOBB(g,h)     quantity VA produced cobb douglas
     EQ_QP(g,h)          quantity produced from QVA and ID
     EQ_ID(gg,g,h)       quantity of g ID needed for QP of gg

* consumption
     EQ_QC(g,h)          quantity consumed

* income
     EQ_Y(h)             full income constraint for the household
     EQ_CPI(h)           consumer price index equation
     EQ_RY(h)            real household income equation

* transfers
     EQ_TRIN(h)          inter household transfers in (received)
     EQ_TROUT(h)         interhousehold transfers out (given)

* exogenous expenditures
     EQ_SAV(h)           savings (exogenous rate)
     EQ_EXPROC(h)        expenditures outside of the zoi (exogenous rate)

* goods market clearing
     EQ_HMKT(g,h)        qty clearing in each household
     EQ_VMKT(g,v)        market clearing in the village
     EQ_ZMKT(g)          market clearing in the zoi
     EQ_VMKTfix(g,v)     price definition in the village
     EQ_ZMKTfix(g)       price definition in the zoi

* factor market clearing
     EQ_HFD(f,h)         total household demand for a given factor
     EQ_FCSTR(g,f,h)     fixed factors constraint
     EQ_HFSUP(f,h)       household elastic supply
     EQ_HFMKT(f,h)       tradable factor clearing in the household
     EQ_VFMKT(f,v)       tradable factors clearing in the village
     EQ_ZFMKT(f)         tradable factor clearing in the zoi
     EQ_VFMKTfix(f,v)    wage determination for tradable factors clearing in the village
     EQ_ZFMKTfix(f)      wage determination for tradable factors clearing in the zoi


* In case of nlp solve
     EQ_USELESS          trick to make gams think it's maximizing something
;

*=============================================================================================
*==================== MODEL STATEMENT ========================================================
*=============================================================================================

* PRICE BLOCK
EQ_PH(g,h)..
     PH(g,h) =E= PZ(g)$(gtz(g)+gtw(g)) + sum(v$maphv(h,v),PV(g,v))$gtv(g) ;

EQ_PVA(g,h)..
     PVA(g,h) =E= PH(g,h)- sum(gfac,idsh(g,gfac,h)*PH(gfac,h)) ;

* PRODUCTION BLOCK
EQ_QVACOBB(g,h)..
     QVA(g,h) =E= pshift(g,h)*prod(f,FD(g,f,h)**(fshare(g,f,h)))
;

EQ_FDCOBB(g,f,h)$((not fpurch(f)))..
     FD(g,f,h)*(R(g,f,h)$fk(f) + WZ(f)$(ftz(f)+ftw(f)) + sum(v$maphv(h,v),WV(f,v))$ftv(f) )
      =E= PVA(g,h)*QP(g,h)*fshare(g,f,h)
;

* If the dummy is 0 the FD of purchased inputs is of the same form as all other factors
* If the dummy is 1 then the FD is limited by the budget constraint
EQ_FDPURCH(g,f,h)$fpurch(f)..
     FD(g,f,h)*(R(g,f,h)$fk(f) + WZ(f)$(ftz(f)+ftw(f)) + sum(v$maphv(h,v),WV(f,v))$ftv(f))
      =E= (PVA(g,h)*QP(g,h)*fshare(g,f,h))$(%budgetconstraint% = 0)
         +(pibudget(g,h))$(%budgetconstraint% = 1)
;


EQ_QP(g,h)$vash(g,h)..
     QP(g,h) =E= QVA(g,h)/vash(g,h) ;

* "g production requires intermediate demand for gfac"
EQ_ID(g,gfac,h)..
     ID(g,gfac,h) =E= QP(g,h)*idsh(g,gfac,h)
;

* CONSUMPTION AND INCOME
EQ_QC(g,h)..
     QC(g,h) =E= eshare(g,h)/PH(g,h)*[(Y(h)-TROUT(h)-SAV(h)-EXPROC(h))-sum(gg, PH(gg,h)*emin(gg,h))] + emin(g,h)
;

* Full income (value of factor endowments)
EQ_Y(h)..
     Y(h) =E= sum((g,fk),R(g,fk,h)*FD(g,fk,h))
            + sum(ftz, WZ(ftz)*HFSUP(ftz,h))
            + sum(ftv, sum(v$maphv(h,v), WV(ftv,v))*HFSUP(ftv,h))
            + sum(ftw, WZ(ftw)*HFSUP(ftw,h))
            + exinc(h)
;

EQ_CPI(h)..
*     CPI(h) =e= sum(g,PH(g,h)*alpha(g,h))
     CPI(h) =e= sum(g,PH(g,h)*[PH(g,h)*QC(g,h)/Y(h)])
                    +1*troutsh(h)+savsh(h)+exprocsh(h) ;
;

EQ_RY(h)..
     RY(h) =e= Y(h) / CPI(h)
;

* Transfers given away - exogenous in this version of the model
EQ_TROUT(h)..
     TROUT(h) =E= troutsh(h)*Y(h) ;
;

EQ_SAV(h)..
     SAV(h) =E= savsh(h)*Y(h) ;
;
EQ_EXPROC(h)..
     EXPROC(h) =E= exprocsh(h)*Y(h) ;
;

* MARKET CLEARING FOR GOODS
EQ_HMKT(g,h)..
     HMS(g,h) =E= QP(g,h)$vash(g,h) - QC(g,h) - sum(gg,ID(gg,g,h)) ;

EQ_VMKT(g,v)..
     VMS(g,v) =E= sum(h$maphv(h,v),HMS(g,h)) + packsold(g) ;
;

EQ_ZMKT(g)..
     ZMS(g) =E= sum(v, VMS(g,v))
;

EQ_VMKTfix(gtv,v)..
     VMS(gtv,v) =E= vmsfix(gtv,v)
;

EQ_ZMKTfix(gtz)..
     ZMS(gtz) =E= zmsfix(gtz)
;

* FACTOR MARKET CLEARING
EQ_HFD(f,h)..
     HFD(f,h) =e= sum(g, FD(g,f,h))
;

EQ_FCSTR(g,fk,h)..
     FD(g,fk,h) =E= fixfac(g,fk,h)
;

EQ_HFMKT(ft,h)..
     HFMS(ft,h) =E= HFSUP(ft,h) - sum(g, FD(g,ft,h))
;

EQ_HFSUP(ft,h)..
     HFSUP(ft,h)$(not hfsupzero(ft,h))
     +
* Choose v1 or v2
*     (HFSUP(ft,h)/(hfsupzero(ft,h)) - hfsnewref(ft,h)/(hfsupzero(ft,h)) - [sum(v$maphv(h,v),WV(ft,v)**hfsupel(ft,h))$ftv(ft)
     (HFSUP(ft,h)/(hfsupzero(ft,h)+hfsnewref(ft,h))  - [sum(v$maphv(h,v),WV(ft,v)**hfsupel(ft,h))$ftv(ft)
                                    + (WZ(ft)**hfsupel(ft,h))$(ftz(ft)+ftw(ft))] )$hfsupzero(ft,h)
     =e= 0
;

EQ_VFMKT(ft,v)..
     VFMS(ft,v) =E= sum(h$maphv(h,v), HFMS(ft,h))
;

EQ_ZFMKT(ft)..
     sum(v, VFMS(ft,v)) =E= ZFMS(ft)
;

* FACTOR WAGE DETERMINATION
EQ_VFMKTFIX(ftv,v)..
     VFMS(ftv,v) =E= vfmsfix(ftv,v)
;

EQ_ZFMKTFIX(ftz)..
     ZFMS(ftz) =E= zfmsfix(ftz)
;

* In case of NLP solve:
EQ_USELESS..
     USELESS =e= 1 ;



*-------------------------------------------------------------------------------------------------
*--------------------------------------- ALTERNATIVE MODELS --------------------------------------
*-------------------------------------------------------------------------------------------------

model genCD Model with Cobb Douglas production /
EQ_PVA.PVA
EQ_PH.PH
EQ_QVACOBB.QVA
EQ_FDCOBB.FD
EQ_FDPURCH.FD
EQ_QP.QP
EQ_ID.ID
EQ_QC.QC
EQ_Y.Y
EQ_HMKT.HMS
EQ_VMKT.VMS
EQ_ZMKT.ZMS
EQ_VMKTfix.PV
EQ_ZMKTfix.PZ
EQ_HFD.HFD
EQ_FCSTR.R
EQ_HFMKT.HFMS
EQ_VFMKT.VFMS
EQ_ZFMKT.ZFMS
EQ_VFMKTfix.WV
EQ_ZFMKTfix.WZ
EQ_TROUT.TROUT
EQ_SAV.SAV
EQ_EXPROC.EXPROC

* elastic factor supply from the household
EQ_HFSUP.HFSUP
EQ_CPI.CPI
EQ_RY.RY
/;


model genCDnlp Model with Cobb Douglas production /
EQ_PVA
EQ_PH
EQ_QVACOBB
EQ_FDCOBB
EQ_FDPURCH
EQ_QP
EQ_ID
EQ_QC
EQ_Y
EQ_HMKT
EQ_VMKT
EQ_ZMKT
EQ_VMKTfix
EQ_ZMKTfix
EQ_HFD
EQ_FCSTR
EQ_HFMKT
EQ_VFMKT
EQ_ZFMKT
EQ_VFMKTfix
EQ_ZFMKTfix
EQ_TROUT
EQ_SAV
EQ_EXPROC
* elastic factor supply from the household
EQ_HFSUP
EQ_USELESS
EQ_CPI
EQ_RY
/;

