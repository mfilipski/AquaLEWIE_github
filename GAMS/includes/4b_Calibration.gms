
* ================================================================================================
* ================================================================================================
* ====================== STEP 3 - CALIBRATE THE MODEL  ===========================================
* ================================================================================================
* ================================================================================================

parameter
* meta-parameters with parameter draws
shcobb_t(g,f,h,draw)  unscaled draw the cobb-douglas prod shares
alpha_t(g,h,draw)     unscaled draw of consumption shares
pv_dr(g,v,draw)       drawn or computed from draw price at village level
pz_dr(g,draw)         drawn or computed from draw price at zoi level
ph_dr(g,h,draw)       drawn or computed from draw price as seen from household
pva_dr(g,h,draw)      drawn or computed from draw price of value added
qva_dr(g,h,draw)      drawn or computed from draw quantity of value added
qp_dr(g,h,draw)       drawn or computed from draw quantity produced
tqp_dr(g,draw)        drawn or computed total qty produced in the zoi
ttqp_dr(draw)         drawn or computed total output of the zoi
fd_dr(g,f,h,draw)     drawn or computed from draw factor demand
id_dr(g,gg,h,draw)    drawn or computed from draw intermediate demand
acobb_dr(g,h,draw)    drawn or computed from draw cobb-douglas shifter
shcobb_dr(g,f,h,draw) drawn or computed from draw cobb-douglas shares
r_dr(g,f,h,draw)      drawn or computed from draw rent for fixed factors
wv_dr(f,v,draw)       drawn or computed from draw village-wide wage for tradable factors
wz_dr(f,draw)         drawn or computed from draw zoi-wide wage for tradable factors
vash_dr(g,h,draw)     drawn or computed from draw value-added share
idsh_dr(gg,g,h,draw)  drawn or computed from draw intermediate demand share
tidsh_dr(gg,h,draw)   drawn or computed from draw total intermediate input share (1-vash)
fixfac_dr(g,f,h,draw) drawn or computed from draw fixed factor demand
unemp_dr(f,h,draw)    drawn or computed from draw unemployment
unempsh_dr(f,h,draw)  drawn or computed from draw hh share of total unemployment
vfmsfix_dr(f,v,draw)  drawn or computed from draw factors fixed at the Village level
zfmsfix_dr(f,draw)    drawn or computed from draw factors fixed at the zoi level
vmsfix_dr(g,v,draw)   drawn or computed from draw goods fixed at the Village level
zmsfix_dr(g,draw)     drawn or computed from draw goods fixed at the zoi level

exinc_dr(h,draw)      drawn or computed from draw exogenous income
endow_dr(f,h,draw)    drawn or computed from draw endowment
qc_dr(g,h,draw)       drawn or computed from draw level of consumption
tqc_dr(g,draw)        drawn or computed from draw total qc
alpha_dr(g,h,draw)    drawn or computed from draw consumption shares
y_dr(h,draw)          drawn or computed from draw nominal hh income
cpi_dr(h,draw)        drawn or computed from draw consumer price index of hh
ry_dr(h,draw)         drawn or computed from draw real hh income
cmin_dr(g,h,draw)     drawn or computed from draw incompressible demand
trin_dr(h,draw)       drawn or computed from draw transfers in - received
trout_dr(h,draw)      drawn or computed from draw transfers out - given
trinsh_dr(h,draw)     drawn or computed from draw share of all transfers in the eco going to h
troutsh_dr(h,draw)    drawn or computed from draw share of yousehold h's income being given as transfers
hfd_dr(f,h,draw)      drawn or computed from draw factor demand of household h for factor f
vfd_dr(f,v,draw)      drawn or computed from draw village demand for factor f
zfd_dr(f,draw)        drawn or computed from draw zoi demand for factor f
hms_dr(g,h,draw)      drawn or computed from draw household marketed surplus of good g
vms_dr(g,v,draw)      drawn or computed from draw village marketed surplus of good g
zms_dr(g,draw)        drawn or computed from draw household marketed surplus of good g
hfms_dr(f,h,draw)     drawn or computed from draw household factor marketed surplus
vfms_dr(f,v,draw)     drawn or computed from draw village factor marketed surplus
zfms_dr(f,draw)       drawn or computed from draw zoi factor marketed surplus

savsh_dr(h,draw)      drawn or computed savings rate
sav_dr(h,draw)        drawn or computed savings level
exprocsh_dr(h,draw)   drawn or computed outside-of-zoi expenditures rate
exproc_dr(h,draw)     drawn or computed outside-of-zoi expenditures level
expzoish_dr(h,draw)   drawn or computed outside-of-zoi expenditures level


* calibration values in each draw
*pm1(g,draw)         calibrated market price
pv1(g,v,draw)       calibrated price at village level
pz1(g,draw)         calibrated price at zoi level
ph1(g,h,draw)       calibrated price as seen by household
pva1(g,h,draw)      calibrated price of value added
qva1(g,h,draw)      calibrated quantity of value added
qp1(g,h,draw)       calibrated quantity produced
tqp1(g,draw)        calibrated total quantity produced
ttqp1(draw)
hqp1(h,draw)         calibrated total qty produced by a household
fd1(g,f,h,draw)     calibrated factor demand
id1(g,gg,h,draw)    calibrated intermediate demand
acobb1(g,h,draw)    calibrated cobb-douglas shifter
shcobb1(g,f,h,draw) calibrated cobb-douglas shares
r1(g,f,h,draw)      calibrated rent for fixed factors
wv1(f,v,draw)       calibrated village-wide wage for tradable factors
wz1(f,draw)         calibrated zoi-wide wage for tradable factors
vash1(g,h,draw)     calibrated value-added share
idsh1(gg,g,h,draw)  calibrated intermediate demand share
tidsh1(gg,h,draw)   calibrated total intermediate input share (1-vash)
fixfac1(g,f,h,draw) calibrated fixed factor demand
exinc1(h,draw)      calibrated exogenous income
endow1(f,h,draw)    calibrated endowment
qc1(g,h,draw)       calibrated level of consumption
alpha1(g,h,draw)    calibrated consumption shares
y1(h,draw)          calibrated income of household
cpi1(h,draw)        calibrated cpi
vqc1(v,g,draw)      calibrated village consumption
vcpi1(v,draw)       calibrated village cpi
cri1(v,f,draw)        calibrated rent weighted index

ry1(h,draw)         calibrated real income
ty1(draw)           calibrated income total
try1(draw)          calibrated real income total
cmin1(g,h,draw)     calibrated incompressible demand
trin1(h,draw)       calibrated transfers in - received
trout1(h,draw)      calibrated transfers out - given
sav1(h,draw)        calibrated savings
exproc1(h,draw)     calibrated expenditure rest of country
trinsh1(h,draw)     calibrated share of all transfers in the eco going to h
troutsh1(h,draw)    calibrated share of yousehold h's income being given as transfers
hfd1(f,h,draw)      calibrated factor demand of household h for factor f
vfd1(f,v,draw)      calibrated village demand for factor f
zfd1(f,draw)        calibrated zoi demand for factor f
hms1(g,h,draw)      calibrated household marketed surplus of good g
vms1(g,v,draw)      calibrated village marketed surplus of good g
zms1(g,draw)        calibrated household marketed surplus of good g
*unemp1(f,h,draw)    calibrated unemployement in the household
hfms1(f,h,draw)     calibrated household factor marketed surplus
vfms1(f,v,draw)     calibrated village factor marketed surplus
zfms1(f,draw)       calibrated zoi factor marketed surplus
vfmsfix1(f,v,draw)    calibrated factors fixed at the Village level (family labor)
zfmsfix1(f,draw)      calibrated factors fixed at the zoi level (hired labor)
hfsup1(f,h,draw)    calibrated factor supply by the household


* after a simulation for each draw
*pm2(g,draw)         simulated market price
pv2(g,v,draw)       simulated price at village level
pz2(g,draw)         simulated price at zoi level
ph2(g,h,draw)       simulated price as seen by household
pva2(g,h,draw)      simulated price of value added
qva2(g,h,draw)      simulated quantity of value added
qp2(g,h,draw)       simulated quantity produced
tqp2(g,draw)        simulated total quantity produced in the economy
ttqp2(draw)
hqp2(h,draw)         sim total qty produced by a household
fd2(g,f,h,draw)     simulated factor demand
id2(g,gg,h,draw)    simulated intermediate demand
acobb2(g,h,draw)    simulated cobb-douglas shifter
shcobb2(g,f,h,draw) simulated cobb-douglas shares
r2(g,f,h,draw)      simulated rent for fixed factors
wv2(f,v,draw)       simulated village-wide wage for tradable factors
wz2(f,draw)         simulated zoi-wide wage for tradable factors
vash2(g,h,draw)     simulated value-added share
idsh2(gg,g,h,draw)  simulated intermediate demand share
tidsh2(gg,h,draw)   simulated total intermediate input share (2-vash)
fixfac2(g,f,h,draw) simulated fixed factor demand
exinc2(h,draw)      simulated exogenous income
endow2(f,h,draw)    simulated endowment
qc2(g,h,draw)       simulated level of consumption
alpha2(g,h,draw)    simulated consumption shares
y2(h,draw)          simulated income of household
cpi2(h,draw)        simulated cpi
cri2(v,f,draw)          simulated capital rent index (cap rent in activity*weight of activity)
vqc2(v,g,draw)      simulated village consumption
vcpi2(v,draw)       simulated village cpi


ry2(h,draw)         simulated real income
ty2(draw)           simulated income total
try2(draw)          simulated real income total
cmin2(g,h,draw)     simulated incompressible demand
trin2(h,draw)       simulated transfers in - received
trout2(h,draw)      simulated transfers out - given
sav2(h,draw)        simulated savings
exproc2(h,draw)     simulated expenditure rest of country
trinsh2(h,draw)     simulated share of all transfers in the eco going to h
troutsh2(h,draw)    simulated share of yousehold h's income being given as transfers
hfd2(f,h,draw)      simulated factor demand of household h for factor f
vfd2(f,v,draw)      simulated village demand for factor f
zfd2(f,draw)        simulated zoi demand for factor f
hms2(g,h,draw)      simulated household marketed surplus of good g
vms2(g,v,draw)      simulated village marketed surplus of good g
zms2(g,draw)        simulated household marketed surplus of good g
*unemp2(f,h,draw)    calibrated unemployement in the households
hfms2(f,h,draw)     simulated household factor marketed surplus
vfms2(f,v,draw)     simulated village factor marketed surplus
zfms2(f,draw)       simulated zoi factor marketed surplus
hfsup2(f,h,draw)    simulated factor supply by the household

* delta calibration /simulation
pvD(g,v,draw)       delta price at village level
pzD(g,draw)         delta price at zoi level
phD(g,h,draw)       delta price as seen by household

pvaD(g,h,draw)      delta price of value added
qvaD(g,h,draw)      delta quantity of value added
qpD(g,h,draw)       delta quantity produced
tqpD(g,draw)        delta total qp
ttqpD(draw)
hqpD(h,draw)          delta hqp
fdD(g,f,h,draw)     delta factor demand
idD(g,gg,h,draw)    delta intermediate demand
acobbD(g,h,draw)    delta cobb-douglas shifter
shcobbD(g,f,h,draw) delta cobb-douglas shares
rD(g,f,h,draw)      delta rent for fixed factors
wvD(f,v,draw)       delta village-wide wage for tradable factors
wzD(f,draw)         delta zoi-wide wage for tradable factors
vashD(g,h,draw)     delta value-added share
idshD(gg,g,h,draw)  delta intermediate demand share
tidshD(gg,h,draw)   delta total intermediate input share (1-vash)
fixfacD(g,f,h,draw) delta fixed factor demand
exincD(h,draw)      delta exogenous income
endowD(f,h,draw)    delta endowment
qcD(g,h,draw)       delta level of consumption
alphaD(g,h,draw)    delta consumption shares
yD(h,draw)          delta income of household
cpiD(h,draw)        delta cpi
criD(v,f,draw)        delta capital rent index (cap rent in activity*weight of activity)
vqcD(v,g,draw)      delta village consumption
vcpiD(v,draw)       delta village cpi

ryD(h,draw)         delta real income
tyD(draw)           delta income total
tryD(draw)          delta real income total
cminD(g,h,draw)     delta incompressible demand
trinD(h,draw)       delta transfers in - received
troutD(h,draw)      delta transfers out - given
savD(h,draw)        delta savings
exprocD(h,draw)     delta expenditure rest of country
trinshD(h,draw)     delta share of all transfers in the eco going to h
troutshD(h,draw)    delta share of yousehold h's income being given as transfers
hfdD(f,h,draw)      delta factor demand of household h for factor f
vfdD(f,v,draw)      delta village demand for factor f
zfdD(f,draw)        delta zoi demand for factor f
hmsD(g,h,draw)      delta household marketed surplus of good g
vmsD(g,v,draw)      delta village marketed surplus of good g
zmsD(g,draw)        delta household marketed surplus of good g
hfmsD(f,h,draw)     delta household factor marketed surplus
vfmsD(f,v,draw)     delta village factor marketed surplus
zfmsD(f,draw)       delta zoi factor marketed surplus
hfsupD(f,h,draw)    delta factor supply by the household

* percent change calibration/simulation
pvPC(g,v,draw)        % change price at village level
pzPC(g,draw)          % chage price at zoi level
phPC(g,h,draw)        % change price as seen by household

pvaPC(g,h,draw)      % change price of value added
qvaPC(g,h,draw)      % change quantity of value added
qpPC(g,h,draw)       % change quantity produced
tqpPC(g,draw)        % change in total qp
ttqpPC(draw)
hqpPC(h,draw)          % change in hqp

fdPC(g,f,h,draw)     % change factor demand
idPC(g,gg,h,draw)    % change intermediate demand
acobbPC(g,h,draw)    % change cobb-douglas shifter
shcobbPC(g,f,h,draw) % change cobb-douglas shares
rPC(g,f,h,draw)      % change rent for fixed factors
wvPC(f,v,draw)       % change village-wide wage for tradable factors
wzPC(f,draw)         % change zoi-wide wage for tradable factors
vashPC(g,h,draw)     % change value-added share
idshPC(gg,g,h,draw)  % change intermediate demand share
tidshPC(gg,h,draw)   % change total intermediate input share (1-vash)
fixfacPC(g,f,h,draw) % change fixed factor demand
exincPC(h,draw)      % change exogenous income
endowPC(f,h,draw)    % change endowment
qcPC(g,h,draw)       % change level of consumption
alphaPC(g,h,draw)    % change consumption shares
yPC(h,draw)          % change income of household
cpiPC(h,draw)        % change in cpi
criPC(v,f,draw)        % change capital rent index (cap rent in activity*weight of activity)
vqcPC(v,g,draw)      % change village consumption
vcpiPC(v,draw)       % change village cpi


ryPC(h,draw)         % change in real income
tyPC(draw)           % change income total
tryPC(draw)          % change real income total
cminPC(g,h,draw)     % change incompressible demand
trinPC(h,draw)       % change transfers in - received
troutPC(h,draw)      % change transfers out - given
savPC(h,draw)        % change savings
exprocPC(h,draw)     % change expenditure rest of country
trinshPC(h,draw)     % change share of all transfers in the eco going to h
troutshPC(h,draw)    % change share of yousehold h's income being given as transfers
hfdPC(f,h,draw)      % change factor demand of household h for factor f
vfdPC(f,v,draw)      % change village demand for factor f
zfdPC(f,draw)        % change zoi demand for factor f
hmsPC(g,h,draw)      % change household marketed surplus of good g
vmsPC(g,v,draw)      % change village marketed surplus of good g
zmsPC(g,draw)        % change household marketed surplus of good g
hfmsPC(f,h,draw)     % change household factor marketed surplus
vfmsPC(f,v,draw)     % change village factor marketed surplus
zfmsPC(f,draw)       % change zoi factor marketed surplus
hfsupPC(f,h,draw)    % change factor supply by the household
;




* PARAMETERS THAT ARE DRAWN
* =================================================================================
* default at initial values
shcobb_t(g,f,h,draw) = xlbeta(g,f,h);
acobb_dr(g,h,draw)   = xlacobb(g,h) ;
alpha_t(g,h,draw)    = xlalpha(g,h) ;
troutsh_dr(h,draw)   = xltroutsh(h) ;
savsh_dr(h,draw)     = xlSAVinfsh(h) + xlSAVformsh(h) ;
exprocsh_dr(h,draw)  = xlexpoutsh(h) ;

* draw all values once - except for dr0 wich will be the xl base
shcobb_t(g,f,h,"dr0") = xlbeta(g,f,h);
alpha_t(g,h,"dr0")    = xlalpha(g,h) ;
troutsh_dr(h,"dr0")   = xltroutsh(h) ;
savsh_dr(h,"dr0")     = xlSAVinfsh(h) + xlSAVformsh(h) ;
exprocsh_dr(h,"dr0")  = xlexpoutsh(h) ;

shcobb_t(g,f,h,draw)$(not sameas(draw,"dr0")) = normal(xlbeta(g,f,h),xlbetase(g,f,h));
alpha_t(g,h,draw)$(not sameas(draw,"dr0"))    = normal(xlalpha(g,h),xlalphase(g,h));
troutsh_dr(h,draw)$(not sameas(draw,"dr0"))   = normal(xltroutsh(h),xltroutshse(h));
savsh_dr(h,draw)$(not sameas(draw,"dr0"))     = normal(xlSAVinfsh(h),xlSAVinfshse(h))
                                              + normal(xlSAVformsh(h),xlSAVformshse(h));

display shcobb_t, alpha_t, troutsh_dr, savsh_dr, exprocsh_dr;

* ### DATA CHECKPOINT: avoid negative values
* correct the factor shares that were drawn negative
* -------------------------------------------------------------

* just for info, display the negatives:
parameter negshcobb_t(g,f,h,draw) ;
negshcobb_t(g,f,h,draw)$((shcobb_t(g,f,h,draw) le 0) or (shcobb_t(g,f,h,draw) ge 1)) = shcobb_t(g,f,h,draw);
display negshcobb_t;
* and correct with a while structure
loop((g,f,h,draw)$(xlFD(g,f,h)*((shcobb_t(g,f,h,draw) le 0) or (shcobb_t(g,f,h,draw) ge 1))),
     while((shcobb_t(g,f,h,draw) le 0) or (shcobb_t(g,f,h,draw) ge 1),
            shcobb_t(g,f,h,draw) = normal(xlbeta(g,f,h),xlbetase(g,f,h));
     );
);
display shcobb_t;
* finally, we can use that as our parameter draw:
shcobb_dr(g,f,h,draw)$shcobb_t(g,f,h,draw) = shcobb_t(g,f,h,draw)/sum(fa,shcobb_t(g,fa,h,draw)) ;
display shcobb_t, shcobb_dr ;


* now correct the expenditure shares that were drawn negative
* ------------------------------------------------------------
* just for info, display the negatives
parameter negalpha_t(g,h,draw) ;
negalpha_t(g,h,draw)$((alpha_t(g,h,draw) le 0) or (alpha_t(g,h,draw) ge 1)) = alpha_t(g,h,draw) ;
display negalpha_t;
* and correct with a while
loop((g,h,draw)$(xlalpha(g,h)*((alpha_t(g,h,draw) le 0) or (alpha_t(g,h,draw) ge 1))) ,
     while( (alpha_t(g,h,draw) le 0) or (alpha_t(g,h,draw) ge 1),
           alpha_t(g,h,draw) = normal(xlalpha(g,h),xlalphase(g,h));
     );
);
display alpha_t;
* finally we can use that as our parameter draw
alpha_dr(g,h,draw)  = alpha_t(g,h,draw)/sum(gg,alpha_t(gg,h,draw)) ;
parameter alch(h,draw) ;
alch(h,draw) = sum(gg,alpha_dr(gg,h,draw))
display alpha_dr, alch ;

* now correct the rest-of world expenditure shares.  They cannot be negative, and they cannot add up to more than 1
* (really, maybe they shouldn't add up to more than 0.3 or something)

*now correct the exogenous expenditures that were drawn negative OR that add up to a larger number than 1 ;
* so we make a loop in the loop:
expzoish_dr(h,draw) = 1-(troutsh_dr(h,draw)+savsh_dr(h,draw)+exprocsh_dr(h,draw)) ;

display troutsh_dr, savsh_dr, exprocsh_dr, expzoish_dr ;
* TROUTSHARE NEEDS TO BE RESCALED TO A 0<X<1 NUMBER
loop((h,draw),
     while( ((troutsh_dr(h,draw) le 0) or (troutsh_dr(h,draw) ge 1))
            or ((savsh_dr(h,draw) le 0) or (savsh_dr(h,draw) ge 1))
            or (expzoish_dr(h,draw) le 0),
               troutsh_dr(h,draw)$(not sameas(draw,"dr0")) = normal(xltroutsh(h),xltroutshse(h));
               savsh_dr(h,draw)$(not sameas(draw,"dr0")) = normal(xlSAVinfsh(h),xlSAVinfshse(h))
                                        + normal(xlSAVformsh(h),xlSAVformshse(h));
               expzoish_dr(h,draw) = 1-(troutsh_dr(h,draw)+savsh_dr(h,draw)+exprocsh_dr(h,draw)) ;
     );
);
display troutsh_dr, savsh_dr, exprocsh_dr, expzoish_dr;


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
qc_dr(g,h,draw) = (y_dr(h,draw)-sav_dr(h,draw)-trout_dr(h,draw)-exproc_dr(h,draw))*alpha_dr(g,h,draw)/ph_dr(g,h,draw) ;

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
display qp_dr, id_dr, shcobb_dr ;

* We can figure out the rest from there:
* Factor demands derived from factor shares
fd_dr(g,f,h,draw)  = (qp_dr(g,h,draw) - sum(gg,id_dr(gg,g,h,draw))) * shcobb_dr(g,f,h,draw)  ;
display fd_dr ;
qva_dr(g,h,draw)   = sum(f, fd_dr(g,f,h,draw)) ;
acobb_dr(g,h,draw)$(qva_dr(g,h,draw))    = qva_dr(g,h,draw)/prod(f,fd_dr(g,f,h,draw)**shcobb_dr(g,f,h,draw)) ;

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

display acobb_dr, shcobb_dr, pv_dr, pz_dr, ph_dr, pva_dr, qva_dr, fd_dr, id_dr, r_dr, wz_dr, qp_dr, fixfac_dr, pva_dr,
        exinc_dr, endow_dr, y_dr, trinsh_dr, qc_dr, alpha_dr, troutsh_dr, hfd_dr, vfd_dr, zfd_dr,
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

