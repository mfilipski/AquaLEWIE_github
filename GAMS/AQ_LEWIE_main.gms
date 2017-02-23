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
$setglobal data_input "AQ_LEWIE_InputSheet"
* name of index sheet (village-specific):
$setglobal input_sheet_index "Index!A2"
* name of include file containing village-specific assumptions
$setglobal assumptions_file  "2_MarketAssumptions.gms"
* name of output file for text output:
$setglobal output_txt_file "AQ_LEWIE_output"
* name of intermediate SAM output:
$setglobal autosam_file "AutoSAM_aqua.xlsx"
* cell where intermediate SAM has bottom right corner:
$setglobal matcorner "AS45"
* name of excel output automatically populated
$setglobal output_xl_file "AQ_LEWIE_AutoOut.xlsx"




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
set draw /dr0*dr15/ ;


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
$include includes/4b_Calibration.gms




* ================================================================================================
* ================================================================================================
* ===================== STEP 4 - SOLVE THE MODEL IN A LOOP OVER PARAMETERS DRAWS =================
* ======================================== AND SIMULATIONS =======================================
* ================================================================================================

* The zero draw is using the mean values. Starting after dr1, those values are randomely drawn.
loop((draw, sim),
* re-initialise all the variables in the matrix
* but this time not at the I levels - rather, at the _dr levels

pshift(g,h)    = pshift_dr(g,h,draw) ;
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
emin(g,h)      = emin_dr(g,h,draw) ;
QC.l(g,h)      = qc_dr(g,h,draw) ;
eshare(g,h)    = eshare_dr(g,h,draw) ;
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

pshift1(g,h,draw,sim)    = pshift(g,h) ;
fshare1(g,f,h,draw,sim) = fshare(g,f,h) ;

pv1(g,v,draw,sim)       = PV.l(g,v) ;
pz1(g,draw,sim)         = PZ.l(g) ;
ph1(g,h,draw,sim)       = PH.l(g,h) ;
qva1(g,h,draw,sim)      = QVA.l(g,h) ;
fd1(g,f,h,draw,sim)     = FD.l(g,f,h) ;
id1(gg,g,h,draw,sim)    = ID.l(gg,g,h) ;
r1(g,fk,h,draw,sim)     = R.l(g,fk,h) ;
wv1(f,v,draw,sim)       = WV.l(f,v) ;
wz1(f,draw,sim)         = WZ.l(f) ;
qp1(g,h,draw,sim)       = QP.l(g,h) ;
fixfac1(g,fk,h,draw,sim) = fixfac(g,fk,h) ;
pva1(g,h,draw,sim)      = PVA.l(g,h) ;
vash1(g,h,draw,sim)     = vash(g,h) ;
idsh1(g,gg,h,draw,sim)  = idsh(g,gg,h) ;
tidsh1(g,h,draw,sim)    = tidsh(g,h) ;
exinc1(h,draw,sim)      = exinc(h) ;
endow1(f,h,draw,sim)    = endow(f,h) ;
y1(h,draw,sim)          = Y.l(h) ;
qc1(g,h,draw,sim)       = QC.l(g,h) ;
cpi1(h,draw,sim)        = CPI.l(h) ;
vqc1(v,g,draw,sim)      = sum(h$maphv(h,v), qc1(g,h,draw,sim));
* village cpi is weighted sum of prices
vcpi1(v,draw,sim)       = sum((h,g)$maphv(h,v), (ph1(g,h,draw,sim)**2)*qc1(g,h,draw,sim)) / sum((h,g)$maphv(h,v),ph1(g,h,draw,sim)*qc1(g,h,draw,sim)) ;
cri1(v,f,draw,sim)      = sum((g,h)$maphv(h,v), r1(g,f,h,draw,sim)*fd1(g,f,h,draw,sim)/sum((gg,hh)$maphv(hh,v),fd1(gg,f,hh,draw,sim)) ) ;

ry1(h,draw,sim)         = RY.l(h) ;
ty1(draw,sim)           = sum(h,y1(h,draw,sim));
try1(draw,sim)          = sum(h,ry1(h,draw,sim));
trin1(h,draw,sim)       = TRIN.l(h) ;
trout1(h,draw,sim)      = TROUT.l(h) ;
trinsh1(h,draw,sim)     = trinsh(h) ;
sav1(h,draw,sim)        = SAV.l(h) ;
exproc1(h,draw,sim)     = EXPROC.l(h) ;
eshare1(g,h,draw,sim)   = eshare(g,h) ;
emin1(g,h,draw,sim)     = emin(g,h) ;
troutsh1(h,draw,sim)    = troutsh(h) ;
hfd1(f,h,draw,sim)      = HFD.l(f,h) ;
vfd1(f,v,draw,sim)      = VFD.l(f,v) ;
zfd1(f,draw,sim)        = ZFD.l(f) ;
hms1(g,h,draw,sim)      = HMS.l(g,h) ;
vms1(g,v,draw,sim)      = VMS.l(g,v) ;
zms1(g,draw,sim)        = ZMS.l(g) ;
hfms1(ft,h,draw,sim)    = HFMS.l(ft,h) ;
vfms1(ft,v,draw,sim)    = VFMS.l(ft,v) ;
zfms1(ft,draw,sim)      = ZFMS.l(ft) ;
hfsup1(ft,h,draw,sim)   = HFSUP.l(ft,h) ;

vfmsfix1(ft,v,draw,sim) = vfmsfix_dr(ft,v,draw) ;
zfmsfix1(ft,draw,sim)   = zfmsfix_dr(ft,draw) ;

* more params
tqp1(g,draw,sim)        = sum(h,qp1(g,h,draw,sim)) ;
ttqp1(draw,sim)         = sum(g,tqp1(g,draw,sim)) ;
hqp1(h,draw,sim)        = sum(g, qp1(g,h,draw,sim)) ;



*------------------------------------
* SIMULATION FOR EACH CALIBRATED DRAW
*------------------------------------
$include includes/5_generic_simulation.gms



* help the program reach a solution by re-initializing pva
PVA.l(g,h) = PH.l(g,h) - sum(gg,idsh(gg,g,h)*PH.l(gg,h))

*solve genCD using mcp ;
solve genCDnlp using nlp maximizing USELESS ;
ABORT$(genCD.modelstat ne 1) "NO OPTIMAL SOLUTION REACHED" ;
modstat(sim) = genCD.modelstat ;
display PV.l, PZ.l, PH.l, PVA.l, QVA.l, FD.l, QP.l, ID.l, QC.l, Y.l, HMS.l, VMS.l, ZMS.l, R.l, WZ.l, HFMS.l, VFMS.l, ZFMS.l, fd.l;
display CPI.l ;

pshift2(g,h,draw,sim)   = pshift(g,h) ;
fshare2(g,f,h,draw,sim) = fshare(g,f,h) ;

pv2(g,v,draw,sim)       = PV.l(g,v) ;
pz2(g,draw,sim)         = PZ.l(g) ;
ph2(g,h,draw,sim)       = PH.l(g,h) ;
qva2(g,h,draw,sim)      = QVA.l(g,h) ;
fd2(g,f,h,draw,sim)     = FD.l(g,f,h) ;
id2(gg,g,h,draw,sim)    = ID.l(gg,g,h) ;
r2(g,fk,h,draw,sim)     = R.l(g,fk,h) ;
wv2(f,v,draw,sim)       = WV.l(f,v) ;
wz2(f,draw,sim)         = WZ.l(f) ;
qp2(g,h,draw,sim)       = QP.l(g,h) ;
tqp2(g,draw,sim)        = sum(h,qp2(g,h,draw,sim)) ;
ttqp2(draw,sim)         = sum(g,tqp2(g,draw,sim)) ;
hqp2(h,draw,sim)        = sum(g, qp2(g,h,draw,sim)) ;

fixfac2(g,fk,h,draw,sim) = fixfac(g,fk,h) ;
pva2(g,h,draw,sim)      = PVA.l(g,h) ;
vash2(g,h,draw,sim)      = vash(g,h) ;
exinc2(h,draw,sim)      = exinc(h) ;
endow2(f,h,draw,sim)    = endow(f,h) ;
y2(h,draw,sim)          = Y.l(h) ;
qc2(g,h,draw,sim)       = QC.l(g,h) ;
cpi2(h,draw,sim)        = CPI.l(h) ;
vqc2(v,g,draw,sim)      = sum(h$maphv(h,v), qc2(g,h,draw,sim));
* village cpi is weighted sum of prices
vcpi2(v,draw,sim)       = sum((h,g)$maphv(h,v), (ph2(g,h,draw,sim)**2)*qc2(g,h,draw,sim)) / sum((h,g)$maphv(h,v),ph2(g,h,draw,sim)*qc2(g,h,draw,sim)) ;
* weighted capital rent in the village
cri2(v,f,draw,sim)          = sum((g,h)$maphv(h,v), r2(g,f,h,draw,sim)*fd2(g,f,h,draw,sim)/sum((gg,hh)$maphv(hh,v),fd2(gg,f,hh,draw,sim)) ) ;

ry2(h,draw,sim)         = RY.l(h) ;
ty2(draw,sim)           = sum(h,y2(h,draw,sim));
try2(draw,sim)          = sum(h,ry2(h,draw,sim));
trinsh2(h,draw,sim)     = trinsh(h) ;
eshare2(g,h,draw,sim)   = eshare(g,h) ;
emin2(g,h,draw,sim)     = emin(g,h) ;
troutsh2(h,draw,sim)    = troutsh(h) ;
hfd2(f,h,draw,sim)      = HFD.l(f,h) ;
vfd2(f,v,draw,sim)      = VFD.l(f,v) ;
zfd2(f,draw,sim)        = ZFD.l(f) ;
hms2(g,h,draw,sim)      = HMS.l(g,h) ;
vms2(g,v,draw,sim)      = VMS.l(g,v) ;
zms2(g,draw,sim)        = ZMS.l(g) ;
hfms2(ft,h,draw,sim)    = HFMS.l(ft,h) ;
vfms2(ft,v,draw,sim)    = VFMS.l(ft,v) ;
zfms2(ft,draw,sim)      = ZFMS.l(ft) ;
trin2(h,draw,sim)       = TRIN.l(h) ;
trout2(h,draw,sim)      = TROUT.l(h) ;
sav2(h,draw,sim)        = SAV.l(h) ;
exproc2(h,draw,sim)     = EXPROC.l(h) ;
hfsup2(ft,h,draw,sim)   = HFSUP.l(ft,h) ;


* ================================================================================================
* ===================== LOOP ENDS HERE    ========================================================
* ================================================================================================
);

display_pars(1);
display_pars(2);



* Output : compute all the parameters
$include includes/6_Output_Parameters.gms

$include includes/7a_Output_to_excel.gms
$exit



* Output : create a formatted text file with a series of "put" statements
*$include includes/7_Output_to_text_file.gms
